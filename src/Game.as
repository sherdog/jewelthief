package
{
	
	import com.emibap.textureAtlas.DynamicAtlas;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.text.Font;
	import flash.text.TextFormat;
	import flash.utils.getTimer;
	import flash.utils.setTimeout;
	
	import objects.Item;
	import objects.Score;
	
	import screens.Level;
	
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
		private var levelScreen:Level;
	 	private var gameBg:Image;
		private var _score:Score;
		private var txtScore:Number;
		private var scoreTextLogo:starling.display.MovieClip;
		private const SPEED:Number = 2;
		
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
			trace('onframe');
			this.removeEventListener(starling.events.Event.ENTER_FRAME, onGameEnterFrame);
			
		}
		
		private function onAddedToStage():void
		{
			//trace('straling added to stage');
			//k now we are ready to launch the start screen
			trace('made it to Game:onAddedToStage()');
				
			
			gameBg = new Image(Asset.getAtlas().getTexture("level_1_bg"));
			gameBg.x = 50;
			gameBg.y = 60;
			
			this.addChild(gameBg);
			
			levelScreen = new Level();
			levelScreen.x = 100;
			levelScreen.y = 100;
			this.addChild(levelScreen);
			//levelScreen.initialize();
			
			addClipsFromContainer();
			
		}
		
		private function setupStage():void
		{
			//we will be setting up the graphic layout.
			//since each level will be different we will be working with
		}
		
		private function addClipsFromContainer():void
		{
			// TODO Auto Generated method stub
			try
			{
				var mc:scoreboardContainer = new scoreboardContainer();
				var t1:uint = getTimer();
				var atlas:TextureAtlas = DynamicAtlas.fromMovieClipContainer(mc, 1, 0, true, true);
				
				var scoreTextLogo:starling.display.MovieClip = new starling.display.MovieClip(atlas.getTextures("mcScoreText"), 60);
				scoreTextLogo.x = stage.stageWidth - (scoreTextLogo.width) - 280;
				scoreTextLogo.y = 10;
				addChild(scoreTextLogo);
				Starling.juggler.add(scoreTextLogo);
				
				var btnAddToScore:Button = new Button(Asset.getTexture("btnPlayNow"));
				btnAddToScore.x = 40;
				btnAddToScore.y = 10;
				
				btnAddToScore.addEventListener(starling.events.Event.TRIGGERED, onPlayClick);
				
				addChild(btnAddToScore);
				
				_score = new Score();
				_score.x = 500;
				_score.y = 0;
				this.addChild(_score);
				
			}
			catch (e:Error) {
				trace("There was an error in the creation of the texture Atlas. Please check if the dimensions of your clip exceeded the maximun allowed texture size. -", e.message);
			}
		}
		
		private function onPlayClick():void
		{
			trace('btn clicked');
			//_score.addScore(3000);
			
		}
		
		
		
		
	}
}