"
Represents a country as defined by ISO3166-1 and taken from the Ethnologue project CountriesCodes code table.

# Instance Variables

|**Instance variable**|**Class**|**Purpose**|
|area|	<EthArea>	|An Area (a Continent)|
|identifier|	<String>|The identifier code of the country|
|name|<String>|	English name of the country|
|languages|<Collection>|Languages spoken in the country|
|cities|<Collection>|Cities of the country|
|languageTypes|	<Collection>|Language types found in the country|
|officialLanguages|<Collection>|Languages with official status in the country|
|spokenLanguages|<Collection>|Languages spoken (no official status) in the country|
|url|<String>|Location of a document on the Internet with additional information about the country|


"
Class {
	#name : #EthCountry,
	#superclass : #EthnologueNamedObject,
	#instVars : [
		'area',
		'identifier',
		'url',
		'languages',
		'languageTypes'
	],
	#category : #'Ethnologue-Geography'
}

{ #category : #testing }
EthCountry >> <= anECountry [
	" Answer <true> if receiver's name sorts before or equal to anECountry name "

	^ self name <= anECountry name
]

{ #category : #comparing }
EthCountry >> = anEthCountry [
	"Two countries are equal if
	 (a) they are the same 'kind' of thing.
	 (b) they have the same name.
	 (c) each element occurs the same number of times in both of them"

	^ self species = anEthCountry species and: [ self name = anEthCountry name ]
]

{ #category : #adding }
EthCountry >> addLanguage: anELanguage [
	" Add anELanguage as a spoken language in the receiver "
	
	self languages add: anELanguage
]

{ #category : #adding }
EthCountry >> addLanguageType: anELanguageType [
	"Add anELanguageType as a language type in the receiver"
	
	self languageTypes add: anELanguageType
]

{ #category : #accessing }
EthCountry >> area [
	"Answer an <EthArea> representing a receiver's area, or nil if there is not any"

	^ area
]

{ #category : #accessing }
EthCountry >> area: anObject [
	area := anObject
]

{ #category : #querying }
EthCountry >> commonLanguages [
	" Answer a <Collection> with common languages spoken in the receiver (according to ISO 639) "
	
	^ (self languageTypes select: #isCommonLanguage) asSortedCollection
]

{ #category : #querying }
EthCountry >> dialectLanguages [
	" Answer a <Collection> with dialect languages spoken in the receiver (according to ISO 639) "
	
	^ (self languageTypes select: #isCommonDialect) asSortedCollection
]

{ #category : #comparing }
EthCountry >> hash [
	"hash is implemented because #= is implemented"
	
	^ self species hash bitXor: self name hash
]

{ #category : #accessing }
EthCountry >> identifier [
	"Answer a <String> representing an identification for the receiver, or nil if not found"

	^ identifier
]

{ #category : #accessing }
EthCountry >> identifier: anObject [
	identifier := anObject
]

{ #category : #accessing }
EthCountry >> languageTypes [
	"Answer a <Collection> with receiver's types"

	^ languageTypes
		ifNil: [ languageTypes := Set new ]
]

{ #category : #accessing }
EthCountry >> languageTypes: aCollection [

	languageTypes := aCollection
]

{ #category : #accessing }
EthCountry >> languages [
	"Answer a <Collection> of languages found in the receiver"

	^ languages
		ifNil: [ languages := Set new ]
]

{ #category : #accessing }
EthCountry >> languages: aCollection [

	languages := aCollection
]

{ #category : #printing }
EthCountry >> printOn: aStream [
	" See superimplementor's comment "
	
	aStream nextPutAll: self name
]

{ #category : #accessing }
EthCountry >> url [
	"Answer a <String> representing an Ethnologue URL for the receiver, or nil if not set"

	^ url
]

{ #category : #accessing }
EthCountry >> url: anObject [
	url := anObject
]
