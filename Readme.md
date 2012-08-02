# nokogiri-issue 741

Use rvm to create separate environments .rvmrc contains jruby 1.6.7.2@nokogiri-issue-741
.rvmrc-ruby-1.9.2-p290 contains ruby-1.9.2-p290@nokogiri-issue-741

run bundle install in each gemset then run

    ruby xpath.rb

    ➜  nokogiri-issue-741 git:(master) ✗ ruby -v
    jruby 1.6.7.2 (ruby-1.8.7-p357) (2012-05-01 26e08ba) (Java HotSpot(TM) 64-Bit Server VM 1.7.0_04) [darwin-x86_64-java]
    ➜  nokogiri-issue-741 git:(master) ✗ ruby xpath.rb
    Time to parse = 88.591
    ➜  nokogiri-issue-741 git:(master) ✗ ruby -v
    ruby 1.9.2p290 (2011-07-09 revision 32553) [x86_64-darwin11.4.0]
    ➜  nokogiri-issue-741 git:(master) ✗ ruby xpath.rb
    Time to parse = 0.43804
