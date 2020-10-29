create database campeonado ;
create table tb_time(
id int primary key auto_increment,
nome varchar(200)
) ;
create table tb_jogador(
id int primary key auto_increment,
codigo_time int not null,
numero_camisa int not null,
nome varchar(200),
data_nascimento date,
posicao varchar(200)
);
create table tb_capeonado(
id int primary key auto_increment,
nome varchar(200),
ano year,
codigo_campeao int null
);
create table tb_partida(
id int primary key auto_increment,
data date,
codigo_campeonato int not null,
codigo_ganhador int null,
codigo_mandante int not null,
codigo_visitante int not null,
quantidade_gol_mandante int not null,
quantidade_gol_visitante int not null
);
create table tb_detalhamentopartida(
id int primary key auto_increment,
codigo_partida int not null,
codigo_jogador int not null,
quantidade_gol int not null,
quantidade_cartao_vermelho int not null,
quantidade_cartao_amarelo int not null
)
Questão 1
select tb_jogador.id,tb_jogador.nome,tb_jogador.numero_camisa, tb_time.nome, tb_time.id from tb_jogador inner join tb_time on tb_jogador.codigo_time = tb_time.id



Questão 2
select tb_partida.id,tb_detalhamentopartida.quantidade_gol,tb_detalhamentopartida.quantidade_cartao_vermelho,tb_detalhamentopartida.quantidade_cartao_amarelo,tb_jogador.nome from tb_time inner join tb_jogador on tb_time.id = tb_jogador.codigo_time inner join tb_partida on codigo_mandante = tb_time.id or codigo_visitante = tb_time.id inner join tb_detalhamentopartida on tb_detalhamentopartida.codigo_jogador = tb_jogador.id and tb_detalhamentopartida.codigo_
