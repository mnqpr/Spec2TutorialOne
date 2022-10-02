Class {
	#name : #ClassVisualizerPresenter,
	#superclass : #SpPresenterWithModel,
	#instVars : [
		'hierarchyTreePresenter',
		'textPresenter',
		'morphPresenter',
		'colorButton'
	],
	#category : #'Spec2-TutorialClassVisualizer'
}

{ #category : #initialization }
ClassVisualizerPresenter >> connectPresenters [

	hierarchyTreePresenter
		transmitTo: morphPresenter
		transform: [ :aClass | aClass name asString ].
	hierarchyTreePresenter
		transmitTo: textPresenter
		transform: [ :aClass | aClass definitionString ]
		
]

{ #category : #layout }
ClassVisualizerPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  spacing: 3;
		  add: hierarchyTreePresenter;
		  add: (SpBoxLayout newLeftToRight
				   spacing: 3;
				   add: textPresenter;
				   add: (SpBoxLayout newTopToBottom
						    spacing: 3;
						    add: morphPresenter;
						    add: colorButton expand: false;
						    yourself);
				   yourself);
		  yourself
]

{ #category : #initialization }
ClassVisualizerPresenter >> initializePresenters [

	hierarchyTreePresenter := self newTree
		roots: { self model };
		children: [ :aClass | aClass subclasses ];
		displayIcon: [ :aClass | aClass systemIcon ];
		display: [ :aClass | aClass name ];
		selectItem: self model;
		yourself.
	textPresenter := self newText
		beNotEditable;
		yourself.
	morphPresenter := self newLabel.
	colorButton := self newButton
		label: 'Random color';
		icon: (self iconNamed: #glamorousGo);
		action: [ morphPresenter color: Color random ];
		yourself.

]

{ #category : #initialization }
ClassVisualizerPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter 
		title: 'Class Visualizer'
]

{ #category : #accessing }
ClassVisualizerPresenter >> morphPresenter [

	^ morphPresenter
]

{ #category : #accessing }
ClassVisualizerPresenter >> textPresenter [

	^ textPresenter
]
