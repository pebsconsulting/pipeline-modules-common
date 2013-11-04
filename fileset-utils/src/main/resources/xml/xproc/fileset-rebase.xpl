<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step version="1.0" type="px:fileset-rebase" name="main"
    xmlns:p="http://www.w3.org/ns/xproc" xmlns:px="http://www.daisy.org/ns/pipeline/xproc">
    
    <p:input port="source"/>
    <p:output port="result"/>
    
    <p:option name="new-base" required="true"/>
    
    <p:xslt>
        <p:with-param name="new-base" select="$new-base"/>
        <p:input port="stylesheet">
            <p:document href="fileset-rebase.xsl"/>
        </p:input>
    </p:xslt>
    
</p:declare-step>
