Class {
	#name : #GtExecutorExceptionHandler,
	#superclass : #GtExecutorExceptionProtoHandler,
	#category : #'GToolkit-Executor-Core-Exception Handlers'
}

{ #category : #factory }
GtExecutorExceptionHandler class >> default [
	^ self skipping
]

{ #category : #testing }
GtExecutorExceptionHandler class >> isAbstract [ 
	^ self name = #GtExecutorExceptionHandler 
]

{ #category : #factory }
GtExecutorExceptionHandler class >> null [
	^ GtExecutorExceptionNullHandler
]

{ #category : #factory }
GtExecutorExceptionHandler class >> passing [
	^ GtExecutorExceptionPassingHandler new
]

{ #category : #factory }
GtExecutorExceptionHandler class >> skipping [
	^ GtExecutorExceptionSkippingHandler new
]

{ #category : #'private - execution' }
GtExecutorExceptionHandler >> secureExecution: aCommand onException: anExceptionBlock [
	<return: #GtExecutorExecutionContext>
	^ self 
		secureExecution: aCommand 
		onSuccess: [ :theCommand | GtExecutorExecutionContext continue ] 
		onException: anExceptionBlock.
]

{ #category : #'private - execution' }
GtExecutorExceptionHandler >> secureExecution: aCommand onSuccess: aSuccessBlock onException: anExceptionBlock [
	<return: #GtExecutorExecutionContext>
	^ [ 
		aCommand executionStatus: GtExecutorStatus executing.
		aCommand execute.
		aCommand executionStatus: GtExecutorStatus finished.
		aSuccessBlock cull: aCommand.
	]
	on: Error 
	do: [ :anException |
		aCommand executionStatus: GtExecutorStatus exception.
		anExceptionBlock cull: anException cull: aCommand ]
]
