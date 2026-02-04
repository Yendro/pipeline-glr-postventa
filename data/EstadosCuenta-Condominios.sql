WITH EstadosCuentaCondominios AS (
      SELECT 
            id_cliente,
            CONCAT (DESARROLLO, ' ', UNIDAD) AS id_Desarrollo,
            MARCA AS Marca,
            DESARROLLO AS Desarrollo,
            UNIDAD AS Unidad,	
            ETAPA AS Etapa,
            CLIENTE AS NombreCompletoCliente,
            CORREO AS CorreoElectronico,
            TELEFONO AS Telefono,
            CONCAT("STP_", CLAVE_STP) AS BeneficiarioSTP,
            TOTALGENERADO AS TotalGenerado,
            TOTAL_POR_COBRAR AS TotalPorCobrar,
            CAST(SALDO_VENCIDO AS FLOAT64) AS SaldoVencido,
            DIAS_ATRASADO AS DiasAtrasado,
            SIGUIENTE_FECHA_PAGO AS FechaProximoPago,
            DIA_PAGO AS DiaPago,
            CAST(TOTAL_COBRADO AS FLOAT64) AS TotalCobrado,
            CAST(SALDOPENDIENTE_POR_APLICAR AS FLOAT64) AS SaldoPendientePorAplicar,
            FECHA_ULTIMO_INGRESO AS FechaUltimoIngreso
      FROM `terraviva-439415.sheets_condominios.sheets_estado_cuenta_condominios`
)
SELECT * FROM EstadosCuentaCondominios