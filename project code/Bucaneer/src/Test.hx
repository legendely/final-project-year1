package;
import openfl.net.URLLoader;
import openfl.net.URLRequest;

import openfl.events.Event;
/**
 * ...
 * @author Marcel Stoepker
 */
class Test{

	public var temp : URLRequest = new URLRequest("the actual php url");
	public var urlLoader : URLLoader = new URLLoader();
	
	public function new(){
		urlLoader.addEventListener(Event.COMPLETE, onComplete);
		urlLoader.load(temp);
	}
	
	private function onComplete(e:Event):Void{
		trace(urlLoader.data);
	}

}