# What is systemd and systemctl?
systemd is a Linux initialization system and service manager. systemd provides a logging daemon and other tools and utilities to help with common system administration tasks.

# Its primary component is a "system and service manager" — an init system used to bootstrap user space and manage user processes.

# systemctl - is a controlling interface and inspection tool for the systemd. You use this tool to perform administrative tasks and interact with systemd.


# Create custom Linux service:


As a demo use the following script `custom_service.sh` Bash script file:

    DATE=`date '+%Y-%m-%d %H:%M:%S'`
    echo "Custom service started at ${DATE}" | systemd-cat -p info

    while :
    do
    echo "Looping...";
    sleep 30;
    done

The script logs the time and runs every 30 seconds

# Move the script to /usr/bin/ and make it executable:

    sudo mv custom_service.sh /usr/bin/custom_service.sh
    sudo chmod +x /usr/bin/custom_service.sh

# Create a Unit file to define a systemd service:

    [Unit]
    Description=Custom systemd service.

    [Service]
    Type=simple
    ExecStart=/bin/bash /usr/bin/custom_service.sh

    [Install]
    WantedBy=multi-user.target

Move the unit file to /etc/systemd/system and give it permissions:

    sudo mv <service_name>.service /etc/systemd/system/<service_name>.service
    sudo chmod 644 /etc/systemd/system/<service_name>.service

# Start the service:
     sudo systemctl start <service_name>


# Check the status of the service:

    sudo systemctl status <service_name>

# To enable service on machine startup when the system boots use:

    sudo systemctl enable <service_name>

# To stop and restart service use:

    sudo systemctl stop <service_name>
    sudo systemctl restart <service_name>