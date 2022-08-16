Class {
	#name : #EthnologueReaderTest,
	#superclass : #TestCase,
	#instVars : [
		'ethnologueReader'
	],
	#category : #'Ethnologue-Tests'
}

{ #category : #accessing }
EthnologueReaderTest >> ethnologueReader [
	" Answer the ethnologueReader of this EthnologueReaderTest "

	^ ethnologueReader
]

{ #category : #accessing }
EthnologueReaderTest >> ethnologueReader: anObject [
	" Sets the ethnologueReader of this EthnologueReaderTest "

	ethnologueReader := anObject
]

{ #category : #running }
EthnologueReaderTest >> setUp [

	super setUp.
	EthnologueReader release.
	ethnologueReader := EthnologueReader new.
]

{ #category : #tests }
EthnologueReaderTest >> testAddCountries [

	self assert: EthCountrySharable default countries isEmpty.
	ethnologueReader addCountries.
	self deny: EthCountrySharable default countries isEmpty.
	
]

{ #category : #tests }
EthnologueReaderTest >> testCountriesCodesData [

	| ccStream ccContents |
	
	ccStream := ethnologueReader countriesCodesData.
	self assert: ccStream isStream.
	self deny: ccStream isBinary.
	ccContents := ccStream contents.
	self assert: ccContents notEmpty.
	self assert: (ccContents beginsWith: 'CountryID').

]

{ #category : #tests }
EthnologueReaderTest >> testCreateCountryFrom [

	self assert: ((ethnologueReader createCountryFrom: String empty) isKindOf: EthCountry).
	
	self assert: ((ethnologueReader createCountryFrom: '2449879d-bca2-0d00-b507-94ba07da7ab3') isKindOf: EthCountry).
	
	self assert: ((ethnologueReader createCountryFrom: nil) isKindOf: EthCountry).
	
	self assert: ((ethnologueReader createCountryFrom: 'f04d879d-bca2-0d00-955b-859f06b532a0') equals: EthCountry).
	
]

{ #category : #tests }
EthnologueReaderTest >> testCreateLanguageFrom [

	self should: [ ethnologueReader createLanguageFrom: String empty ] raise: SubscriptOutOfBounds.
	self should: [ ethnologueReader createLanguageFrom: '1e49f39a-bca2-0d00-a396-0039005e8afc' ] raise: NotFound.
	self should: [ ethnologueReader createLanguageFrom: #('1e49f39a-bca2' '0d00-a396-0039005e8afc') ] raise: NotFound.

	self should: [ ethnologueReader createLanguageFrom: nil ] raise: MessageNotUnderstood.

	
]

{ #category : #tests }
EthnologueReaderTest >> testDataSubdirectory [

	self assert: (ethnologueReader dataSubdirectory isKindOf: FileReference).
	self assert: ethnologueReader dataSubdirectory exists.
]

{ #category : #tests }
EthnologueReaderTest >> testLanguageCodesData [

	| lcStream lcContents |
	
	lcStream := ethnologueReader languageCodesData.
	self assert: lcStream isStream.
	self deny: lcStream isBinary.
	lcContents := lcStream contents.
	self assert: lcContents notEmpty.
	self assert: (lcContents beginsWith: 'LangID').

]

{ #category : #tests }
EthnologueReaderTest >> testLanguageIndexesData [

	| liStream liContents |
	
	liStream := ethnologueReader languageIndexesData.
	self assert: liStream isStream.
	self deny: liStream isBinary.
	liContents := liStream contents.
	self assert: liContents notEmpty.
	self assert: (liContents beginsWith: 'LangID').
]
