Class {
	#name : #GtExecutorTaskItCommand,
	#superclass : #GtExecutorDecoratingCommand,
	#instVars : [
		'pool',
		'onSuccess',
		'onFailure',
		'future',
		'answer'
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

{ #category : #defaults }
GtExecutorTaskItCommand >> defaultCallbackCollection [
	^ OrderedCollection new: 2
]

{ #category : #defaults }
GtExecutorTaskItCommand >> defaultFuture [
	^ GtExecutorTaskItFuture null
]

{ #category : #defaults }
GtExecutorTaskItCommand >> defaultOnFailure [
	^ self defaultCallbackCollection
]

{ #category : #defaults }
GtExecutorTaskItCommand >> defaultOnSuccess [
	^ self defaultCallbackCollection
]

{ #category : #execution }
GtExecutorTaskItCommand >> execute [
	future := GtExecutorTaskItFuture new future: (
		self pool
			future: [ self command execute. self command ]).
	self subscribeFutureCallbacks.
	self answer: (GtExecutorTaskItAnswer new future: self future)
]

{ #category : #accessing }
GtExecutorTaskItCommand >> future [
	<return: #GtExecutorTaskItFuture>
	^ future
]

{ #category : #initialization }
GtExecutorTaskItCommand >> initialize [
	super initialize.
	onFailure := self defaultOnFailure.
	onSuccess := self defaultOnSuccess.
	future := self defaultFuture.
]

{ #category : #accessing }
GtExecutorTaskItCommand >> onFailure [
	^ onFailure
]

{ #category : #accessing }
GtExecutorTaskItCommand >> onFailureDo: aCallback [
	self assertCallback: aCallback.
	onFailure add: aCallback
]

{ #category : #accessing }
GtExecutorTaskItCommand >> onSuccess [
	^ onSuccess
]

{ #category : #accessing }
GtExecutorTaskItCommand >> onSuccessDo: aCallback [
	self assertCallback: aCallback.
	onSuccess add: aCallback
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

{ #category : #'private - subscriptions' }
GtExecutorTaskItCommand >> subscribeFutureCallbacks [
	self onSuccess
		do: [ :eachCallback | self future onSuccessDo: eachCallback ].
	self onSuccess
		do: [ :eachCallback | self future onFailureDo: eachCallback ]
]
