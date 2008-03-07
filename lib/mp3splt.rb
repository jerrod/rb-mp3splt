class Mp3splt
  
  attr_accessor :input_file, :output_filename, :output_directory, :command_line
  
  def initialize(args={})
    self.input_file = args[:input_file]
    self.output_filename = args[:output_filename]
    self.output_directory = args[:output_directory]
    raise ArgumentError, "No input file specified." unless self.input_file
    raise ArgumentError, "No output filename specified." unless self.output_filename
    raise ArgumentError, "No output directory specified." unless self.output_directory
    self.command_line = ['mp3splt',"-q", "-d #{self.output_directory}", "-o #{self.output_filename}", self.input_file, '0.0', '0.10'].select{|x| !(x.nil? || x.empty?)}.join(' ')
  end

  def cut!
    system command_line
  rescue
    false
  end

end