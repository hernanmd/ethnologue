"
An EArea is a Continent

"
Class {
	#name : #EthArea,
	#superclass : #Object,
	#instVars : [
		'names'
	],
	#category : #'Ethnologue-Geography'
}

{ #category : #accessing }
EthArea >> englishName [
	"Answer a <String> representing the receiver's name in English"
	
	^ self names at: #english

]

{ #category : #accessing }
EthArea >> englishName: aString [
	"Set the receiver's name in English"
	
	self names 
		at: #english
		put: aString
]

{ #category : #initialization }
EthArea >> initialize [
	" Private - Configure the receiver's names collection "
	
	super initialize.
	self names: IdentityDictionary new.
]

{ #category : #accessing }
EthArea >> names [
	"Answer a <Collection> of <String>"

	^ names
]

{ #category : #accessing }
EthArea >> names: anObject [
	names := anObject
]

{ #category : #defaults }
EthArea >> preferredName [
	"Private - Answer a <Symbol> to determine the default preferred language name in which receiver will be displayed"

	^ #spanishName
]

{ #category : #printing }
EthArea >> printOn: aStream [
	"Private - See superimplementor's comment"
	
	aStream nextPutAll: (self perform: self preferredName)
]

{ #category : #accessing }
EthArea >> spanishName [
	"Answer a <String> representing the receiver's name in Spanish"
	
	^ self names at: #spanish

]

{ #category : #accessing }
EthArea >> spanishName: aString [
	" Set the receiver's name in Spanish "
	
	self names 
		at: #spanish
		put: aString
]
