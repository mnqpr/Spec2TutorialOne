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

	(TODOTaskPresenter newApplication: self application)
		task: TODOTask new;
		open.
	self updatePresenter
]

{ #category : #'menu commands' }
TODOListPresenter >> editSelectedTask [

	(TODOTaskPresenter newApplication: self application)
		task: todoListPresenter selection selectedItem;
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
		                     contextMenu: self todoListContextMenu;
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

{ #category : #'menu commands' }
TODOListPresenter >> removeSelectedTask [

	todoListPresenter selection selectedItem remove.
	self updatePresenter
]

{ #category : #'menu commands' }
TODOListPresenter >> todoListContextMenu [

	^ self newMenu
		  addItem: [ :item | 
			  item
				  name: 'Edit...';
				  action: [ self editSelectedTask ] ];
		  addItem: [ :item | 
			  item
				  name: 'Remove';
				  action: [ self removeSelectedTask ] ]
]

{ #category : #initialization }
TODOListPresenter >> updatePresenter [

	todoListPresenter items: TODOTask allInstances asOrderedCollection
]
