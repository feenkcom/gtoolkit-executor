Class {
	#name : #GtExecutorExecutionSkipContext,
	#superclass : #GtExecutorExecutionContext,
	#category : #'GToolkit-Executor-Core-Exception Handlers'
}

{ #category : #executing }
GtExecutorExecutionSkipContext >> execute: aCommand using: aGtExecutorExceptionHandler [
	<return: #GtExecutorExecutionContext>
	^ aGtExecutorExceptionHandler skip: aCommand
]
