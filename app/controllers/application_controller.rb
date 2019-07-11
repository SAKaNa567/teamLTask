class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token
    rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
    rescue_from ActiveRecord::RecordNotUnique, :with => :record_not_unique
    rescue_from ActiveRecord::RecordInvalid, :with => :record_invalid
    rescue_from ActiveRecord::RecordNotSaved, :with => :record_not_saved

    private
    def record_not_found(error)
      render :json => {:message => "record not found", :status => 404}
    end 

    def record_not_unique(error)
        render :json => {:error => "record should be unique", :status => 404 }
    end

    def record_invalid(error)
        render :json => {
          :message => "validation failed",
          :error => ValidationErrorsSerializer.new(error.record).serialize,
          :stauts => 404
        }
    end

    def record_not_saved(error)
        render :json => {:error => "record not saved", :status => 404 }
    end
end
