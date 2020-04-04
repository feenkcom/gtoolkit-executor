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
GtExecutorExceptionHandler class >> skipping [
	^ GtExecutorExceptionSkippingHandler new
]