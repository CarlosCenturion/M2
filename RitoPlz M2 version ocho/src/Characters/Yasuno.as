package Characters
{
	public class Yasuno extends Player
	{
		public function Yasuno()
		{
			model = new MC_Player_Samurai;
			currentDamage = 10;
			lifeSteal = 10/100
			atkDelay = 40;
			currentLife = 125;
			markType = new MC_sam_mark;
		}
	}
}