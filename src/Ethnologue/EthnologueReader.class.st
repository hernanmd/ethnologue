"
The Ethnologue catalogue can be seen as a useful subset of ISO 639 which does NOT cover : 

- Ancient
- Historical, and 
- Constructed languages

This reader defaults to read from code tables files under a 'data' folder on current directory. Otherwise, you can build a subset of all Ethnologue languages by setting a read stream of TSV to these methods:

- `#countriesCodesData:`
- `#languageCodesData:`
- `#languageIndexesData:`

The reader will configure the flyweights `EthCountrySharable` and `EthLanguageSharable`.

The code tables were downloaded from [https://www.ethnologue.com/codes/Language_Code_Data_20220221.zip](https://www.ethnologue.com/codes/Language_Code_Data_20220221.zip)

```language=Pharo
"" To generate the ELanguage Objects ""
EthnologueReader new.

"" To delete all ELanguage Objects ""
EthnologueReader reset.

"" To access all ELanguage Objects ""
LanguageSharable languages
```

"
Class {
	#name : #EthnologueReader,
	#superclass : #Object,
	#instVars : [
		'repository',
		'languageCodesData',
		'languageIndexesData',
		'countriesCodesData'
	],
	#category : #'Ethnologue-Core'
}

{ #category : #dependencies }
EthnologueReader class >> release [
	" Release the language information resources "

	ELanguageType reset.
	ELanguageStatus reset.
	EthCountrySharable release.
	EthLanguageSharable release.
]

{ #category : #accessing }
EthnologueReader >> addCountries [
	" Add the countries from the code tables "

	| countriesCodesParser |
	countriesCodesParser := (NeoCSVReader on: self countriesCodesData)
		separator: Character tab;
		skipHeader;
		do: [ :countryData | EthCountrySharable default addCountry: (self createCountryFrom: countryData) ]
]

{ #category : #private }
EthnologueReader >> addLangSubType: aSourceCollection to: aTargetCollection [
	" Private - Add language type information from aSourceCollection to aTargetCollection "

	| aLanguageSubtype aCountry |
	
	aCountry := self repository countryNamed: aSourceCollection second.
	aLanguageSubtype := (ELanguageType newType: aSourceCollection third)
							country: aCountry;
							name: aSourceCollection fourth.
	aTargetCollection addLast: aLanguageSubtype.
	aCountry addLanguageType: aLanguageSubtype.
]

{ #category : #accessing }
EthnologueReader >> addLanguage: aLangDataCollection types: aLangTypesCollection [
	"Private - Add a new Language using aLangDataCollection and link it to aLangTypesCollection"

	| aLanguage |
	
	aLanguage := self createLanguageFrom: aLangDataCollection.
	aLangTypesCollection do: [: eLangSubType | eLangSubType parent: aLanguage ].
	aLanguage types: aLangTypesCollection.
	EthLanguageSharable default	addLanguage: aLanguage.

]

{ #category : #accessing }
EthnologueReader >> addLanguages [
	| langCodesParser langIndexParser langIndexData |
	
	self traceCr: 'Adding language objects...'.
	langCodesParser := (NeoCSVReader on: self languageCodesData)
		separator: Character tab;
		skipHeader;
		yourself.
	langIndexParser := (NeoCSVReader on: self languageIndexesData)
		separator: Character tab;
		skipHeader;
		yourself.
	langIndexData := langIndexParser next.
	langCodesParser do: [ :langData | 
		| langSubTypes |
		langSubTypes := OrderedCollection new: 60.
		[ langIndexParser atEnd not and: [ langIndexData first = langData first ] ] whileTrue: [ 
			self addLangSubType: langIndexData to: langSubTypes.
			langIndexData := langIndexParser next ].
		self 
			addLanguage: langData
			types: langSubTypes ].
	self traceCr: 'language objects succesfully generated'.
]

{ #category : #sources }
EthnologueReader >> countriesCodesData [
	" Answer a <Stream> with the country codes "

	^ countriesCodesData
		ifNil: [ countriesCodesData := self defaultCountriesCodesData ]
]

{ #category : #accessing }
EthnologueReader >> countriesCodesData: anObject [

	countriesCodesData := anObject
]

{ #category : #private }
EthnologueReader >> createCountryFrom: countryData [
	" Answer a new <EthCountry> using data from countryData "

	^ EthCountry new
		identifier: countryData first;
		name: countryData second;
		area: (EthAreaSharable default perform: countryData third asLowercase asSymbol);
		url: ('http://www.ethnologue.com/show_country.asp?code=' , countryData first)

]

{ #category : #private }
EthnologueReader >> createLanguageFrom: languageData [
	" Answer a new <EthLanguage> using data from languageData "

	| aCountry newLanguage |

	aCountry := self repository countryNamed: languageData second.
	newLanguage := EthLanguage new
						addIdentifier: (EthISO3LanguageName new name: languageData first asSymbol);
						country: aCountry;
						status: (self createLanguageStatus: languageData third);
						name: languageData fourth.
	aCountry addLanguage: newLanguage.
	^ newLanguage
	
]

{ #category : #accessing }
EthnologueReader >> createLanguageStatus: aString [
	"Answer a new corresponding ELanguageStatus subclass depending of aString"

	^ ELanguageStatus newStatus: aString
]

{ #category : #sources }
EthnologueReader >> dataSubdirectory [

	^ 'data' asFileReference
]

{ #category : #defaults }
EthnologueReader >> defaultCountriesCodesData [
	" Answer a <Stream> with the country codes "

	^ (self dataSubdirectory / 'CountryCodes.tab') readStream
]

{ #category : #sources }
EthnologueReader >> defaultLanguageCodesData [
	" Answer a <Stream> with the language codes  "
	
	^ (self dataSubdirectory / 'LanguageCodes.tab') readStream
]

{ #category : #defaults }
EthnologueReader >> defaultLanguageIndexesData [
	" Answer a <Stream> with the language indices"
	
	^ (self dataSubdirectory / 'LanguageIndex.tab') readStream
]

{ #category : #initialization }
EthnologueReader >> initialize [
	" Private - Create the languages "
	
	super initialize.
	self traceCr: 'Started Country objects generation...'.
	self addCountries.
	self traceCr: 'Started Language objects generation...'.
	self addLanguages.

]

{ #category : #sources }
EthnologueReader >> languageCodesData [
	"Answer a <Stream> with the language codes"
	
	^ languageCodesData 
		ifNil: [ languageCodesData := self defaultLanguageCodesData ]
]

{ #category : #accessing }
EthnologueReader >> languageCodesData: anObject [

	^ languageCodesData := anObject
]

{ #category : #sources }
EthnologueReader >> languageIndexesData [
	" Answer a <Stream> with the language indices"
	
	^ languageIndexesData
		ifNil: [ languageIndexesData := self defaultLanguageIndexesData ]
]

{ #category : #accessing }
EthnologueReader >> languageIndexesData: anObject [

	languageIndexesData := anObject
]

{ #category : #accessing }
EthnologueReader >> repository [

	^ repository
		ifNil: [ repository := EthnologueRepository new ]
]
