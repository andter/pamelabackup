class RegistrationsController < Devise::RegistrationsController
	before_filter :update_sanitized_params, if: :devise_controller?


end
