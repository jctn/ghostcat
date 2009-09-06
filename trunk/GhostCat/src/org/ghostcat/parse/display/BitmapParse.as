package org.ghostcat.parse.display
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObjectContainer;
	import flash.geom.Point;
	
	import org.ghostcat.parse.DisplayParse;
	
	public class BitmapParse extends DisplayParse
	{
		public var width:int;
		public var height:int;
		public var pos:Point;
		public var transparent:Boolean = true;
		public var fillColor:uint = 0x00FFFFFF;
		public var pixelSnapping:String = "auto";
		public var smoothing:Boolean = false;
		
		public function BitmapParse(width:int,height:int,pos:Point=null,transparent:Boolean = true,fillColor:uint = 0x00FFFFFF,pixelSnapping:String = "auto",smoothing:Boolean = false)
		{
			this.width = width;
			this.height = height;
			this.pos = pos;
			this.transparent = transparent;
			this.fillColor = fillColor;
			
			this.pixelSnapping = pixelSnapping;
			this.smoothing = smoothing;
		}
		
		public function createBitmap():Bitmap
		{
			var bitmapData:BitmapData = new BitmapData(width,height,transparent,fillColor);
			var bitmap:Bitmap = new Bitmap(bitmapData,pixelSnapping,smoothing);
			bitmap.x = pos.x;
			bitmap.y = pos.y;
			return bitmap;
		}
		
		protected override function parseContainer(target:DisplayObjectContainer) : void
		{
			super.parseContainer(target);
			target.addChild(createBitmap());
		}
		
		public static function createBitmap(width:int,height:int,pos:Point=null,transparent:Boolean = true,fillColor:uint = 0x00FFFFFF,pixelSnapping:String = "auto",smoothing:Boolean = false):Bitmap
		{
			return new BitmapParse(width,height,pos,transparent,fillColor,pixelSnapping,smoothing).createBitmap();
		}
	}
}