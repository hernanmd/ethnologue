"
An EthnologueRepository is your main object for querying the LanguageInfo objects.

```language=Pharo
| repository |
repository := EthnologueRepository new.

"" To access all languages ""
repository languages.

"" To access a language ""
repository languageNamed: 'spa'.
repository languageNamed: 'Spanish'.

"" To query countries where French is spoken ""
repository countriesForLanguage: 'French'.
	
"" To query common languages used in Argentina ""
repository commonLanguagesFor: 'Argentina'.
	
"" To query languages from Argentina ""
repository languagesIn: 'Argentina'.
```



"
Class {
	#name : #EthnologueRepository,
	#superclass : #Object,
	#category : #'Ethnologue-Core'
}

{ #category : #'enumerating territories' }
EthnologueRepository >> areas [
	"Answer a <Collection> of <EthArea>"

	^ EthAreaSharable default areas
]

{ #category : #'querying languages' }
EthnologueRepository >> commonLanguagesFor: aCountryName [
	" Answer a <Collection> of <EthLanguage> representing common languages used in aCountryName "
	
	| country |
	
	country := [ self countryNamed: aCountryName ]
	on: NotFound
	do: [: ex | self error: ex messageText ]. 
	^ country commonLanguages
]

{ #category : #'enumerating territories' }
EthnologueRepository >> countries [
	"Answer a <Collection> of <EthCountry>"

	^ EthCountrySharable default countries
]

{ #category : #'querying languages' }
EthnologueRepository >> countriesForLanguage: aLanguageName [
	"Answer a <Collection> of <EthCountry> where aLanguageName is spoken"

	^ (self languageNamed: aLanguageName) countries 
]

{ #category : #'querying territories' }
EthnologueRepository >> countryNamed: aString [
	" Answer an <EthCountry> named aString or raises an exception if not found "

	^ EthCountrySharable default countryNamed: aString
]

{ #category : #'enumerating languages' }
EthnologueRepository >> iso2Languages [
	" Answer a <Collection> of <EthLanguage> with an ISO-2 identifier "

	^ EthLanguageSharable default languages
			select: [: lng | lng hasIso2Identifier ]
]

{ #category : #'enumerating languages' }
EthnologueRepository >> iso3Languages [
	"Answer a <Collection> of <EthLanguage> with an ISO-3 identifier"

	^ EthLanguageSharable default languages
			select: [: lng | lng hasIso3Identifier ]
]

{ #category : #'querying languages' }
EthnologueRepository >> languageNamed: aLanguageName [
	" Answer the <EthLanguage> named aLanguageName "
	
	^ EthLanguageSharable default languageNamed: aLanguageName
					
]

{ #category : #'enumerating languages' }
EthnologueRepository >> languages [
	"Answer a <Collection> of <EthLanguage>"

	^ EthLanguageSharable default languages
]

{ #category : #'querying languages' }
EthnologueRepository >> languagesIn: aCountryName [
	" Answer a <Collection> of <EthLanguage> in aCountryName "
	
	^ (self countryNamed: aCountryName) languages
]
