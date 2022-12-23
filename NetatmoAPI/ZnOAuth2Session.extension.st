Extension { #name : #ZnOAuth2Session }

{ #category : #'*NetatmoAPI' }
ZnOAuth2Session class >> netatmo: aConsumerData [

	^ ZnNetatmoOAuth2Session new
		setConsumerData: aConsumerData ;
		yourself
]
