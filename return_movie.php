<?php
include('db.php');

// รับค่า rent_ID และ customer_id อย่างปลอดภัย
$rent_ID = isset($_GET['rent_ID']) ? intval($_GET['rent_ID']) : 0;
$customer_id = isset($_GET['customer_id']) ? intval($_GET['customer_id']) : 0;

if (!$rent_ID || !$customer_id) {
    die("ข้อมูลไม่ถูกต้อง");
}

// วันที่วันนี้
$today = date('Y-m-d');

// ดึงข้อมูลวันที่ต้องคืน (date_return) จากฐานข้อมูล
$sql_select = "SELECT date_return FROM rent WHERE rent_ID = ?";
$stmt = $conn->prepare($sql_select);
$stmt->bind_param("i", $rent_ID);
$stmt->execute();
$result = $stmt->get_result();
$rent = $result->fetch_assoc();

if (!$rent) {
    die("ไม่พบข้อมูลการเช่า");
}

$date_due = $rent['date_return']; // ที่นี่หมายถึงวันที่ต้องคืนจริงๆ
$fine = 0;
$late_message = '';

// ตรวจสอบว่าคืนเกินวันหรือไม่
if ($today > $date_due) {
    $date1 = new DateTime($date_due);
    $date2 = new DateTime($today);
    $interval = $date1->diff($date2);
    $late_days = $interval->days;
    $fine = $late_days * 200; // ปรับวันละ 200 บาท
    $late_message = 'เลยกำหนด';
}

// อัปเดตสถานะการคืนในตาราง rent
$sql_update_rent = "UPDATE rent 
                    SET date_return = ?, rent_status = 'คืนแล้ว'
                    WHERE rent_ID = ?";
$stmt_update_rent = $conn->prepare($sql_update_rent);
$stmt_update_rent->bind_param("si", $today, $rent_ID);
$stmt_update_rent->execute();

// ------------------------------------
// เพิ่ม stock หนังคืน 1 และอัปเดตสถานะถ้า stock >= 1
// ------------------------------------
$sql_get_movie = "SELECT movie_ID FROM rent WHERE rent_ID = ?";
$stmt_get_movie = $conn->prepare($sql_get_movie);
$stmt_get_movie->bind_param("i", $rent_ID);
$stmt_get_movie->execute();
$result_movie = $stmt_get_movie->get_result();
$movie = $result_movie->fetch_assoc();

if ($movie) {
    $movie_id = $movie['movie_ID'];

    // เพิ่ม stock กลับคืน
    $sql_increase_stock = "UPDATE movie SET movie_stock = movie_stock + 1 WHERE movie_ID = ?";
    $stmt_increase_stock = $conn->prepare($sql_increase_stock);
    $stmt_increase_stock->bind_param("i", $movie_id);
    $stmt_increase_stock->execute();

    // ตรวจสอบว่ามี stock มากกว่า 0 แล้วค่อยเปิดให้เช่าอีกครั้ง
    $sql_check_stock = "SELECT movie_stock FROM movie WHERE movie_ID = ?";
    $stmt_check_stock = $conn->prepare($sql_check_stock);
    $stmt_check_stock->bind_param("i", $movie_id);
    $stmt_check_stock->execute();
    $result_stock = $stmt_check_stock->get_result();
    $stock_data = $result_stock->fetch_assoc();

    if ($stock_data && $stock_data['movie_stock'] >= 1) {
        $sql_update_status = "UPDATE movie SET movie_status = 1 WHERE movie_ID = ?";
        $stmt_update_status = $conn->prepare($sql_update_status);
        $stmt_update_status->bind_param("i", $movie_id);
        $stmt_update_status->execute();
    }
}

// ถ้าค่าปรับมากกว่า 0 ให้เพิ่มเข้าไปในตาราง fine
if ($fine > 0) {
    $sql_insert_fine = "INSERT INTO fine (customer_ID, fine_type, damage_price, fine_date, fine_status) 
                        VALUES (?, 'คืนหนังช้า', ?, ?, 'ยังไม่ได้ชำระ')";
    $stmt_insert_fine = $conn->prepare($sql_insert_fine);
    $stmt_insert_fine->bind_param("iis", $customer_id, $fine, $today);
    $stmt_insert_fine->execute();
}

// ส่งกลับไปยังหน้าลูกค้า พร้อมค่าปรับและข้อความ (ถ้ามี)
header("Location: customer_detail.php?customer_id=$customer_id&returned=1&fine=$fine&message=" . urlencode($late_message));
exit();
?>
