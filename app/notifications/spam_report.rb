# frozen_string_literal: true

# To deliver this notification:
#
# SpamReport.with(post: @post).deliver_later(current_user)
# SpamReport.with(post: @post).deliver(current_user)

class SpamReport < Noticed::Base
  # Add your delivery methods
  #
  # deliver_by :database
  # deliver_by :email, mailer: "UserMailer"
  deliver_by :slack, url: :url_for_slack, format: :slack_payload

  # Add required params
  #
  param :email

  # Define helper methods to make rendering easier.
  #
  def message
    "Spam report received for #{params[:email]}"
  end

  def slack_payload
    { text: message, username: 'SpamNot', channel: slack_channel }
  end

  def slack_channel
    Rails.configuration.takehome.slack_channel
  end

  def url_for_slack
    Rails.configuration.takehome.slack_url
  end
end
