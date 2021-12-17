#!/bin/sh

# functions
setup(){

    case $freshInstall in
    y|Y)
        echo "Setup project...";;
    *)
        echo "Setup existing project...";;
    esac

    # update folder permissions
    echo "Updating folder permissions..."
    sudo chmod -R 775 storage/ bootstrap/cache/ vendor/

    # install composer dependency
    case $freshInstall in
    y|Y)
        echo "Skip install composer dependencies...";;
    *)
        echo "Installing composer dependencies..."
        composer install

        # copy .env.example to .env
        echo "Setup .env"
        cp .env.example .env

        # update permissions for .env
        sudo chmod 777 .env ;;
    esac

    # start application installation process
    php artisan application:install
    php artisan migrate
    php artisan db:seed

    # Install node dependency
    # npm install
}

removeInstall(){
    rm -r laravel-app
}

install(){
    echo "Starting fresh install of laravel application...";
    composer create-project laravel/laravel laravel-app
    mv laravel-app/* .
    mv laravel-app/.[!.]* .

    pwd

    # make install application command
    php artisan make:command InstallApplication
    cp installation/InstallApplication.php app/Console/Commands/

    setup "$freshInstall"

    # remove installation folder
    removeInstall
}

serve(){
    php artisan serve
}

# start script

read -p "Start with fresh installation? [y,n] (Default n): " freshInstall

case $freshInstall in
y|Y) install $freshInstall;;
*) setup;;
esac

# serve application
serve
