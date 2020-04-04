Class {
	#name : #GtExecutorTaskItCommand,
	#superclass : #GtExecutorDecoratingCommand,
	#instVars : [
		'pool'
	],
	#category : #'GToolkit-Executor-TaskIt-Commands'
}

{ #category : #asserting }
GtExecutorTaskItCommand >> assertCallback: aCallback [
	self
		assert: [ aCallback isNotNil ]
		description: [ 'Callback must be non-nil' ].
	self
		assert: [ aCallback numArgs = 1 ] 
		description: [ 'Callback must have one argument' ].
]

{ #category : #execution }
GtExecutorTaskItCommand >> execute [
	BlUseAsyncFeatures
		ifEnabledDo: [ self executeSubCommandInPool ]
		otherwise: [ self executeSubCommandInSameProcess ]
]

{ #category : #'private - execution' }
GtExecutorTaskItCommand >> executeSubCommandInPool [
	| aFutureAdaptor aFuture |
	aFutureAdaptor := GtExecutorTaskItFutureAdaptor new.
	self answer: (GtExecutorAnswer taskIt: aFutureAdaptor).
	aFuture := self newFuture.
	aFutureAdaptor future: aFuture.
	aFuture onFailureDo: [ :anException | 
		| anExceptionAnswer |
		anExceptionAnswer := GtExecutorAnswer exception: anException.
		anExceptionAnswer description: 'Exception handled by TaskIt'.
		self command answer: anExceptionAnswer ].
]

{ #category : #'private - execution' }
GtExecutorTaskItCommand >> executeSubCommandInSameProcess [
	self executeSubCommand.
	self answer: (GtExecutorAnswer noValue: 'Successfully executed in same process').
]

{ #category : #'private - execution' }
GtExecutorTaskItCommand >> newFuture [
	<return: #TKTFuture>
	| aCommand |
	aCommand := GtExecutorTaskItSubCommand new 
		command: self command;
		context: self subCommandExecutionContext.
	^ self pool future: aCommand
]

{ #category : #accessing }
GtExecutorTaskItCommand >> pool [
	^ pool ifNil: [ pool := BlTktWorkerProvider highUIExternalResourceBoundPool ]
]

{ #category : #accessing }
GtExecutorTaskItCommand >> pool: aBlTktCommonQueueWorkerPool [
	self 
		assert: [ aBlTktCommonQueueWorkerPool isNotNil ]
		description: [ 'Worker pool must be non-nil' ].
	pool := aBlTktCommonQueueWorkerPool
]

{ #category : #printing }
GtExecutorTaskItCommand >> printOn: aStream [
	aStream nextPutAll: 'TaskIt execution'
]
