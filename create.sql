CREATE TABLE funcionario
( nome           VARCHAR(10)   NOT NULL,
  Minit           CHAR,
  Lname           VARCHAR(20)      NOT NULL,
  cpf             CHAR(9)          NOT NULL,
  d_nasc           DATE,
  endereco         VARCHAR(30),
  sexo             CHAR(1),
  salario          DECIMAL(5),
  super_cpf       CHAR(9),
  dno             INT               NOT NULL,
PRIMARY KEY   (cpf));

CREATE TABLE departamento
( dnome           VARCHAR(15)       NOT NULL,
  Dnum           INT               NOT NULL,
  chefe_cpf         CHAR(9)           NOT NULL,
  chefia_inicio  DATE,
PRIMARY KEY (Dnum),
UNIQUE      (dnome),
FOREIGN KEY (chefe_cpf) REFERENCES funcionario(cpf) );

CREATE TABLE depart_local
( dnum         INT               NOT NULL,
  dlocal       VARCHAR(15)       NOT NULL,
PRIMARY KEY (dnum, dlocal),
FOREIGN KEY (dnum) REFERENCES departamento(Dnum) );

CREATE TABLE projeto
( pnome           VARCHAR(15)       NOT NULL,
  pnum            INT               NOT NULL,
  plocal          VARCHAR(15),
  dnum            INT               NOT NULL,
PRIMARY KEY (pnum),
UNIQUE      (pnome),
FOREIGN KEY (Dnum) REFERENCES departamento(dnum) );

CREATE TABLE func_proj
( cpf            CHAR(9)           NOT NULL,
  pno             INT               NOT NULL,
  horas           DECIMAL(3,1)      NOT NULL,
PRIMARY KEY (cpf, pno),
FOREIGN KEY (cpf) REFERENCES funcionario(cpf),
FOREIGN KEY (pno) REFERENCES projeto(pnum) );

CREATE TABLE dependentes
( cpf             CHAR(9)           NOT NULL,
  nome            VARCHAR(15)       NOT NULL,
  sexo            CHAR,
  aniversario           DATE,
  Relationship    VARCHAR(8),
PRIMARY KEY (cpf, nome),
FOREIGN KEY (cpf) REFERENCES funcionario(cpf) );

INSERT INTO funcionario
VALUES      ('John','B','Smith',123456789,'1965-01-09','731 Fondren, Houston TX','M',30000,333445555,5),
            ('Franklin','T','Wong',333445555,'1965-12-08','638 Voss, Houston TX','M',40000,888665555,5),
            ('Alicia','J','Zelaya',999887777,'1968-01-19','3321 Castle, Spring TX','F',25000,987654321,4),
            ('Jennifer','S','Wallace',987654321,'1941-06-20','291 Berry, Bellaire TX','F',43000,888665555,4),
            ('Ramesh','K','Narayan',666884444,'1962-09-15','975 Fire Oak, Humble TX','M',38000,333445555,5),
            ('Joyce','A','English',453453453,'1972-07-31','5631 Rice, Houston TX','F',25000,333445555,5),
            ('Ahmad','V','Jabbar',987987987,'1969-03-29','980 Dallas, Houston TX','M',25000,987654321,4),
            ('James','E','Borg',888665555,'1937-11-10','450 Stone, Houston TX','M',55000,null,1);

INSERT INTO departamento
VALUES      ('Research',5,333445555,'1988-05-22'),
            ('Administration',4,987654321,'1995-01-01'),
            ('Headquarters',1,888665555,'1981-06-19');

INSERT INTO projeto
VALUES      ('ProductX',1,'Bellaire',5),
            ('ProductY',2,'Sugarland',5),
            ('ProductZ',3,'Houston',5),
            ('Computerization',10,'Stafford',4),
            ('Reorganization',20,'Houston',1),
            ('Newbenefits',30,'Stafford',4);

INSERT INTO func_proj
VALUES     (123456789,1,32.5),
           (123456789,2,7.5),
           (666884444,3,40.0),
           (453453453,1,20.0),
           (453453453,2,20.0),
           (333445555,2,10.0),
           (333445555,3,10.0),
           (333445555,10,10.0),
           (333445555,20,10.0),
           (999887777,30,30.0),
           (999887777,10,10.0),
           (987987987,10,35.0),
           (987987987,30,5.0),
           (987654321,30,20.0),
           (987654321,20,15.0),
           (888665555,20,16.0);

INSERT INTO dependentes
VALUES      (333445555,'Alice','F','1986-04-04','Daughter'),
            (333445555,'Theodore','M','1983-10-25','Son'),
            (333445555,'Joy','F','1958-05-03','Spouse'),
            (987654321,'Abner','M','1942-02-28','Spouse'),
            (123456789,'Michael','M','1988-01-04','Son'),
            (123456789,'Alice','F','1988-12-30','Daughter'),
            (123456789,'Elizabeth','F','1967-05-05','Spouse');

INSERT INTO depart_local
VALUES      (1,'Houston'),
            (4,'Stafford'),
            (5,'Bellaire'),
            (5,'Sugarland'),
            (5,'Houston');

ALTER TABLE departamento
 ADD CONSTRAINT Dep_emp FOREIGN KEY (chefe_cpf) REFERENCES funcionario(cpf);
ALTER TABLE funcionario
 ADD CONSTRAINT Emp_emp FOREIGN KEY (Super_cpf) REFERENCES funcionario(cpf);
ALTER TABLE funcionario
 ADD CONSTRAINT Emp_dno FOREIGN KEY  (Dno) REFERENCES departamento(dnum);
ALTER TABLE funcionario
 ADD CONSTRAINT Emp_super FOREIGN KEY  (Super_cpf) REFERENCES funcionario(cpf);
