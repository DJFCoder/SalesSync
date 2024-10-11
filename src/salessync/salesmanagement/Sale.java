package salessync.salesmanagement;

import java.util.List;
import java.util.UUID;
import salessync.register.Customer;
import salessync.register.Profile;

public class Sale {
    private UUID saleId;
    private Payment payment;
    private List<SaleItem> saleItems;
    private Profile profile;
    private Customer customer;
}
