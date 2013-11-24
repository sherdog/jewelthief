package objects
{
	
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	
	public class Score extends Sprite
	{
		private var _displayScore:Number = 0;
		private var _totalScore:Number = 0;
		private const SPEED:Number = 2;
		private var _mc:TextField;
		
		public function Score()
		{
			super();
			init();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
			
		}

		private function init():void
		{
			_displayScore = 0;
			_totalScore = 0;
		}
		
		public function getScore():Number
		{
			return _totalScore;
		}
		
		private function onAddedToStage(event:Event):void
		{
			this.removeEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		public function addScore(amount:Number):void
		{
			updateScore(amount);
		}
		
		public function updateScore(amount:Number):void
		{
			_totalScore += amount;
			addEventListener(starling.events.Event.ENTER_FRAME, updateScoreDisplay);
		}
		
		public function updateScoreDisplay(event:Event):void
		{
			_displayScore += SPEED;
			if(_displayScore > _totalScore)
			{
				_displayScore = _totalScore
			}
			
			if(_totalScore == _displayScore)
			{
				this.removeEventListener(starling.events.Event.ENTER_FRAME, updateScoreDisplay);
			}
			
		}
	}
}