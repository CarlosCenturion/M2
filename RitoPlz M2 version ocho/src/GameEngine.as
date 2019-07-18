package
{	
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;

	public class GameEngine
	{			
		public var player:Player	;	
		public var tower:Towers;
		public var towerBrain:TowersBrain ;
		public var menu:Menu;
		public var timeToWave:int = 200;
		public var currentTimeToWave:int = 0;
		public var timeToRespawnMinions:int =100;
		public var currentTimeToRespawnMinions:int = 0;
		public var currentMinions:int = 0;
	    public var WaveSize:int = 4    *2;
		public var nextWave:Boolean;		
		public static var  fondo:MCStage;
		public static var brainList:Array = new Array;
		
		public var soundTrack:SoundTracks;
		
		
		public function GameEngine()
		{		
		}
		
		public function makeNewGame(CharacterName:Class):void
		{
			fondo = new MCStage;				
			Main.mainStage.addChild(fondo);			
			player = new CharacterName;
			player.spawn(true);
			brainList.push( new PlayerBrain(player, Keyboard.A,Keyboard.D,Keyboard.SPACE));			
			tower = new Towers;
			tower.spawn ();
			brainList.push( new TowersBrain(tower));			
			Main.mainStage.addEventListener(Event.ENTER_FRAME,evUpdateBrainList);
			Main.mainStage.addEventListener(Event.ENTER_FRAME,evCreateEnemy);
			Main.mainStage.addEventListener(KeyboardEvent.KEY_DOWN,evRestartGame);
			Main.mainStage.addEventListener(KeyboardEvent.KEY_DOWN,evBerserkerMode);
			
			soundTrack = new SoundTracks;
			soundTrack.playStageTrack();
		}
		
		protected function evBerserkerMode(event:KeyboardEvent):void
		{
			if(event.keyCode == Keyboard.F1)
			{
				brainList[0].objectControlled.currentLife = 1000;
				brainList[0].objectControlled.currentDamage = 1000;
				trace("BerserkerMode Activated Wachin");
			}
		}
		
		protected function evRestartGame(event:KeyboardEvent):void
		{
			if(event.keyCode == Keyboard.F5)
			{
				destroyEveryFuckingThing();
				goHome();
			}
		}
		
		private function destroyEveryFuckingThing():void
		{
			Main.mainStage.removeEventListener(Event.ENTER_FRAME,evUpdateBrainList);
			Main.mainStage.removeEventListener(Event.ENTER_FRAME,evCreateEnemy);
			Main.mainStage.removeEventListener(KeyboardEvent.KEY_DOWN,evRestartGame);
			
			for(var i:int=brainList.length -1;i>=0;i--)
			{
				if(brainList[i].objectControlled.model != null)
				{
					if(Main.mainStage.contains(brainList[i].objectControlled.model))
						{
							Main.mainStage.removeChild(brainList[i].objectControlled.model);
							brainList[i].objectControlled.model = null;
						}
				}
				brainList.splice(i,1);
			}
			
			if(Main.mainStage.contains(fondo))
				{
					Main.mainStage.removeChild(fondo);
					fondo = null;
				}
				
			
		}
		
		private function goHome():void
		{
			menu = new Menu;
			menu.create();
			soundTrack.stopStageTrack();
			
		}
		
		protected function evUpdateBrainList(event:Event):void
		{
			for(var i:int=brainList.length -1; i >= 0; i--)
			{
				brainList[i].update();
				
				if(brainList[i].objectControlled.isDead == true && brainList[i].objectControlled.im != null)
				{
					switch(brainList[i].objectControlled.im)
					{
						case "minion":
							currentMinions --;
							break;
						case "player":	
							// Llamar Clase de Derrota aca
							break;
						case "tower":
							brainList[i].objectControlled.model.gotoAndPlay("TR1D");
							// Nullear el Model HPBar
							Main.mainStage.removeChild(brainList[i].objectControlled.HPBar);
						
						 
							// Llamar Clase de Victoria aca

							break;
						default:
							break;
						
					}					
					brainList.splice(i,1);					
				}
			}
		}
		protected function evCreateEnemy(event:Event):void
		{
			if(currentMinions<=4)
		 {
				nextWave=true;
		 }					
			if(nextWave)
		{
					currentTimeToWave ++ ;
		}				
			if(currentTimeToWave >= timeToWave)
		  {
				if(currentTimeToRespawnMinions >= timeToRespawnMinions)
				{
					var enemy:Enemy = new Enemy()
					enemy.spawn(true);
					brainList.push( new AIBrain(enemy,1) );
					var enemy2:Enemy = new Enemy()
					enemy2.spawn(false);
					brainList.push( new AIBrain(enemy2,-1) );
					currentMinions+=2;
					currentTimeToRespawnMinions = 0;
				}
				else				
					{
					currentTimeToRespawnMinions++;	
					}					
		  }							
					if(currentMinions >=WaveSize)
						{
							currentTimeToWave = 0;
							nextWave = false;
						}			
		}
		
			public static function checkCollision(s:GameObject):GameObject
		{
			for(var i:int=brainList.length-1; i >= 0;i--)
			{
				if(s != brainList[i].objectControlled && s.model.hitTestObject(brainList[i].objectControlled.model )&& s.playerTeam != brainList[i].objectControlled.playerTeam )
				{
					return	brainList[i].objectControlled;
				}
			}
			return null;
		}	
		
		
		
		// End Class
	}
}