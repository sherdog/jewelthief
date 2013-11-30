package objects
{
	import com.emibap.textureAtlas.DynamicAtlas;
	
	import flash.text.Font;
	import flash.utils.getTimer;
	import flash.utils.setTimeout;
	
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	import starling.textures.TextureAtlas;

	
	public class Score extends Sprite
	{
<<<<<<< HEAD
		private var _displayScore:Number = 0;
		private var _totalScore:Number = 0;
		private var _scoreTicker:Object;
		private const SPEED:Number = 2;
		
		private var scoreBoardText:TextField;
=======
>>>>>>> 28ac189ddb89317ed9ddbd37eedfb44f72454fa6
		
		public function Score()
		{
			
			super();
<<<<<<< HEAD
			init();
			//_scoreTicker = stage.getChildByName('scoreTicker');
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
=======
>>>>>>> 28ac189ddb89317ed9ddbd37eedfb44f72454fa6
			
		}

		private function init():void
		{
<<<<<<< HEAD
			_displayScore = 0;
			_totalScore = 0;
			
		}
		
=======
		}
		
	
>>>>>>> 28ac189ddb89317ed9ddbd37eedfb44f72454fa6
		
		public function getScore():Number
		{
		}
		
		private function onAddedToStage(event:Event):void
		{
			this.removeEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		public function addScore(amount:Number):void
		{
<<<<<<< HEAD
			updateScore(amount);
=======
>>>>>>> 28ac189ddb89317ed9ddbd37eedfb44f72454fa6
		}
		
		public function updateScore(amount:Number):void
		{
		
		}
		
		public function updateScoreDisplay(event:Event):void
		{
			
		
		}
	}
}