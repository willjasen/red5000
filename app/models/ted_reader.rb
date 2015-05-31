class TedReader < ActiveRecord::Base
  has_many :readings
  validates_presence_of :hostname

  def self.track
    enum = Enumerator.new do |yielder|
      hostname = Rails.application.secrets.hostname
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
      @current_voltage = @current_voltage.to_f / 10
    end
    
    document.xpath('LiveData/Power/MTU1').each do |mtu1|
      @current_power = mtu1.at_xpath('PowerNow').text
      @current_kva = mtu1.at_xpath('KVA').text

      @current_power = @current_power + " watts"
      @current_kva = @current_kva + " kilovolt-amperes"
    end
    
    reading = Reading.create(voltage: @current_voltage, power: @current_power, kva: @current_kva)
    reading.save
  end

end
