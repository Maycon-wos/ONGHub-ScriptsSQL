-- Criação da tabela ONG
CREATE TABLE ONG (
    ID_ONG INT PRIMARY KEY AUTO_INCREMENT,
    Nome_Fantasia VARCHAR(100) NOT NULL,
    CNPJ VARCHAR(18) UNIQUE NOT NULL,
    Email VARCHAR(100),
    Endereco VARCHAR(255),
    Status_Aprovacao VARCHAR(20) DEFAULT 'Pendente'
);

-- Criação da tabela DOADOR
CREATE TABLE DOADOR (
    ID_Doador INT PRIMARY KEY AUTO_INCREMENT,
    Nome_RazaoSocial VARCHAR(150) NOT NULL,
    Tipo VARCHAR(10) NOT NULL, -- 'PF' ou 'PJ'
    Email VARCHAR(100) UNIQUE,
    Telefone VARCHAR(20)
);

-- Criação da tabela VOLUNTARIO
CREATE TABLE VOLUNTARIO (
    ID_Voluntario INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    CPF VARCHAR(14) UNIQUE NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Telefone VARCHAR(20)
);

-- Criação da tabela HABILIDADE
CREATE TABLE HABILIDADE (
    ID_Habilidade INT PRIMARY KEY AUTO_INCREMENT,
    Nome_Habilidade VARCHAR(50) UNIQUE NOT NULL
);

-- Criação da tabela PROJETO (FK: ID_ONG)
CREATE TABLE PROJETO (
    ID_Projeto INT PRIMARY KEY AUTO_INCREMENT,
    ID_ONG INT NOT NULL,
    Titulo VARCHAR(100) NOT NULL,
    Meta_Financeira DECIMAL(10, 2) NOT NULL,
    Data_Inicio DATE NOT NULL,
    Status VARCHAR(20) DEFAULT 'Ativo',
    FOREIGN KEY (ID_ONG) REFERENCES ONG(ID_ONG)
);

-- Criação da tabela VAGA_VOLUNTARIADO (FK: ID_Projeto)
CREATE TABLE VAGA_VOLUNTARIADO (
    ID_Vaga INT PRIMARY KEY AUTO_INCREMENT,
    ID_Projeto INT NOT NULL,
    Titulo VARCHAR(100) NOT NULL,
    Descricao_Requisitos TEXT, -- Adicionado conforme recomendação
    Carga_Horaria_Estimada INT,
    FOREIGN KEY (ID_Projeto) REFERENCES PROJETO(ID_Projeto)
);

-- Criação da tabela DOACAO (FKs: ID_Doador, ID_Projeto)
CREATE TABLE DOACAO (
    ID_Doacao INT PRIMARY KEY AUTO_INCREMENT,
    ID_Doador INT NOT NULL,
    ID_Projeto INT NOT NULL,
    Valor DECIMAL(10, 2) NOT NULL,
    Data_Doacao DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ID_Doador) REFERENCES DOADOR(ID_Doador),
    FOREIGN KEY (ID_Projeto) REFERENCES PROJETO(ID_Projeto)
);

-- Criação da tabela REGISTRO_HORAS (FKs: ID_Voluntario, ID_Vaga)
CREATE TABLE REGISTRO_HORAS (
    ID_Registro INT PRIMARY KEY AUTO_INCREMENT,
    ID_Voluntario INT NOT NULL,
    ID_Vaga INT NOT NULL,
    Data_Trabalho DATE NOT NULL,
    Horas_Registradas DECIMAL(4, 2) NOT NULL,
    FOREIGN KEY (ID_Voluntario) REFERENCES VOLUNTARIO(ID_Voluntario),
    FOREIGN KEY (ID_Vaga) REFERENCES VAGA_VOLUNTARIADO(ID_Vaga)
);

-- Criação da Tabela Associativa VOLUNTARIO_HABILIDADE (Resolução N:M)
CREATE TABLE VOLUNTARIO_HABILIDADE (
    ID_Voluntario INT NOT NULL,
    ID_Habilidade INT NOT NULL,
    PRIMARY KEY (ID_Voluntario, ID_Habilidade), -- Chave Composta
    FOREIGN KEY (ID_Voluntario) REFERENCES VOLUNTARIO(ID_Voluntario),
    FOREIGN KEY (ID_Habilidade) REFERENCES HABILIDADE(ID_Habilidade)
);
