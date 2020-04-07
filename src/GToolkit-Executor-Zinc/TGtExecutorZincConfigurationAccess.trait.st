Trait {
	#name : #TGtExecutorZincConfigurationAccess,
	#category : #'GToolkit-Executor-Zinc-Traits'
}

{ #category : #'accessing - configuration' }
TGtExecutorZincConfigurationAccess >> hasResponse [
	<return: #Boolean>
	^ self configurations zinc hasResponse
]

{ #category : #'accessing - configuration' }
TGtExecutorZincConfigurationAccess >> response [
	<return: #ZnResponse>
	^ self configurations zinc response
]

{ #category : #'accessing - configuration' }
TGtExecutorZincConfigurationAccess >> response: aZnResponse [
	self configurations zinc response: aZnResponse
]

{ #category : #'accessing - configuration' }
TGtExecutorZincConfigurationAccess >> zincClient [
	^ self configurations zinc client
]
