package
{
	import flash.media.SoundTransform;

	public class SoundTracks
		
	{
		
		public var soundTrackStage:MC_Soundtrack_Stage;
		public var soundTrackMenu:MC_Soundtrack_menu;
		
		public var playingMenu:Boolean;
		public var playingStage:Boolean;
		
		public  var muteSoundTrackStage:SoundTransform = new SoundTransform;
		public  var muteSoundTrackMenu:SoundTransform = new SoundTransform;
		
				public function SoundTracks()
		{				
		}
		
		public function playMenuTrack():void
		{
			soundTrackMenu = new MC_Soundtrack_menu;
			//Main.mainStage.addChild(soundTrackMenu);
			muteSoundTrackMenu.volume = Main.soundVolume;
			soundTrackMenu.soundTransform = muteSoundTrackMenu;
			playingMenu = true;			
		}
		
		public function stopMenuTrack():void
		{
			if(playingMenu)
			{								
				muteSoundTrackMenu.volume = 0;
				soundTrackMenu.soundTransform = muteSoundTrackMenu;	
				//Main.mainStage.removeChild(soundTrackMenu);
				playingMenu = false;
			}			
		}
		
		public function playStageTrack():void
		{
			soundTrackStage = new MC_Soundtrack_Stage;
			Main.mainStage.addChild(soundTrackStage);
			muteSoundTrackStage.volume = Main.soundVolume;
			soundTrackStage.soundTransform = muteSoundTrackStage;
			playingStage = true;	
		}
		
		public function stopStageTrack():void
		{
			if(playingStage)
			{								
				muteSoundTrackStage.volume = 0;
				soundTrackStage.soundTransform = muteSoundTrackStage;	
				Main.mainStage.removeChild(soundTrackStage);
				playingStage = false;
			}	
		}
	}
}