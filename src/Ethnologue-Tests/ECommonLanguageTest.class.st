Class {
	#name : #ECommonLanguageTest,
	#superclass : #TestCase,
	#instVars : [
		'eCommonLanguage'
	],
	#category : #'Ethnologue-Tests'
}

{ #category : #accessing }
ECommonLanguageTest >> eCommonLanguage [
	" Answer the eCommonLanguage of this ECommonLanguageTest "

	^ eCommonLanguage
]

{ #category : #accessing }
ECommonLanguageTest >> eCommonLanguage: anObject [
	" Sets the eCommonLanguage of this ECommonLanguageTest "

	eCommonLanguage := anObject
]

{ #category : #running }
ECommonLanguageTest >> setUp [
	super setUp.

]
