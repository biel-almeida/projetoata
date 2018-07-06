#criando o banco de dados
CREATE SCHEMA projetoata;

#ativando o esquema
USE projetoata;

#mostrando as tabelas do esquema
SHOW TABLES;

#excluindo e criando tabelas
DROP TABLE IF EXISTS projetoata.projeto;
CREATE TABLE IF NOT EXISTS projetoata.projeto
(
	id_proj INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(200) NOT NULL,
    professor INT NOT NULL,
    PRIMARY KEY (id_proj),
    FOREIGN KEY (professor) REFERENCES projetoata.professor(id_prof)
);

DROP TABLE IF EXISTS projetoata.professor;
CREATE  TABLE IF NOT EXISTS projetoata.professor
(
	id_prof INT NOT NULL,
    nome VARCHAR(200) NOT NULL,
    formacao VARCHAR(200) NOT NULL,
    titulacao VARCHAR(200),
    PRIMARY KEY (id_prof)
);

DROP TABLE IF EXISTS projetoata.aluno;
CREATE TABLE IF NOT EXISTS projetoata.aluno
(
	id_aluno INT NOT NULL,
    nome VARCHAR(200) NOT NULL,
    cpf INT NOT NULL,
    curso VARCHAR(200) NOT NULL,
    PRIMARY KEY (id_aluno)
);

DROP TABLE IF EXISTS projetoata.ata;
CREATE TABLE IF NOT EXISTS projetoata.ata
(
	id_ata INT NOT NULL AUTO_INCREMENT,
    assunto VARCHAR(200) NOT NULL,
	data_realização DATE,
    professor INT NOT NULL,
    PRIMARY KEY (id_ata),
    FOREIGN KEY (professor) REFERENCES projetoata.professor(id_prof)
);

DROP TABLE IF EXISTS projetoata.encaminhamento;
CREATE TABLE IF NOT EXISTS projetoata.encaminhamento
(
	id_enc INT NOT NULL AUTO_INCREMENT,
    assunto VARCHAR(200) NOT NULL,
    aluno INT NOT NULL,
    tarefa VARCHAR(200) NOT NULL,
    PRIMARY KEY (id_enc),
    FOREIGN KEY (aluno) REFERENCES projetoata.aluno(id_aluno)
);

DROP TABLE IF EXISTS projetoata.projeto_ata;
CREATE TABLE IF NOT EXISTS projetoata.projeto_ata
(
	ata INT NOT NULL,
    projeto INT NOT NULL,
    PRIMARY KEY (ata, projeto),
    FOREIGN KEY (ata) REFERENCES projetoata.ata(id_ata),
    FOREIGN KEY (projeto) REFERENCES projetoata.projeto(id_proj)
);

DROP TABLE IF EXISTS projetoata.ata_aluno;
CREATE TABLE IF NOT EXISTS projetoata.ata_aluno
(
	ata INT NOT NULL,
    aluno INT NOT NULL,
    PRIMARY KEY (ata, aluno),
    FOREIGN KEY (ata) REFERENCES projetoata.ata(id_ata),
    FOREIGN KEY (aluno) REFERENCES projetoata.aluno(id_aluno)
);

DROP TABLE IF EXISTS projetoata.ata_encaminhamento;
CREATE TABLE IF NOT EXISTS projetoata.ata_encaminhamento
(
	ata INT NOT NULL,
    encaminhamento INT NOT NULL,
    PRIMARY KEY (ata, encaminhamento),
    FOREIGN KEY (ata) REFERENCES projetoata.ata(id_ata),
    FOREIGN KEY (encaminhamento) REFERENCES projetoata.encaminhamento(id_enc)
);