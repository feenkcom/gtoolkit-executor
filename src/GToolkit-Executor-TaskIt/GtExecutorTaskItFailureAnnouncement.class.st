Class {
	#name : #GtExecutorTaskItFailureAnnouncement,
	#superclass : #GtExecutorTaskItAnnouncement,
	#instVars : [
		'exception'
	],
	#category : #'GToolkit-Executor-TaskIt-Announcements'
}

{ #category : #accessing }
GtExecutorTaskItFailureAnnouncement >> exception [
	^ exception
]

{ #category : #accessing }
GtExecutorTaskItFailureAnnouncement >> exception: anException [
	exception := anException
]
