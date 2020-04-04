Extension { #name : #GtExecutorDecoratorExamples }

{ #category : #'*GToolkit-Executor-TaskIt' }
GtExecutorDecoratorExamples >> answerOfTaskItCommand [
	<gtExample>
	| aDecorator aCommand anAnswer theResults aSemaphore |
	theResults := OrderedCollection new.
	aSemaphore := Semaphore new.
	aDecorator := self decoratorWithTaskItCommand.
	aCommand := self valuableCommand.
	anAnswer := aDecorator execute: aCommand.
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
	self assertSemaphoreTimeout: aSemaphore.
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
		description: 'TaskIt process has not finished on time'.
	self assert: theResults size equals: 1.
	self assert: theResults first class equals: GtExecutorTaskItSuccessfulAnnouncement.
	^ anAnswer
]

{ #category : #'*GToolkit-Executor-TaskIt' }
GtExecutorDecoratorExamples >> answerOfTaskItFailingSubCommand [
	<gtExample>
	| aDecorator aCommand anAnswer theResults aSemaphore |
	theResults := OrderedCollection new.
	aSemaphore := Semaphore new.
	aDecorator := self decoratorWithTaskItFailingSubCommand.
	aDecorator commands first valuable: [ :aSubCommand | 
		theResults add: ZeroDivide.
		aSubCommand result: 108 / 0 ].
	aCommand := self valuableCommand.
	anAnswer := aDecorator execute: aCommand.
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
	self assertSemaphoreTimeout: aSemaphore.
	self assert: theResults size equals: 2.
	self assert: theResults first equals: ZeroDivide.
	self assert: theResults second class equals: GtExecutorTaskItSuccessfulAnnouncement.
	self assert: theResults second answer equals: anAnswer.
	self assert: theResults second subAnswer isAnswer.
	self assert: theResults second subAnswer isFailure.
	self assert: aCommand hasAnswer.
	self assert: aCommand answer value equals: 42.
	^ anAnswer
]

{ #category : #'*GToolkit-Executor-TaskIt' }
GtExecutorDecoratorExamples >> answerOfTaskItFailingSubCommand_SubscribeAfterExecution [
	<gtExample>
	| anAnswer theResults aSemaphore |
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
	self assertSemaphoreTimeout: aSemaphore.
	self assert: theResults size equals: 1.
	self assert: theResults first class equals: GtExecutorTaskItSuccessfulAnnouncement.
	self assert: theResults first answer equals: anAnswer.
	self assert: theResults first subAnswer isAnswer.
	self assert: theResults first subAnswer isFailure.
	^ anAnswer
]

{ #category : #'*GToolkit-Executor-TaskIt' }
GtExecutorDecoratorExamples >> answerOfTaskItFailingSubCommand_ThreeSecondsLong [
	<gtExample>
	| aDecorator aCommand anAnswer |
	aDecorator := self decoratorWithTaskItFailingSubCommand.
	aDecorator commands first valuable: [ :aSubCommand | 
		3 seconds wait.
		aSubCommand result: 108 / 0 ].
	aCommand := self valuableCommand.
	anAnswer := aDecorator execute: aCommand.
	self
		assert: anAnswer class
		equals: GtExecutorTaskItAnswer.
	^ anAnswer
]

{ #category : #'*GToolkit-Executor-TaskIt' }
GtExecutorDecoratorExamples >> answerOfTaskItFailingSubCommand_WhenDo_FailureAnnouncement [
	<gtExample>
	| aDecorator aCommand anAnswer theResults aSemaphore aSubscriptionAdaptor |
	theResults := OrderedCollection new.
	aSemaphore := Semaphore new.
	aDecorator := self decoratorWithTaskItFailingSubCommand.
	aDecorator exceptionHandler: self basicPassingExceptionHandler.
	aCommand := self valuableCommand.
	anAnswer := aDecorator execute: aCommand.
	self
		assert: anAnswer class
		equals: GtExecutorTaskItAnswer.
	aSubscriptionAdaptor := anAnswer 
		when: GtExecutorTaskItFailureAnnouncement 
		do: [ :anAnnouncement | 
			theResults add: anAnnouncement. 
			aSemaphore signal ].
	anAnswer 
		whenSuccessDo: [ :anAnnouncement | 
			theResults add: anAnnouncement. 
			aSemaphore signal ].
	self assertSemaphoreTimeout: aSemaphore.
	
	"Assert results"
	self assert: theResults size equals: 1.
	self assert: theResults first class equals: GtExecutorTaskItFailureAnnouncement.
	self assert: theResults first answer equals: anAnswer.
	self assert: theResults first exception class equals: ZeroDivide.
	
	"Assert the subscription adaptor"
	self assert: aSubscriptionAdaptor hasAdaptors.
	self assert: aSubscriptionAdaptor adaptors size equals: 1.
	self
		assert: aSubscriptionAdaptor adaptors first subscription announcementClass
		equals: GtExecutorTaskItFailureAnnouncement.
	
	"Assert the command answer"
	self assert: aCommand hasAnswer.
	self assert: aCommand answer value equals: 42.
	^ anAnswer
]

{ #category : #'*GToolkit-Executor-TaskIt' }
GtExecutorDecoratorExamples >> answerOfTaskItFailingSubCommand_WhenDo_SuccessfulAnnouncement [
	<gtExample>
	| anAnswer theResults aSemaphore aSubscriptionAdaptor |
	theResults := OrderedCollection new.
	aSemaphore := Semaphore new.
	anAnswer := self answerOfTaskItFailingSubCommand.
	aSubscriptionAdaptor := anAnswer 
		when: GtExecutorTaskItSuccessfulAnnouncement 
		do: [ :anAnnouncement | 
			theResults add: anAnnouncement. 
			aSemaphore signal ].
	self assertSemaphoreTimeout: aSemaphore.
	
	"Assert results"
	self assert: theResults size equals: 1.
	self assert: theResults first class equals: GtExecutorTaskItSuccessfulAnnouncement.
	self assert: theResults first answer equals: anAnswer.
	self assert: theResults first subAnswer isAnswer.
	self assert: theResults first subAnswer isFailure.
	
	"Assert the subscription adaptor"
	self assert: aSubscriptionAdaptor hasAdaptors.
	self assert: aSubscriptionAdaptor adaptors size equals: 1.
	self
		assert: aSubscriptionAdaptor adaptors first subscription announcementClass
		equals: GtExecutorTaskItSuccessfulAnnouncement.
	^ anAnswer
]

{ #category : #'*GToolkit-Executor-TaskIt' }
GtExecutorDecoratorExamples >> answerOfTaskItFailingSubCommand_WhenDo_TaskItAnnouncement [
	<gtExample>
	| aDecorator aCommand anAnswer theResults aSemaphore aSubscriptionAdaptor |
	theResults := OrderedCollection new.
	aSemaphore := Semaphore new.
	aDecorator := self decoratorWithTaskItFailingSubCommand.
	aDecorator exceptionHandler: self basicPassingExceptionHandler.
	aCommand := self valuableCommand.
	anAnswer := aDecorator execute: aCommand.
	self
		assert: anAnswer class
		equals: GtExecutorTaskItAnswer.
	aSubscriptionAdaptor := anAnswer 
		when: GtExecutorTaskItAnnouncement
		do: [ :anAnnouncement | 
			theResults add: anAnnouncement. 
			aSemaphore signal ].
	anAnswer 
		whenSuccessDo: [ :anAnnouncement | 
			theResults add: anAnnouncement. 
			aSemaphore signal ].
	self assertSemaphoreTimeout: aSemaphore.
	
	"Assert results"
	self assert: theResults size equals: 1.
	self assert: theResults first class equals: GtExecutorTaskItFailureAnnouncement.
	self assert: theResults first answer equals: anAnswer.
	self assert: theResults first exception class equals: ZeroDivide.
	
	"Assert the subscription adaptor"
	self assert: aSubscriptionAdaptor hasAdaptors.
	self assert: aSubscriptionAdaptor adaptors size equals: 2.
	self
		assert: aSubscriptionAdaptor adaptors first subscription announcementClass
		equals: GtExecutorTaskItFailureAnnouncement.
	self
		assert: aSubscriptionAdaptor adaptors second subscription isNil.
	
	"Assert the command answer"
	self assert: aCommand hasAnswer.
	self assert: aCommand answer value equals: 42.
	^ anAnswer
]

{ #category : #'*GToolkit-Executor-TaskIt' }
GtExecutorDecoratorExamples >> basicTaskItAnswer [
	<gtExample>
	| anAnswer |
	anAnswer := GtExecutorTaskItAnswer new.
	self assert: anAnswer futureAdaptor isFuture not.
	self assert: anAnswer announcers isNotNil.
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
