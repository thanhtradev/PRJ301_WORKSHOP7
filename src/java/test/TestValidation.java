package test;

import util.Validation;

public class TestValidation {
    public static void main(String[] args) {
        String sampleEmail = "thanhtra2001.stt@gmail.com";
        String samplePassword = "123456ada2@";
        String sampleFullname = "Su Thanh Tra";
        String samplePhoneNumber = "0290912901";
        System.out.println("Validate email(" + sampleEmail + "): " + Validation.emailValidate(sampleEmail));
        System.out.println("Validate password(" + samplePassword + "): " + Validation.passwordValidate(samplePassword));
        System.out
                .println("Validate full name(" + sampleFullname + "): " + Validation.fullnameValidate(sampleFullname));
        System.out.println("Validate phone number(" + samplePhoneNumber + "): "
                + Validation.phoneNumberValidate(samplePhoneNumber));

    }
}
