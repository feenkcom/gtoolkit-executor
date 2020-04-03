Class {
	#name : #GtExecutorSuccessfulAnswerWithValue,
	#superclass : #GtExecutorSuccessfulAnswer,
	#instVars : [
		'value',
		'hasValue'
	],
	#category : #'GToolkit-Executor-Core-Answers'
}

{ #category : #testing }
GtExecutorSuccessfulAnswerWithValue >> hasValue [
	^ hasValue
]

{ #category : #initialization }
GtExecutorSuccessfulAnswerWithValue >> initialize [
	super initialize.
	hasValue := false.
]

{ #category : #printing }
GtExecutorSuccessfulAnswerWithValue >> printOn: aStream [
	self hasValue 
		ifTrue: [ 
			aStream 
				nextPutAll: 'Answer with value: ';
			 	print: self value ] 
		ifFalse: [ 
			aStream nextPutAll: 'Answer without value' ]
]

{ #category : #accessing }
GtExecutorSuccessfulAnswerWithValue >> value [
	^ value
]

{ #category : #accessing }
GtExecutorSuccessfulAnswerWithValue >> value: anObject [
	value := anObject.
	hasValue := true.
]
