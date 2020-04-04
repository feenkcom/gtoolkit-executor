Class {
	#name : #GtExecutorExceptionStatus,
	#superclass : #GtExecutorStatus,
	#category : #'GToolkit-Executor-Core-Execution Statuses'
}

{ #category : #printing }
GtExecutorExceptionStatus >> printOn: aStream [
	aStream nextPutAll: 'Finished with exception'
]
