# frozen_string_literal: true

require 'test_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest
  test 'POST #create' do
    stub_request(:post, Rails.configuration.takehome.slack_url)

    post messages_path, params: {
      body: {
        RecordType: 'Bounce',
        Type: 'SpamNotification',
        TypeCode: 512,
        Name: 'Spam notification',
        Tag: '',
        MessageStream: 'outbound',
        Description: 'The message was delivered, but was either blocked by the user, or classified as spam, bulk mail, or had rejected content.',
        Email: 'zaphod@example.com',
        From: 'notifications@honeybadger.io',
        BouncedAt: '2023-02-27T21:41:30Z'
      }
    }, as: :json

    assert_response :ok
  end
end
