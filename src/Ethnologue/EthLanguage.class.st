"
Represents a language as defined by Ethnologue.

See `EthnologueRepository` to see usage examples.

- countries:		<Collection>
- identifier:		<String>
- name:			<String>
- names:			<Collection>
- status:			<ELanguageStatus>
- type:			<ELanguageType>
- scripts:			<Collection>

"
Class {
	#name : #EthLanguage,
	#superclass : #EthnologueNamedObject,
	#instVars : [
		'identifier',
		'names',
		'status',
		'types',
		'country',
		'identifiers'
	],
	#category : #'Ethnologue-Core'
}

{ #category : #comparing }
EthLanguage >> <= aLILanguage [

	^ self name <= aLILanguage name
]

{ #category : #'accessing adding' }
EthLanguage >> addCountry: anECountry [
	" Add anECountry to the receiver "

	self country add: anECountry
]

{ #category : #'accessing adding' }
EthLanguage >> addIdentifier: anISOLanguageName [
	" Add anISOLanguageName to the receiver "

	self identifiers add: anISOLanguageName.
	anISOLanguageName class = EthISO3LanguageName
		ifTrue: [ self identifier: anISOLanguageName ]
]

{ #category : #querying }
EthLanguage >> countries [
	" Answer a <Collection> with the countries where the receiver is used "
	
	^ (self types collect: [: lt | lt country ]) asSet asSortedCollection
]

{ #category : #accessing }
EthLanguage >> country [
	"Answer the <EthCountry> where the receiver is used, or nil if not set"
	
	^ country
]

{ #category : #accessing }
EthLanguage >> country: anECountry [ 
	" Set the receiver's main country to anECountry "

	country := anECountry
]

{ #category : #testing }
EthLanguage >> hasIso2Identifier [
	"Answer <true> if any of the receiver's identifiers has an ISO2 representation"

	^ self identifiers anySatisfy: [: id | id isIso2 ]
]

{ #category : #testing }
EthLanguage >> hasIso3Identifier [
	"Answer <true> if any of the receiver's identifiers has an ISO3 representation"

	^ self identifiers anySatisfy: [: id | id isIso3 ]
]

{ #category : #accessing }
EthLanguage >> identifier [
	^identifier
]

{ #category : #accessing }
EthLanguage >> identifier: anISOLanguageName [
	" Set the receiver's main identifier to anISOLanguageName "

	identifier := anISOLanguageName
]

{ #category : #querying }
EthLanguage >> identifierNames [
	" Answer a <Collection> with the receiver's identifier names "
	
	^ self identifiers collect: [: id | id name ]
]

{ #category : #querying }
EthLanguage >> identifiers [
	" Answer a <Collection> with the receiver's identifiers "
	
	^ identifiers
		ifNil: [ identifiers := Set new: 2 ]
]

{ #category : #accessing }
EthLanguage >> names [
	"Answer a <Collection> representing the receiver's known names"

	^ names
		ifNil: [ names := OrderedCollection new ]
]

{ #category : #accessing }
EthLanguage >> names: anObject [
	names := anObject
]

{ #category : #printing }
EthLanguage >> printOn: aStream [
	" See superimplementor's comment "
	
	aStream nextPutAll: self name
]

{ #category : #accessing }
EthLanguage >> status [
	^status
]

{ #category : #accessing }
EthLanguage >> status: anObject [
	status := anObject
]

{ #category : #accessing }
EthLanguage >> types [
	" Answer a <Collection> of the receiver language subtypes "
	
	^ types
		ifNil: [ types := OrderedCollection new ]
]

{ #category : #accessing }
EthLanguage >> types: anELanguageTypeCollection [

	types := anELanguageTypeCollection
]
