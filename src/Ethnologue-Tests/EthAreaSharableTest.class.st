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

]

{ #category : #tests }
EthAreaSharableTest >> testAreas [

	self assert: (ethAreaSharable areas isKindOf: Collection).

]

{ #category : #tests }
EthAreaSharableTest >> testCreateAfricaArea [

	self assert: (ethAreaSharable createAfricaArea isKindOf: EthArea).

]

{ #category : #tests }
EthAreaSharableTest >> testCreateAmericasArea [

	self assert: (ethAreaSharable createAmericasArea isKindOf: EthArea).

]

{ #category : #tests }
EthAreaSharableTest >> testCreateAsiaArea [

	self assert: (ethAreaSharable createAsiaArea isKindOf: EthArea).

]

{ #category : #tests }
EthAreaSharableTest >> testCreateEuropeArea [

	self assert: (ethAreaSharable createEuropeArea isKindOf: EthArea).

]

{ #category : #tests }
EthAreaSharableTest >> testCreatePacificArea [

	self assert: (ethAreaSharable createPacificArea isKindOf: EthArea).

]
