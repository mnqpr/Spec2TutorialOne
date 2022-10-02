Class {
	#name : #WidgetClassListPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'list'
	],
	#category : #'Spec2-TutorialSpecProtocolBrowser'
}

{ #category : #layout }
WidgetClassListPresenter >> defaultLayout [

	^ SpBoxLayout newHorizontal
		add: #list;
		yourself
]

{ #category : #initialization }
WidgetClassListPresenter >> initializePresenters [

	list := self newList.
	list items:
		(SpAbstractWidgetPresenter allSubclasses sorted: [ :a :b | 
			 a name < b name ])
]

{ #category : #initialization }
WidgetClassListPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter title: 'Widgets'
]

{ #category : #'api-events' }
WidgetClassListPresenter >> whenSelectedItemChanged: aBlock [

	list whenSelectionChangedDo: aBlock
]
