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