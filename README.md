# Imprezify.com
Professional resume generator

## Features
- Creative resume templates
- Secured online resume profile
- Easy to use forms

## Getting started

#### Dependencies
- Redis
- Ngrok
- Api2PDF (acquire an API key then put it  on  .env file)
- AWS s3 (acquire the S3 credentials and put it on .env file)

For local developments, do the following

```sh
git clone git@github.com:neumerance/imprezify-v2.git imprezify
cd imprezify
cp .env.sample .env
bundle install
rake db:setup
bundle exec rspec
```
Once all are green you can run the server
```sh
bundle exec rails s
```

#### Running seeder
Run
```sh
rake dummy_resume:generate email=neumerance@live.com name=MyResume2 template_name=shades_of_black
```

#### Making PDF  generation work
- Read https://github.com/mperham/sidekiq on how to run sidekiq (make sure redis is running)
- Create an account https://www.api2pdf.com/ and acquire an API key
- Run the ngrok ```sh ngrok http 3000```
- Use the link given  to browse the app and generate the resume

#### Deployment
This app is deployable using Capistrano
Check https://github.com/neumerance/imprezify-v2/tree/master/config/deploy and fillup relevant configs based on your server credentials

Should you have more questions? Feel free to contact me @ neumerance@live.com
