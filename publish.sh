bundle exec middleman build --clean
aws s3 sync ./build/ s3://docs.brand.let.life --acl public-read
