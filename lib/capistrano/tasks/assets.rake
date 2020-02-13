
Rake::Task['deploy:assets:precompile'].clear

namespace :deploy do
  namespace :assets do
    desc 'Precompile assets locally and then rsync to remote servers'
    task :precompile do
      %x{yarn install --check-files}
      %x{bundle exec rake assets:precompile assets:clean}

      on roles(fetch(:assets_roles)) do |server|
        %x{rsync -avr --exclude='.DS_Store' ./public/assets/ #{server.user}@#{server.hostname}:#{release_path}/public/assets/}
        %x{rsync -avr --exclude='.DS_Store' ./public/packs/ #{server.user}@#{server.hostname}:#{release_path}/public/packs/}
      end

      %x{bundle exec rake assets:clobber}
    end
  end
end
