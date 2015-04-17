# ha_demoqa


This repository contains tests of the ecommerce site located at store.demoqa.com

Pre-requisites:
- curl installed
- git installed
- bash or zsh shell available

Assumptions:
- The POM assumes that navigation through UI is not always needed to get to a page. So some pages can be accessed with direct URL that may be generated.
- Assumes that given small number of tests a test data abstraction system is not needed to abstract data the way the POM abstracts site functionality
- Assumes a fresh browser between each test to reset environment
- Assumes an empty initial shopping cart. Saw this issue with test at last momemnt last night. Will repair this if I get time
 

##Steps to setup environment in Linux or OS X and run tests. Commands are all run and tested in bash and zsh.

1) Install Ruby. The instructions below are for RVM, but if you have your own Ruby then that can be used

    curl -sSL https://get.rvm.io | bash -s stable
    rvm install 2.1
    rvm use 2.1

2) Check if Bundler is installed. If bundler is not shown in results of the first command run the second

    gem list | grep bundler
    gem install bundler #if bundler was not present in previous command
    
3) Checkout tests

    cd <a directory of your choice to run these in>
    git clone https://github.com/mmorast/ha_demoqa
    
4) Run bundler to install gems
 
    cd <test directory in repository checkout>
    bundle install
    
5) Run tests 

    ruby test_demoqa.rb
    
At this point the tests will have run and returned results

