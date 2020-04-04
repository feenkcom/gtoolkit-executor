Class {
	#name : #BaselineOfGToolkitExecutorWithGT,
	#superclass : #BaselineOf,
	#category : #BaselineOfGToolkitExecutorWithGT
}

{ #category : #baseline }
BaselineOfGToolkitExecutorWithGT >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec 
			baseline: 'GToolkit' with: [
				spec repository: 'github://feenkcom/gtoolkit/src' ];
			baseline: 'GToolkitExecutor' with: [
				spec repository: 'github://feenkcom/gtoolkit-executor/src' ]
	].
]
