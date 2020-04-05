Class {
	#name : #GtExecutorZincGetCommand,
	#superclass : #GtExecutorZincCommand,
	#instVars : [
		'segments'
	],
	#category : #'GToolkit-Executor-Zinc-Commands'
}

{ #category : #defaults }
GtExecutorZincGetCommand >> defaultSegments [
	^ #()
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

{ #category : #convenient }
GtExecutorZincGetCommand >> url [
	^ ZnUrl new addPathSegments: self segments
]
