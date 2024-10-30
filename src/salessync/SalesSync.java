package salessync;

import salessync.core.User;

public class SalesSync {

    public static void main(String[] args) {
        /* Controle de Usuários: 
        
        - Gerenciamento de contas e permissões dos usuários internos pelo Administrador do Sistema. */
        User admin = new User("admin","admin");

        admin.setPosition("ADMIN");
        
        
    }
    
}
