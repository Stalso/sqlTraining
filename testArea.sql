# p120

select CITY,TARGET,SALES
from offices
where REGION = 'Eastern';

select CITY,TARGET,SALES from offices
where SALES > TARGET and REGION = 'Eastern'
order by CITY;

#p122

select NAME,REP_OFFICE,HIRE_DATE
from salesreps;

#p123
select Name,QUOTA,SALES
from salesreps 
where EMPL_NUM = 107;

#p124
select AVG(SALES)
from salesreps;

select NAME , QUOTA, MANAGER
from salesreps;

#p125
#Вывести для каждого из офисов список городов, регионов и обьемов продаж.

select CITY, REGION, SALES
from offices;

#p126
#Выдатъ для каждого офиса список городов, регионов и сумм, на которые был перевътолнен/недовыполнен план по продажам.

select CITY,REGION, (SALES - TARGET)
from offices;

#Показатъ общую стоимостъ по каждому товару (показаны толъко 8 строк резулътирующего набора).
select MFR_ID , PRODUCT_ID , DESCRIPTION ,(PRICE * QTY_ON_HAND)
from products;

#p127
#Что получится, если увеличить плановый объем продаж для каждого служащего на
#3% от его фактического объема продаж?

select NAME , (QUOTA + (QUOTA * 0.03))
from salesreps;

#Список объемов продаж для каждого города.

select CITY, 'sales of' , SALES
from OFFICES;

#p128
#Показать все данные, содержащиеся в таблице OFFICES.
select * from offices;

#p129
#Список идентификаторов всех менеджеров офисов.

select MGR from offices;

#Список идентификаторов всех менеджеров офисов. (distinct)

select distinct MGR from offices;

#p130
#Офисы, в которых фактические объе.мы продаж превысили плановые.
select CITY, SALES, TARGET
from offices
where SALES > TARGET;
#Имя, объемы фактических и плановъ�х продаж служащего с идентификатором 105.
select NAME, SALES, QUOTA
from salesreps
where EMPL_NUM = 105;
#Список всех служащих, менеджером которых является Боб Смит (идентификатор 104).
select NAME, SALES, QUOTA
from salesreps
where MANAGER = 104;

#p133
#Найти имена всех служащих, принятых на работу до 2006 года.
select NAME
from salesreps
where HIRE_DATE < '2006-01-01';
#Вывести список офисов, фактические объемы продаж в которых составили менее 80 процетпов от плановых.
select CITY, SALES, TARGET
from offices
where SALES < (0.8 * TARGET); 
#Вывести список офисов, менеджером которых не .является служащий с идентификатором 108.
select CITY, SALES, TARGET
from offices
where MGR <> 108;

#p134
#Узнать uмя u лuмшп кредuта клиента с uдентuфuкатором 2107.
select COMPANY, CREDIT_LIMIT
from CUSTOMERS
where CUST_NUM = 2107; 
#Въюестu спuсок служащuх, превъюшшuх плановый обьем продаж.
select NAME 
from salesreps
where SALES > QUOTA;

#p135
#Въизести список служащих, не выполнивших план.
select NAME 
from salesreps
where SALES < QUOTA;
#Найти все заказы, сделанные в последнем квартале 2007 года.
select ORDER_NUM, ORDER_DATE, MFR, PRODUCT, AMOUNT
from orders
where ORDER_DATE between '2007-10-01' and '2007-12-31';

#p136
#Найти заказы, стоимости которых попадают в различные диапазоны.
select ORDER_NUM, ORDER_DATE, MFR, PRODUCT, AMOUNT
from orders
where AMOUNT between 20000.00 and 29999.99; 
#Вывести список служащих, фактические объемы продаж которых не попадают в диапазон от 80 до 120 процентов плана.

select NAME, SALES, QUOTA
from salesreps
where SALES not between 0.8 * QUOTA and 1.2 * QUOTA;

