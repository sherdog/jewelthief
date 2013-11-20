package screens
{
	import starling.display.MovieClip;
	import starling.display.Sprite;
	
	public class Level extends Sprite
	{
	
		private var playBg:MovieClip;
		
		public function Level()
		{
			super();
		}
		
		// *****************************************************************************
		private function createLayout():Void
		{
			
			// display a background
			playBg = attachMovie("playBg","playBg",1);
			
			// set up where the columns are on screen
			var nextLeft = firstColLeft;
			for (var i=0;i<numberOfCols;i++)
			{
				columnLocationX[i] = nextLeft;
				nextLeft += colWidth;
			}
			
			// set up where the rows are on screen
			var nextTop = firstRowTop;
			for (var i=0;i<numberOfRows;i++)
			{
				rowLocationY[i] = nextTop;
				nextTop += colWidth;
			}
			
			
			// create grid array
			grid = new Array();
			
			// set grid to null
			for(var col=0;col<numberOfCols;col++)
			{
				grid[col]=new Array();
				for (var row=0;row<numberOfRows;row++)
				{
					item = grid[col][row] = null;
					item.bgcolor = 0xFF00;
				}
			}
	}
}