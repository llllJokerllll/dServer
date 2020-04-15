var radios = document.getElementsByName("unidades");
var graos = document.querySelector("#temperatura");

for (let i = 0; i < radios.length; i++) {
	radios[i].addEventListener('change', function() {
		if (this.value == 'f') {
			graos.min = -459;
		} else {
			graos.min = -273.15;
		}
	});
}