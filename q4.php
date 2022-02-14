<?php

$con = mysqli_connect(/*Removed for safety*/);



if(mysqli_connect_errno())
     {die("failed to connect to MYSQL:".mysqli_connect_error());}
else
     {echo "established database connection";}




$sql = "SELECT c.coup_num, c.value
FROM coupon AS c
WHERE CURDATE() < c.exp_date
ORDER BY c.exp_date DESC";


$result = mysqli_query($con, $sql);



if (mysqli_num_rows($result) > 0 ) {
     echo "<table>";
          echo "<tr>";
               echo "<th>Coupon Number</th>";
               echo "<th>Value</th>";
          echo "</tr>";


   while($row = mysqli_fetch_assoc($result)){
          echo "<tr>";
               echo "<td>" . $row['coup_num'] . "</td>";
               echo "<td>" . $row['value'] . "</td>";
          echo "</tr>";

   }
     echo "</table>";
} else {echo "No Results!";}

mysqli_free_result($result);
mysqli_close($con)
?>
