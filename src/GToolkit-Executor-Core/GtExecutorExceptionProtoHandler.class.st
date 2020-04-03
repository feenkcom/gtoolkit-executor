Class {
	#name : #GtExecutorExceptionProtoHandler,
	#superclass : #Object,
	#traits : 'TGtAssert',
	#classTraits : 'TGtAssert classTrait',
	#category : #'GToolkit-Executor-Core-Exception Handlers'
}

{ #category : #'private - execution' }
GtExecutorExceptionProtoHandler >> run: aCommand [
	<return: #GtExecutorExecutionContext>
	^ self subclassResponsibility
]

{ #category : #'private - execution' }
GtExecutorExceptionProtoHandler >> skip: aCommand [
	<return: #GtExecutorExecutionContext>
	^ self subclassResponsibility
]
