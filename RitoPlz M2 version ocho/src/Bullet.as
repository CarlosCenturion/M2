package
{
	import flash.events.Event;
	

	public class Bullet extends GameObject
	{
		public  static var model:MC_bullet_Tower;
		
			
		public static var bulletObjetive:GameObject;
		public var bulletObjetive2:GameObject;
		public var explosion:BulletExplosion;
		
		public var objX:int;
		public var objY:int;
		
		public function Bullet()
		{
		
		}
		
		public  function createBullet(objetive:GameObject,team:Boolean):void
		{
			bulletObjetive=  bulletObjetive2 = objetive;
			objX = objetive.model.x;
			objY = objetive.model.y;
			model = new MC_bullet_Tower;
			model.scaleX = model.scaleY = 3;
			playerTeam = team;
			switch (playerTeam)
			{
				case true:
					model.gotoAndStop("blue");
					break;
				case false:
					model.gotoAndStop("orange");
					break;
				default:
					model.gotoAndStop("red");
					break;					
			}				
			for(var i:int=GameEngine.brainList.length -1;i>=0;i--)
			{
				if(GameEngine.brainList[i].objectControlled.im == "tower" && GameEngine.brainList[i].objectControlled.playerTeam == playerTeam )
				{
					model.x = GameEngine.brainList[i].objectControlled.model.x - (GameEngine.brainList[i].objectControlled.model.width /2)
				}
			}
			model.y = 280;
			Main.mainStage.addChild(model);
			model.addEventListener(Event.ENTER_FRAME,evSeekAndDestroy);				
			
		}
		
		protected function evSeekAndDestroy(event:Event):void
		{
			var absX:int = model.x -objX;
			var absY:int =  model.y -objY;
			model.rotation = Math.atan2(absY,absX)*180/Math.PI	
				
			var vx:Number= speedBullet*(90-Math.abs(model.rotation))/90
			var vy:Number
			
			if(model.rotation<0)
			{
				vy= -speedBullet	+ Math.abs(vx)
			}
			else
			{
				vy= speedBullet - Math.abs(vx)
			}	
			
			model.x -=vx	
			model.y -= vy				
			
			for( var j:int =GameEngine.brainList.length - 1; j>=0;j--)
			{						 
				if(model.hitTestObject(GameEngine.brainList[j].objectControlled.model)&&GameEngine.brainList[j].objectControlled.model == bulletObjetive2.model)
				{
					GameEngine.brainList[j].objectControlled.destroy(bulletDamage);
					if(Main.mainStage.contains(model))
					{
						model.removeEventListener(Event.ENTER_FRAME,evSeekAndDestroy);
						explosion = new BulletExplosion(model.x,model.y);
						Main.mainStage.removeChild(model);
						model = null;						
					}
					isDead=true;
					break;
				}				
			}
			
			if(model != null)
			{
				if(model.y >= 480)
				{
					if(Main.mainStage.contains(model))
					{
						model.removeEventListener(Event.ENTER_FRAME,evSeekAndDestroy);
						explosion = new BulletExplosion(model.x,model.y);
						Main.mainStage.removeChild(model);
						model = null;					
					}
				}
			
				
			}			
		}	
		
		// END CLASS
	}
}