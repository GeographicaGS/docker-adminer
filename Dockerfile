FROM dockette/adminer:full

ADD adminer.php .
ADD adminer.css .

EXPOSE 8080

