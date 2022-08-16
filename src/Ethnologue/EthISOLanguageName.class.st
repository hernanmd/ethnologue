"
name		<String>
"
Class {
	#name : #EthISOLanguageName,
	#superclass : #EthnologueNamedObject,
	#category : #'Ethnologue-Language'
}

{ #category : #printing }
EthISOLanguageName class >> nameType [

	self subclassResponsibility
]

{ #category : #testing }
EthISOLanguageName >> isIso2 [
	
	^ false
]

{ #category : #testing }
EthISOLanguageName >> isIso3 [
	
	^ false
]

{ #category : #printing }
EthISOLanguageName >> printOn: aStream [

	aStream 
		nextPutAll: self name asString;
		space;
		nextPut: $(;
		nextPutAll: self class nameType;
		nextPut: $)
		
		
]
