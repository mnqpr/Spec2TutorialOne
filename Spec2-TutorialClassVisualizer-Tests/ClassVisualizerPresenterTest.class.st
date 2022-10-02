Class {
	#name : #ClassVisualizerPresenterTest,
	#superclass : #TestCase,
	#instVars : [
		'spApplication'
	],
	#category : #'Spec2-TutorialClassVisualizer-Tests'
}

{ #category : #tests }
ClassVisualizerPresenterTest >> testInitialization [

	| model |
	model := String.
	spApplication := ClassVisualizerPresenter on: model.
	self assert: spApplication model equals: model.
	self
		assert: spApplication textPresenter text
		equals: model classDefinitions first definitionString.
	self
		assert: spApplication morphPresenter morph contents
		equals: model name
]
