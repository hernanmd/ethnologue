"
From : http://www.ethnologue.com./ethno_docs/introduction.asp#status

The phrase ""Second language only"" is used to indicate languages which are used as special second languages with no mother-tongue speakers such as languages of initiation, languages of herb doctors, cants, jargons, and American Plains Indian Sign Language. Such languages are listed in the body of the Ethnologue but not included among the statistical summaries of living languages. The inventory of these languages is also incomplete.

The phrase ""Nearly extinct"" is used to indicate those languages of fewer than 50 speakers and other languages for which the number of speakers is a very small fraction of the ethnic group.
"
Class {
	#name : #ELanguageStatus,
	#superclass : #Object,
	#classVars : [
		'LanguageStatus'
	],
	#category : #'Ethnologue-Language'
}

{ #category : #'class initialization' }
ELanguageStatus class >> initialize [
	" Private - Initialize the receiver's status "

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
	" Answer a new corresponding ELanguageStatus subclass depending of aString parameter "
	
	^ self languageStatus
		at: aString asECharacter
		ifAbsent: [ self error: 'Unrecognized Language Status' ]
]

{ #category : #'class initialization' }
ELanguageStatus class >> reset [
	" Private - Reset the receiver's status "

	LanguageStatus := nil
]
