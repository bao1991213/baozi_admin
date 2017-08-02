package com.baozi.admin.modules.sys.web;
import java.security.interfaces.RSAPublicKey;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.baozi.admin.modules.sys.service.RSAService;
import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class PkeyController {

    @Resource(name = "rsaService")
    private RSAService rsaService;

    @RequestMapping(value = "pkey", method = {RequestMethod.GET})
    @ResponseBody
    public Map<String, String> publicKey(HttpServletRequest request) {
        RSAPublicKey rsaPublicKey = this.rsaService.generateKey(request);
        Map<String, String> ex = new HashMap<String, String>();
        ex.put("modulus", Base64.encodeBase64String(rsaPublicKey.getModulus()
                .toByteArray()));
        ex.put("exponent", Base64.encodeBase64String(rsaPublicKey
                .getPublicExponent().toByteArray()));
        return ex;
    }
}