package levels
{
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.utils.ByteArray;
	
	import starling.display.Sprite;
	
	public class LevelFactory extends Sprite
	{
		/************************************
		 * | Loader class
		 * | Is responsible for loading levels
		 * | There are a few methods that will be similar between all levels
		 *************************************/
		
		private var currentLevel:Number;
		private var _jsonLoader:URLLoader = new URLLoader();
		
		[Embed(source="../assets/xml/levels/levels.xml", mimeType="application/octet-stream")]
		private var levelsXML:Class;
		
		private var levelXML:XML;
		
		//Setup level vars
		private var _levelMode:String = "time";
		private var _levelBlocks:String = "";
		private var _levelRows:Array = [];
		private var _levelBackground:String = "";
		private var _levelMultiplier:Number = 1;
		private var _levelModeGetItems:String = "";
		private var _levelTime:Number = 0;
		private var _levelScore: Number = 0;
		
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
		{
			
			//load json for level data.
			
			
			_jsonLoader.addEventListener(Event.COMPLETE, processJSON);
			_jsonLoader.load(new URLRequest('../assets/xml/levels/levels.json'));
			
			trace('made it to load level with level ' + _level);
			currentLevel = _level;
			
			var ba:ByteArray = new levelsXML();
			var st:String = ba.readUTFBytes(ba.length);
			
			levelXML = new XML(st);
			
		}
		
		private function processJSON(e:flash.events.Event):void
		{
			trace('made it tot he JSON event handler');
			var stringJSON:String;
			var temp:Object;
			var levelObject:Object = JSON.parse(_jsonLoader.data);
			var _currentLevel:Number = this.currentLevel-1;
			var currentLevelData:Object = levelObject.levels[_currentLevel];
			
			
			//let's get the properies for this level.
			
			_levelMode = currentLevelData.mode;
			_levelBlocks = currentLevelData.blocks;
			
			switch(_levelMode)
			{
				case 'time':
				default:
					_levelTime = currentLevelData.time;
					break;
				case 'score':
					_levelScore = currentLevelData.score;
					break;
				case 'getItems':
					_levelModeGetItems = currentLevelData.getItems;
					break;
			}
			
			
			_levelMultiplier = currentLevelData.multiplier;
			_levelBackground = currentLevelData.background;
				
			var tmpRows:Array = [];
			//setup rows();
			
			for (var prop2:String in currentLevelData.rows)
			{
				var tmpVal:String = currentLevelData.rows[prop2];
				var tmpArr:Array = tmpVal.split(",");
				tmpRows.push(tmpArr);

			}
			_levelRows = tmpRows;
				
			
			setupLevel();
		}
		
		private function setupLevel():void
		{
			//now that we've parsed the lvel json record and set our variables we can now setup the level.
			trace("Rows: " + _levelRows.length);
			
			for(var i:String in _levelRows)
			{
				trace(i_levelRows[i]);
			}
			
			
		}
		
		protected function onXMLLoadComplete(e:Event):void
		{
			trace('loaded xml completed');
			 
		}		
		
		
		
		
		
		
	}
}