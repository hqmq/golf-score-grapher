## Golf Scores
This is a simple app used for bragging rights around the office.

http://golf.riesd.com/

## Running in Development Mode
This repository just acts as the backend of the application. It does not contain any frontend code. It expects you to define a db/index.html file that will be used to bootstrap the frontend code.

Please see mmmries/golfscore-frontend to get a copy of the frontend.

For development purposes I usually symlink golfscore-frontend/build/index.html to db/index.html in this project to keep the two projects in sync while running locally.

Once you have a db/index.html page you can start the app with <code>bundle exec rails s</code> which will start the app on port 3000.

## Deploying the App
This app is setup to use Docker and its docker images can be found at https://registry.hub.docker.com/u/hqmq/golf/

To build a new image run the following docker commands:

```
docker build -t hqmq/golf:0.0.4 .
docker push hqmq/golf:0.0.4
```

To run an image use the following docker command (you'll want to substitue the version tag at the end to be the latest version you created)
```
docker run -d --name golf -v /root/db:/home/app/db -p 4000:80 hqmq/golf:0.0.4
```
