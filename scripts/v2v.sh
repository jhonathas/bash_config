alias v2v_test_prepare='rake db:drop RAILS_ENV=test && rake db:create RAILS_ENV=test && rake db:migrate RAILS_ENV=test'
alias v2v_device_ios='cordova run ios --device && idevicesyslog -u fda352b5c0bd26e3ee471d0b2a113ef1c85c4f4d'
alias v2v_device_android='cordova run android --device && adb lolcat | grep mlog'
alias v2v_run_tests='rake test:models && rake test:controllers'
