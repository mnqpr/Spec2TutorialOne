Class {
	#name : #TODOTask,
	#superclass : #Object,
	#instVars : [
		'done',
		'title'
	],
	#category : #'Spec2-TutorialToDo'
}

{ #category : #accessing }
TODOTask >> done: aBoolean [

	done := aBoolean
]

{ #category : #initialization }
TODOTask >> initialize [

	super initialize.
	self done: false
]

{ #category : #api }
TODOTask >> isDone [
	^ done
]

{ #category : #removing }
TODOTask >> remove [
]

{ #category : #accessing }
TODOTask >> title [

	^ title
]

{ #category : #accessing }
TODOTask >> title: aString [

	title := aString
]
