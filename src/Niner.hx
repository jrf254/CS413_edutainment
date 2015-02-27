import starling.display.Image;
import starling.textures.Texture;
import starling.textures.TextureAtlas;
import starling.utils.MathUtil;
import starling.events.EnterFrameEvent;
import starling.core.Starling;
import flash.geom.Rectangle;
import starling.events.EventDispatcher;
import starling.events.Event;
import starling.display.MovieClip;
import starling.display.Sprite;
import starling.animation.Juggler;
import starling.display.Quad;

class Niner extends Image{

	// private var movieVector:Vector.<MovieClip>;
	public var jump:Bool;

	var niner1:Texture = Root.assets.getTexture("9v31");
	var niner2:Texture = Root.assets.getTexture("9v32");
	var niner3:Texture = Root.assets.getTexture("9v33");
	var niner4:Texture = Root.assets.getTexture("9v34");
	var niner5:Texture = Root.assets.getTexture("9v35");

	var time:Int = 0;

	public function new() {

		super(niner1);

		pivotX = this.texture.width / 2;
		pivotY = this.texture.height / 2;

		x = 300;
		y = 495;

		start();
	}

	public function start() {
		this.addEventListener(EnterFrameEvent.ENTER_FRAME, enterFrame);
	}

	public function enterFrame() {
		time = time + 1;

		if(time == 3){
		    texture =  niner2; 
		}
		else if(time == 6){
			texture =  niner3; 
		}
		else if(time == 9){
			texture =  niner4;
		}
		else if(time == 12){
			texture =  niner5;
		}
		else if(time == 15){
			texture =  niner1;
			time = 0;
		}
	}
}