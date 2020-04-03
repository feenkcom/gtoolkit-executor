Trait {
	#name : #TGtExecutorReplacingCommand,
	#category : #'GToolkit-Executor-Core-Traits'
}

{ #category : #testing }
TGtExecutorReplacingCommand >> isReplacing: aCommand [
	<return: #Boolean>
	^ self class = aCommand class
]
