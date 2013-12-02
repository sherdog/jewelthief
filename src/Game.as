package
{
	import levels.LevelFactory;
	
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
			trace('after load of level');
			
			//now we'll figure out where we are in the game. since we may be running, we may just be calling a new level and stuff.
			
			
		}
	}
}