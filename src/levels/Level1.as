package levels
{
	import starling.display.MovieClip;
	import starling.display.Sprite;
	
	public class Level1 extends LevelFactory
	{
		private var tileGrid:Array = [
			[1,1,1,1,1,1,1,1],
			[1,1,1,1,1,1,1,1],
			[1,1,1,1,1,1,1,1],
			[1,1,1,1,1,1,1,1],
			[1,1,1,1,1,1,1,1],
			[1,1,1,1,1,1,1,1],
			[1,1,1,1,1,1,1,1],
			[1,1,1,1,1,1,1,1]
			];
		public function Level1():void
		{
			super();
			trace('Hey we just loaded level 1');
		}
		
		public function getTile(x:Number, y:Number):void
		{
			
		}
	}
}