### Prueba Técnica: Procesamiento de JSON en PL/SQL

#### Objetivo:
Desarrollar una función en PL/SQL llamada F_LEER_JSON que procese un JSON de entrada, mapee los datos según las especificaciones dadas y realice las inserciones correspondientes en las tablas de la base de datos.

#### Descripción:
Se proporciona un JSON que contiene una lista de líneas, cada una de las cuales describe un presupuesto o una línea de presupuesto. La función debe interpretar estas líneas, extraer la información relevante y almacenarla en las tablas correspondientes.

#### Tablas Involucradas:
1. presupuestos:
   - id (NUMBER): Identificador único del presupuesto.
   - nombre (VARCHAR2): Nombre del presupuesto.

2. linea_presupuestos:
   - id (NUMBER): Identificador único de la línea de presupuesto.
   - descripcion (VARCHAR2): Descripción de la línea de presupuesto.
   - id_presupuesto (NUMBER): Identificador del presupuesto al que pertenece la línea.
   - id_producto (NUMBER): Identificador del producto asociado a la línea.
   - cantidad (NUMBER): Cantidad del producto en la línea.

3. productos:
   - id (NUMBER): Identificador único del producto.
   - descripcion (VARCHAR2): Descripción del producto.
   - precio (NUMBER): Precio del producto.
   - cod_articulo (VARCHAR2): Código del artículo.

4. debug:
   - mensaje (VARCHAR2): Mensaje de depuración.

#### Especificaciones del JSON:
El JSON tiene la siguiente estructura:
```json
{
  "data" : [
    {
      "linea": "000NOMBRE_PRESUPUESTO1"
    },
    {
      "linea": "001LINEA_PRESUPUESTO11UNA DESCRIPCION DE LA LINEA PARA MAPEAR       PRODUCTO687  573 "
    },
    {
      "linea": "001LINEA_PRESUPUESTO12UNA DESCRIPCION DE LA LINEA PARA MAPEAR 2     PRODUCTO6232 57  "
    },
    ...
  ]
}
```
#### Mapeo de las Líneas:

1. TIPO DE LINEA => Empieza desde el caracter 1 al 3

2. SI TIPO DE LINEA ES 000 => DESCRIBE UN PRESUPUESTO:

  - NOMBRE DEL PRESUPUESTO => Empieza desde el caracter 4 al 23

3. SI TIPO DE LINEA ES 001 => DESCRIBE UNA LINEA DE PRESUPUESTO:

  - NOMBRE DEL PRESUPUESTO => Empieza desde el caracter 4 al 23
  - DESCRIPCION DE LA LINEA => Empieza desde el caracter 24 al 70
  - CODIGO DEL PRODUCTO => Empieza desde el caracter 71 al 84
  - CANTIDAD => Empieza desde el caracter 85 al 89

#### Requisitos de la Función F_LEER_JSON:
1. Entrada: La función debe recibir un parámetro de tipo CLOB que contenga el JSON.
2. Procesamiento:
   - Parsear el JSON y extraer las líneas.
   - Identificar el tipo de línea (000 o 001).
   - Extraer la información relevante según el tipo de línea.
   - Insertar los datos en las tablas correspondientes.
3. Salida: La función no necesita devolver ningún valor, pero debe manejar correctamente las inserciones en las tablas.
4. Manejo de Errores: La función debe manejar posibles errores, como formatos incorrectos o datos faltantes, y registrar mensajes de depuración en la tabla debug.

#### Consideraciones Adicionales:
- Asegúrate de que los nombres de los presupuestos y los códigos de los productos sean únicos.
- Si un presupuesto o producto ya existe en la base de datos, no se debe duplicar.
- La función debe ser eficiente y manejar correctamente grandes volúmenes de datos.

#### Ejemplo de Uso:
```sql
DECLARE
    json_data CLOB;
BEGIN
    json_data := '
    {
      "data" : [
        {
          "linea": "000NOMBRE_PRESUPUESTO1"
        },
        {
          "linea": "001LINEA_PRESUPUESTO11UNA DESCRIPCION DE LA LINEA PARA MAPEAR       PRODUCTO687  573 "
        },
        {
          "linea": "001LINEA_PRESUPUESTO12UNA DESCRIPCION DE LA LINEA PARA MAPEAR 2     PRODUCTO6232 57  "
        },
        {
          "linea": "000NOMBRE_PRESUPUESTO2"
        },
        {
          "linea": "001LINEA_PRESUPUESTO21UNA DESCRIPCION DE LA LINEA PARA MAPEAR 3     PRODUCTO6D87 573 "
        },
        {
          "linea": "001LINEA_PRESUPUESTO22UNA DESCRIPCION DE LA LINEA PARA MAPEAR 4     PRODUCTO6232 5734"
        },
        {
          "linea": "000NOMBRE_PRESUPUESTO3"
        },
        {
          "linea": "001LINEA_PRESUPUESTO31UNA DESCRIPCION DE LA LINEA PARA MAPEAR 3     PRODUCTO6D8ss5756"
        },
        {
          "linea": "001LINEA_PRESUPUESTO32UNA DESCRIPCION DE LA LINEA PARA MAPEAR 4     PRODUCTO12rr 5765"
        }
      ]
    }
    ';

    F_LEER_JSON(json_data);
END;
```

#### Evaluación:
- Correcta implementación de la función F_LEER_JSON.
- Manejo adecuado de los datos y errores.
- Eficiencia en el procesamiento del JSON.
- Correcta inserción de datos en las tablas.
- Uso adecuado de la tabla debug para registrar mensajes de depuración.

#### Nota:
No es necesario implementar el código, solo redactar el enunciado de la prueba técnica.
