package salessync.salesmanagement;

import java.time.LocalDateTime;
import java.util.UUID;

public class Payment {
    private UUID paymentId;
    private String payType, numCard;
    private Integer parcelCount;
    private LocalDateTime payDate;
}
