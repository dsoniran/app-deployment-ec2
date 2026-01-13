Note: All tasks are optional, start where you feel you will get the most value and do not worry if you do not complete everything. We will review this tomorrow and get everyone up to the same point.

Terminate all instances by 18:00.
One instance per person at a time. Do not have multiple instances running.
Use online resources where possible. Luke is available if you are completely stuck.

1. Document learning from today
- Cloud Intro
- SSH and SSH Key Pairs
- Virtual Machines
- EC2 deployment

Push to GitHub repo if possible

2. Redo the EC2 deployment. Document as you go. Remember:
- Name it accordingly
- AMI = Ubuntu 24.04
- Instance Type = t3.micro
- Reuse your key pair
- Reuse your SG (se-yourname-basic-sg)

3. Try to deploy Nginx web server:
- sudo apt update -y
- sudo apt upgrade -y
- sudo apt install nginx -y

Check your public IP in your broswer: http://IP-ADDRESS

4. Try to automate the nginx deployment by writing a bash script:
- What is a "shebang" and why do you need to add it to the top of the script?
- how can you get the script into your EC2 instance?
