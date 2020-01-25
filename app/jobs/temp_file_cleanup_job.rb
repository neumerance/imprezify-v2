class TempFileCleanupJob < ApplicationJob
  queue_as :default

  def perform(file_path)
    FileUtils.rm file_path
  end
end
