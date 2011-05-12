class LinkExtractor

  LINK_MATCH = '[:\w\/\/\.\d\s\_\-\,\'\?\&\=]'
  TAG_MATCH  = '(<\s*a\s*(?:[\-\w\d.]*?\s*=\s*(?:[:\w\/\/\.\d\"\s\_\-\,\'? \&\=]*))*[/></a>]*)'
  HREF_MATCH  = "href=(?:[\"']*)(#{LINK_MATCH}*)(?:[\"']*)"

  # -----------------------------------------------------------
  # class methods
  # -----------------------------------------------------------
  class << self
    def parse_text(text)
      text.scan(/#{HREF_MATCH}/ix).flatten
    end

    def get_text_from_local_file(filename)
      f = File.open(filename, 'r')
      f.read.chomp
    end
  end
end
