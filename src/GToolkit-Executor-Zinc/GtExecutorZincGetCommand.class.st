Class {
	#name : #GtExecutorZincGetCommand,
	#superclass : #GtExecutorZincCommand,
	#instVars : [
		'segments'
	],
	#category : #'GToolkit-Executor-Zinc-Commands'
}

{ #category : #accessing }
GtExecutorZincGetCommand >> answerBuilder [
	^ GtExecutorZincAnswerBuilder new
]

{ #category : #defaults }
GtExecutorZincGetCommand >> defaultSegments [
	^ #()
]

{ #category : #execution }
GtExecutorZincGetCommand >> execute [
	self assertClientUrl.
	self setUrlPath.
	self requestResponseAndSetResponse.
]

{ #category : #initialization }
GtExecutorZincGetCommand >> initialize [
	super initialize.
	segments := self defaultSegments.
]

{ #category : #printing }
GtExecutorZincGetCommand >> printOn: aStream [ 
	self segments ifNil: [ ^ super printOn: aStream ].
	aStream 
		nextPutAll: 'GET ';
		print: self url
]

{ #category : #'private - execution' }
GtExecutorZincGetCommand >> requestResponseAndSetResponse [
	| aReceiver |
	aReceiver := GtExecutorRequestReceiver new.
	aReceiver zincClient: self zincClient.
	aReceiver get.
	aReceiver isResponse ifTrue: [ 
		self setAnswerFromResponse: aReceiver response ].
	aReceiver isException ifTrue: [ 
		self setAnswerFromException: aReceiver exception ].
]

{ #category : #accessing }
GtExecutorZincGetCommand >> segments [
	<return: #Array of: #String>
	^ segments
]

{ #category : #accessing }
GtExecutorZincGetCommand >> segments: anArray [
	self 
		assert: [ anArray isArray ] 
		description: [ 'Segments must be an array' ].
	self 
		assert: [ anArray allSatisfy: #isString ] 
		description: [ 'Segments must be an array of strings' ].
	segments := anArray
]

{ #category : #'private - execution' }
GtExecutorZincGetCommand >> setAnswerFromException: anException [
	self answer: (GtExecutorZincNetworkErrorAnswer new exception: anException)
]

{ #category : #'private - execution' }
GtExecutorZincGetCommand >> setAnswerFromResponse: aResponse [
	| anAnswer |
	anAnswer := self answerBuilder
		response: aResponse;
		build.
	self answer: anAnswer.
]

{ #category : #'private - execution' }
GtExecutorZincGetCommand >> setUrlPath [
	self zincClient addPath: self segments
]

{ #category : #convenient }
GtExecutorZincGetCommand >> url [
	^ ZnUrl new addPathSegments: self segments
]
