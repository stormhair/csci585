<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<body>
				<table border="0" style="font-family:arial">
					<tr style="font-weight:bold; background-color:yellow; font-size:24px">
						<th align="left"><font color="red">Employee Information</font></th>
					</tr>
					<xsl:for-each select="//Employee">
						<xsl:variable name="empid" select="@empId"/>
						<xsl:variable name="n" select="count(//WorksFor[empId=$empid]/divId)"/>
						<tr style="font-size:12px">
							Employee <b><xsl:value-of select="empName"/></b> works from <b><xsl:value-of select="empOffice"/></b>. <b><xsl:value-of select="empName"/></b> works for <b><xsl:value-of select="$n"/></b> division(s), which are
							<xsl:for-each select="//WorksFor[empId=$empid]">
								<xsl:variable name="divid" select="divId"/>
								<b><xsl:value-of select="//Division[@divId=$divid]/divName"/></b>
								<xsl:if test="position() &lt; last()-1">
									<b>, </b>
								</xsl:if>
								<xsl:if test="position() = last()-1">
									<b> and </b>
								</xsl:if>
							</xsl:for-each>. 
							<b><xsl:value-of select="empName"/></b> manages <b><xsl:value-of select="count(//Division[managerEmpId=$empid]/@divId)"/></b> division(s), which are
							<xsl:for-each select="//Division[managerEmpId=$empid]">
								<b><xsl:value-of select="divName"/></b>
								<xsl:if test="position() &lt; last()-1">
									<b>, </b>
								</xsl:if>
								<xsl:if test="position() = last()-1">
									<b> and </b>
								</xsl:if>
							</xsl:for-each>.
							<b><xsl:value-of select="empName"/></b> works for the most time with the division <b><xsl:value-of select="//Division[@divId=//WorksFor[not(//WorksFor[empId=$empid]/percentTime &gt; percentTime) and empId=$empid]/divId]/divName"/></b>.
						</tr>
					</xsl:for-each>
					
					<tr style="font-weight:bold; font-color=red; background-color:lightgreen; font-size:24px">
						<th align="left"><font color="red">Department Information</font></th>
					</tr>
					<xsl:for-each select="//Department">
						<xsl:variable name="did" select="deptId"/>
						<tr style="font-size:12px">
							Department <b><xsl:value-of select="deptName"/></b> houses <b><xsl:value-of select="count(//Division[housedDeptId=$did]/divName)"/></b> division(s): 
							<xsl:for-each select="//Division[housedDeptId=$did]">
								<b><xsl:value-of select="divName"/></b>
								<xsl:if test="position() &lt; last()-1">
									<b>, </b>
								</xsl:if>
								<xsl:if test="position() = last()-1">
									<b> and </b>
								</xsl:if>
							</xsl:for-each>.
						</tr>
					</xsl:for-each>
				</table>

			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
