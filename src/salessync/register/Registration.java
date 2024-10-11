package salessync.register;

import java.util.UUID;
import salessync.core.Address;
import salessync.core.Phone;

public abstract class Registration implements Phone, Address {

    private UUID registerId;
    private String name, email, cpf;

    public UUID getRegisterId() {
        return registerId;
    }

    public void setRegisterId(UUID registerId) {
        this.registerId = registerId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    @Override
    public abstract void setZipCode(String zipCode);

    @Override
    public abstract String getZipCode();

    @Override
    public abstract void setStateCode(String stateCode);

    @Override
    public abstract String getStateCode();

    @Override
    public abstract void setCity(String city);

    @Override
    public abstract String getCity();

    @Override
    public abstract void setNeighborhood(String neighborhood);

    @Override
    public abstract String getNeighborhood();

    @Override
    public abstract void setComplement(String complement);

    @Override
    public abstract String getComplement();

    @Override
    public abstract void setAddressNumber(String addressNumber);

    @Override
    public abstract String getAddressNumber();

    @Override
    public abstract void setAddress(String address);

    @Override
    public abstract String getAddress();

    @Override
    public abstract void setAddressId(UUID id);

    @Override
    public abstract UUID getAddressId();

    @Override
    public abstract void setNumber(String number);

    @Override
    public abstract String getNumber();

    @Override
    public abstract void setAreaCode(String areaCode);

    @Override
    public abstract String getAreaCode();

    @Override
    public abstract void setCodCountry(String codCountry);

    @Override
    public abstract String getCodCountry();

    @Override
    public abstract void setPhoneId(UUID id);

    @Override
    public abstract UUID getPhoneId();
}