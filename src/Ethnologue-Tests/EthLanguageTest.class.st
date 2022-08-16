Class {
	#name : #EthLanguageTest,
	#superclass : #EthAbstractTest,
	#instVars : [
		'ethLanguage'
	],
	#category : #'Ethnologue-Tests'
}

{ #category : #accessing }
EthLanguageTest >> ethLanguage [
	" Answer the ethLanguage of this EthLanguageTest "

	^ ethLanguage
]

{ #category : #accessing }
EthLanguageTest >> ethLanguage: anObject [
	" Sets the ethLanguage of this EthLanguageTest "

	ethLanguage := anObject
]

{ #category : #tests }
EthLanguageTest >> newExtinctStatus [

	^ ELanguageStatus newStatus: 'X'
]

{ #category : #running }
EthLanguageTest >> setUp [
	super setUp.
	ethLanguage := self newMockLanguage.
]

{ #category : #tests }
EthLanguageTest >> testAddIdentifier [

	| id1 id2 |
	
	self assert: (ethLanguage identifiers isKindOf: Collection).
	id1 := EthISO3LanguageName new name: 'MCK'.
	id2 := EthISO3LanguageName new name: 'MOC'.
	
	ethLanguage addIdentifier: id1.
	self 
		assertCollection: ethLanguage identifiers
		hasSameElements: { id1 }.
	ethLanguage addIdentifier: id2.
	self 
		assertCollection: ethLanguage identifiers
		hasSameElements: { id1 . id2 }.

]

{ #category : #tests }
EthLanguageTest >> testCountries [

	| mockCountry |
	
	mockCountry := self newMockCountry.
	self assert: (ethLanguage countries isKindOf: Collection).
	ethLanguage addCountry: mockCountry.
	self 
		assertCollection: ethLanguage countries
		hasSameElements: { mockCountry }
]

{ #category : #tests }
EthLanguageTest >> testCountry [

	self assert: (ethLanguage country isKindOf: EthCountry).

]

{ #category : #tests }
EthLanguageTest >> testHasIso2Identifier [

	self assert: (ethLanguage hasIso2Identifier isKindOf: Boolean).

]

{ #category : #tests }
EthLanguageTest >> testHasIso3Identifier [

	self assert: (ethLanguage hasIso3Identifier isKindOf: Boolean).

]

{ #category : #tests }
EthLanguageTest >> testIdentifierNames [

	| id1 id2 |
	
	self assert: (ethLanguage identifierNames isKindOf: Collection).
	id1 := EthISO3LanguageName new name: 'MCK'.
	id2 := EthISO3LanguageName new name: 'MOC'.
	
	ethLanguage addIdentifier: id1.
	self 
		assertCollection: ethLanguage identifierNames
		hasSameElements: { id1 name }.
	ethLanguage addIdentifier: id2.
	self 
		assertCollection: ethLanguage identifierNames
		hasSameElements: { id1 name . id2 name }.
]

{ #category : #tests }
EthLanguageTest >> testIdentifiers [

	| id1 id2 |
	
	self assert: (ethLanguage identifiers isKindOf: Collection).
	id1 := EthISO3LanguageName new name: 'MCK'.
	id2 := EthISO3LanguageName new name: 'MOC'.
	
	ethLanguage addIdentifier: id1.
	self 
		assertCollection: ethLanguage identifiers
		hasSameElements: { id1 }.
	ethLanguage addIdentifier: id2.
	self 
		assertCollection: ethLanguage identifiers
		hasSameElements: { id1 . id2 }.

]

{ #category : #tests }
EthLanguageTest >> testName [

	self assert: ethLanguage name isNil.
	
	ethLanguage name: self mockLanguageName.
	self 
		assert: ethLanguage name 
		equals: self mockLanguageName.

]

{ #category : #tests }
EthLanguageTest >> testNames [

	self assert: (ethLanguage names isKindOf: Collection).

]

{ #category : #tests }
EthLanguageTest >> testStatus [

	self assert: ethLanguage status isNil.
	ethLanguage status: self newExtinctStatus.
	self assert: (ethLanguage status isKindOf: EExtinctLanguage class).
]

{ #category : #tests }
EthLanguageTest >> testTypes [

	self assert: (ethLanguage types isKindOf: Collection).

]
