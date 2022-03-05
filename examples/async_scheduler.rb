require 'benchmark'
require 'async/scheduler'

Benchmark.bm do |x|
  x.report('async/scheduler') do
    Thread.new do
      scheduler = Async::Scheduler.new
      Fiber.set_scheduler scheduler

      3.times do
        Fiber.schedule do
          # Instead of blocking while the response will be ready, the Fiber will invoke scheduler
          # to add itself to the list of waiting fibers and transfer control to other fibers
          sleep 1
        end
      end

      scheduler.run
    end.join
  end

  x.report('sync') do
    3.times do
      sleep 1
    end
  end
end
