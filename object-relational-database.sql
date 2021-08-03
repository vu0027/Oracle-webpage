
-- Define the address type
CREATE TYPE address_obj AS OBJECT (
stress VARCHAR2(32),
city VARCHAR2(32),
state VARCHAR2(32),
zipcode NUMBER(5)
) FINAL;
/

-- Define the date type
CREATE TYPE date_obj AS OBJECT (
month NUMBER(2),
year NUMBER(4)
) FINAL;
/

-- Define the microchip_manufacturer type
CREATE TYPE microManu_obj AS OBJECT (
mname VARCHAR2(32),
maddress VARCHAR2(100)
) FINAL;
/

-- Define software
CREATE TYPE software_typ AS varray(10) OF varchar2(15);
/

-- Define the computer type
CREATE TYPE computer_obj AS OBJECT (
serial_no NUMBER(10),
speed NUMBER(10),
price NUMBER(10),
memory NUMBER(10),
software software_typ,
mname REF microManu_obj
) NOT FINAL;
/

-- Define the laptop type
CREATE TYPE laptop_obj UNDER computer_obj (
weight NUMBER(5)
);
/

-- Define the desktop type
CREATE TYPE desktop_obj UNDER computer_obj (
monitor_type VARCHAR2(32)
);
/

-- Define the customer type
CREATE TYPE customer_obj AS OBJECT (
cname  VARCHAR2(32),
address address_obj,
is_supported VARCHAR2(32),
serial_no REF computer_obj
) FINAL;
/

-- Define the order type
CREATE TYPE order_obj AS OBJECT (
order_no NUMBER(10),
order_date date_obj,
cname REF customer_obj,
serial_no REF computer_obj
) FINAL;
/

-- Create a table for customer 
CREATE TABLE customer_tab OF customer_obj (
cname PRIMARY KEY,
FOREIGN KEY (serial_no) REFERENCES computer_tab ON DELETE SET NULL)
OBJECT IDENTIFIER IS PRIMARY KEY;
/

-- Create a table for microchip manufacture
CREATE TABLE microManu_tab OF microManu_obj
(mname PRIMARY KEY)
OBJECT IDENTIFIER IS PRIMARY KEY;
/
-- Create a table for computer
CREATE TABLE computer_tab OF computer_obj (
serial_no PRIMARY KEY,
FOREIGN KEY (mname) REFERENCES microManu_tab ON DELETE SET NULL)
OBJECT IDENTIFIER IS PRIMARY KEY;
/

CREATE TABLE laptop_tab OF laptop_obj (
serial_no PRIMARY KEY,
FOREIGN KEY (mname) REFERENCES microManu_tab ON DELETE SET NULL)
OBJECT IDENTIFIER IS PRIMARY KEY;
/

CREATE TABLE desktop_tab OF desktop_obj (
serial_no PRIMARY KEY,
FOREIGN KEY (mname) REFERENCES microManu_tab ON DELETE SET NULL)
OBJECT IDENTIFIER IS PRIMARY KEY;
/

CREATE TABLE order_tab OF order_obj (
order_no PRIMARY KEY,
FOREIGN KEY (cname) REFERENCES customer_tab ON DELETE SET NULL,
FOREIGN KEY (serial_no) REFERENCES computer_tab ON DELETE SET NULL)
OBJECT IDENTIFIER IS PRIMARY KEY;
/

insert into customer_tab select 'Anh Vu', address_obj('SW 10th','OKC', 'OK', 73159), 'set up', ref(sn) from computer_tab sn where serial_no =32;
insert into computer_tab select 32,3,5,54,software_typ('abc'), ref(manu) from microManu_tab manu where mname ='AMD';
insert into laptop_tab values (322,3,5,54,software_typ('abc'),(select ref(manu) from microManu_tab manu where mname ='AMD'), 45);
insert into desktop_tab values (132,3,5,54,software_typ('abc'),(select ref(manu) from microManu_tab manu where mname ='AMD'), 'Apple');
insert into order_tab values (12553,date_obj(5,2020),(select ref(cn) from customer_tab cn where cname ='John H'), (select ref(sn) from computer_tab sn where serial_no =32));
insert into order_tab values (5119,date_obj(1,2009),(select ref(cn) from customer_tab cn where cname ='Hailey Jen'), (select ref(sn) from computer_tab sn where serial_no =114));
insert into customer_tab values ('John H',address_obj('SW 10th','OKC', 'OK', 73159),'set', (select ref(sn) from computer_tab sn where serial_no =32));

SELECT
    A2.IS_SUPPORTED
FROM
    "CUSTOMER_TAB"    A2,
    "COMPUTER_TAB"    A1
WHERE
        A2.CNAME = 'Anh Vu'
    AND A1.SERIAL_NO = 32;
    
    
select  A1.serial_no as serial_no, A1.speed as speed, A1.price as price, A1.memory as memory, A1.weight as weight from laptop_tab A1, customer_tab A3 , order_tab A2  where  A3.cname = 'John Doe' and A2.order_date.year = 2009;
select * from order_tab,laptop_tab where ref(order_tab)= laptop_tab.serial_no;

select A1.cname as cname, A1.is_supported as Support, 'AMD' as Mname from customer_tab A1, micromanu_tab A3 where   A1.is_supported is not null and A3.mname = 'AMD';

select distinct cname from  laptop_tab A2 join customer_tab A1 on A2.serial_no = ref(sn) from computer_tab sn where 'Windows' in (select * from table (A2.software));
select distinct cname as cname, price as price from  desktop_tab A2, customer_tab A1 where A2.price >500;

select serial_no, software from laptop_tab where serial_no = 111;
select * from microManu_tab;
COMMIT;