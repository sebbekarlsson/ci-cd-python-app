tar czf app.tar.gz application/*


ansible-playbook -i ansible/inventory.yml ansible/playbooks/install.yml
ansible-playbook -i ansible/inventory.yml ansible/playbooks/copy_files.yml
ansible-playbook -i ansible/inventory.yml ansible/playbooks/mysql.yml
ansible-playbook -i ansible/inventory.yml ansible/playbooks/start_app.yml
