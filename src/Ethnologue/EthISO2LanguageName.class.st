Class {
	#name : #EthISO2LanguageName,
	#superclass : #EthISOLanguageName,
	#category : #'Ethnologue-Language'
}

{ #category : #printing }
EthISO2LanguageName class >> nameType [

	^ 'ISO-2'
]

{ #category : #testing }
EthISO2LanguageName >> isIso2 [
	
	^ true
]
