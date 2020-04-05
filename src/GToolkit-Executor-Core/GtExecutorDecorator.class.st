Class {
	#name : #GtExecutorDecorator,
	#superclass : #Object,
	#traits : 'TGtAssert',
	#classTraits : 'TGtAssert classTrait',
	#instVars : [
		'commands',
		'exceptionHandler'
	],
	#category : #'GToolkit-Executor-Core-Decorators'
}

{ #category : #convenience }
GtExecutorDecorator >> command: aCommand [
	self
		assert: [ aCommand isNotNil ] 
		description: [ 'Decorating command must be non-nil' ].
	self commands: (self commands copyWith: aCommand).
]

{ #category : #accessing }
GtExecutorDecorator >> commands [
	<return: #Array>
	^ commands
]

{ #category : #accessing }
GtExecutorDecorator >> commands: anArray [
	self 
		assert: [ anArray isSequenceable ] 
		description: [ 'Commands must be a sequenceable collection' ].
	commands := anArray
]

{ #category : #'private - execution' }
GtExecutorDecorator >> decorate: aCommand [
	self
		assert: [ aCommand isNotNil ] 
		description: [ 'Command must be non-nil' ].
	^ self commands 
		inject: aCommand 
		into: [ :aComposition :eachDecoratedCommand |
			eachDecoratedCommand copy 
				configurations: aComposition configurations;
				command: aComposition ].
]

{ #category : #defaults }
GtExecutorDecorator >> defaultCommands [
	^ Array empty 
]

{ #category : #defaults }
GtExecutorDecorator >> defaultExceptionHandler [
	^ GtExecutorExceptionHandler default
]

{ #category : #accessing }
GtExecutorDecorator >> exceptionHandler [
	<return: #GtExecutorExceptionHandler>
	^ exceptionHandler
]

{ #category : #accessing }
GtExecutorDecorator >> exceptionHandler: aGtExecutorExceptionHandler [
	self 
		assert: [ GtExecutorExceptionHandler isNotNil ] 
		description: [ 'Exception handler must be non-nil' ].
	exceptionHandler := aGtExecutorExceptionHandler
]

{ #category : #execution }
GtExecutorDecorator >> execute: aCommand [
	<return: #GtExecutorAnswer>
	| aDecoratedCommand |
	aDecoratedCommand := self decorate: aCommand.
	self exceptionHandler execute: aDecoratedCommand.
	^ aDecoratedCommand answer.
]

{ #category : #initialization }
GtExecutorDecorator >> initialize [
	super initialize.
	commands := self defaultCommands.
	exceptionHandler := self defaultExceptionHandler.
]
