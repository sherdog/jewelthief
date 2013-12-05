package levels
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import objects.Item;
	import objects.PointBurst;
	
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class LevelFactory extends Sprite
	{
		/************************************
		 * | Loader class
		 * | Is responsible for loading levels
		 * | There are a few methods that will be similar between all levels
		 *************************************/
		
		private var currentLevel:Number;
		private var _jsonLoader:URLLoader = new URLLoader();
		
		[Embed(source="../assets/xml/levels/levels.xml", mimeType="application/octet-stream")]
		private var levelsXML:Class;
		
		private var levelXML:XML;
		
		//Setup level vars
		private var _levelMode:String = "time";
		private var _levelBlocks:String = "";
		private var _levelRows:Array;
		private var _levelBackground:String = "";
		private var _levelMultiplier:Number = 1;
		private var _levelModeGetItems:String = "";
		private var _levelTime:Number = 0;
		private var _levelScore: Number = 0;
		private var _currentLevel: Number = 0;
		
		private var _item:Item;
		
		private const _cellHeight:Number = 64;
		private const _cellWidth:Number = 64;
		private const _offsetX:Number = 5;
		private const _offsetY:Number = 5;
		
		private var gameSprite:Sprite;
		private var isDropping:Boolean;
		private var isSwapping:Boolean;
		private var gameScore:int;
		private var firstPiece:Item;
		
		private var grid:Array;
		
		
		public function LevelFactory()
		{
			super();
			//setupLevel();
			setupEventListeners();
		}
		
		private function setupEventListeners():void
		{
			// TODO Auto Generated method stub
			this.addEventListener(starling.events.Event.ENTER_FRAME, onEnterFrame);
			
			this.addEventListener("onJSONComplete", onJsonComplete); //fired when json is loaded so we can parse it.
		}
		
		private function onEnterFrame(e:starling.events.Event):void
		{
			// TODO Auto Generated method stub
			this.removeEventListener(starling.events.Event.ENTER_FRAME, onEnterFrame);
		}
		
		public function start():void
		{
			//start the game! yes!
			
		}
		
		public function loadLevel(_level:Number):void
		{
			currentLevel = _level;
			
			//load json for level data.
			_jsonLoader.addEventListener(flash.events.Event.COMPLETE, onJsonComplete);
			_jsonLoader.load(new URLRequest('../assets/xml/levels/levels.json'));
			
		}
		
		private function onJsonComplete(e:flash.events.Event):void
		{
			var stringJSON:String;
			var temp:Object;
			var levelObject:Object = JSON.parse(e.target.data);
			
			var _levelData:Object = levelObject.levels[1]; //TMP REPLACE WITH ACUTAL OBJECT.level property
			
			_levelMode = _levelData.mode;
			_levelBlocks = _levelData.blocks;
			
			switch(_levelMode)
			{
				case 'time':
				default:
					_levelTime = _levelData.time;
					break;
				case 'score':
					_levelScore = _levelData.score;
					break;
				case 'getItems':
					_levelModeGetItems = _levelData.getItems;
					break;
			}
			
			_levelMultiplier = _levelData.multiplier;
			_levelBackground = _levelData.background;
				
			var tmpArr:Array;
			var tmpGrid:Array = new Array();
			
			for (var i:int; i<_levelData.rows.length; i++)
			{
				var tmpVal:Object = _levelData.rows[i];
				var rowStr:String = tmpVal.row;
				tmpArr = rowStr.split(",");
				tmpGrid.push(tmpArr);
			}
			_levelRows = tmpGrid;

			
			/* START MATCH */
			startMatch();
		}
		
		private function startMatch():void
		{
			isDropping = false;
			isSwapping = false;
			
			var currentRow:Number=0;
			var gameScore:int = 0;
			
			grid = new Array();
			
			for( var gridrows:int=0; gridrows<_levelRows.length; gridrows++ )
			{
				grid.push(new Array());
			}
			drawLevel();
			
		}
		
		private function drawLevel():void
		{
			var hasItem:String; //in our array we have a 0 or 1 signaling has gem or not
			//to have it load a specific image 
			//used to create randle levels with obstacles
			//use 2-x for diff effects
			var startNum:Number = 0; //need to delete
			
			while(true)
			{
				for(var row:int=0; row<_levelRows.length; row++)
				{
					for(var col:int=0; col<_levelRows[row].length; col++)
					{
						hasItem = _levelRows[row][col];
						var tmpItem:Item = addItem(col,row,hasItem);
						this.addChild(tmpItem);
						
					}
				}
				if (lookForMatches().length != 0) continue;
				// try again if no possible moves
				if (lookForPossibles() == false) continue;
				// no matches, but possibles exist: good board found
				break;
				startNum++;
			}
			
		}		
		
		private function addItem(col:int, row:int, hasItem:String = "1"):Item
		{
			trace('function addItem called');
			
			var img:Image = new Image(Asset.getAtlas().getTexture("teal_gem"));
			this.addChild(img);
			
			img.x = col * _cellWidth;
			img.y = row * _cellHeight;
			
			trace('imgx = ' + img.x);
			
			_item = new Item();
			this.addChild(_item);
			
			_item.x = (col * _cellWidth) + _offsetX;
			_item.y = (row * _cellHeight) + _offsetY;
			_item.col = col;
			_item.row = row;
			_item.type = Math.ceil(Math.random()*7);
			
			grid[col][row] = _item;
			_item.addEventListener(starling.events.Event.TRIGGERED, onItemTrigger);
			
			return _item;
		}		
		
		private function onItemTrigger(e:starling.events.Event):void
		{
			trace('click ');
			var item:Item = Item(e.currentTarget);
			
			if(firstPiece == null)
			{
				item.visible = true;
			}
		}
		
		// start animated swap of two pieces
		public function makeSwap(piece1:Item,piece2:Item):void {
			swapPieces(piece1,piece2);
			// check to see if move was fruitful
			if (lookForMatches().length == 0) {
				swapPieces(piece1,piece2);
			} else {
				isSwapping = true;
			}
		}
		
		// swap two pieces
		public function swapPieces(piece1:Item,piece2:Item):void {
			// swap row and col values
			var tempCol:uint = piece1.col;
			var tempRow:uint = piece1.row;
			piece1.col = piece2.col;
			piece1.row = piece2.row;
			piece2.col = tempCol;
			piece2.row = tempRow;
			
			// swap grid positions
			grid[piece1.col][piece1.row] = piece1;
			grid[piece2.col][piece2.row] = piece2;
			
		}
		
		// if any pieces are out of place, move them a step closer to being in place
		// happens when pieces are swapped, or they are dropping
		public function movePieces(event:flash.events.Event):void {
			var madeMove:Boolean = false;
			for(var row:int=0;row<8;row++) {
				for(var col:int=0;col<8;col++) {
					if (grid[col][row] != null) {
						
						// needs to move down
						if (grid[col][row].y < grid[col][row].row * _cellWidth + _offsetY) {
							grid[col][row].y += 5;
							madeMove = true;
							
							// needs to move up
						} else if (grid[col][row].y > grid[col][row].row * _cellHeight + _offsetY) {
							grid[col][row].y -= 5;
							madeMove = true;
							
							// needs to move right
						} else if (grid[col][row].x < grid[col][row].col * _cellWidth + _offsetX) {
							grid[col][row].x += 5;
							madeMove = true;
							
							// needs to move left
						} else if (grid[col][row].x > grid[col][row].col * _cellHeight + _offsetX) {
							grid[col][row].x -= 5;
							madeMove = true;
						}
					}
				}
			}
			
			// if all dropping is done
			if (isDropping && !madeMove) {
				isDropping = false;
				findAndRemoveMatches();
				
				// if all swapping is done
			} else if (isSwapping && !madeMove) {
				isSwapping = false;
				findAndRemoveMatches();
			}
		}
		
		
		// gets matches and removes them, applies points
		public function findAndRemoveMatches():void {
			
			// get list of matches
			var matches:Array = lookForMatches();
			for(var i:int=0;i<matches.length;i++) {
				var numPoints:Number = (matches[i].length-1)*50;
				for(var j:int=0;j<matches[i].length;j++) {
					if (gameSprite.contains(matches[i][j])) {
						var pb:PointBurst = new PointBurst(this,numPoints,matches[i][j].x,matches[i][j].y);
						addScore(numPoints);
						gameSprite.removeChild(matches[i][j]);
						grid[matches[i][j].col][matches[i][j].row] = null;
						affectAbove(matches[i][j]);
					}
				}
			}
			
			// add any new piece to top of board
			addNewPieces();
			
			// no matches found, maybe the game is over?
			if (matches.length == 0) 
			{
				if (!lookForPossibles()) 
				{
					endGame();
				}
			}
		}
		
		//return an array of all matches found
		public function lookForMatches():Array {
			var matchList:Array = new Array();
			
			// search for horizontal matches
			for (var row:int=0;row<8;row++)
			{
				for(var col:int=0;col<6;col++)
				{
					var match:Array = getMatchHoriz(col,row);
					if (match.length > 2)
					{
						matchList.push(match);
						col += match.length-1;
					}
				}
			}
			
			// search for vertical matches
			for(col=0;col<8;col++)
			{
				for (row=0;row<6;row++)
				{
					match = getMatchVert(col,row);
					if (match.length > 2)
					{
						matchList.push(match);
						row += match.length-1;
					}
					
				}
			}
			return matchList;
		}
		
		// look for horizontal matches starting at this point
		public function getMatchHoriz(col:int,row:int):Array {
			var match:Array = new Array(grid[col][row]);
			for(var i: int=1; col+i<8; i++ ) 
			{
				trace('grid1 type: ' + grid[col][row].type + ' and row|col ' + col + ' ' + row);
				if ( grid[col][row].type == grid[col+i][row].type ) 
				{
					match.push(grid[col+i][row]);
				} 
				else 
				{
					return match;
				}
			}
			return match;
		}
		
		// look for vertical matches starting at this point
		public function getMatchVert(col:int,row:int):Array 
		{
			var match:Array = new Array(grid[col][row]);
			for(var i:int=1;row+i<8;i++)
			{
				if (grid[col][row].type == grid[col][row+i].type)
				{
					match.push(grid[col][row+i]);
				} 
				else 
				{
					return match;
				}
			}
			return match;
		}
		
		// tell all pieces above this one to move down
		public function affectAbove(piece:Item):void
		{
			for(var row:int=piece.row-1;row>=0;row--)
			{
				if (grid[piece.col][row] != null)
				{
					grid[piece.col][row].row++;
					grid[piece.col][row+1] = grid[piece.col][row];
					grid[piece.col][row] = null;
				}
			}
		}
		
		// if there are missing pieces in a column, add one to drop
		public function addNewPieces():void
		{
			for(var col:int=0;col<8;col++)
			{
				var missingPieces:int = 0;
				for(var row:int=7;row>=0;row--)
				{
					if (grid[col][row] == null)
					{
						var newPiece:Item = addItem(col,row);
						newPiece.y = _offsetY - _cellWidth - _cellWidth * missingPieces++;
						isDropping = true;
					}
				}
			}
		}
		
		// look to see if a possible move is on the board
		public function lookForPossibles():Boolean {
			trace('lookForPossibles was called');
			for(var col:int=0;col<8;col++) {
				for(var  row:int=0;row<8;row++) {
					
					// horizontal possible, two plus one
					if (matchPattern(col, row, [[1,0]], [[-2,0],[-1,-1],[-1,1],[2,-1],[2,1],[3,0]])) {
						return true;
					}
					
					// horizontal possible, middle
					if (matchPattern(col, row, [[2,0]], [[1,-1],[1,1]])) {
						return true;
					}
					
					// vertical possible, two plus one
					if (matchPattern(col, row, [[0,1]], [[0,-2],[-1,-1],[1,-1],[-1,2],[1,2],[0,3]])) {
						return true;
					}
					
					// vertical possible, middle
					if (matchPattern(col, row, [[0,2]], [[-1,1],[1,1]])) {
						return true;
					}
				}
			}
			
			// no possible moves found
			return false;
		}
		
		public function matchPattern(col:int,row:uint, mustHave:Array, needOne:Array):Boolean {
			var thisType:int = grid[col][row].type;
			
			// make sure this has all must-haves
			for(var i:int=0;i<mustHave.length;i++) {
				if (!matchType(col+mustHave[i][0], row+mustHave[i][1], thisType)) {
					return false;
				}
			}
			
			// make sure it has at least one need-ones
			for(i=0;i<needOne.length;i++) {
				if (matchType(col+needOne[i][0], row+needOne[i][1], thisType)) {
					return true;
				}
			}
			return false;
		}
		
		public function matchType(col:int,row:int,type:int):Boolean {
			// make sure col and row aren't beyond the limit
			if ((col < 0) || (col > 7) || (row < 0) || (row > 7)) return false;
			return (grid[col][row].type == type);
		}
		
		public function addScore(numPoints:int):void {
			gameScore += numPoints;
			//MovieClip(root).scoreDisplay.text = String(gameScore);
		}
		
		public function endGame():void {
			// move to back
			setChildIndex(gameSprite,0);
			// go to end game
			//gotoAndStop("gameover");
		}
		
		public function cleanUp():void {
			grid = null;
			removeChild(gameSprite);
			gameSprite = null;
			removeEventListener(starling.events.Event.ENTER_FRAME,movePieces);
		}
		
		
	}
}