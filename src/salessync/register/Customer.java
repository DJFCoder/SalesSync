package salessync.register;

import java.util.UUID;

public class Customer extends Registration {
    private UUID costumerId;
    
    public Customer() {}

    public UUID getCostumerId() {
        return costumerId;
    }

    public void setCostumerId(UUID costumerId) {
        this.costumerId = costumerId;
    }
       
    @Override
    public String getZipCode() {
        return null;
    }

    @Override
    public void setZipCode(String zipCode) {}

    @Override
    public String getStateCode() {
        return null;
    }

    @Override
    public void setStateCode(String stateCode) {}

    @Override
    public String getCity() {
        return null;
    }

    @Override
    public void setCity(String city) {}

    @Override
    public String getNeighborhood() {
        return null;
    }

    @Override
    public void setNeighborhood(String neighborhood) {}

    @Override
    public String getComplement() {
        return null;
    }

    @Override
    public void setComplement(String complement) {}

    @Override
    public String getAddressNumber() {
        return null;
    }

    @Override
    public void setAddressNumber(String addressNumber) {}

    @Override
    public String getAddress() {
        return null;
    }

    @Override
    public void setAddress(String address) {}

    @Override
    public UUID getAddressId() {
        return null;
    }

    @Override
    public void setAddressId(UUID id) {}

    @Override
    public String getNumber() {
        return null;
    }

    @Override
    public void setNumber(String number) {}

    @Override
    public String getAreaCode() {
        return null;
    }

    @Override
    public void setAreaCode(String areaCode) {}

    @Override
    public String getCodCountry() {
        return null;
    }

    @Override
    public void setCodCountry(String codCountry) {}

    @Override
    public UUID getPhoneId() {
        return null;
    }

    @Override
    public void setPhoneId(UUID id) {}   
}
