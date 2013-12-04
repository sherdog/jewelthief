package objects {
	import flash.events.*;
	import flash.utils.Timer;
	
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.text.TextField;
	import starling.utils.Color;
	
	public class PointBurst extends Sprite {
		// text style
		private var fontFace:String = "Arial";
		private var fontSize:int = 20;
		private var fontBold:Boolean = false;
		private var fontColor:Number = 0xFFFFFF;
		
		// animation
		private var animSteps:int = 10;
		private var animStepTime:int = 50;
		private var startScale:Number = 0;
		private var endScale:Number = 2.0;
		
		private var tField:starling.text.TextField;
		private var burstSprite:Sprite;
		private var parentMC:Sprite;
		private var animTimer:Timer;		
		
		public function PointBurst(mc:starling.display.Sprite, pts:Object, x:Number,y:Number) {
			
			// create text format''
			
			// create text field
			tField = new TextField( 100, 200, "Text", "Arial", 12, Color.RED);
			tField.x = -(tField.width/2);
			tField.y = -(tField.height/2);
			
			// create sprite
			burstSprite = new Sprite();
			burstSprite.x = x;
			burstSprite.y = y;
			burstSprite.scaleX = startScale;
			burstSprite.scaleY = startScale;
			burstSprite.alpha = 0;
			burstSprite.addChild(tField);
			parentMC = mc;
			parentMC.addChild(burstSprite);
			
			// start animation
			animTimer = new Timer(animStepTime,animSteps);
			animTimer.addEventListener(TimerEvent.TIMER, rescaleBurst);
			animTimer.addEventListener(TimerEvent.TIMER_COMPLETE, removeBurst);
			animTimer.start();
		}
		
		// animate
		public function rescaleBurst(event:TimerEvent):void {
			// how far along are we
			var percentDone:Number = event.target.currentCount/animSteps;
			// set scale and alpha
			burstSprite.scaleX = (1.0-percentDone)*startScale + percentDone*endScale;
			burstSprite.scaleY = (1.0-percentDone)*startScale + percentDone*endScale;
			burstSprite.alpha = 1.0-percentDone;
		}
		
		// all done, remove self
		public function removeBurst(event:TimerEvent):void {
			burstSprite.removeChild(tField);
			parentMC.removeChild(burstSprite);
			tField = null;
			burstSprite = null;
			delete this;
		}
	}
}