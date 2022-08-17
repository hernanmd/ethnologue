Class {
	#name : #EthnologueRepositoryTest,
	#superclass : #EthAbstractTest,
	#instVars : [
		'ethnologueRepository',
		'ethnologueReader'
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

{ #category : #tests }
EthnologueRepositoryTest >> nigeria [

	^ EthCountry new 
		identifier: 'NG';
		area: EthAreaSharable default africa;
		name: 'Nigeria'; 
		url: 'http://www.ethnologue.com/show_country.asp?code=NG';
		yourself
]

{ #category : #running }
EthnologueRepositoryTest >> setUp [

	super setUp.
	ethnologueRepository := EthnologueRepository new.
	ethnologueReader := EthnologueReader basicNew
		countriesCodesData: self mockCountryCodes readStream;
		languageIndexesData: self mockLanguageIndex readStream;
		languageCodesData: self mockLanguageCodes readStream;
		initialize;
		yourself.
]

{ #category : #tests }
EthnologueRepositoryTest >> testAreas [

	self assert: (ethnologueRepository areas isKindOf: Collection).

]

{ #category : #tests }
EthnologueRepositoryTest >> testCommonLanguagesFor [

	self should: [ ethnologueRepository commonLanguagesFor: String empty ] raise: NotFound.
	self should: [ ethnologueRepository commonLanguagesFor: '7308eca6-bca2-0d00-a0de-1afa08357045' ] raise: NotFound.
	self should: [ ethnologueRepository commonLanguagesFor: nil ] raise: MessageNotUnderstood.
	
	self assert: ((ethnologueRepository commonLanguagesFor: 'Nigeria') isKindOf: Collection).
	
]

{ #category : #tests }
EthnologueRepositoryTest >> testCountries [

	self assert: (ethnologueRepository countries isKindOf: Collection).

]

{ #category : #tests }
EthnologueRepositoryTest >> testCountriesForLanguage [

	self should: [ ethnologueRepository countriesForLanguage: String empty ] raise: NotFound.
	self should: [ ethnologueRepository countriesForLanguage: '78efeba6-bca2-0d00-bfcd-eb6108a3fa98' ] raise: NotFound.
	self should: [ ethnologueRepository countriesForLanguage: nil ] raise: MessageNotUnderstood.
	
	self 
		assertCollection: (ethnologueRepository countriesForLanguage: 'Arum') 
		hasSameElements: { (EthCountry new name: 'Nigeria') }.
]

{ #category : #tests }
EthnologueRepositoryTest >> testCountryNamed [

	self should: [ ethnologueRepository countryNamed: String empty ] raise: NotFound.
	self should: [ ethnologueRepository countryNamed: 'a5d3eaa6-bca2-0d00-b59a-4c4c0e2e5414' ] raise: NotFound.
	self should: [ ethnologueRepository countryNamed: nil ] raise: MessageNotUnderstood.
	
	self 
		assert: (ethnologueRepository countryNamed: 'Nigeria') 
		equals: self nigeria.
	
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

	self should: [ ethnologueRepository languageNamed: String empty ] raise: NotFound.
	self should: [ ethnologueRepository languageNamed: '585eeba6-bca2-0d00-b4fb-fa460c6000ab' ] raise: NotFound.
	self should: [ ethnologueRepository languageNamed: nil ] raise: MessageNotUnderstood.
	
	self assert: ((ethnologueRepository languageNamed: 'Arum') isKindOf: EthLanguage).

]

{ #category : #tests }
EthnologueRepositoryTest >> testLanguages [

	self assert: (ethnologueRepository languages isKindOf: Collection).

]

{ #category : #tests }
EthnologueRepositoryTest >> testLanguagesIn [

	self should: [ ethnologueRepository languagesIn: String empty ] raise: NotFound.
	self should: [ ethnologueRepository languagesIn: '9f1deca6-bca2-0d00-8ec3-8cbf0f0f6fab' ] raise: NotFound.
	self should: [ ethnologueRepository languagesIn: nil ] raise: MessageNotUnderstood.
	
	
]
