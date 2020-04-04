Class {
	#name : #GtExecutorExceptionSkippingHandler,
	#superclass : #GtExecutorExceptionHandler,
	#category : #'GToolkit-Executor-Core-Exception Handlers'
}

{ #category : #'execution - double dispatch' }
GtExecutorExceptionSkippingHandler >> run: aCommand [
	<return: #GtExecutorExecutionContext>
	^ self 
		secureExecution: aCommand
		onException: [ :anException :theCommand |
			theCommand answer: (GtExecutorAnswer exception: anException).
			GtExecutorExecutionContext exception: anException. ]
]
