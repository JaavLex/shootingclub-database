<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title></title>
    <link rel="stylesheet" href="./index.css">
  </head>
  <body>
  <div id="block-container">
    <h1>HACK BY MELVYN</h1>
    <form action="./postformsql.php" method="post">
      <table class="mainform">
        <tr>
          <td><label>Nom </label></td><td><input type="text" name="last_name"></input></td>
        </tr>
        <tr>
          <td><label>Prenom </label></td><td><input type="text" name="first_name"></input></td>
        </tr>
        <tr>
          <td><label>Date de naissance</label></td><td><input type="date" name="date_of_birth"></input></td>
        </tr>
        <tr>
            <td><label>Possedez vous une arme? </label></td>
              <td><label> Yes  <input type="radio" name="wp_yesno" value="Y"></input></label>
              <label> No <input type="radio" name="wp_yesno" value="N"></input></label></td>
        </tr>
        <tr>
          <td>
            <input type="submit" value="Submit" />
          </td>
        </tr>
      <table>
    </form>
  </div>
  </body>
  <?php
  if ( isset($_GET['success']) && $_GET['success'] == 1 )
  {
   $message = "Successfully submitted";
   echo "<script type='text/javascript'>alert('$message');</script>";
  }
  ?>
</html>
