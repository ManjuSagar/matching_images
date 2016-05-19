class MatchingBase
  def self.matching_files
   core_lib  = File.join(File.dirname(__FILE__), 'matching_base')
   res =  Dir.glob(File.join(core_lib, '*.rb'))
   res
  end
end


