package
{
	import flash.events.Event;	

	public class Player extends GameObject
	{	
		
		public var newGame:GameEngine;
		
		
		public function Player()
		{			
		}
		
		public function spawn(team:Boolean):void
		{
			createBars(team);		
			
			model.x = PlayerSpawnX;
			model.y = PlayerSpawnY;			
			model.scaleX = model.scaleY = currentScale;
			Main.mainStage.addChild(model);			
			changeAnimation(ANIM_IDLE);
		
			
			playerTeam = team;
			
			maxLife = 125;
			currentLife = maxLife;			
				
			
			model.addEventListener("hitbox",evHitbox);
			model.addEventListener("unlock",evUnlock);
				
			im = "player";
			
			
		}
		
	
		
		protected function createBars(team:Boolean):void
		{			
					HPBar = HPBar1;					
					Main.mainStage.addChild(HPBar);
					HPBar.scaleX = HPBar.scaleY = 3;			
			
			
		}	
		
		public function move(direction:int):void
		{
			if(!isLocked)
			{
				if(direction == -1 && model.x >= 0 + model.width / 2)
				{
					model.x -= speed;
				}
				
				if(direction == 1 && model.x <= Main.mainStage.stageWidth - model.width / 2)
				{
					model.x += speed;
				}
				changeAnimation(ANIM_WALK);
				model.scaleX = currentScale * direction;
			}
		}
		
		
		public function evHitbox(e:Event):void
		
		{
			var s:GameObject = GameEngine.checkCollision(this);
			if (s != null)
			{	
				if(s.im == "minion")
				{
					currentLife+= currentDamage*lifeSteal;
					dmgMark = new DmgMarks(markType,s.model.x - (s.model.width/3),s.model.y - (s.model.height / 2));					
				}				
				s.destroy(currentDamage);
			}
		}
		
		
		
		//END
		
	}
}