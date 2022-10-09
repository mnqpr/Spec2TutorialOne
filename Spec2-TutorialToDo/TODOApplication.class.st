Class {
	#name : #TODOApplication,
	#superclass : #SpApplication,
	#category : #'Spec2-TutorialToDo'
}

{ #category : #accessing }
TODOApplication >> start [

	(self new: TODOListPresenter) open
]
