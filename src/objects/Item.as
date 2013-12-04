package objects
{
	import starling.core.Starling;
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Item extends Sprite
	{
		private var itemArt:MovieClip;
		private var items:Array = new Array('teal_gem', 'blue_gem', 'green_gem', 'purple-pink_gem','purple_gem', 'red_heart', 'white_diamond', 'yellow_gem');
		private var itemName:String;
		
		public var row:int;
		public var col:int;
		public var type:int;
		
		public function Item()
		{
			super();
			init();
		}
		
		private function init():void
		{
			trace('MADE IT ITEM ADDED_TO_STAGE CALLBACK');
			createItem();
			
		}
		
		private function onAddedToStage(event:Event):void
		{
		
		}
		
		
		private function createItem():Button
		{
			var _itembg:Button;
			var randomEle:String = getRandomElementOf(items);
			var randomArt:String = randomEle;
			
			_itembg = new Button(Asset.getAtlas().getTexture( randomArt ));
			return _itembg;
		}
		
		private function getRandomElementOf(array:Array):String {
			var idx:int=Math.floor(Math.random() * array.length);
			return array[idx];
		}
	}
}