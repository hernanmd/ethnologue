Extension { #name : #ByteString }

{ #category : #'*Ethnologue' }
ByteString >> asECharacter [
	" I'm not that evil, I know I'm converting a string letter "
	
	^ self at: 1
]
