package ghostcat.display.viewport
{
	import flash.geom.Point;

	public final class Display45Util
	{
		/**
		 * 最大横坐标
		 */
		public static var maxi:int = 10000;
		
		/**
		 * 45度格子长宽比
		 */
		public static var wh:Number;
		
		/**
		 * 格子宽度
		 */
		public static var width:Number;
		
		/**
		 * 格子高度
		 */
		public static var height:Number;
		
		
		/**
		 * 设置单个格子的大小
		 * @param w
		 * @param h
		 * 
		 */
		public static function setContentSize(w:Number,h:Number):void
		{
			width = w;
			height = h;
			wh = w / h;
		}
		/**
		 * 排序函数
		 * 
		 * @param d1
		 * @param d2
		 * @return 
		 * 
		 */
		public static function SORT_45(v1:*, v2:*):int
		{
			if (!wh)
				throw new Error("请先执行Display45Util.setContentSize方法");
			
			var p1:Point = getItemPointAtPoint(new Point(v1.x,v1.y),width,height);
			var p2:Point = getItemPointAtPoint(new Point(v2.x,v2.y),width,height);
			
			if (p1.x + p1.y * maxi > p2.x + p2.y * maxi)
				return 1;
			else
				return -1;
		}
		
		public static function getItemPointAtPoint(p:Point,width:Number,height:Number):Point
		{
			p = trans45To90(p,width / height);
			return new Point(Math.round(p.x / width) - 1 , Math.round(p.y / height)); 
		}
		
		/**
		 * 从45度显示坐标换算为90度
		 * @param p
		 * @return 
		 * 
		 */
		public static function trans45To90(p:Point,wh:Number):Point
		{
			return new Point(p.x + p.y * wh,p.y - p.x/wh);
		}
		
		/**
		 * 从90度换算为45度显示坐标
		 * @param p
		 * @return 
		 * 
		 */
		public static function trans90To45(p:Point,wh:Number):Point
		{
			return new Point((p.x - p.y * wh)/2,(p.x / wh + p.y)/2);
		}
	}
}