package com.baozi.admin.modules.sys.service;

import com.baozi.admin.common.utils.RSAUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.security.KeyPair;
import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;

/**
 * Created by baozi on 2017/6/12.
 */
@Service("rsaService")
public class RSAService {

    private static final String sessionKey = "adminPrivateKey";

    public RSAPublicKey generateKey(HttpServletRequest httpServletReq) {
        KeyPair keyPair = RSAUtils.generateKeyPair();
        RSAPublicKey rsaPublicKey = (RSAPublicKey) keyPair.getPublic();
        RSAPrivateKey rsaPrivateKey = (RSAPrivateKey) keyPair.getPrivate();
        HttpSession httpSession = httpServletReq.getSession();
        httpSession.setAttribute(sessionKey, rsaPrivateKey);
        return rsaPublicKey;
    }

    public void removePrivateKey(HttpServletRequest httpServletReq) {
        HttpSession httpSession = httpServletReq.getSession();
        httpSession.removeAttribute(sessionKey);
    }

    public String decryptParam(String name, HttpServletRequest httpServletReq) {
        if (name != null) {
            HttpSession httpSession = httpServletReq.getSession();
            RSAPrivateKey rsaPrivateKey = (RSAPrivateKey) httpSession
                    .getAttribute(sessionKey);
            String str = httpServletReq.getParameter(name);
            if (rsaPrivateKey != null && StringUtils.isNotEmpty(str)) {
                return RSAUtils.decrypt(rsaPrivateKey, str);
            }
        }
        return null;
    }
}