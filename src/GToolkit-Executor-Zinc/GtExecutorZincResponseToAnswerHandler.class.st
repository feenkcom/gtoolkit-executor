Class {
	#name : #GtExecutorZincResponseToAnswerHandler,
	#superclass : #GtExecutorZincResponseToAnswerProtoHandler,
	#instVars : [
		'response'
	],
	#category : #'GToolkit-Executor-Zinc-Answers Builder'
}

{ #category : #testing }
GtExecutorZincResponseToAnswerHandler class >> handlesResponse: aZnResponse [
	<return: #Boolean>
	^ self subclassResponsibility
]

{ #category : #factory }
GtExecutorZincResponseToAnswerHandler class >> instanceForResponse: aZnResponse [
	<return: #GtExecutorZincResponseToAnswerHandler>
	self 
		assert: [ aZnResponse isNotNil ] 
		description: [ 'Response must be non-nil' ].
	self allSubclassesDo: [ :eachClass | 
		(eachClass handlesResponse: aZnResponse) ifTrue: [ 
			^ eachClass new response: aZnResponse ] ].
	self error: 'Response is not handled'
]

{ #category : #testing }
GtExecutorZincResponseToAnswerHandler class >> isAbstract [
	^ self name = #GtExecutorZincResponseToAnswerHandler 
]

{ #category : #accessing }
GtExecutorZincResponseToAnswerHandler >> response [
	<return: #ZnResponse>
	^ response
]

{ #category : #accessing }
GtExecutorZincResponseToAnswerHandler >> response: aZnResponse [
	self 
		assert: [ aZnResponse isNotNil ] 
		description: [ 'Response must be non-nil' ].
	response := aZnResponse
]
