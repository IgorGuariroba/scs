<?php

    // Removing symbols

    $example1 = "String with letters, numbers 0123456789 and symbols !@#$%¨&*()_+";
    echo preg_replace("/[^a-zA-Z0-9\s]/", "", $example1);

    // Remove symbols, including spaces

    $example2 = "String with letters, numbers 0123456789 and symbols !@#$%¨&*()_+";
    echo preg_replace("/[^a-zA-Z0-9]/", "", $example2);

    // Removing symbols and numbers

    $example3 = "String with letters, numbers 0123456789 and symbols !@#$%¨&*()_+";
    echo preg_replace("/[^a-zA-Z\s]/", "", $example3);

    // Removing letters and symbols

    $example4 = "String with letters, numbers 0123456789 and symbols !@#$%¨&*()_+";
    echo preg_replace("/[^0-9\s]/", "", $example4);
