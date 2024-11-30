#!/bin/bash

# List of IP ranges to block
IP_RANGES=(
    "10.0.0.0/8"
    "100.64.0.0/10"
    "169.254.0.0/16"
    "172.16.0.0/12"
    "192.0.0.0/24"
    "192.0.2.0/24"
    "192.88.99.0/24"
    "192.168.0.0/16"
    "198.18.0.0/15"
    "198.51.100.0/24"
    "203.0.113.0/24"
    "240.0.0.0/24"
    "224.0.0.0/4"
    "233.252.0.0/24"
    "102.0.0.0/8"
    "185.235.86.0/24"
    "185.235.87.0/24"
    "114.208.187.0/24"
    "216.218.185.0/24"
    "206.191.152.0/24"
    "45.14.174.0/24"
    "195.137.167.0/24"
    "103.58.50.0/24"
    "25.0.0.0/19"
)

echo "Blocking IP ranges..."

# Loop through IP ranges and block them
for IP_RANGE in "${IP_RANGES[@]}"; do
    echo "Blocking $IP_RANGE"
    iptables -A INPUT -s "$IP_RANGE" -j DROP
    iptables -A FORWARD -s "$IP_RANGE" -j DROP
done

echo "All specified IP ranges have been blocked."
