WITH IngresosCondominios AS (
  SELECT
    IDCLIENTE AS id_cliente,
    SISTEMA AS Marca,
    DESARROLLO AS Desarrollo,
    UNIDAD AS Unidad,
    CONCAT("STP_", STP) AS  BeneficiarioSTP,
    CLIENTE AS NombreCompletoCliente,
    FOLIO AS Folio,
    FECHA_INGRESO AS FechaIngreso,
    CAST(MONTO_PAGADO AS FLOAT64) AS Monto,
    BANCO AS Banco,
    NUMERO_CUENTA AS NumeroCuenta,
    FORMA_PAGO AS FormaPago,
    IDINGRESO AS id_ingreso,
    USUARIOS_REGISTRO AS UsuarioRegistro,
    FECHA_REGISTRO AS FechaRegistro,
    STATUS,
    CAST(SALDOPENDIENTE_POR_APLICAR AS FLOAT64) AS SaldoPendientePorAplicar,
    id_ingreso_dt,
    CAST(MONTO_CUOTA AS FLOAT64) AS MontoCuota,	
    CAST(MONTO_RESERVA AS FLOAT64) AS MontoReserva,	
    CAST(MONTO_FONDO AS FLOAT64) AS MontoFondo
  FROM `terraviva-439415.sheets_condominios.sheets_flujo_ingresos`
)
SELECT * FROM IngresosCondominios
WHERE EXTRACT(YEAR FROM FechaIngreso) = EXTRACT(YEAR FROM CURRENT_DATE("America/Merida"))
  AND EXTRACT(MONTH FROM FechaIngreso) = EXTRACT(MONTH FROM CURRENT_DATE("America/Merida"))