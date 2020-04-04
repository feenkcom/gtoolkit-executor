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
	self assert: theResults first class equals: GtExecutorTaskItSuccessfulAnnouncement.
	self assert: theResults first answer equals: anAnswer.
	self assert: theResults first subAnswer isAnswer.
	self assert: theResults first subAnswer isSuccess.
	self assert: aCommand hasAnswer.
	self assert: aCommand answer value equals: 42.
	^ anAnswer
]

{ #category : #'*GToolkit-Executor-TaskIt' }
GtExecutorDecoratorExamples >> answerOfTaskItCommand_SubscribeAfterExecution [
	<gtExample>
	| anAnswer theResults aSemaphore aTimeout |
	theResults := OrderedCollection new.
	aSemaphore := Semaphore new.
	anAnswer := self answerOfTaskItCommand.
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
	self assert: theResults first class equals: GtExecutorTaskItSuccessfulAnnouncement.
	^ anAnswer
]

{ #category : #'*GToolkit-Executor-TaskIt' }
GtExecutorDecoratorExamples >> answerOfTaskItFailingSubCommand [
	<gtExample>
	| aBuilder aCommand anAnswer theResults aSemaphore aTimeout |
	theResults := OrderedCollection new.
	aSemaphore := Semaphore new.
	aBuilder := self decoratorWithTaskItFailingSubCommand.
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
	self assert: theResults first class equals: GtExecutorTaskItSuccessfulAnnouncement.
	self assert: theResults first answer equals: anAnswer.
	self assert: theResults first subAnswer isAnswer.
	self assert: theResults first subAnswer isFailure.
	self assert: aCommand hasAnswer.
	self assert: aCommand answer value equals: 42.
	^ anAnswer
]

{ #category : #'*GToolkit-Executor-TaskIt' }
GtExecutorDecoratorExamples >> answerOfTaskItFailingSubCommand_SubscribeAfterExecution [
	<gtExample>
	| anAnswer theResults aSemaphore aTimeout |
	theResults := OrderedCollection new.
	aSemaphore := Semaphore new.
	anAnswer := self answerOfTaskItFailingSubCommand.
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
	self assert: theResults first class equals: GtExecutorTaskItSuccessfulAnnouncement.
	self assert: theResults first answer equals: anAnswer.
	self assert: theResults first subAnswer isAnswer.
	self assert: theResults first subAnswer isFailure.
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
GtExecutorDecoratorExamples >> decoratorWithTaskItFailingSubCommand [
	<gtExample>
	| aDecorator aCommand |
	aDecorator := self decoratorWithErroneousPostExecutionCommand.
	aCommand := self basicTaskItCommand.
	aDecorator command: aCommand.
	self assert: aDecorator commands size equals: 2.
	self assert: aDecorator commands second equals: aCommand.
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

{ #category : #'*GToolkit-Executor-TaskIt' }
GtExecutorDecoratorExamples >> executionWithTaskItFailingSubCommand [
	<gtExample>
	| aBuilder aCommand |
	aBuilder := self decoratorWithTaskItFailingSubCommand.
	aCommand := self valuableCommand.
	aBuilder execute: aCommand.
	self assert: aCommand hasAnswer not.
	^ aCommand
]
