<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
              	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml"
          		version="1.0"
          		encoding="UTF-8"
          		indent="yes"/>
	<xsl:template match="/">
		<PatientList>
			<PatientDemographic>
				<PatientName>
					<xsl:apply-templates select="MedRecords/PatRec/Name"/>
				</PatientName>
				<SSN>
					<xsl:apply-templates select="MedRecords/PatRec/SSN"/>
				</SSN>
			</PatientDemographic>
		</PatientList>
	</xsl:template>
	<xsl:template match="/">
		<PatientList>
			<xsl:for-each select="MedRecords/PatRec">
				<PatientDemographic>
					<PatientName xml:space='preserve'>
						<xsl:value-of select="Name/LastName"/>, <xsl:value-of select="Name/FirstName"/> <xsl:value-of select="Name/MiddleName"/>
					</PatientName>
					<SSN>
						<xsl:value-of select="Identifier"/>
					</SSN>
				</PatientDemographic>
			</xsl:for-each>
		</PatientList>
	</xsl:template>
</xsl:stylesheet>