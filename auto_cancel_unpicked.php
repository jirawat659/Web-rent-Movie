<?php
include('db.php');

// วันที่วันนี้
$today = date('Y-m-d');

// ลบออเดอร์ที่ 'จองแล้ว' และเลย 1 วันหลังจาก date_start
$sql = "DELETE FROM rent 
        WHERE pickup_status = 'รอรับ' 
        AND DATE_ADD(date_start, INTERVAL 1 DAY) < ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $today);
$stmt->execute();

echo "ลบออเดอร์ที่ไม่ได้มารับภายใน 1 วันแล้ว";
?>
