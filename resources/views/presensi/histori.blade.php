@extends('layouts.presensi')
@section('header')

<!-- App Header -->
<div class="appHeader bg-primary text-light">
    <div class="left">
        <a href="javascript:;" class="headerButton goBack">
            <ion-icon name="chevron-back-outline"></ion-icon>
        </a>
    </div>
    <div class="pageTitle">History Hari Ini</div>
    <div class="right"></div>
</div>


<!-- * App Header -->
@endsection

@section('content')
<br>
<div class="presencetab mt-4">
    <div class="col">
        <strong>{{Auth::guard('karyawan')->user()->nama_lengkap}}</strong>
    <div>{{ date("d-M-Y") }}</div><br>
<ul class="listview image-listview">
@foreach($history_hari_ini as $d)
    {{-- <li>
        <div class="item">
            <div class="in">

                    <div><span class="badge badge-success">IN {{$d->keterangan_in}}- {{$d->jam_in}}</span><br>
                    <span class="badge badge-danger">OUT - {{ $presensi_hari_ini != NULL && $d->jam_out != NULL ? $d->jam_out : 'Belum Laporan'}}</span>
                </div>
            </div>
        </div>
    </li> --}}

@endforeach
</ul>
</div>
</div>

@endsection
