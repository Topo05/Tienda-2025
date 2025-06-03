
# Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
# Click nbfs://nbhost/SystemFileSystem/Templates/Other/Dockerfile to edit this template

FROM maven: 3.8.5-openjdk-17 as build
copy . .
run mvn clean package -Dskiptest

from openjdk:17.0.1-jdk-slim
copy --from=build /target/tienda-1.ja tienda.jar
expose 80
entrypoint ["java","-jar","tienda.jar"]

CMD ["/bin/sh"]
