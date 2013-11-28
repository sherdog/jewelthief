package
{
	
	import com.emibap.textureAtlas.DynamicAtlas;
	
	import objects.Item;
	
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
		
		public function Game()
		{
			super();
			
		}
		
		private function setupGameListeners():void
		{
		
		}
		
		private function onGameEnterFrame(event:Event):void
		{
		
			
		}
		
		private function onAddedToStage():void
		{
			//trace('straling added to stage');
			//k now we are ready to launch the start screen
			trace('made it to Game:onAddedToStage()');
				
		
			
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