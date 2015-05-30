class TedReader < ActiveRecord::Base
  validates_presence_of :hostname

  def self.track
    enum = Enumerator.new do |yielder|
      url = "http://#{hostname}/api/LiveData.xml"
      user = ""
      password = ""
      client = HTTPClient.new
      client.set_auth(url, user, password)
      client.get(url) do |chunk|
        yielder << chunk
      end
    end

    document = Oga.parse_xml(enum)
    document.xpath('LiveData/Voltage/MTU1').each do |mtu1|
      @current_voltage = mtu1.at_xpath('VoltageNow').text
      puts @current_voltage
    end
  end

end
