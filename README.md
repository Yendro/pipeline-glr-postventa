# Pipeline de Reportes de Post Venta

Este proyecto es un pipeline de datos ETL (Extract, Transform, Load) diseñado específicamente para la generación de reportes de post venta. Automatiza la extracción de datos desde BigQuery, aplica transformaciones y formateo, y genera archivos Excel listos para trabajar.

## Configuración del Entorno

### 1. Instalación de Dependencias

En la terminal ejecutar:

```bash
pip install -r requirements.txt
```

Usando uv:

```bash
uv pip install -r requirements.txt
```

### 2. Configuración de Variables de Entorno en Windows

Crea un archivo llamado `.env` en la raíz del proyecto
Agrega las siguientes variables:

```js
BIGQUERY_CREDENTIALS_PATH =C:\ruta\a\tu\credencial.json
BIGQUERY_PROJECT_ID = "tu-project-id"
```

### 3. Estructura del Proyecto

```bash
proyecto/
├── src/
│   ├── bigquery_client.py    # Cliente para conectar con BigQuery
│   ├── config.py             # Configuración y rutas
│   └── pipeline.py           # Procesamiento y formateo de datos
├── data/                     # Consultas SQL (.sql files)
├── reports/                  # Reportes generados
├── logs.log                  # Archivo de logs
├── main.py                   # Punto de entrada
└── requirements.txt          # Dependencias
```

### 4. Crear un ejecutable de la pipeline

Se puede crear un archivo `.bat` ejecutable de la pipeline para programar su ejecución.

```bat
@echo off
cd /d C:\ruta\del\proyecto\pipeline-glr-postventa
call .venv\Scripts\activate.bat
python main.py
```

## Añadir nuevos archivos SQL

### 1. Agregar el archivo

1. Navega a la carpeta data/
2. Crea un nuevo archivo con extensión .sql (ej: mi_consulta.sql)

### 2. Formateo automático de columnas

El sistema aplica formatos basados en palabras clave en los nombres de columna:

| Categoria | Formato Excel | Ejemplo de Keyword (columna) |
| --------- | ------------- | ---------------------------- |
| Fecha     | DD/MM/YYYY/   | `fecha_pago`                 |
| Moneda    | "$"#,##0.00   | `monto`                      |
| Numero    | 0             | `id`, `dias`                 |
| Texto     | @             | `nombre`, `marca`            |

> **Nota**: Si necesitas agregar nuevas palabras clave, modifica el diccionario `CATEGORIAS_FORMATO` en pipeline.py.

## Ejecución del Proyecto

En termminal:

```bash
python main.py
```

Los resultados aparecerán en `reports/PV-YYYY-MM-DD` de acuerdo a la fecha del día en que se ejecutó.

El sistema genera logs en dos ubicaciones:

1. Consola: Ver en tiempo real durante la ejecución
2. Archivo: `logs.log` en la raíz del proyecto

## Licencia

Revisa la [Licencia](./LICENSE) antes de usar el proyecto.
