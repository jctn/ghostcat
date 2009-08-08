package org.ghostcat.util
{
	public final class ArrayUtil
	{
		/**
		 * 将一个数组附加在另一个数组之后
		 * 
		 * @param arr	目标数组
		 * @param value	附加的数组
		 * 
		 */
		public function append(arr:Array,value:Array):void
		{
			arr.push.apply(null,value);
		}
		
		/**
		 * 获得两个数组的共用元素
		 * 
		 * @param array1	对象1
		 * @param array2	对象2
		 * 
		 */
		public static function hasShare(array1:Array,array2:Array):Array
		{
			var result:Array = [];
			for each (var obj:* in array1)
            {
                if (array2.indexOf(obj)!=-1)
                   	result.push(obj);
            }
            return result;
		}
		
		/**
		 * 获得数组中特定标示的对象
		 *  
		 * @param arr	数组
		 * @param value	值
		 * @param field	键
		 * @return 
		 * 
		 */
		public static function getMapping(arr:Array, value:*, field:* = 0):Object
        {
            for (var i:int = 0;i<arr.length;i++)
            {
            	var o:* = arr[i];
            	
                if (o[field] == value)
                	return o[i];
            }
            return null;
        }
        
        /**
		 * 获得数组中某个键的所有值
		 *  
		 * @param arr	数组
		 * @param field	键
		 * @return 
		 * 
		 */
		public static function getFieldValues(arr:Array, field:*):Array
        {
        	var result:Array = [];
            for (var i:int = 0;i<arr.length;i++)
            {
            	var o:* = arr[i];
            	
                result.push(o[field]);
            }
            return result;
        }
	}
}