ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  private

  def setup_transactions
    @t_1 = transactions(:t_1)
    @t_2 = transactions(:t_2)
    @t_3 = transactions(:t_3)
    @t_4 = transactions(:t_4)
    @bad_1 = transactions(:bad_1)
  end

  def setup_users
    @phil = users(:phil)
    @jill = users(:jill)
  end

  def setup_payers
    @captain = payers(:captain)
    @stoker = payers(:stoker)
    @starbucks = payers(:starbucks)
  end
end
