/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.security.SecureRandom;
import java.util.Base64;

/**
 *
 * @author thanhtra
 */
public class TokenGenerator {
    private static final SecureRandom secureRandom = new SecureRandom(); //  
    private static final Base64.Encoder base64Encoder = Base64.getUrlEncoder(); // 

    public static String generateNewToken() {
        byte[] randomBytes = new byte[36];
        secureRandom.nextBytes(randomBytes);
        return base64Encoder.encodeToString(randomBytes);
    }
    // public static void main(String[] args) {
    //     System.out.println(generateNewToken());
    // }
}
