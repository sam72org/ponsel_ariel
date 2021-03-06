@extends('layouts.app')

@section('content')

    <style type="text/css">
        .table-bordered {
            border : 1px solid #d1d1d1;
        }
        .table-bordered > tbody > tr > td {
            border : 1px solid #d1d1d1;
        }
        .table-bordered > thead > tr > th {
            border : 1px solid #d1d1d1;
        }
    </style>
    
    <section class="content-header">
        <h1>
            Data Penjualan Pulsa
            <small>{{ date('d-m-Y H:i') }} </small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
            <li><a href="#">Examples</a></li>
            <li class="active">Blank page</li>
        </ol>
    </section>

    <!-- Main content -->
    <section class="content">

    <!-- Default box -->
    <div class="box">
        <div class="box-header with-border">
            <p><a href="{{ url('ta-pulsa/tambah') }}" class="btn btn-flat btn-primary"><i class="fa fa-plus"></i> Tambah Baru</a></p>
        </div>

        <div class="box-body">
            <table class="table table-bordered table-striped tabel-json">
                <thead>
                    <tr>
                        <td style="text-align: center;">No</td>
                        <td style="text-align: center;">Kategori</td>
                        <td style="text-align: center;">Operator</td>
                        <th style="text-align: center;">No HP</th>
                        <th style="text-align: center;">Nominal</th>
                        <th style="text-align: center;">Harga</th>
                        <th style="text-align: center;">Tanggal</th>
                        <th style="text-align: center;">Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    <?php $no=1; foreach ($model as $data) : ?>
                        <tr>
                            <td style="text-align: center; width: 5%;">{{ $no++ }}</td>
                            <td style="text-align: center;">{{ $data->kategori }}</td>
                            <td style="text-align: center;">{{ $data->operator }}</td>
                            <td style="text-align: center;">{{ $data->no_hp }}</td>
                            <td style="text-align: right;">{{ number_format($data->nominal,0,",",".") }}</td>
                            <td style="text-align: right;">{{ number_format($data->harga,0,",",".") }}</td>
                            <td style="text-align: center;">{{ date('d-m-Y', strtotime($data->created_at)) }}</td>
                            <td style="text-align: center;">
                                <a href ="{{ url('ta-pulsa/ubah').'/'.$data->id }}" class="btn btn-xs btn-warning" style="margin-right:5px;"><i class="fa fa-edit"></i> Ubah</a>
                                <!-- <a href ="ta-penjualan/print/{{ $data->no_penjualan }}" class="btn btn-small btn-primary" target="_blank"><i class="fa fa-print"></i> </a> -->
                            </td>
                        </tr>
                    <?php endforeach ?>
                </tbody>
            </table>
        </div>
    </div>
    <!-- /.box -->
    </section>
@stop


@push('scripts')
<script>
$(document).ready(function() {
    $('.tabel-json').DataTable();
});
</script>
@endpush
