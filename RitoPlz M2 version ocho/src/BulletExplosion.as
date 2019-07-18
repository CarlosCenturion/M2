 package
{
	import flash.events.Event;
	
	public class BulletExplosion
	{
		public var model:MC_bullet_explosion;
		public var timeToRemove:int = 120;
		public var currentTimeToRemove:int;
		public function BulletExplosion(x:int,y:int)
		{
			model= new MC_bullet_explosion;
			model.x = x;
			model.y = y;
			Main.mainStage.addChild(model);
			model.addEventListener(Event.ENTER_FRAME,evRemove);
			model.scaleX = model.scaleY = 3;			
		}
		
		protected function evRemove(event:Event):void
		{
			if(currentTimeToRemove <= timeToRemove)
			{
				currentTimeToRemove ++;
			}
			else
			{
				if(model != null)
				{
					if(Main.mainStage.contains(model))
					{
						Main.mainStage.removeChild(model);
						model=null;	
					}
					
				}
			}
			
		}
		
		// END CLASS
	}
}