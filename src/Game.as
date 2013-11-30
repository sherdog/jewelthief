package levels
{
	import com.emibap.textureAtlas.DynamicAtlas;
	
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.text.Font;
	import flash.text.TextFormat;
	import flash.utils.getTimer;
	import flash.utils.setTimeout;
	
	import objects.Item;
	
	import screens.Level;
	
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class LevelFactory extends Sprite
	{
		/************************************
		 * | Loader class
		 * | Is responsible for loading levels
		 * | There are a few methods that will be similar between all levels
		 *************************************/
		
		private var currentLevel:Number;
		private var XMLLoader:URLLoader;
		private var xmlUrl:String;
		
		public function LevelFactory()
		{
			super();
			//setupLevel();
		}
		
		public function start():void
		{
			//start the game! yes!
			
		}
		
		public function loadLevel(_level:Number):void
		{;
			currentLevel = _level;
			XMLLoader = new URLLoader();
			
			XMLLoader.addEventListener(starling.events.Event.COMPLETE, onXMLLoadComplete);
			xmlUrl = '../../assets/xml/levels/level' + _level + '.xml';
			XMLLoader.load(new URLRequest(xmlUrl));
		}
		
		protected function onXMLLoadComplete(e:Event):void
		{
			trace('loaded xml completed');
			
		}		
		
		private function setupLevel():void
		{
			
			/*
			// TODO Auto Generated method stub
			try
			{
			var mc:scoreboardContainer = new scoreboardContainer();
			var t1:uint = getTimer();
			var atlas:TextureAtlas = DynamicAtlas.fromMovieClipContainer(mc, 1, 0, true, true);
			
			var :starling.display.MovieClip = new starling.display.MovieClip(atlas.getTextures("mcScoreText"), 60);
			scoreTextLogo.x = stage.stageWidth - (scoreTextLogo.width) - 280;
			scoreTextLogo.y = 10;
			addChild(scoreTextLogo);
			Starling.juggler.add(scoreTextLogo);
			
			//Setup Score Container
			
			var embeddedFont1:Font = new BadaBoomScore();
			
			_score = new TextField(300, 36, "0", embeddedFont1.fontName, 36, 0xFFFFFF, true);
			_score.x = 500;
			_score.y = 10;
			_score.name = 'scoreTicker';
			
			stage.addChild(_score);
			
			var btnAddToScore:Button = new Button(Asset.getTexture("btnPlayNow"));
			btnAddToScore.x = 40;
			btnAddToScore.y = 10;
			
			btnAddToScore.addEventListener(starling.events.Event.TRIGGERED, onPlayClick);
			
			addChild(btnAddToScore);
			
			
			
			
			}
			catch (e:Error) {
			trace("There was an error in the creation of the texture Atlas. Please check if the dimensions of your clip exceeded the maximun allowed texture size. -", e.message);
			}
			*/
			
		}		
		
		
		
		
	}
}