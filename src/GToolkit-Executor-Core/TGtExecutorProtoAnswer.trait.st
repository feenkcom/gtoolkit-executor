Trait {
	#name : #TGtExecutorProtoAnswer,
	#category : #'GToolkit-Executor-Core-Traits'
}

{ #category : #testing }
TGtExecutorProtoAnswer >> hasValue [
	<return: #Boolean>
	^ self explicitRequirement
]

{ #category : #testing }
TGtExecutorProtoAnswer >> isAnswer [
	<return: #Boolean>
	^ self explicitRequirement
]
