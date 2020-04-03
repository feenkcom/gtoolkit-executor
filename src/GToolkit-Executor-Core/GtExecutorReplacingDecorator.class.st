Class {
	#name : #GtExecutorReplacingDecorator,
	#superclass : #GtExecutorDecorator,
	#category : #'GToolkit-Executor-Core-Decorators'
}

{ #category : #convenience }
GtExecutorReplacingDecorator >> replace: aCommand [
	| anIndex |
	self
		assert: [ aCommand isNotNil ] 
		description: [ 'Decorating command must be non-nil' ].
	anIndex := self commands
		detectIndex: [ :eachCommand | aCommand isReplacing: eachCommand ]
		ifNone: [ self command: aCommand. ^ self ].
	self commands: (self commands copy at: anIndex put: aCommand; yourself).
]
