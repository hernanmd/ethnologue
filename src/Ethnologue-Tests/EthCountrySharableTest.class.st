Class {
	#name : #EthCountrySharableTest,
	#superclass : #EthAbstractTest,
	#instVars : [
		'ethCountrySharable'
	],
	#category : #'Ethnologue-Tests'
}

{ #category : #accessing }
EthCountrySharableTest >> ethCountrySharable [
	" Answer the ethCountrySharable of this EthCountrySharableTest "

	^ ethCountrySharable
]

{ #category : #accessing }
EthCountrySharableTest >> ethCountrySharable: anObject [
	" Sets the ethCountrySharable of this EthCountrySharableTest "

	ethCountrySharable := anObject
]

{ #category : #running }
EthCountrySharableTest >> setUp [

	super setUp.
	ethCountrySharable := EthCountrySharable new.
]

{ #category : #tests }
EthCountrySharableTest >> testAddCountry [

	| aMockCountry |
	
	aMockCountry :=  self newMockCountry.
	self assert: ethCountrySharable countries isEmpty.
	ethCountrySharable addCountry: aMockCountry.
	self 
		assertCollection: ethCountrySharable countries
		hasSameElements: { aMockCountry }.
		
	self should: [ ethCountrySharable addCountry: nil ] raise: MessageNotUnderstood.
	self should: [ ethCountrySharable addCountry: String empty ] raise: MessageNotUnderstood.

	self assert: ethCountrySharable countries size equals: 1.
]

{ #category : #tests }
EthCountrySharableTest >> testCountries [

	| aMockCountry |
	
	self assert: (ethCountrySharable countries isKindOf: Collection).
	self assert: ethCountrySharable countries isEmpty.

	aMockCountry :=  self newMockCountry.
	self assert: ethCountrySharable countries isEmpty.
	ethCountrySharable addCountry: aMockCountry.
	self 
		assertCollection: ethCountrySharable countries
		hasSameElements: { aMockCountry }.

	self assert: ethCountrySharable countries size equals: 1.



]

{ #category : #tests }
EthCountrySharableTest >> testCountryNamed [

	| aMockCountry |
	self should: [ ethCountrySharable countryNamed: String empty ] raise: NotFound.
	self should: [ ethCountrySharable countryNamed: 'f5662594-bca2-0d00-92b9-097906810e68' ] raise: NotFound.
	self should: [ ethCountrySharable countryNamed: nil ] raise: MessageNotUnderstood.
	
	aMockCountry := self newMockCountry.
	ethCountrySharable addCountry: aMockCountry.
	
	self assert: (ethCountrySharable countryNamed: self mockCountryName) equals: aMockCountry.
	
]
