package salessync.salesmanagement;

import java.util.UUID;
import salessync.productmanagement.Product;

public class SaleItem {
    private UUID saleItemId;
    private Integer quantity;
    private Double subtotal;
    private Product product;
}
