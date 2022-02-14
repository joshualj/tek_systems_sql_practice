use Banking;

select NAME as `Product`, PRODUCT_TYPE_CD as `Type` from product;

select b.NAME as `branch name`, b.CITY as `City`, e.LAST_NAME as `Last Name`, e.TITLE as `Title`
from branch as b
join employee as e on b.BRANCH_ID = e.ASSIGNED_BRANCH_ID; 
describe employee;
describe branch;

select UNIQUE Title from employee;

select e.LAST_NAME as `Last Name`, e.TITLE as `Title`, b.LAST_NAME as `boss's last name`, b.TITLE as `boss's title`
from employee as e 
join employee as b on e.SUPERIOR_EMP_ID = b.EMP_ID;

select a.PRODUCT_CD as `Product`, a.AVAIL_BALANCE as `Available Balance`, i.LAST_NAME as `Customer Last Name`
from account as a
join individual as i on a.CUST_ID = i.CUST_ID;

select a.*, i.LAST_NAME
from acc_transaction as a
join individual as i on a.ACCOUNT_ID = i.CUST_ID
where i.LAST_NAME like "T%";

