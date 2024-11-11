## **Tenis Challenge - Simulación de torneo de tenis**

Este proyecto implementa un simulador de torneo de tenis mediante un API REST, desarrollado en PHP con el marco Slim y utilizando principios de diseño orientado a objetos. El proyecto simula un torneo de eliminación directa donde los jugadores compiten en función de su rendimiento calculado y un factor de suerte (que es calculado mediante números random), con el objetivo de obtener un ganador en cada categoría (masculina y femenina).

## **Contenido**
- [Requerimientos](#requerimientos)
- [Instalación/Configuración](#Instalación/Configuración)


## Requerimientos
- **PHP** 7.4 o superior
- **Composer**
- **Base de Datos MySQL** (se proporciona un script de creación de tablas y datos iniciales)
- **Slim Framework** para la implementación de la API REST
- **PHPUnit** para pruebas unitarias

## Instalación/Configuración
1. **Clonar el Repositorio**
   ```bash
   git clone https://github.com/usuario/tenis-challenge.git
   cd tenis-challenge
2. **Instalar las dependencias**
   ```bash
   composer install
3. **Configurar base de datos**
   - Crear una base de datos Mysql en tu servidor
   - Importar el archivo de base de datos ```tenis-challenge.sql``` ubicado en la carpeta ```./database/tenis-challenge.sql``` con el siguiente comando:
   ```bash
   mysql -u root -p tenis-challenge < .\src\Database\tenis-challenge.sql
4. **Iniciar el servidor**
   - Iniciar el apache y mysql mediante su servidor de entornos.
   - En caso de que este utilizando directamente php puede inicializarlo mediante:
   ```bash
   php -S localhost:8000 -t public

## Documentación de API

- Documentación de API REST mediante swagger, describiendo los endpoints.
### ``` POST /api/iniciarChallenge ```
- Genera una simulación de torneo de ambos géneros.
### Response
```json
{
  "ganador_masculino": "Nombre del Ganador Masculino",
  "ganador_femenino": "Nombre de la Ganadora Femenina",
  "detalle_torneo": {
      "masculino": [...],
      "femenino": [...]
  }
}
```

### ``` GET /api/obtenerJugadores ```
- Obtener la lista de los jugadores que participaran del challenge.
### Response
```json
{
  "jugadoresMasculinos": [...],
  "jugadorasFemeninos": [...]
}
```

## Pruebas unitarias
- Para ejecutar las pruebas unitarias, puede generarlo mediante el siguiente codigo.
```bash
./vendor/bin/phpunit --testdox
```

Las pruebas se encuentran en el directorio .\tests incluyendo pruebas de lógica, rendimiento y funcionamiento de los servicios el proyecto.
