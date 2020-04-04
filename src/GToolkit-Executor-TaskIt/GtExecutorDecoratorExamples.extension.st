Extension { #name : #GtExecutorDecoratorExamples }

{ #category : #'*GToolkit-Executor-TaskIt' }
GtExecutorDecoratorExamples >> answerOfTaskItCommand [
	<gtExample>
	| aBuilder aCommand anAnswer theResults aSemaphore aTimeout |
	theResults := OrderedCollection new.
	aSemaphore := Semaphore new.
	aBuilder := self decoratorWithTaskItCommand.
	aCommand := self valuableCommand.
	anAnswer := aBuilder execute: aCommand.
	self
		assert: anAnswer class
		equals: GtExecutorTaskItAnswer.
	anAnswer 
		whenSuccessDo: [ :anAnnouncement | 
			theResults add: anAnnouncement. 
			aSemaphore signal ];
		whenFailureDo: [ :anAnnouncement | 
			theResults add: anAnnouncement. 
			aSemaphore signal ].
	aTimeout := aSemaphore waitTimeoutSeconds: 10.
	self 
		assert: aTimeout not 
		description: 'TaskIt process has not finshed on time'.
	self assert: theResults size equals: 1.
	self assert: aCommand hasAnswer.
	self assert: aCommand answer value equals: 42.
	^ anAnswer
]

{ #category : #'*GToolkit-Executor-TaskIt' }
GtExecutorDecoratorExamples >> basicTaskItCommand [
	<gtExample>
	| aCommand |
	aCommand := GtExecutorTaskItCommand new.
	self assert: aCommand command equals: GtExecutorCommand null.
	self assert: aCommand hasAnswer not.
	^ aCommand
]

{ #category : #'*GToolkit-Executor-TaskIt' }
GtExecutorDecoratorExamples >> decoratorWithTaskItCommand [
	<gtExample>
	| aDecorator aCommand |
	aDecorator := self basicDecorator.
	aCommand := self basicTaskItCommand.
	aDecorator command: aCommand.
	self assert: aDecorator commands size equals: 1.
	self assert: aDecorator commands first equals: aCommand.
	^ aDecorator
]

{ #category : #'*GToolkit-Executor-TaskIt' }
GtExecutorDecoratorExamples >> executionWithTaskItCommand [
	<gtExample>
	| aBuilder aCommand |
	aBuilder := self decoratorWithTaskItCommand.
	aCommand := self valuableCommand.
	aBuilder execute: aCommand.
	self assert: aCommand hasAnswer not.
	^ aCommand
]
