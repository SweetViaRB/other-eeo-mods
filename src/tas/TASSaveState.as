package tas 
{
	import Global;
	
	public class TASSaveState 
	{
		public var switches: Object;
		public var rank: int;
		public var isVulnerable: Boolean;
		public var hasLevitation: Boolean;
		public var time: Number;
		public var hascrown: Boolean;
		public var hascrownsilver: Boolean;
		public var gx: Array;
		public var gy: Array;
		public var low_gravity: Boolean;
		public var jumpCount: int;
		public var maxJumps: int;
		public var speedBoost: int;
		public var bx: Array;
		public var by: Array;
		public var flipGravity: int;
		public var deaths: int;
		public var jumpBoost: int;
		public var isDead: Boolean;
		public var worldSpawn: int;
		public var x: Number;
		public var y: Number;
		public var speedx: Number;
		public var speedy: Number;
		public var checkpointx: int;
		public var checkpointy: int;
		public var team: int;
		public var camx: int;
		public var camy: int;
		
		public var tilequeue:Array;
		public var current:int;
		public var current_below:int;
		public var morx:int;
		public var mory:int;
		
		public function TASSaveState() 
		{
			x = -1;
			y = -1;
		}
		
		public function save():void 
		{
			var player: Player = Global.playState.player;
			
			switches = player.switches;
			
			// rank = 
			
			isVulnerable = player.isInvulnerable;
			hasLevitation = player.hasLevitation;
			
			time = Global.playState.player.ticks;
			
			hascrown = player.hascrown;
			hascrownsilver = player.hascrownsilver;
			
			gx = new Array();
			for (var igx: int = 0; igx < player.gx.length; igx++ ) {
				gx[igx] = (player.gx[igx]);
			}
			
			gy = new Array();
			for (var igy: int = 0; igy < player.gy.length; igy++ ) {
				gy[igy] = (player.gy[igy]);
			}
			
			low_gravity = player.low_gravity;
			jumpCount = player.jumpCount;
			maxJumps = player.maxJumps;
			speedBoost = player.speedBoost;
			
			// save blue coins
			bx = new Array();
			for (var ibx: int = 0; ibx < player.bx.length; ibx++ ) {
				bx[ibx] = (player.bx[ibx]);
			}
			
			by = new Array();
			for (var iby: int = 0; iby < player.by.length; iby++ ) {
				by[iby] = (player.by[iby]);
			}
			
			
			flipGravity = player.flipGravity;
			deaths = player.deaths;
			jumpBoost = player.jumpBoost;
			isDead = player.isDead;
			worldSpawn = player.worldSpawn;
			
			x = player.x;
			y = player.y;
			
			speedx = player.speedX;
			speedy = player.speedY;
			
			checkpointx = player.checkpoint_x;
			checkpointy = player.checkpoint_y;
			
			camx = Global.playState.x;
			camy = Global.playState.y;
			team = player.team;
			
			tilequeue = new Array();
			for (var tile:int = 0; tile < player.tilequeue.length; tile++) {
				tilequeue[tile] = player.tilequeue[tile];
			}
			
			current = player.current;
			current_below = player.current_below;
			morx = player.morx;
			mory = player.mory;
		}
		
		
		public function load():void
		{
			var player: Player = Global.playState.player;
			player.switches = switches;
			
			// rank
			
			player.isInvulnerable = isVulnerable;
			player.hasLevitation = hasLevitation;
			
			Global.playState.player.ticks = time;
			
			player.hascrown = hascrown;
			player.hascrownsilver = hascrownsilver;
			
			Global.playState.getWorld().resetCoins();
			player.coins = 0;
			// restore gold coins
			if (gx) {
				Global.playState.restoreCoins(gx, gy, false);
			}
			
			player.low_gravity = low_gravity;
			player.jumpCount = jumpCount;
			player.maxJumps = maxJumps;
			player.speedBoost = speedBoost;
			
			// restore blue coins
			player.bcoins = 0;
			if (bx) {
				Global.playState.restoreCoins(bx, by, true);
			}
			
			player.flipGravity = flipGravity;
			player.deaths = deaths;
			player.jumpBoost = jumpBoost;
			player.isDead = isDead;
			player.worldSpawn = worldSpawn;
			
			player.x = x;
			player.y = y;
			
			player.speedX = speedx;
			player.speedY = speedy;
			
			player.checkpoint_x = checkpointx;
			player.checkpoint_y = checkpointy;
			
			Global.playState.x = camx;
			Global.playState.y = camy;
			
			player.team = team;
			
			player.tilequeue = new Array();
			for (var tile:int = 0; tile < tilequeue.length; tile++) {
				player.tilequeue[tile] = tilequeue[tile];
			}
			
			player.current = current;
			player.current_below = current_below;
			player.morx = morx;
			player.mory = mory;
			
			if (TASGlobal.userInputs != null) {
				TASGlobal.userInputs.position = time;
			}
		}
	}

}