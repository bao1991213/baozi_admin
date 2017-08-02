var Login = function () {
    return {
        //main function to initiate the module
        init: function () {
            $("#loginForm").validate({
                rules: {
                    username: {required:true},
                    password: {required:true}
                },
                messages: {
                    username: {required: "请填写用户名."},
                    password: {required: "请填写密码."},
                    validateCode: {remote: "验证码不正确.", required: "请填写验证码."}
                },
                submitHandler: function (form) {
                    $.ajax({
                        url: "pkey?_t=" + Math.random(),
                        success: function (rs) {
                            var rsaKey = new RSAKey();
                            rsaKey.setPublic(b64tohex(rs.modulus), b64tohex(rs.exponent));
                            var encryPasswd = hex2b64(rsaKey.encrypt($('#password').val()));
                            $('#password').val(encryPasswd);
                            form.submit();
                        }
                    });
                    return false;
                }
            });
        }
    };
}();