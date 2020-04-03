Class {
	#name : #GtExecutorDecorator,
	#superclass : #Object,
	#traits : 'TGtAssert',
	#classTraits : 'TGtAssert classTrait',
	#instVars : [
		'commands'
	],
	#category : #'GToolkit-Executor-Core-Decorator'
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
			eachDecoratedCommand copy command: aComposition ].
]

{ #category : #initialization }
GtExecutorDecorator >> defaultCommands [
	^ Array empty 
]

{ #category : #execution }
GtExecutorDecorator >> execute: aCommand [
	<return: #GtExecutorAnswer>
	| aDecoratedCommand |
	aDecoratedCommand := self decorate: aCommand.
	aDecoratedCommand execute.
	^ aDecoratedCommand answer.
]

{ #category : #initialization }
GtExecutorDecorator >> initialize [
	super initialize.
	commands := self defaultCommands.
]
