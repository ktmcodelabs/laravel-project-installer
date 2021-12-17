# laravel-project-installer
Installer for laravel project

## What this installer does?
- Add permissions for "bootstrap/cache", "storage", "vendor" folder
- composer install / composer update
- Copy .env.example to .env
- Key generation
- DB migration
- DB Seeding

## To start installation of laravel project
First clone repo to project root folder and add execution permission to `install.sh`. Then run installer script
```
sudo chmod +x installer.sh
sudo ./installer.sh
```

For existing project, clone laravel project to your workspace.
Add `installer.sh` and `installation` folder with contents in your project root.
Then execute installer.sh

To setup fresh laravel project, Select 'y' on fresh installation prompt after running installer.sh
```
sudo ./install.sh
Start with fresh installation? [y,n] (Default n): y
```
