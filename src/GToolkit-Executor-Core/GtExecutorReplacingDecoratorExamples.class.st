Class {
	#name : #GtExecutorReplacingDecoratorExamples,
	#superclass : #GtExecutorDecoratorExamples,
	#category : #'GToolkit-Executor-Core-Examples'
}

{ #category : #'examples - commands' }
GtExecutorReplacingDecoratorExamples >> anotherPostExecutionCommand [
	<gtExample>
	| aCommand anId |
	aCommand := super anotherPostExecutionCommand.
	anId := 72.
	aCommand id: anId.
	self assert: aCommand id equals: anId.
	^ aCommand
]

{ #category : #'examples - decorator' }
GtExecutorReplacingDecoratorExamples >> decoratorWithFirstReplacedCommand [
	<gtExample>
	| aDecorator aCommand theOriginalCommands |
	aDecorator := self decoratorWithTwoPostExecutionCommands.
	theOriginalCommands := aDecorator commands copy.
	aCommand := self postExecutionCommand.
	aCommand valuable: [ :aSubCommand | aSubCommand result: 18 ].
	aDecorator replace: aCommand.
	self assert: aDecorator commands size equals: 2.
	self assert: aDecorator commands first equals: aCommand.
	self assert: (aDecorator commands first = theOriginalCommands second) not.
	self assert: aDecorator commands second equals: theOriginalCommands second.
	^ aDecorator
]

{ #category : #'examples - decorator' }
GtExecutorReplacingDecoratorExamples >> decoratorWithSecondReplacedCommand [
	<gtExample>
	| aDecorator aCommand theOriginalCommands |
	aDecorator := self decoratorWithTwoPostExecutionCommands.
	theOriginalCommands := aDecorator commands copy.
	aCommand := self anotherPostExecutionCommand.
	aCommand valuable: [ :aSubCommand | aSubCommand result: 1080 ].
	aDecorator replace: aCommand.
	self assert: aDecorator commands size equals: 2.
	self assert: aDecorator commands second equals: aCommand.
	self assert: aDecorator commands first equals: theOriginalCommands first.
	self assert: (aDecorator commands second = theOriginalCommands second) not.
	^ aDecorator
]

{ #category : #'examples - decorator' }
GtExecutorReplacingDecoratorExamples >> defaultDecorator [
	^ GtExecutorReplacingDecorator
]

{ #category : #'examples - commands' }
GtExecutorReplacingDecoratorExamples >> defaultPostExecutionCommand [
	^ GtExecutorReplacablePostExecutionCommand
]

{ #category : #'examples - execution' }
GtExecutorReplacingDecoratorExamples >> executionWithFirstReplacedCommand [
	<gtExample>
	| aBuilder aCommand |
	aBuilder := self decoratorWithFirstReplacedCommand.
	aCommand := self valuableCommand.
	aBuilder execute: aCommand.
	self assert: aCommand result equals: 72.
	^ aCommand
]

{ #category : #'examples - execution' }
GtExecutorReplacingDecoratorExamples >> executionWithSecondReplacedCommand [
	<gtExample>
	| aBuilder aCommand |
	aBuilder := self decoratorWithSecondReplacedCommand.
	aCommand := self valuableCommand.
	aBuilder execute: aCommand.
	self assert: aCommand result equals: 1080.
	^ aCommand
]

{ #category : #'examples - commands' }
GtExecutorReplacingDecoratorExamples >> postExecutionCommand [
	<gtExample>
	| aCommand anId |
	aCommand := super postExecutionCommand.
	anId := 108.
	aCommand id: anId.
	self assert: aCommand id equals: anId.
	^ aCommand
]
