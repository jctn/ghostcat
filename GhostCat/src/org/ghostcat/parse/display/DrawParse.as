package org.ghostcat.parse.display
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.IBitmapDrawable;
	import flash.geom.ColorTransform;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	
	import org.ghostcat.parse.DisplayParse;

	public class DrawParse extends DisplayParse
	{
		public var source:IBitmapDrawable;
		
		public var matrix:Matrix = null;
		public var colorTransform:ColorTransform = null;
		public var blendMode:String = null;
		public var clipRect:Rectangle = null;
		public var smoothing:Boolean = false;
		
		public function DrawParse(source:IBitmapDrawable,matrix:Matrix=null,colorTransform:ColorTransform=null,clipRect:Rectangle = null,smoothing:Boolean = false)
		{
			this.source = source;
			this.matrix = matrix;
			this.colorTransform = colorTransform;
			this.blendMode = blendMode;
			this.clipRect = clipRect;
			this.smoothing = smoothing;
		}
		
		public override function parse(target:*):void
		{
			super.parse(target);
			if (target is Bitmap)
				target = (target as Bitmap).bitmapData;
			if (target is BitmapData)
				(target as BitmapData).draw(source,matrix,colorTransform,blendMode,clipRect,smoothing);
		}
		
		public static function createBitmap(source:IBitmapDrawable,matrix:Matrix=null,colorTransform:ColorTransform=null,clipRect:Rectangle = null,smoothing:Boolean = false):Bitmap
		{
			var displayObj:DisplayObject = source as DisplayObject;
			if (!displayObj)
				return null;
			var bounds:Rectangle = displayObj.getBounds(displayObj);
			var width:int = bounds.width;
			var height:int = bounds.height;
			if (width == 0 || height == 0)
				return null;
			if (!matrix)
			{
				matrix = new Matrix();
				matrix.tx -= bounds.x;
				matrix.ty -= bounds.y;
			}
			var bitmap:Bitmap = BitmapParse.createBitmap(width,height);
			var draw:DrawParse = new DrawParse(source,matrix,colorTransform,clipRect,smoothing);
			draw.parse(bitmap);
			return bitmap;
		}
	}
}