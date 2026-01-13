#!/usr/bin/env bash

# Exit immediately on error
set -e

########################
# CONFIGURATION
########################
APP_NAME="myapp"
APP_DIR="/var/www/$APP_NAME"
REPO_URL="https://github.com/your-org/your-repo.git"
BRANCH="main"

NGINX_SITE="/etc/nginx/sites-available/$APP_NAME"
NGINX_ENABLED="/etc/nginx/sites-enabled/$APP_NAME"

BACKUP_DIR="/var/backups/$APP_NAME"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

########################
# FUNCTIONS
########################
log() {
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1"
}

########################
# START DEPLOY
########################
log "Starting deployment of $APP_NAME"

# Ensure required directories exist
mkdir -p "$BACKUP_DIR"

# Backup current app (if exists)
if [ -d "$APP_DIR" ]; then
  log "Backing up current version"
  tar -czf "$BACKUP_DIR/${APP_NAME}_${TIMESTAMP}.tar.gz" "$APP_DIR"
fi

# Clone or update repo
if [ ! -d "$APP_DIR/.git" ]; then
  log "Cloning repository"
  rm -rf "$APP_DIR"
  git clone -b "$BRANCH" "$REPO_URL" "$APP_DIR"
else
  log "Updating repository"
  cd "$APP_DIR"
  git fetch origin
  git checkout "$BRANCH"
  git pull origin "$BRANCH"
fi

########################
# BUILD STEP (OPTIONAL)
########################
# Uncomment if needed
# log "Installing dependencies"
# npm install
# npm run build

########################
# PERMISSIONS
########################
log "Fixing permissions"
chown -R www-data:www-data "$APP_DIR"
chmod -R 755 "$APP_DIR"

########################
# NGINX CONFIG
########################
if [ ! -f "$NGINX_SITE" ]; then
  log "Creating NGINX config"

  cat <<EOF > "$NGINX_SITE"
server {
    listen 80;
    server_name example.com;

    root $APP_DIR;
    index index.html;

    location / {
        try_files \$uri \$uri/ =404;
    }
}
EOF

  ln -s "$NGINX_SITE" "$NGINX_ENABLED"
fi

########################
# TEST & RELOAD NGINX
########################
log "Testing NGINX configuration"
nginx -t

log "Reloading NGINX"
systemctl reload nginx

########################
# DONE
########################
log "Deployment completed successfully"


## END OF SCRIPT ##

########################
# USAGE NOTES
########################
# 1. Save this script as nginx_deployment.sh
# 2. Make it executable: chmod +x nginx_deployment.sh
# 3. Run it with sudo: sudo ./nginx_deployment.sh   
# 4. scp -i ~/.ssh/your-key.pem nginx_deployment.sh ubuntu@your-ec2-public-dns:/home/ubuntu/
# 5. SSH into your instance and execute the script
#    ssh -i ~/.ssh/your-key.pem ubuntu@your-ec2-public-dns
#    sudo ./nginx_deployment.sh
# 6. Ensure you have git installed: sudo apt-get install git -y
# 7. git clone https://github.com/you-org/nginx-deployment-scripts.git
# 8. Navigate to the directory: cd nginx-deployment-scripts
# 9. Run the script: sudo ./nginx_deployment.sh
# 10. If permission denied, run: sudo chmod +x nginx_deployment.sh
# 11. Then run again: sudo ./nginx_deployment.sh
