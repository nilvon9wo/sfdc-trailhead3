<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <outboundMessages>
        <fullName>New_Contact_to_Heroku</fullName>
        <apiVersion>39.0</apiVersion>
        <endpointUrl>https://foo.herokuapp.com/new_contact</endpointUrl>
        <fields>AccountId</fields>
        <fields>AssistantName</fields>
        <fields>AssistantPhone</fields>
        <fields>Birthdate</fields>
        <fields>CleanStatus</fields>
        <fields>CreatedById</fields>
        <fields>CreatedDate</fields>
        <fields>Department</fields>
        <fields>Description</fields>
        <fields>DoNotCall</fields>
        <fields>Email</fields>
        <fields>EmailBouncedDate</fields>
        <fields>EmailBouncedReason</fields>
        <fields>Fax</fields>
        <fields>FirstName</fields>
        <fields>HasOptedOutOfEmail</fields>
        <fields>HasOptedOutOfFax</fields>
        <fields>HomePhone</fields>
        <fields>Id</fields>
        <fields>IsDeleted</fields>
        <fields>IsEmailBounced</fields>
        <fields>Jigsaw</fields>
        <fields>JigsawContactId</fields>
        <fields>Languages__c</fields>
        <fields>LastActivityDate</fields>
        <fields>LastCURequestDate</fields>
        <fields>LastCUUpdateDate</fields>
        <fields>LastModifiedById</fields>
        <fields>LastModifiedDate</fields>
        <fields>LastName</fields>
        <fields>LastReferencedDate</fields>
        <fields>LastViewedDate</fields>
        <fields>LeadSource</fields>
        <fields>Level__c</fields>
        <fields>MailingCity</fields>
        <fields>MailingCountry</fields>
        <fields>MailingGeocodeAccuracy</fields>
        <fields>MailingLatitude</fields>
        <fields>MailingLongitude</fields>
        <fields>MailingPostalCode</fields>
        <fields>MailingState</fields>
        <fields>MailingStreet</fields>
        <fields>MasterRecordId</fields>
        <fields>MobilePhone</fields>
        <fields>OtherCity</fields>
        <fields>OtherCountry</fields>
        <fields>OtherGeocodeAccuracy</fields>
        <fields>OtherLatitude</fields>
        <fields>OtherLongitude</fields>
        <fields>OtherPhone</fields>
        <fields>OtherPostalCode</fields>
        <fields>OtherState</fields>
        <fields>OtherStreet</fields>
        <fields>OwnerId</fields>
        <fields>Phone</fields>
        <fields>PhotoUrl</fields>
        <fields>ReportsToId</fields>
        <fields>Salutation</fields>
        <fields>SystemModstamp</fields>
        <fields>Title</fields>
        <includeSessionId>true</includeSessionId>
        <integrationUser>bmk-th3@sfdc.dev</integrationUser>
        <name>New Contact to Heroku</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <rules>
        <fullName>New Contact</fullName>
        <actions>
            <name>New_Contact_to_Heroku</name>
            <type>OutboundMessage</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>User.IsActive</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
