Class {
	#name : #GtExecutorExecutionStartContext,
	#superclass : #GtExecutorExecutionProtoContext,
	#traits : 'TGtUniqueInstance',
	#classTraits : 'TGtUniqueInstance classTrait',
	#category : #'GToolkit-Executor-Core-Exception Handlers'
}

{ #category : #executing }
GtExecutorExecutionStartContext >> execute: aCommand using: aGtExecutorExceptionHandler [
	<return: #GtExecutorExecutionContext>
	^ aGtExecutorExceptionHandler run: aCommand
]
