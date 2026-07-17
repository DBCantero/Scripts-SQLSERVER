# Introdução ao SQL Server 🗄️

Este repositório contém exemplos básicos de SQL para iniciantes. O **SQL Server** é um sistema de gerenciamento de banco de dados desenvolvido pela Microsoft.

## Criando um banco de dados

```sql
CREATE DATABASE Loja;
```

Selecionando o banco criado:

```sql
USE Loja;
```

## Criando uma tabela

```sql
CREATE TABLE Clientes (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(100) NOT NULL,
    Email VARCHAR(150),
    Idade INT
);
```

- `PRIMARY KEY`: identifica cada registro.
- `IDENTITY(1,1)`: gera números automaticamente.
- `NOT NULL`: torna o preenchimento obrigatório.
- `VARCHAR`: armazena textos.
- `INT`: armazena números inteiros.

## Inserindo dados

```sql
INSERT INTO Clientes (Nome, Email, Idade)
VALUES ('Maria Silva', 'maria@email.com', 25);
```

## Consultando dados

Todos os clientes:

```sql
SELECT * FROM Clientes;
```

Apenas algumas colunas:

```sql
SELECT Nome, Email
FROM Clientes;
```

Aplicando um filtro:

```sql
SELECT *
FROM Clientes
WHERE Idade >= 18;
```

## Ordenando resultados

```sql
SELECT *
FROM Clientes
ORDER BY Nome ASC;
```

- `ASC`: ordem crescente.
- `DESC`: ordem decrescente.

## Atualizando dados

```sql
UPDATE Clientes
SET Email = 'novoemail@email.com'
WHERE Id = 1;
```

> ⚠️ É importante utilizar `WHERE`. Sem ele, todos os registros podem ser alterados.

## Excluindo dados

```sql
DELETE FROM Clientes
WHERE Id = 1;
```

> ⚠️ Sem o `WHERE`, todos os registros da tabela serão excluídos.

## Contando registros

```sql
SELECT COUNT(*) AS TotalClientes
FROM Clientes;
```

## Agrupando dados

```sql
SELECT Idade, COUNT(*) AS Quantidade
FROM Clientes
GROUP BY Idade;
```

## Relacionando tabelas com JOIN

```sql
SELECT Clientes.Nome, Pedidos.Valor
FROM Clientes
INNER JOIN Pedidos
    ON Clientes.Id = Pedidos.ClienteId;
```

O `INNER JOIN` retorna os registros que possuem correspondência nas duas tabelas.

## Principais comandos

| Comando | Função |
|---|---|
| `CREATE` | Cria bancos de dados e tabelas |
| `INSERT` | Insere novos registros |
| `SELECT` | Consulta os dados |
| `UPDATE` | Atualiza registros |
| `DELETE` | Exclui registros |
| `WHERE` | Aplica filtros |
| `ORDER BY` | Ordena os resultados |
| `GROUP BY` | Agrupa registros |
| `JOIN` | Relaciona tabelas |

## Conclusão

Estes são alguns dos principais comandos utilizados no SQL Server. Este projeto foi criado para registrar meus estudos e minha evolução em banco de dados. 🚀

---

Feito com dedicação, café e alguns `SELECT *` ☕😄
