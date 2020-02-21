# Dependencies
- redis
- sidekiq
- Amazon S3

# How to restart sidekiq
sudo systemctl status sidekiq

# How to generate dummy resume
```rake dummy_resume:generate email=neumerance@live.com name=MyResume2 template_name=shades_of_black```
