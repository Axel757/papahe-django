document.addEventListener("DOMContentLoaded", function() {
  
    const pphLogoMed = document.querySelector('.pphLogoMed');
    const pjmedicinal = document.querySelector('.pjmedicinal');
    const pphLogoGas = document.querySelector('.pphLogoGas');
    const pjgastronomico = document.querySelector('.pjgastronomico');

    function iniciarAnimaciones(logo, personaje, pulseAnimacion, bounceAnimacion) {
        logo.style.animation = pulseAnimacion + ' 1s infinite ease-in-out alternate';
        personaje.style.animation = bounceAnimacion + ' 1s ease infinite';
    }


    function detenerAnimaciones(logo, personaje) {
        logo.style.animation = 'none';
        personaje.style.animation = 'none';
    }
    
    pphLogoMed.addEventListener("mouseover", function() {
        iniciarAnimaciones(pphLogoMed, pjmedicinal, 'pulseMed', 'bounceMed');
    });

    pphLogoGas.addEventListener("mouseover", function() {
        iniciarAnimaciones(pphLogoGas, pjgastronomico, 'pulseGas', 'bounceGas');
    });

    // Detener animaciones cuando el mouse deja el objeto
    pphLogoMed.addEventListener("mouseout", function() {
        detenerAnimaciones(pphLogoMed, pjmedicinal);
    });

    pphLogoGas.addEventListener("mouseout", function() {
        detenerAnimaciones(pphLogoGas, pjgastronomico);
    });
});