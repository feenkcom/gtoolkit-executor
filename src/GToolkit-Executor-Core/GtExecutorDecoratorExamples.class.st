Class {
	#name : #GtExecutorDecoratorExamples,
	#superclass : #Object,
	#category : #'GToolkit-Executor-Core-Examples'
}

{ #category : #'examples - commands' }
GtExecutorDecoratorExamples >> anotherPostExecutionCommand [
	<gtExample>
	| aCommand aValuable |
	aCommand := self basicPostExecutionCommand.
	aValuable := [ :aSubCommand | aSubCommand result: 72 ].
	aCommand valuable: aValuable.
	self assert: aCommand valuable equals: aValuable.
	^ aCommand
]

{ #category : #'examples - answers' }
GtExecutorDecoratorExamples >> answerOfErroneousDecoringCommand [
	<gtExample>
	| aDecorator aCommand anAnswer |
	aDecorator := self decoratorWithErroneousPostExecutionCommand.
	aCommand := self valuableCommand.
	anAnswer := aDecorator execute: aCommand.
	self assert: anAnswer isAnswer.
	self assert: anAnswer hasValue not.

	self assert: aCommand hasAnswer.
	self assert: aCommand hasValue.
	self assert: aCommand answer value equals: 42.
	^ anAnswer
]

{ #category : #'examples - answers' }
GtExecutorDecoratorExamples >> answerOfOneDecoringCommand [
	<gtExample>
	| aDecorator aCommand anAnswer |
	aDecorator := self decoratorWithOnePostExecutionCommand.
	aCommand := self valuableCommand.
	anAnswer := aDecorator execute: aCommand.
	self assert: anAnswer isAnswer.
	self assert: anAnswer hasValue not.

	self assert: aCommand hasAnswer.
	self assert: aCommand hasValue.
	self assert: aCommand answer value equals: 108.
	^ anAnswer
]

{ #category : #'examples - answers' }
GtExecutorDecoratorExamples >> answerOfSecondErroneousPostExecutionCommand [
	<gtExample>
	| aDecorator aCommand anAnswer |
	aDecorator := self decoratorWithSecondErroneousPostExecutionCommand.
	aCommand := self valuableCommand.
	anAnswer := aDecorator execute: aCommand.
	self assert: anAnswer isAnswer.
	self assert: anAnswer hasValue not.

	self assert: aCommand hasAnswer.
	self assert: aCommand hasValue.
	self assert: aCommand answer value equals: 42.
	^ anAnswer
]

{ #category : #'examples - answers' }
GtExecutorDecoratorExamples >> answerOfTwoDecoringCommands [
	<gtExample>
	| aDecorator aCommand anAnswer |
	aDecorator := self decoratorWithTwoPostExecutionCommands.
	aCommand := self valuableCommand.
	anAnswer := aDecorator execute: aCommand.
	self assert: anAnswer isAnswer.
	self assert: anAnswer hasValue not.

	self assert: aCommand hasAnswer.
	self assert: aCommand hasValue.
	self assert: aCommand answer value equals: 72.
	^ anAnswer
]

{ #category : #'examples - answers' }
GtExecutorDecoratorExamples >> answerOfValuableCommand [
	<gtExample>
	| aDecorator aCommand anAnswer |
	aDecorator := self basicDecorator.
	aCommand := self valuableCommand.
	anAnswer := aDecorator execute: aCommand.
	self assert: anAnswer isAnswer.
	self assert: anAnswer hasValue.
	self assert: aCommand answer value equals: 42.
	^ anAnswer
]

{ #category : #assertions }
GtExecutorDecoratorExamples >> assertSemaphoreTimeout: aSemaphore [
	| aTimeout |
	aTimeout := aSemaphore waitTimeoutSeconds: 30.
	self
		assert: aTimeout not
		description: 'TaskIt process has not finished on time'
]

{ #category : #'examples - decorator' }
GtExecutorDecoratorExamples >> basicDecorator [
	<gtExample>
	| aDecorator |
	aDecorator := self defaultDecorator new.
	self assert: aDecorator commands size isZero.
	^ aDecorator
]

{ #category : #'examples - exception handlers' }
GtExecutorDecoratorExamples >> basicPassingExceptionHandler [
	<gtExample>
	| aHandler |
	aHandler := GtExecutorExceptionHandler passing.
	self assert: aHandler isNotNil.
	^ aHandler
]

{ #category : #'examples - commands' }
GtExecutorDecoratorExamples >> basicPostExecutionCommand [
	<gtExample>
	| aCommand |
	aCommand := self defaultPostExecutionCommand new.
	self assert: aCommand command equals: GtExecutorCommand null.
	self assert: aCommand valuable isNotNil.
	self assert: aCommand hasAnswer not.
	^ aCommand
]

{ #category : #'examples - commands' }
GtExecutorDecoratorExamples >> basicPreExecutionCommand [
	<gtExample>
	| aCommand |
	aCommand := GtExecutorPreExecutionCommand new.
	self assert: aCommand command equals: GtExecutorCommand null.
	self assert: aCommand valuable isNotNil.
	self assert: aCommand hasAnswer not.
	^ aCommand
]

{ #category : #'examples - exception handlers' }
GtExecutorDecoratorExamples >> basicSkippingHandler [
	<gtExample>
	| aHandler |
	aHandler := GtExecutorExceptionHandler skipping.
	self assert: aHandler isNotNil.
	^ aHandler
]

{ #category : #'examples - commands' }
GtExecutorDecoratorExamples >> basicValuableCommand [
	<gtExample>
	| aCommand |
	aCommand := GtExecutorValuableCommand new.
	self assert: aCommand hasAnswer not.
	self assert: aCommand hasValue not.
	^ aCommand
]

{ #category : #'examples - decorator' }
GtExecutorDecoratorExamples >> decoratorWithErroneousPostExecutionCommand [
	<gtExample>
	| aDecorator aCommand |
	aDecorator := self basicDecorator.
	aCommand := self erroneousPostExecutionCommand.
	aDecorator command: aCommand.
	self assert: aDecorator commands size equals: 1.
	self assert: aDecorator commands first equals: aCommand.
	^ aDecorator
]

{ #category : #'examples - decorator' }
GtExecutorDecoratorExamples >> decoratorWithErroneousPreExecutionCommand [
	<gtExample>
	| aDecorator aCommand |
	aDecorator := self basicDecorator.
	aCommand := self erroneousPreExecutionCommand.
	aDecorator command: aCommand.
	self assert: aDecorator commands size equals: 1.
	self assert: aDecorator commands first equals: aCommand.
	^ aDecorator
]

{ #category : #'examples - decorator' }
GtExecutorDecoratorExamples >> decoratorWithOnePostExecutionCommand [
	<gtExample>
	| aDecorator aCommand |
	aDecorator := self basicDecorator.
	aCommand := self postExecutionCommand.
	aDecorator command: aCommand.
	self assert: aDecorator commands size equals: 1.
	self assert: aDecorator commands first equals: aCommand.
	^ aDecorator
]

{ #category : #'examples - decorator' }
GtExecutorDecoratorExamples >> decoratorWithSecondErroneousPostExecutionCommand [
	<gtExample>
	| aDecorator aCommand |
	aDecorator := self decoratorWithErroneousPostExecutionCommand.
	aCommand := self anotherPostExecutionCommand.
	aDecorator command: aCommand.
	self assert: aDecorator commands size equals: 2.
	self assert: aDecorator commands second equals: aCommand.
	^ aDecorator
]

{ #category : #'examples - decorator' }
GtExecutorDecoratorExamples >> decoratorWithTwoPostExecutionCommands [
	<gtExample>
	| aDecorator aCommand |
	aDecorator := self decoratorWithOnePostExecutionCommand.
	aCommand := self anotherPostExecutionCommand.
	aDecorator command: aCommand.
	self assert: aDecorator commands size equals: 2.
	self assert: aDecorator commands second equals: aCommand.
	^ aDecorator
]

{ #category : #'examples - decorator' }
GtExecutorDecoratorExamples >> defaultDecorator [
	^ GtExecutorDecorator
]

{ #category : #'examples - commands' }
GtExecutorDecoratorExamples >> defaultPostExecutionCommand [
	^ GtExecutorPostExecutionCommand
]

{ #category : #'examples - commands' }
GtExecutorDecoratorExamples >> erroneousPostExecutionCommand [
	<gtExample>
	| aCommand aValuable |
	aCommand := self basicPostExecutionCommand.
	aValuable := [ :aSubCommand | aSubCommand result: 108 / 0 ].
	aCommand valuable: aValuable.
	self assert: aCommand valuable equals: aValuable.
	^ aCommand
]

{ #category : #'examples - commands' }
GtExecutorDecoratorExamples >> erroneousPreExecutionCommand [
	<gtExample>
	| aCommand aValuable |
	aCommand := self basicPreExecutionCommand.
	aValuable := [ :aSubCommand | aSubCommand valuable: [ 108 / 0 ] ].
	aCommand valuable: aValuable.
	self assert: aCommand valuable equals: aValuable.
	^ aCommand
]

{ #category : #'examples - commands' }
GtExecutorDecoratorExamples >> erroneousValuableCommand [
	<gtExample>
	| aCommand aValuable |
	aCommand := self basicValuableCommand.
	aValuable := [ 42 / 0 ].
	aCommand valuable: aValuable.
	self assert: aCommand valuable equals: aValuable.
	self assert: aCommand hasAnswer not.
	^ aCommand
]

{ #category : #'examples - execution' }
GtExecutorDecoratorExamples >> executingBasicValuableCommand [
	<gtExample>
	| aCommand |
	aCommand := self basicValuableCommand.
	aCommand execute.
	self assert: aCommand hasAnswer.
	self assert: aCommand hasValue.
	self assert: aCommand answer value isNil.
	^ aCommand
]

{ #category : #'examples - exception handlers' }
GtExecutorDecoratorExamples >> executingErroneousCommandWithBasicSkippingHandler [
	<gtExample>
	| aHandler aCommand aNextContext |
	aHandler := self basicSkippingHandler.
	aCommand := self erroneousValuableCommand.
	aNextContext := aHandler execute: aCommand.
	self assert: aNextContext class equals: GtExecutorExecutionExceptionContext.
	self assert: aNextContext exception class equals: ZeroDivide.
	^ aNextContext
]

{ #category : #'examples - exception handlers' }
GtExecutorDecoratorExamples >> executingValuableCommandWithBasicSkippingHandler [
	<gtExample>
	| aHandler aCommand aNextContext |
	aHandler := self basicSkippingHandler.
	aCommand := self valuableCommand.
	aNextContext := aHandler execute: aCommand.
	self assert: aNextContext class equals: GtExecutorExecutionContinueContext.
	^ aNextContext
]

{ #category : #'examples - exception handlers' }
GtExecutorDecoratorExamples >> executingValuableCommandWithBasicSkippingHandler_ErrorContext [
	<gtExample>
	| aHandler aCommand aNextContext aContext |
	aHandler := self basicSkippingHandler.
	aCommand := self valuableCommand.
	aContext := self executionErrorContext.
	aNextContext := aHandler execute: aCommand previousContext: aContext.
	self assert: aNextContext class equals: GtExecutorExecutionSkipContext.
	^ aNextContext
]

{ #category : #'examples - exception handlers' }
GtExecutorDecoratorExamples >> executionErrorContext [ 
	<gtExample>
	| aContext |
	aContext := GtExecutorExecutionContext exception: ZeroDivide new.
	self assert: aContext exception class equals: ZeroDivide.
	^ aContext
]

{ #category : #'examples - execution' }
GtExecutorDecoratorExamples >> executionOfErroneousPostExecutionCommand [
	<gtExample>
	| aBuilder aCommand |
	aBuilder := self decoratorWithErroneousPostExecutionCommand.
	aCommand := self valuableCommand.
	aBuilder execute: aCommand.
	self assert: aCommand hasAnswer.
	self assert: aCommand answer value equals: 42.
	^ aCommand
]

{ #category : #'examples - execution' }
GtExecutorDecoratorExamples >> executionOfSecondErroneousPostExecutionCommand [
	<gtExample>
	| aBuilder aCommand |
	aBuilder := self decoratorWithSecondErroneousPostExecutionCommand.
	aCommand := self valuableCommand.
	aBuilder execute: aCommand.
	self assert: aCommand hasAnswer.
	self assert: aCommand answer value equals: 42.
	^ aCommand
]

{ #category : #'examples - exception handlers' }
GtExecutorDecoratorExamples >> executionStartContext [ 
	<gtExample>
	| aContext |
	aContext := GtExecutorExecutionContext start.
	self assert: aContext isNotNil.
	^ aContext
]

{ #category : #'examples - execution' }
GtExecutorDecoratorExamples >> executionWithOneDecoringCommand [
	<gtExample>
	| aBuilder aCommand |
	aBuilder := self decoratorWithOnePostExecutionCommand.
	aCommand := self valuableCommand.
	aBuilder execute: aCommand.
	self assert: aCommand hasAnswer.
	self assert: aCommand answer value equals: 108.
	^ aCommand
]

{ #category : #'examples - execution' }
GtExecutorDecoratorExamples >> executionWithTwoDecoratingCommands [
	<gtExample>
	| aBuilder aCommand |
	aBuilder := self decoratorWithTwoPostExecutionCommands.
	aCommand := self valuableCommand.
	aBuilder execute: aCommand.
	self assert: aCommand hasAnswer.
	self assert: aCommand hasValue.
	self assert: aCommand answer value equals: 72.
	^ aCommand
]

{ #category : #'examples - execution' }
GtExecutorDecoratorExamples >> executionWithoutDecoratingCommands [
	<gtExample>
	| aBuilder aCommand |
	aBuilder := self basicDecorator.
	aCommand := self valuableCommand.
	aBuilder execute: aCommand.
	self assert: aCommand hasAnswer.
	self assert: aCommand hasValue.
	self assert: aCommand answer value equals: 42.
	^ aCommand
]

{ #category : #'examples - answers' }
GtExecutorDecoratorExamples >> nullAnswer [
	<gtExample>
	| anAnswer |
	anAnswer := GtExecutorAnswer null.
	self assert: anAnswer isAnswer not.
	self assert: anAnswer hasValue not.
	^ anAnswer
]

{ #category : #'examples - decorated commands' }
GtExecutorDecoratorExamples >> oneDecoratingCommand [
	<gtExample>
	| aDecorator aCommand aDecoratingCommand aTempCommand |
	aDecorator := self decoratorWithOnePostExecutionCommand.
	aCommand := self valuableCommand.
	aDecoratingCommand := aDecorator decorate: aCommand.

	"Even after the decoration, the decorator commands are intact"
	self assert: aDecorator commands first command equals: GtExecutorCommand null.

	"Decorating commands are different instances from those kept by the decorator"
	self assert: (aDecoratingCommand == aDecorator commands first) not.

	"Check the command chain order"
	aTempCommand := self valuableCommand.
	aDecoratingCommand valuable value: aTempCommand.
	self assert: aTempCommand hasAnswer.
	self assert: aTempCommand answer value equals: 108.

	"The second command in chain is the decorated command"
	self assert: aDecoratingCommand command equals: aCommand.
	^ aDecoratingCommand
]

{ #category : #'examples - commands' }
GtExecutorDecoratorExamples >> postExecutionCommand [
	<gtExample>
	| aCommand aValuable |
	aCommand := self basicPostExecutionCommand.
	aValuable := [ :aSubCommand | aSubCommand result: 108 ].
	aCommand valuable: aValuable.
	self assert: aCommand valuable equals: aValuable.
	^ aCommand
]

{ #category : #'examples - commands' }
GtExecutorDecoratorExamples >> preExecutionCommand [
	<gtExample>
	| aCommand aValuable |
	aCommand := self basicPreExecutionCommand.
	aValuable := [ :aSubCommand | aSubCommand valuable: [ 108 ] ].
	aCommand valuable: aValuable.
	self assert: aCommand valuable equals: aValuable.
	^ aCommand
]

{ #category : #'examples - decorated commands' }
GtExecutorDecoratorExamples >> twoDecoratingCommands [
	<gtExample>
	| aDecorator aCommand aDecoratingCommand aTempCommand |
	aDecorator := self decoratorWithTwoPostExecutionCommands.
	aCommand := self valuableCommand.
	aDecoratingCommand := aDecorator decorate: aCommand.
	
	"Even after the decoration, the decorator commands are intact"
	self assert: aDecorator commands first command equals: GtExecutorCommand null.
	self assert: aDecorator commands second command equals: GtExecutorCommand null.

	"Decorating commands are different instances from those kept by the decorator"
	self assert: (aDecoratingCommand == aDecorator commands first) not.
	self assert: (aDecoratingCommand == aDecorator commands second) not.
	self assert: (aDecoratingCommand command == aDecorator commands first) not.
	self assert: (aDecoratingCommand command == aDecorator commands second) not.

	"Check the command chain order"
	aTempCommand := self valuableCommand.
	aDecoratingCommand valuable value: aTempCommand.
	self assert: aTempCommand hasAnswer.
	self assert: aTempCommand answer value equals: 72.
	aDecoratingCommand command valuable value: aTempCommand.
	self assert: aTempCommand hasAnswer.
	self assert: aTempCommand answer value equals: 108.

	"The third command in chain is the decorated command"
	self assert: aDecoratingCommand command command equals: aCommand.
	^ aDecoratingCommand
]

{ #category : #'examples - commands' }
GtExecutorDecoratorExamples >> valuableCommand [
	<gtExample>
	| aCommand aValuable |
	aCommand := self basicValuableCommand.
	aValuable := [ 42 ].
	aCommand valuable: aValuable.
	self assert: aCommand valuable equals: aValuable.
	self assert: aCommand hasAnswer not.
	^ aCommand
]
