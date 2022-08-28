class EmploymentsController < ApplicationController
	before_action :set_person
	def new
		@employment = @person.employments.new
	end
	def create
		@person = Person.find(params[:person_id])
		
		@employment = @person.employments.new(employment_params)
		respond_to do |format|
			if @employment.save
				format.turbo_stream { render turbo_stream: turbo_stream.prepend('employments', partial: 'employments/employment', locals: {employment: @employment}) }

        format.html { redirect_to person_url(@person), notice: "Employment was successfully created." }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
		end
	end

	private
	def set_person
		@person = Person.find(params[:person_id])
	end
	def employment_params
		params.require(:employment).permit(:employer, :date_started, :date_ended)
	end
end