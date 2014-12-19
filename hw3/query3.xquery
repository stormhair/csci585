xquery version "1.0";

declare namespace ext="http://www.altova.com/xslt-extensions";
<query3>
{
doc("company.xml")
//Department[deptId = //Division[managerEmpId = //Employee[empName="PSmith"]/@empId]/housedDeptId  and deptId != //Division[managerEmpId=//Employee[empName="Wong"]/@empId]/housedDeptId]/deptName
}
</query3>

