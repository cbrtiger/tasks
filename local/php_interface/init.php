<?php

function dump($obj,$die = false){
    echo "<pre>";
        var_dump($obj);
    echo "</pre>";
    if($die){
        die();
    }
}