package levels
{
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.utils.ByteArray;
	
	import objects.Item;
	
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
		private var _jsonLoader:URLLoader = new URLLoader();
		
		[Embed(source="../assets/xml/levels/levels.xml", mimeType="application/octet-stream")]
		private var levelsXML:Class;
		
		private var levelXML:XML;
		
		//Setup level vars
		private var _levelMode:String = "time";
		private var _levelBlocks:String = "";
		private var _levelRows:Array;
		private var _levelBackground:String = "";
		private var _levelMultiplier:Number = 1;
		private var _levelModeGetItems:String = "";
		private var _levelTime:Number = 0;
		private var _levelScore: Number = 0;
		private var _currentLevel: Number = 0;
		
		private const _cellHeight:Number = 64;
		private const _cellWidth:Number = 64;
		private const _offsetX:Number = 5;
		private const _offsetY:Number = 5;
		
		private var gameSprite:Sprite;
		private var isDropping:Boolean;
		private var isSwapping:Boolean;
		private var gameScore:int;
		
		private var grid:Array;
		
		
		public function LevelFactory()
		{
			super();
			//setupLevel();
			setupEventListeners();
		}
		
		private function setupEventListeners():void
		{
			// TODO Auto Generated method stub
			this.addEventListener(starling.events.Event.ENTER_FRAME, onEnterFrame);
		}		
		
		private function onEnterFrame(e:starling.events.Event):void
		{
			// TODO Auto Generated method stub
			this.removeEventListener(starling.events.Event.ENTER_FRAME, onEnterFrame);
		}
		
		public function start():void
		{
			//start the game! yes!
			
		}
		
		public function loadLevel(_level:Number):void
		{
			
			
			trace('made it to load level with level ' + _level);
			currentLevel = _level;
			
			//load json for level data.
			_jsonLoader.addEventListener(starling.events.Event.COMPLETE, processJSON);
			_jsonLoader.load(new URLRequest('../assets/xml/levels/levels.json'));
			
			
			
		}
		
		private function processJSON(e:flash.events.Event):void
		{
			var stringJSON:String;
			var temp:Object;
			var levelObject:Object = JSON.parse(e.target.data);
			
			var _levelData:Object = levelObject.levels[1];
						//let's get the properies for this level.
			
			_levelMode = _levelData.mode;
			_levelBlocks = _levelData.blocks;
			
			switch(_levelMode)
			{
				case 'time':
				default:
					_levelTime = _levelData.time;
					break;
				case 'score':
					_levelScore = _levelData.score;
					break;
				case 'getItems':
					_levelModeGetItems = _levelData.getItems;
					break;
			}
			
			_levelMultiplier = _levelData.multiplier;
			_levelBackground = _levelData.background;
				
			grid = new Array();
			var tmpArr:Array;
			
			for (var i:int; i<_levelData.rows.length; i++)
			{
				var tmpVal:Object = _levelData.rows[i];
				var rowStr:String = tmpVal.row;
				tmpArr = rowStr.split(",");
				grid.push(tmpArr);
			}
			_levelRows = grid;
			startMatch();
		}
		
		private function startMatch():void
		{
			isDropping = false;
			isSwapping = false;
			
			var currentRow:Number=0;
			
			var gameScore:int = 0;
			
			grid = new Array();
			for(var gridrows:int=0;gridrows<_levelRows.length; gridrows++)
			{
				grid.push(new Array());
			}
			trace('made it to startMatch');
			drawLevel();
			/*
			//now that we've parsed the lvel json record and set our variables we can now setup the level.
			for(var k:int; k<_levelRows.length; k++)
			{
			for(var i:int=0; i<_levelRows[k].length; i++)
			{
			currentRow = _levelRows[k][i];
			if(currentRow == 0)
			{
			trace('block of some sort');
			}
			else
			{
			trace('gem');
			}
			}
			}
			*/
		}
		
		private function drawLevel():void
		{
			trace('made it to drawLevel()');
			while(true)
			{
				gameSprite = new Sprite();
				for(var row:int; row<_levelRows.length; row++)
				{
					for(var col:int; col<_levelRows[row].length; col++)
					{
						addItem(col,row);
						trace('adding item at ' + col + ', ' + row);
					}
				}
				if (lookForMatches().length != 0) continue;
				// try again if no possible moves
				if (lookForPossibles() == false) continue;
				// no matches, but possibles exist: good board found
				break;
			}
			
			this.addChild(gameSprite);
			
		}		
		
		private function lookForMatches():Object
		{
			// TODO Auto Generated method stub
			return "";
		}
		
		private function lookForPossibles():Boolean
		{
			// TODO Auto Generated method stub
			return false;
		}
		
		private function addItem(col:int, row:int):Item
		{
			// TODO Auto Generated method stub
			var _item:Item = new Item();
			
			_item.x = col*_cellWidth+_offsetX;
			_item.y = row*_cellHeight+_offsetY;
			
			_item.col = col;
			_item.row = row;
			
			_item.visible = true;
			
			gameSprite.addChild(_item);
			
			grid[col][row] = _item;
			
			_item.addEventListener(starling.events.Event.TRIGGERED, onItemTrigger);
			
			return _item;
		}		
		
		private function onItemTrigger():void
		{
			trace('click ');
		}		
		
		
	}
}