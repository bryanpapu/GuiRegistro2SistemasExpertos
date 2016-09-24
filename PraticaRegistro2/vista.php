<html>
<head>
	<title>Listado de unidades</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width_device_width, initial_scale=1.0,maximun-scale=1.0">
	</head>
	<body>
		<header>
			<h1>Listado de unidades</h1>
		</header>
		<table border='1' cellpadding='0' cellpacing='0'>
			<tr>
				<th>ID</th>
                <th>Nombre</th>
                <th>Abreviado</th>
            </tr>
            <?php  foreach ($datos as $fila) { ?>
            <tr>
            	<td> <?php  echo $fila['id_unidad_medida'] ?> </td>
            	<td> <?php  echo $fila['descripcion'] ?> </td>
            	<td> <?php  echo $fila['abreviado'] ?> </td>
            </tr>
            <?php } ?>
            <table>
           </section>
           <footer>
           	 &copy;Edwin R.Paredes
           </footer>
          </body>
          </html>