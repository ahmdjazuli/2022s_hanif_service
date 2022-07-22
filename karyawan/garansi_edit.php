<?php require('atas.php');$notransaksi = $_GET['notransaksi'];
  $query = mysqli_query($kon, "SELECT * FROM dataservice WHERE notransaksi = '$notransaksi'");
  $data = mysqli_fetch_array($query); ?>
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header"><button class="btn btn-danger btn-lg"><a href="garansi.php" style="color: white; text-decoration: none"> <i class="fa fa-angle-left"></i> Kembali</a></button></h1>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6">
                <div class="panel panel-default">
                    <div class="panel-body">
                         <form role="form" action="" method="POST">
                            <div class="form-group">
                                <label>No. Transaksi</label>
                                <input class="form-control" type="text" value="<?= $data['notransaksi'] ?>" readonly>
                            </div>
                            <div class="form-group">
                                <label>Nama Pelanggan</label>
                                <input class="form-control" type="text" value="<?= $data['namap'] ?>" readonly>
                            </div>
                            <div class="form-group">
                                <label>Nama Barang</label>
                                <input class="form-control" type="text" value="<?= $data['barang'] ?>" readonly>
                            </div>
                            <div class="form-group">
                                <label>Kerusakan Awal</label>
                                <input class="form-control" type="text" value="<?= $data['kerusakan'] ?>" readonly>
                            </div>
                            <div class="form-group">
                                <label>Kerusakan Baru</label>
                                <input class="form-control" type="text" value="<?= $data['kerusakanbaru'] ?>" name="kerusakanbaru" required>
                            </div>
                            <div class="form-group">
                                <label>Kondisi Barang</label>
                                <select name="kondisibrg" class="form-control" required>
                                    <option value="<?= $data['kondisibrg'] ?>"><?= $data['kondisibrg'] ?></option>
                                    <option value="Baik">Baik</option>
                                    <option value="Masih Rusak">Masih Rusak</option>
                                </select>
                            </div>
                            <button type="submit" name="simpan" class="btn btn-outline btn-primary"><i class="fa fa-check-square"></i> Simpan</button>
                            <button type="reset" class="btn btn-outline btn-default"><i class="fa fa-refresh"></i> Ulangi</button>
                        </form>
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-12 -->
        </div>
    </div>
    <!-- /.container-fluid -->
</div>
<!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper -->
<?php require('bawah.php') ?>
<?php
  if (isset($_POST['simpan'])) {
    $kerusakanbaru     = $_REQUEST['kerusakanbaru'];
    $kondisibrg = $_REQUEST['kondisibrg'];

    $tambah = mysqli_query($kon,"UPDATE dataservice SET kerusakanbaru = '$kerusakanbaru',kondisibrg = '$kondisibrg' WHERE notransaksi = '$notransaksi'");
    if($tambah){
      ?> <script>alert("Berhasil Disimpan");window.location='garansi.php';</script> <?php
    }else{
      ?> <script>alert("Gagal Disimpan");window.location='garansi_edit.php?notransaksi=<?= $notransaksi ?>';</script> <?php
    }
  }
?>