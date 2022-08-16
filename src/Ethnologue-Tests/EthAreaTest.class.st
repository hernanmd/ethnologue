Class {
	#name : #EthAreaTest,
	#superclass : #TestCase,
	#instVars : [
		'ethArea'
	],
	#category : #'Ethnologue-Tests'
}

{ #category : #accessing }
EthAreaTest >> ethArea [
	" Answer the ethArea of this EthAreaTest "

	^ ethArea
]

{ #category : #accessing }
EthAreaTest >> ethArea: anObject [
	" Sets the ethArea of this EthAreaTest "

	ethArea := anObject
]

{ #category : #running }
EthAreaTest >> setUp [

	super setUp.
	ethArea := EthArea new.
]

{ #category : #tests }
EthAreaTest >> testEnglishName [

	self should: [ ethArea englishName ] raise: NotFound.
	ethArea englishName: 'MCK'.
	self assert: (ethArea englishName isKindOf: String).
	self assert: ethArea englishName equals: 'MCK'.
	
	self should: [ ethArea spanishName ] raise: NotFound.

]

{ #category : #tests }
EthAreaTest >> testNames [

	self assert: (ethArea names isKindOf: Collection).
	ethArea englishName: 'MCK'.
	self assert: (ethArea names isKindOf: Collection).
	self assert: ethArea names size equals: 1.
	
	ethArea spanishName: 'MOC'.
	self assert: (ethArea names isKindOf: Collection).
	self assert: ethArea names size equals: 2.

	self
		assertCollection: ethArea names
		hasSameElements: #('MCK' 'MOC')
]

{ #category : #tests }
EthAreaTest >> testPreferredName [

	self assert: (ethArea preferredName isKindOf: Symbol).

]

{ #category : #tests }
EthAreaTest >> testSpanishName [

	self should: [ ethArea spanishName ] raise: NotFound.
	ethArea spanishName: 'MOC'.
	self assert: (ethArea spanishName isKindOf: String).
	self assert: ethArea spanishName equals: 'MOC'.
	
	self should: [ ethArea englishName ] raise: NotFound.
]
