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
		
		public function Item()
		{
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			createItem();
		}
		
		
		private function createItem():void
		{
			var _itembg:Button;
			var randomArt:String = getRandomElementOf(items);

			
			_itembg = new Button(Asset.getAtlas().getTexture( randomArt ));
			this.addChild(_itembg);
		}
		
		private function getRandomElementOf(array:Array):String {
			var idx:int=Math.floor(Math.random() * array.length);
			return array[idx];
		}
	}
}