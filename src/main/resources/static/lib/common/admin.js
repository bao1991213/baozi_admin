$.ajaxSetup({
    complete: function (XMLHttpRequest, textStatus) {
        if (XMLHttpRequest.status == "401") {
            window.location.reload();
        }
    }
});