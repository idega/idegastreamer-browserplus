require 'rexml/document'
include REXML
#to import see below
#bp_require "a_local_ruby_file.rb"  


rubyCoreletDefinition = {    
  'class' => "IdegaStreamingInstance",    
  'name' => "IdegaStreaming",    
  'major_version' => 0,    
  'minor_version' => 0,    
  'micro_version' => 2,    
  'documentation' => 'Idega Live Streaming',    
  'functions' =>    
  [    
    {    
      'name' => 'StartStream',    
      'documentation' => "Start a new live video stream",    
      'arguments' => [    
        {    
          'name' => 'streamname',    
          'type' => 'string',    
          'documentation' => 'The name of the stream e.g. mylivestream',    
          'required' => true    
        },
        {    
          'name' => 'streamer',    
          'type' => 'string',    
          'documentation' => 'URL to the streaming service e.g rtmp://streaming.idega.com',    
          'required' => true    
        } 
      ]    
    }      
  ]     
}  

#http://browserplus.yahoo.com/developer/service/ruby/
class IdegaStreamingInstance

  def initialize(context)    
  	#The keys in the 'context' argument follow:
	#uri is a string containing a URI of the current client. This is usually the full URL to the webpage that is interacting with browserplus. In the case of a native local application interacting with browserplus it should be a URI with a method of 'bpclient' (i.e. bpclient://CLIENTIDENTIFIER').
	#corelet_dir DEPRECATED, use service_dir instead.
	#service_dir is an absolute path to the directory containing the files distributed with the service.
	#data_dir is a absolute path to where the service should store any data that needs to persist.
	#temp_dir is a directory that may be used for temporary data. it will be unique for every instance, and will be purged when the instance is deallocated.
	#locale The locale of the end user to which strings, if any, should be localized.
	#userAgent The client user-agent string.
	#clientPid The process ID of the client.
  end    
    
  def StartStream(transaction, args)    

	#File.open('/Users/eiki/Desktop/test.txt', 'w') {|f| f.write('blabalablablab') }
	file = File.open('streaming-utf8.xml','r')
	doc = Document.new(file)
	streamname = args['streamname']
	streamer = args['streamer']
	#bp_log("info",args)
	root = doc.root
	#bp_log("info", "Current value #{root.elements[1].elements['output'].elements['stream']}")
	root.each_element("//stream"){|stream| stream.text=streamname}
	root.each_element("//url"){|url| url.text=streamer}

	
	savefile = File.new('/Users/eiki/Desktop/jwplayer/streaming-changed.xml', 'w')
	savefile << doc 
	savefile.close

#run a script
#bb = IO.popen("Open /Applications/Firefox.app")
#b = bb.readlines
#puts b.join

    transaction.complete("Starting stream : #{streamname} on streamer : #{streamer} ")    
    
  end   
end  
#    r - Open a file for reading. The file must exist.
#w - Create an empty file for writing. If a file with the same name already exists its content is erased and the file is treated as a new empty file.
#a - Append to a file. Writing operations append data at the end of the file. The file is created if it does not exist.
#r+ - Open a file for update both reading and writing. The file must exist.
#w+ - Create an empty file for both reading and writing. If a file with the same name already exists its content is erased and the file is treated as a new empty file.
#a+ - Open a file for reading and appending. All writing operations are performed at the end of the file, protecting the previous content to be overwritten. You can reposition (fseek, rewind) the internal pointer to anywhere in the file for reading, but writing operations will move it back to the end of file. The file is created if it does not exist.


      # this will take a while, so thread it  
  #Thread.new(transaction, args['callback']) do |tx,callback |  
  #  (1..10).each do |x|  
      # calling into javascript  
  #    callback.invoke("Howdy there, for the #{x}th time!")  
  #    sleep 0.5  
  #  end  
  #  tx.complete("Goodbye for now.")  
  #end  
    
       
#complete A method that takes a single argument which will be the return value passed to Javascript. This function completes the transaction.
#error A method that takes two optional arguments which will end the transaction and return an error value to Javascript. The first optional argument is an 'error code' that will be passed up to Javascript. The second optional argument is a verbose error code which should deliver more information about what went wrong to the Javascript developer using the service.
#Calling #complete:
#transaction.complete({"this"=>"is", "theReturnValue" => 77});  
#Calling #error:
#transaction.error("parseError", "the '#{argName}' argument was syntactically incorrect");  
                  
                  
  #logging
  #bp_log("info", "log something #{msg}")  
#  The logfile can be found in the following locations on different platforms:
#OSX:
#$HOME/Library/Application Support/Yahoo!/BrowserPlus/[platform version]/[uuid]/BrowserPlusCore.log
#Windows XP:
#%USERPROFILE%\Local Settings\Application Data\Yahoo!\BrowserPlus\[platform version]\[uuid]\BrowserPlusCore.log
#Windows Vista: 
#%HOMEPATH%\AppData\LocalLow\Yahoo!\BrowserPlus\[platform version]\[uuid]\BrowserPlusCore.log
  
     
