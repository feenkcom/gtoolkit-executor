Class {
	#name : #GtExecutorConfiguration,
	#superclass : #GtExecutorProtoConfiguration,
	#traits : 'TGtOptions',
	#classTraits : 'TGtOptions classTrait',
	#category : #'GToolkit-Executor-Core-Configurations'
}

{ #category : #testing }
GtExecutorConfiguration class >> isAbstract [
	^ self name = #GtExecutorConfiguration 
]

{ #category : #accessing }
GtExecutorConfiguration >> name [
	<return: #String>
	^ self subclassResponsibility
]

{ #category : #printing }
GtExecutorConfiguration >> printOn: aStream [
	self class isAbstract ifTrue: [ ^ super printOn: aStream ].
	aStream 
		nextPutAll: 'Configuration ';
		print: self name asString
]

{ #category : #signalling }
GtExecutorConfiguration >> signalMissingValueOfName: aName [
	^ NotFound new
		object: aName;
		collection: self;
		messageText: aName asString, ' must be set first';
		signal
]
