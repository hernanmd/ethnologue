"
A living language is defined as one that is the first language of at least one person.
"
Class {
	#name : #ELivingLanguage,
	#superclass : #ELanguageStatus,
	#category : #'Ethnologue-Language'
}

{ #category : #accessing }
ELivingLanguage class >> identifier [
	" Answer the receiver's ethnologue code table identifier "

	^ $L
]
