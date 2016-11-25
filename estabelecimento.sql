CREATE TABLE estabelecimento (
id int primary key,
estabelecimento_codigo char(10),
estabelecimento_descricao char(100), 
estabelecimento_situacao char(10),
estabelecimento_uf char(2),
estabelecimento_cep char(8),
estabelecimento_rua char(60),
estabelecimento_bairro char(40),
estabelecimento_cidade char(40)
);

ALTER TABLE estabelecimento ADD COLUMN estabelecimento_uf char(2);
ALTER TABLE estabelecimento ADD COLUMN estabelecimento_cep char(8);
ALTER TABLE estabelecimento ADD COLUMN estabelecimento_rua char(60);
ALTER TABLE estabelecimento ADD COLUMN estabelecimento_bairro char(40);
ALTER TABLE estabelecimento ADD COLUMN estabelecimento_cidade char(40);

DROP TABLE estabelecimento


----------------------------------
ORACLE
---------------------------------
CREATE TABLE estabelecimento (
         id      						NUMBER(5) PRIMARY KEY,
         estabelecimento_codigo      	VARCHAR2(10),
         estabelecimento_descricao      VARCHAR2(100),
         estabelecimento_situacao       VARCHAR2(10)),
		 ESTABELECIMENTO_UF 			VARCHAR2(2),
		 ESTABELECIMENTO_CEP 			VARCHAR2(8),
		 ESTABELECIMENTO_RUA 			VARCHAR2(50),
		 ESTABELECIMENTO_BAIRRO 		VARCHAR2(50),
		 ESTABELECIMENTO_CIDADE 		VARCHAR2(50)
		 
CREATE SEQUENCE hibernate_sequence
      INCREMENT BY 1
      START WITH 10
      NOMAXVALUE
      NOCYCLE
      CACHE 10;