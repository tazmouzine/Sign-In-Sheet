# Sign in sheet on Ruby on Rails

# Hot to run on Linux

Tales Mousine (@tales-dias-mousine) - (https://www.linkedin.com/in/tales-mousine/)

### Requirements

- docker-compose version 1.22
- internet connection to download containers

### How to run

```
-- Clone this repository

Execute the commands

-- docker-compose build
-- docker-compose up -d
```

It will build the docker containers and start the application. This could take a while :-)
(depends on )

After that, you can see Rails top page on http://localhost:3000/.

### How to test

```
-- docker-compose exec web bundle exec rspec
```

### MySQL DUMP File

1. The documentation file can be founded on Docs path. 
