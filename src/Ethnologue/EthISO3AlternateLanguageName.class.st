"
Represents an alternate name code for a language
"
Class {
	#name : #EthISO3AlternateLanguageName,
	#superclass : #EthISOLanguageName,
	#category : #'Ethnologue-Language'
}

{ #category : #printing }
EthISO3AlternateLanguageName class >> nameType [

	^ 'ISO-3 alt'
]

{ #category : #testing }
EthISO3AlternateLanguageName >> isIso3 [
	
	^ true
]
