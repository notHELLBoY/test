#!/bin/bash

# تابع تولید آدرس IPv4 تصادفی
generate_ipv4() {
    echo "$((RANDOM % 256)).$((RANDOM % 256)).$((RANDOM % 256)).$((RANDOM % 256))"
}

# استفاده از API رایگان برای پیدا کردن کشور مرتبط با آدرس IPv4
get_country() {
    local ip=$1
    country=$(curl -s https://ipinfo.io/$ip/country)
    echo "Country: $country"
}

# پینگ گرفتن از آدرس IP
ping_ip() {
    local ip=$1
    ping -c 4 $ip
}

# اجرای اسکریپت
ip=$(generate_ipv4)
echo "Generated IP: $ip"
get_country $ip
ping_ip $ip
