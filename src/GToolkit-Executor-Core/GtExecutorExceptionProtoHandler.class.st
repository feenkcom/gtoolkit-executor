Class {
	#name : #GtExecutorExceptionProtoHandler,
	#superclass : #Object,
	#traits : 'TGtAssert',
	#classTraits : 'TGtAssert classTrait',
	#category : #'GToolkit-Executor-Core-Exception Handlers'
}

{ #category : #execution }
GtExecutorExceptionProtoHandler >> execute: aCommand [
	<return: #GtExecutorExecutionContext>
	^ self execute: aCommand previousContext: GtExecutorExecutionContext start
]

{ #category : #execution }
GtExecutorExceptionProtoHandler >> execute: aCommand previousContext: aPreviousContext [
	<return: #GtExecutorExecutionContext>
	aPreviousContext handler: self.
	^ aCommand executeInContext: aPreviousContext.
]

{ #category : #'execution - double dispatch' }
GtExecutorExceptionProtoHandler >> run: aCommand [
	<return: #GtExecutorExecutionContext>
	^ self subclassResponsibility
]

{ #category : #'execution - double dispatch' }
GtExecutorExceptionProtoHandler >> skip: aCommand [
	<return: #GtExecutorExecutionContext>
	^ GtExecutorExecutionContext skip 
]
