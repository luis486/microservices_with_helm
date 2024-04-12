## Components
In each folder you can find a more in-depth explanation of each component:

1. [Users API](/users-api) is a Spring Boot application. Provides user profiles. At the moment, does not provide full CRUD, just getting a single user and all users.
2. [Auth API](/auth-api) is a Go application, and provides authorization functionality. Generates [JWT](https://jwt.io/) tokens to be used with other APIs.
3. [TODOs API](/todos-api) is a NodeJS application, provides CRUD functionality over user's TODO records. Also, it logs "create" and "delete" operations to [Redis](https://redis.io/) queue.
4. [Log Message Processor](/log-message-processor) is a queue processor written in Python. Its purpose is to read messages from a Redis queue and print them to standard output.
5. [Frontend](/frontend) Vue application, provides UI.

## Architecture

Take a look at the components diagram that describes them and their interactions.
![microservice-app-example](/arch-img/Microservices.png)

# Microservice App - Kubernetes With Helm Training

Como se ha venido aprendiendo en el curso de Kubernetes, ya sabemos desplegar una aplicación utilizando kubernetes, pero ahora es necesario utilizar Helm el cual s un gestor de paquetes para Kubernetes, donde se usa un nuevo concepto que son los charts, los cuales son una colección de archivos que describen una aplicación Kubernetes. Incluye manifestos de Kubernetes, que son archivos YAML que describen los recursos de la aplicación, como despliegues, servicios, volúmenes, etc., así como archivos de configuración que Helm utiliza para personalizar la implementación de la aplicación en un clúster de Kubernetes específico.

# Pasos

1. Utilizando los microservicios que se mencionaron en el principio, y con ayuda de los .yaml que se crearon para manipular cada despliegue de manera manual, se configurará cada chart en su archivo value.yaml. Este archivo estará centralizado y lo que hará es que cada deployment, service, hpa etc, tomará los valores que se le hayan asignado para hacer el despliegue. Se debe crear este char con el comando *helm create <nombre_del_microservicio>* (procura estar parado en una carpeta con el nombre que tú decidas donde van a ir todos los chart)

![image](https://github.com/luis486/microservices_with_helm/assets/71047563/6f838626-3f62-42c6-8df8-db2ad2538bac)

![image](https://github.com/luis486/microservices_with_helm/assets/71047563/8ed9e1e8-ac4a-42cf-a636-eb52cfb6e0c9)

### Nota: Recuerda hacer esto con cada uno de los microservicios

![image](https://github.com/luis486/microservices_with_helm/assets/71047563/f0b6071f-aada-4eb0-86df-aa1658005557)

Te debe quedar algo así.

2. Luego de haber hecho la configuración (teniendo en cuenta las variables de entorno que antes se pasaban en el dockerfile) se debe lanzar el chart con el comando *helm install <microservicio> .*  esto lo que hará es desplegar cada aplicación, creando el manifiesto necesario para que corra el microservicio.

![image](https://github.com/luis486/microservices_with_helm/assets/71047563/be7c401c-88b0-48df-a9ab-dae72119410b)

3.  Por último, al tener todos tus microservicios listos, puedes hacer un script que te permita lanzar todo el entorno con un solo comando tal como lo encuentras en este repositorio *microservices_with_helm/charts/microservices.sh*

   Para correrlo sería ./microservices.sh

   ![image](https://github.com/luis486/microservices_with_helm/assets/71047563/939a6614-ea49-4349-8a37-130f23b03ee7)

5.  Puedes obtener cada uno de los servicios, pods y deploys corriendo con el comando *kubectl get svc,po,deploy*

   ![image](https://github.com/luis486/microservices_with_helm/assets/71047563/ca3fa713-06ec-4fae-9ad9-ed88623fc20f)

6.  Luego puedes correr el microservicio de frontend (que es donde vamos a entrar según el diagrama de arquitectura de la aplicación) y se puede hacer de dos maneras:

    - Si estás usando minikube como clúster, le das *minikube ip* y utilizas el puerto que te da el loadbalancer 
  
      ![image](https://github.com/luis486/microservices_with_helm/assets/71047563/7402157c-c4c4-4317-b6af-6a33201e7684)

    - Si estás usando Docker desktop como clúster (que utiliza minikube por detrás) simplemente debes hacer un port-forward con el comando *kubectl port-forward <pod> 8888:8080*
 
      ![image](https://github.com/luis486/microservices_with_helm/assets/71047563/46a148f8-74e3-4654-a35e-a50d637d9f65)

7. Listo, tu aplicación debe verse así, si tienes algún problema, estoy seguro que debe ser por variables de entorno, así que revisa los logs con *kubectl logs <pod>* o utiliza el *kubectl describe <pod>*.

      ![image](https://github.com/luis486/microservices_with_helm/assets/71047563/348e8bb3-1ea2-4648-9f13-92e5de7bd965)


#### Si definitivamente no te funciona, tranquilo, hay mejores áreas para tí, estoy seguro :)
