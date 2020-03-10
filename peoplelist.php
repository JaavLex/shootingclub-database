<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
  <meta charset="utf-8">
  <title></title>
  <link rel="stylesheet" href="./index.css">
</head>

<body>
  <div id="bg-image">
    <div id="block-container">
      <form action="./postformsql.php" method="post">
        <table class="mainform">
          <?php
          $l_name = $_POST["last_name"];
          $f_name = $_POST["first_name"];
          $dob = $_POST["date_of_birth"];
          $wp_yn= $_POST["wp_yesno"];

          $link = mysqli_connect("db", "root", "Pomme", "shootingclub");

          if($link === false){
              die("ERROR: Could not connect. " . mysqli_connect_error());
          }
          $sql = "SELECT nom_pers, prenom_pers, date_de_naissance, possession_arme FROM T_Personne";
          if(mysqli_query($link, $sql)){
               $foo = 'success';
          } else{
               print "ERROR: Could not able to execute $sql. " . mysqli_error($link);
          }

          $result = $link->query($sql);

          if ($result->num_rows > 0) {
            while($row = $result->fetch_assoc()) {
              echo "<tr><td>" . $row["nom_pers"]. "</td><td>" . $row["prenom_pers"]. "</td><td>" . $row["date_de_naissance"]. "</td><td>" . $row["possession_arme"]. "</td></tr>";
            }
          }
          mysqli_close($link);
          ?>
          <tr>
            <td><input type="button" value="S'enregistrer" onclick="parent.location='index.html'"> </input></td>
          </tr>
        <table>
      </form>
    </div>
  </div>
</body>

</html>
