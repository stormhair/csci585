xquery version "1.0";

declare namespace ext="http://www.altova.com/xslt-extensions";
<query6>
{
let $y := for $x in doc("company.xml")//Employee return <Employee id="{$x/@empId}" c="{count(distinct-values(doc("company.xml")//WorksFor[empId eq $x/@empId]/divId))}"/>
let $m:=max($y/@c)
let $e := for $z in $y where $z/@c = $m return $z/@id
return <Result name="{doc("company.xml")//Employee[@empId eq $e]/empName}" phone="{doc("company.xml")//Employee[@empId eq $e]/empPhone}" office="{doc("company.xml")//Employee[@empId eq $e]/empOffice}"/>
}
</query6>