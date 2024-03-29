# frozen_string_literal: true

require 'test_helper'

class PostmailerMailerTest < ActionMailer::TestCase
  test 'post_created' do
    mail = PostmailerMailer.post_created
    assert_equal 'Post created', mail.subject
    assert_equal ['to@example.org'], mail.to
    assert_equal ['from@example.com'], mail.from
    assert_match 'Hi', mail.body.encoded
  end
end
