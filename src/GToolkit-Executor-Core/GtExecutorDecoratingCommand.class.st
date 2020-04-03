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
	self command execute
]

{ #category : #initialization }
GtExecutorDecoratingCommand >> initialize [
	super initialize.
	command := self defaultCommand.
]
