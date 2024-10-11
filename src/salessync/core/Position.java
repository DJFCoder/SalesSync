package salessync.core;

import java.util.UUID;

public class Position {

    public static final String ADMIN = "admin";
    public static final String OWNER = "owner";
    public static final String SELLER = "seller";
    public static final String STOCK_MANAGER = "stockManager";

    private UUID positionId;
    private String type;

    public Position(String type) {
        this.positionId = UUID.randomUUID();
        this.type = type;
    }
}