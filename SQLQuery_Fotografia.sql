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
DROP table Endereco;


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
