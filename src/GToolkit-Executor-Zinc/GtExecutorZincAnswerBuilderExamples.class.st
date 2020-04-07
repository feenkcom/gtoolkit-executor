Class {
	#name : #GtExecutorZincAnswerBuilderExamples,
	#superclass : #Object,
	#category : #'GToolkit-Executor-Zinc-Examples'
}

{ #category : #'examples - answers' }
GtExecutorZincAnswerBuilderExamples >> answerFromBuilder: aBuilder [
	<gtExample>
	| anAnswer |
	anAnswer := aBuilder build.
	self assert: anAnswer isNotNil.
	self assert: anAnswer isAnswer.
	^ anAnswer
]

{ #category : #'examples - answers' }
GtExecutorZincAnswerBuilderExamples >> answerWithNotFound [
	<gtExample>
	| anAnswer |
	anAnswer := self answerFromBuilder: self builderWithNotFound.
	self assert: anAnswer isFailure.
	^ anAnswer
]

{ #category : #'examples - builders' }
GtExecutorZincAnswerBuilderExamples >> basicBuilder [
	<gtExample>
	| aBuilder |
	aBuilder := GtExecutorZincAnswerBuilder new.
	self assert: aBuilder response isNil.
	^ aBuilder 
]

{ #category : #'examples - builders' }
GtExecutorZincAnswerBuilderExamples >> basicBuilderWithResponse: aResponse [
	<gtExample>
	| aBuilder |
	aBuilder := self basicBuilder.
	aBuilder response: aResponse.
	self assert: aBuilder response isNotNil.
	^ aBuilder
]

{ #category : #'examples - responses' }
GtExecutorZincAnswerBuilderExamples >> basicResponse [
	<gtExample>
	| aResponse |
	aResponse := self responseClass new.
	self assert: aResponse isNotNil.
	^ aResponse
]

{ #category : #'examples - builders' }
GtExecutorZincAnswerBuilderExamples >> builderWithNotFound [
	<gtExample>
	| aBuilder |
	aBuilder := self basicBuilderWithResponse: self notFoundResponse.
	self assert: aBuilder response isNotNil.
	^ aBuilder
]

{ #category : #'examples - responses' }
GtExecutorZincAnswerBuilderExamples >> notFoundResponse [
	<gtExample>
	^ self responseClass 
		notFound: self responseUrl 
		entity: self responseEntity.
]

{ #category : #'examples - responses' }
GtExecutorZincAnswerBuilderExamples >> responseClass [
	^ ZnResponse
]

{ #category : #'examples - basic' }
GtExecutorZincAnswerBuilderExamples >> responseEntity [
	<gtExample>
	^ ZnEntity json: '{"error":"not found"}' 
]

{ #category : #'examples - basic' }
GtExecutorZincAnswerBuilderExamples >> responseUrl [
	<gtExample>
	^ 'http://example.com/foo'
]
