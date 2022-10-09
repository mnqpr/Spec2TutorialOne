Class {
	#name : #TODOListPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'todoListPresenter'
	],
	#category : #'Spec2-TutorialToDo'
}

{ #category : #initialization }
TODOListPresenter >> initializePresenters [

	todoListPresenter := self newTable
		addColumn: ((SpCheckBoxTableColumn evaluated: [ :task |
			task isDone ]) width: 20);
		addColumn: (SpStringTableColumn title: 'Title' evaluated: [ :task | task title]);
		yourself.
		
	self layout: (SpBoxLayout newTopToBottom
		add: todoListPresenter;
		yourself)
]

{ #category : #initialization }
TODOListPresenter >> updatePresenter [

	todoListPresenter items: TODOTask allInstances asOrderedCollection
]
