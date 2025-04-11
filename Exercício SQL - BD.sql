CREATE DATABASE SistemaAcademico;
USE SistemaAcademico;

CREATE TABLE Curso 
	( 
		CodCurso CHAR(3) primary key not null,
		Nome VARChAR(30),
		Mensalidade NUMERIC(10,2)
);
CREATE TABLE Aluno (
    RA CHAR(9) not null PRIMARY KEY,
    RG CHAR(9) NOT NULL, 
    NOME CHAR(30), 
    CODCURSO CHAR(3), 
    FOREIGN KEY (CODCURSO) REFERENCES CURSO(CODCURSO)
);

CREATE TABLE DISCIPLINA (
    CodDisc CHAR(5) NOT NULL PRIMARY KEY, 
    Nome CHAR(30), 
    CODCURSO CHAR(3), 
    FOREIGN KEY (CODCURSO) REFERENCES CURSO(CODCURSO)
);

CREATE TABLE BOLETIM (
	RA CHAR(9) NOT NULL, 
    CodDisc char(5) NOT NULL,
    NOTA DECIMAL(5,2),
    primary key (RA, CodDisc), 
    foreign key (RA) REFERENCES ALUNO(RA),
    foreign key (CodDisc) references DISCIPLINA (CodDisc)
);

select * from curso;

insert into CURSO VALUES
('AS','ANALISE DE SISTEMAS',1000);

insert into CURSO VALUES
('CC','CIENCIA DA COMPUTACAO',950);

UPDATE CURSO
SET Nome = 'CIENCIA DA COMPUTACAO', Mensalidade = 950
WHERE CodCurso = 'CC';

UPDATE CURSO
SET Nome = 'SISTEMAS DE INFORMAÇÃO', Mensalidade = 800
WHERE CodCurso = 'SI';


INSERT INTO ALUNO VALUES
('123', '12345', 'BIANCA MARIA PEDROSA', 'AS'),
('212', '21234', 'TATIANE CITTON', 'AS'),
('221', '22145', 'ALEXANDRE PEDROSA', 'CC'),
('231', '23144', 'ALEXANDRE MONTEIRO', 'CC'),
('321', '32111', 'MARCIA RIBEIRO', 'CC'),
('661', '66123', 'JUSSARA MARANDOLA', 'SI'),
('765', '76512', 'WALTER RODRIGUES', 'SI');




describe aluno;
select * from aluno;

select * from DISCIPLINA;

INSERT INTO DISCIPLINA (CodDisc, Nome, CODCURSO) VALUES
('BD', 'BANCO DE DADOS', 'CC'),
('BDA', 'BANCO DE DADOS AVANÇADO', 'CC'),
('BDOO', 'BANCO DE DADOS O OBJETOS', 'SI'),
('BDS', 'SISTEMAS DE BANCO DE DADOS', 'AS'),
('DBD', 'DESENVOLVIMENTO BANCO DE DADOS', 'SI'),
('IBD', 'INTRODUÇÃO A BANCO DE DADOS', 'AS')
ON DUPLICATE KEY UPDATE Nome = VALUES(Nome), CODCURSO = VALUES(CODCURSO);

select * from BOLETIM;

INSERT INTO BOLETIM (RA, CodDisc, NOTA) VALUES
('123', 'BDS', 10),
('212', 'IBD', 7.5),
('231', 'BD', 9),
('231', 'BDA', 9.6),
('661', 'DBD', 8),
('765', 'DBD', 6)
ON DUPLICATE KEY UPDATE NOTA = VALUES(NOTA);
