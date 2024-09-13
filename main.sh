#!/bin/bash

# تابع تولید آدرس IPv4 تصادفی
generate_ipv4() {
    echo "$((RANDOM % 256)).$((RANDOM % 256)).$((RANDOM % 256)).$((RANDOM % 256))"
}

# استفاده از API رایگان برای پیدا کردن کشور مرتبط با آدرس IPv4
get_country() {
    local ip=$1
    country=$(curl -s https://ipinfo.io/$ip/country)
    
    # چک کردن اینکه آیا درخواست به درستی انجام شده یا نه
    if [ -z "$country" ]; then
        echo "Country information not available for IP: $ip"
    else
        echo "Country: $country"
    fi
}

# پینگ گرفتن از آدرس IP
ping_ip() {
    local ip=$1
    echo "Pinging IP: $ip"
    
    # تست پینگ با استفاده از 4 بسته
    if ping -c 4 $ip > /dev/null; then
        echo "Ping successful!"
    else
        echo "Ping failed."
    fi
}

# اجرای اسکریپت
ip=$(generate_ipv4)
echo "Generated IP: $ip"
get_country $ip
ping_ip $ip
