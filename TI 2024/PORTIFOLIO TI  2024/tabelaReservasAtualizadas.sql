show tables;

select * from salas;

describe reservas;

describe salas;

DROP TABLE IF EXISTS `funcionario`;

DROP TABLE IF EXISTS `reservas`;

DROP TABLE  `salas`;

create table salas (
  idSala int primary key auto_increment,
  andarSala enum('Subsolo', 'Térreo','1º andar','2º andar','3º andar'),
  numeroSala varchar(20) not null,
  tipoSala enum('Convencional','Laboratorio de Massoterapia','Laboratório de beleza ','Laboratorio de TI', 'Auditório', 'Laboratorio de comunicação', 'Laboratorio de enfermagem', 'Estudio de fotografia', 'Laboratorio de design', 'Laboratório de Estética'),
  codigoSala enum('', 'AUDI','CONV','LAB','FOTO'),
  ocupacaoSala int not null,
  emReforma enum('', 'Sim','Não')
);

INSERT INTO `salas` (andarSala, numeroSala, tipoSala, codigoSala, ocupacaoSala, emReforma) VALUES ('Subsolo','S1','Convencional','CONV',32,'Não'),('Subsolo','S2','Laboratório de beleza','LAB',13,'Não'),('Subsolo','S3','Laboratório de Massoterapia','LAB',30,'Não'),('Subsolo','S4','Laboratório de Massoterapia','LAB',30,'Não');

INSERT INTO `salas` (andarSala, numeroSala, tipoSala, codigoSala, ocupacaoSala, emReforma) VALUES ('Térreo','01','Laboratório de TI','LAB',28,'Não'),('Térreo','Auditório','Auditório','AUDI',100,'Não');

INSERT INTO `salas` (andarSala, numeroSala, tipoSala, codigoSala, ocupacaoSala, emReforma) VALUES ('1º Andar','11','Convencional','CONV',32,'Não'),('Subsolo','S2','Laboratório de beleza','LAB',13,'Não'),('Subsolo','S3','Laboratório de Massoterapia','LAB',30,'Não'),('Subsolo','S4','Laboratório de Massoterapia','LAB',30,'Não');


select * from salas;



CREATE TABLE `funcionario` (
  `idFuncionario` int NOT NULL AUTO_INCREMENT,
  `nomeFunc` varchar(50) NOT NULL,
  `login` varchar(50) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `perfil` enum('','Administrador','Gerência','Atendimento','Suporte') DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`idFuncionario`),
  UNIQUE KEY `login` (`login`),
  UNIQUE KEY `email` (`email`)
);

select * from funcionario;

INSERT INTO `funcionario` (nomeFunc, login, senha, perfil, email) VALUES ('Fabiana De Souza Camacho Ribeiro','fabiana.scribeiro',md5('apoio24'),'Administrador','fabiana.scribeiro@sp.senac.br');
INSERT INTO `funcionario` (nomeFunc, login, senha, perfil, email) VALUES ('Marcia Santos Oliveira','marcia.soliveira',md5('apoio24'),'Administrador','marcia.soliveira@sp.senac.br');
INSERT INTO `funcionario` (nomeFunc, login, senha, perfil, email) VALUES ('Wallison Andre Davi Cajazeiras','wallison.adcajazeiras',md5('apoio24'),'Administrador','wallison.adcajazeiras@sp.senac.br');
INSERT INTO `funcionario` (nomeFunc, login, senha, perfil, email) VALUES ('Fabiano Da Silva Filho','fabiano.sfilho',md5('apoio24'),'Administrador','fabiano.sfilho@sp.senac.br');
INSERT INTO `funcionario` (nomeFunc, login, senha, perfil, email) VALUES ('Rosilene Cerqueira Araujo Lopes','rosilene.calopes',md5('apoio24'),'Administrador','rosilene.calopes@sp.senac.br');
INSERT INTO `funcionario` (nomeFunc, login, senha, perfil, email) VALUES ('Angelina Pompeu Furtado Pires','angelina.pfpires',md5('apoio24'),'Administrador','angelina.pfpires@sp.senac.br');
INSERT INTO `funcionario` (nomeFunc, login, senha, perfil, email) VALUES ('Lidiane Viana Matos','lidiane.vmatos',md5('apoio24'),'Administrador','lidiane.vmatos@sp.senac.br');

CREATE TABLE `reservas` (
  `idReserva` int NOT NULL AUTO_INCREMENT,
  `idSala` int NOT NULL,
  `responsavelReserva` varchar(100) NOT NULL,
  `inicioReserva` datetime NOT NULL,
  `fimReserva` datetime NOT NULL,
  PRIMARY KEY (`idReserva`),
  KEY `idSala` (`idSala`),
  CONSTRAINT `reservas_ibfk_1` FOREIGN KEY (`idSala`) REFERENCES `salas` (`idSala`)
);