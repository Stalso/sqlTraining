
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

#Вывести список служащих, которьw работают в Нью-Йорке, Атланте или Денвере.
select NAME,SALES,QUOTA
from salesreps
where REP_OFFICE in (22,11,13);

#Найти все заказы, полученные четыръмя конкретными служащими.
select ORDER_NUM, REP,AMOUNT
from orders
where REP in (101,107,109,103);

#Показать лимит кредита для Sтithson Corp.
select COMPANY,CREDIT_LIMIT
from customers
where COMPANY like 'Smith% Corp.';

#Найти служащего, который е�це не закреплен за офисом.

select NAME
from salesreps
where REP_OFFICE is NULL;

#Вывести список служащих, которъzе уже закреплены за офисами.
select NAME
from salesreps
where REP_OFFICE is not NULL;


#Найти служащих, у которых фактический объем продаж меныие планового или
#меньше $300 ООО.

select NAME 
from salesreps
where SALES < QUOTA or SALES < 300000;

#Найти служащих, у которых фактический объем продаж меньше планового и меньше
#$300 000.

select NAME 
from salesreps
where SALES < QUOTA and SALES < 300000;

#Найти всех служащих, которые: (а) работают в Денвере, Нью-Йорке или Чикаго;
#или (6) не имеют менеджера и бъzлu приюzты на работу после июю1 2006 года; или
#(в) у которых продажи превысили плановый объем, но не превысили $600 ООО.

select NAME,QUOTA,SALES
from salesreps
where REP_OFFICE in (22,11,12)
	or (MANAGER is NUll and HIRE_DATE >= ' 2006-06-01')
    or (SALES > QUOTA and SALES < 600000);

#Показатъ фактиЧЕские обьемъz продаж для каждого офиса, отсортированные в алфавитном
#порядке по регионам, а в каждом регионе - по городам.

select CITY,REGION,SALES
from offices
order by REGION desc,CITY;


#Въzвести список офисов, отсортированный по фактиttЕским обьемам продаж в порядке
#убывания.

select CITY,REGION,SALES
from offices
order by SALES desc;

#Вывести список всех офисов, отсортированный по разности между фактическим и
#плановым обьемами продаж в порядке убъюания.

select CITY,REGION,(SALES - TARGET)
from offices
order by (SALES - TARGET) desc;

#p147 Въюести список офисов, отсортированный в алфавитном порядке по названиям регzюнов,
#а в каждом регионе - по разности между фактическим и плановым обьемами
#продаж в порядке убывания.

select CITY,REGION,(SALES - TARGET)
from offices
order by REGION, (SALES - TARGET) desc;

########UNION
#p149

#Вывести список всех товаров, цена которых превышает $2000.

select MFR_ID,PRODUCT_ID
from products
where PRICE > 2000;

#150 Бъюести список всех товаров, которых было заказано более чем на $30 ООО за
#один раз.

select distinct MFR,PRODUCT
from orders
where AMOUNT > 30000;

#150 Бъюести список всех товаров, цена которых превышает $2000 или которых было заказано
#более чем на $30 ООО за один раз.

select MFR_ID,PRODUCT_ID
from products
where PRICE > 2000
	union
select distinct MFR,PRODUCT
from orders
where AMOUNT > 30000;

#151 Бъюести список всех товаров, цена которых превышает $2000 или которых было заказано
#более чем на $30 ООО за один раз.

select MFR_ID,PRODUCT_ID
from products
where PRICE > 2000
	union all
select distinct MFR,PRODUCT
from orders
where AMOUNT > 30000;

#join
#158 Перечислитъ все заказы, включая номер и стоимостъ заказа, а также имя и лимит
#кредита клиента, сделаешего заказ.

select ORDER_NUM,AMOUNT,COMPANY,CREDIT_LIMIT
from orders,customers
where CUST = CUST_NUM;

#159 Вывести список всех служащих с городами и регионами, в которъzх они работают.

select NAME,CITY,REGION
from salesreps,offices
where REP_OFFICE = OFFICE; 

#161 Въюести список офисов с именами и должностями их руководителей.

select REGION,CITY,NAME,TITLE
from offices,salesreps
where MGR = EMPL_NUM;

#161 Вывести список всех служащих с городами и регионами, в которых они работают.

select NAME,CITY,REGION
from salesreps join offices
on REP_OFFICE = OFFICE;


#162 Вывести список офисов с именами и должностszми их руководителей.

select REGION,CITY,NAME,TITLE
from offices join salesreps
on MGR = EMPL_NUM;

#Перечислитъ офисы, план продаж которых превы􀅑иает $600 ООО.

select REGION,CITY,NAME,TITLE
from offices , salesreps
where TARGET > 600000 and MGR = EMPL_NUM;

#163 Перечислитъ офисы, план продаж которъzх превышает $600 ООО.
select REGION,CITY,NAME,TITLE
from offices join salesreps
	on MGR = EMPL_NUM
    where TARGET > 600000;
    
#163 Вывести список всех заказов, включая стоимости и описания товаров.

select ORDER_NUM,AMOUNT,DESCRIPTION
from orders,products
where MFR = MFR_ID and PRODUCT = PRODUCT_ID;

select ORDER_NUM,AMOUNT,DESCRIPTION
from orders join products
on MFR = MFR_ID and PRODUCT = PRODUCT_ID;

#165 Въюести список заказов стоимостью выше $25 ООО, включающий имя служащего,
#принявшего заказ, и имя клиента, сделавшего его.

select ORDER_NUM,AMOUNT,NAME,COMPANY
from orders,salesreps,customers
where AMOUNT > 25000 and REP = EMPL_NUM and CUST = CUST_NUM;

select ORDER_NUM,AMOUNT,NAME,COMPANY
from orders join salesreps on REP = EMPL_NUM 
			join customers on  CUST = CUST_NUM
			where AMOUNT > 25000;

#166 Въюести список заказов стоимостъю выше $25 ООО, включающий имя клиента, сделавшего
#заказ, и имя служащего, закрепленного за этим клиентом.


select ORDER_NUM,AMOUNT,COMPANY,NAME
from orders,customers,salesreps
where AMOUNT > 25000 and CUST = CUST_NUM and CUST_REP = EMPL_NUM;

select ORDER_NUM,AMOUNT,COMPANY,NAME
from orders join customers on CUST = CUST_NUM
			join salesreps on CUST_REP = EMPL_NUM
            where AMOUNT > 25000;

# 167 Вывести список заказов стоимостью выше $25 ООО, включающий имsz клиента, сделавшего
#заказ, имsz закрепленного за ним служащего и офис, в котором работает
#этот служащий.

select ORDER_NUM,AMOUNT,COMPANY,NAME,REGION,CItY
from orders join customers on CUST = CUST_NUM
			join salesreps on CUST_REP = EMPL_NUM
            join offices on REP_OFFICE = OFFICE
            where AMOUNT > 25000;
            
#169 Наuти все заказы, полученные в тот денъ, 
#когда на работу был принят новый служащий.

select ORDER_NUM,AMOUNT,ORDER_DATE,NAME
from orders,salesreps
where ORDER_DATE = HIRE_DATE;

#170 Перечислить все комбинации служащих и офисов, где плановый объем продаж служащего
#больше, чем план какого-либо офиса, независимо от места работы служащего.

select NAME,QUOTA,CITY,TARGET
from salesreps,offices
where QUOTA > TARGET;

#172 Показать им.я, офис и объем продаж каждого служащего.

select NAME,salesreps.SALES,CITY
from salesreps join offices on REP_OFFICE = OFFICE;

#173 Сооб�1Jитъ всю информацию о служащих и офисах, в которых они работают.

select *
from salesreps join offices on REP_OFFICE = OFFICE;

#175 Въюести список всех служащих и их руководителей.

select emps.NAME, mgrs.NAME
from salesreps emps join salesreps mgrs
on emps.MANAGER = mgrs.EMPL_NUM;

#Въюести список служащих, планъz продаж которых 
#превъzшают планы их руководителей.

select  emps.NAME,emps.QUOTA, mgrs.NAME,mgrs.QUOTA
from salesreps emps join salesreps mgrs
on emps.MANAGER = mgrs.EMPL_NUM
where emps.QUOTA > mgrs.QUOTA;

#176 Вывести список служащих, которые работают в различных офисах со своими руководителями,
#включающий имена и офисы как служащих, так и их руководителей.

select emps.NAME, emps_office.CITY,mgrs.NAME, mgrs_office.CITY
from salesreps emps join offices emps_office on emps.REP_OFFICE = emps_office.OFFICE
					join salesreps mgrs on emps.MANAGER = mgrs.EMPL_NUM
                    join offices mgrs_office on mgrs.REP_OFFICE = mgrs_office.OFFICE
where emps.REP_OFFICE <>  mgrs.REP_OFFICE;

#180 Вывести имя компании и все заказы клиента 
#но.мер 2 1 03.

select COMPANY, ORDER_NUM,AMOUNT
from customers join orders on CUST_NUM = CUST
where CUST_NUM = 2103;

#outer join
#183 Въzвести список служащ их и городов, где они работают.

select NAME,CITY
from salesreps left outer join offices
				on REP_OFFICE = OFFICE;

#183 Вывести список девочек и мальчиков, живущих в одних и тех же городах.
                
select *
from boys join girls on girls.CITY = boys.CITY;

#Вывести список девочек 11 .мальчиков из одних и тех же городов, вклюtf11S/ тех, кто
#не имеет пары.

select *
from boys left outer join girls on girls.CITY = boys.CITY
union
select *
from boys right outer join girls on girls.CITY = boys.CITY;

select *
from girls left outer join boys on girls.CITY = boys.CITY;

select *
from girls right outer join boys on girls.CITY = boys.CITY;

#187 Вывести список служащих и городов, где они работают.

select NAME, CITY
from salesreps left join offices on REP_OFFICE = OFFICE;


