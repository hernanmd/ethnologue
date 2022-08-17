"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestEthnologue,
	#superclass : #PackageManifest,
	#category : #'Ethnologue-Manifest'
}

{ #category : #'code-critics' }
ManifestEthnologue class >> ruleBadMessageRule2V1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#EthnologueReader #createCountryFrom: #false)) #'2022-08-17T23:57:23.21544+02:00') #(#(#RGMethodDefinition #(#EthArea #printOn: #false)) #'2022-08-17T23:57:23.215314+02:00') )
]

{ #category : #'code-critics' }
ManifestEthnologue class >> ruleClassNotReferencedRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#EDialectPejorative)) #'2022-08-17T23:57:02.717961+02:00') #(#(#RGClassDefinition #(#ENearlyExtinctLanguage)) #'2022-08-17T23:57:02.718831+02:00') #(#(#RGClassDefinition #(#ESecondLanguage)) #'2022-08-17T23:57:02.716983+02:00') #(#(#RGClassDefinition #(#ECommonDialect)) #'2022-08-17T23:57:02.719135+02:00') #(#(#RGClassDefinition #(#ELanguagePejorative)) #'2022-08-17T23:57:02.718139+02:00') #(#(#RGClassDefinition #(#EDialectAlternate)) #'2022-08-17T23:57:02.71931+02:00') #(#(#RGClassDefinition #(#ELanguageAlternate)) #'2022-08-17T23:57:02.719465+02:00') #(#(#RGClassDefinition #(#ELivingLanguage)) #'2022-08-17T23:57:02.72021+02:00') #(#(#RGClassDefinition #(#ECommonLanguage)) #'2022-08-17T23:57:02.717618+02:00') )
]

{ #category : #'code-critics' }
ManifestEthnologue class >> ruleImplementedNotSentRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#ELanguageType #isCommonLanguage #false)) #'2022-08-17T23:57:56.300399+02:00') #(#(#RGMethodDefinition #(#ECommonLanguage #isCommonLanguage #false)) #'2022-08-17T23:57:56.300772+02:00') #(#(#RGMethodDefinition #(#ELanguageType #isCommonDialect #false)) #'2022-08-17T23:57:56.300753+02:00') #(#(#RGMethodDefinition #(#ECommonDialect #isCommonDialect #false)) #'2022-08-17T23:57:56.300521+02:00') )
]
