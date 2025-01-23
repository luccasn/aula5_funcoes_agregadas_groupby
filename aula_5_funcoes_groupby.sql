--funções agregadas
--count
--sum
--min
--max
--avg

--ex contagem de todas as linhas de uma tabela
--conte todas as visitas ao site da empresa

select count (*) 
from sales.funnel

-- ex2 contagem das linhas de uma coluna
--conte todos os pagamentos registrados na tabea sales.funnel

select *
from sales.funnel
limit 10

select count (paid_date)
from sales.funnel       -- não faz a contagem de dados nulos

--ex 3 contagem distinta de uma coluna
-- conte todos os produtos distintos visitados em ja/21

select count (distinct product_id) --sempre que for fazer uma contagem distinta de alguma coluna 
-- acrescentar o distinct  dentro do count em parenteses na frente da coluna que queira contar, não fora do parenteses
from sales.funnel
where visit_page_date between '20210101'and '20210131'

--ex 4 calcule o preço minimo, maximo e medio dos produos da tabela products

select min (price), max(price), avg(price)
from sales.products

--ex 5 informe qual é o veiculo mais caro da tabela products

select max(price)
from sales.products

select *
from sales.products
where price = (select max(price) from sales.products) --A subconsulta (SELECT MAX(price)) encontra o maior preço.
--O WHERE filtra os produtos cuja coluna price seja igual ao maior preço encontrado.

-- funções agregadas servem para executar operações aritmeticas nos registros de uma coluna
--funções agregadas não computam celulas vazias (null) como zero
-- na função count() pode-se utilizar o asterisco (*) para contar os registros
-- count(distinct) irá contar apenas os valores exclusivos




-- GROUP BY
--serve pra agrupar registros semelhantes de uma coluna

--ex 1 contagem agrupada de uma coluna
--calcule o  n de clientes da tabela customers por estado

select state,count(*) as contagem  -- foi nomeado uma nova coluna com as para facilitar 
from sales.customers
group by state              --serve prar fazer o agrupamento da coluna, no caso a coluna state
order by contagem desc


--ex 2 contagem agrupada de varias colunas
--calcule o n de cliente por estado e status profissional

select state,professional_status,count(*) as contagem
from sales.customers
group by state,professional_status
order by state,contagem desc

--ex 3 seleção de valores distintos
--selecione ps estados distintos na tabela customers utilizando o group by 

select distinct state
from sales.customers

select state
from sales.customers     -- se não for informado nenhum comando de agregação na frente da coluna , será feita somente uma seleção distinta
group by state

-- serve para agrupar registros semelhantes de uma coluna
-- normalmente utilizado em conjunto com funções de agregações
--pode-ser referencial a coluna a ser agrupada pela sua posição ordinal
-- o group by sozinho funciona como um DISTINCT, elinando linhas duplicadas

