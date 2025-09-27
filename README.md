# Procesamiento-de-Senales

## Instrucciones para configurar el entorno virtual

1. Abre una terminal en la raíz del proyecto.
2. Crea un entorno virtual llamado `IPS`:
   ```
   python -m venv IPS
   ```
3. Activa el entorno virtual:

   - En Windows:
     ```
     .\IPS\Scripts\activate
     ```
   - En Linux/Mac:
     ```
     source IPS/bin/activate
     ```

4. Instala las dependencias:
   ```
   pip install -r requirements.txt
   ```

## Instrucciones para ejecutar los TPs

Cada TP tiene una carpeta con un archivo `RUN.py` que ejecuta todos los scripts de ese TP.

1. Navega a la carpeta del TP que deseas ejecutar, por ejemplo para TP1:
   ```
   cd TP1
   ```

2. Ejecuta el archivo `RUN.py`:
   ```
   python RUN.py
   ```

Esto ejecutará todos los scripts `.py` del TP correspondiente.

