load 'link_extractor.rb'
require 'minitest/autorun'

class TestLinkExtractor < MiniTest::Unit::TestCase
  def test_parse_text_and_extract_valid_uri
    assert_equal LinkExtractor.parse_text(%Q{<a href="http://example.com">Link</a>}), 
       ["http://example.com"]
  end

  def test_parse_text_if_text_contains_multiple_link_tags
    assert_equal LinkExtractor.parse_text(%Q{<a href="http://example.com">Link1</a><a href="http://example.net">Link2</a>}), 
    ["http://example.com", "http://example.net"]
  end

  def test_parse_text_with_multiline_text
    assert_equal LinkExtractor.parse_text(%Q{<a href="http://example.com">Link1</a>
    <br/>
    <a href="http://example.net">Link2</a>
    }), ["http://example.com", "http://example.net"]
  end

  def test_get_text_from_local_file
    assert_equal LinkExtractor.get_text_from_local_file('test_file.html'), 'test'
  end

  def test_get_text_from_internet_web_page
    assert_equal LinkExtractor.get_text_from_internet('http://google.com'), 'some longish file'
  end
end
