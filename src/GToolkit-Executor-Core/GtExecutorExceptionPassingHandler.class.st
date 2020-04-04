Class {
	#name : #GtExecutorExceptionPassingHandler,
	#superclass : #GtExecutorExceptionHandler,
	#category : #'GToolkit-Executor-Core-Exception Handlers'
}

{ #category : #'execution - double dispatch' }
GtExecutorExceptionPassingHandler >> run: aCommand [
	<return: #GtExecutorExecutionContext>
	aCommand execute.
	^ GtExecutorExecutionContext continue.
]
