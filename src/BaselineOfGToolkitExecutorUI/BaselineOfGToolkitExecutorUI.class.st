Class {
	#name : #BaselineOfGToolkitExecutorUI,
	#superclass : #BaselineOf,
	#category : #BaselineOfGToolkitExecutorUI
}

{ #category : #baseline }
BaselineOfGToolkitExecutorUI >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec 
			baseline: 'GToolkitExecutorTaskIt' with: [
				spec repository: 'github://feenkcom/gtoolkit-executor/src' ];
			baseline: 'GToolkitExecutorZinc' with: [
				spec repository: 'github://feenkcom/gtoolkit-executor/src' ];
			baseline: 'Brick' with: [
				spec repository: 'github://feenkcom/Brick/src' ];
			package: 'GToolkit-Executor-UI' with: [
				spec requires: #( 'GToolkitExecutorTaskIt' 'GToolkitExecutorZinc' 'Brick' ) ]. 
	].
]
