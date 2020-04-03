Class {
	#name : #GtExecutorReplacablePostExecutionCommand,
	#superclass : #GtExecutorPostExecutionCommand,
	#instVars : [
		'id'
	],
	#category : #'GToolkit-Executor-Core-Examples'
}

{ #category : #accessing }
GtExecutorReplacablePostExecutionCommand >> id [
	^ id
]

{ #category : #accessing }
GtExecutorReplacablePostExecutionCommand >> id: anObject [
	id := anObject
]

{ #category : #testing }
GtExecutorReplacablePostExecutionCommand >> isReplacing: aCommand [
	^ (super isReplacing: aCommand) and: [ 
		self id = aCommand id ]
]
