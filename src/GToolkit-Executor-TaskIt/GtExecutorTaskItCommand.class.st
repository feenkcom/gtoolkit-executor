Class {
	#name : #GtExecutorTaskItCommand,
	#superclass : #GtExecutorDecoratingCommand,
	#instVars : [
		'pool'
	],
	#category : #'GToolkit-Executor-TaskIt-Commands'
}

{ #category : #accessing }
GtExecutorTaskItCommand class >> subCommandExecutionContextOptionName [
	^ #subCommandExecutionContext
]

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

{ #category : #execution }
GtExecutorTaskItCommand >> executeInContext: aGtExecutorExecutionContext [
	<return: #GtExecutorExecutionContext>
	self subCommandExecutionContext: aGtExecutorExecutionContext.
	^ super executeInContext: aGtExecutorExecutionContext
]

{ #category : #'private - execution' }
GtExecutorTaskItCommand >> executeSubCommandInPool [
	| aFutureAdaptor |
	aFutureAdaptor := GtExecutorTaskItFutureAdaptor new.
	self answer: (GtExecutorAnswer taskIt: aFutureAdaptor).
	aFutureAdaptor future: self newFuture
]

{ #category : #'private - execution' }
GtExecutorTaskItCommand >> executeSubCommandInSameProcess [
	self executeSubCommand.
	self answer: (GtExecutorAnswer noValue: 'Successfully executed in same process').
]

{ #category : #'private - execution' }
GtExecutorTaskItCommand >> newFuture [
	<return: #TKTFuture>
	^ self pool future: [ 
			self command executeInContext: self subCommandExecutionContext.
			self command ]
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

{ #category : #'private - accessing' }
GtExecutorTaskItCommand >> subCommandExecutionContext [
	<return: #GtExecutorExecutionContext>
	^ self 
		optionAt: self class subCommandExecutionContextOptionName 
		ifAbsent: [ GtExecutorExecutionContext null ]
]

{ #category : #'private - accessing' }
GtExecutorTaskItCommand >> subCommandExecutionContext: aGtExecutorExecutionContext [
	self assertOptionDoesNotExist: self class subCommandExecutionContextOptionName.
	self 
		optionAt: self class subCommandExecutionContextOptionName 
		put: aGtExecutorExecutionContext
]
