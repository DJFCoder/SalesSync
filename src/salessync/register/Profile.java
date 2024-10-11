package salessync.register;

import java.util.List;
import java.util.UUID;
import salessync.core.Backup;
import salessync.core.Log;
import salessync.core.User;

public class Profile extends Registration {

    private UUID profileId;
    private User user;
    private List<Log> logs;
    private List<Backup> backups;

    public Profile(User user) {
        this.profileId = UUID.randomUUID();
        this.user = user;
    }

    public UUID getProfileId() {
        return profileId;
    }

    @Override
    public String getZipCode() {
        return null;
    }

    @Override
    public void setZipCode(String zipCode) {
    }

    @Override
    public String getStateCode() {
        return null;
    }

    @Override
    public void setStateCode(String stateCode) {
    }

    @Override
    public String getCity() {
        return null;
    }

    @Override
    public void setCity(String city) {
    }

    @Override
    public String getNeighborhood() {
        return null;
    }

    @Override
    public void setNeighborhood(String neighborhood) {
    }

    @Override
    public String getComplement() {
        return null;
    }

    @Override
    public void setComplement(String complement) {
    }

    @Override
    public String getAddressNumber() {
        return null;
    }

    @Override
    public void setAddressNumber(String addressNumber) {
    }

    @Override
    public String getAddress() {
        return null;
    }

    @Override
    public void setAddress(String address) {
    }

    @Override
    public UUID getAddressId() {
        return null;
    }

    @Override
    public void setAddressId(UUID id) {
    }

    @Override
    public String getNumber() {
        return null;
    }

    @Override
    public void setNumber(String number) {
    }

    @Override
    public String getAreaCode() {
        return null;
    }

    @Override
    public void setAreaCode(String areaCode) {
    }

    @Override
    public String getCodCountry() {
        return null;
    }

    @Override
    public void setCodCountry(String codCountry) {
    }

    @Override
    public UUID getPhoneId() {
        return null;
    }

    @Override
    public void setPhoneId(UUID id) {
    }
}