require 'rubygems'
require 'nokogiri'

def self.parse_params(node)
  params={}
  node.xpath('./param').each do |p|
    subparams = parse_params p
    if(subparams.length > 0)
      if(not params.has_key? p.attributes['name'].value)
        params[p.attributes['name'].value] = subparams
      else
        if(params[p.attributes['name'].value].is_a? Array)
          params[p.attributes['name'].value] << subparams
        else
          value = params[p.attributes['name'].value]
          params[p.attributes['name'].value] = [value,subparams]
        end
      end
    else
      params[p.attributes['name'].value]=p.text
    end
  end
  params
end

doc = Nokogiri::XML(File.open("play.xml"))
start = Time.now
doc.xpath('.//category').each do |c|
  c.xpath('programformats/programformat').each do |p|
    p.xpath('./modules/module').each do |m|
     parse_params(m) 
    end
  end
end
stop = Time.now

puts "Time to parse = #{stop - start}"
