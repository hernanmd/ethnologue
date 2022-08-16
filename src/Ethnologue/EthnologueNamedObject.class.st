Class {
	#name : #EthnologueNamedObject,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : #'Ethnologue-Language'
}

{ #category : #accessing }
EthnologueNamedObject >> name [

	^ name
]

{ #category : #accessing }
EthnologueNamedObject >> name: anObject [
	name := anObject
]
