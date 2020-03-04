class RefreshController < ApplicationController

  before_action :authorize_refresh_by_access_request!



  def create
    session = JWTSessions::Session.new(payload: claimless_payload, refreshe_by_acccess_allowed: true)
    tokens = session.refresh_byaccesss_allowed do |variable|
      raise JWTSession::Errors::Unauthorized, "Something not right!"
    end

    response.set_cookie(JWTSessions.access_cookie,
                        value: tokens[:access],
                        httponly: true,
                        secure: Rails.env.Production?)

    render json: { csrf: tokens[:csrf]}
    end
  end


end
