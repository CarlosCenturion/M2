package
{
	import flash.display.MovieClip;
	
	

	public class Towers extends GameObject
	{
	
		public var posY:int;
		public var posX:int;
		public static var bulletObjetive:Player;
		public var spawnTowerX:int = 680;
		public var spawnTowerY:int = 500;
		public static var model:MovieClip;
		public static const playerTeam:int = 2;		
		
		public static const timeToShoot:int = 2000;
		public static var currentTimeToShoot:int =0;
		
		public var bullet:Bullet;
		public var bulletList:Vector.<Bullet> = new Vector.<Bullet>;	
		
		
		public function Towers()
		{			
				
		}
		
		public function spawn():void
		{
			model = new MC_Tower;
		    
			model.gotoAndStop("TR1");			
			model.x = spawnTowerX;
			model.y = spawnTowerY;	
						
			model.scaleX = -3.5 ;
			model.scaleY = 3.5;
			Main.mainStage.addChild(model);
				
			//hp bar
			HPBar = new MC_HPBar2;
			HPBar.x = model.x;
			HPBar.y = model.y + 20;
			HPBar.scaleX =  HPBar.scaleY = 4;
			Main.mainStage.addChild(HPBar);	
			
			HPBar:MC_HPBar2;
			maxLife = 2000;	
			currentLife = maxLife;
			
			im = "tower";
			
			
		}		
		
		
		
		
		public function Shoot(objetive:GameObject):void
		
		{				
				bullet=new Bullet
				bullet.createBullet(objetive,false)
				bulletList.push(bullet)
						
		}
		
		
		
			
		
		
		
		
	}
}