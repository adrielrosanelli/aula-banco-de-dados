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

SELECT tb_jogador.nome jogador, tb_time.nome time 
from tb_partida 
inner join tb_time on tb_partida.codigo_mandante=tb_time.id or tb_partida.codigo_visitante=tb_time.id 
inner join tb_jogador on tb_time.id=tb_jogador.codigo_time 
group by time, jogador


Questão 2

SELECT tb_time.nome time, tb_partida.data data_partida, 
SUM(tb_detalhamentopartida.quantidade_gol) gol, 
SUM(tb_detalhamentopartida.quantidade_cartao_amarelo) cartão_amarelo, 
SUM(tb_detalhamentopartida.quantidade_cartao_vermelho) cartão_vermelho 
from tb_detalhamentopartida inner join tb_partida on tb_partida.id=tb_detalhamentopartida.codigo_partida 
inner join tb_campeonato on tb_campeonato.id=tb_partida.codigo_campeonato 
inner join tb_jogador on tb_jogador.id=tb_detalhamentopartida.codigo_jogador 
inner join tb_time on tb_time.id=tb_jogador.codigo_time 
GROUP BY data_partida, time

Questão 3

SELECT tb_time.nome time, tb_campeonato.nome campeonato, 
SUM(tb_detalhamentopartida.quantidade_gol) gol, 
SUM(tb_detalhamentopartida.quantidade_cartao_amarelo) cartão_amarelo, 
SUM(tb_detalhamentopartida.quantidade_cartao_vermelho) cartão_vermelho 
FROM tb_detalhamentopartida 
INNER JOIN tb_partida ON tb_partida.id=tb_detalhamentopartida.codigo_partida inner join tb_campeonato on tb_campeonato.id=tb_partida.codigo_campeonato 
INNER JOIN tb_jogador ON tb_jogador.id=tb_detalhamentopartida.codigo_jogador inner join tb_time on tb_time.id=tb_jogador.codigo_time 
GROUP BY campeonato, time

Questão 4


SELECT tb_campeonato.nome campeonato, tb_time.nome time, 
SUM(CASE
	WHEN tb_partida.codigo_ganhador=tb_time.id THEN 3
    WHEN tb_partida.codigo_ganhador is NULL THEN 1
    ELSE 0
END) AS pontos
from tb_partida 
inner join tb_time on tb_partida.codigo_mandante=tb_time.id or tb_partida.codigo_visitante=tb_time.id 
inner join tb_campeonato on tb_campeonato.id=tb_partida.codigo_campeonato
GROUP BY campeonato, time
ORDER BY pontos DESC
