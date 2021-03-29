# create build
./build.sh

# install dependencies required for our application to run
ansible-playbook -i ansible/inventory.yml ansible/playbooks/install.yml

# copy over application files to webserver
ansible-playbook -i ansible/inventory.yml ansible/playbooks/copy_files.yml

# setup mysql, create users, datbase etc
ansible-playbook -i ansible/inventory.yml ansible/playbooks/mysql.yml

# finally, start application
ansible-playbook -i ansible/inventory.yml ansible/playbooks/start_app.yml
