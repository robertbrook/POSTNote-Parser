require 'rubygems'
require 'nokogiri'
require 'yaml'
require 'logger'

@log = Logger.new(STDOUT)
@log.formatter = proc do |severity, datetime, progname, msg|
  "[#{severity}] #{msg}\n"
end
@log.level = Logger::DEBUG

@doc = Nokogiri::XML(File.open("postnote.xml"))

def process(div)

@log.info(div.name)
@log.info(div.children.count)
@log.info(div.content)

if div.children.count == 0
@log.info("Skipped childless div")
end
end

@doc.xpath("//Document/Div").each do |div| 
process(div)
end 
