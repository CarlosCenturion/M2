package
{
	import flash.events.Event;

	public class AIBrain
	{
		public var objectControlled:Enemy;		
		public var currentDirection:int = 1;		
		public var timeToAtk:int = 1500;
		public var currentTimeToAtk:int = timeToAtk;		
		public var canMove:Boolean = true;
		public var canAtk:Boolean;
		
		public var im:String = "Ai Brain";
		
		public function AIBrain(e:Enemy,direction:int)
		{
			objectControlled = e;
			currentDirection=direction;
			objectControlled.model.scaleX  = objectControlled.currentScale * direction;
		}
		
		public function update():void
		{
			moveMinions();
			objectControlled.evUpdate();
			collisionCheck();
			
		}
		
		
		public function moveMinions():void
		{
			if(objectControlled.canMove)
			{
				objectControlled.changeAnimation("walk")
				objectControlled.model.x += objectControlled.speed * currentDirection;	
			}
			else
			{  					
				objectControlled.atk();				
			}
		     
		}
		public function collisionCheck():void
		{
			for (var i:int =	GameEngine.brainList.length-1; i>=0;i--)
			{
				if (objectControlled.model.hitTestObject(GameEngine.brainList[i].objectControlled.model)&& objectControlled.playerTeam != GameEngine.brainList[i].objectControlled.playerTeam)
				{
					objectControlled.canMove=false;					
				}
			}
		}				
			
		// END CLASS
	}
}