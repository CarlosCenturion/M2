package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	

	public class DmgMarks
	{
		
		public var model:MovieClip;
		public var timeToRemove:int = 120;
		public var currentTimeToRemove:int;
		
		
		public function DmgMarks(type:MovieClip,x:int,y:int)
		{
			model = type;
			model.x = x;
			model.y = y;
			Main.mainStage.addChild(model);
			model.gotoAndPlay(1);
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
	}
}