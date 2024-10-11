@startuml
!theme crt-green

package "Product Management" {
    class Product {
        * category : Category
    }

    class Category {
        - categoryId : UUID
        - name : String
    }

    Product --> Category
}

package "Sales Management" {
    class Sale {
        - saleId : UUID
        * payment : Payment
        * saleItems : List<SaleItem>
        * profile : Profile
        * customer : Customer 
    }

    class SaleItem {
        * product : Product 
    }

    class Payment {}

    Sale --> SaleItem
    Sale --> Payment
    SaleItem --> Product
    Sale --> Profile
    Sale --> Customer
}
@enduml

@startuml
!theme crt-green

package "Register" {
    abstract class Registration implements Phone, Address {
        - registationId : String
        - name : String
        - email : String
        - cpf : String
        * phone : Phone 
        * address : Address
    }

    class Customer extends Registration {}

    class Profile extends Registration {}

}

package "Core" {
    class Profile extends Registration {
        * user : User
        * position : Position
        * logs : List<Log>
        * backups : List<Backup>
    }

    interface Phone {}

    interface Address {}

    class User {}

    class Position {}

    class Log {}

    class Backup {}

    Profile --> User
    Profile --> Position
    Profile --> Log
    Profile --> Backup
}
@enduml

@startuml
!theme crt-green

package "Legend" {
	
    interface "Address Attributes" {
        - getAddressId() : UUID
				- setAddressId(id : UUID) : void
				- getAddress() : String
				- setAddress(address : String) : void
				- getAddressNumber() : String
				- setAddressNumber(addressNumber : String) : void 
				- getComplement() : String
				- setComplement(complement : String) : void 
				- getNeighborhood() : String
				- setNeighborhood(neighborhood : String) : void 
				- getCity() : String 
				- setCity(city : String) : void 
				- getStateCode() : String 
				- setStateCode(stateCode : String) : void 
				- getZipCode() : String 
				- setZipCode(zipCode : String) : void 
    }

    interface "Phone Attributes" {
				- getPhoneId() : UUID
				- setPhoneId(id : UUID) : void
				- getCodCountry() : String
				- setCodCountry(codCountry : String) : void
				- getAreaCode() : String
				- setAreaCode(areaCode : String) : void
				- getNumber() : String
				- setNumber(number : String) : void
    }
		
    class "Product Attributes" {
        - productId : UUID
        - name : String
        - code : String
        - quantity : Integer
        - unitaryPrice : Double
    }

    class "SaleItem Attributes" {
        - saleItemId : UUID
        - quantity : Integer
        - subtotal : Double 
        * product : Product
    }

    class "Payment Attributes" {
        - paymentId : UUID
        - payType : String 
        - numCard : String
        - parcelCount : Integer
        - payDate : LocalDateTime
    }

    class "User Attributes" {
        - userId : UUID
        - login : String
        - password : String
        - lastLogin : LocalDateTime
    }

    class "Position Attributes" {
        - positionId : UUID
        - type : String
    }

    class "Log Attributes" {
        - logId : UUID
        - dateTime : LocalDateTime
        - action : String
    }

    class "Backup Attributes" {
        - backupId : UUID
        - dateTime : LocalDateTime
        - status : String
    }
}
@enduml