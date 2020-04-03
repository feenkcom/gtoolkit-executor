Class {
	#name : #GtExecutorNullCommand,
	#superclass : #GtExecutorProtoNullCommand,
	#category : #'GToolkit-Executor-Core-Commands'
}

{ #category : #execution }
GtExecutorNullCommand >> execute [
	"do nothing"
]

{ #category : #printing }
GtExecutorNullCommand >> printOn: aStream [
	aStream nextPutAll: 'Null command executing nothing'
]
