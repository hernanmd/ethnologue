Class {
	#name : #ECommonDialect,
	#superclass : #ELanguageType,
	#category : #'Ethnologue-Language'
}

{ #category : #accessing }
ECommonDialect class >> identifier [
	" Answer the receiver's ethnologue code table identifier "

	^ 'D'
]

{ #category : #testing }
ECommonDialect >> isCommonDialect [

	^ true
]
