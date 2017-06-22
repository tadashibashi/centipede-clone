///////EARN EXTRA LIFE////////////////////////////////////////////////////
//Detects of score has changed and adds it to the extra life counter
if (score_last < score) {
    global.extra_life_counter += (score-score_last);
}
score_last = score;
//Add an extra life every 12000 points you earn
if (global.extra_life_counter >= 12000) {
    if (global.demo == false) then {sound_play(extra_life_snd)} //plays the sound
    global.extra_life_counter = global.extra_life_counter - 12000; //resets the counter
     lives += 1; //increase lives by 1
}
