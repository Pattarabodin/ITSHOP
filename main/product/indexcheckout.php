<?php
session_start(); // เริ่มต้น session

// เชื่อมต่อฐานข้อมูล
include("connectdb.php");

// ตรวจสอบว่าผู้ใช้ล็อกอินหรือไม่
if (!isset($_SESSION['uid'])) {
    header("Location: indexlogin.php"); // เปลี่ยนเป็นหน้าล็อกอินของคุณ
    exit();
}

// ฟังก์ชันสำหรับดึงข้อมูลสินค้าจากฐานข้อมูล
function getProducts($conn, $cart) {
    if (empty($cart)) {
        return [];
    }

    $pids = array_keys($cart);
    $placeholders = implode(',', array_fill(0, count($pids), '?'));
    $types = str_repeat('i', count($pids));
    $sql = "SELECT p_id, p_name, p_detail, p_price, p_picture FROM product WHERE p_id IN ($placeholders)";
    $stmt = $conn->prepare($sql);
    if ($stmt) {
        $stmt->bind_param($types, ...$pids);
        $stmt->execute();
        $result = $stmt->get_result();
        $products = [];
        while ($row = $result->fetch_assoc()) {
            $products[$row['p_id']] = $row;
        }
        $stmt->close();
        return $products;
    }
    return [];
}

// สร้าง CSRF token
if (empty($_SESSION['csrf_token'])) {
    $_SESSION['csrf_token'] = bin2hex(random_bytes(32));
}

// ดึงข้อมูลสินค้าจากตะกร้า
$cart = isset($_SESSION['cart']) ? $_SESSION['cart'] : [];
$products = getProducts($conn, $cart);

// คำนวณยอดรวม
$total = 0;
foreach ($products as $pid => $product) {
    $subtotal = $product['p_price'] * $cart[$pid];
    $products[$pid]['subtotal'] = $subtotal;
    $total += $subtotal;
}
?>
<!doctype html>
<html lang="th" data-bs-theme="auto">
  <head>
    <script src="../assets/js/color-modes.js"></script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>เช็คเอาท์</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
    <link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Kanit&display=swap" rel="stylesheet">
    <style>
      body {
        font-family: 'Kanit', sans-serif;
      }
      .bi {
        vertical-align: -.125em;
        fill: currentColor;
      }
      .bd-mode-toggle {
        z-index: 1500;
      }
      .bd-mode-toggle .dropdown-menu .active .bi {
        display: block !important;
      }
    </style>
    <!-- Custom styles for this template -->
    <link href="checkout.css" rel="stylesheet">
  </head>
  <body class="bg-body-tertiary">
    <!-- SVG symbols -->
    <svg xmlns="http://www.w3.org/2000/svg" class="d-none">
      <symbol id="check2" viewBox="0 0 16 16">
        <path d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0z"/>
      </symbol>
      <symbol id="circle-half" viewBox="0 0 16 16">
        <path d="M8 15A7 7 0 1 0 8 1v14zm0 1A8 8 0 1 1 8 0a8 8 0 0 1 0 16z"/>
      </symbol>
      <symbol id="moon-stars-fill" viewBox="0 0 16 16">
        <path d="M6 .278a.768.768 0 0 1 .08.858 7.208 7.208 0 0 0-.878 3.46c0 4.021 3.278 7.277 7.318 7.277.527 0 1.04-.055 1.533-.16a.787.787 0 0 1 .81.316.733.733 0 0 1-.031.893A8.349 8.349 0 0 1 8.344 16C3.734 16 0 12.286 0 7.71 0 4.266 2.114 1.312 5.124.06A.752.752 0 0 1 6 .278z"/>
        <path d="M10.794 3.148a.217.217 0 0 1 .412 0l.387 1.162c.173.518.579.924 1.097 1.097l1.162.387a.217.217 0 0 1 0 .412l-1.162.387a1.734 1.734 0 0 0-1.097 1.097l-.387 1.162a.217.217 0 0 1-.412 0l-.387-1.162A1.734 1.734 0 0 0 9.31 6.593l-1.162-.387a.217.217 0 0 1 0-.412l1.162-.387a1.734 1.734 0 0 0 1.097-1.097l.387-1.162zM13.863.099a.145.145 0 0 1 .274 0l.258.774c.115.346.386.617.732.732l.774.258a.145.145 0 0 1 0 .274l-.774.258a1.156 1.156 0 0 0-.732.732l-.258.774a.145.145 0 0 1-.274 0l-.258-.774a1.156 1.156 0 0 0-.732-.732l-.774-.258a.145.145 0 0 1 0-.274l.774-.258c.346-.115.617-.386.732-.732L13.863.1z"/>
      </symbol>
      <symbol id="sun-fill" viewBox="0 0 16 16">
        <path d="M8 12a4 4 0 1 0 0-8 4 4 0 0 0 0 8zM8 0a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 0zm0 13a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 13zm8-5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2a.5.5 0 0 1 .5.5zM3 8a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2A.5.5 0 0 1 3 8zm10.657-5.657a.5.5 0 0 1 0 .707l-1.414 1.415a.5.5 0 1 1-.707-.708l1.414-1.414a.5.5 0 0 1 .707 0zm-9.193 9.193a.5.5 0 0 1 0 .707L3.05 13.657a.5.5 0 0 1-.707-.707l1.414-1.414a.5.5 0 0 1 .707 0zm9.193 2.121a.5.5 0 0 1-.707 0l-1.414-1.414a.5.5 0 0 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .707zM4.464 4.465a.5.5 0 0 1-.707 0L2.343 3.05a.5.5 0 1 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .708z"/>
      </symbol>
    </svg>

    <!-- Theme Toggle Button -->
    <div class="dropdown position-fixed bottom-0 end-0 mb-3 me-3 bd-mode-toggle">
      <button class="btn btn-bd-primary py-2 dropdown-toggle d-flex align-items-center"
              id="bd-theme"
              type="button"
              aria-expanded="false"
              data-bs-toggle="dropdown"
              aria-label="Toggle theme (auto)">
        <svg class="bi my-1 theme-icon-active" width="1em" height="1em"><use href="#circle-half"></use></svg>
        <span class="visually-hidden" id="bd-theme-text">Toggle theme</span>
      </button>
      <ul class="dropdown-menu dropdown-menu-end shadow" aria-labelledby="bd-theme-text">
        <li>
          <button type="button" class="dropdown-item d-flex align-items-center" data-bs-theme-value="light" aria-pressed="false">
            <svg class="bi me-2 opacity-50" width="1em" height="1em"><use href="#sun-fill"></use></svg>
            Light
            <svg class="bi ms-auto d-none" width="1em" height="1em"><use href="#check2"></use></svg>
          </button>
        </li>
        <li>
          <button type="button" class="dropdown-item d-flex align-items-center" data-bs-theme-value="dark" aria-pressed="false">
            <svg class="bi me-2 opacity-50" width="1em" height="1em"><use href="#moon-stars-fill"></use></svg>
            Dark
            <svg class="bi ms-auto d-none" width="1em" height="1em"><use href="#check2"></use></svg>
          </button>
        </li>
        <li>
          <button type="button" class="dropdown-item d-flex align-items-center active" data-bs-theme-value="auto" aria-pressed="true">
            <svg class="bi me-2 opacity-50" width="1em" height="1em"><use href="#circle-half"></use></svg>
            Auto
            <svg class="bi ms-auto d-none" width="1em" height="1em"><use href="#check2"></use></svg>
          </button>
        </li>
      </ul>
    </div>

    <div class="container">
      <main>
        <div class="py-5 text-center">
          <!-- เปลี่ยนโลโก้เป็นโลโก้ของคุณ -->
          <img class="d-block mx-auto mb-4" src="images/logol.png" alt="" width="200" height="200">
          <h2>แบบฟอร์มเช็คเอาท์</h2>
          <p class="lead">กรุณากรอกข้อมูลด้านล่างเพื่อทำการสั่งซื้อสินค้า</p>
        </div>

        <div class="row g-5">
          <!-- ส่วนรายการสินค้าตะกร้า -->
          <div class="col-md-5 col-lg-4 order-md-last">
            <h4 class="d-flex justify-content-between align-items-center mb-3">
              <span class="text-primary">ตะกร้าสินค้าของคุณ</span>
              <span class="badge bg-primary rounded-pill"><?= count($cart); ?></span>
            </h4>
            <?php if (empty($products)): ?>
                <div class="alert alert-info" role="alert">
                    ตะกร้าสินค้าของคุณยังว่างเปล่า <a href="indexproduct.php" class="alert-link">เริ่มต้นช้อปปิ้งเลย!</a>
                </div>
            <?php else: ?>
            <ul class="list-group mb-3">
              <?php foreach ($products as $pid => $product): ?>
                <li class="list-group-item d-flex justify-content-between lh-sm">
                  <div>
                    <h6 class="my-0"><?= htmlspecialchars($product['p_name'], ENT_QUOTES, 'UTF-8'); ?></h6>
                    <small class="text-body-secondary">จำนวน: <?= $cart[$pid]; ?></small>
                  </div>
                  <span class="text-body-secondary"><?= number_format($product['subtotal'], 2); ?> บาท</span>
                </li>
              <?php endforeach; ?>
              <li class="list-group-item d-flex justify-content-between">
                <span>ยอดรวม (บาท)</span>
                <strong><?= number_format($total, 2); ?></strong>
              </li>
            </ul>
            <?php endif; ?>
          </div>

          <!-- ส่วนกรอกข้อมูลลูกค้าและชำระเงิน -->
          <div class="col-md-7 col-lg-8">
            <h4 class="mb-3">ข้อมูลการชำระเงิน</h4>
            <form class="needs-validation" novalidate method="POST" action="confirm_order.php">
              <!-- รวมสินค้าและจำนวนในฟอร์ม -->
              <?php foreach ($products as $pid => $product): ?>
                <input type="hidden" name="pid[]" value="<?= htmlspecialchars($pid, ENT_QUOTES, 'UTF-8'); ?>">
                <input type="hidden" name="qty[]" value="<?= htmlspecialchars($cart[$pid], ENT_QUOTES, 'UTF-8'); ?>">
              <?php endforeach; ?>

              <!-- รวม CSRF Token -->
              <input type="hidden" name="csrf_token" value="<?= htmlspecialchars($_SESSION['csrf_token'], ENT_QUOTES, 'UTF-8'); ?>">

              <div class="row g-3">
                <div class="col-sm-6">
                  <label for="firstName" class="form-label">ชื่อ</label>
                  <input type="text" class="form-control" id="firstName" name="name" placeholder="" value="" required>
                  <div class="invalid-feedback">
                    กรุณากรอกชื่อของคุณ
                  </div>
                </div>

                <div class="col-sm-6">
                  <label for="lastName" class="form-label">นามสกุล</label>
                  <input type="text" class="form-control" id="lastName" name="lastname" placeholder="" value="" required>
                  <div class="invalid-feedback">
                    กรุณากรอกนามสกุลของคุณ
                  </div>
                </div>

                <div class="col-12">
                  <label for="email" class="form-label">อีเมล <span class="text-body-secondary">(ไม่บังคับ)</span></label>
                  <input type="email" class="form-control" id="email" name="email" placeholder="you@example.com">
                  <div class="invalid-feedback">
                    กรุณากรอกอีเมลที่ถูกต้อง
                  </div>
                </div>

                <!-- เปลี่ยนฟิลด์ Address 2 เป็นเบอร์โทรศัพท์ -->
                <div class="col-12">
                  <label for="phone" class="form-label">หมายเลขโทรศัพท์</label>
                  <input type="tel" class="form-control" id="phone" name="phone" placeholder="08X-XXXX-XXXX" required pattern="[0-9]{10}">
                  <div class="invalid-feedback">
                    กรุณากรอกหมายเลขโทรศัพท์ที่ถูกต้อง (10 หลัก)
                  </div>
                </div>

                <div class="col-12">
                  <label for="address" class="form-label">ที่อยู่สำหรับการจัดส่ง</label>
                  <input type="text" class="form-control" id="address" name="address" placeholder="1234 Main St" required>
                  <div class="invalid-feedback">
                    กรุณากรอกที่อยู่ของคุณ
                  </div>
                </div>
              </div>

              <div class="form-check mb-3">
                <input type="checkbox" class="form-check-input" id="save-info" name="save_info">
                <label class="form-check-label" for="save-info">บันทึกข้อมูลนี้สำหรับการซื้อครั้งถัดไป</label>
              </div>

              <hr class="my-4">

              <h4 class="mb-3">การชำระเงิน</h4>

              <div class="my-3">
                <div class="form-check">
                  <input id="credit" name="paymentMethod" type="radio" class="form-check-input" value="credit" checked required>
                  <label class="form-check-label" for="credit">บัตรเครดิต</label>
                </div>

              </div>

              <div class="row gy-3">
                <div class="col-md-6">
                  <label for="cc-name" class="form-label">ชื่อบนบัตร</label>
                  <input type="text" class="form-control" id="cc-name" name="cc_name" placeholder="" required>
                  <small class="text-body-secondary">ชื่อเต็มตามที่ปรากฏบนบัตร</small>
                  <div class="invalid-feedback">
                    กรุณากรอกชื่อบนบัตร
                  </div>
                </div>

                <div class="col-md-6">
                  <label for="cc-number" class="form-label">หมายเลขบัตรเครดิต</label>
                  <input type="text" class="form-control" id="cc-number" name="cc_number" placeholder="" required pattern="\d{16}">
                  <div class="invalid-feedback">
                    กรุณากรอกหมายเลขบัตรเครดิตที่ถูกต้อง (16 หลัก)
                  </div>
                </div>

                <div class="col-md-3">
                  <label for="cc-expiration" class="form-label">วันหมดอายุ</label>
                  <input type="text" class="form-control" id="cc-expiration" name="cc_expiration" placeholder="MM/YY" required pattern="(0[1-9]|1[0-2])\/\d{2}">
                  <div class="invalid-feedback">
                    กรุณากรอกวันหมดอายุในรูปแบบ MM/YY
                  </div>
                </div>

                <div class="col-md-3">
                  <label for="cc-cvv" class="form-label">CVV</label>
                  <input type="text" class="form-control" id="cc-cvv" name="cc_cvv" placeholder="" required pattern="\d{3}">
                  <div class="invalid-feedback">
                    กรุณากรอกรหัส CVV (3 หลัก)
                  </div>
                </div>
              </div>

              <hr class="my-4">

              <button class="w-100 btn btn-primary btn-lg" type="submit">ยืนยันการสั่งซื้อ</button>
            </form>
          </div>
        </div>
      </main>

      <footer class="my-5 pt-5 text-body-secondary text-center text-small">
        <p class="mb-1">&copy; 2017–2024 ชื่อบริษัทของคุณ</p>
        <ul class="list-inline">
          <li class="list-inline-item"><a href="#">นโยบายความเป็นส่วนตัว</a></li>
          <li class="list-inline-item"><a href="#">เงื่อนไขการใช้งาน</a></li>
          <li class="list-inline-item"><a href="#">สนับสนุน</a></li>
        </ul>
      </footer>
    </div>

    <script src="../assets/dist/js/bootstrap.bundle.min.js"></script>
    <script>
      // ตัวอย่างการตรวจสอบความถูกต้องของฟอร์มด้วย JavaScript
      (function () {
        'use strict'

        // Fetch all the forms we want to apply custom Bootstrap validation styles to
        var forms = document.querySelectorAll('.needs-validation')

        // Loop over them and prevent submission
        Array.prototype.slice.call(forms)
          .forEach(function (form) {
            form.addEventListener('submit', function (event) {
              if (!form.checkValidity()) {
                event.preventDefault()
                event.stopPropagation()
              }

              form.classList.add('was-validated')
            }, false)
          })
      })()
    </script>
  </body>
</html>
