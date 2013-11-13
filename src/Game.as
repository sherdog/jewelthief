package
{
	import screens.Start;
	
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Game extends Sprite
	{
		private var startScreen:Start;

		public function Game()
		{
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage():void
		{
			trace('straling added to stage');
			//k now we are ready to launch the start screen
			startScreen = new Start();
			this.addChild(startScreen);
			
			startScreen.initialize();
		}
		
		
	}
}