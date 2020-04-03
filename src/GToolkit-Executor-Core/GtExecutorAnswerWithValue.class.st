Class {
	#name : #GtExecutorAnswerWithValue,
	#superclass : #GtExecutorAnswer,
	#instVars : [
		'value',
		'hasValue'
	],
	#category : #'GToolkit-Executor-Core-Answers'
}

{ #category : #testing }
GtExecutorAnswerWithValue >> hasValue [
	^ hasValue
]

{ #category : #initialization }
GtExecutorAnswerWithValue >> initialize [
	super initialize.
	hasValue := false.
]

{ #category : #printing }
GtExecutorAnswerWithValue >> printOn: aStream [
	self hasValue 
		ifTrue: [ 
			aStream 
				nextPutAll: 'Answer with value: ';
			 	print: self value ] 
		ifFalse: [ 
			aStream nextPutAll: 'Asnwer without value' ]
]

{ #category : #accessing }
GtExecutorAnswerWithValue >> value [
	^ value
]

{ #category : #accessing }
GtExecutorAnswerWithValue >> value: anObject [
	value := anObject.
	hasValue := true.
]
