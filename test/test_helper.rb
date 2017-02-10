require "minitest/autorun"
require "pry"
require "peddler-parsers"

I18n.enforce_available_locales = false

class MiniTest::Test

  def load_xml_fixture(type)
    file = File.expand_path("../fixtures/#{type}.xml", __FILE__)
    body = File.read(file)

    Nokogiri(body)
  end
end
