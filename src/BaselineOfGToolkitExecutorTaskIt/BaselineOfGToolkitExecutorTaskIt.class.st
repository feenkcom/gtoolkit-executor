Class {
	#name : #BaselineOfGToolkitExecutorTaskIt,
	#superclass : #BaselineOf,
	#category : #BaselineOfGToolkitExecutorTaskIt
}

{ #category : #baseline }
BaselineOfGToolkitExecutorTaskIt >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec 
			baseline: 'GToolkitExecutorCore' with: [
				spec repository: 'github://feenkcom/gtoolkit-executor/src' ];
			baseline: 'Bloc' with: [
				spec repository: 'github://feenkcom/Bloc/src' ];
			package: 'GToolkit-Executor-TaskIt' with: [
				spec requires: #( 'GToolkitExecutorCore' 'Bloc' ) ]. 
	].

]
