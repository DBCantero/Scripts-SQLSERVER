CREATE OR ALTER PROCEDURE dbo.SP_CHAMADOS_FECHADOS_ANALISTA
    @DATA DATE
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @DATA_FORMATADA CHAR(8);

    SET @DATA_FORMATADA = CONVERT(CHAR(8), @DATA, 112);

    SELECT
        SUM(CHAMADO) AS CHAMADO,
        ANALISTA
    FROM
    (
        SELECT
            COUNT(*) AS CHAMADO,
            CASE
                WHEN LTRIM(RTRIM(operator_name)) = 'Analista1' 
                    THEN 'Analista.1'
                ELSE LTRIM(RTRIM(operator_name))
            END AS ANALISTA
        FROM dbo.TOMTICKET_CHAMADOS
        WHERE data_finalizacao = @DATA_FORMATADA
        GROUP BY operator_name

        UNION ALL

        SELECT
            COUNT(*) AS CHAMADO,
            CASE
                WHEN LTRIM(RTRIM(REPLACE(responsavel_nome, 'SMS - ', ''))) = 'Analista2'
                    THEN 'Analista.2'
                ELSE LTRIM(RTRIM(REPLACE(responsavel_nome, 'SMS - ', '')))
            END AS ANALISTA
        FROM dbo.SULTS_CHAMADOS
        WHERE data_finalizacao = @DATA_FORMATADA
          AND responsavel_nome LIKE 'SMS%'
        GROUP BY responsavel_nome
    ) X
    GROUP BY ANALISTA
    ORDER BY CHAMADO DESC;

END;
GO