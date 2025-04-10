<?php

// create session
session_start();

if (isset($_SESSION['username']) && isset($_SESSION['level'])) {
	// include file
	include('../layouts/header.php');
	include('../layouts/topbar.php');
	include('../layouts/sidebar.php');

	// show data (kết hợp tên nhân viên từ bảng nhanvien)
	$showData = "SELECT dnp.id, 
                    dnp.ma_don,
                    dnp.nhanvien_id,
                    nv1.ten_nv as ten_nhan_vien,
                    dnp.ly_do,
                    dnp.ngay_xin_phep,
                    dnp.status
             FROM don_nghi_phep dnp
             LEFT JOIN nhanvien nv1 ON dnp.nhanvien_id = nv1.id
             ORDER BY dnp.id DESC";

	$result = mysqli_query($conn, $showData);

	$arrShow = array();
	if ($result && mysqli_num_rows($result) > 0) {
		while ($row = mysqli_fetch_assoc($result)) {
			$arrShow[] = $row;
		}
	}

	// Thay đổi đoạn code tạo mã đơn
	$maDon = "DNP" . time();

	// add record
	if (isset($_POST['save'])) {

		// create array error
		$error = array();
		$success = array();
		$showMess = false;

		// Capture form data
		$nhanVien = isset($_POST['nhanVien']) ? $_POST['nhanVien'] : '';
		$lyDo = isset($_POST['lyDo']) ? $_POST['lyDo'] : '';
		$ngayXinPhep = isset($_POST['ngayXinPhep']) ? $_POST['ngayXinPhep'] : '';


		// validate
		if (empty($nhanVien) || $nhanVien == 'chon')
			$error['nhanVien'] = 'Vui lòng chọn nhân viên';
		if (empty($lyDo))
			$error['lyDo'] = 'Vui lòng nhập lý do xin nghỉ phép';
		if (empty($ngayXinPhep))
			$error['ngayXinPhep'] = 'Vui lòng chọn ngày xin nghỉ phép';

		if (empty($error)) {
			$showMess = true;

			// Kiểm tra nhanVien có phải là số không
			if (!is_numeric($nhanVien)) {
				$error['nhanvien_type'] = 'ID nhân viên phải là số';
				$showMess = false;
			} else {
				// Kiểm tra nhanVien có tồn tại trong bảng nhanvien không
				$checkNV = "SELECT id FROM nhanvien WHERE id = $nhanVien";
				$resultNV = mysqli_query($conn, $checkNV);
				if (!$resultNV || mysqli_num_rows($resultNV) == 0) {
					$error['nhanvien_exist'] = 'Nhân viên không tồn tại trong hệ thống';
					$showMess = false;
				} else {
					// Tiếp tục xử lý nếu nhân viên tồn tại
					// Thoát ký tự đặc biệt trong dữ liệu
					$lyDo = mysqli_real_escape_string($conn, $lyDo);

					// Hiển thị câu SQL để kiểm tra
					$insert = "INSERT INTO don_nghi_phep(ma_don, nhanvien_id, ly_do, ngay_xin_phep, status) 
                              VALUES('$maDon', $nhanVien, '$lyDo', '$ngayXinPhep', 0)";


					$result_insert = mysqli_query($conn, $insert);

					if (!$result_insert) {
						$error['database'] = 'Lỗi khi thêm đơn: ' . mysqli_error($conn);
						$showMess = false;
					} else {
						$success['success'] = 'Thêm đơn xin nghỉ phép thành công';
						echo '<script>
                            setTimeout(function() { 
                                window.location="don-xin-phep.php"; 
                            }, 3000);
                        </script>';
					}
				}
			}
		}
	}

	// delete record
	if (isset($_POST['delete'])) {
		$showMess = true;

		$id = $_POST['idDon'];
		$delete = "DELETE FROM don_nghi_phep WHERE id = $id";
		mysqli_query($conn, $delete);
		$success['success'] = 'Xóa đơn xin nghỉ phép thành công.';
		echo '<script>setTimeout("window.location=\'don-xin-phep.php\'",1000);</script>';
	}

	// Xử lý duyệt đơn
	if (isset($_POST['approve'])) {
		$idDon = $_POST['idDon'];
		$status = 1; // For approve
		$update = "UPDATE don_nghi_phep SET status = '$status' WHERE id = '$idDon'";
		$result_update = mysqli_query($conn, $update);
		$success['success'] = 'Đã duyệt đơn xin phép thành công.';
		echo '<script>setTimeout("window.location=\'don-xin-phep.php\'",1000);</script>';
	}

	// Xử lý từ chối đơn
	if (isset($_POST['reject'])) {
		$idDon = $_POST['idDon'];
		$status = 2; // For reject
		$update = "UPDATE don_nghi_phep SET status = '$status' WHERE id = '$idDon'";
		$result_update = mysqli_query($conn, $update);

		if (!$result_update) {
			echo "<script>alert('Lỗi khi từ chối đơn: " . mysqli_error($conn) . "');</script>";
		} else {
			echo "<script>
				window.location='don-xin-phep.php';
			</script>";
		}
	}

	// hien thi nhan vien
	$nv = "SELECT id, ma_nv, ten_nv FROM nhanvien ORDER BY id DESC";
	$resultNV = mysqli_query($conn, $nv);
	$arrNV = array();
	if ($resultNV) {
		while ($rowNV = mysqli_fetch_array($resultNV)) {
			$arrNV[] = $rowNV;
		}
	} else {
		echo "<div class='alert alert-danger'>Lỗi khi truy vấn danh sách nhân viên: " . mysqli_error($conn) . "</div>";
	}
?>
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<form method="POST">
					<div class="modal-header">
						<span style="font-size: 18px;">Thông báo</span>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<input type="hidden" name="idDon">
						Bạn có thực sự muốn xóa đơn xin nghỉ phép này?
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy bỏ</button>
						<button type="submit" class="btn btn-primary" name="delete">Xóa</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<h1>
				Đơn xin nghỉ phép
			</h1>
			<ol class="breadcrumb">
				<li><a href="index.php?p=index&a=statistic"><i class="fa fa-dashboard"></i> Tổng quan</a></li>
				<li><a href="don-xin-phep.php?p=staff&a=leave">Đơn xin nghỉ phép</a></li>
				<li class="active">Danh sách đơn xin nghỉ phép</li>
			</ol>
		</section>

		<!-- Main content -->
		<section class="content">
			<div class="row">
				<div class="col-xs-12">
					<div class="box box-primary">
						<div class="box-header with-border">
							<h3 class="box-title">Thêm đơn xin nghỉ phép</h3>
							<div class="box-tools pull-right">
								<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
								<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
							</div>
						</div>
						<!-- /.box-header -->
						<div class="box-body">
							<?php
							// show error
							if (isset($error) && !empty($error)) {
								if ($showMess == false) {
									echo "<div class='alert alert-danger alert-dismissible'>";
									echo "<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>";
									echo "<h4><i class='icon fa fa-ban'></i> Lỗi!</h4>";
									foreach ($error as $err) {
										echo $err . "<br/>";
									}
									echo "</div>";
								}
							}
							?>
							<?php
							// show success
							if (isset($success) && !empty($success)) {
								if ($showMess == true) {
									echo "<div class='alert alert-success alert-dismissible'>";
									echo "<h4><i class='icon fa fa-check'></i> Thành công!</h4>";
									foreach ($success as $suc) {
										echo $suc . "<br/>";
									}
									echo "</div>";
								}
							}
							?>
							<form action="" method="POST">
								<div class="row">
									<div class="col-md-12">
										<div class="form-group">
											<label>Mã đơn xin phép: </label>
											<input type="text" class="form-control" name="maDon" value="<?php echo $maDon; ?>" readonly>
										</div>
										<div class="form-group">
											<label>Chọn nhân viên <span style="color: red;">*</span>: </label>
											<select class="form-control" name="nhanVien">
												<option value="chon">--- Chọn nhân viên ---</option>
												<?php
												if (!empty($arrNV)) {
													foreach ($arrNV as $nv) {
														echo "<option value='" . $nv['id'] . "'>" . $nv['ma_nv'] . " - " . $nv['ten_nv'] . "</option>";
													}
												} else {
													echo "<option value=''>Không có dữ liệu nhân viên</option>";
												}
												?>
											</select>
										</div>
										<div class="form-group">
											<label>Lý do xin nghỉ <span style="color: red;">*</span>: </label>
											<textarea name="lyDo" class="form-control" rows="3" placeholder="Nhập lý do xin nghỉ phép..."><?php echo isset($_POST['lyDo']) ? $_POST['lyDo'] : ''; ?></textarea>
										</div>
										<div class="form-group">
											<label>Ngày xin nghỉ <span style="color: red;">*</span>: </label>
											<input type="date" class="form-control" name="ngayXinPhep" value="<?php echo date('Y-m-d'); ?>">
										</div>
										<button type="submit" class="btn btn-primary" name="save">
											<i class="fa fa-plus"></i> Thêm đơn xin nghỉ phép
										</button>
									</div>
									<!-- /.col -->
								</div>
								<!-- /.row -->
							</form>
						</div>
						<!-- /.box-body -->
					</div>
					<!-- /.box -->
					<div class="box">
						<div class="box-header">
							<h3 class="box-title">Danh sách đơn xin phép</h3>
						</div>
						<!-- /.box-header -->
						<div class="box-body">
							<table id="example1" class="table table-bordered table-striped">
								<thead>
									<tr>
										<th>STT</th>
										<th>Mã đơn</th>
										<th>Tên nhân viên</th>
										<th>Lý do</th>
										<th>Ngày xin phép</th>
										<th>Trạng thái</th>
										<?php if (isset($row_acc) && $row_acc['quyen'] == 1) { ?>
											<th>Thao tác</th>
										<?php } ?>
									</tr>
								</thead>
								<tbody>
									<?php
									if (!empty($arrShow)) {
										$count = 1;
										foreach ($arrShow as $arrS) {
									?>
											<tr>
												<td><?php echo $count; ?></td>
												<td><?php echo $arrS['ma_don']; ?></td>
												<td><?php echo $arrS['ten_nhan_vien']; ?></td>
												<td><?php echo $arrS['ly_do']; ?></td>
												<td><?php echo date('d-m-Y', strtotime($arrS['ngay_xin_phep'])); ?></td>
												<td>
													<?php
													switch ($arrS['status']) {
														case 0:
															echo '<span class="badge bg-yellow">Chờ duyệt</span>';
															break;
														case 1:
															echo '<span class="badge bg-green">Đã duyệt</span>';
															break;
														case 2:
															echo '<span class="badge bg-red">Từ chối</span>';
															break;
														default:
															echo 'Không xác định';
													}
													?>
												</td>
												<?php if (isset($row_acc) && $row_acc['quyen'] == 1) { ?>
													<td>
														<?php if ($arrS['status'] == 0) { ?>
															<button type="button" class="btn btn-primary btn-sm" data-toggle="modal"
																data-target="#approveModal<?php echo $arrS['id']; ?>">
																<i class="fa fa-check"></i> Duyệt
															</button>

														<?php } ?>
														<?php
														echo "<button type='button' class='btn bg-maroon btn-flat' data-toggle='modal' data-target='#exampleModal' data-whatever='" . $arrS['id'] . "'><i class='fa fa-trash'></i></button>";
														?>

													</td>
												<?php } ?>
											</tr>

											<!-- Modal Approve -->
											<div class="modal fade" id="approveModal<?php echo $arrS['id']; ?>" tabindex="-1" role="dialog"
												aria-labelledby="approveModalLabel<?php echo $arrS['id']; ?>" aria-hidden="true">
												<div class="modal-dialog" role="document">
													<div class="modal-content">
														<form method="POST">
															<div class="modal-header">
																<span style="font-size: 18px;">Xác nhận duyệt đơn</span>
																<button type="button" class="close" data-dismiss="modal" aria-label="Close">
																	<span aria-hidden="true">&times;</span>
																</button>
															</div>
															<div class="modal-body">
																<input type="hidden" name="idDon" value="<?php echo $arrS['id']; ?>">
																<p>Bạn có chắc chắn muốn duyệt đơn xin nghỉ phép này?</p>
															</div>
															<div class="modal-footer">
																<button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy bỏ</button>
																<button type="submit" class="btn btn-success" name="approve">Duyệt</button>
																<button type="submit" class="btn btn-danger" name="reject">Từ chối</button>
															</div>
														</form>
													</div>
												</div>
											</div>
										<?php
											$count++;
										}
									} else {
										?>
										<tr>
											<td colspan="7" class="text-center">Không có dữ liệu</td>
										</tr>
									<?php } ?>
								</tbody>
							</table>
						</div>
					</div>
					<!-- /.box-body -->
				</div>
				<!-- /.box -->
			</div>
			<!-- /.col -->
	</div>
	<!-- /.row -->
	</section>
	<!-- /.content -->
	</div>

<?php
	// include
	include('../layouts/footer.php');
} else {
	// go to pages login
	header('Location: dang-nhap.php');
}
?>
