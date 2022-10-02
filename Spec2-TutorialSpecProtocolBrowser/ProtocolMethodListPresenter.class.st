Class {
	#name : #ProtocolMethodListPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'label',
		'methods'
	],
	#category : #'Spec2-TutorialSpecProtocolBrowser'
}

{ #category : #layout }
ProtocolMethodListPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  add: #label withConstraints: [ :c | c expand: false ];
		  add: #methods;
		  yourself
]

{ #category : #initialization }
ProtocolMethodListPresenter >> initializePresenters [

	methods := self newList.
	methods display: [ :m | m selector ].
	label := self newLabel.
	label label: 'Protocol'
]

{ #category : #initialization }
ProtocolMethodListPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter title: 'Protocol Widget'
]

{ #category : #api }
ProtocolMethodListPresenter >> items: aCollection [

	methods items: aCollection
]

{ #category : #api }
ProtocolMethodListPresenter >> label: aText [

	label label: aText
]

{ #category : #'testing - support' }
ProtocolMethodListPresenter >> methods [

	^ methods
]

{ #category : #api }
ProtocolMethodListPresenter >> resetSelection [

	methods resetListSelection
]

{ #category : #api }
ProtocolMethodListPresenter >> whenSelectedItemChanged: aBlock [

	methods whenSelectionChangedDo: aBlock
]
