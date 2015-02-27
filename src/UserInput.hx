//package starling.text;
import starling.events.KeyboardEvent;
import starling.text.TextField;
import starling.events.EnterFrameEvent;

class UserInput extends TextField{
	private var answerText:String;
	
	public function new(){
		super(500, 200, "","font",48);
		this.color = 0xFFFFFF;
		this.y = 75;
		this.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
		this.addEventListener(EnterFrameEvent.ENTER_FRAME, enterFrame);
	}
	
	public function enterFrame(event:EnterFrameEvent){
		if ((this.parent.x + 400) < 0){
			this.text = "";
		}
	}
	
	public function keyDown(event:KeyboardEvent){
		if(event.charCode == 8){
			if (this.text.length > 0){
				this.text = this.text.substr(0, this.text.length-1);
			}
		}else if(event.charCode == 13){
			answerText = this.text;
			this.text = "";
		}else if(event.charCode >= 32){
			if(this.text.length <= 10){
				this.text = this.text + String.fromCharCode(event.charCode);
			}
		}
	}
	
	public function getAnswer(){
		return answerText;
	}
	public function setAnswer(input:String){
		answerText = input;
	}
}