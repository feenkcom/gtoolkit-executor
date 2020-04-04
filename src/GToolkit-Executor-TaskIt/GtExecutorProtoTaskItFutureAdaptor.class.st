Class {
	#name : #GtExecutorProtoTaskItFutureAdaptor,
	#superclass : #Object,
	#category : #'GToolkit-Executor-TaskIt-Adaptors'
}

{ #category : #testing }
GtExecutorProtoTaskItFutureAdaptor >> isFuture [
	<return: #Boolean>
	^ self subclassResponsibility
]

{ #category : #subscriptions }
GtExecutorProtoTaskItFutureAdaptor >> onFailureDo: aCallback [
	self subclassResponsibility
]

{ #category : #subscriptions }
GtExecutorProtoTaskItFutureAdaptor >> onSuccessDo: aCallback [
	self subclassResponsibility
]
