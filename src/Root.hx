import starling.display.Sprite;
import starling.utils.AssetManager;
import starling.display.Image;
import starling.core.Starling;
import starling.animation.Transitions;
import starling.display.Stage;
import starling.events.EnterFrameEvent;


class Root extends Sprite {

    public static var assets:AssetManager;
    public var rootSprite:Sprite;
	public var menu:Menu;
	
    public function new() {
        rootSprite = this;
        super();
    }

    public function start(startup:Startup) {

        assets = new AssetManager();
		
		assets.enqueue("assets/chalkboard.png");
		assets.enqueue("assets/chalkboard2.png");
		assets.enqueue("assets/font.png");
		assets.enqueue("assets/font.fnt");
        assets.enqueue("assets/menu.png");
		
        assets.loadQueue(function onProgress(ratio:Float) {
            haxe.Log.clear();
            trace(ratio);
            if (ratio == 1) {
                haxe.Log.clear();
				startup.removeChild(startup.loadingBitmap);
 
				//var game = new Game(rootSprite);
				//game.start();
                menu = new Menu(rootSprite);
                menu.mainMenu();                
			}
        });
		
    }
}
