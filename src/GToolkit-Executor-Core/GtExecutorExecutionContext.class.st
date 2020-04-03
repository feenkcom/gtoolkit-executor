Class {
	#name : #GtExecutorExecutionContext,
	#superclass : #GtExecutorExecutionProtoContext,
	#category : #'GToolkit-Executor-Core-Exception Handlers'
}

{ #category : #factory }
GtExecutorExecutionContext class >> continue [
	^ GtExecutorExecutionContinueContext default 
]

{ #category : #factory }
GtExecutorExecutionContext class >> exception: anException [
	^ GtExecutorExecutionExceptionContext new exception: anException
]

{ #category : #testing }
GtExecutorExecutionContext class >> isAbstract [
	^ self name = #GtExecutorExecutionContext  
]

{ #category : #factory }
GtExecutorExecutionContext class >> skip [
	^ GtExecutorExecutionSkipContext new
]

{ #category : #factory }
GtExecutorExecutionContext class >> start [ 
	^ GtExecutorExecutionStartContext default 
]
