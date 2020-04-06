Class {
	#name : #GtExecutorZincServiceUrlCommand,
	#superclass : #GtExecutorZincDecoratingCommand,
	#instVars : [
		'url'
	],
	#category : #'GToolkit-Executor-Zinc-Commands'
}

{ #category : #execution }
GtExecutorZincServiceUrlCommand >> execute [
	self assertConfigurations.
	self zincClient url: self url.
	self executeSubCommandAndAnswer: (GtExecutorAnswer value: self url)
]

{ #category : #accessing }
GtExecutorZincServiceUrlCommand >> printOn: aStream [
	aStream 
		nextPutAll: 'Service URL: ';
		print: (self url ifNil: [ '<undefined>' ]).
]

{ #category : #accessing }
GtExecutorZincServiceUrlCommand >> url [
	<return: #ZnUrl>
	^ url
]

{ #category : #accessing }
GtExecutorZincServiceUrlCommand >> url: aZnUrl [
	self 
		assert: [ aZnUrl isNotNil ] 
		description: [ 'Service URL must be non-nil' ].
	url := aZnUrl
]
