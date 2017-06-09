class TwitterStatusController < ApplicationController
  def index
    statuses = TwitterStatus.new
    if TwitterStatus.getTweetWords.present?
      @words = TwitterStatus.getTweetWords
    else
      @words = statuses.getStream
    end

    freq = @words.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
    @frequent = @words.sort_by{ |v| freq[v] }
  end

end
