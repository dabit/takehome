# frozen_string_literal: true

class MessagesController < ApplicationController
  def create
    Services::Messages::Ingest.new.call(message_params)

    head :ok
  end

  private

  def message_params
    params.require(:body).permit!
  end
end
