async function get_top_players() {
    const response = await fetch("top_players.php",
    {
        method: 'POST', 
        headers: {
            "Content-Type": "application/json",
        }
    })
    const result = await response.json();
    return result;
}

async function displayPlayerScores() {
    const playerPopup = document.getElementById('player-list');
    const playerScoresDiv = document.getElementById('player-list-content');

    if (playerPopup.style.display === "none" || playerPopup.style.display === "") {

        playerScoresDiv.innerHTML = '';
        const playerScores = await get_top_players();


        for (let i = 0; i < playerScores.length; i++) {
            const playerInfo = document.createElement('div');
            playerInfo.textContent = `${playerScores[i].username} - ${playerScores[i].score}`;
            playerScoresDiv.appendChild(playerInfo);
        }
        
        playerPopup.style.display = "block"; 
    } else {
        playerPopup.style.display = "none"; 
    }
}

document.getElementById('button').addEventListener('click', displayPlayerScores);