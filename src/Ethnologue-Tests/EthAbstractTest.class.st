Class {
	#name : #EthAbstractTest,
	#superclass : #TestCase,
	#category : #'Ethnologue-Tests'
}

{ #category : #tests }
EthAbstractTest >> mockCountryName [

	^ 'MockCountry'
]

{ #category : #tests }
EthAbstractTest >> mockLanguageName [

	^ 'MockLanguage'
]

{ #category : #test }
EthAbstractTest >> newMockCountry [

	^ EthCountry new
		name: self mockCountryName;
		yourself.
]

{ #category : #tests }
EthAbstractTest >> newMockLanguage [

	^ EthLanguage new.
]
