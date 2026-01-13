# App Dependencies
==============================================================

The following dependencies are required to run the application:
- App code
- Linux (Ubuntu 24.04 LTS)
- Nginx
- NodeJS 20.x

---
# Create New Instance (AWS EC2)
==============================================================
- Names and tags
- AMI = Ubuntu 24.04
- Instance Type = t3.micro
- Key Pair
- Network settings, select edit
    - security group name
    - description
    - securtiy group rule 1
        - Type SSH 
        - Source 0.0.0.0/0
        - Port Range 22
    - securtiy group rule 2
        - Type HTTP
        - Source 0.0.0.0/0
        - Port Range 80
    - securtiy group rule 3
        - Type Custom TCP
        - Source 0.0.0.0/0
        - Port Range 3000
- Configure Storage 1x8GiB pg3 root volume


---
# Deploying bash script to EC2 instance
==============================================================

> NB: Go to your instance and select `Connect` then `SSH client` to find the Instance ID

1. On your terminal (or GitBash) Login to your instance using SSH 

    `ssh -i "se-dare-key-pair.pem" ubuntu@ec2-18-201-197-127.eu-west-1.compute.amazonaws.com`

2. Open a blank text file on your instance

    `sudo nano deploy-nginx.sh`

> NB. nano is a basic text editor

3. Paste contents of `deploy_nginx.sh` from VS Code to open file

4. Save the file by pressing
`Ctrl + X`

5. Confirm the file name
`y + Enter`

6. Check file content

    `cat deploy-nginx.sh`

7. Run the bash script

    `./deploy-nginx.sh`

8. If you are denied permission to run the file you can try:

    a. Adding permissions to execute by running the command:

    `sudo chmod +x nginx-deploy.sh`

    b. Run the previous command again

![alt text](nginx_homepage.png)

---
# Transfer files to EC2 instance using SCP
==============================================================
1. Open terminal on your local machine 

2. Navigate to the directory where your files are stored

     `cd path/to/your/files`

3. Use the SCP command to transfer files to your EC2 instance

    `scp -i "se-dare-key-pair.pem" ./nodejs20-se-test-app-2025.zip ubuntu@<your-ec2-public-dns>:/home/ubuntu/` 
> NB. replace <your-ec2-public-dns> with your instance\'s public DNS

4. Verify the file transfer by logging into your EC2 instance and listing the files

 `ssh -i "se-dare-key-pair.pem" ubuntu@<your-ec2-public-dns> 'ls -l /home/ubuntu/'`

> NB. replace <your-ec2-public-dns> with your instance\'s public DNS

5. You should see `./nodejs20-se-test-app-2025.zip` listed among the files in the `/home/ubuntu/` directory

---
# Unzip App
==============================================================
> NB. SCP copies one file at a time, so it is more efficient to move a compressed zip file.
To unzip it on the EC2 instance, we need to install the unzip package.

1. Install unzip

    `sudo apt install unzip -y`

2. Unzip file

    `sudo unzip nodejs20-se-test-app-2025.zip`

---
# Install Packages/Libraries
==============================================================
> NB. npm is the package manager for node.js packages/modules (Javascript libraries). When you install nodejs, it also installs npm.
Nodejs is a method to write Javascript backend apps such as APIs.

---
The App Dependency is NodeJS 20.x; however the latest version of NodeJS is newer. If we installed it directly on Linux, the newest version will be installed.
>NB. Ensure to specify the nodeJS version

1. Download nodeJS

    `sudo bash -c "curl -fsSL https://deb.nodesource.com/setup_20.x | bash -"`

2. Install nodeJS

    `sudo apt install -y nodejs`

3. Confirm the version of nodeJS

    `node -v` or `node --version`

---
# Run Application
==============================================================
1. Navigate to the folder the contains the package.json

    `cd nodejs20-se-test-app-2025/app`

2. Confirm you are in the correct location

    `ls`

3. Install the libraries from packages.json

    `npm install`
> NB. When actioning a complete install of packages, ensure to be in the same directory as packages.json

4. Run the application

    `npm start app.js`
> NB. `npm start <app.js>` can be run with a relative filepath

---
# Confirm Successful Deployment
1. Go to `Instance Summary` in your browser

2. Copy the `Public IP4` address of your instance

3. Paste it into the tab (ensure it is http and not https)

4. You should see the nginx homepage again

4. As the app is running on port 3000, not 80 (the default). Add `:3000` to the IP address

![alt text](sparta_test_app.png)