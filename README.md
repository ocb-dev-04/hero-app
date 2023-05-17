## Documentacion y aclarandos

Hice uso de MVVM y le di un boost usando arquitectura hexagonal. Las carpetas que estan dentro de "infrastructure" y "domain" que no tienen archivos, por ejemplo:

- abstractions/infrastructure/data/local/database y/o local_storage
- abstractions/infrastructure/data/remote/firestore

fueron creadas para dar una idea mas completa de como se manejan os archivos al hacer uso de esta arquitectura.

Me tome el atrevimiento de agregar i18n, espero que no se enojen XD

## Datos en el archivo .env

Favor de notificarme al momento de revisado el codigo, para remover el archivo .env que esta dentro de assets/