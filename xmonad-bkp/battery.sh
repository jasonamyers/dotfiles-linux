battery=$(acpi -b)
percent=$(echo $battery | cut -d ' ' -f 4 | cut -d ',' -f 1)
echo "Bat: $percent"
