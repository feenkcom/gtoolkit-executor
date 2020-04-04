Class {
	#name : #GtExecutorExecutingStatus,
	#superclass : #GtExecutorStatus,
	#category : #'GToolkit-Executor-Core-Execution Statuses'
}

{ #category : #printing }
GtExecutorExecutingStatus >> printOn: aStream [
	aStream nextPutAll: 'Executing'
]
