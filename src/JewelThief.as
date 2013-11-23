package
{
	import flash.display.Sprite;
	import net.hires.debug.Stats;
	import starling.core.Starling;
	import screens.Start;
	import screens.Level;
	
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	[SWF(frameRate="60", width="800", height="700", backgroundColor="#2f318f")]

	public class JewelThief extends Sprite
	{
		private var stats:Stats;
		private var myStarling:Starling;
		
		public function JewelThief()
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			stats = new Stats();
			this.addChild(stats);
			
			myStarling = new Starling(Game, stage);
			myStarling.antiAliasing = 1;
			myStarling.start();
			
		}
	}
}