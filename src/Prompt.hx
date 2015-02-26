import starling.text.TextField;
import starling.text.BitmapFont;

class Prompt extends TextField{
	public function new(xCoord:Float, yCoord:Float){
		super(200, 200, "","",32);
		this.x = xCoord;
		this.y = yCoord;
		this.fontName = "Eraser";
		this.fontSize = 32;
		this.text = "";
		this.color = 0xFFFFFF;
		this.text = generateQuestion();
	}
	
	public function generateQuestion():String{
		return "Hello";
	}
	
	public function update(){
		this.x = this.x - 2;
	}
}