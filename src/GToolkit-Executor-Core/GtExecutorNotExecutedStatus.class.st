Class {
	#name : #GtExecutorNotExecutedStatus,
	#superclass : #GtExecutorStatus,
	#category : #'GToolkit-Executor-Core-Execution Statuses'
}

{ #category : #printing }
GtExecutorNotExecutedStatus >> printOn: aStream [
	aStream nextPutAll: 'Not executed'
]
