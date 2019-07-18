package
{
	import flash.display.MovieClip;
	import flash.events.Event;	

	public class Enemy extends GameObject
	{				
		public function Enemy()
		{			
		}			
		
		public function spawn(team:Boolean):void
		{
			if (team)
			{
			 model = minion1;
			 model.x = Enemy1SpawnX;		
			}
			if(!team)
			{
				model = minion2;
				model.x =Enemy2SpawnX;	
			}
			
			model.y = EnemySpawnY	
			currentScale= 1.5;
			model.scaleX = model.scaleY = currentScale;
			HPBar = HPBar2;			
			HPBar.scaleX = HPBar.scaleY = 1;
			Main.mainStage.addChild(HPBar);
			Main.mainStage.addChild(model);			
			changeAnimation(ANIM_IDLE);			
			playerTeam = team;	
			currentDamage = enemyDamage;
			maxLife = 60;
			currentLife = 60;			
			speed = 1;
			atkDelay = 80;
				
			
			im = "minion";						
			
			model.addEventListener("unlock",evUnlock)
			model.addEventListener("hitbox",evHitbox)	
			model.addEventListener("remove",evRemove)			
		}
		
		
		
		public function evHitbox(e:Event):void
		{
			for (var i:int =	GameEngine.brainList.length-1; i>=0;i--)
				{
					if(model.hitTestObject(GameEngine.brainList[i].objectControlled.model))
						{
						var s:GameObject = GameEngine.checkCollision(this);
						if (s != null)
							{
								s.destroy(enemyDamage);
							}
						}
				
					}
				}
			
			
		
		//END
		
	}
}