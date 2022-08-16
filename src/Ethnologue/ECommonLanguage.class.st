Class {
	#name : #ECommonLanguage,
	#superclass : #ELanguageType,
	#category : #'Ethnologue-Language'
}

{ #category : #accessing }
ECommonLanguage class >> identifier [
	" Answer the receiver's ethnologue code table identifier "

	^ 'L'
]

{ #category : #testing }
ECommonLanguage >> isCommonLanguage [

	^ true
]
