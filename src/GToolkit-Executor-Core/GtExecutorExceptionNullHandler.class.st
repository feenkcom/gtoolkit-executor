Class {
	#name : #GtExecutorExceptionNullHandler,
	#superclass : #GtExecutorExceptionProtoHandler,
	#traits : 'TGtUniqueInstance',
	#classTraits : 'TGtUniqueInstance classTrait',
	#category : #'GToolkit-Executor-Core-Exception Handlers'
}

{ #category : #'execution - double dispatch' }
GtExecutorExceptionNullHandler >> run: aCommand [
	<return: #GtExecutorExecutionContext>
	^ GtExecutorExecutionContext skip 
]
