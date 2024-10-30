package salessync.core;

import java.time.LocalDateTime;
import java.util.UUID;

public class User {

    private UUID userId;
    private String login, password;
    private LocalDateTime lastLogin;
    private Position position;

    public User(String login, String password) {
        this.userId = UUID.randomUUID();
        this.login = login;
        this.password = password;
        this.position = new Position();
    }

    public UUID getUserId() {
        return userId;
    }

    public void setUserId(UUID userId) {
        this.userId = userId;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public LocalDateTime getLastLogin() {
        return lastLogin;
    }

    public void setLastLogin(LocalDateTime lastLogin) {
        this.lastLogin = lastLogin;
    }

    public void setPosition(String positionType) {        
        position.chooseUserPosition(positionType);
    }
}
