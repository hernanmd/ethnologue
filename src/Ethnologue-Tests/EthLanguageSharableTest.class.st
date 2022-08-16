Class {
	#name : #EthLanguageSharableTest,
	#superclass : #EthAbstractTest,
	#instVars : [
		'ethLanguageSharable'
	],
	#category : #'Ethnologue-Tests'
}

{ #category : #accessing }
EthLanguageSharableTest >> ethLanguageSharable [
	" Answer the ethLanguageSharable of this EthLanguageSharableTest "

	^ ethLanguageSharable
]

{ #category : #accessing }
EthLanguageSharableTest >> ethLanguageSharable: anObject [
	" Sets the ethLanguageSharable of this EthLanguageSharableTest "

	ethLanguageSharable := anObject
]

{ #category : #running }
EthLanguageSharableTest >> setUp [

	super setUp.
	ethLanguageSharable := EthLanguageSharable new.
]

{ #category : #tests }
EthLanguageSharableTest >> testAddLanguage [

	| aMockLang |
	
	aMockLang := self newMockLanguage.
	self assert: ethLanguageSharable languages isEmpty.
	ethLanguageSharable addLanguage: aMockLang.
	
	self 
		assertCollection: ethLanguageSharable languages
		hasSameElements: { aMockLang }.

	ethLanguageSharable addLanguage: aMockLang.

	self assert: ethLanguageSharable languages size equals: 1.

]

{ #category : #tests }
EthLanguageSharableTest >> testLanguageNamed [

	| aMockLang |
	
	aMockLang := self newMockLanguage name: self mockLanguageName.
	self should: [ ethLanguageSharable languageNamed: 'Blabla' ] raise: NotFound.
	self should: [ ethLanguageSharable languageNamed: '' ] raise: NotFound.
	self should: [ ethLanguageSharable languageNamed: nil ] raise: MessageNotUnderstood.

	ethLanguageSharable addLanguage: aMockLang.

	self 
		assert: (ethLanguageSharable languageNamed: self mockLanguageName) 
		equals: aMockLang.

]

{ #category : #tests }
EthLanguageSharableTest >> testLanguageNamedIfAbsent [

	| aMockLang |
	
	aMockLang := self newMockLanguage name: self mockLanguageName.
	self assert: (ethLanguageSharable languageNamed: 'Blabla' ifAbsent: [ 'hello' ]) equals: 'hello'.

	ethLanguageSharable addLanguage: aMockLang.

	self 
		assert: (ethLanguageSharable languageNamed: self mockLanguageName ifAbsent: [ 'hello' ]) 
		equals: aMockLang.
]

{ #category : #tests }
EthLanguageSharableTest >> testLanguages [

	self assert: (ethLanguageSharable languages isKindOf: Collection).
	self assert: ethLanguageSharable languages isEmpty.

]
