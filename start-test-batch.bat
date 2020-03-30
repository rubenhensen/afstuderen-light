FOR /L %%A IN (10,1,20) DO (
  docker run --name nginx%%A -d -p 80%%A:80 afstuderen-light-nginx
)
