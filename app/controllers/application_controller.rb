class ApplicationController < ActionController::Base
  # DO NOT remove/change rescue_from logic, it's a part of ex_5
  rescue_from NameError, with: :handle_name_error

  private

  def handle_name_error(error)
    puts 'Server freezes for 30sec. Wait or restart :)'
    30.times do |index|
      puts 30 - index
      sleep(1)
    end
    puts 'Server freezes sleep over'
    raise error
  end
end
