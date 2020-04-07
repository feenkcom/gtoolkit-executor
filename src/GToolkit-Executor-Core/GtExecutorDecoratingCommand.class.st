Class {
	#name : #GtExecutorDecoratingCommand,
	#superclass : #GtExecutorDecoratingProtoCommand,
	#instVars : [
		'command'
	],
	#category : #'GToolkit-Executor-Core-Commands'
}

{ #category : #testing }
GtExecutorDecoratingCommand class >> isAbstract [
	^ self name = #GtExecutorDecoratingCommand 
]

{ #category : #accessing }
GtExecutorDecoratingCommand >> command [
	^ command
]

{ #category : #accessing }
GtExecutorDecoratingCommand >> command: aCommand [
	self 
		assert: [ aCommand isNotNil ] 
		description: [ 'Command must be non-nil' ].
	command := aCommand
]

{ #category : #defaults }
GtExecutorDecoratingCommand >> defaultCommand [
	^ GtExecutorNullCommand default
]

{ #category : #'private - execution' }
GtExecutorDecoratingCommand >> executeSubCommand [
	self command executeInContext: self subCommandExecutionContext
]

{ #category : #'private - execution' }
GtExecutorDecoratingCommand >> executeSubCommandAndAnswer: anAnswer [
	self executeSubCommand.
	self command hasAnswer ifFalse: [ 
		self answer: anAnswer.
		^ self ].
	self command answer isSuccess
		ifTrue: [ self answer: anAnswer ] 
		ifFalse: [ self answer: (GtExecutorAnswer subCommandFailure: self command) ]
]

{ #category : #initialization }
GtExecutorDecoratingCommand >> initialize [
	super initialize.
	command := self defaultCommand.
]
