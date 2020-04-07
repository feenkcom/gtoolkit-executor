Trait {
	#name : #TGtExecutorExceptionAccess,
	#instVars : [
		'exception'
	],
	#category : #'GToolkit-Executor-Core-Traits'
}

{ #category : #accessing }
TGtExecutorExceptionAccess >> exception [
	^ exception
]

{ #category : #accessing }
TGtExecutorExceptionAccess >> exception: anObject [
	exception := anObject
]
