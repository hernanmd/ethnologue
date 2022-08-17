"
A second language is a language a person learns after his or her mother tongue of the speaker especially as a resident of an area where it is in general use.

The phrase ""Second language only"" is used to indicate languages which are used as special second languages with no mother-tongue speakers such as languages of initiation, languages of herb doctors, cants, jargons, and American Plains Indian Sign Language. Such languages are listed in the body of the Ethnologue but not included among the statistical summaries of living languages. The inventory of these languages is also incomplete.

"
Class {
	#name : #ESecondLanguage,
	#superclass : #ELanguageStatus,
	#category : #'Ethnologue-Language'
}

{ #category : #accessing }
ESecondLanguage class >> identifier [
	" Answer the receiver's ethnologue code table identifier "

	^ $S
]
