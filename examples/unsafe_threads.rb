require "minitest/autorun"

# Example from Jesse Storimer's Working with Ruby series
# https://workingwithruby.com/wwrt/
class FileUploader
  def initialize(files)
    @files = files
  end

  def upload
    threads = []

    @files.each do |(filename, file_data)|
      threads << Thread.new {
        status = upload_to_s3(filename, file_data)
        results << status
      }
    end

    threads.each(&:join)
  end

  # CAUTION: This isn't thread-safe!
  def results
    @results ||= Queue.new
  end

  def upload_to_s3(filename, file)
    # omitted
  end
end

# Try to reproduce the race condition. Test is flaky.
class TestFileUploader < Minitest::Test
  def setup
    # 20 files, 20 threads
    @files = (0..20).inject({}) do |hsh, i|
      hsh["boots#{i}.png"] = '*pretend png data*'
      hsh["shirts#{i}.png"] = '*pretend png data*'
      hsh
    end
  end

  def test_that_size_is_always_42
    100.times do
      uploader = FileUploader.new(@files)
      uploader.upload
      assert_equal 42, uploader.results.size
    end
  end
end
