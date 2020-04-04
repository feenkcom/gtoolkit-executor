Class {
	#name : #GtExecutorFinishedStatus,
	#superclass : #GtExecutorStatus,
	#category : #'GToolkit-Executor-Core-Execution Statuses'
}

{ #category : #printing }
GtExecutorFinishedStatus >> printOn: aStream [
	aStream nextPutAll: 'Finished'
]
