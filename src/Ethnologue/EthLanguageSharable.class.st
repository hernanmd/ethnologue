"
This class is a Flyweight repository of languages.

The table structure is available at: [https://www.ethnologue.com/codes/code-table-structure](https://www.ethnologue.com/codes/code-table-structure)

Refer to `EthnologueLanguageReader` for further documentation. 

"
Class {
	#name : #EthLanguageSharable,
	#superclass : #Object,
	#instVars : [
		'languagesPool'
	],
	#classVars : [
		'ESingleton'
	],
	#category : #'Ethnologue-Core'
}

{ #category : #accessing }
EthLanguageSharable class >> default [
	" Answer the class' primary instance "
	
	^ ESingleton
		ifNil: [ self initialize.
				ESingleton ]
]

{ #category : #'class initialization' }
EthLanguageSharable class >> initialize [
	" Set the class' initial state "
	
	ESingleton := self new.
	EthnologueReader new.

]

{ #category : #'instance creation' }
EthLanguageSharable class >> new [
	" Create and return an instance of the class "
	
	^ self basicNew initialize
]

{ #category : #dependencies }
EthLanguageSharable class >> release [
	" Prepare the class to be deleted "
	
	ESingleton := nil.
	^ self
]

{ #category : #'accessing public' }
EthLanguageSharable >> addLanguage: aLILanguage [
	" Adds aLICountry to the receiver "
	
	self languagesPool at: aLILanguage name ifAbsentPut: aLILanguage
]

{ #category : #initialization }
EthLanguageSharable >> initialize [
	" Private - Configure the instance's initial state "
	
	super initialize.
	self languagesPool: IdentityDictionary new.
	
]

{ #category : #querying }
EthLanguageSharable >> languageNamed: aLanguageName [
	"Answer the <EthLanguage> named aLanguageName, or raise a not found exception"
	
	^ languagesPool 
		at: aLanguageName asSymbol
		ifAbsent: [
			self languages
				detect: [ : lang | lang name = aLanguageName or: [ lang identifierNames includes: aLanguageName asSymbol ] ]
				ifNone: [ NotFound signal: aLanguageName ] ]
					
]

{ #category : #querying }
EthLanguageSharable >> languageNamed: aLanguageName ifAbsent: aBlock [
	" Answer an Language named aLanguageName "
	
	^ languagesPool 
		at: aLanguageName asSymbol
		ifAbsent: [
			self languages 
				detect: [ : lang | lang name = aLanguageName or: [ lang identifierNames includes: aLanguageName asSymbol ] ]
				ifNone: aBlock ]
					
]

{ #category : #querying }
EthLanguageSharable >> languages [
	" Answer a <Collection> containing the receiver's objects "
	
	^ languagesPool values
]

{ #category : #'accessing private' }
EthLanguageSharable >> languagesPool [
	^languagesPool
]

{ #category : #'accessing private' }
EthLanguageSharable >> languagesPool: anObject [
	languagesPool := anObject
]
