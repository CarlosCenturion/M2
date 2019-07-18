package
{
	import flash.system.TouchscreenType;

		public class TowersBrain
	{
		public var objectControlled:Towers;
		
		public var im:String = "Tower Brain";
		public var Rango:int = 500
			
		
		public var isShooting:Boolean 
		public var isDead:Boolean
		
		public var currentTimeToShoot:int;
		public var timeToShoot:int =600;
		
		public static var objetive:GameObject
		public function TowersBrain(tower:Towers)
			
		{
		objectControlled = tower;		 
		}
		public function update():void
		{
			if(objectControlled.currentLife <= 0)
			{
				objectControlled.isDead=true;
			}
			else
			{
				CheckRange();
			}			
		}
		
		public function CheckRange():void
		{
							
			for (var i:int =GameEngine.brainList.length-1; i>=0;i--)
			{
				if(GameEngine.brainList[i].objectControlled.model.x >=Rango && GameEngine.brainList[i].objectControlled.playerTeam != objectControlled.playerTeam && !objectControlled.isShooting)
			{
					objectControlled.isShooting = true;
					objetive = GameEngine.brainList[i].objectControlled
					objectControlled.Shoot(objetive)	
				    objectControlled.hasTarget =true;
					currentTimeToShoot = 0;
			}
				else
				{	
					objetive = null;
					currentTimeToShoot ++;
					if(currentTimeToShoot>= timeToShoot)
					{
						objectControlled.isShooting=false;
						currentTimeToShoot = 0;
					}
					
				}
			}		
		}
	
	
		
		
		// END CLASS
	}
}