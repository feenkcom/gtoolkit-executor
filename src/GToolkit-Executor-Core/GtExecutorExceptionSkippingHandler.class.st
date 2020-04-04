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
		onSuccess: [ :theCommand | GtExecutorExecutionContext continue ]
		onException: [ :anException :theCommand |
			theCommand answer: (GtExecutorAnswer exception: anException).
			GtExecutorExecutionContext exception: anException. ]
]

{ #category : #'private - execution' }
GtExecutorExceptionSkippingHandler >> secureExecution: aCommand onSuccess: aSuccessBlock onException: anExceptionBlock [
	<return: #GtExecutorExecutionContext>
	^ [ 
		aCommand execute.
		aSuccessBlock cull: aCommand.
	]
	on: Error 
	do: [ :anException |
		anExceptionBlock cull: anException cull: aCommand ]
]
