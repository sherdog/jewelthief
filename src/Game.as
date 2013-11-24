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
	
	import objects.Score;
	
	import screens.Level;
	
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.EnterFrameEvent;
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
		
		public function Game()
		{
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage():void
		{
			//trace('straling added to stage');
			//k now we are ready to launch the start screen
			trace('made it to Game:onAddedToStage()');
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
			try
			{
				var mc:scoreboardContainer = new scoreboardContainer();
				var t1:uint = getTimer();
				var atlas:TextureAtlas = DynamicAtlas.fromMovieClipContainer(mc, 1, 0, true, true);
				var embeddedFont1:Font = new BadaBoomScore();
				
				_score = new Score();
				txtScore = txtScore.toString( _score.getScore);
				
				var total:uint = getTimer() - t1;
				
				trace(total, "msecs elapsed while converting...");
				
				var scoreText:starling.display.MovieClip = new starling.display.MovieClip(atlas.getTextures("mcScoreText"), 60);
				scoreText.x = stage.stageWidth - (scoreText.width) - 280;
				scoreText.y = 10;
				addChild(scoreText);
				Starling.juggler.add(scoreText);
				
				var scoreTextTextForeground:TextField = new TextField(300, 36, txtScore, embeddedFont1.fontName, 26, 0xFFFFFF, true);
				scoreTextTextForeground.x = stage.stageWidth - (scoreTextTextForeground.width + 12);
				scoreTextTextForeground.y = 12;
				scoreTextTextForeground.autoScale = false;
				scoreTextTextForeground.border = false;
				
				addChild(scoreTextTextForeground);
				
				var scoreObject:Score = new Score();
				scoreObject.addScore(300);
				
				
				
				
				
			}
			catch (e:Error) {
				trace("There was an error in the creation of the texture Atlas. Please check if the dimensions of your clip exceeded the maximun allowed texture size. -", e.message);
			}
		}
		
		
		
		
	}
}