Trait {
	#name : #TGtExecutorCommand,
	#traits : 'TGtOptions',
	#classTraits : 'TGtOptions classTrait',
	#category : #'GToolkit-Executor-Core-Traits'
}

{ #category : #accessing }
TGtExecutorCommand classSide >> answerOptionName [
	^ #commandAnswer
]

{ #category : #accessing }
TGtExecutorCommand classSide >> exceptionHandlerOptionName [
	^ #exceptionHandler
]

{ #category : #'accessing - options' }
TGtExecutorCommand >> answer [
	<return: #GtExecutorAnswer>
	^ self 
		optionAt: self class answerOptionName 
		ifAbsent: [ GtExecutorAnswer null ]
]

{ #category : #'accessing - options' }
TGtExecutorCommand >> answer: aGtExecutorAnswer [
	self 
		assert: [ aGtExecutorAnswer isNotNil ]
		description: [ 'Executor answer must be non-nil' ].
	aGtExecutorAnswer command: self.
	^ self 
		optionAt: self class answerOptionName 
		put: aGtExecutorAnswer
]

{ #category : #execution }
TGtExecutorCommand >> executeInContext: aGtExecutorExecutionContext [
	<return: #GtExecutorExecutionContext>
	^ aGtExecutorExecutionContext execute: self.
]

{ #category : #'testing - answer' }
TGtExecutorCommand >> hasAnswer [
	<return: #Boolean>
	^ self answer isAnswer
]

{ #category : #'testing - answer' }
TGtExecutorCommand >> hasValue [
	<return: #Boolean>
	^ self answer hasValue
]
