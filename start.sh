#!/bin/bash
echo "Run anonymize"
sed -e "s/<HOST>/${DB_HOST}/; s/<USER>/${DB_USER}/; s/<PASS>/${DB_PASS}/" ./config/env/magento2.yml.sample > ./config/env/magento2.yml
cp ./config/project/${ANONYMIZE_TYPE}.json ./config/project/${DB_NAME}.json
bundle exec rake project:anonymize[${DB_NAME}]