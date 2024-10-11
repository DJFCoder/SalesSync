package salessync.core;

import java.util.UUID;

public interface Address {
    UUID getAddressId();
    void setAddressId(UUID id);
    
    String getAddress();
    void setAddress(String address);
    
    String getAddressNumber();
    void setAddressNumber(String addressNumber);
    
    String getComplement();
    void setComplement(String complement);
    
    String getNeighborhood();
    void setNeighborhood(String neighborhood);
    
    String getCity();
    void setCity(String city);
    
    String getStateCode();
    void setStateCode(String stateCode);
    
    String getZipCode();
    void setZipCode(String zipCode);
}
