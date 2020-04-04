Class {
	#name : #GtExecutorTaskItSubCommand,
	#superclass : #BlTktCommand,
	#instVars : [
		'command',
		'context'
	],
	#category : #'GToolkit-Executor-TaskIt-Commands'
}

{ #category : #accessing }
GtExecutorTaskItSubCommand >> command [
	^ command
]

{ #category : #accessing }
GtExecutorTaskItSubCommand >> command: aGtExecutorCommand [
	self 
		assert: [ aGtExecutorCommand isNotNil ] 
		description: [ 'Executor command must be non-nil' ].
	command := aGtExecutorCommand.
	self name: aGtExecutorCommand printString.
]

{ #category : #accessing }
GtExecutorTaskItSubCommand >> context [
	<return: #GtExecutorExecutionContext>
	^ context
]

{ #category : #accessing }
GtExecutorTaskItSubCommand >> context: aGtExecutorExecutionContext [
	self 
		assert: [ aGtExecutorExecutionContext isNotNil ] 
		description: [ 'Execution context must be non-nil' ].
	context := aGtExecutorExecutionContext
]

{ #category : #evaluating }
GtExecutorTaskItSubCommand >> execute [
	"execute command and return a result"
	<return: #GtExecutorCommand>
	self command executeInContext: self context.
	^ self command
]

{ #category : #initialization }
GtExecutorTaskItSubCommand >> initialize [
	super initialize.
	self context: GtExecutorExecutionContext null.
	self command: GtExecutorCommand null.
]
