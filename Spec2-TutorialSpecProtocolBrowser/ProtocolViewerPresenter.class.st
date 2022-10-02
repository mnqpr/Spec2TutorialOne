Class {
	#name : #ProtocolViewerPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'models',
		'api',
		'events'
	],
	#category : #'Spec2-TutorialSpecProtocolBrowser'
}

{ #category : #examples }
ProtocolViewerPresenter class >> exampleHorizontal [

	| presenter |
	presenter := self new.

	presenter openWithLayout: presenter horizontalLayout
]

{ #category : #layout }
ProtocolViewerPresenter >> apiAndEventsLayout [

	^ SpBoxLayout newTopToBottom
		  add: api;
		  add: events;
		  spacing: 3;
		  yourself
]

{ #category : #initialization }
ProtocolViewerPresenter >> connectPresenters [

	models whenSelectedItemChanged: [ :class | 
		api resetSelection.
		events resetSelection.
		class
			ifNil: [ 
				api items: #(  ).
				events items: #(  ) ]
			ifNotNil: [ 
				api items: (self methodsIn: class for: 'api').
				events items: (self methodsIn: class for: 'api - events') ] ].
	api whenSelectedItemChanged: [ :method | 
		method ifNotNil: [ events resetSelection ] ].
	events whenSelectedItemChanged: [ :method | 
		method ifNotNil: [ api resetSelection ] ]
]

{ #category : #layout }
ProtocolViewerPresenter >> defaultLayout [

	^ self horizontalLayout
]

{ #category : #layout }
ProtocolViewerPresenter >> horizontalLayout [

	^ SpBoxLayout newLeftToRight
		  add: #models;
		  add: self apiAndEventsLayout;
		  spacing: 3;
		  yourself
]

{ #category : #initialization }
ProtocolViewerPresenter >> initializePresenters [

	models := self instantiate: WidgetClassListPresenter.
	api := self instantiate: ProtocolMethodListPresenter.
	events := self instantiate: ProtocolMethodListPresenter.

	api label: 'api'.
	events label: 'api-events'.

	self focusOrder
		add: models;
		add: api;
		add: events
]

{ #category : #initialization }
ProtocolViewerPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter title: 'Protocol viewer'
]

{ #category : #private }
ProtocolViewerPresenter >> methodsIn: class for: protocol [

	^ (class selectedItem methodsInProtocol: protocol) sorted: [ :a :b | a selector < b selector ]
]

{ #category : #layout }
ProtocolViewerPresenter >> verticalLayout [

	^ SpBoxLayout newTopToBottom
		  add: #models;
		  add: self apiAndEventsLayout;
		  yourself
]

{ #category : #api }
ProtocolViewerPresenter >> whenAPIChangedDo: aBlock [

	api whenSelectedItemChanged: aBlock
]

{ #category : #api }
ProtocolViewerPresenter >> whenClassChangedDo: aBlock [

	models whenSelectedItemChanged: aBlock
]

{ #category : #api }
ProtocolViewerPresenter >> whenEventChangedDo: aBlock [

	events whenSelectedItemChanged: aBlock
]
