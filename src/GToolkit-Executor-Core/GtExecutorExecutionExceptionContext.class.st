Class {
	#name : #GtExecutorExecutionExceptionContext,
	#superclass : #GtExecutorExecutionContext,
	#instVars : [
		'exception'
	],
	#category : #'GToolkit-Executor-Core-Exception Handlers'
}

{ #category : #accessing }
GtExecutorExecutionExceptionContext >> exception [
	<return: #Exception>
	^ exception
]

{ #category : #accessing }
GtExecutorExecutionExceptionContext >> exception: anException [
	self 
		assert: [ anException isNotNil ] 
		description: [ 'Exception must be non-nil' ].
	exception := anException
]

{ #category : #executing }
GtExecutorExecutionExceptionContext >> execute: aCommand [
	<return: #GtExecutorExecutionContext>
	^ self handler skip: aCommand
]
