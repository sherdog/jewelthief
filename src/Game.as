package
{
	import levels.LevelFactory;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;

	public class Game extends Sprite
	{
		private var levelToLoad:LevelFactory;
		
		public function Game()
		{
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(e:Event):void
		{
			// TODO Auto Generated method stub
			//trace('added game to stage');
		
			levelToLoad = new LevelFactory();
			levelToLoad.loadLevel(1);
			
			
		}
	}
}