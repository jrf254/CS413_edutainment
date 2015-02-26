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

class Niner extends Sprite{

	private var runAnimation:MovieClip;
	private var jumpAnimation:MovieClip;
	// private var movieVector:Vector.<MovieClip>;
	private var jump:Bool;

	public function Niner() {

		var atlas:TextureAtlas = Assets.getTextureAtlas();
 
        // var runFrames:Vector.<Texture> = atlas.getTextures("9v3");

        runAnimation = new MovieClip(atlas.getTextures("9v3"), 12 );

		pivotX = this.texture.width / 2;
		pivotY = this.texture.height / 2;

		this.x = 200;
		this.y = 450;

		addChild(runAnimation);
		Starling.juggler.add(runAnimation);
	}
}