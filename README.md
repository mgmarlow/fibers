# Fibers

[![Netlify Status](https://api.netlify.com/api/v1/badges/ad8466d0-4e34-46f0-b6b4-50b91a1f2981/deploy-status)](https://app.netlify.com/sites/elegant-blackwell-f11d7c/deploys)

The introduction of non-blocking Fibers in Ruby 3 marks an exciting milestone for the future of Ruby concurrency. This project serves as an introduction and a reference for those looking to understand more about Fibers and how Ruby (specifically, MRI) handles concurrency.

## Run the examples

> Requires Ruby `3.1.0`+.

```
gh repo clone mgmarlow/fibers
bundle install
bundle exec ruby examples/fib.rb
```

## Notes and references

- View the [glossary](./glossary.md).
- Ruby does not ship with a default implementation of the [`Fiber::SchedulerInterface`](https://docs.ruby-lang.org/en/master/Fiber/SchedulerInterface.html). Samuel William offers a great reference implementation: [async gem](https://github.com/socketry/async/blob/main/lib/async/scheduler.rb).
- Watch Samuel William's RubyKaigi talk on [Scalable Concurrency for Ruby 3](https://youtu.be/Y29SSOS4UOc).
- Bruno Sutic has two great posts about the [Ruby Fiber Scheduler](https://brunosutic.com/blog/ruby-fiber-scheduler) and the [Async Ruby](https://brunosutic.com/blog/async-ruby) gem.
- Samuel Williams original feature request: [Light-weight scheduler for improved concurrency](https://bugs.ruby-lang.org/issues/16786).
- [Working with Ruby Threads](https://workingwithruby.com/wwrt/), a fantastic book by Jesse Storimer on Ruby threads.
