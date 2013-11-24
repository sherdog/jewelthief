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
		
		public function Score()
		{
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		public function getScore():Number
		{
			return this._totalScore;
		}
		
		private function onAddedToStage(event:Event):void
		{
			this.removeEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
			init();
		}
		
		private function init():void
		{
			//setup scoreboard.
			//we are going to import the score instanc eon stage
			//and set the score to 0.
			trace('score class initialized');
		}
		
		public function addScore(amount:Number):void
		{
			updateScore(amount);
		}
		
		private function updateScore(amount:Number):void
		{
			this._totalScore += amount;
			this.addEventListener(starling.events.Event.ENTER_FRAME, updateScoreDisplay);
		}
		
		private function updateScoreDisplay():void
		{
			this._displayScore += SPEED;
			if(this._displayScore > this._totalScore)
			{
				this._displayScore = this._totalScore
			}
			
			if(this._totalScore == this._displayScore)
			{
				this.removeEventListener(starling.events.Event.ENTER_FRAME, updateScoreDisplay);
			}
		}
	}
}