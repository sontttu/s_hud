window.addEventListener('message', function (event) {
    const action = event.data.action;

    if (action === 'updateHud') {
        document.getElementById('cash').textContent = event.data.cash + '€';
        document.getElementById('bank').textContent = event.data.bank + '€';
        document.getElementById('job').textContent = event.data.job;
    }

    if (action === 'updateHudAppearance') {
        document.documentElement.style.setProperty('--icon-color', event.data.iconColor);
        document.documentElement.style.setProperty('--background-color', event.data.backgroundColor);
        document.documentElement.style.setProperty('--text-color', event.data.textColor);
        document.documentElement.style.setProperty('--money-icon-color', event.data.moneyIconColor);
        document.documentElement.style.setProperty('--bank-icon-color', event.data.bankIconColor);
        document.documentElement.style.setProperty('--job-text-color', event.data.jobTextColor);
    }

    if (action === 'updateSpeedometer') {
        const visible = event.data.visible;
        const speed = event.data.speed;
        const fuel = event.data.fuel;
        document.getElementById('speedometer').style.display = visible ? 'flex' : 'none';
        document.getElementById('speed').textContent = speed;
        document.getElementById('fuel-level').style.width = fuel + '%';
    }
});
