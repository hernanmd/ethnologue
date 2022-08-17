"
One feature of the Ethnologue since its inception as a database in 1971 has been a system of three-letter codes for uniquely identifying languages. These became part of the publication in 1984. In the interest of fostering the uniform identification of all the world's languages in information systems, beginning with the 14th edition (2000), SIL International has released the complete set of three-letter codes (plus indexing information involving countries and alternate names) as downloadable data tables that the public may incorporate into their own database applications and dynamic web sites. Prior to the publication of the 15th edition in 2005, the Ethnologue worked in cooperation with the International Organization for Standardization (ISO) to create a new international standard for language codes. This was fully adopted in 2007 as ISO 639-3, Codes for the representation of names of languages — Part 3: Alpha‐3 code for comprehensive coverage of languages. The current downloadable tables are compatible with the latest updates to that standard. Examples of efforts that are already using these codes as a standard for language identification are the Open Language Archives Community and its participating archives.

Any application that makes use of these language identifiers is just one click away from access to the full language descriptions that are available in the Ethnologue. That is, for any language identifier [abc] that may be stored in a database, an application may present a link to the following URL in order to give the user access to the Ethnologue's description of that language:

    [http://ethnologue.com/language/abc](http://ethnologue.com/language/abc)

The remainder of this document, after describing the terms of use for the download tables, describes their relationship to standards, explains their structure, gives some hints on how to use them, and offers links for downloading them.
"
Class {
	#name : #EthISOLanguageName,
	#superclass : #EthnologueNamedObject,
	#category : #'Ethnologue-Language'
}

{ #category : #printing }
EthISOLanguageName class >> nameType [

	self subclassResponsibility
]

{ #category : #testing }
EthISOLanguageName >> isIso2 [
	
	^ false
]

{ #category : #testing }
EthISOLanguageName >> isIso3 [
	
	^ false
]

{ #category : #printing }
EthISOLanguageName >> printOn: aStream [

	aStream 
		nextPutAll: self name asString;
		space;
		nextPut: $(;
		nextPutAll: self class nameType;
		nextPut: $)
		
		
]
