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
		
		public function Score()
		{
			super();
			
		}

		private function init():void
		{
		}
		
	
		
		public function getScore():Number
		{
		}
		
		private function onAddedToStage(event:Event):void
		{
			this.removeEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		public function addScore(amount:Number):void
		{
		}
		
		public function updateScore(amount:Number):void
		{
		
		}
		
		public function updateScoreDisplay(event:Event):void
		{
			
		
		}
	}
}