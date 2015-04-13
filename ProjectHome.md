Mp3splt


A wrapper for the command line tool mp3splt.

Requires the mp3splt binary to be installed. http://mp3splt.sourceforge.net/mp3splt_page/home.php

Install on OSX using macports
```
sudo port install mp3splt
```

Example

```
class Track < ActiveRecord::Base
  file_column :filename, :root_path => RAILS_ROOT, :web_root => ""
  file_column :sample,   :root_path => UPLOAD_ROOT, :web_root => UPLOAD_WEB

  def generate_sample
    sample = Mp3splt.new( :input_file=>self.filename, 
                            :output_filename=>"sample.mp3", 
                            :output_directory=>self.filename_dir)
    sample.cut!
    self.update_attributes(:sample => File.open(sample_temp))
  rescue
    logger.error("Unable to create sample for #{self.id} - #{self.title}")
  end
end
```
Copyright (c) 2008 [Blavos - !Indierockmedia](Jerrod.md), released under the MIT license
