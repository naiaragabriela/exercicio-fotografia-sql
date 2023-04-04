create table PessoaFisica
(
 cpf char (11) NOT NULL,
 rg varchar (10),
 dataNascimento DATE,
 sexo char,
 nome varchar (50) NOT NULL,
 codigo int NOT Null,

)

create table PessoaJuridica
(
    cnpj char (14) NOT NULL,
    inscricaoEstadual char (9),
    nomeResponsavel varchar (50) NOT NULL,
    nome varchar (50) NOT NULL,
    codigo int NOT NULL,
)

create table Funcionario
(
    codigo int NOT NULL,
    departamento varchar (30),
    nome varchar (50) NOT NULL,
    funcao varchar (30) NOT NULL,
)

create table Produto
(
    codigo int NOT NULL,
    tipo varchar (20) NOT NULL,
    descricao varchar (100) NOT Null,
    precoCusto decimal NOT NULL,
    precoVenda decimal NOT NULL,
    qtdMinima int NOT NULL,
    qtdEstoque int NOT NULL,
)

create table Venda
(
    id int NOT NULL,
    dataVenda DATETIME NOT NULL,
    pagamento varchar(10) NOT NULL,
    valor decimal NOT NULL,
)

create table Endereco 
(
    logradouro varchar (50) NOT NULL,
    numero int NOT NULL,
    complemento varchar (50),
    bairro varchar (20) NOT NULL,
    cep char (8)NOT NULL,
    cicdade varchar (30) NOT NULL,
    estado char (2) NOT NULL,
    pais char (2) NOT NULL,
)


create table Telefone 
(
    tipo varchar (10) NOT NULL,
    numero char (11) NOT NULL,
)
GO

ALTER TABLE PessoaFisica ADD
 Constraint PK_PessoaFisica PRIMARY KEY (codigo),
 Constraint AK_PessoaFisica UNIQUE (cpf)

ALTER TABLE PessoaJuridica ADD
 Constraint PK_PessoaJuridica PRIMARY KEY (codigo),
 Constraint AK_PesosaJuridica UNIQUE (cnpj)

ALTER TABLE Funcionario ADD
 Constraint PK_Funcionario PRIMARY KEY (codigo)

ALTER TABLE Produto ADD
 Constraint PK_Produto PRIMARY KEY (codigo)

ALTER TABLE Venda ADD
 Constraint PK_Venda PRIMARY KEY (id)
 
ALTER TABLE Telefone ADD
 codigo int NOT NULL,
 CONSTRAINT PK_Telefone PRIMARY KEY (numero,codigo),
 CONSTRAINT FK_Funcionario_Telefone FOREIGN KEY (codigo) REFERENCES Funcionario(codigo),
 CONSTRAINT FK_PessoaFisica_Telefone FOREIGN KEY (codigo) REFERENCES PessoaFisica(codigo),
 CONSTRAINT FK_PessoaJuridica_Telefone FOREIGN KEY (codigo) REFERENCES PessoaJuridica(codigo)

ALTER TABLE Endereco ADD
 codigo int not null,
 CONSTRAINT PK_Endereco PRIMARY KEY (codigo, numero, cep),
 CONSTRAINT FK_PessoaFisica_Endereco FOREIGN KEY (codigo) REFERENCES PessoaFisica(codigo),
 CONSTRAINT FK_PessoaJurica_Endereco FOREIGN KEY (codigo) REFERENCES PessoaJuridica(codigo),
 CONSTRAINT FK_Funcionario_Endereco FOREIGN KEY (codigo) REFERENCES Funcionario(codigo)

 CREATE TABLE Item
 (
  IdVenda int NOT NULL,
  CodigoFuncionario int NOT NULL,
  CodigoCliente int NOT NULL,
  CodigoProduto int NOT NULL,

  CONSTRAINT PK_Item PRIMARY KEY (IdVenda, CodigoFuncionario, CodigoCliente, CodigoProduto),
  CONSTRAINT FK_Item_Venda FOREIGN KEY (IdVenda) REFERENCES Venda(id),
  CONSTRAINT FK_Item_Funcionario FOREIGN KEY (CodigoFuncionario) REFERENCES Funcionario(codigo),
  CONSTRAINT FK_Item_PessoaFisica FOREIGN KEY (CodigoCliente) REFERENCES PessoaFisica(codigo),
  CONSTRAINT FK_Item_PessoaJuridica  FOREIGN KEY (CodigoCliente) REFERENCES PessoaJuridica(codigo),
  CONSTRAINT FK_Item_Produto FOREIGN Key (CodigoProduto) REFERENCES Produto(codigo)
 )


Alter TABLE Item ADD 
ValorItem int NOT NULL



Create or Alter PROC InsertPessoaFisica 
    @codigo int,
    @nome varchar (50), 
    @rg varchar (10),
    @cpf char (11), 
    @dataNascimento Date,
    @sexo char,
AS
BEGIN 
INSERT INTO PessoaFisica ([codigo],[nome],[rg],[cpf],[dataNascimento],[sexo]) VALUES (

    @codigo,
    @nome,
    @rg,
    @cpf,
    @dataNascimento,
    @sexo
)
END;
GO


Create or Alter PROC InsertPessoaJuridica 
  @codigo int,
  @nome varchar (50),
  @cnpj  char (14),
  @inscricaoEstadual char (9),
  @nomeResponsavel
AS
BEGIN 
INSERT INTO PessoaJuridica ([codigo],[nome],[cnpj],[inscricaoEstadual],[nomeResponsavel]) VALUES (

  @codigo,
  @nome,
  @cnpj,
  @inscricaoEstadual,
  @nomeResponsavel,
)
END;
GO


Create or Alter PROC InsertFuncionario
  @codigo int,
  @nome varchar (50),
  @departamento  varchar (50),
  @funcao varchar (30),
AS
BEGIN 
INSERT INTO Funcionario ([codigo],[nome],[departamento],[funcao]) VALUES (
  @codigo,
  @nome,
  @departamento,
  @funcao,
)
END;
GO


Create or Alter PROC InsertProduto
  @codigo int,
  @tipo varchar (20),
  @descricao  varchar (100),
  @precoCusto decimal,
  @precoVenda decimal,
  @qtdMinima int,
  @qtdEstoque int
AS
BEGIN 
INSERT INTO Produto ([codigo],[tipo],[descricao],[precoCusto],[precoVenda],[qtdMinima],[qtdEstoque]) VALUES (
  @codigo,
  @tipo,
  @descricao,
  @precoCusto,
  @precoVenda,
  @qtdMinima,
  @qtdEstoque
)
END;
GO


Create or Alter PROC Venda 
    @id int,
    @dataVenda DATETIME,
    @pagamento varchar(10),
    @valor decimal
AS
BEGIN
INSERT INTO Venda ([id],[dataVenda],[pagamento],[valor]) VALUES (
    @id,
    @dataVenda,
    @pagamento,
    @valor
)
END;
GO


Create or Alter PROC Endereco
    @logradouro varchar (50),
    @numero int,
    @complemento varchar (50),
    @bairro varchar (20), 
    @cep char (8),
    @cicdade varchar (30),
    @estado char (2),
    @pais char (2),
AS 
BEGIN
INSERT INTO Endereco ([logradouro],[numero],[complemento],[bairro],[cep],[cicdade],[estado],[pais]) VALUES(
    @logradouro,
    @numero,
    @complemento,
    @bairro, 
    @cep,
    @cicdade,
    @estado,
    @pais
)
END;
GO


CREATE OR ALTER PROC Telefone
    @codigo int,
    @tipo varchar (10),
    @número char (11)
AS
BEGIN
INSERT INTO Telefone ([codigo],[tipo],[numero]) VALUES(
    @codigo,
    @tipo,
    @numero
)
END;
GO

CREATE OR ALTER PROC Item
    @IdVenda int,
    @CodigoFuncionario int,
    @CodigoCliente int,
    @CodigoProduto int,
ADD
BEGIN 
INSERT INTO Item ([IdVenda],[CodigoFuncionario],[CodigoCliente],[CodigoProduto]) VALUES(
    @IdVenda,
    @CodigoFuncionario,
    @CodigoCliente, 
    @CodigoProduto,
)
END;
GO  