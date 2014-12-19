xquery version "1.0";

declare namespace ext="http://www.altova.com/xslt-extensions";
<query5>
{
let $n := count(distinct-values(doc("company.xml")//Employee/@empId))
let $s := for $emp in doc("company.xml")//Employee return count(distinct-values(doc("company.xml")//WorksFor[empId eq $emp/@empId]/divId))
return <Average number = "{sum($s) div $n}"/>
}
</query5>