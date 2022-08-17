"
Abstract class which provides a factory method to create different language status types.
See class side for details.
"
Class {
	#name : #ELanguageStatus,
	#superclass : #Object,
	#classVars : [
		'LanguageStatus'
	],
	#category : #'Ethnologue-Language'
}

{ #category : #accessing }
ELanguageStatus class >> identifier [
	"Answer a <Character> with the receiver's ethnologue code table identifier"

	self subclassResponsibility
]

{ #category : #'class initialization' }
ELanguageStatus class >> initialize [
	"Private - Initialize the receiver's status"

	LanguageStatus := IdentityDictionary new.
	self subclassesDo: [: cls |
		LanguageStatus at: cls identifier	put: cls ]
]

{ #category : #accessing }
ELanguageStatus class >> languageStatus [

	^ LanguageStatus
		ifNil: [ self initialize.
				LanguageStatus ]
]

{ #category : #'instance creation' }
ELanguageStatus class >> newStatus: aString [
	"Answer a new <ELanguageStatus> subclass matching aString parameter type"
	
	^ self languageStatus
		at: aString asECharacter
		ifAbsent: [ self error: 'Unrecognized Language Status' ]
]

{ #category : #'class initialization' }
ELanguageStatus class >> reset [
	" Private - Reset the receiver's status "

	LanguageStatus := nil
]
