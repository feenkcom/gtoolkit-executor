Class {
	#name : #GtExecutorExecutionNullContext,
	#superclass : #GtExecutorExecutionProtoContext,
	#traits : 'TGtUniqueInstance',
	#classTraits : 'TGtUniqueInstance classTrait',
	#category : #'GToolkit-Executor-Core-Exception Handlers'
}

{ #category : #executing }
GtExecutorExecutionNullContext >> execute: aCommand [
	<return: #GtExecutorExecutionContext>
	^ GtExecutorExceptionHandler null skip: aCommand 
]
