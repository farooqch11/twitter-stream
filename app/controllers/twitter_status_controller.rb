class TwitterStatusController < ApplicationController
  def index
    statuses = TwitterStatus.new
    statuses.getStream

  end

  def getstatus

  end

end
