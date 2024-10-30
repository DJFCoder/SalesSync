package salessync.core;

import java.util.UUID;

public class Position {

    public static final String ADMIN = "admin";
    public static final String OWNER = "owner";
    public static final String SELLER = "seller";
    public static final String STOCK_MANAGER = "stockManager";

    private UUID positionId;
    private String type;

    public Position() {
        this.positionId = UUID.randomUUID();
    }

    public UUID getPositionId() {
        return positionId;
    }

    public void setPositionId(UUID positionId) {
        this.positionId = positionId;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
    
    public void chooseUserPosition(String positionType){
        setType(positionType);
        if (positionType.equals("admin".toUpperCase())){
            System.out.println("esse usuário é o admnistrador.");
        }
    }
}
