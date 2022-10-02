Class {
	#name : #MyMiniBrowserPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'treeClasses',
		'button',
		'codeShower',
		'methodFilteringList'
	],
	#category : #'Spec2-TutorialMiniBrowser'
}

{ #category : #'private - actions' }
MyMiniBrowserPresenter >> buttonAction [

	| newShower |
	button label = 'Edit'
		ifTrue: [ 
			button label: 'Read only'.
			newShower := self newCode ]
		ifFalse: [ 
			button label: 'Edit'.
			newShower := self newText beNotEditable ].

	newShower text: methodFilteringList selectedItem ast formattedCode.

	self layout replace: codeShower with: newShower.
	codeShower := newShower
]

{ #category : #initialization }
MyMiniBrowserPresenter >> connectPresenters [

	treeClasses whenActivatedDo: [ :selection | 
		methodFilteringList items: selection selectedItem methods ].

	methodFilteringList listPresenter whenSelectedDo: [ :selectedMethod | 
		codeShower text: selectedMethod ast formattedCode ].

	button action: [ self buttonAction ]
]

{ #category : #initialization }
MyMiniBrowserPresenter >> initializeLayout [

	| classesAndMethods |
	classesAndMethods := self newBoxLayoutLeftToRight.
	classesAndMethods
		spacing: 10;
		add: treeClasses;
		add: methodFilteringList.

	self layout: (SpBoxLayout newTopToBottom
			 spacing: 5;
			 add: classesAndMethods;
			 add: codeShower;
			 add: button expand: false;
			 yourself)
]

{ #category : #initialization }
MyMiniBrowserPresenter >> initializePresenters [

	treeClasses := self newTree.
	treeClasses
		activateOnSingleClick;
		roots: Object asOrderedCollection;
		children: [ :each | each subclasses ];
		displayIcon: [ :each | each systemIcon ].

	methodFilteringList := self newFilteringList.
	methodFilteringList display: [ :method | method selector ].
	methodFilteringList listPresenter sortingBlock:
		[ :method | method selector ] ascending.

	button := self newButton.
	button
		label: 'Edit';
		icon: (self iconNamed: #smallConfiguration).

	codeShower := self newText.
	codeShower beNotEditable.
	
	self initializeLayout
]

{ #category : #initialization }
MyMiniBrowserPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: 'My Mini Browser';
		initialExtent: 750 @ 650
]
