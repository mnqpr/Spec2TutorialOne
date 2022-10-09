Class {
	#name : #TODOTaskPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'task',
		'titlePresenter'
	],
	#category : #'Spec2-TutorialToDo'
}

{ #category : #visiting }
TODOTaskPresenter >> accept [

	self task
		title: titlePresenter text
]

{ #category : #initialization }
TODOTaskPresenter >> initializeDialogWindow: aDialogWindowPresenter [

	aDialogWindowPresenter
		title: 'New task';
		initialExtent: 35 @ 120;
		addButton: 'Save' do: [ :dialog | 
			self accept.
			dialog close ];
		addButton: 'Cancel' do: [ :dialog | dialog close ]
]

{ #category : #initialization }
TODOTaskPresenter >> initializePresenters [

	titlePresenter := self newTextInput.
	self layout: (SpBoxLayout newTopToBottom
			 add: titlePresenter expand: false;
			 yourself)
]

{ #category : #accessing }
TODOTaskPresenter >> task [

	^ task
]

{ #category : #accessing }
TODOTaskPresenter >> task: aTask [

	task := aTask.
	self updatePresenter
]

{ #category : #initialization }
TODOTaskPresenter >> updatePresenter [

	titlePresenter text: ((task ifNil: [ TODOTask new ]) title ifNil: [ '' ] )
]
