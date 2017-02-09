# API DOCS for BRANDs

Source code for http://docs.brand.let.life


### Contribute

Clone the repo and initialize

```shell
git clone git@github.com:AD2014/docs-brand.git
bundle install          ## Install ruby's gems
```

Then serve the pages on localhost

```shell
bundle exec middleman
```

`middleman` will rebuild on change so you save changes you just need to refresh your browser.

### Publish

Only if you have a valid AWS user (and the awscli package installed)

```shell
bash ./publish.sh
```

### Credits

created with [tripit/slate](https://github.com/lord/slate)
