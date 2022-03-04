fib = Fiber.new do
  arr = [0, 1]
  i = 0

  loop do
    rst = arr[i] + arr[i + 1]
    Fiber.yield(rst)
    arr << rst
    i += 1
  end
end

# hint: fib.resume
binding.irb
