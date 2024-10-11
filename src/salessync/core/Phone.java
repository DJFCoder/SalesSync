package salessync.core;

import java.util.UUID;

public interface Phone {
    UUID getPhoneId();
    void setPhoneId(UUID id);
    
    String getCodCountry();
    void setCodCountry(String codCountry);
    
    String getAreaCode();
    void setAreaCode(String areaCode);
    
    String getNumber();
    void setNumber(String number);
}
