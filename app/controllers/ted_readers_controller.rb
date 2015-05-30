class TedReadersController < ApplicationController
  before_action :set_ted_reader, only: [:show, :edit, :update, :destroy]

  # GET /ted_readers
  # GET /ted_readers.json
  def index
    @ted_readers = TedReader.all
  end

  # GET /ted_readers/1
  # GET /ted_readers/1.json
  def show
    enum = Enumerator.new do |yielder|
      url = "http://#{@ted_reader.hostname}/api/LiveData.xml"
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
    end
  end

  # GET /ted_readers/new
  def new
    @ted_reader = TedReader.new
  end

  # GET /ted_readers/1/edit
  def edit
  end

  # POST /ted_readers
  # POST /ted_readers.json
  def create
    @ted_reader = TedReader.new(ted_reader_params)

    respond_to do |format|
      if @ted_reader.save
        format.html { redirect_to @ted_reader, notice: 'Ted reader was successfully created.' }
        format.json { render :show, status: :created, location: @ted_reader }
      else
        format.html { render :new }
        format.json { render json: @ted_reader.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ted_readers/1
  # PATCH/PUT /ted_readers/1.json
  def update
    respond_to do |format|
      if @ted_reader.update(ted_reader_params)
        format.html { redirect_to @ted_reader, notice: 'Ted reader was successfully updated.' }
        format.json { render :show, status: :ok, location: @ted_reader }
      else
        format.html { render :edit }
        format.json { render json: @ted_reader.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ted_readers/1
  # DELETE /ted_readers/1.json
  def destroy
    @ted_reader.destroy
    respond_to do |format|
      format.html { redirect_to ted_readers_url, notice: 'Ted reader was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ted_reader
      @ted_reader = TedReader.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ted_reader_params
      params.require(:ted_reader).permit(:hostname)
    end
end
