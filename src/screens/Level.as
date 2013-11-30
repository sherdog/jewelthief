package screens
{
	import com.greensock.*;
	import com.greensock.easing.*;
	
	import objects.Item;
	import levels.*;
	
	import starling.animation.Tween;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	import starling.textures.Texture;
	
	public class Level extends Sprite
	{
		private var item:Item;
		
		private var playBg:MovieClip;
		private var bgImage:Image;
		
		
		private var activeCounter:MovieClip; // the counter that is being moved, dropped etc
		private var counterTween:Tween;
		private var columnLocationX:Array = new Array();
		private var rowLocationY:Array = new Array();
		private var allCounters:Array = new Array();
		private var counterNumber:Number = 0;
		
		private var currentCol:Number;	
		private var firstColLeft:Number = 70;
		private var numberOfCols:Number = 8;
		private var numberOfRows:Number = 6;
		private var colWidth:Number = 64;	
		private var firstRowTop:Number = 125;
		private var activeRowTop:Number = 55;	
		private var grid:Array = new Array();
		
		private var nextX:Number = 0;
		private var nextY:Number = 0;
		private var padding:Number = 10;
		private var colHeight:Number = 64;
		
		private var gridLayout:Array = [
				[1,1,1,1,1,1,1,1],
				[1,1,1,1,1,1,1,1],
				[1,1,1,1,1,1,1,1],
				[1,1,1,1,1,1,1,1],
				[1,1,1,1,1,1,1,1],
				[1,1,1,1,1,1,1,1],
				[1,1,1,1,1,1,1,1],
				[1,1,1,1,1,1,1,1]
			];
		
		[Embed(source="../assets/swfs/shared.swf")]
		public static var SharedAssets:Class;
		private var scoreText:TextField;
		private var scoreDisplay:MovieClip;
		
		[Embed(source="../assets/fonts/badabb.TTF", fontFamily="ComicText", embedAsCFF="false")]
		public static var ComicText:Class;
		
		public function Level()
		{
			trace('Level() called');
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
			
		}
		
		// *****************************************************************************
		private function onAddedToStage(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			initialize();
		}
		
		public function initialize():void
		{
			//trace('initialize calfdfdled');
			this.visible = true;
			drawGrid();
			newCounter();
		}
		
		private function drawGrid():void
		{
			// set up where the columns are on screen
			trace('drawgrid called');
			var nextLeft:Number = firstColLeft;
			for (var i:Number = 0; i < numberOfCols; i++)
			{
				columnLocationX[i] = nextLeft;
				nextLeft += colWidth;
			}
			
			// set up where the rows are on screen
			var nextTop:Number = firstRowTop;
			for ( i=0;i<numberOfRows;i++)
			{
				rowLocationY[i] = nextTop;
				nextTop += colWidth;
			}
			
			
			// create grid array
			grid = new Array();
			var gridArray:Array = new Array();
			var currentItem:Item;
			
			// set grid to null
			
			var rowCount:Number = gridLayout.length;
			var colCount:Number;
			
			
			for (var row:Number = 0; row < rowCount-1; row++)
			{
				trace('making rows');
				gridArray[row] = new Array();
				for(var col:Number = 0; col < gridArray[row].length; col++)
				{
					grid[row][col] = new Item();
					grid[row][col].x = nextX;
					grid[row][col].y = nextY;
					addChild(grid[row][col]);
					
					
					nextY += Math.ceil((colHeight + padding));
					
				}
				nextX += Math.ceil(colWidth + padding);
				nextY = 0;
				
			}
			
			
			/*
			
			for(var col:Number = 0; col < numberOfCols; col++)
			{
			grid[col] = new Array();
			for (var row:Number=0; row < numberOfRows; row++)
			{
			grid[col][row] = new Item();
			grid[col][row].x = nextX;
			grid[col][row].y = nextY;
			addChild(grid[col][row]);
			
			nextY += Math.ceil((colHeight + padding));
			
			}
			nextX += Math.ceil(colWidth + padding);
			nextY = 0; //resets to top
			}
			*/
		}
		
		// *****************************************************************************
		public function start():void
		{
			// create a new counter
			newCounter();
		}
		
		
		// *****************************************************************************
		private function newCounter():void
		{
			
			
			trace('added text to stage');
			
			/*
			currentCol = 0;
			counterNumber++;
			
			activeCounter = attachMovie("counter",counterNumber, getNextHighestDepth(), {_x:columnLocationX[currentCol], _y:activeRowTop});
			allCounters.push(activeCounter);
			activeCounter.setCanMove();
			*/
			
		}
		// *****************************************************************************
		/*
		private function moveCounter(dir):void
		{
		if (activeCounter.canMove)
		{
		currentCol = currentCol + dir;
		if (currentCol == -1) {currentCol = 0;}
		if (currentCol == numberOfCols) {currentCol= numberOfCols-1;}
		activeCounter._x = columnLocationX[currentCol];
		}
		
		
		}
		*/
		
		// *****************************************************************************
		/*
		private function dropCounter():void
		{	
		
		// stop it moving
		activeCounter.setCannotMove();
		
		// find out where to stop
		var testRow = numberOfRows-1;
		while (grid[currentCol][testRow] != null && testRow > -1)
		{
		testRow--;
		}
		
		// drop it
		if (testRow == -1)
		{
		trace("Col Full!!!!");
		activeCounter.setCanMove();
		}
		else
		{
		var stopAt = rowLocationY[testRow];
		activeCounter.col = currentCol;
		activeCounter.row = testRow;
		
		grid[currentCol][testRow] = activeCounter; // set the grid cell to full
		
		// actually drop the counter using a tween
		var speed = (testRow+1)/8;
		counterTween = TweenLite.to(activeCounter, speed, {_y:stopAt, ease:Bounce.easeOut, onComplete:droppedCounter,onCompleteScope:this});
		
		}
		
		}
		*/
		
		// *****************************************************************************
		// return an array of all matches found
		// *****************************************************************************
		public function lookForMatches():Array
		{
			var matchList:Array = new Array();
			
			// search for horizontal matches
			for (var row:Number = 0; row < numberOfRows; row++)
			{
				for(var col:Number = 0; col < numberOfCols-2; col++)
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
			for(col = 0; col < numberOfCols; col++)
			{
				for (row=0;row<numberOfRows-2;row++)
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
		
		// *****************************************************************************
		// look for horizontal matches starting at this point
		// puts matching pieces into the array 'match' which is returned
		// ***************************************************************************** 
		public function getMatchHoriz(col:Number,row:Number):Array
		{
			var match:Array = new Array(grid[col][row]);
			for(var i:Number = 1; col+i < numberOfCols; i++)
			{
				if (grid[col][row] != null)
				{
					if (grid[col][row].type == grid[col+i][row].type)
					{
						match.push(grid[col+i][row]);
					} 
					else
					{
						return match;
					}
				}
			}
			return match;
		}
		
		// *****************************************************************************
		// look for vertical matches starting at this point
		// *****************************************************************************
		public function getMatchVert(col:Number,row:Number):Array
		{
			
			var match:Array = new Array(grid[col][row]);
			for(var i:Number=1;row+i<numberOfRows;i++)
			{
				if (grid[col][row] != null)
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
			}
			return match;
		}
		
		// *****************************************************************************
		// tell all pieces above this one to move down
		// *****************************************************************************
		public function affectAbove(C:Number,R:Number):void
		{
			var removedRow:Number = R;
			var removedCol:Number = C;
			var dropDelay:Number= 0;
			
			for(var moveRow:Number=removedRow;moveRow>=0;moveRow--)
			{				
				grid[removedCol][moveRow] = grid[removedCol][moveRow-1];
				grid[removedCol][moveRow].row = moveRow;
				TweenLite.to(grid[removedCol][moveRow], 0.2, {_y:rowLocationY[moveRow], ease:Bounce.easeOut, delay:dropDelay});
				grid[removedCol][moveRow-1] = null;
				dropDelay = dropDelay+0.2;
			}
			
			//updateAfterEvent();
		}
		
		
		/*
		// *****************************************************************************
		private function checkGridForMatches():void
		{
		var workingCol = activeCounter.gridCol;
		var workingRow = activeCounter.gridRow;
		
		
		var currentColour = grid[0][workingRow].colour;
		var foundRow = new Array();
		var col = 0;
		do 
		{
		if (grid[col][workingRow].colour == currentColour && grid[col][workingRow] != null)
		{
		foundRow.push(col);
		}
		else
		{
		currentColour = grid[col][workingRow].colour;
		foundRow = new Array();
		}
		col++;
		}
		while (foundRow.length < 3 && col < numberOfCols)
		
		
		
		newCounter();
		}
		*/
		
		// *****************************************************************************
		private function clearGrid():void
		{
			// create all the cells in the grid
			for (var col:Number=0;col<numberOfCols;col++)
			{
				grid[col] = new Array();
				for (var row:Number=0; row< numberOfRows; row++)
				{
					grid[col][row] = null;
				}
			}
			
			for (var i:Number=0;i<allCounters.length;i++)
			{
				allCounters[i].removeMovieClip();
			}
		}
		
	}
}