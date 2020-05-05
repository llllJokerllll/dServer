<?php
    include_once 'top.php';
    include_once 'menu.php';
?>
			<!-- Medio -->
			<div class="row my-5">
				<div class="col-md-12">
					<h1>Enunciado</h1>					
						<h3>Entrega</h3>
						<ul>
							<li>Proxecto comprimido en zip, subido a través da plataforma</li>
						</ul>
						<h3>Instrucións</h3>
						<ul style="line-height: 2rem; text-align: justify;">
							<li>
								<p>En una empresa maderera tenemos comerciales que se dedican a valorar troncos de madera. 
								<p>Se tendrá en cuenta una valoración de troncos muy simple, detallando el tipo de madera, cantidad de troncos, radio medio, altura y un descuento. La idea es que de una valoración obtengamos los metros cúbicos a razón de multiplicar el número de troncos, por su radio medio, su altura y aplicando un descuento determinado por lo defectuosa que pueda ser la madera. Este cálculo derivará en el cálculo del volúmen.
								<p>Se proporciona una URL en la que puedes el proyecto funcionando (<a href="http://www.agp.gal/madeira" target="_blank">acceder</a>).
								<p>Queremos que estas valoraciones se almacenen en base de datos en la tabla valoraciontroncos.
								<p style="color: red">En el diseño de la base de datos se contempla que puedan existir valoraciontroncos cuyo idLote sea NULL. 
								Permitimos clave foránea a NULL. Esto significa que podemos agregar filas en la tabla sin indicar ningún lote de troncos.</p>
								<img src="imaxes/bd.png" alt="BD"/>

							</li>
							<li> Se proporciona un esqueleto del proyecto en el que completar las partes faltantes de código. No debes crear ningún documento php nuevo. Con los que existen es suficiente para desarrollar el proyecto.
								<br>La validación de datos solamente se efectuará en cliente mediante HTML.
								<br>En algunos sitios he añadido /*TODO*/ o &lt;!--TODO --> indicando código faltante.<br><strong>Tareas a realizar</strong>:
							<ol>
								<li>Configurar la BD y su acceso desde la aplicación</li>
								<li>Analiza el método save de la clase LoteTroncosDAO e indica de forma detallada que es lo que hace. Indica tu respuesta al fondo de la página enunciado.php.</li>
								<li>Implementar el método calcularVolume en la clase ValoracionTroncos</li>
								<li>Implementar los métodos getAll, get, save, delete y update de la clase ValoracionTroncosDAO.</li>
								<li>Completa el formulario (inputs) y su tramitación en crearTroncosSesion.php
    								<ul>
    									<li>Esta página permitirá dar de alta valoraciones de troncos y los almacenará en sesión.</li>
    									<li>Si la tramitación fue exitosa dirigirá el control a verValoracionsPendentes.php.</li>
    								</ul>
    							</li>
    							<li>Completa el documento php verValoracionsPendentes.php. Esta página mostrará los troncos almacenados en sesión.
    								<ul>
										<li>El listado permitirá eliminar las valoraciones existentes en sesión a través del documento eliminarTroncosSesion.php</li>
										<li>Mostrará dos formularios. Debes completar el segundo formulario, que pide un nombre para el lote.    							
    										<ul>
    											<li>El primero, dirigirá el control a confirmarValoracions.php, que ingresará los troncos de sesión en BD sin crear un lote.</li>
    											<li>El segundo, dirigiriá el control a confirmarValoracionsLote.php creará un lote en BD y al mismo tiempo ingresará las valoraciones vinculadas con el lote (idLote). Os dejo dos instrucciones para almacenar el lote debidamente con la fecha.</li>
    										</ul>
    									</li>
    									<li>Unha vez confirmadas as valoracións, deben ser eliminadas de sesión.</li> 
    								</ul>
    							</li>    							   					
								<li>Completa o documento php eliminarTroncosSesion.php. Unha vez eliminada a valoración dirixirá o control a verValoracionsPendentes.php</li>
								<li>Modifica menu.php, para que cada vez que amose o número de valoracións que temos en sesión.</li>							
							</ol>
						</li>							
					</ul>
					<p>Esta clase, tiene un método para guardar el nombre y la fecha en la base da datos del lote de troncos, para ello pide ya el objeto en cuestión creado, hace conexión con la base de datos, crea el statement, prepara el sql y añade los valores a este y lo ejecuta y luego añade por ultimo el setId, va rodeado obviamente por un try catch por si da un error reportarlo y retornar false, en caso de q todo sea correcto retornara true</p>
				</div>				
			</div>

<?php
    include_once 'bottom.php';    
?>			
