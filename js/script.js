let board;
let boardWidth = 370;
let boardHeight = 620;
let context;
let birdWidth = 34;
let birdHeight = 24;
let bird_x = boardWidth / 8;
let bird_y = boardHeight / 2;
let bird_img;

let bird = {
    x: bird_x,
    y: bird_y,
    width: birdWidth,
    height: birdHeight
}

let pipe_arr = [];
let pipeWidth = 64;
let pipeHeight = 512;
let pipe_x = boardWidth;
let pipe_y = 0;
let top_pipe_img;
let bottom_pipe_img;

let pipe_move = -2;
let bird_move = 0;
let gravity = 0.4;
let game_over = false;
let score = 0;
let highScore =  0;

let scoreSaved = false;

async function getHighScore() {
    const response = await fetch("get_high_score.php",
    {
        method: 'GET', 
        headers: {
            "Content-Type": "application/json",
        }
    })
    const result = await response.json();
    highScore = result.score;
    console.log(result, result.score,result.saved);
}

async function saveScore(score) {
    if(score == 0){
        return;
        
    }
    console.log('save save')
    const data = {
        user_id: userID, 
        score: score
    }

    const response = await fetch("save_score.php",
        {
            method: 'POST',
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify(data)
        });
    await response.json();
    getHighScore();
}

let requestId;
window.onload = function () {
    board = document.getElementById("gameCanvas");
    board.height = boardHeight;
    board.width = boardWidth;
    context = board.getContext("2d");

    bird_img = new Image();
    bird_img.src = "images/bird0.png";
    bird_img.onload = function () {
        context.drawImage(bird_img, bird_x, bird_y, birdWidth, birdHeight);
    }

    top_pipe_img = new Image();
    top_pipe_img.src = "images/top.png";
    bottom_pipe_img = new Image();
    bottom_pipe_img.src = "images/bottom.png";
    getHighScore();
    start()
    setInterval(new_pipes, 1500);
    document.addEventListener("keydown", move_bird)
}

function start() {
    if (!game_over) {
        requestId = requestAnimationFrame(update);
    }
}


function update() {
    start()
    if (game_over && !scoreSaved) {
        saveScore(score);
        scoreSaved = true;
        cancelAnimationFrame(requestId);
        return;
    }

    context.clearRect(0, 0, board.width, board.height)

    bird_move += gravity;
    bird.y = Math.max(bird.y + bird_move, 0);
    context.drawImage(bird_img, bird.x, bird.y, bird.width, bird.height);

    if (bird.y > board.height) {
        game_over = true;
    }

    for (let i = 0; i < pipe_arr.length; i++) {
        let pipe = pipe_arr[i];
        pipe.x += pipe_move;
        context.drawImage(pipe.img, pipe.x, pipe.y, pipe.width, pipe.height);

        if (!pipe.passed && bird.x > pipe.x + pipe.width) {
            score += 0.5;
            pipe.passed = true;
        }

        if (collision(bird, pipe)) {
            game_over = true;
        }
    }

    while (pipe_arr.length > 0 && pipe_arr[0].x < -pipeWidth) {
        pipe_arr.shift();
    }

    context.fillStyle = "white";
    context.font = "45px snas-serif";
    context.fillText("Score: " + score, 5, 45);
    context.fillText("High Score: " + highScore, 5, 90);

    if (game_over) {
        context.fillText("GAME OVER", 50, 300)
        context.fillText("PRESS enter ", 50, 400)
        context.fillText("TO RESTART ", 50, 460)
    }
}


function new_pipes() {
    let random_y = pipe_y - pipeHeight / 2 - Math.random() * (pipeHeight / 2);
    let opening_space = boardHeight / 4;

    let top_pipe = {
        img: top_pipe_img,
        x: pipe_x,
        y: random_y,
        width: pipeWidth,
        height: pipeHeight,
        passed: false
    }
    pipe_arr.push(top_pipe);

    let bottom_pipe = {
        img: bottom_pipe_img,
        x: pipe_x,
        y: random_y + pipeHeight + opening_space,
        width: pipeWidth,
        height: pipeHeight,
        passed: false
    }
    pipe_arr.push(bottom_pipe);
}

function move_bird(w) {
    if (w.code === 'Enter' && game_over) {
        reset_position();
        start();
    }

    if ((w.code == "Space" || w.code == "ArrowUp") && !game_over) {
        bird_move = -6;   
    }
}
function reset_position(){
    bird_move = -6;
    if (game_over) {
        bird.y = bird_y;
        pipe_arr = [];
        score = 0;
        game_over = false;
        scoreSaved = false; 
    }
}
function collision(a, b) {
    return a.x < b.x + b.width &&
        a.x + a.width > b.x &&
        a.y < b.y + b.height &&
        a.y + a.height > b.y;
}


