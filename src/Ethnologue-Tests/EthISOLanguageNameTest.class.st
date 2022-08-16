Class {
	#name : #EthISOLanguageNameTest,
	#superclass : #TestCase,
	#instVars : [
		'ethISO2LanguageName',
		'ethISO3LanguageName',
		'ethISO3AltLanguageName'
	],
	#category : #'Ethnologue-Tests'
}

{ #category : #running }
EthISOLanguageNameTest >> setUp [

	super setUp.
	ethISO2LanguageName := EthISO2LanguageName new.
	ethISO3LanguageName := EthISO3LanguageName new.
	ethISO3AltLanguageName := EthISO3AlternateLanguageName new.
]

{ #category : #tests }
EthISOLanguageNameTest >> testIsIso2 [

	self assert: ethISO2LanguageName isIso2.
	self deny: ethISO3LanguageName isIso2.
	self deny: ethISO3AltLanguageName isIso2.

]

{ #category : #tests }
EthISOLanguageNameTest >> testIsIso3 [

	self deny: ethISO2LanguageName isIso3.
	self assert: ethISO3LanguageName isIso3.
	self assert: ethISO3AltLanguageName isIso3.

]
