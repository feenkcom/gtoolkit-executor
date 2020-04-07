Class {
	#name : #GtExecutorZincFailureAnswer,
	#superclass : #GtExecutorZincFailureProtoAnswer,
	#traits : 'TGtExecutorZincResponseAccess',
	#classTraits : 'TGtExecutorZincResponseAccess classTrait',
	#category : #'GToolkit-Executor-Zinc-Answers'
}

{ #category : #testing }
GtExecutorZincFailureAnswer class >> isAbstract [ 
	^ self name = #GtExecutorZincFailureAnswer 
]

{ #category : #factory }
GtExecutorZincFailureAnswer class >> notFound: aResponse [
	^ GtExecutorZincNotFoundAnswer new response: aResponse
]

{ #category : #printing }
GtExecutorZincFailureAnswer >> printOn: aStream [
	self response ifNil: [ ^ super printOn: aStream ].
	self response statusLine printCodeAndReasonOn: aStream.
]
