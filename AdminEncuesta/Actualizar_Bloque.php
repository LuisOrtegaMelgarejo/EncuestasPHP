<?php

require_once "Controllers/conexion.php";

$query = "update tb_encuesta_bloque
	      set c_nombre_bloque = '".$_POST['nomblo']."',
	      n_orden_bloque  = '".$_POST['numblo']."'
 		  where id_bloque = ".$_POST['idblo'];	
try {
	$resultado= mysqli_query($conexion,$query);	
	$resp['error']=false;
} catch (Exception $e) {
	$resp['error']=true;	
}
echo json_encode($resp);
?>
