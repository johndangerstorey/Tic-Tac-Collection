Tic-Tac-Collection
==================

A game of tic tac toe using a collection view.

###Step 1:Create a viewController
  - Create a FootballViewController
  - Add it to the rootViewController of the window 
    - Inside of a navigation controller
    
###Step 2:Create a datasource
  - You're going to add a collectionview to the viewController so you'll need a datasource
  - Create a subclass of NSObject called FootballCollectionViewDatasource
    - Add a registerCollectionView: method
    - Make sure it implements the required CollectionViewDatasource methods
      - Number of Items
      - Cell for Item
    
###Step 3:Add the Collection View to your View Controller
  - Add a collection view property to the view controller
  - Initialize and add the collection view to your view's subview
    - You'll need to initialize a FlowLayout a default layout should be fine
  - Add a datasource property to the view controller
  - Initialize the datasource in the init or viewdidload method
  - Set the collection view's datasource to the property datasource

###Step 4:Create a game controller
  - Add a game controller singleton
  - The game controller will need privately:
    - An array of the plays that starts as an array of empty strings and gets updated as the board gets played
    - A string that represents the current play (either "x" or "o")
  - The game controller should publicly have:
    - A method that returns the string ("x" or "o") for a given index
    - A method that plays an index, and then returns if that play is a win or not
    - A method that returns if this next play will be the last (there are other ways to solve this if you'd like to come up with one)
    - A method that resets the game board

###Step 5:Return data 
  - Cell for item should add a label (and remove existing labels)
    - It should set the text of that label to the string from the game controller
  - Add the viewcontroller as the delegate of the collection view
    - When a cell is selected it should play an index and check for a win
    - It should update the collection view and show the play

