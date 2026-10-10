1) Crie uma tabela chamada funcionarios com as seguintes colunas: id (int, chave primária), nome (varchar(100)), departamento (varchar(100)) e salario (float). Em seguida, insira os seguintes registros de funcionários na tabela:

ID: 1, Nome: Heitor Vieira, Departamento: Financeiro, Salário: 4959.22
ID: 2, Nome: Daniel Campos, Departamento: Vendas, Salário: 3884.44
ID: 3, Nome: Luiza Dias, Departamento: TI, Salário: 8205.78
ID: 4, Nome: Davi Lucas Moraes, Departamento: Financeiro, Salário: 8437.02
ID: 5, Nome: Pietro Cavalcanti, Departamento: TI, Salário: 4946.88
ID: 6, Nome: Evelyn da Mata, Departamento: Vendas, Salário: 5278.88
ID: 7, Nome: Isabella Rocha, Departamento: Marketing, Salário: 4006.03
ID: 8, Nome: Sra. Manuela Azevedo, Departamento: Vendas, Salário: 6101.88
ID: 9, Nome: Brenda Cardoso, Departamento: TI, Salário: 8853.34
ID: 10, Nome: Danilo Souza, Departamento: TI, Salário: 8242.14



CREATE TABLE funcionarios (
ID INT,
NOME VARCHAR(100),
DEPARTAMENTO VARCHAR(100),
SALARIO NUMERIC(19,2)
);

INSERT INTO funcionarios (ID,NOME,DEPARTAMENTO,SALARIO) VALUES
(1,'Heitor Vieira','Financeiro',4959.22),
(2,'Daniel Campos','Vendas',3884.44),
(3,'Luiza Dias','TI',8205.78),
(4,'Davi Lucas Moraes','Financeiro',8437.02),
(5,'Pietro Cavalcanti','TI',4946.88),
(6, 'Evelyn da Mata','Vendas',5278.88),
(7,'Isabella Rocha','Marketing',4006.03),
(8,'Sra. Manuela Azevedo','Vendas',6101.88),
(9,'Brenda Cardoso','TI',8853.34),
(10,'Danilo Souza','TI',8242.14);

2) Selecione todos os campos de todos os registros na tabela funcionarios.

SELECT * FROM funcionarios;

3) Na tabela funcionarios, selecione os nomes dos funcionários que trabalham no departamento de "Vendas".

SELECT NOME from funcionarios WHERE DEPARTAMENTO = 'Vendas';


4) Selecione os funcionários da tabela funcionarios cujo salário seja maior que 5000.

SELECT * from funcionarios WHERE SALARIO > 5000;


5) Na tabela funcionarios, selecione todos os departamentos distintos.

SELECT DISTINCT(DEPARTAMENTO) from funcionarios ;


6) Atualize o salário dos funcionários do departamento de "TI" para 7500 na tabela funcionarios.

UPDATE funcionarios
SET SALARIO = 7500
WHERE DEPARTAMENTO = 'TI';

7) Delete da tabela funcionarios todos os registros de funcionários que ganham menos de 4000.

DELETE FROM funcionarios WHERE SALARIO < 4000;

8) Selecione os nomes e salários dos funcionários que trabalham no departamento de "Vendas" e cujo salário seja maior ou igual a 6000.

select NOME,SALARIO FROM funcionarios WHERE DEPARTAMENTO = 'VENDAS' AND SALARIO >= 6000;

9) Crie uma tabela chamada projetos com as colunas: id_projeto (int, chave primária), nome_projeto (varchar(100)), id_gerente (int, referência a id na tabela funcionarios). Insira 3 registros na tabela projetos e, em seguida, selecione todos os projetos cujo id_gerente seja igual a 2.

CREATE TABLE projetos (
id_projeto INT PRIMARY KEY,
nome_projeto VARCHAR(100),
id_gerente INT,
FOREIGN KEY (ID) REFERENCES funcionarios(ID)
);


INSERT INTO projetos (id_projeto,nome_projeto,id_gerente) VALUES
(1,'NIMBY',2),
(2,'RH VALE',1),
(3,'KYYLE',2);

SELECT * FROM projetos WHERE id_gerente = 2;


10) Remova a tabela funcionarios do banco de dados.

DROP TABLE funcionarios;


--------------------------------------------------------------------------------------------------------------------------------------------------------------------

# HORA DA PRÁTICA

# Selecione os primeiros 5 registros da tabela clientes, ordenando-os pelo nome em ordem crescente.

SELECT * FROM clientes ORDER BY nome DESC LIMIT 5;


# Encontre todos os produtos na tabela produtos que não têm uma descrição associada (suponha que a coluna de descrição possa ser nula).

SELECT * FROM produtos WHERE descricao IS NULL;


# Liste os funcionários cujo nome começa com 'A' e termina com 's' na tabela funcionarios.

SELECT * FROM funcionarios WHERE nome LIKE UPPER('A%') AND nome LIKE UPPER(s%);


# Exiba o departamento e a média salarial dos funcionários em cada departamento na tabela funcionarios, agrupando por departamento, apenas para os departamentos cuja média salarial é superior a $5000.

SELECT * FROM funcionarios 
WHERE SUM(SALARIO) > 5000
GROUP BY departamento; 


# Selecione todos os clientes da tabela clientes e concatene o primeiro e o último nome, além de calcular o comprimento total do nome completo.

SELECT CONCAT(primeiro_nome, ' ',ultimo_nome) as nome_completo, LENGTH(CONCAT(primeiro_nome, ' ',ultimo_nome)) from CLIENTES ;


# Para cada venda na tabela vendas, exiba o ID da venda, a data da venda e a diferença em dias entre a data da venda e a data atual.

select ID_VENDAS,DATA_VENDA, DATEDIFF(CURRENT_DATE(), DATA_VENDA ) AS DATA_VENDAS FROM vendas;


Selecione todos os itens da tabela pedidos e arredonde o preço total para o número inteiro mais próximo.

SELECT *,
    CEIL(preco_total) as preco_arredondado
    FROM pedidos;

Converta a coluna data_string da tabela eventos, que está em formato de texto (YYYY-MM-DD), para o tipo de data e selecione todos os eventos após '2023-01-01'.

SELECT *,
        STR_TO_DATE(data_string,'%Y-%m-%d') as data_convertidade 
        FROM eventos
WHERE STR_TO_DATE(data_string,'%Y-%m-%d') >= '2023-01-01';

Na tabela avaliacoes, classifique cada avaliação como 'Boa', 'Média', ou 'Ruim' com base na pontuação: 1-3 para 'Ruim', 4-7 para 'Média', e 8-10 para 'Boa'.

SELECT *,
    CASE 
        WHEN avaliacao BETWEEN 1 AND 3 THEN 'RUIM'
        WHEN avaliacao BETWEEN 4 AND 7 THEN 'MÉDIA'
        WHEN avaliacao BETWEEN 8 AND 10 THEN 'BOA'
    END AS classificacao_avaliacao
from avaliacao;


Altere o nome da coluna data_nasc para data_nascimento na tabela funcionarios e selecione todos os funcionários que nasceram após '1990-01-01'.

SELECT 
    *,
    DATA_NASC AS data_nascimento
    FROM funcionarios
    where data_nasc as data_nascimento > '1990-01-01';


Traga todos os dados da cliente Maria Silva.

SELECT * from clientes
where nome_cliente = 'MARIA SILVA';


Busque o ID do pedido e o ID do cliente dos pedidos onde o status esteja como entregue.

SELECT id_pedido, id_cliente
from pedidos
where status = 'entregue';


Retorne todos os produtos onde o preço seja maior que 10 e menor que 15.

SELECT * FROM produtos 
where preco > 10 and preco < 15;

Busque o nome e cargo dos colaboradores que foram contratados entre 2022-01-01 e 2022-06-30.

select
    nome,
    cargo_colaboradores
    from colaboradores
    where data_contratacao between '2022-01-01' and '2022-06-30';



Recupere o nome do cliente que fez o primeiro pedido.

SELECT nome_cliente
FROM pedido
WHERE ID_PEDIDO = 1;


Liste os produtos que nunca foram pedidos.


SELECT * FROM produtos po
JOIN pedidos pe ON po.id_pedido = pe.id_pedido
WHERE po.id_produto IS NULL;


Liste os nomes dos clientes que fizeram pedidos entre 2023-01-01 e 2023-12-31.

SELECT DISTINCT cl.nome_cliente FROM clientes cl
JOIN pedidos pe on cl.id_cliente = pe.id_cliente
WHERE pe.data_pedidos BETWEEN '2023-01-01' and '2023-12-31';


Recupere os nomes dos produtos que estão em menos de 15 pedidos.

SELECT pr.id_produto, pr.nome_produtos, COUNT(*) as qtd 
FROM produtos pr
JOIN pedidos pe ON pr.id_produto = pe.id_produto
GROUP BY pr.id_produto,pr.nome_produtos
HAVING COUNT(*) < 15;


Liste os produtos e o ID do pedido que foram realizados pelo cliente "Pedro Alves" ou pela cliente "Ana Rodrigues".

SELECT DISTINCT 
cl.nome_cliente,
pr.nome_produto,
pe.id_pedido
FROM clientes cl 
JOIN pedido pe ON cl.id_cliente = pe.id_cliente
JOIN produtos pr ON pr.id_produto = pe.id_produto
WHERE cl.nome_cliente = upper('PEDRO ALVES') OR cl.nome_cliente = upper('ANA RODRIGUES');


Recupere o nome e o ID do cliente que mais comprou(valor) no Serenatto.

SELECT DISTINCT 
cl.nome,
cl.id_cliente,
SUM(pe.compra) as total_comprado
FROM cliente cl
JOIN pedidos pe ON cl.id_cliente = pe.id_cliente
GROUP BY 1,2
ORDER BY total_comprado DESC
LIMIT 1;


Desafio
Consulta 1: Buscar o nome do professor e a turma que ele é orientador

SELECT 
pr.nome_professor,
pr.nome_turma,
FROM professor pr
JOIN orientador ori on pr.id_professor = ori.id_professor
JOIN turma tu ON ori.id_turma = tu.id_turma;


Consulta 2: Retornar o nome e a nota do aluno que possui a melhor nota na disciplina de Matemática

SELECT 
al.nome_aluno, 
nota.nomes_nota as nota_matematica
FROM alunos al
JOIN notas nota on al.id_aluno = nota.id_aluno
JOIN disciplina dis on nota.id_disciplina = dis.id_disciplina
WHERE dis.nome_disciplina = upper('MATEMÁTICA')
ORDER BY nota.nomes_nota DESC
limit 1;

Consulta 3: Identificar o total de alunos por turma

SELECT 
tu.nome_turma,
COUNT(*) as quantidade_alunos,
tu.nome_turma from alunos al
JOIN turma tu ON al.id_turma = tu.id_turma
GROUP BY tu.nome_turma;


Consulta 4: Listar os Alunos e as disciplinas em que estão matriculados

SELECT DISTINCT al.nome_aluno,dis.nome_disciplina from 
alunos al
JOIN matriculas mat on al.id_aluno = mat.id_aluno
JOIN disciplina dis on nota.id_disciplina = dis.id_disciplina
WHERE al.ativo = TRUE;


Consulta 5: Criar uma view que apresenta o nome, a disciplina e a nota dos alunos

CREATE OR REPLACE VIEW nome_disciplina_nota AS
SELECT DISTINCT 
    al.nome_aluno,
    dis.nome_disciplina,
    nota.notas 
FROM alunos al
JOIN matriculas mat ON al.id_aluno = mat.id_aluno AND mat.id_disciplina = nota.id_disciplina
JOIN notas nota ON al.id_aluno = nota.id_aluno
JOIN disciplina dis ON nota.id_disciplina = dis.id_disciplina;