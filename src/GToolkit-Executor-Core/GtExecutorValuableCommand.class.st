Class {
	#name : #GtExecutorValuableCommand,
	#superclass : #GtExecutorCommand,
	#instVars : [
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

{ #category : #convenience }
GtExecutorValuableCommand >> result: anObject [
	self answer: (GtExecutorAnswer value: anObject)
]

{ #category : #accessing }
GtExecutorValuableCommand >> valuable [
	^ valuable
]

{ #category : #accessing }
GtExecutorValuableCommand >> valuable: anObject [
	valuable := anObject
]
