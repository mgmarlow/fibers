require 'benchmark'
require 'fiber_scheduler'

Benchmark.bm do |x|
  x.report('fiber_scheduler') do
    Thread.new do
      Fiber.set_scheduler FiberScheduler.new

      3.times do
        Fiber.schedule do
          sleep 1
        end
      end
    end.join
  end

  x.report('blocking fibers') do
    Thread.new do
      3.times.map do
        Fiber.new do
          sleep 1
        end
      end.each(&:resume)
    end.join
  end

  x.report('sync') do
    3.times do
      sleep 1
    end
  end
end
