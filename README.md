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
   - nombre_presupuesto (VARCHAR2): Nombre del presupuesto al que pertenece la línea.
   - cod_articulo (VARCHAR2): Código del artículo del producto asociado a la línea.
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
      "linea": "001NOMBRE_PRESUPUESTO1UNA DESCRIPCION DE LA LINEA PARA MAPEAR       COD001       573 "
    },
    {
      "linea": "001NOMBRE_PRESUPUESTO1UNA DESCRIPCION DE LA LINEA PARA MAPEAR 2     COD002       57  "
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
          "linea": "001NOMBRE_PRESUPUESTO1UNA DESCRIPCION DE LA LINEA PARA MAPEAR       COD003       573 "
        },
        {
          "linea": "001NOMBRE_PRESUPUESTO1UNA DESCRIPCION DE LA LINEA PARA MAPEAR 2     COD004       57  "
        },
        {
          "linea": "000NOMBRE_PRESUPUESTO2"
        },
        {
          "linea": "001NOMBRE_PRESUPUESTO2UNA DESCRIPCION DE LA LINEA PARA MAPEAR 3     COD005       573 "
        },
        {
          "linea": "001NOMBRE_PRESUPUESTO2UNA DESCRIPCION DE LA LINEA PARA MAPEAR 4     COD006       5734"
        },
        {
          "linea": "000NOMBRE_PRESUPUESTO3"
        },
        {
          "linea": "001NOMBRE_PRESUPUESTO3UNA DESCRIPCION DE LA LINEA PARA MAPEAR 3     COD007       "
        },
        {
          "linea": "001NOMBRE_PRESUPUESTO3UNA DESCRIPCION DE LA LINEA PARA MAPEAR 4     COD008       5765"
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
En el codigo SQL para montar el entorno en el que realizaran la prueba se les dispone una funcion
P_INS_DEBUG, es requisito que utilizen esta funcion para debugear (consultar estados de variables en 
tiempo de ejecucion, revisar y reportar errores, etc...). Por lo mismo, se les recomienda evitar usar 
cosas como DBMS_OUPUT.PUT_LINE. Ya que en el entorno real de trabajo no es posible utilizarlo.
