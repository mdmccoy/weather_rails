class ApiInterfacesController < ApplicationController
  def location; end

  def display
    weather_response = HTTParty.get("https://simple-weather.p.mashape.com/weather?lat=#{params['api_interface']['lat']}&lng=#{params['api_interface']['lon']}",
                                    headers: {
                                      'X-Mashape-Key' => ENV['MASHAPE_KEY'],
                                      'Accept' => 'text/plain'
                                    })

    @weather = weather_response.parsed_response.split(',')

    city = @weather[1].split(' ')[2]

    condition = @weather[1].split(' ')[0].downcase

    temp = @weather[0].split(' ')[0]

    unit = if @weather[0].split(' ')[1] == 'c'
             'celsius'
           else
             'fahrenheit'
    end

    @weather = "The temperature in #{city} is #{temp} degrees #{unit}. The weather is #{condition}."
   end
end
