Class {
	#name : #ECommonDialectTest,
	#superclass : #TestCase,
	#instVars : [
		'eCommonDialect'
	],
	#category : #'Ethnologue-Tests'
}

{ #category : #accessing }
ECommonDialectTest >> eCommonDialect [
	" Answer the eCommonDialect of this ECommonDialectTest "

	^ eCommonDialect
]

{ #category : #accessing }
ECommonDialectTest >> eCommonDialect: anObject [
	" Sets the eCommonDialect of this ECommonDialectTest "

	eCommonDialect := anObject
]

{ #category : #running }
ECommonDialectTest >> setUp [
	super setUp.

]
