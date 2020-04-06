Class {
	#name : #GtExecutorZincAnswerBuilder,
	#superclass : #GtExecutorZincProtoAnswerBuilder,
	#instVars : [
		'response'
	],
	#category : #'GToolkit-Executor-Zinc-Answers Builder'
}

{ #category : #accessing }
GtExecutorZincAnswerBuilder >> response [
	^ response
]

{ #category : #accessing }
GtExecutorZincAnswerBuilder >> response: aZnResponse [
	self 
		assert: [ aZnResponse isNotNil ] 
		description: [ 'Zinc response must be non-nil' ].
	response := aZnResponse
]
