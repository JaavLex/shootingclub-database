<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title></title>
  </head>
  <body>
    <form action="./postformsql.php" method="post">
      <table>
        <tr>
          <td>
          <label>Nom <input type="text" name="last_name"> </input></label>
          </td>
        </tr>
        <tr>
          <td>
          <label>Prenom <input type="text" name="first_name"> </input></label>
          </td>
        </tr>
        <tr>
          <td>
          <label>Date de naissance <input type="date" name="date_of_birth"> </input></label>
          </td>
        </tr>
        <tr>
          <td>
            <label>Possedez vous une arme?
              <label> yes <input type="radio" name="wp_yesno" value="Y"></label>
              <label> no <input type="radio" name="wp_yesno" value="N"></label></input>
            </label>
          </td>
        </tr>
      <table>
      <input type="submit" value="Submit" />
    </form>
    <?php echo $foo; ?>
  </body>
</html>
