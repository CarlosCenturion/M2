package
{	
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.display.StageDisplayState;
	import flash.display.StageScaleMode;
	
	[SWF(width="800",height="600",frameRate="60")]
	
	public class Main extends Sprite
	{		
		public static var mainStage:Stage;		
		public var mainMenu:Menu	
		
		public static var soundVolume:int = 1;
		
		public function Main()
		{			
			mainStage = stage;
			mainStage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;
			mainStage.scaleMode = StageScaleMode.EXACT_FIT;	
			
			mainMenu = new Menu();
			mainMenu.create();					
		}
		
		// End Class
	}
}