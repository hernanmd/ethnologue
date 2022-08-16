"
The Ethnologue catalogue can be seen as a useful subset of ISO 639 which does NOT cover : 

- Ancient
- Historical, and 
- Constructed languages

This class assume the code tables files are under 'Data' folder on current directory. Download the code tables from [https://www.ethnologue.com/codes/Language_Code_Data_20220221.zip](https://www.ethnologue.com/codes/Language_Code_Data_20220221.zip)

```language=Pharo
"" To generate the ELanguage Objects ""
LIEthnologueReader new.

"" To delete all ELanguage Objects ""
LIEthnologueReader reset.

"" To access all ELanguage Objects ""
LILanguageSharable languages
```

"
Class {
	#name : #EthnologueReader,
	#superclass : #Object,
	#instVars : [
		'repository'
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

	^ (self dataSubdirectory / 'CountryCodes.tab') readStream
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
	" Answer a <Stream> with the language codes  "
	
	^ (self dataSubdirectory / 'LanguageCodes.tab') readStream
]

{ #category : #sources }
EthnologueReader >> languageIndexesData [
	" Answer a <Stream> with the language indices"
	
	^ (self dataSubdirectory / 'LanguageIndex.tab') readStream
]

{ #category : #accessing }
EthnologueReader >> repository [

	^ repository
		ifNil: [ repository := EthnologueRepository new ]
]
