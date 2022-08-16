"
code		<ELanguage>		The ""owner"" of the receiver.
country		<ECountry>		The country where is spoken the receiver
name		<String>			Name of the receiver
"
Class {
	#name : #ELanguageType,
	#superclass : #EthnologueNamedObject,
	#instVars : [
		'parent',
		'country'
	],
	#classVars : [
		'LanguageTypes'
	],
	#category : #'Ethnologue-Language'
}

{ #category : #'class initialization' }
ELanguageType class >> initialize [
	" Private - Initialize the receiver's types "

	LanguageTypes := Dictionary new.
	self subclassesDo: [: cls |
		LanguageTypes at: cls identifier	put: cls ]
]

{ #category : #accessing }
ELanguageType class >> languageTypes [

	^ LanguageTypes 
			ifNil: [ self initialize.
					LanguageTypes ]
]

{ #category : #'instance creation' }
ELanguageType class >> newType: aString [
	" Answer a new corresponding ELanguageType's subclass depending of aString parameter "
	
	^ (self languageTypes
			at: aString
			ifAbsent: [ self error: 'Unrecognized Language Type' ]) new
]

{ #category : #'class initialization' }
ELanguageType class >> reset [
	" Private - Reset the receiver's types "

	LanguageTypes := nil
]

{ #category : #testing }
ELanguageType >> <= anELanguageType [
	" Answer <true> if receiver's name sorts before or equal 
	to anELanguageType name "

	^ self name <= anELanguageType name
]

{ #category : #accessing }
ELanguageType >> country [
	^ country
]

{ #category : #accessing }
ELanguageType >> country: anObject [
	country := anObject
]

{ #category : #testing }
ELanguageType >> isCommonDialect [

	^ false
]

{ #category : #testing }
ELanguageType >> isCommonLanguage [

	^ false
]

{ #category : #accessing }
ELanguageType >> parent [
	^ parent
]

{ #category : #accessing }
ELanguageType >> parent: anObject [
	parent := anObject
]

{ #category : #printing }
ELanguageType >> printOn: aStream [
	"Private - See superimplementor's comment"

	self parent 
		ifNotNil: [ : aCountry |
			aStream
				nextPutAll: aCountry name;
				space ].
	self name 
		ifNotNil: [ : aName |
			aStream
				<< $(	
				<<  aName;
				<< $) ]
		ifNil: [ aStream << '(No name)'].
	aStream space.
	self country
		ifNotNil: [ : aCountry | aStream << aCountry name ]
		ifNil: [ aStream << 'No country' ]
]
