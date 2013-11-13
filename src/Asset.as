package
{
	import flash.display.Bitmap;
	import flash.utils.Dictionary;
	
	import starling.textures.Texture;

	public class Asset
	{
		[Embed(source="../assets/images/btnPlayNow.png")]
		public static const btnPlayNow:Class;
		
		[Embed(source="../assets/images/background.png")]
		public static const startBg:Class;
		
		private static var gameTextures:Dictionary = new Dictionary();
		
		public static function getTexture(name:String):starling.textures.Texture
		{
			if(gameTextures[name] == undefined)
			{
				var bitmap:Bitmap = new Asset[name]();
				gameTextures[name] = Texture.fromBitmap(bitmap);
			}
			return gameTextures[name];
		}
		
	}
}