xquery version "1.0";

declare namespace ext="http://www.altova.com/xslt-extensions";

<query1>
{
doc("company.xml")
//Department[deptId=//Division[@divId=//WorksFor[empId=//Employee[empName="PSmith" or empName="Jack"]/@empId and percentTime>50]/divId]/housedDeptId]/deptName
}
</query1>