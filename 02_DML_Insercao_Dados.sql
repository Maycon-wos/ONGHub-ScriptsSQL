-- 1. INSERTS em Tabelas Base
INSERT INTO ONG (Nome_Fantasia, CNPJ, Email, Endereco, Status_Aprovacao) VALUES
('Amigos do Amanhã', '11.222.333/0001-44', 'contato@amigos.org', 'Rua A, 100', 'Aprovado'),
('Abrigo Esperança', '44.555.666/0001-77', 'abrigo@esperanca.org', 'Av B, 200', 'Aprovado'),
('Patas Felizes', '77.888.999/0001-00', 'patas@felizes.org', 'Rua C, 300', 'Pendente');

INSERT INTO DOADOR (Nome_RazaoSocial, Tipo, Email) VALUES
('Carlos Silva', 'PF', 'carlos.s@email.com'),
('Empresa Beta S.A.', 'PJ', 'contato@beta.com'),
('Ana Paula Souza', 'PF', 'ana.paula@email.com');

INSERT INTO VOLUNTARIO (Nome, CPF, Email, Telefone) VALUES
('Joana Darc', '123.456.789-01', 'joana.d@email.com', '9999-1111'),
('Pedro Alvares', '987.654.321-02', 'pedro.a@email.com', '8888-2222'),
('Maria Clara', '111.222.333-03', 'maria.c@email.com', '7777-3333');

INSERT INTO HABILIDADE (Nome_Habilidade) VALUES
('Marketing Digital'),
('Desenvolvimento Web'),
('Organização de Eventos'),
('Cuidado Animal');

-- 2. INSERTS em Tabelas Dependentes (PROJETO)
-- ONG 1: Amigos do Amanhã
INSERT INTO PROJETO (ID_ONG, Titulo, Meta_Financeira, Data_Inicio, Status) VALUES
(1, 'Campanha de Agasalhos 2024', 5000.00, '2024-05-01', 'Ativo'),
(1, 'Reforma da Sede', 25000.00, '2024-01-15', 'Concluído');

-- ONG 2: Abrigo Esperança
INSERT INTO PROJETO (ID_ONG, Titulo, Meta_Financeira, Data_Inicio, Status) VALUES
(2, 'Alimentação para 100 Idosos', 10000.00, '2024-06-10', 'Ativo');

-- 3. INSERTS em VAGA_VOLUNTARIADO
-- Vaga para Projeto 1 (Campanha de Agasalhos)
INSERT INTO VAGA_VOLUNTARIADO (ID_Projeto, Titulo, Descricao_Requisitos, Carga_Horaria_Estimada) VALUES
(1, 'Coletor de Doações', 'Requer veículo próprio e disponibilidade nos finais de semana.', 20),
(1, 'Organizador de Estoque', 'Habilidade em classificação e organização.', 15);

-- Vaga para Projeto 3 (Alimentação Idosos)
INSERT INTO VAGA_VOLUNTARIADO (ID_Projeto, Titulo, Descricao_Requisitos, Carga_Horaria_Estimada) VALUES
(3, 'Cozinheiro Auxiliar', 'Desejável experiência em cozinha industrial.', 10);

-- 4. INSERTS em DOACAO
INSERT INTO DOACAO (ID_Doador, ID_Projeto, Valor, Data_Doacao) VALUES
(1, 1, 150.00, '2024-05-10'), -- Carlos doa para Projeto 1
(2, 3, 5000.00, '2024-06-15'), -- Empresa Beta doa para Projeto 3
(3, 1, 50.00, '2024-05-12'), -- Ana Paula doa para Projeto 1
(1, 2, 200.00, '2024-02-01'); -- Carlos doa para Projeto 2

-- 5. INSERTS em VOLUNTARIO_HABILIDADE (Associação N:M)
INSERT INTO VOLUNTARIO_HABILIDADE (ID_Voluntario, ID_Habilidade) VALUES
(1, 1), -- Joana: Marketing Digital
(1, 3), -- Joana: Organização de Eventos
(2, 2), -- Pedro: Desenvolvimento Web
(3, 4), -- Maria: Cuidado Animal
(3, 3); -- Maria: Organização de Eventos

-- 6. INSERTS em REGISTRO_HORAS
INSERT INTO REGISTRO_HORAS (ID_Voluntario, ID_Vaga, Data_Trabalho, Horas_Registradas) VALUES
(1, 2, '2024-05-20', 4.00), -- Joana registra horas na Vaga 2
(3, 3, '2024-06-12', 5.50), -- Maria registra horas na Vaga 3
(3, 3, '2024-06-13', 4.00); -- Maria registra mais horas na Vaga 3
