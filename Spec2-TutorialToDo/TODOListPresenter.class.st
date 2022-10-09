Class {
	#name : #TODOListPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'todoListPresenter'
	],
	#category : #'Spec2-TutorialToDo'
}

{ #category : #adding }
TODOListPresenter >> addTask [

	(TODOTaskPresenter newApplication: self)
		task: TODOTask new;
		openModal.
	self updatePresenter
]

{ #category : #initialization }
TODOListPresenter >> initializePresenters [

	| addButton |
	todoListPresenter := self newTable
		                     addColumn:
			                     ((SpCheckBoxTableColumn evaluated: [ :task | 
					                       task isDone ])
				                      width: 20;
				                      onActivation: [ :task | task done: true ];
				                      onDeactivation: [ :task | task done: false ];
				                      yourself);
		                     addColumn:
		                     (SpStringTableColumn
			                      title: 'Title'
			                      evaluated: [ :task | task title ]);
		                     yourself.

	addButton := self newButton
		             label: 'Add task';
		             action: [ self addTask ];
		             yourself.

	self layout: (SpBoxLayout newTopToBottom
			 add: todoListPresenter;
			 add: (SpBoxLayout newLeftToRight
					  addLast: addButton expand: false;
					  yourself)
			 expand: false;
			 spacing: 5;
			 yourself)
]

{ #category : #initialization }
TODOListPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: 'TODO List';
		initialExtent: 500 @ 500
]

{ #category : #initialization }
TODOListPresenter >> updatePresenter [

	todoListPresenter items: TODOTask allInstances asOrderedCollection
]
