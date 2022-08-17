Class {
	#name : #EthAreaSharableTest,
	#superclass : #TestCase,
	#instVars : [
		'ethAreaSharable'
	],
	#category : #'Ethnologue-Tests'
}

{ #category : #accessing }
EthAreaSharableTest >> ethAreaSharable [
	" Answer the ethAreaSharable of this EthAreaSharableTest "

	^ ethAreaSharable
]

{ #category : #accessing }
EthAreaSharableTest >> ethAreaSharable: anObject [
	" Sets the ethAreaSharable of this EthAreaSharableTest "

	ethAreaSharable := anObject
]

{ #category : #running }
EthAreaSharableTest >> setUp [

	super setUp.
	ethAreaSharable := EthAreaSharable new.
]

{ #category : #tests }
EthAreaSharableTest >> testAreas [

	self assert: (ethAreaSharable areas isKindOf: Collection).
	self assertEmpty: ethAreaSharable areas.
	
	ethAreaSharable americas.
	self denyEmpty: ethAreaSharable areas.
]

{ #category : #tests }
EthAreaSharableTest >> testCreateAfricaArea [

	self assert: (ethAreaSharable createAfricaArea isKindOf: EthArea).
	self assert: ethAreaSharable createAfricaArea englishName equals: 'Africa'.

]

{ #category : #tests }
EthAreaSharableTest >> testCreateAmericasArea [

	self assert: (ethAreaSharable createAmericasArea isKindOf: EthArea).
	self assert: ethAreaSharable createAmericasArea englishName equals: 'Americas'.
]

{ #category : #tests }
EthAreaSharableTest >> testCreateAsiaArea [

	self assert: (ethAreaSharable createAsiaArea isKindOf: EthArea).
	self assert: ethAreaSharable createAsiaArea englishName equals: 'Asia'.
]

{ #category : #tests }
EthAreaSharableTest >> testCreateEuropeArea [

	self assert: (ethAreaSharable createEuropeArea isKindOf: EthArea).

]

{ #category : #tests }
EthAreaSharableTest >> testCreatePacificArea [

	self assert: (ethAreaSharable createPacificArea isKindOf: EthArea).

]
