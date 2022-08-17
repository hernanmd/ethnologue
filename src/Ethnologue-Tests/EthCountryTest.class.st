Class {
	#name : #EthCountryTest,
	#superclass : #EthAbstractTest,
	#instVars : [
		'ethCountry'
	],
	#category : #'Ethnologue-Tests'
}

{ #category : #accessing }
EthCountryTest >> ethCountry [
	" Answer the ethCountry of this EthCountryTest "

	^ ethCountry
]

{ #category : #accessing }
EthCountryTest >> ethCountry: anObject [
	" Sets the ethCountry of this EthCountryTest "

	ethCountry := anObject
]

{ #category : #running }
EthCountryTest >> setUp [

	super setUp.
	ethCountry := self newMockCountry.
]

{ #category : #tests }
EthCountryTest >> testAddLanguage [

	| aLang |
	
	self assert: (ethCountry languages isKindOf: Collection).
	aLang := self newMockLanguage.
	ethCountry addLanguage: aLang.
	
	self 
		assertCollection: ethCountry languages 
		hasSameElements: { aLang }.
		

]

{ #category : #tests }
EthCountryTest >> testAddLanguageType [

	| aCommonLangType aDialectLangType |
	
	aCommonLangType := self newCommonLanguageType.
	aDialectLangType := self newDialectLanguageType.
	self assert: (ethCountry languageTypes isKindOf: Collection).
	self assert: ethCountry languageTypes isEmpty.
	
	ethCountry 
		addLanguageType: aCommonLangType;
		addLanguageType: aDialectLangType.
		
	self 
		assertCollection: ethCountry languageTypes
		hasSameElements: { aCommonLangType . aDialectLangType }.

]

{ #category : #tests }
EthCountryTest >> testArea [

	self assert: ethCountry area equals: nil.
	ethCountry area: EthArea new. 
	self assert: (ethCountry area isKindOf: EthArea).

]

{ #category : #tests }
EthCountryTest >> testCommonLanguages [

	| aCommonLanguageType |
	
	self assert: (ethCountry commonLanguages isKindOf: Collection).
	aCommonLanguageType := self newCommonLanguageType.
	ethCountry addLanguageType: aCommonLanguageType.
	
	self 
		assertCollection: ethCountry commonLanguages 
		hasSameElements: { aCommonLanguageType }.
		

]

{ #category : #tests }
EthCountryTest >> testDialectLanguages [

	| aDialectLanguageType |
	
	self assert: (ethCountry dialectLanguages isKindOf: Collection).
	aDialectLanguageType := self newDialectLanguageType.
	ethCountry addLanguageType: aDialectLanguageType.
	
	self 
		assertCollection: ethCountry dialectLanguages 
		hasSameElements: { aDialectLanguageType }.

]

{ #category : #tests }
EthCountryTest >> testIdentifier [

	self assert: ethCountry identifier equals: nil.
	ethCountry identifier: 'MCK'.
	self assert: (ethCountry identifier isKindOf: String).

]

{ #category : #tests }
EthCountryTest >> testLanguageTypes [

	| aCommonLangType aDialectLangType |
	
	aCommonLangType := self newCommonLanguageType.
	aDialectLangType := self newDialectLanguageType.
	self assert: (ethCountry languageTypes isKindOf: Collection).
	self assert: ethCountry languageTypes isEmpty.
	
	ethCountry 
		addLanguageType: aCommonLangType;
		addLanguageType: aDialectLangType.
		
	self 
		assertCollection: ethCountry languageTypes
		hasSameElements: { aCommonLangType . aDialectLangType }.
		
]

{ #category : #tests }
EthCountryTest >> testLanguages [

	| mockLang |
	
	mockLang := self newMockLanguage.
	self assert: (ethCountry languages isKindOf: Collection).
	self assert: ethCountry languages isEmpty.
	
	ethCountry addLanguage: mockLang.
	
	self
		assertCollection: ethCountry languages
		hasSameElements: { mockLang }
]

{ #category : #tests }
EthCountryTest >> testName [

	self assert: ethCountry name equals: self mockCountryName.

	ethCountry name: String empty.
	self assert: ethCountry name isEmpty.
]

{ #category : #test }
EthCountryTest >> testUrl [

	self assert: ethCountry url equals: nil.
	ethCountry url: self mockUrlString.
	self assert: ethCountry url equals: self mockUrlString.
]

{ #category : #tests }
EthCountryTest >> testlessOrEqualThan [
]
