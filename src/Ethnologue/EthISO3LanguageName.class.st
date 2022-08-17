"
Represents an language identifier in ISO 3 format.
"
Class {
	#name : #EthISO3LanguageName,
	#superclass : #EthISOLanguageName,
	#category : #'Ethnologue-Language'
}

{ #category : #printing }
EthISO3LanguageName class >> nameType [

	^ 'ISO-3'
]

{ #category : #testing }
EthISO3LanguageName >> isIso3 [
	
	^ true
]
