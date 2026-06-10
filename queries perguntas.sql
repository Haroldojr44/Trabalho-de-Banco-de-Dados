-- ============================================================
-- QUERIES PARA RESPONDER AS 10 PERGUNTAS
-- Modelo: Controle de Projetos
-- ============================================================


-- ============================================================
-- PERGUNTA A
-- Quais projetos de Engenharia estão com status
-- "Em Andamento", "Concluído" ou "Atrasado"?
-- ============================================================
-- EXPLICAÇÃO:
-- Filtramos diretamente na tabela Projetos pelo campo "area"
-- usando LIKE 'Engenharia%' para capturar todos os tipos de
-- engenharia, e pelo campo "status" com IN para os três valores.
-- Ordenamos por status e nome do projeto.
-- ============================================================

CREATE OR REPLACE VIEW vw_projetos_engenharia_status AS
SELECT
    p.id_projetos,
    p.nome_projeto,
    p.area,
    p.status,
    p.prazo_inicio,
    p.prazo_final,
    p.finalizado,
    g.nome AS gerente_responsavel
FROM Projetos p
JOIN Gerentes g ON g.id_gerentes = p.id_gerentes
WHERE p.area LIKE 'Engenharia%'
  AND p.status IN ('Em Andamento', 'Concluído', 'Atrasado')
ORDER BY p.status, p.nome_projeto;

-- Consulta da view:
SELECT * FROM vw_projetos_engenharia_status;


-- ============================================================
-- PERGUNTA B
-- Quantos e quais projetos de Eng. da Computação, Eng. Civil
-- e Eng. Elétrica possuem o maior % de tarefas concluídas
-- nos últimos 5 anos?
-- ============================================================
-- EXPLICAÇÃO:
-- Fazemos JOIN entre Projetos e Tarefas para contar o total
-- de tarefas e as tarefas concluídas por projeto.
-- Calculamos o percentual com ROUND(concluidas/total * 100).
-- Filtramos os projetos iniciados nos últimos 5 anos e
-- somente as 3 áreas solicitadas.
-- Ordenamos pelo percentual decrescente.
-- ============================================================

CREATE OR REPLACE VIEW vw_percentual_tarefas_concluidas AS
SELECT
    p.id_projetos,
    p.nome_projeto,
    p.area,
    COUNT(t.id_tarefas)                                         AS total_tarefas,
    SUM(CASE WHEN t.status = 'Concluído' THEN 1 ELSE 0 END)    AS tarefas_concluidas,
    ROUND(
        SUM(CASE WHEN t.status = 'Concluído' THEN 1 ELSE 0 END)
        / COUNT(t.id_tarefas) * 100, 2
    )                                                           AS percentual_concluido
FROM Projetos p
JOIN Tarefas t ON t.id_projetos = p.id_projetos
WHERE p.area IN (
    'Engenharia da Computação',
    'Engenharia Civil',
    'Engenharia Elétrica'
)
  AND p.prazo_inicio >= DATE_SUB(CURDATE(), INTERVAL 5 YEAR)
GROUP BY p.id_projetos, p.nome_projeto, p.area
ORDER BY percentual_concluido DESC;

-- Consulta da view:
SELECT * FROM vw_percentual_tarefas_concluidas;

-- Versão com contagem por área:
SELECT
    area,
    COUNT(*) AS quantidade_projetos
FROM vw_percentual_tarefas_concluidas
GROUP BY area;


-- ============================================================
-- PERGUNTA C
-- Quais colaboradores do gênero masculino, engenheiros,
-- alocados em mais de 1 projeto nos últimos 120 dias
-- e quais projetos são esses?
-- ============================================================
-- EXPLICAÇÃO:
-- Filtramos colaboradores do gênero 'M' via Colaboradores.
-- Verificamos se têm formação em Engenharia via Qualificacoes
--   (tipo = 'formacao' e descricao LIKE 'Engenharia%').
-- Cruzamos com Colaboradores_Projetos filtrando pelo intervalo
--   de 120 dias: data_entrada <= CURDATE() e (data_saida IS NULL
--   OR data_saida >= DATE_SUB(CURDATE(), INTERVAL 120 DAY)).
-- Agrupamos por colaborador e usamos HAVING COUNT > 1 para
--   garantir que estão em mais de um projeto.
-- O segundo SELECT detalha cada projeto desses colaboradores.
-- ============================================================

CREATE OR REPLACE VIEW vw_engenheiros_multiplos_projetos AS
SELECT
    c.id_colaboradores,
    c.nome                          AS colaborador,
    c.genero,
    COUNT(DISTINCT cp.id_projetos)  AS quantidade_projetos
FROM Colaboradores c
JOIN Qualificacoes q
    ON q.id_colaboradores = c.id_colaboradores
    AND q.tipo = 'formacao'
    AND q.descricao LIKE 'Engenharia%'
JOIN Colaboradores_Projetos cp
    ON cp.id_colaboradores = c.id_colaboradores
    AND cp.data_entrada <= CURDATE()
    AND (cp.data_saida IS NULL
         OR cp.data_saida >= DATE_SUB(CURDATE(), INTERVAL 120 DAY))
WHERE c.genero = 'M'
GROUP BY c.id_colaboradores, c.nome, c.genero
HAVING COUNT(DISTINCT cp.id_projetos) > 1
ORDER BY quantidade_projetos DESC;

-- Consulta da view:
SELECT * FROM vw_engenheiros_multiplos_projetos;

-- Detalhe: quais projetos cada um está alocado:
SELECT
    c.nome          AS colaborador,
    p.nome_projeto,
    p.area,
    p.status,
    cp.data_entrada,
    cp.data_saida
FROM vw_engenheiros_multiplos_projetos v
JOIN Colaboradores c
    ON c.id_colaboradores = v.id_colaboradores
JOIN Colaboradores_Projetos cp
    ON cp.id_colaboradores = c.id_colaboradores
    AND cp.data_entrada <= CURDATE()
    AND (cp.data_saida IS NULL
         OR cp.data_saida >= DATE_SUB(CURDATE(), INTERVAL 120 DAY))
JOIN Projetos p
    ON p.id_projetos = cp.id_projetos
ORDER BY c.nome, p.nome_projeto;


-- ============================================================
-- PERGUNTA D
-- Qual é o custo total estimado e real de cada tipo de projeto
-- cadastrado que está sendo realizado em 2026?
-- ============================================================
-- EXPLICAÇÃO:
-- Filtramos projetos cujo prazo_inicio está em 2026 ou cujo
-- prazo_final está em 2026 (projeto ativo durante 2026), usando
-- YEAR() para extrair o ano. Também garantimos que o projeto
-- não foi finalizado antes de 2026.
-- Agrupamos por area e somamos custo_estimado e custo_real.
-- ============================================================

CREATE OR REPLACE VIEW vw_custos_projetos_2026 AS
SELECT
    p.area                          AS tipo_projeto,
    COUNT(p.id_projetos)            AS quantidade_projetos,
    SUM(p.custo_estimado)           AS total_estimado,
    SUM(p.custo_real)               AS total_real,
    SUM(p.custo_real)
        - SUM(p.custo_estimado)     AS diferenca
FROM Projetos p
WHERE (
    YEAR(p.prazo_inicio) = 2026
    OR YEAR(p.prazo_final) = 2026
    OR (p.prazo_inicio <= '2026-12-31' AND (p.prazo_final >= '2026-01-01' OR p.prazo_final IS NULL))
)
  AND (p.finalizado IS NULL OR YEAR(p.finalizado) >= 2026)
GROUP BY p.area
ORDER BY total_real DESC;

-- Consulta da view:
SELECT * FROM vw_custos_projetos_2026;


-- ============================================================
-- PERGUNTA E
-- Quais tarefas estão com prazo vencido e ainda não finalizadas?
-- ============================================================
-- EXPLICAÇÃO:
-- Filtramos tarefas onde prazo_fim < CURDATE() (prazo já passou)
-- e finalizado IS NULL (não foi concluída).
-- Fazemos JOIN com Projetos para trazer o nome e área do projeto.
-- Calculamos os dias de atraso com DATEDIFF.
-- ============================================================

CREATE OR REPLACE VIEW vw_tarefas_atrasadas AS
SELECT
    t.id_tarefas,
    t.atividade,
    t.prazo_inicio,
    t.prazo_fim,
    t.status,
    DATEDIFF(CURDATE(), t.prazo_fim)    AS dias_atraso,
    p.nome_projeto,
    p.area,
    p.status                            AS status_projeto
FROM Tarefas t
JOIN Projetos p ON p.id_projetos = t.id_projetos
WHERE t.prazo_fim < CURDATE()
  AND t.finalizado IS NULL
ORDER BY dias_atraso DESC;

-- Consulta da view:
SELECT * FROM vw_tarefas_atrasadas;

-- Agrupado por projeto:
SELECT
    nome_projeto,
    area,
    COUNT(*) AS tarefas_atrasadas,
    MAX(dias_atraso) AS maior_atraso_dias
FROM vw_tarefas_atrasadas
GROUP BY nome_projeto, area
ORDER BY tarefas_atrasadas DESC;


-- ============================================================
-- PERGUNTA F
-- Quais e quantos gerentes são responsáveis pelo maior número
-- de projetos de Eng. Aeronáutica com status ativo atualmente?
-- ============================================================
-- EXPLICAÇÃO:
-- Filtramos projetos de Engenharia Aeronáutica com status
-- "Em Andamento" (considerado "ativo").
-- Fazemos JOIN com Gerentes para trazer o nome.
-- Agrupamos por gerente e contamos os projetos.
-- Ordenamos decrescente — os primeiros são os com mais projetos.
-- ============================================================

CREATE OR REPLACE VIEW vw_gerentes_aeronautica_ativos AS
SELECT
    g.id_gerentes,
    g.nome              AS gerente,
    g.genero,
    COUNT(p.id_projetos) AS total_projetos_ativos
FROM Gerentes g
JOIN Projetos p
    ON p.id_gerentes = g.id_gerentes
    AND p.area = 'Engenharia Aeronáutica'
    AND p.status = 'Em Andamento'
GROUP BY g.id_gerentes, g.nome, g.genero
ORDER BY total_projetos_ativos DESC;

-- Consulta da view:
SELECT * FROM vw_gerentes_aeronautica_ativos;

-- Apenas o(s) com maior número:
SELECT *
FROM vw_gerentes_aeronautica_ativos
WHERE total_projetos_ativos = (
    SELECT MAX(total_projetos_ativos)
    FROM vw_gerentes_aeronautica_ativos
);


-- ============================================================
-- PERGUNTA G
-- Qual é o tempo médio de conclusão das tarefas por tipo
-- de projeto nos últimos 10 anos?
-- ============================================================
-- EXPLICAÇÃO:
-- Usamos inicio_real e finalizado para calcular o tempo real
-- de execução de cada tarefa com DATEDIFF.
-- Filtramos apenas tarefas finalizadas (finalizado IS NOT NULL)
-- e com inicio_real preenchido, dentro dos últimos 10 anos.
-- Fazemos JOIN com Projetos para agrupar por área.
-- AVG() calcula a média dos dias de execução por área.
-- ============================================================

CREATE OR REPLACE VIEW vw_tempo_medio_conclusao AS
SELECT
    p.area                                          AS tipo_projeto,
    COUNT(t.id_tarefas)                             AS total_tarefas_analisadas,
    ROUND(AVG(DATEDIFF(t.finalizado, t.inicio_real)), 1)
                                                    AS media_dias_conclusao,
    MIN(DATEDIFF(t.finalizado, t.inicio_real))      AS min_dias,
    MAX(DATEDIFF(t.finalizado, t.inicio_real))      AS max_dias
FROM Tarefas t
JOIN Projetos p ON p.id_projetos = t.id_projetos
WHERE t.finalizado IS NOT NULL
  AND t.inicio_real IS NOT NULL
  AND t.inicio_real >= DATE_SUB(CURDATE(), INTERVAL 10 YEAR)
GROUP BY p.area
ORDER BY media_dias_conclusao DESC;

-- Consulta da view:
SELECT * FROM vw_tempo_medio_conclusao;


-- ============================================================
-- PERGUNTA H
-- Quais departamentos estão envolvidos em cada tipo de projeto
-- nos últimos 180 dias e com quantos membros em cada um?
-- ============================================================
-- EXPLICAÇÃO:
-- Partimos de Projetos_Departamentos para saber quais
-- departamentos estão vinculados a cada projeto.
-- JOIN com Colaboradores_Projetos filtrando pelos 180 dias
--   (data_entrada <= CURDATE() e data_saida IS NULL ou recente).
-- JOIN com Colaboradores para vincular ao departamento correto.
-- Agrupamos por área do projeto e departamento,
-- contando colaboradores distintos.
-- ============================================================

CREATE OR REPLACE VIEW vw_departamentos_projetos_180dias AS
SELECT
    p.area                              AS tipo_projeto,
    d.nome                              AS departamento,
    COUNT(DISTINCT c.id_colaboradores)  AS total_membros
FROM Projetos p
JOIN Projetos_Departamentos pd
    ON pd.Projetos_id_projetos = p.id_projetos
JOIN Departamentos d
    ON d.id_departamentos = pd.Departamentos_id_departamentos
JOIN Colaboradores_Projetos cp
    ON cp.id_projetos = p.id_projetos
    AND cp.data_entrada <= CURDATE()
    AND (cp.data_saida IS NULL
         OR cp.data_saida >= DATE_SUB(CURDATE(), INTERVAL 180 DAY))
JOIN Colaboradores c
    ON c.id_colaboradores = cp.id_colaboradores
    AND c.id_departamentos = d.id_departamentos
GROUP BY p.area, d.nome
ORDER BY p.area, total_membros DESC;

-- Consulta da view:
SELECT * FROM vw_departamentos_projetos_180dias;


-- ============================================================
-- PERGUNTA I
-- Quais e quantos projetos de Engenharia consumiram mais
-- recursos financeiros no último trimestre?
-- ============================================================
-- EXPLICAÇÃO:
-- Usamos a tabela Lancamentos filtrando pelo campo "data"
-- dentro do último trimestre (últimos 90 dias) e tipo = 'real'
-- (custo efetivamente realizado).
-- JOIN com Projetos para trazer nome e área.
-- Filtramos área LIKE 'Engenharia%'.
-- Agrupamos por projeto e ordenamos pelo total consumido.
-- ============================================================

CREATE OR REPLACE VIEW vw_recursos_ultimo_trimestre AS
SELECT
    p.id_projetos,
    p.nome_projeto,
    p.area,
    p.status,
    COUNT(l.id_lancamentos)     AS total_lancamentos,
    SUM(l.valor)                AS total_consumido
FROM Lancamentos l
JOIN Projetos p ON p.id_projetos = l.id_projetos
WHERE l.tipo = 'real'
  AND l.data >= DATE_SUB(CURDATE(), INTERVAL 90 DAY)
  AND p.area LIKE 'Engenharia%'
GROUP BY p.id_projetos, p.nome_projeto, p.area, p.status
ORDER BY total_consumido DESC;

-- Consulta da view:
SELECT * FROM vw_recursos_ultimo_trimestre;

-- Contagem por área:
SELECT
    area,
    COUNT(*) AS quantidade_projetos,
    SUM(total_consumido) AS total_geral
FROM vw_recursos_ultimo_trimestre
GROUP BY area
ORDER BY total_geral DESC;


-- ============================================================
-- PERGUNTA J
-- Quais colaboradores com especialização em "Gestão de Projetos"
-- registraram maior carga horária semanal, mensal e anual
-- em projetos de Eng. Civil nos últimos 2 meses?
-- ============================================================
-- EXPLICAÇÃO:
-- Filtramos colaboradores com especialização em Gestão de Projetos
-- via Qualificacoes (tipo = 'especializacao').
-- JOIN com Apontamentos para somar horas por colaborador.
-- JOIN com Projetos filtrando area = 'Engenharia Civil'.
-- Filtramos apontamentos dos últimos 2 meses.
-- Calculamos três granularidades usando GROUP BY diferente:
--   Semanal: YEARWEEK(data)
--   Mensal:  DATE_FORMAT(data, '%Y-%m')
--   Anual:   YEAR(data)
-- Em cada uma, usamos ORDER BY + LIMIT para trazer o topo.
-- ============================================================

-- CARGA SEMANAL
CREATE OR REPLACE VIEW vw_carga_semanal_gestao_civil AS
SELECT
    c.id_colaboradores,
    c.nome                              AS colaborador,
    YEARWEEK(a.data, 1)                 AS ano_semana,
    STR_TO_DATE(
        CONCAT(YEARWEEK(a.data, 1), ' Monday'),
        '%X%V %W'
    )                                   AS inicio_semana,
    ROUND(SUM(a.horas_trabalhadas), 2)  AS total_horas_semana
FROM Apontamentos a
JOIN Colaboradores c
    ON c.id_colaboradores = a.id_colaboradores
JOIN Qualificacoes q
    ON q.id_colaboradores = c.id_colaboradores
    AND q.tipo = 'especializacao'
    AND q.descricao = 'Gestão de Projetos'
JOIN Projetos p
    ON p.id_projetos = a.id_projetos
    AND p.area = 'Engenharia Civil'
WHERE a.data >= DATE_SUB(CURDATE(), INTERVAL 2 MONTH)
GROUP BY c.id_colaboradores, c.nome, YEARWEEK(a.data, 1)
ORDER BY total_horas_semana DESC;

-- Consulta: top semanal
SELECT * FROM vw_carga_semanal_gestao_civil LIMIT 10;

-- CARGA MENSAL
CREATE OR REPLACE VIEW vw_carga_mensal_gestao_civil AS
SELECT
    c.id_colaboradores,
    c.nome                              AS colaborador,
    DATE_FORMAT(a.data, '%Y-%m')        AS mes,
    ROUND(SUM(a.horas_trabalhadas), 2)  AS total_horas_mes
FROM Apontamentos a
JOIN Colaboradores c
    ON c.id_colaboradores = a.id_colaboradores
JOIN Qualificacoes q
    ON q.id_colaboradores = c.id_colaboradores
    AND q.tipo = 'especializacao'
    AND q.descricao = 'Gestão de Projetos'
JOIN Projetos p
    ON p.id_projetos = a.id_projetos
    AND p.area = 'Engenharia Civil'
WHERE a.data >= DATE_SUB(CURDATE(), INTERVAL 2 MONTH)
GROUP BY c.id_colaboradores, c.nome, DATE_FORMAT(a.data, '%Y-%m')
ORDER BY total_horas_mes DESC;

-- Consulta: top mensal
SELECT * FROM vw_carga_mensal_gestao_civil LIMIT 10;

-- CARGA ANUAL (últimos 12 meses para completar o contexto anual)
CREATE OR REPLACE VIEW vw_carga_anual_gestao_civil AS
SELECT
    c.id_colaboradores,
    c.nome                              AS colaborador,
    YEAR(a.data)                        AS ano,
    ROUND(SUM(a.horas_trabalhadas), 2)  AS total_horas_ano
FROM Apontamentos a
JOIN Colaboradores c
    ON c.id_colaboradores = a.id_colaboradores
JOIN Qualificacoes q
    ON q.id_colaboradores = c.id_colaboradores
    AND q.tipo = 'especializacao'
    AND q.descricao = 'Gestão de Projetos'
JOIN Projetos p
    ON p.id_projetos = a.id_projetos
    AND p.area = 'Engenharia Civil'
WHERE a.data >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
GROUP BY c.id_colaboradores, c.nome, YEAR(a.data)
ORDER BY total_horas_ano DESC;

-- Consulta: top anual
SELECT * FROM vw_carga_anual_gestao_civil LIMIT 10;
