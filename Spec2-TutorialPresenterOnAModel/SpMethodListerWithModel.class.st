Class {
	#name : #SpMethodListerWithModel,
	#superclass : #SpPresenterWithModel,
	#instVars : [
		'list'
	],
	#category : #'Spec2-TutorialPresenterOnAModel'
}

{ #category : #layout }
SpMethodListerWithModel >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  add: list;
		  yourself
]

{ #category : #initialization }
SpMethodListerWithModel >> initializePresenters [

	list := self newList
]

{ #category : #initialization }
SpMethodListerWithModel >> modelChanged [

	list items: self model selectors sorted.
	self withWindowDo: [ :window | 
		window
			aboutText: self model comment;
			title: self model name ]
]
