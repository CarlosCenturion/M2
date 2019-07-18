package
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;
	
	import Characters.Brolik;
	import Characters.Yasuno;
	import Characters.Zeth;

	public class Menu
	{	public var CharacterName:Class 
		public var model:MC_Mainmenu
		
		public var newGame:GameEngine;
		public var character:String
		public var soundTrack:SoundTracks;
		
		public var crosshair:MC_Cursor;
		
		
		
		
		
		public function Menu()
		{	
			
		}
		
		public function create():void
		{	
			
		
			model = new MC_Mainmenu	;		
			model.gotoAndStop(1)
			model.boton_sound.gotoAndStop(1);
			Main.mainStage.addChild(model);
			soundTrack = new SoundTracks;
			soundTrack.playMenuTrack();
			addListeners();			
			Mouse.show();
			switch(Main.soundVolume)
			{
				case 0:
					model.boton_sound.gotoAndStop(2);
					break;
				
				case 1:
					
					model.boton_sound.gotoAndStop(1);
					break;
			}
			
			crosshair = new MC_Cursor;
			Main.mainStage.addChild(crosshair);
			crosshair.startDrag(true);
			Mouse.hide();
		}
		
		// ****EVENTOS DE  MAIN MENU  SCREEN****
		
		protected function clicknewGame(event:MouseEvent):void
		{
			model.m1.gotoAndPlay("atk");
			model.m2.gotoAndPlay("atk");
			model.m1.addEventListener("play",characterSelect);
			
		}	
		
		
		protected function clickOptions(event:MouseEvent):void
		{
			model.m1.gotoAndPlay("atk");
			model.m2.gotoAndPlay("atk");
			
			
		}
		protected function clickAbout(event:MouseEvent):void
		{
			model.m1.gotoAndPlay("atk");
			model.m2.gotoAndPlay("atk");
		
			
		}
		public function clickSound(event:MouseEvent):void
		{
			
			switch (Main.soundVolume)
			{
				case 0:
					soundTrack.muteSoundTrackMenu.volume = 1;
					soundTrack.soundTrackMenu.soundTransform  = soundTrack.muteSoundTrackMenu;
					Main.soundVolume = 1;
					model.boton_sound.gotoAndStop(1);
					break;
				
				case 1:
					soundTrack.muteSoundTrackMenu.volume = soundTrack.muteSoundTrackStage.volume =0;
					soundTrack.soundTrackMenu.soundTransform = soundTrack.muteSoundTrackMenu;
					model.boton_sound.gotoAndStop(2);
					Main.soundVolume = 0;
					break;
			}
		}
			
		
		
		//	**** TERMINA EVENTOS DE MAIN MENU SCREEN****
		
		
		
		protected function removeListenersAndChilds():void
		{
			switch (model.currentFrame)
			{
				case 1:
					model.m1.removeEventListener("play",characterSelect);
					model.boton_newgame.removeEventListener(MouseEvent.CLICK, clicknewGame);
					model.boton_options.removeEventListener(MouseEvent.CLICK, clickOptions);
					model.boton_about.removeEventListener(MouseEvent.CLICK, clickAbout);
					model.boton_sound.removeEventListener(MouseEvent.CLICK, clickSound);

					
					break;
				case 2:
				model.s1.removeEventListener(MouseEvent.CLICK,evClickS1);
				model.s2.removeEventListener(MouseEvent.CLICK,evClickS2);
				model.s3.removeEventListener(MouseEvent.CLICK,evClickS3);
				model.b_play.removeEventListener(MouseEvent.CLICK,evClickPlay);
				
					break;
			}
		}
		
		
		// ****EVENTOS DE CHARACTER SELECT SCREEN****
		public function characterSelect(e:Event):void
		{
			
			model.gotoAndStop(2);
			addListeners();
			
			model.s1.gotoAndStop("o1");
			model.s2.gotoAndStop("o2");
			model.s3.gotoAndStop("o3");
			model.s4.gotoAndStop("o4");
			model.s5.gotoAndStop("o9");
			model.s6.gotoAndStop("o9");
			model.s7.gotoAndStop("o9");
			model.s8.gotoAndStop("o9");
			model.s9.gotoAndStop("o9");
			
			
		}
		
		protected function addListeners():void
		{
			switch(model.currentFrame)
			{
				case 1:
						model.boton_newgame.addEventListener(MouseEvent.CLICK, clicknewGame);
						model.boton_options.addEventListener(MouseEvent.CLICK, clickOptions);
						model.boton_about.addEventListener(MouseEvent.CLICK, clickAbout);
						model.boton_sound.addEventListener(MouseEvent.CLICK, clickSound);
					break;
				case 2:
					model.s1.addEventListener(MouseEvent.CLICK,evClickS1);
					model.s2.addEventListener(MouseEvent.CLICK,evClickS2);
					model.s3.addEventListener(MouseEvent.CLICK,evClickS3);
					model.s4.addEventListener(MouseEvent.CLICK,evClickS4);
					model.b_play.addEventListener(MouseEvent.CLICK,evClickPlay);
					model.boton_volver.addEventListener(MouseEvent.CLICK, evClickVolver);
					break;
			}
		}
		
		protected function evClickVolver(event:MouseEvent):void
		{
			removeListenersAndChilds()
			model.gotoAndStop(1);
			switch(Main.soundVolume)
			{
				case 0:
					model.boton_sound.gotoAndStop(2);
					break;
				
				case 1:
					
					model.boton_sound.gotoAndStop(1);
					break;
					
				
				
			}
			
			addListeners();
		}
		
		protected function evClickS1(event:MouseEvent):void
		{
			model.s1.gotoAndStop("l1");
			model.s2.gotoAndStop("o2");
			model.s3.gotoAndStop("o3");
			model.s4.gotoAndStop("o4");
			model.preview.gotoAndPlay("yasuno");
			character = "yasuno";
		}
		protected function evClickS2(event:MouseEvent):void
		{
			model.s2.gotoAndStop("l2");
			model.s1.gotoAndStop("o1");
			model.s3.gotoAndStop("o3");
			model.s4.gotoAndStop("o4");
			model.preview.gotoAndPlay("zeth");
			character = "zeth";
		}
		
		protected function evClickS3(event:MouseEvent):void
		{
			model.s3.gotoAndStop("l3");
			model.s1.gotoAndStop("o1");
			model.s2.gotoAndStop("o2");
			model.s4.gotoAndStop("o4");
			model.preview.gotoAndPlay("brolik");
			character = "brolik";
		}
		
		protected function evClickS4(event:MouseEvent):void
		{
			
			model.s1.gotoAndStop("o1");
			model.s2.gotoAndStop("o2");
			model.s3.gotoAndStop("o3");
			model.s4.gotoAndStop("l4");
			model.preview.gotoAndPlay("dinx");
		}
	
		
		// ****TERMINA EVENTOS DE CHARACTER SELECT SCREEN****
		
		
		
		public function evClickPlay(event:MouseEvent):void
		{
			
			switch(character)
			{
				case "yasuno":
					CharacterName = Yasuno;
					break;
				case "zeth":
					CharacterName = Zeth;
					break;
				case "brolik":
					CharacterName = Brolik;					
					break;
				default:					
					CharacterName = Yasuno;	
					break;				
			}		
			
			removeListenersAndChilds();
			Main.mainStage.removeChild(model);			
			newGame = new GameEngine();
			newGame.makeNewGame(CharacterName);
			
			soundTrack.stopMenuTrack();
			
			Mouse.hide();
		}

	// End Class	
	}
}