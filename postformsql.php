<?php
$l_name = $_POST["last_name"];
$f_name = $_POST["first_name"];
$dob = $_POST["date_of_birth"];
$wp_yn= $_POST["wp_yesno"];

$link = mysqli_connect("db", "root", "Pomme", "shootingclub");

if($link === false){
    die("ERROR: Could not connect. " . mysqli_connect_error());
}
$sql = "INSERT INTO T_Personne (nom_pers, prenom_pers, date_de_naissance, possession_arme) VALUES ('$l_name', '$f_name', '$dob', '$wp_yn')";
if(mysqli_query($link, $sql)){
    $foo = 'success';
} else{
    print "ERROR: Could not able to execute $sql. " . mysqli_error($link);
}

mysqli_close($link);

header("Location: http://localhost:82?success=1");
exit();
?>
