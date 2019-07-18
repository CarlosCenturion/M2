package
{
	import flash.events.KeyboardEvent;

	public class PlayerBrain
	{
		public var objectControlled:Player;
		
		public var isPressing_Left:Boolean;
		public var isPressing_Right:Boolean;
		public var isPressing_Atk:Boolean;
		
		
		public var keyCodeLeft:int;
		public var keyCodeRight:int;
		public var keyCodeAtk:int;
		
		public var im:String = "Player Brain";
		
		
		
		public function PlayerBrain(p:Player,codeLeft:int,codeRight:int,codeAtk:int)
		{
			
			objectControlled = p;
			
			keyCodeLeft = codeLeft;
			keyCodeRight = codeRight;
			keyCodeAtk = codeAtk;
			
			
			Main.mainStage.addEventListener(KeyboardEvent.KEY_UP, evKeyUp);
			Main.mainStage.addEventListener(KeyboardEvent.KEY_DOWN, evKeyDown);
		}
		
		public function update():void
		{
			checkKeys();
			objectControlled.evUpdate();
		
		}
		
		protected function evKeyDown(event:KeyboardEvent):void
		{
			switch(event.keyCode)
			{
				case keyCodeLeft:
					isPressing_Left = true;
					break;
				
				case keyCodeRight:
					isPressing_Right = true;
					break;
				
				case keyCodeAtk:
					isPressing_Atk = true;
					break;
			}
		}
		
		protected function evKeyUp(event:KeyboardEvent):void
		{
			if(!objectControlled.isLocked)
			{
				objectControlled.changeAnimation(objectControlled.ANIM_IDLE);
			}
			
			switch(event.keyCode)
			{
				case keyCodeLeft:
					isPressing_Left = false;
					break;
				
				case keyCodeRight:
					isPressing_Right = false;
					break;
				
				case keyCodeAtk:
					isPressing_Atk = false;
					break;
			}
		}
		
		public function checkKeys():void
		{
			if(isPressing_Right)
			{
				objectControlled.move(1);				
			}else
				if(isPressing_Left)
				{
					objectControlled.move(-1);
				}
			if(isPressing_Atk)
			{
				objectControlled.atk();
			}
			
		}
	
		
		// End
	}
}