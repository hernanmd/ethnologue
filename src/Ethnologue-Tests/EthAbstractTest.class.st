Class {
	#name : #EthAbstractTest,
	#superclass : #TestCase,
	#category : #'Ethnologue-Tests'
}

{ #category : #mocks }
EthAbstractTest >> mockCountryCodes [

	^ 'CountryID	Name	Area
NG	Nigeria	Africa
PG	Papua New Guinea	Pacific'
]

{ #category : #mocks }
EthAbstractTest >> mockCountryName [

	^ 'MockCountry'
]

{ #category : #mocks }
EthAbstractTest >> mockLanguageCodes [

	^ 'LangID	CountryID	LangStatus	Name
aaa	NG	L	Ghotuo
aab	NG	L	Arum
aac	PG	L	Ari'
]

{ #category : #mocks }
EthAbstractTest >> mockLanguageIndex [

	^ 'LangID	CountryID	NameType	Name
aaa	NG	L	Ghotuo
aaa	NG	LA	Otuo
aaa	NG	LA	Otwa
aab	NG	D	Alumu
aab	NG	D	Tesu
aab	NG	DA	Arum
aab	NG	DA	Chessu
aab	NG	DA	TÉsu
aab	NG	L	Arum
aab	NG	LA	Alomo-Atesu
aab	NG	LA	Alumu
aab	NG	LA	Alumu-Tesu
aab	NG	LA	Arum-Cesu
aab	NG	LA	Arum-Chessu
aab	NG	LA	Arum-Tesu
aab	NG	LA	TÉsu
aac	PG	D	Serea
aac	PG	L	Ari
aad	PG	L	Amal
aad	PG	LA	Alai
aag	PG	L	Ambrak
aah	PG	D	Matapau
aah	PG	D	Ounibisima
aah	PG	D	Womenika
aah	PG	L	Abuâ
aah	PG	LA	Abuâ Arapesh
aah	PG	LA	Ua
aai	PG	D	Arifama
aai	PG	D	Miniafia
aai	PG	L	Miniafia Oyan
aai	PG	LA	Arifama-Miniafia
aai	PG	LA	Miniafia
aai	PG	LA	Miniafia-Arifama
aak	PG	D	Ankai
aak	PG	D	Buâu
aak	PG	D	Miyatnu
aak	PG	D	Sawuve
aak	PG	D	Wiyagwa
aak	PG	D	Wunavai
aak	PG	L	Ankave
aak	PG	LA	Aga pÉ¨âneâ
aak	PG	LA	Angave
aak	PG	LA	Ankave-Anga
aal	NG	L	Afade
aal	NG	LA	AfaÉÓ
aal	NG	LA	Afada
aal	NG	LA	Afadee
aal	NG	LA	Afadeh
aal	NG	LA	Affade
aal	NG	LA	Kotoko
aal	NG	LA	Mogari
aau	PG	D	Downriver Abau
aau	PG	D	Downriver border Abau
aau	PG	D	Upriver Abau
aau	PG	DA	Oriyai
aau	PG	L	Abau
aau	PG	LA	Green River
aaw	PG	D	Arawe
aaw	PG	L	Solong
aaw	PG	LA	Arawe
aaw	PG	LA	Arove
aaw	PG	LA	Pililo
bm	NG	L	Abanyom
abm	NG	LA	Abanyum
abm	NG	LA	Bakor
abm	NG	LA	Befun
abm	NG	LA	Bofon
abm	NG	LA	Mbofon
abn	NG	D	Central Abuan
abn	NG	D	Emughan
abn	NG	D	Okpeden
abn	NG	D	Otapha
abn	NG	DA	Otabha
abn	NG	L	Abua
abn	NG	LA	Abuan
abo	NG	L	Abon
abo	NG	LA	Abong
abo	NG	LA	AbÃµ
abo	NG	LA	Baâban
abt	PG	D	Maprik
abt	PG	D	Wingei
abt	PG	D	Wosera-Kamu
abt	PG	D	Wosera-Mamu
abt	PG	L	Ambulas
abt	PG	LA	Abelam
abt	PG	LA	Abulas
'
]

{ #category : #mocks }
EthAbstractTest >> mockLanguageName [

	^ 'MockLanguage'
]

{ #category : #test }
EthAbstractTest >> mockUrlString [

	^ 'http://www.ethnologue.com/show_country.asp?code=AR'
]

{ #category : #tests }
EthAbstractTest >> newCommonLanguageType [

	^ ELanguageType newType: 'L'



]

{ #category : #tests }
EthAbstractTest >> newDialectLanguageType [

	^ ELanguageType newType: 'D'
]

{ #category : #mocks }
EthAbstractTest >> newMockCountry [

	^ EthCountry new
		name: self mockCountryName;
		yourself.
]

{ #category : #mocks }
EthAbstractTest >> newMockLanguage [

	^ EthLanguage new.
]
