package
{
	
	import com.emibap.textureAtlas.DynamicAtlas;
	
	import levels.LevelFactory;
	
	import starling.core.Starling;
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.EnterFrameEvent;
	import starling.events.Event;
	import starling.text.BitmapFont;
	import starling.text.TextField;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	import starling.utils.Color;
	
	
	
	public class Game extends Sprite
	{
	 	private var gameBg:Image;
		private var levelLoader:LevelFactory;
		
		import objects.Score;
		
		public function Game()
		{
			super();
			setupGameListeners();
			
		}
		
		private function setupGameListeners():void
		{
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
			this.addEventListener(starling.events.Event.ENTER_FRAME, onGameEnterFrame);
		}
		
		private function onGameEnterFrame(event:Event):void
		{
			this.removeEventListener(starling.events.Event.ENTER_FRAME, onGameEnterFrame);
		}
		
		private function onAddedToStage():void
		{
			//trace('straling added to stage');
			//k now we are ready to launch the start screen
			trace('made it to Game:onAddedToStage()');
			
			//load level:
			//var level:LevelLoader = new levels["Level1"]();
			
			gameBg = new Image(Asset.getAtlas().getTexture("level_1_bg"));
			gameBg.x = 50;
			gameBg.y = 60;
			
			this.addChild(gameBg);
			
			//levelLoader.loadLevel();
			levelLoader = new LevelFactory();
			levelLoader.loadLevel(1);
			
			
		}
		
		private function setupStage():void
		{
			//we will be setting up the graphic layout.
			//since each level will be different we will be working with
		}
		
		
		
		
		
		
		
		
	}
}