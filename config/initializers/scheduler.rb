require 'rufus-scheduler'

s = Rufus::Scheduler.singleton

if $PROGRAM_NAME.match?('bin/rails') && Rails.const_defined?( 'Server')
  s.every '10s' do
    unless $exiting_rails
      UpdateTickerJob.perform_later
    end
  end
end