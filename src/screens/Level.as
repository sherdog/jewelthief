package screens
{
	import objects.Item;
	
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	
	public class Level extends Sprite
	{
		private var item:Item;
		
		private var playBg:MovieClip;
		private var bgImage:Image;
		
		public function Level()
		{
			trace('Level() called');
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
			
		}
		
		// *****************************************************************************
		private function onAddedToStage(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
		}
		
		public function initialize():void
		{
			trace('initialize called');
			this.visible = true;
			drawLevel();
		}
		
		private function drawLevel():void
		{
			var nextLeft:Number = 0;
			var firstColLeft:Number = 0;
			var numberOfCols:Number  = 8;
			var columnLocationX:Array = new Array();
			var nextTop:Number = 0;
			var firstRowTop:Number = 0;
			var numberOfRows:Number = 6;
			var rowLocationY:Array = new Array();
			
			var colWidth:Number = 64;
			var colHeight:Number = 64;
			
			
			// create grid array
			var grid:Array = new Array();
			var nextX:Number = 0;
			var nextY:Number = 0;
			var padding:Number = 10;
			
			// set grid to null
			for(var col:Number=0;col<numberOfCols;col++)
			{
				
				trace('col is: ' + col);
				grid[col] = new Array();
				
				for (var row:Number=0;row<numberOfRows;row++)
				{
					trace('row' + row);
					item = new Item();
					item.name = 'gem_'+row+'_'+col;
					item.x = nextX;
					item.y = nextY;
					this.addChild(item);
					
					nextY += Math.ceil((colHeight + padding));
				}
				nextX += Math.ceil(colWidth + padding);
				nextY = 0; //resets to top
			}
			
		}
		
		
	}
}