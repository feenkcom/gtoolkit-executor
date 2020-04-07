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

{ #category : #'as yet unclassified' }
TGtExecutorCommand classSide >> configurationsOptionName [
	^ #configurations
]

{ #category : #accessing }
TGtExecutorCommand classSide >> exceptionHandlerOptionName [
	^ #exceptionHandler
]

{ #category : #accessing }
TGtExecutorCommand classSide >> executionStatusOptionName [
	^ #executionStatus
]

{ #category : #answers }
TGtExecutorCommand >> answer [
	<return: #GtExecutorAnswer>
	^ self 
		optionAt: self class answerOptionName 
		ifAbsent: [ GtExecutorAnswer null ]
]

{ #category : #answers }
TGtExecutorCommand >> answer: aGtExecutorAnswer [
	self 
		assert: [ aGtExecutorAnswer isNotNil ]
		description: [ 'Executor answer must be non-nil' ].
	aGtExecutorAnswer command: self.
	^ self 
		optionAt: self class answerOptionName 
		put: aGtExecutorAnswer
]

{ #category : #configurations }
TGtExecutorCommand >> assertConfigurations [
	self 
		assert: [ self hasConfigurations ]
		description: [ 'Executor configurations is required' ]
]

{ #category : #configurations }
TGtExecutorCommand >> configurations [
	<return: #GtExecutorConfigurations>
	^ self
		optionAt: self class configurationsOptionName
		ifAbsentPut: [ self defaultConfigurations ]
]

{ #category : #configurations }
TGtExecutorCommand >> defaultConfigurations [
	^ GtExecutorConfigurations default
]

{ #category : #execution }
TGtExecutorCommand >> executeInContext: aGtExecutorExecutionContext [
	<return: #GtExecutorExecutionContext>
	^ aGtExecutorExecutionContext execute: self.
]

{ #category : #execution }
TGtExecutorCommand >> executionStatus [
	<return: #GtExecutorStatus>
	^ self 
		optionAt: self class executionStatusOptionName 
		ifAbsent: [ GtExecutorStatus null ]
]

{ #category : #execution }
TGtExecutorCommand >> executionStatus: aGtExecutorStatus [
	self 
		assert: [ aGtExecutorStatus isNotNil ]
		description: [ 'Execution status must be non-nil' ].
	^ self 
		optionAt: self class executionStatusOptionName 
		put: aGtExecutorStatus
]

{ #category : #answers }
TGtExecutorCommand >> hasAnswer [
	<return: #Boolean>
	^ self answer isAnswer
]

{ #category : #configurations }
TGtExecutorCommand >> hasConfigurations [
	<return: #Boolean>
	^ self configurations isConfigurations
]

{ #category : #answers }
TGtExecutorCommand >> hasValue [
	<return: #Boolean>
	^ self answer hasValue
]
