package
{
	import screens.Level;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Game extends Sprite
	{
		private var levelScreen:Level;
	 	private var gameBg:Image;
		
		public function Game()
		{
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage():void
		{
			//trace('straling added to stage');
			//k now we are ready to launch the start screen
			gameBg = new Image(Asset.getAtlas().getTexture("level_1_bg"));
			gameBg.x = 50;
			gameBg.y = 60;
			
			this.addChild(gameBg);
			
			levelScreen = new Level();
			levelScreen.x = 100;
			levelScreen.y = 100;
			this.addChild(levelScreen);
			//levelScreen.initialize();
			
			
		}
		
		
		
		
	}
}