Class {
	#name : #GtExecutorRequestReceiver,
	#superclass : #GtExecutorRequestProtoReceiver,
	#traits : 'TGtExecutorZincResponseAccess + TGtExecutorExceptionAccess',
	#classTraits : 'TGtExecutorZincResponseAccess classTrait + TGtExecutorExceptionAccess classTrait',
	#instVars : [
		'handledErrors',
		'zincClient'
	],
	#category : #'GToolkit-Executor-Zinc-Request Execution'
}

{ #category : #asserting }
GtExecutorRequestReceiver >> assertClient [
	self assertClient: self zincClient.
]

{ #category : #asserting }
GtExecutorRequestReceiver >> assertClient: aZnClient [
	self 
		assert: [ aZnClient isNotNil ] 
		description: [ 'Zinc client must be initialized' ].
]

{ #category : #asserting }
GtExecutorRequestReceiver >> assertMessage: aMessage [
	self 
		assert: [ aMessage isSymbol ] 
		description: [ 'Execution message must be a symbol' ].
	self
		assert: [ aMessage numArgs = 0 ] 
		description: [ 'Execution message must be an unary message' ].
]

{ #category : #defaults }
GtExecutorRequestReceiver >> defaultHandledErros [
	^ InvalidSocketStatusException, NetworkError
]

{ #category : #operations }
GtExecutorRequestReceiver >> delete [
	self executeWithMessage: #delete
]

{ #category : #operations }
GtExecutorRequestReceiver >> executeWithMessage: aMessage [
	self assertMessage: aMessage.
	self assertClient.
	[ 
		aMessage value: self zincClient.
		self response: self zincClient response.
	] on: self handledErrors do: [ :anException | 
		self exception: anException. ].
]

{ #category : #operations }
GtExecutorRequestReceiver >> get [
	self executeWithMessage: #get
]

{ #category : #accessing }
GtExecutorRequestReceiver >> handledErrors [
	<return: #Exception>
	^ handledErrors
]

{ #category : #operations }
GtExecutorRequestReceiver >> head [
	self executeWithMessage: #head
]

{ #category : #initialization }
GtExecutorRequestReceiver >> initialize [
	super initialize.
	handledErrors := self defaultHandledErros.
]

{ #category : #testing }
GtExecutorRequestReceiver >> isException [
	^ self exception isNotNil
]

{ #category : #testing }
GtExecutorRequestReceiver >> isResponse [
	^ self response isNotNil
]

{ #category : #operations }
GtExecutorRequestReceiver >> options [
	self executeWithMessage: #options
]

{ #category : #operations }
GtExecutorRequestReceiver >> patch [
	self executeWithMessage: #patch
]

{ #category : #operations }
GtExecutorRequestReceiver >> post [
	self executeWithMessage: #post
]

{ #category : #operations }
GtExecutorRequestReceiver >> put [
	self executeWithMessage: #put
]

{ #category : #accessing }
GtExecutorRequestReceiver >> zincClient [
	<return: #ZnClient>
	^ zincClient
]

{ #category : #accessing }
GtExecutorRequestReceiver >> zincClient: aZnClient [
	self assertClient: aZnClient.
	zincClient := aZnClient.
]
