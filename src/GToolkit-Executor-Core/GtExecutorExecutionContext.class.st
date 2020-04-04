Class {
	#name : #GtExecutorExecutionContext,
	#superclass : #GtExecutorExecutionProtoContext,
	#instVars : [
		'handler'
	],
	#category : #'GToolkit-Executor-Core-Exception Handlers'
}

{ #category : #factory }
GtExecutorExecutionContext class >> continue [
	^ GtExecutorExecutionContinueContext default 
]

{ #category : #factory }
GtExecutorExecutionContext class >> exception: anException [
	^ GtExecutorExecutionExceptionContext new exception: anException
]

{ #category : #testing }
GtExecutorExecutionContext class >> isAbstract [
	^ self name = #GtExecutorExecutionContext  
]

{ #category : #factory }
GtExecutorExecutionContext class >> null [
	^ GtExecutorExecutionNullContext default
]

{ #category : #factory }
GtExecutorExecutionContext class >> skip [
	^ GtExecutorExecutionSkipContext new
]

{ #category : #factory }
GtExecutorExecutionContext class >> start [ 
	^ GtExecutorExecutionStartContext new 
]

{ #category : #defaults }
GtExecutorExecutionContext >> defaultHandler [
	^ GtExecutorExceptionHandler null
]

{ #category : #accessing }
GtExecutorExecutionContext >> handler [
	<return: #GtExecutorExceptionHandler>
	^ handler
]

{ #category : #accessing }
GtExecutorExecutionContext >> handler: aGtExecutorExceptionHandler [
	self 
		assert: [ aGtExecutorExceptionHandler isNotNil ] 
		description: [ 'Execution exception handler must be non-nil'  ].
	handler := aGtExecutorExceptionHandler
]

{ #category : #initialization }
GtExecutorExecutionContext >> initialize [
	super initialize.
	handler := self defaultHandler.
]
