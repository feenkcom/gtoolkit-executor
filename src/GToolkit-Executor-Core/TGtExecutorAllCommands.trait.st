Trait {
	#name : #TGtExecutorAllCommands,
	#category : #'GToolkit-Executor-Core-Traits'
}

{ #category : #enumerating }
TGtExecutorAllCommands >> allCommands [
	^ Array streamContents: [ :aStream |
		self commandsDo: [ :eachCommand | aStream nextPut: eachCommand ] ] 
]

{ #category : #enumerating }
TGtExecutorAllCommands >> commandsDo: oneArgBlock [
	self explicitRequirement
]
