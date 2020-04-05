Class {
	#name : #GtExecutorZincExamples,
	#superclass : #GtExecutorReplacingDecoratorExamples,
	#traits : 'TGtZnServerExamples',
	#classTraits : 'TGtZnServerExamples classTrait',
	#category : #'GToolkit-Executor-Zinc-Examples'
}

{ #category : #'examples - answers' }
GtExecutorZincExamples >> answerOfServiceUrlCommand [
	<gtExample>
	| aDecorator aCommand anAnswer |
	aDecorator := self decoratorWithServiceUrlCommand.
	aCommand := self getCommand.
	anAnswer := aDecorator execute: aCommand.
	self assert: anAnswer isNotNil.
	self 
		assert: aCommand configurations zinc client request url 
		equals: self serviceUrl / self serviceItemSegments.
	^ anAnswer
]

{ #category : #'examples - commands' }
GtExecutorZincExamples >> basicGetCommand [
	<gtExample>
	| aCommand |
	aCommand := GtExecutorZincGetCommand new.
	self assert: aCommand segments isNotNil.
	self assert: aCommand segments isEmpty.
	self assert: aCommand segments isArray.
	self assert: aCommand configurations isConfigurations.
	^ aCommand
]

{ #category : #'examples - decorating commands' }
GtExecutorZincExamples >> basicServiceUrlCommand [
	<gtExample>
	| aCommand |
	aCommand := GtExecutorZincServiceUrlCommand new.
	self assert: aCommand url isNil.
	self assert: aCommand configurations isConfigurations not.
	^ aCommand
]

{ #category : #'examples - decorator' }
GtExecutorZincExamples >> decoratorWithServiceUrlCommand [
	<gtExample>
	| aDecorator aCommand |
	aDecorator := self basicDecorator.
	aCommand := self serviceUrlCommand.
	aDecorator command: aCommand.
	self assert: aDecorator commands size equals: 1.
	self assert: aDecorator commands first equals: aCommand.
	^ aDecorator
]

{ #category : #'examples - commands' }
GtExecutorZincExamples >> getCommand [
	<gtExample>
	| aCommand theSegments |
	aCommand := self basicGetCommand.
	theSegments := self serviceItemSegments.
	aCommand segments: theSegments.
	self assert: aCommand segments equals: theSegments.
	^ aCommand
]

{ #category : #'server - service configuration' }
GtExecutorZincExamples >> serviceItemSegments [
	<gtExample>
	^ #( 'item' )
]

{ #category : #'server - service configuration' }
GtExecutorZincExamples >> serviceSegments [
	<gtExample>
	^ #( 'api' 'service' 'v1' )
]

{ #category : #'server - service configuration' }
GtExecutorZincExamples >> serviceUrl [
	<gtExample>
	^ self serverUrl / self serviceSegments
]

{ #category : #'examples - decorating commands' }
GtExecutorZincExamples >> serviceUrlCommand [
	<gtExample>
	| aCommand anUrl |
	aCommand := self basicServiceUrlCommand.
	anUrl := self serviceUrl.
	aCommand url: anUrl.
	self assert: aCommand url equals: anUrl.
	^ aCommand
]
