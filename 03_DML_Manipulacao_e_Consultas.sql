-- ===============================================
-- CONSULTAS (SELECT)
-- ===============================================

-- Consulta 1: Listar o título de todos os projetos ativos junto com o nome da ONG responsável. (JOIN)
SELECT
    P.Titulo AS Projeto,
    O.Nome_Fantasia AS ONG_Responsavel,
    P.Meta_Financeira
FROM PROJETO P
JOIN ONG O ON P.ID_ONG = O.ID_ONG
WHERE P.Status = 'Ativo'
ORDER BY O.Nome_Fantasia;

-- Consulta 2: Calcular o valor total arrecadado por doador. (JOIN, GROUP BY, SUM)
SELECT
    D.Nome_RazaoSocial AS Doador,
    SUM(DOA.Valor) AS Total_Doado
FROM DOADOR D
JOIN DOACAO DOA ON D.ID_Doador = DOA.ID_Doador
GROUP BY D.Nome_RazaoSocial
ORDER BY Total_Doado DESC;

-- Consulta 3: Encontrar o nome dos voluntários que possuem a habilidade 'Organização de Eventos'. (Múltiplos JOINs na Tabela Associativa)
SELECT
    V.Nome AS Voluntario,
    H.Nome_Habilidade
FROM VOLUNTARIO V
JOIN VOLUNTARIO_HABILIDADE VH ON V.ID_Voluntario = VH.ID_Voluntario
JOIN HABILIDADE H ON VH.ID_Habilidade = H.ID_Habilidade
WHERE H.Nome_Habilidade = 'Organização de Eventos';

-- Consulta 4: Listar todas as vagas com carga horária estimada inferior a 15 horas. (WHERE, ORDER BY)
SELECT
    Titulo,
    Carga_Horaria_Estimada,
    ID_Projeto
FROM VAGA_VOLUNTARIADO
WHERE Carga_Horaria_Estimada < 15
ORDER BY ID_Projeto DESC;

-- ===============================================
-- MANIPULAÇÃO (UPDATE)
-- ===============================================

-- UPDATE 1: Aumentar a meta financeira do Projeto 3 (Alimentação para 100 Idosos) em 20%.
UPDATE PROJETO
SET Meta_Financeira = Meta_Financeira * 1.20
WHERE ID_Projeto = 3;

-- UPDATE 2: Corrigir o status da ONG 'Patas Felizes' de 'Pendente' para 'Aprovado'.
UPDATE ONG
SET Status_Aprovacao = 'Aprovado'
WHERE Nome_Fantasia = 'Patas Felizes';

-- UPDATE 3: Corrigir o email do Voluntário 'Pedro Alvares'.
UPDATE VOLUNTARIO
SET Email = 'pedro.alvares@novoemail.com'
WHERE Nome = 'Pedro Alvares';

-- ===============================================
-- MANIPULAÇÃO (DELETE)
-- ===============================================

-- DELETE 1: Remover o registro de horas mais antigo da Maria Clara (ID_Registro 2).
DELETE FROM REGISTRO_HORAS
WHERE ID_Registro = 2;

-- DELETE 2: Remover a associação do voluntário Joana Darc com a habilidade 'Marketing Digital'.
DELETE FROM VOLUNTARIO_HABILIDADE
WHERE ID_Voluntario = 1 AND ID_Habilidade = 1;

-- DELETE 3: Remover a doação de menor valor (R$ 50.00) feita pela Ana Paula Souza.
-- (Assumindo que ID_Doacao 3 corresponde a esta doação)
DELETE FROM DOACAO
WHERE ID_Doacao = 3 AND Valor = 50.00;
