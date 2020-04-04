Class {
	#name : #GtExecutorExecutionProtoContext,
	#superclass : #Object,
	#traits : 'TGtAssert',
	#classTraits : 'TGtAssert classTrait',
	#category : #'GToolkit-Executor-Core-Exception Handlers'
}

{ #category : #executing }
GtExecutorExecutionProtoContext >> execute: aCommand [
	<return: #GtExecutorExecutionContext>
	^ self subclassResponsibility
]
