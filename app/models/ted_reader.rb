class TedReader < ActiveRecord::Base
  has_many :readings
  validates_presence_of :hostname

  def track 
    url = "http://#{hostname}/api/LiveData.xml"
    client = HTTPClient.new
    content = ""
    
    client.get_content(url) do |chunk|
      content << chunk
    end
    
    document = Oga.parse_xml(content)
    document.xpath('LiveData/GatewayTime/MTU1').each do |mtu1|
      @hour = mtu1.at_xpath('Hour').text
      @minute = mtu1.at_xpath('Minute').text
      @second = mtu1.at_xpath('Second').text
      @month = mtu1.at_xpath('Month').text
      @day = mtu1.at_xpath('Day').text
      @year = mtu1.at_xpath('Year').text
      
      date = DateTime.new(:year, :month, :day, :hour, :minute, :second)
    end

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
    
    reading = Reading.create(voltage: @current_voltage, power: @current_power, kva: @current_kva, ted_reader_id: self.id)
    reading.save
  end

end
