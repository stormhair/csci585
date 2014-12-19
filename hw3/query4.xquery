xquery version "1.0";

declare namespace ext="http://www.altova.com/xslt-extensions";

<query4>
{
let $manager := distinct-values(doc("company.xml")//Division/managerEmpId)
for $x in doc("company.xml")//Employee
order by $x/empName descending
return 
	if (index-of($manager, $x/@empId)) then ()
	else <Employee name = "{$x/empName}" phone = "{$x/empPhone}" office="{$x/empOffice}"/>
}
</query4>