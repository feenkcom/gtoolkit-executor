Class {
	#name : #GtExecutorExceptionSkippingHandler,
	#superclass : #GtExecutorExceptionHandler,
	#category : #'GToolkit-Executor-Core-Exception Handlers'
}

{ #category : #execution }
GtExecutorExceptionSkippingHandler >> execute: aCommand [
	<return: #GtExecutorExecutionContext>
	^ self execute: aCommand previousContext: GtExecutorExecutionContext start
]

{ #category : #execution }
GtExecutorExceptionSkippingHandler >> execute: aCommand previousContext: aPreviousContext [
	<return: #GtExecutorExecutionContext>
	^ aPreviousContext execute: aCommand using: self.
]

{ #category : #'execution - double dispatch' }
GtExecutorExceptionSkippingHandler >> run: aCommand [
	<return: #GtExecutorExecutionContext>
	^ self 
		secureExecution: aCommand
		onSuccess: [ :theCommand | GtExecutorExecutionContext continue ]
		onException: [ :anException :theCommand | 
			theCommand answer: (GtExecutorAnswer exception: anException).
			GtExecutorExecutionContext exception: anException ]
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

{ #category : #'private - execution' }
GtExecutorExceptionSkippingHandler >> skip: aCommand [
	<return: #GtExecutorExecutionContext>
	^ GtExecutorExecutionContext skip 
]
