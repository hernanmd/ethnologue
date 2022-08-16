"
Flyweight repository of continents
"
Class {
	#name : #EthAreaSharable,
	#superclass : #Object,
	#instVars : [
		'areasPool'
	],
	#classVars : [
		'ESingleton'
	],
	#category : #'Ethnologue-Geography'
}

{ #category : #accessing }
EthAreaSharable class >> default [
	" Answer the class' primary instance "
	
	^ ESingleton
		ifNil: [ self initialize.
				ESingleton ]	

]

{ #category : #'initialize-release' }
EthAreaSharable class >> initialize [
	" Set the class' initial state "
	
	ESingleton := self new.
	^ self.
]

{ #category : #'instance creation' }
EthAreaSharable class >> new [
	" Create and return an instance of the class "
	
	^ self basicNew initialize
]

{ #category : #'initialize-release' }
EthAreaSharable class >> release [
	" Prepare the class to be deleted "
	
	ESingleton := nil.
	^ self
]

{ #category : #sharables }
EthAreaSharable >> africa [
	" Answer the sharable for the resource named africa "
	
	^ areasPool
		at: #africa
		ifAbsentPut: [ self createAfricaArea ]
]

{ #category : #sharables }
EthAreaSharable >> americas [
	" Answer the sharable for the resource named americas "
	
	^ areasPool
		at: #americas
		ifAbsentPut: [ self createAmericasArea ]
]

{ #category : #querying }
EthAreaSharable >> areas [
	" Answer a <Collection> containing the receiver's objects "
	
	^ areasPool values
]

{ #category : #sharables }
EthAreaSharable >> asia [
	" Answer the sharable for the resource named asia "
	
	^ areasPool
		at: #asia
		ifAbsentPut: [ self createAsiaArea ]
]

{ #category : #'sharables-creation' }
EthAreaSharable >> createAfricaArea [
	"Anwer an <EthArea> representing Africa"
	
	^ EthArea new
		englishName: 'Africa';
		spanishName: 'Africa'.
]

{ #category : #'sharables-creation' }
EthAreaSharable >> createAmericasArea [
	"Anwer an <EthArea> representing America"

	^ EthArea new
		englishName: 'Americas';
		spanishName: 'América'.
]

{ #category : #'sharables-creation' }
EthAreaSharable >> createAsiaArea [
	"Anwer an <EthArea> representing Asia"

	^ EthArea new
		englishName: 'Asia';
		spanishName: 'Asia'.
]

{ #category : #'sharables-creation' }
EthAreaSharable >> createEuropeArea [
	"Anwer an <EthArea> representing Europe"

	^ EthArea new
		englishName: 'Europe';
		spanishName: 'Europa'.
]

{ #category : #'sharables-creation' }
EthAreaSharable >> createPacificArea [
	"Anwer an <EthArea> representing Pacific"

	^ EthArea new
		englishName: 'Pacific';
		spanishName: 'Oceanía'.
]

{ #category : #sharables }
EthAreaSharable >> europe [
	" Answer the sharable for the resource named europe "
	
	^ areasPool
		at: #europe
		ifAbsentPut: [ self createEuropeArea ]
]

{ #category : #initialization }
EthAreaSharable >> initialize [
	" Private - Configure the instance's initial state "
	
	super initialize.
	areasPool := IdentityDictionary new.
	
]

{ #category : #sharables }
EthAreaSharable >> pacific [
	" Answer the sharable for the resource named pacific "
	
	^ areasPool
		at: #pacific
		ifAbsentPut: [ self createPacificArea ]
]
