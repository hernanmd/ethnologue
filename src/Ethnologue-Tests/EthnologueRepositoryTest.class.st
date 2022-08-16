Class {
	#name : #EthnologueRepositoryTest,
	#superclass : #TestCase,
	#instVars : [
		'ethnologueRepository'
	],
	#category : #'Ethnologue-Tests'
}

{ #category : #accessing }
EthnologueRepositoryTest >> ethnologueRepository [
	" Answer the ethnologueRepository of this EthnologueRepositoryTest "

	^ ethnologueRepository
]

{ #category : #accessing }
EthnologueRepositoryTest >> ethnologueRepository: anObject [
	" Sets the ethnologueRepository of this EthnologueRepositoryTest "

	ethnologueRepository := anObject
]

{ #category : #running }
EthnologueRepositoryTest >> setUp [
	super setUp.

]

{ #category : #tests }
EthnologueRepositoryTest >> testAreas [

	self assert: (ethnologueRepository areas isKindOf: Collection).

]

{ #category : #tests }
EthnologueRepositoryTest >> testCommonLanguagesFor [

	self assert: ((ethnologueRepository commonLanguagesFor: String empty) isKindOf: Collection).
	
	self assert: ((ethnologueRepository commonLanguagesFor: '7308eca6-bca2-0d00-a0de-1afa08357045') isKindOf: Collection).
	
	self assert: ((ethnologueRepository commonLanguagesFor: nil) isKindOf: Collection).
	
	self assert: ((ethnologueRepository commonLanguagesFor: 'e709eca6-bca2-0d00-b00a-01550d0e8b3a') equals: Collection).
	
]

{ #category : #tests }
EthnologueRepositoryTest >> testCountries [

	self assert: (ethnologueRepository countries isKindOf: Collection).

]

{ #category : #tests }
EthnologueRepositoryTest >> testCountriesForLanguage [

	self assert: ((ethnologueRepository countriesForLanguage: String empty) isKindOf: Collection).
	
	self assert: ((ethnologueRepository countriesForLanguage: '78efeba6-bca2-0d00-bfcd-eb6108a3fa98') isKindOf: Collection).
	
	self assert: ((ethnologueRepository countriesForLanguage: nil) isKindOf: Collection).
	
	self assert: ((ethnologueRepository countriesForLanguage: 'e5f0eba6-bca2-0d00-ac43-63670f688924') equals: Collection).
	
]

{ #category : #tests }
EthnologueRepositoryTest >> testCountryNamed [

	self assert: ((ethnologueRepository countryNamed: String empty) isKindOf: EthCountry).
	
	self assert: ((ethnologueRepository countryNamed: 'a5d3eaa6-bca2-0d00-b59a-4c4c0e2e5414') isKindOf: EthCountry).
	
	self assert: ((ethnologueRepository countryNamed: nil) isKindOf: EthCountry).
	
	self assert: ((ethnologueRepository countryNamed: 'e3e7eaa6-bca2-0d00-943b-5c180c4e3e88') equals: EthCountry).
	
]

{ #category : #tests }
EthnologueRepositoryTest >> testIso2Languages [

	self assert: (ethnologueRepository iso2Languages isKindOf: Collection).

]

{ #category : #tests }
EthnologueRepositoryTest >> testIso3Languages [

	self assert: (ethnologueRepository iso3Languages isKindOf: Collection).

]

{ #category : #tests }
EthnologueRepositoryTest >> testLanguageNamed [

	self assert: ((ethnologueRepository languageNamed: String empty) isKindOf: EthLanguage).
	
	self assert: ((ethnologueRepository languageNamed: '585eeba6-bca2-0d00-b4fb-fa460c6000ab') isKindOf: EthLanguage).
	
	self assert: ((ethnologueRepository languageNamed: nil) isKindOf: EthLanguage).
	
	self assert: ((ethnologueRepository languageNamed: 'e05feba6-bca2-0d00-ae3a-23ed0b996375') equals: EthLanguage).
	
]

{ #category : #tests }
EthnologueRepositoryTest >> testLanguages [

	self assert: (ethnologueRepository languages isKindOf: Collection).

]

{ #category : #tests }
EthnologueRepositoryTest >> testLanguagesIn [

	self assert: ((ethnologueRepository languagesIn: String empty) isKindOf: Collection).
	
	self assert: ((ethnologueRepository languagesIn: '9f1deca6-bca2-0d00-8ec3-8cbf0f0f6fab') isKindOf: Collection).
	
	self assert: ((ethnologueRepository languagesIn: nil) isKindOf: Collection).
	
	self assert: ((ethnologueRepository languagesIn: '0e1feca6-bca2-0d00-b4c3-0a140499eee7') equals: Collection).
	
]
