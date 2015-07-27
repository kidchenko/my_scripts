require 'open-uri'
require 'HTTParty'
require 'date'

class Skyscanner
  include HTTParty
  base_uri "http://partners.api.skyscanner.net/apiservices/"
  debug_output

  def initialize(key)
    self.class.default_params apiKey: key
    remote_ip = open("http://whatismyip.akamai.com").read
    @options = { headers: {"Accept" => "application/json", "X-Forwarded-For" => remote_ip} }
  @market = "BR"
    @currency = "BRL"
    @locale = "pt-BR"
    @originPlace = "SAOA-sky"
    @destinationPlace = "BR-sky"
    @outboundPartialDate = "anytime"
    @inboundPartialDate = "anytime"

  end

  def flight_to_anywhere
    self.class.get("/browsequotes/v1.0/#{@market}/#{@currency}/#{@locale}/#{@originPlace}/#{@destinationPlace}/#{@outboundPartialDate}/#{@inboundPartialDate}", @options)

  end
end