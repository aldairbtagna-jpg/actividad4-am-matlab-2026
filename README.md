# Actividad formativa 4: Modulación en amplitud (AM)

**Asignatura:** Señales y Sistemas  
**Estudiante:** Jerónimo Bautista Torres  
**Herramienta:** MATLAB

## Descripción
Este proyecto implementa una simulación de modulación en amplitud (AM) en MATLAB. Se genera una señal de información de baja frecuencia, una portadora de alta frecuencia y la señal modulada. También se analiza el espectro mediante la transformada rápida de Fourier (FFT) y se simulan los efectos del ruido, la atenuación y la distorsión no lineal.

## Parámetros utilizados

| Parámetro | Valor |
|---|---:|
| Frecuencia del mensaje | 200 Hz |
| Frecuencia de la portadora | 5,000 Hz |
| Amplitud del mensaje | 1 |
| Amplitud de la portadora | 1 |
| Índice de modulación | 0.7 (70 %) |
| Frecuencia de muestreo | 100,000 Hz |
| Duración simulada | 0.02 s |

## Contenido del repositorio
- `Actividad4_Modulacion_AM.m`: código MATLAB de la simulación.
- `README.md`: descripción, parámetros e instrucciones del proyecto.

## Cómo ejecutar
1. Descarga o clona este repositorio.
2. Abre MATLAB.
3. Abre el archivo `Actividad4_Modulacion_AM.m`.
4. Presiona **Run** para ejecutar la simulación.
5. El programa genera figuras para:
   - Señal de información, portadora y señal AM.
   - Espectro de frecuencias de la señal AM.
   - Comparación de señal AM original y señal con ruido.
   - Comparación de señal original, atenuada al 50 % y distorsionada.

## Resultados esperados
Para una frecuencia de mensaje de 200 Hz y una portadora de 5,000 Hz, el espectro AM presenta la portadora en 5,000 Hz y bandas laterales en 4,800 Hz y 5,200 Hz. El ruido agrega fluctuaciones aleatorias; la atenuación reduce la amplitud al 50 %; y la transformación no lineal `tanh` comprime la amplitud y modifica la forma de onda.

## Nota
La actividad corresponde a una simulación en MATLAB. La distorsión se modela matemáticamente mediante `tanh(2*senal_AM)`; no representa un modelo calibrado de un equipo físico.
