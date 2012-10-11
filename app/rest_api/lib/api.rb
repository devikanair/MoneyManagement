require 'net/http'

class Api
  attr_accessor :url
  attr_accessor :uri

  def initialize
    @url = "http://localhost:3000/users"
    @uri = URI.parse @url
  end

  # Create an user using a predefined XML template as a REST request.
  def create(name="test")
    xml_req =
        "<account type='integer'>121345</account>
<cash type='float'>0.0</cash>
<email>1hello@hello.com</email>
<name>DevikaNair</name>
<password>devika</password>
<confirmation>devika</confirmation>"

    request = Net::HTTP::Post.new(@url)
    request.add_field "Content-Type", "application/xml"
    request.body = xml_req

    http = Net::HTTP.new(@uri.host, @uri.port)
    response = http.request(request)

    response.body
  end

  # Read can get all users with no arguments or
  # get one user with one argument.  For example:
  # api = Api.new
  # api.read 2 => one user
  # api.read   => all users
  def read(id=nil)
    request = Net::HTTP.new(@uri.host, @uri.port)

    if id.nil?
      response = request.get("#{@uri.path}.xml")
    else
      response = request.get("#{@uri.path}/#{id}.xml")
    end

    response.body
  end

  # Update an users using a predefined XML users as a REST request.
  def update(id, name="UpdatedName", email="test@testing.com")
    xml_req =
        "<?xml version='1.0' encoding='UTF-8'?>
    <user>
      <email type='string'>#{email}</email>
      <id type='integer'>#{id}</id>
      <name>#{name}</name>
    </user>"

    request = Net::HTTP::Put.new("#{@url}/#{id}.xml")
    request.add_field "Content-Type", "application/xml"
    request.body = xml_req

    http = Net::HTTP.new(@uri.host, @uri.port)
    response = http.request(request)

    # no response body will be returned
    case response
      when Net::HTTPSuccess
        return "#{response.code} OK"
      else
        return "#{response.code} ERROR"
    end
  end

  def delete(id)
    request = Net::HTTP::Delete.new("#{@url}/#{id}.xml")
    http = Net::HTTP.new(@uri.host, @uri.port)
    response = http.request(request)

    # no response body will be returned
    case response
      when Net::HTTPSuccess
        return "#{response.code} OK"
      else
        return "#{response.code} ERROR"
    end
  end

end