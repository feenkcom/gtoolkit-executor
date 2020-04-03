Class {
	#name : #GtExecutorValuableCommand,
	#superclass : #GtExecutorCommand,
	#instVars : [
		'result',
		'valuable'
	],
	#category : #'GToolkit-Executor-Core-Commands'
}

{ #category : #execution }
GtExecutorValuableCommand >> execute [
	self result: self valuable value
]

{ #category : #printing }
GtExecutorValuableCommand >> printOn: aStream [
	aStream
		nextPutAll: 'Execution of ';
		print: self valuable
]

{ #category : #accessing }
GtExecutorValuableCommand >> result [
	^ result
]

{ #category : #accessing }
GtExecutorValuableCommand >> result: anObject [
	result := anObject
]

{ #category : #accessing }
GtExecutorValuableCommand >> valuable [
	^ valuable
]

{ #category : #accessing }
GtExecutorValuableCommand >> valuable: anObject [
	valuable := anObject
]
