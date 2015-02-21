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
	
    public function new() {
        rootSprite = this;
        super();
    }
	


    public function start(startup:Startup) {

        assets = new AssetManager();
		
		assets.enqueue("assets/spritesheet0.png");
		assets.enqueue("assets/spritesheet0.xml");
        assets.enqueue("assets/spritesheet1.png");
        assets.enqueue("assets/spritesheet1.xml");
        assets.enqueue("assets/club2.png");
		assets.enqueue("assets/music/disco_3.mp3");
		assets.enqueue("assets/win.png");
		
        assets.loadQueue(function onProgress(ratio:Float) {
            haxe.Log.clear();
            trace(ratio);
            if (ratio == 1) {
                haxe.Log.clear();
				startup.removeChild(startup.loadingBitmap);
 

                var menu = new Menu(rootSprite);
                menu.mainMenu();                }

        });
		
    }
}
