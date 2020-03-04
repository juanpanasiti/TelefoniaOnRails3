# Proyecto en Rails
## Telefonía on Rails 3
### Objetivo del Proyecto
La idea del proyecto es desarrollar un software que permita la gestión de las líneas celulares, equipos y usuarios en la oficina de Telefonía y Comunicaciones de la Municipalidad de Godoy Cruz.
Mi objetivo personal es utilizar este proyecto para lograr afianzar más mis conocimientos de Ruby on Rails (utilizando la versión 6) y aprender más de CSS, HTML y sobre todo de JavaScript.

## Funcionamiento
Los encargados de gestionar la app son los Admins, cada admin puede tener un nivel de acceso distinto:
- 0: recien registrado, no puede hacer nada hasta no recibir al menos el nivel 1.
- 1: puede visualizar información en el dashboard y alguans páginas más, pero no puede acceder a toda la información ni modificar registros.
- 2: puede visualizar toda la información y editar algunos registros referidos a los datos de equipos, líneas y usuarios.
- 3: además de los accesos del nivel 2, este nivel puede editar los niveles de acceso de los demás admins, editar los registros de configuración como las opciones de los selectores de los formularios y cargar los CSV de los reportes de líneas de cada cuenta (en este caso, de Claro).
