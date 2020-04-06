Trait {
	#name : #TExecutorZincConfigurationAccess,
	#category : #'GToolkit-Executor-Zinc-Traits'
}

{ #category : #'accessing - configuration' }
TExecutorZincConfigurationAccess >> hasResponse [
	<return: #Boolean>
	^ self configurations zinc hasResponse
]

{ #category : #'accessing - configuration' }
TExecutorZincConfigurationAccess >> response [
	<return: #ZnResponse>
	^ self configurations zinc response
]

{ #category : #'accessing - configuration' }
TExecutorZincConfigurationAccess >> response: aZnResponse [
	self configurations zinc response: aZnResponse
]

{ #category : #'accessing - configuration' }
TExecutorZincConfigurationAccess >> zincClient [
	^ self configurations zinc client
]
