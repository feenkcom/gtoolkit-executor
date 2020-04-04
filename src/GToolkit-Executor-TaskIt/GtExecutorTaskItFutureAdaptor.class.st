Class {
	#name : #GtExecutorTaskItFutureAdaptor,
	#superclass : #GtExecutorProtoTaskItFutureAdaptor,
	#instVars : [
		'future',
		'hasFuture'
	],
	#category : #'GToolkit-Executor-TaskIt-Adaptors'
}

{ #category : #factory }
GtExecutorTaskItFutureAdaptor class >> null [
	^ GtExecutorNullFutureAdaptor default
]

{ #category : #asserting }
GtExecutorTaskItFutureAdaptor >> assertFuture [
	self 
		assert: [ self hasFuture ]
		description: [ 'TaskIt Future must exists' ]
]

{ #category : #accessing }
GtExecutorTaskItFutureAdaptor >> future [
	<return: #TKTFuture>
	^ future
]

{ #category : #accessing }
GtExecutorTaskItFutureAdaptor >> future: aTKTFuture [
	self 
		assert: [ aTKTFuture isNotNil ] 
		description: [ 'TaskIt Future must be non-nil' ].
	future := aTKTFuture.
	hasFuture := true.
]

{ #category : #accessing }
GtExecutorTaskItFutureAdaptor >> hasFuture [
	<return: #Boolean>
	^ hasFuture
]

{ #category : #initialization }
GtExecutorTaskItFutureAdaptor >> initialize [
	super initialize.
	hasFuture := false.
]

{ #category : #testing }
GtExecutorTaskItFutureAdaptor >> isFuture [
	^ true
]

{ #category : #subscriptions }
GtExecutorTaskItFutureAdaptor >> onFailureDo: aCallback [
	self assertFuture.
	self future onFailureDo: aCallback.
]

{ #category : #subscriptions }
GtExecutorTaskItFutureAdaptor >> onSuccessDo: aCallback [
	self assertFuture.
	self future onSuccessDo: aCallback.
]
