# Vagrant VM

#### Requirements:

- **Vagrant** (Version 2.0.4)
- **VirtualBox** (Version 5.2.8 r121009 [QT5.6.2])  

#### Basic folder structure:

Folder  | Desciption
------------- | -------------
/vm  | The main folder of the vm.<br/>Will be the "synced" vagrant folder.
/vm/config     | Will containt all config files for the dev environment (like php.ini or my.ini).<br/>Note: The config files will be copied to the corerelated folders<br/> on "startup" by executing the "restart-webserver.sh" script.  
/vm/script     | Will contain all script-based files.<br/>The script "reload-script.sh" will copy all .sh-files within the vm/script/user<br/> folder to the /usr/local/bin folder, which allows the remote user to execute them.
/site  | Folder for the web "sites"

#### Start/Stop VM:

Run vagrant machine:
```
vagrant run
```
Stop vagrant machine:
```
vagrant halt
```
#### Basic options for PuTTY:
- Host Name: vagrant@127.0.0.1
- Port: 2222
- Password: vagrant
