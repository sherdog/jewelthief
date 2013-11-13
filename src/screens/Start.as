package screens
{
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Start extends Sprite
	{
		private var startBg:Image;
		private var playBtn:Button;
		
		public function Start()
		{
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
			
		}
		
		private function onAddedToStage():void
		{
			trace('start screen added to stage ;)');
			
			drawScreen();
			
		}
		
		private function drawScreen():void
		{
			startBg = new Image(Asset.getTexture("startBg"));
			addChild(startBg);
			
			playBtn = new Button(Asset.getTexture("btnPlayNow"));
			playBtn.x = (stage.stageWidth * 0.5) - (playBtn.width * 0.5);
			playBtn.y = 80;
			
			addChild(playBtn);
			
		}
		
		public function initialize():void
		{
			this.visible = true;
		}
		
	}
}