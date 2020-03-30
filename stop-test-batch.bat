FOR /L %%A IN (10,1,20) DO (
  docker stop nginx%%A
  docker rm nginx%%A
)
