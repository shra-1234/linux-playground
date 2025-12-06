dest="."
retention_days=3
file_count=$(find "$dest" -type f -name "*.sh" -mtime +$retention_days | wc -l)
find "$dest" -type f -name "*.sh" -mtime +$retention_days -delete
echo "Number of files deleted : $file_count"
