# 🏛️ ONGHUB - Modelagem e Implementação de Banco de Dados

Este repositório contém os scripts SQL desenvolvidos para a **Experiência Prática 4**, com base no Modelo Lógico (DER) do minimundo ONGHUB. O modelo foi normalizado até a 3ª Forma Normal (3FN).

## 🚀 Como Executar os Scripts

Este banco de dados foi projetado para ser executado em um SGBD Relacional (Recomendamos MySQL ou PostgreSQL).

### Pré-requisitos
* Um SGBD instalado (MySQL, PostgreSQL etc.).
* Uma ferramenta de administração (MySQL Workbench ou PgAdmin).

### Passos de Execução

1.  **Criação do Banco de Dados:** Crie um novo banco de dados vazio (ex: `CREATE DATABASE onghub_db;`).
2.  **Criação das Tabelas (DDL):** Execute o script `01_DDL_Criacao_Tabelas.sql`. Ele criará todas as 9 tabelas com suas respectivas Chaves Primárias, Chaves Estrangeiras e restrições de unicidade.
3.  **Inserção de Dados (DML):** Execute o script `02_DML_Insercao_Dados.sql` para popular as tabelas com dados de teste, respeitando a ordem das Chaves Estrangeiras.
4.  **Consultas e Manipulação (DML):** Execute o script `03_DML_Manipulacao_e_Consultas.sql` em partes, observando os resultados das consultas (`SELECT`) e os efeitos dos comandos de manipulação (`UPDATE` e `DELETE`).

## 📚 Scripts Inclusos

* **`01_DDL_Criacao_Tabelas.sql`**: Define a estrutura das tabelas e a integridade referencial.
* **`02_DML_Insercao_Dados.sql`**: Povoa o banco com dados de teste. (Item obrigatório: comandos INSERT).
* **`03_DML_Manipulacao_e_Consultas.sql`**: Contém as consultas complexas e a manipulação de dados. (Itens obrigatórios: comandos SELECT, UPDATE e DELETE).

ONGHUB-BD/
├── README.md
├── 01_DDL_Criacao_Tabelas.sql
├── 02_DML_Insercao_Dados.sql
└── 03_DML_Manipulacao_e_Consultas.sql
