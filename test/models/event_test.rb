require "test_helper"

describe Event do
  let(:event) { Event.new }

  it { assert_respond_to(event, :name) }
  it { assert_respond_to(event, :day) }
  it { assert_respond_to(event, :start_time) }
  it { assert_respond_to(event, :end_time) }
end
