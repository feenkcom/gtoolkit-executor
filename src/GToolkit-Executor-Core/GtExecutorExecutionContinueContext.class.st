Class {
	#name : #GtExecutorExecutionContinueContext,
	#superclass : #GtExecutorExecutionContext,
	#traits : 'TGtUniqueInstance',
	#classTraits : 'TGtUniqueInstance classTrait',
	#category : #'GToolkit-Executor-Core-Exception Handlers'
}

{ #category : #executing }
GtExecutorExecutionContinueContext >> execute: aCommand using: aGtExecutorExceptionHandler [
	<return: #GtExecutorExecutionContext>
	^ aGtExecutorExceptionHandler run: aCommand
]
