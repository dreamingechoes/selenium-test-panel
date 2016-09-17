class CaseTestsController < ApplicationController
  before_action :set_case_test, only: [:show, :edit, :update, :destroy]

  # GET /case_tests
  # GET /case_tests.json
  def index
    @case_tests = CaseTest.all
  end

  # GET /case_tests/1
  # GET /case_tests/1.json
  def show
    # Just an example in order to test jquery.json-viewer capabilities
    @json_object = {"menu": {
                    "id": "file",
                    "value": "File",
                    "popup": {
                      "menuitem": [
                        {"value": "New", "onclick": "CreateNewDoc()"},
                        {"value": "Open", "onclick": "OpenDoc()"},
                        {"value": "Close", "onclick": "CloseDoc()"}
                      ]
                    }
                  }}.to_json
  end

  # GET /case_tests/new
  def new
    @case_test = CaseTest.new
  end

  # GET /case_tests/1/edit
  def edit
  end

  # POST /case_tests
  # POST /case_tests.json
  def create
    @case_test = CaseTest.new(case_test_params)

    respond_to do |format|
      if @case_test.save
        format.html { redirect_to @case_test, notice: 'Case test was successfully created.' }
        format.json { render :show, status: :created, location: @case_test }
      else
        format.html { render :new }
        format.json { render json: @case_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /case_tests/1
  # PATCH/PUT /case_tests/1.json
  def update
    respond_to do |format|
      if @case_test.update(case_test_params)
        format.html { redirect_to @case_test, notice: 'Case test was successfully updated.' }
        format.json { render :show, status: :ok, location: @case_test }
      else
        format.html { render :edit }
        format.json { render json: @case_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /case_tests/1
  # DELETE /case_tests/1.json
  def destroy
    @case_test.destroy
    respond_to do |format|
      format.html { redirect_to case_tests_url, notice: 'Case test was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_case_test
      @case_test = CaseTest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def case_test_params
      params.require(:case_test).permit(:title, :description, :url, :timestamps)
    end
end
