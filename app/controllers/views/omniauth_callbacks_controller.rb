# frozen_string_literal: true

class Views::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # app/controllers/users/omniauth_callbacks_controller.rb:
  def github
      @view = View.from_omniauth(request.env['omniauth.auth'])

      if @view.persisted?
        flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Github'
        sign_in_and_redirect @view, event: :authentication
      else
        session['devise.github_data'] = request.env['omniauth.auth'].except('extra') # Removing extra as it can overflow some session stores
        redirect_to new_view_registration_url, alert: @view.errors.full_messages.join("\n")
      end
  end
end
