Class {
	#name : #GtExecutorPreExecutionCommand,
	#superclass : #GtExecutorDecoratingCommand,
	#instVars : [
		'valuable'
	],
	#category : #'GToolkit-Executor-Core-Examples'
}

{ #category : #defaults }
GtExecutorPreExecutionCommand >> defaultValuable [
	^ [ :aCommand | "do nothing" ]
]

{ #category : #execution }
GtExecutorPreExecutionCommand >> execute [
	self valuable value: self command.
	self executeSubCommand.
	self answer: (GtExecutorAnswer noValueWithSuccess).
]

{ #category : #initialization }
GtExecutorPreExecutionCommand >> initialize [
	super initialize.
	valuable := self defaultValuable.
]

{ #category : #printing }
GtExecutorPreExecutionCommand >> printOn: aStream [
	aStream
		nextPutAll: 'Pre execution of ';
		print: self valuable
]

{ #category : #accessing }
GtExecutorPreExecutionCommand >> result: aValue [
	self command result: aValue
]

{ #category : #accessing }
GtExecutorPreExecutionCommand >> valuable [
	^ valuable
]

{ #category : #accessing }
GtExecutorPreExecutionCommand >> valuable: anObject [
	valuable := anObject
]
