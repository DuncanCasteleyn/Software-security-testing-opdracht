package be.ap.security.data;

import be.ap.security.entities.WebsiteUser;

import javax.servlet.http.Cookie;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;

public class WebsiteUsers {
    private static final HashSet<WebsiteUser> websiteUsers;
    private static final HashMap<String, WebsiteUser> sessions;

    static {
        websiteUsers = new HashSet<>(Collections.singleton(new WebsiteUser("root", "root")));
        sessions = new HashMap<>();
    }

    public static WebsiteUser getWebsiteUser(String username) {
        return websiteUsers.stream().filter(websiteUser -> websiteUser.getUsername().equals(username)).findFirst().orElse(null);
    }

    public static WebsiteUser getSession(Cookie[] cookies) {
        if (cookies == null) {
            throw new IllegalArgumentException("Cookies can't be null");
        }
        Cookie loggedInAs = Arrays.stream(cookies).filter(cookie -> cookie.getName().equals("loggedInAs")).findFirst().orElse(null);
        if (loggedInAs != null) {
            return sessions.get(loggedInAs.getValue());
        }
        return null;
    }

    public static void addSessionCookie(String uuid, WebsiteUser websiteUser) {
        sessions.put(uuid, websiteUser);
    }
}