Class {
	#name : #SpClassMethodBrowserPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'methodListPresenter',
		'textPresenter',
		'classListPresenter'
	],
	#category : #'Spec2-TutorialMethodBrowser'
}

{ #category : #api }
SpClassMethodBrowserPresenter >> classes: aList [

	classListPresenter items = aList ifTrue: [ ^ self ].
	classListPresenter
		items: aList;
		selectIndex: 1
]

{ #category : #initialization }
SpClassMethodBrowserPresenter >> connectPresenters [

	classListPresenter
		transmitTo: methodListPresenter
		transform: [ :class | 
			class
				ifNotNil: [ class methods sort: #selector descending ]
				ifNil: [ #(  ) ] ]
		postTransmission: [ :destination :origin :transmited | 
		destination selectIndex: 1 ].

	methodListPresenter
		transmitTo: textPresenter
		transform: [ :method | 
		method ifNil: [ '' ] ifNotNil: [ :m | m sourceCode ] ]
		postTransmission: [ :destination :origin :transmited | 
			transmited ifNotNil: [ 
				destination behavior: transmited methodClass ] ]
]

{ #category : #layout }
SpClassMethodBrowserPresenter >> defaultLayout [

	^ SpPanedLayout newVertical
		  add: (SpPanedLayout newHorizontal
				   add: classListPresenter;
				   add: methodListPresenter;
				   yourself);
		  add: textPresenter;
		  yourself
]

{ #category : #initialization }
SpClassMethodBrowserPresenter >> initializePresenters [

	classListPresenter := self newList.
	methodListPresenter := self newList.
	textPresenter := self newCode.
	
	textPresenter whenSubmitDo: [ :t | methodListPresenter selectedItem inspect ].
	methodListPresenter display: #selector.
	
	self focusOrder
		add: classListPresenter;
		add: methodListPresenter;
		add: textPresenter
]
