#!/usr/bin/env ruby
# http://bit.ly/ url from clipboard on osx - I trigger this from http://www.smileonmymac.com/TextExpander/

clip_url = `pbpaste`  # OSX dependency

unless clip_url.match(/^http/)
  puts clip_url
else
  %w[uri rubygems json].each {|l| require l }
  encoded_url = URI.encode(clip_url)
  curl_url_json = `curl --stderr /dev/null \"http://api.bit.ly/shorten?longUrl=#{ encoded_url }&version=2.0.1&login=yourbitlylogin&apiKey=yourbitlyapikey&history=1\"`
  bitly_result = JSON.parse(curl_url_json)
  print bitly_result["results"].values.first["shortUrl"]
end
