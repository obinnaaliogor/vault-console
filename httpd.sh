
#!/bin/bash  
 sudo useradd simon  
 sudo yum install httpd -y 
 sudo systemctl start httpd
 sudo systemctl enable httpd 
 sudo echo "DevOps is good" >> /var/www/html/index.html 
 sudo echo "<h1>Welcome to Engr Obinna Aliogor's Blog</h1>" >> /var/www/html/index.html
