#!/bin/bash
echo "Run anonymize"
sed -e "s/<HOST>/${DB_HOST}/; s/<USER>/${DB_USER}/; s/<PASS>/${DB_PASS}/" ./config/env/magento2.yml.sample > ./config/env/magento2.yml
bundle exec rake project:anonymize[production]