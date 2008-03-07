require 'test/unit'
MP3SPLT_ROOT = "#{File.dirname(__FILE__)}/.."

class Mp3spltTest < Test::Unit::TestCase
  # Replace this with your real tests.
  require "mp3splt"
  
  def test_initialize
    assert mp3 = Mp3splt.new(:input_file => File.join([MP3SPLT_ROOT,"test","assets","test.mp3"]), 
                             :output_filename => "test_converted.mp3", 
                             :output_directory => File.join([MP3SPLT_ROOT,"test","assets"])
                            )
  end
  
  def test_wont_cut
    mp3 = Mp3splt.new(:input_file => File.join([MP3SPLT_ROOT,"test","assets","test_not_there.mp3"]), 
                      :output_filename => "test_converted.mp3", 
                      :output_directory => File.join([MP3SPLT_ROOT,"test","assets"])
                     )
    assert !mp3.cut!  
  end

  def test_cut
    mp3 = Mp3splt.new(:input_file => File.join([MP3SPLT_ROOT,"test","assets","test.mp3"]), 
                      :output_filename => "test_converted.mp3", 
                      :output_directory => File.join([MP3SPLT_ROOT,"test","assets"])
                     )
    assert mp3.cut!    
  end
end
