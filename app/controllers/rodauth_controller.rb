class RodauthController < ApplicationController
  skip_before_action :authorization
end
