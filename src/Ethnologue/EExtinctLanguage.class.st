"
An extinct language is a language that no longer is the first language `ELivingLanguage` or the second language `ESecondLanguage` of anyone. The first recorded example in human history is Sumerian. 

"
Class {
	#name : #EExtinctLanguage,
	#superclass : #ELanguageStatus,
	#category : #'Ethnologue-Language'
}

{ #category : #accessing }
EExtinctLanguage class >> identifier [
	"Answer the receiver's ethnologue code table identifier"

	^ $X
]
