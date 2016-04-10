ALTER TABLE OFFICES 
  DROP FOREIGN KEY HASMGR;
DROP TABLE ORDERS;
DROP TABLE CUSTOMERS;
DROP TABLE SALESREPS;
DROP TABLE OFFICES;
DROP TABLE PRODUCTS;

CREATE TABLE PRODUCTS
	(MFR_ID CHAR(3) NOT NULL,
    PRODUCT_ID CHAR(5) NOT NULL,
    DESCRIPTION VARCHAR(20) NOT NULL,
    PRICE DECIMAL(9,2) NOT NULL,
    QTY_ON_HAND INTEGER NOT NULL,
PRIMARY KEY (MFR_ID, PRODUCT_ID));

    
create table OFFICES
	(OFFICE integer not null,
    CITY varchar(15) not null,
    REGION varchar(10) not null,
    MGR integer,
    TARGET decimal(9,2),
    SALES decimal(9,2) not null,
primary key (OFFICE));

create table SALESREPS
	(EMPL_NUM integer not null,
		check(EMPL_NUM between 101 and 199),
	NAME varchar(15) not null,
    AGE integer,
    REP_OFFICE integer,
    TITLE varchar(10),
    HIRE_DATE date not null,
    MANAGER integer,
    QUOTA decimal (9,2),
    SALES decimal (9,2) not null,
primary key (EMPL_NUM),
foreign	key (MANAGER)
	references SALESREPS(EMPL_NUM)
    on delete set null,
foreign key WORKSIN (REP_OFFICE)
	references OFFICES(OFFICE)
    on delete set null);
    
create table CUSTOMERS
	(CUST_NUM integer not null,
    COMPANY varchar(20) not null,
    CUST_REP integer,
    CREDIT_LIMIT decimal(9,2),
primary key (CUST_NUM),
foreign key HASREP(CUST_REP)
	references SALESREPS(EMPL_NUM)
    on delete set null);
    
create table ORDERS
	(ORDER_NUM integer not null,
		check(ORDER_NUM > 100000),
	ORDER_DATE date not null,
    CUST integer not null,
    REP integer,
    MFR char(3) not null,
    PRODUCT char(5) not null,
    QTY integer not null,
    AMOUNT decimal(9,2) not null,
primary key (ORDER_NUM),
foreign key PLACEDBY (CUST)
	references CUSTOMERS(CUST_NUM)
    on delete cascade,
foreign key TAKENBY(REP)
	references SALESREPS(EMPL_NUM)
    on delete set null,
foreign key ISFOR(MFR,PRODUCT)
	references PRODUCTS (MFR_ID,PRODUCT_ID)
    on delete restrict);
    
alter table OFFICES
	add constraint HASMGR
    foreign key (MGR) references SALESREPS(EMPL_NUM)
    on delete set null;

