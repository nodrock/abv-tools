package abvex;
/**
 * AbstractMachine entry class App
 **/
import openfl.system.Capabilities;

using abv.lib.CC;
 
typedef SM = abvex.sys.openfl.SM;
typedef FS = abvex.sys.openfl.FS;
typedef AU = abvex.sys.openfl.AU;


class AM extends SM{

	public static var verbose 	= DEBUG;
	public static var delayExit = .0;
	public static var silent 	= false;
	public static var logFile	= "";
	public static var colors 	= true;
	public static var sound 	= false; 
	public static var WIDTH		= .0;
	public static var HEIGHT	= .0;
	public static var trace = haxe.Log.trace; 
	public static var ORIENTATION(get,never):Bool;
	static var _ORIENTATION = false;
	static function get_ORIENTATION(){ return WIDTH >= HEIGHT ? true : false;} 
	
	public inline function new(id:String)
	{
		super(id); 
	}// new()
	
	override function setSize()
	{
		super.setSize();
		WIDTH = width_;
		HEIGHT = height_;
	}// setSize()

	function exit()
	{
#if flash 
		flash.system.System.exit(0);
#elseif (js && gui) 
		Browser.window.close();
#elseif (ios || android)
#else
		Sys.exit(0);
#end 
	}// exit()

/**
 * AbstractMachine properties
 **/
 	public static function info()
	{
		var lang = "",os = CC.OS,home = "",run = "cpp";
// TODO: cpp get width...
		var width = .0, height = .0, dpi = .0;
#if cpp		
		try lang = Sys.getEnv("LANG") catch(m:Dynamic){} 
		try home = Sys.getEnv("HOME") catch(m:Dynamic){}
	#if neko 
			run = "neko";
	#elseif windows
			try home = Sys.getEnv("USERPROFILE") catch(m:Dynamic){}  
	#end
#elseif flash 
		width = Capabilities.screenResolutionX;
		height = Capabilities.screenResolutionY;
		dpi = Capabilities.screenDPI;
		lang = Capabilities.language.substr(0, 2);
		run = "flash";
#elseif (js && gui)
		width = Browser.window.innerWidth;
		height = Browser.window.innerHeight;
		dpi = Browser.window.devicePixelRatio;
		lang = Browser.navigator.language.substr(0, 2); 
		run = "js";
#end

		if(lang.good())lang = lang.substr(0,2);

 		var r = {width:width,height:height,dpi:dpi,lang:lang,os:os,home:home,run:run};
		return r;
	}// info()
///	
#if gui
	public static inline function fsGetText(path:String)return FS.getText(path);
	public static inline function playSound(path:String)if(sound) AU.playSound(path);
	public static inline function playMusic(path:String)if(sound) AU.playMusic(path);
#end
}// abv.AM
