package
{
	import screens.Level;
	
	import starling.core.Starling;
	import starling.display.Image;
	import starling.events.EnterFrameEvent;
	import starling.text.BitmapFont;
	import starling.text.TextField;
	import starling.textures.Texture;
	import starling.utils.Color;
	import starling.textures.TextureAtlas;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	
	import com.emibap.textureAtlas.DynamicAtlas;
	
	
	
	
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
			addClipsFromContainer();	
			
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
		
		private function addClipsFromContainer():void
		{
			// TODO Auto Generated method stub
			
		}
		
		
		
	}
}