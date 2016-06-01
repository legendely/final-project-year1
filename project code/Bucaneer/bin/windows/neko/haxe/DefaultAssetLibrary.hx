package;


import haxe.Timer;
import haxe.Unserializer;
import lime.app.Future;
import lime.app.Preloader;
import lime.app.Promise;
import lime.audio.AudioSource;
import lime.audio.openal.AL;
import lime.audio.AudioBuffer;
import lime.graphics.Image;
import lime.net.HTTPRequest;
import lime.system.CFFI;
import lime.text.Font;
import lime.utils.Bytes;
import lime.utils.UInt8Array;
import lime.Assets;

#if sys
import sys.FileSystem;
#end

#if flash
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;
import flash.media.Sound;
import flash.net.URLLoader;
import flash.net.URLRequest;
#end


class DefaultAssetLibrary extends AssetLibrary {
	
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		#if (openfl && !flash)
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		#end
		
		#if flash
		
		path.set ("img/buttonpictures/amountOfPlayers4.jpg", "img/buttonpictures/amountOfPlayers4.jpg");
		type.set ("img/buttonpictures/amountOfPlayers4.jpg", AssetType.IMAGE);
		path.set ("img/buttonpictures/amountOfPlayers6.jpg", "img/buttonpictures/amountOfPlayers6.jpg");
		type.set ("img/buttonpictures/amountOfPlayers6.jpg", AssetType.IMAGE);
		path.set ("img/buttonpictures/backButton.jpg", "img/buttonpictures/backButton.jpg");
		type.set ("img/buttonpictures/backButton.jpg", AssetType.IMAGE);
		path.set ("img/buttonpictures/chatRoomButton.jpg", "img/buttonpictures/chatRoomButton.jpg");
		type.set ("img/buttonpictures/chatRoomButton.jpg", AssetType.IMAGE);
		path.set ("img/buttonpictures/gameOverviewButton.jpg", "img/buttonpictures/gameOverviewButton.jpg");
		type.set ("img/buttonpictures/gameOverviewButton.jpg", AssetType.IMAGE);
		path.set ("img/buttonpictures/loginButton.jpg", "img/buttonpictures/loginButton.jpg");
		type.set ("img/buttonpictures/loginButton.jpg", AssetType.IMAGE);
		path.set ("img/buttonpictures/moveButtonLeft.jpg", "img/buttonpictures/moveButtonLeft.jpg");
		type.set ("img/buttonpictures/moveButtonLeft.jpg", AssetType.IMAGE);
		path.set ("img/buttonpictures/moveButtonRight.jpg", "img/buttonpictures/moveButtonRight.jpg");
		type.set ("img/buttonpictures/moveButtonRight.jpg", AssetType.IMAGE);
		path.set ("img/buttonpictures/player1Button.jpg", "img/buttonpictures/player1Button.jpg");
		type.set ("img/buttonpictures/player1Button.jpg", AssetType.IMAGE);
		path.set ("img/buttonpictures/player2Button.jpg", "img/buttonpictures/player2Button.jpg");
		type.set ("img/buttonpictures/player2Button.jpg", AssetType.IMAGE);
		path.set ("img/buttonpictures/player3Button.jpg", "img/buttonpictures/player3Button.jpg");
		type.set ("img/buttonpictures/player3Button.jpg", AssetType.IMAGE);
		path.set ("img/buttonpictures/player4Button.jpg", "img/buttonpictures/player4Button.jpg");
		type.set ("img/buttonpictures/player4Button.jpg", AssetType.IMAGE);
		path.set ("img/buttonpictures/player5Button.jpg", "img/buttonpictures/player5Button.jpg");
		type.set ("img/buttonpictures/player5Button.jpg", AssetType.IMAGE);
		path.set ("img/buttonpictures/player6Button.jpg", "img/buttonpictures/player6Button.jpg");
		type.set ("img/buttonpictures/player6Button.jpg", AssetType.IMAGE);
		path.set ("img/buttonpictures/set1.jpg", "img/buttonpictures/set1.jpg");
		type.set ("img/buttonpictures/set1.jpg", AssetType.IMAGE);
		path.set ("img/buttonpictures/set2.jpg", "img/buttonpictures/set2.jpg");
		type.set ("img/buttonpictures/set2.jpg", AssetType.IMAGE);
		path.set ("img/buttonpictures/set3.jpg", "img/buttonpictures/set3.jpg");
		type.set ("img/buttonpictures/set3.jpg", AssetType.IMAGE);
		path.set ("img/buttonpictures/set4.jpg", "img/buttonpictures/set4.jpg");
		type.set ("img/buttonpictures/set4.jpg", AssetType.IMAGE);
		path.set ("img/buttonpictures/settingsButton.jpg", "img/buttonpictures/settingsButton.jpg");
		type.set ("img/buttonpictures/settingsButton.jpg", AssetType.IMAGE);
		path.set ("img/buttonpictures/tutorialButton.jpg", "img/buttonpictures/tutorialButton.jpg");
		type.set ("img/buttonpictures/tutorialButton.jpg", AssetType.IMAGE);
		path.set ("img/islandMap.jpg", "img/islandMap.jpg");
		type.set ("img/islandMap.jpg", AssetType.IMAGE);
		path.set ("database/BucaneersTestDB.db", "database/BucaneersTestDB.db");
		type.set ("database/BucaneersTestDB.db", AssetType.BINARY);
		
		
		#elseif html5
		
		var id;
		id = "img/buttonpictures/amountOfPlayers4.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/buttonpictures/amountOfPlayers6.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/buttonpictures/backButton.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/buttonpictures/chatRoomButton.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/buttonpictures/gameOverviewButton.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/buttonpictures/loginButton.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/buttonpictures/moveButtonLeft.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/buttonpictures/moveButtonRight.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/buttonpictures/player1Button.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/buttonpictures/player2Button.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/buttonpictures/player3Button.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/buttonpictures/player4Button.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/buttonpictures/player5Button.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/buttonpictures/player6Button.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/buttonpictures/set1.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/buttonpictures/set2.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/buttonpictures/set3.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/buttonpictures/set4.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/buttonpictures/settingsButton.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/buttonpictures/tutorialButton.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/islandMap.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "database/BucaneersTestDB.db";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		
		
		var assetsPrefix = null;
		if (ApplicationMain.config != null && Reflect.hasField (ApplicationMain.config, "assetsPrefix")) {
			assetsPrefix = ApplicationMain.config.assetsPrefix;
		}
		if (assetsPrefix != null) {
			for (k in path.keys()) {
				path.set(k, assetsPrefix + path[k]);
			}
		}
		
		#else
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		
		
		if (useManifest) {
			
			loadManifest ();
			
			if (Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				lastModified = FileSystem.stat (path).mtime.getTime ();
				
				timer = new Timer (2000);
				timer.run = function () {
					
					var modified = FileSystem.stat (path).mtime.getTime ();
					
					if (modified > lastModified) {
						
						lastModified = modified;
						loadManifest ();
						
						onChange.dispatch ();
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		#end
		
	}
	
	
	public override function exists (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var assetType = this.type.get (id);
		
		if (assetType != null) {
			
			if (assetType == requestedType || ((requestedType == SOUND || requestedType == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if (requestedType == BINARY && (assetType == BINARY || assetType == TEXT || assetType == IMAGE)) {
				
				return true;
				
			} else if (requestedType == TEXT && assetType == BINARY) {
				
				return true;
				
			} else if (requestedType == null || path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (requestedType == BINARY || requestedType == null || (assetType == BINARY && requestedType == TEXT)) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getAudioBuffer (id:String):AudioBuffer {
		
		#if flash
		
		var buffer = new AudioBuffer ();
		buffer.src = cast (Type.createInstance (className.get (id), []), Sound);
		return buffer;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return AudioBuffer.fromBytes (cast (Type.createInstance (className.get (id), []), Bytes));
		else return AudioBuffer.fromFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):Bytes {
		
		#if flash
		
		switch (type.get (id)) {
			
			case TEXT, BINARY:
				
				return Bytes.ofData (cast (Type.createInstance (className.get (id), []), flash.utils.ByteArray));
			
			case IMAGE:
				
				var bitmapData = cast (Type.createInstance (className.get (id), []), BitmapData);
				return Bytes.ofData (bitmapData.getPixels (bitmapData.rect));
			
			default:
				
				return null;
			
		}
		
		return cast (Type.createInstance (className.get (id), []), Bytes);
		
		#elseif html5
		
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var bytes = loader.bytes;
		
		if (bytes != null) {
			
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Bytes);
		else return Bytes.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Font {
		
		#if flash
		
		var src = Type.createInstance (className.get (id), []);
		
		var font = new Font (src.fontName);
		font.src = src;
		return font;
		
		#elseif html5
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Font);
			
		} else {
			
			return Font.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	public override function getImage (id:String):Image {
		
		#if flash
		
		return Image.fromBitmapData (cast (Type.createInstance (className.get (id), []), BitmapData));
		
		#elseif html5
		
		return Image.fromImageElement (Preloader.images.get (path.get (id)));
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Image);
			
		} else {
			
			return Image.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	/*public override function getMusic (id:String):Dynamic {
		
		#if flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		//var sound = new Sound ();
		//sound.__buffer = true;
		//sound.load (new URLRequest (path.get (id)));
		//return sound;
		return null;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return null;
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		//else return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}*/
	
	
	public override function getPath (id:String):String {
		
		//#if ios
		
		//return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		//#else
		
		return path.get (id);
		
		//#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if html5
		
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var bytes = loader.bytes;
		
		if (bytes != null) {
			
			return bytes.getString (0, bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.getString (0, bytes.length);
			
		}
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		
		#if flash
		
		//if (requestedType != AssetType.MUSIC && requestedType != AssetType.SOUND) {
			
			return className.exists (id);
			
		//}
		
		#end
		
		return true;
		
	}
	
	
	public override function list (type:String):Array<String> {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (requestedType == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadAudioBuffer (id:String):Future<AudioBuffer> {
		
		var promise = new Promise<AudioBuffer> ();
		
		#if (flash)
		
		if (path.exists (id)) {
			
			var soundLoader = new Sound ();
			soundLoader.addEventListener (Event.COMPLETE, function (event) {
				
				var audioBuffer:AudioBuffer = new AudioBuffer();
				audioBuffer.src = event.currentTarget;
				promise.complete (audioBuffer);
				
			});
			soundLoader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			soundLoader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			soundLoader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getAudioBuffer (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<AudioBuffer> (function () return getAudioBuffer (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadBytes (id:String):Future<Bytes> {
		
		var promise = new Promise<Bytes> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = Bytes.ofString (event.currentTarget.data);
				promise.complete (bytes);
				
			});
			loader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var request = new HTTPRequest ();
			promise.completeWith (request.load (path.get (id) + "?" + Assets.cache.version));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<Bytes> (function () return getBytes (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadImage (id:String):Future<Image> {
		
		var promise = new Promise<Image> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bitmapData = cast (event.currentTarget.content, Bitmap).bitmapData;
				promise.complete (Image.fromBitmapData (bitmapData));
				
			});
			loader.contentLoaderInfo.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.contentLoaderInfo.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var image = new js.html.Image ();
			image.onload = function (_):Void {
				
				promise.complete (Image.fromImageElement (image));
				
			}
			image.onerror = promise.error;
			image.src = path.get (id) + "?" + Assets.cache.version;
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<Image> (function () return getImage (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	#if (!flash && !html5)
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = Bytes.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = Bytes.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = Bytes.readFile ("assets/manifest");
			#elseif (mac && java)
			var bytes = Bytes.readFile ("../Resources/manifest");
			#elseif (ios || tvos)
			var bytes = Bytes.readFile ("assets/manifest");
			#else
			var bytes = Bytes.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				if (bytes.length > 0) {
					
					var data = bytes.getString (0, bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								#if (ios || tvos)
								path.set (asset.id, "assets/" + asset.path);
								#else
								path.set (asset.id, asset.path);
								#end
								type.set (asset.id, cast (asset.type, AssetType));
								
							}
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			trace ('Warning: Could not load asset manifest (${e})');
			
		}
		
	}
	#end
	
	
	public override function loadText (id:String):Future<String> {
		
		var promise = new Promise<String> ();
		
		#if html5
		
		if (path.exists (id)) {
			
			var request = new HTTPRequest ();
			var future = request.load (path.get (id) + "?" + Assets.cache.version);
			future.onProgress (function (progress) promise.progress (progress));
			future.onError (function (msg) promise.error (msg));
			future.onComplete (function (bytes) promise.complete (bytes.getString (0, bytes.length)));
			
		} else {
			
			promise.complete (getText (id));
			
		}
		
		#else
		
		promise.completeWith (loadBytes (id).then (function (bytes) {
			
			return new Future<String> (function () {
				
				if (bytes == null) {
					
					return null;
					
				} else {
					
					return bytes.getString (0, bytes.length);
					
				}
				
			});
			
		}));
		
		#end
		
		return promise.future;
		
	}
	
	
}


#if !display
#if flash

























#elseif html5

























#else



#if (windows || mac || linux || cpp)





#end
#end

#if (openfl && !flash)

#end

#end