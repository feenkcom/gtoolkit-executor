Class {
	#name : #GtExecutorExecutionSkipContext,
	#superclass : #GtExecutorExecutionContext,
	#category : #'GToolkit-Executor-Core-Exception Handlers'
}

{ #category : #executing }
GtExecutorExecutionSkipContext >> execute: aCommand [
	<return: #GtExecutorExecutionContext>
	^ self handler skip: aCommand
]
