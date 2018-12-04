# Design a membership system

* user story
    * A user can register as a normal user
    * A user can browse products on this website
    * A user can choose to purchase premium membership(can skip payment)
    * A premium member can see products with discount prices
    * A user can be set as admin
    * An admin can create/edit products on this website
    * A product would have product price/name/image(s)
* must have
    * test case
    * technical document(read me)
    * please upload the source codes of your app to github/bitbucket and share the link to us
* nice to have
    * please deploy your app on aws/gcp and send the testable web link to us
    * containerize
        * prepare a Dockerfile for building a docker image of your app
        * use docker swarm or kubernetes to create a dev environment so that you can develop/test your app locally


## Build the project

You will need to install Docker Compose for this.

To start up the application in your local Docker environment:

```
git clone https://github.com/niclin/honestbee_interview_test.git
cd honestbee_interview_test
docker-compose build
docker-compose up app
```

Then access it at http://localhost:3000

Sign in to the admin account:

- Username: admin@test.com
- Password: 123456

## Tests / CI

On every push, the test suite is run in public on Travis CI

## Kubernetes

### Secrets

Create the necessary secrets:

```
$ kubectl create secret generic db-user-pass --from-literal=password=mypass
$ kubectl create secret generic db-user --from-literal=username=postgres
$ kubectl create secret generic railsapp-secrets --from-literal=secret-key-base=50dae16d7d1403e175ceb2461605b527cf87a5b18479740508395cb3f1947b12b63bad049d7d1545af4dcafa17a329be4d29c18bd63b421515e37b43ea43df64
```

### Postgres

```
$ kubectl create -f kube/deployments/db.yaml
```

Check the status.

```
$ kubectl get pods
```

When `Pod` status is running

```bash
$ kubectl expose deployment db
```


### Rails

```
$ kubectl create -f kube/deployments/rails.yaml
```

Check the status.

```
$ kubectl get pods
```

When `Pod` status is running

```
$ kubectl expose deployment app --type=NodePort
```


### Test the app

```
$ minikube service app
```


