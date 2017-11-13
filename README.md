# My Onboaring Project One

## Description
This is my first project on SRE onboarding to understand the ruby gem implementation.

## SLO and SLI
* Availability: To be Defined
* Mean Response Time: To be Defined

## Architecture Diagram
```
+--------+        +------------------+         +---------+
|  App   | <--->  |  Ministore Gem   |  <--->  |  MySql  |
+--------+        +------------------+         +---------+
```

## Owner
[Setya Kurniawan](https://github.com/SetyaK)

## Contact and On-Call Information
[Setya Kurniawan](setya.kurniawan@bukalapak.com)

## Links

## Onboarding and Development Guide
### Prerequisite
1. Git,  
  [Guide](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
2. Ruby,  
  [Guide](https://www.ruby-lang.org/en/documentation/installation/)
3. Bundler,  
  [Guide](http://bundler.io/)
4. Mysql,  
  [Guide](https://dev.mysql.com/doc/refman/5.7/en/installing.html)
5. Sqllite3
### Setup
1. Install required modules  
  `$ bundle install`
2. Build gem  
  `$ gem build mini_store.gemspec`
3. Find builded gem file name, install gem  
  `$ gem install Ministore-x.x.x.gem`
### Development Guide
#### Using supplied bin/
1. Create .env file from .env.sample  
  `$ cp .env.sample .env`  
  Then modify it to match your configuration
2. Run `bin/mini_store` to test the gem  
  You can also modify it to test other functionality  
  Schema can be created by add call `MiniStore.init_schema`

## On-Call Runbooks

## F.A.Q.
