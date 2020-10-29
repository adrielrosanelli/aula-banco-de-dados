Create database eleição

create table voto(
id int primary key auto_increment,
nome_ele varchar (200), ok 
nome_candidado varchar(200),  ok 
id_eleitor int, ok 
cd_candidado int, ok 
data_do_voto timestamp, date ok 
nome_mesario varchar(200),
codigo_mesario int, 
ano_eleicao year,
nome_eleicao varchar(200),
codigo_eleicao varchar(200) int  ok 
); 
create table eleicao(
id int primary key auto_increment,
nome varchar(200) ok  
);

create table candidado(  candidato ok 
id int primary key auto_increment,
nome varchar(200) ,
numero varchar(200), int (20) ok
data_nascimento date,
sexo varchar(500), (50) ok
cpf varchar(300) (11) ok
);

create table eleitor(
id int primary key auto_increment,
nome varchar(200) ,
numero varchar(200), int (20)  ok 
data_nascimento date,
sexo varchar(500), (50) ok 
cpf varchar(300) (11) ok
);


insert into candidado(nome,numero,data_nascimento,sexo,cpf)
values('Rafael','123',current_date(),'M',11111);
insert into candidado(nome,numero,data_nascimento,sexo,cpf)
values('Ana','456',current_date(),'M',11111);
insert into candidado(nome,numero,data_nascimento,sexo,cpf)
values('Joao','789',current_date(),'M',11111);


insert into eleitor(nome,numero,data_nascimento,sexo,cpf)
values('Rafael','123',current_date(),'M',11111);

insert into eleitor(nome,numero,data_nascimento,sexo,cpf)
values('pedro','123',current_date(),'M',11111);

insert into eleitor(nome,numero,data_nascimento,sexo,cpf)
values('paulo','123',current_date(),'M',11111);


insert into eleicao (nome) values ('Eleição 2020');

insert into voto(nome_ele,nome_candidado,id_eleitor,cd_candidado,data_do_voto,nome_mesario,ano_eleicao,codigo_eleicao)
values ('Rafael','Ana',1,1,current_date(),'Mesaria Ana',2020,1);

insert into voto(nome_ele,nome_candidado,id_eleitor,cd_candidado,data_do_voto,nome_mesario,ano_eleicao,codigo_eleicao)
values ('pedro','paulo',1,1,current_date(),'Mesaria Ana',2020,1);

Alterações do banco

// tabela candidato
SELECT * FROM candidado;
RENAME TABLE candidado TO candidato;
ALTER TABLE candidato CHANGE nome nome varchar(30);
ALTER TABLE candidato CHANGE sexo sexo varchar(1);
ALTER TABLE candidato CHANGE numero numero int(5);
ALTER TABLE candidato CHANGE cpf cpf int(11);
UPDATE candidato  SET sexo = "F" WHERE id = “2” ;

// tabela eleicao
SELECT * FROM eleicao;
ALTER TABLE eleicao CHANGE nome nome varchar(20);
ALTER TABLE eleicao ADD COLUMN ano_eleicao year;
UPDATE eleicao SET ano_eleicao = (SELECT max(ano_eleicao) FROM voto WHERE codigo_eleicao = eleicao.id) WHERE id > 0;


//tabela eleitor
SELECT * FROM eleitor;
ALTER TABLE eleitor CHANGE nome nome varchar(30);
ALTER TABLE eleitor CHANGE numero numero int(5);
ALTER TABLE eleitor CHANGE sexo sexo varchar(1);
ALTER TABLE eleitor CHANGE cpf cpf int(11);

//tabela voto
SELECT * FROM voto;
ALTER TABLE voto CHANGE nome_ele nome_eleitor varchar(30);
ALTER TABLE voto CHANGE nome_candidado nome_candidato varchar(30);
ALTER TABLE voto CHANGE id_eleitor codigo_eleitor int(6);
ALTER TABLE voto CHANGE cd_candidado codigo_candidato int(6);
ALTER TABLE voto CHANGE data_do_voto data_do_voto date;
ALTER TABLE voto CHANGE nome_mesario nome_mesario varchar(40);
ALTER TABLE voto CHANGE codigo_mesario codigo_mesario int(6);
ALTER TABLE voto DROP COLUMN ano_eleicao;
ALTER TABLE voto CHANGE nome_eleicao nome_eleicao varchar(20);
ALTER TABLE voto CHANGE codigo_eleicao codigo_eleicao int(6);

//tabela mesário
CREATE TABLE mesario(
id int primary key auto_increment,
nome varchar(40),
numero int(6),
sexo varchar(1),
cpf int(11)
);

Implementando as FK

ALTER TABLE voto ADD CONSTRAINT fk_eleitor FOREIGN KEY (id) REFERENCES eleitor (id);
