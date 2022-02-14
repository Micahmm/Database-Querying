<?php

$con = mysqli_connect(/*Removed for safety*/);



if(mysqli_connect_errno())
     {die("failed to connect to MYSQL:".mysqli_connect_error());}
else
     {echo "established database connection";}



$sandate = mysqli_real_escape_string($con, $_POST["form_q3_s"]);
$sandatee = mysqli_real_escape_string($con, $_POST["form_q3_e"]);




$sql = "SELECT DISTINCT CONCAT(e.fname,' ',e.lname) AS Name, s.id
FROM orders as o
JOIN employee as e ON e.id=o.driver_id
JOIN store as s ON s.id=e.store_id
WHERE o.d BETWEEN '$sandate' AND '$sandatee'
ORDER BY s.id";

$result = mysqli_query($con, $sql);

if (mysqli_num_rows($result) > 0 ) {
     echo "<table>";
          echo "<tr>";
               echo "<th>Name</th>";
               echo "<th>Store ID</th>";
          echo "</tr>";

   while($row = mysqli_fetch_assoc($result)){
          echo "<tr>";
               echo "<td>" . $row['Name'] . "</td>";
               echo "<td>" . $row['id'] . "</td>";
          echo "</tr>";
     

   }
    echo "</table>";
} else {echo "No Results!";}

mysqli_free_result($result);
mysqli_close($con)
?>
