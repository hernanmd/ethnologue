"
Flyweight repository of countries.

To access a country:

LICountrySharable default countryNamed: 'AR'.
LICountrySharable default countryNamed: 'Argentina'.

To access all countries

LICountrySharable default countries
"
Class {
	#name : #EthCountrySharable,
	#superclass : #Object,
	#instVars : [
		'countriesPool'
	],
	#classVars : [
		'ESingleton'
	],
	#category : #'Ethnologue-Geography'
}

{ #category : #accessing }
EthCountrySharable class >> default [
	" Answer the class' primary instance "
	
	^ ESingleton
		ifNil: [ self initialize.
				ESingleton ]
]

{ #category : #'initialize-release' }
EthCountrySharable class >> initialize [
	" Set the class' initial state "
	
	ESingleton := self new.
	^ self.
]

{ #category : #'instance creation' }
EthCountrySharable class >> new [
	" Create and return an instance of the class "
	
	^ self basicNew initialize
]

{ #category : #dependencies }
EthCountrySharable class >> release [
	" Prepare the class to be deleted "
	
	ESingleton := nil.
	^ self
]

{ #category : #'accessing public' }
EthCountrySharable >> addCountry: anEthCountry [
	" Adds anEthCountry to the receiver "
	
	countriesPool 
		at: anEthCountry name 
		put: anEthCountry

					
]

{ #category : #querying }
EthCountrySharable >> countries [
	" Answer a <Collection> of <EthCountry> "
	
	^ countriesPool values
]

{ #category : #'accessing private' }
EthCountrySharable >> countriesPool [
	^ countriesPool
]

{ #category : #'accessing private' }
EthCountrySharable >> countriesPool: anObject [
	countriesPool := anObject
]

{ #category : #querying }
EthCountrySharable >> countryNamed: aString [
	" Answer the <EthCountry> coded aString (according to ISO 3166-1 alpha 2) or named aString in english language "

	^ self countriesPool 
			at: aString asUppercase
			ifAbsent: [ 
				self countries 
					detect: [: country | aString = country name or: [ aString = country identifier ] ]
					ifNone: [ NotFound signal: aString asString ] ]
]

{ #category : #initialization }
EthCountrySharable >> initialize [
	" Private - Configure the instance's initial state "
	
	super initialize.
	self countriesPool: Dictionary new.

	
]
