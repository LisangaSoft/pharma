

CREATE TABLE profil(
        profil_id   int (11) Auto_increment  NOT NULL ,
        profil_type Varchar (25) ,
        PRIMARY KEY (profil_id )
       
)ENGINE=InnoDB;
CREATE TABLE users(
        user_id        int (11) Auto_increment  NOT NULL ,
        username       Varchar (25) ,
        passeword      Varchar (25) ,
        securequestion Varchar (25) ,
        answer         Varchar (25) ,
        profil_id      Int ,
        PRIMARY KEY (user_id ),
       FOREIGN KEY (profil_id) REFERENCES profil(profil_id)
)ENGINE=InnoDB;

