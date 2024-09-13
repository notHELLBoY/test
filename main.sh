#!/bin/bash

# تابع تولید آدرس IPv4 تصادفی
generate_ipv4() {
    echo "$((RANDOM % 256)).$((RANDOM % 256)).$((RANDOM % 256)).$((RANDOM % 256))"
}

# پینگ گرفتن از آدرس IP
ping_ip() {
    local ip=$1
    echo "Pinging IP: $ip"
    ping -c 1 -W 1 $ip &> /dev/null
    
    if [ $? -eq 0 ]; then
        echo "Ping successful!"
    else
        echo "Ping failed!"
    fi
}

# تعداد آدرس‌های IP که می‌خواهیم اسکن کنیم
num_ips=20

# اجرای اسکریپت
for ((i=1; i<=num_ips; i++)); do
    ip=$(generate_ipv4)
    echo "Generated IP: $ip"
    ping_ip $ip
    echo "-----------------------"
done
