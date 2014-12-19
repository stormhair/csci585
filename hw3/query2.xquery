xquery version "1.0";

declare namespace ext="http://www.altova.com/xslt-extensions";
<query2>
{
	let $c := count(distinct-values(doc("company.xml")//Employee/@empId))
	for $x in doc("company.xml")//Division
	where ($c eq count(distinct-values(doc("company.xml")//WorksFor[divId eq $x/@divId]/empId)))
	return <Division name="{$x/divName}"/>
}
</query2>