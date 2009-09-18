package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	
	import ghostcat.display.residual.ResidualScreen;
	import ghostcat.operation.RepeatOper;
	import ghostcat.operation.TweenOper;
	import ghostcat.transfer.Paper3D;
	import ghostcat.util.Util;
	import ghostcat.util.easing.Back;
	
	public class Paper3DExample extends Sprite
	{
		public var p:Paper3D;
		public function Paper3DExample()
		{
			p = new Paper3D(new TestRepeater());
			p.x = 50;
			p.y = 50;
			addChild(p);
			
			addChild(Util.createObject(new ResidualScreen(300,300),{refreshInterval:30,fadeSpeed:0.95,blurSpeed:6,items:[p]}));
			
			new RepeatOper([new TweenOper(p,5000,{rotationY:180,ease:Back.easeInOut}),new TweenOper(p,5000,{rotationY:0,ease:Back.easeInOut})]).execute();
		}
	}
}