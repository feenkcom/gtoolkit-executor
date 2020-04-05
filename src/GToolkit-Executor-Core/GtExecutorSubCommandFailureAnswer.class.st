Class {
	#name : #GtExecutorSubCommandFailureAnswer,
	#superclass : #GtExecutorFailedAnswer,
	#category : #'GToolkit-Executor-Core-Answers'
}

{ #category : #accessing }
GtExecutorSubCommandFailureAnswer class >> subcommandOptionName [
	^ #subcommand
]

{ #category : #testing }
GtExecutorSubCommandFailureAnswer >> hasValue [
	^ false
]

{ #category : #printing }
GtExecutorSubCommandFailureAnswer >> printOn: aStream [ 
	aStream nextPutAll: 'Answer with sub-command failure'.
]

{ #category : #convenient }
GtExecutorSubCommandFailureAnswer >> subAnswer [
	<return: #GtExecutorAnswer>
	^ self subCommand answer
]

{ #category : #accessing }
GtExecutorSubCommandFailureAnswer >> subCommand [
	<return: #GtExecutorCommand>
	self
		optionAt: self class subcommandOptionName 
		ifAbsent: [ GtExecutorCommand null ]
]

{ #category : #accessing }
GtExecutorSubCommandFailureAnswer >> subCommand: aCommand [
	self 
		assert: [ aCommand isNotNil ] 
		description: [ 'Command must be non-nil' ].
	self
		optionAt: self class subcommandOptionName 
		put: aCommand
]
