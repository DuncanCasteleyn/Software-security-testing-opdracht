package be.ap.security.entities;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;

public class WebsiteUser {
    private String username;
    private byte[] password;

    public WebsiteUser(String username, String password) {
        this.username = username;
        MessageDigest messageDigest;
        try {
            messageDigest = MessageDigest.getInstance("SHA-256");
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
        this.password = messageDigest.digest(password.getBytes(StandardCharsets.UTF_8));
    }

    public boolean logIn(String password) {
        MessageDigest messageDigest;
        try {
            messageDigest = MessageDigest.getInstance("SHA-256");
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
        byte[] logInPassword = messageDigest.digest(password.getBytes(StandardCharsets.UTF_8));
        return Arrays.equals(this.password, logInPassword);
    }

    public String getUsername() {
        return username;
    }
}
