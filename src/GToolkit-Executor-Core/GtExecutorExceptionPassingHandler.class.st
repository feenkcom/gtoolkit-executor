Class {
	#name : #GtExecutorExceptionPassingHandler,
	#superclass : #GtExecutorExceptionHandler,
	#category : #'GToolkit-Executor-Core-Exception Handlers'
}

{ #category : #'execution - double dispatch' }
GtExecutorExceptionPassingHandler >> run: aCommand [
	<return: #GtExecutorExecutionContext>
	^ self 
		secureExecution: aCommand 
		onException: [ :anException :theCommand | 
			theCommand answer: (GtExecutorAnswer exception: anException).
			anException pass ]
]
