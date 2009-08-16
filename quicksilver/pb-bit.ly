#!/usr/bin/env ruby
# http://bit.ly/ url the clipboard on OSX

%w[uri rubygems json].each {|l| require l }

clip_url = IO.popen('pbpaste', 'r').read
output = ''

begin
  encoded_url = clip_url.match(/^http/) ? clip_url : "http://#{clip_url}" 
  encoded_url = URI.parse(URI.encode(encoded_url)).normalize.to_s

  curl_url_json = `curl --stderr /dev/null \"http://api.bit.ly/shorten?longUrl=#{ encoded_url }&version=2.0.1&login=yourbitlylogin&apiKey=yourbitlyapikey&history=1\"`
  bitly_result = JSON.parse(curl_url_json)
  output = bitly_result["results"].values.first["shortUrl"]
rescue
  output = clip_url
end
IO.popen('pbcopy', 'w').print(output)
