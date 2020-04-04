Class {
	#name : #GtExecutorExecutionStartContext,
	#superclass : #GtExecutorExecutionContext,
	#category : #'GToolkit-Executor-Core-Exception Handlers'
}

{ #category : #executing }
GtExecutorExecutionStartContext >> execute: aCommand [ 
	<return: #GtExecutorExecutionContext>
	^ self handler run: aCommand
]

{ #category : #executing }
GtExecutorExecutionStartContext >> execute: aCommand using: aGtExecutorExceptionHandler [
	<return: #GtExecutorExecutionContext>
	^ aGtExecutorExceptionHandler run: aCommand
]
