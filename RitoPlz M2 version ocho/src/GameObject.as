package
{
	import flash.display.MovieClip;
	import flash.events.Event;

	public class GameObject
	{
		
	
		
		
		public var model:MovieClip;
		
		public var modelNinja:MC_Player_Ninja = new MC_Player_Ninja
		public var modelSamurai:MC_Player_Samurai = new MC_Player_Samurai
		public var modelViking:MC_Player_Viking = new MC_Player_Viking
		public var minion1:MC_Minion1 = new MC_Minion1;
		public var minion2:MC_Minion2 = new MC_Minion2;
		
		public const ANIM_IDLE:String = "idle";
		public const ANIM_IDLE2:String = "idle2";
		public const ANIM_ATK:String = "atk";
		public const ANIM_WALK:String = "walk";
		public const ANIM_DMG:String = "dmg";
		public const ANIM_DEAD:String = "dead";		
		
		public static var PlayerSpawnX:int = 100; 
		public static var PlayerSpawnY:int = 500; 		
		public static var Enemy1SpawnX:int = 0; 
		public static var EnemySpawnY:int = 500; 
		public static var Enemy2SpawnX:int = 800; 		
		
		public var Bars:Array = new Array;
		public var HPBar:MovieClip;
		public var HPBar1:MC_HPBar1 = new MC_HPBar1;
		public var HPBar2:MC_HPBar2 = new MC_HPBar2;		
		
		public var im:String;
		public var playerTeam:Boolean;
		public var maxLife:int;		
		public var currentLife:int;
		public var percentLife:Number;			
				
		public var damage:int = 15;
		public var currentDamage:int= damage;		
		public var lifeSteal:Number = 0;
		public var enemyDamage:int = (8-4)*Math.random() + 4				
		public var speed:Number = 2;
		public var atkSpeed:int = 40;
		public var atkDelay:int = atkSpeed;
		public var atkCurrentDelay:int;
		public var currentScale:Number = 2.5;	
		
		public  var bulletDamage:int = 25;
		public var  speedBullet:int = 4 ;			
		
		public var canMove:Boolean =true;
		public var canAtk:Boolean = true;
		public var canShoot:Boolean;
		
		public var isDead:Boolean;
		public var isLocked:Boolean;
		public var hasTarget:Boolean;	
		public var isShooting:Boolean;
		
		public var dmgMark:DmgMarks;
		public var markType:MovieClip;
		
		public var objectControlled:GameObject;
		
		
		public function GameObject()
		{
		}
		
		public function destroy(damage:int):void
		{			
			if(!isDead)
			{				
				currentLife-= damage;
				percentLife = currentLife/maxLife;	
				if(percentLife >1)
				{
					percentLife = 1;
				}
				if(currentLife<=0)
				{
					percentLife=0;
				}
				HPBar.hp.scaleX = percentLife;	
				
				if(im != null && im == "player" || im == "minion")
				{
					model.gotoAndPlay("dmg");
					isLocked = true;
				}
							
			}
		}
		
		
		public function atk():void
		{
			if(!isLocked && !isDead)
			{
				{
					if (canAtk)
					{
						changeAnimation(ANIM_ATK);						
						isLocked=true;
						canAtk=false;
						canMove=false
						model.addEventListener(Event.ENTER_FRAME,AtkSpeedControl);						
						
					}
				}	
			}
		}
		
		public function changeAnimation(name:String):void
		{
			if (model != null)
			{
				if(model.currentLabel != name)
				{
					model.gotoAndPlay(name);
				}
			}
			
		}	
		
		public function AtkSpeedControl(event:Event):void
		{
			if(!canAtk && !isDead && model !=null)
			{
				if(atkCurrentDelay <= atkDelay)
				{
					atkCurrentDelay ++;
				}else
				{
					atkCurrentDelay = 0;
					canAtk = true;
					model.removeEventListener(Event.ENTER_FRAME,AtkSpeedControl);										
				}
			}
		}
		
		public function evUnlock(event:Event):void
		{
			isLocked=false;
			canMove=true;
		}	
			
			public function update():void
			{	
			}
			
			public function evRemove(event:Event):void
			{
				if(Main.mainStage.contains(model))
				{
					Main.mainStage.removeChild(model);
					model = null;
				}				
			}	
			
			public function evUpdate():void
			{			
				updateBars();		
			}
			
			public function updateBars():void
			{	
				percentLife = currentLife/maxLife;	
				
				if(percentLife >1)
				{
					percentLife = 1
				}
					if(currentLife<=0)
					{
						percentLife=0;
					}
					
					
					HPBar.hp.scaleX = percentLife;	
					
				if ( currentLife<= 0 && isDead == false)
				{
					
					changeAnimation(ANIM_DEAD);
					isDead = true;
					isLocked = true;
					Main.mainStage.removeChild(HPBar)	
						HPBar = null;
				}
				else
				{
					if(im!=null && im == "player")
					{
						HPBar.x = model.x;
						HPBar.y = model.y - 115;	
					}
					else
					{
						HPBar.x = model.x;
						HPBar.y = model.y+10 ;
					}
						
				}					
			}		
			
			// END CLASS	
	}
}