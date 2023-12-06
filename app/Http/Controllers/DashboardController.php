<?php

namespace App\Http\Controllers;

use App\Models\Karyawan;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class DashboardController extends Controller
{
    public function index()
    {

        $hariini = date("Y-m-d");
        $hari = date("d");
        $bulanini = date("m") * 1;
        $tahunini = date("Y");
        $nik = Auth::guard('karyawan')->user()->nik;
        $karyawan = DB::table('karyawan')->where('nik', $nik)->first();
        $presensihariini = DB::table('presensi')->where('nik', $nik)->where('tgl_presensi', $hariini)->first();
        $historibulanini = DB::table('presensi')
            ->where('nik', $nik)
            ->whereRaw('MONTH(tgl_presensi)="' . $bulanini . '"')
            ->whereRaw('YEAR(tgl_presensi)="' . $tahunini . '"')
            ->orderBy('tgl_presensi')
            ->get();
        // $rekappresensi = DB::table('presensi')
        //     ->selectRaw('COUNT(nik) as jmlhadir, SUM(IF(jam_in > "07:00", 1, 0)) as jmlterlambat')
        //     ->where('nik', $nik)
        //     ->whereRaw('MONTH(tgl_presensi)="' . $bulanini . '"')
        //     ->whereRaw('YEAR(tgl_presensi)="' . $tahunini . '"')
        //     ->first();

        $history_hari_ini = DB::table('presensi')->where('nik', $nik)
            ->whereRaw('DAY(tgl_presensi)= "' . $hari . '"')
            ->whereRaw('MONTH(tgl_presensi)="' . $bulanini . '"')
            ->whereRaw('YEAR(tgl_presensi)="' . $tahunini . '"')
            ->orderBy('tgl_presensi')
            ->get()
            ->sortByDesc('jam_in');

        $leaderboard = DB::table('presensi')
            ->join('karyawan', 'presensi.nik', '=', 'karyawan.nik')
            ->where('tgl_presensi', $hariini)
            ->orderBy('jam_in')
            ->get();

        $rekap_presensi = DB::table('presensi')
            ->selectRaw('COUNT(nik) as jmlhadir')
            ->whereRaw('DAY(tgl_presensi)= "' . $hari . '"')
            ->whereRaw('MONTH(tgl_presensi)="' . $bulanini . '"')
            ->whereRaw('YEAR(tgl_presensi)="' . $tahunini . '"')
            ->first();

        $time = date('H:i:s');
        if ($time >= '03:00:00' && $time <= '10:00:59') {
            $salam = 'Selamat Pagi';
            // $time_kerja = 'Masuk';
        } elseif ($time >= '10:01:00' && $time <= '15:00:59') {
            $salam = 'Selamat Siang';
            // $time_kerja = 'Pulang';
        } elseif ($time >= '15:01:00' && $time <= '18:00:59') {
                $salam = 'Selamat Sore';
        } else {
            $salam = 'Selamat Malam';
        }
        $namabulan = ["", "Januari", "Februari", "Maret", "April", "Mei", "Juni", "Agustus", "September", "Oktober", "November", "Desember"];
        return view('dashboard.dashboard', compact('presensihariini', 'historibulanini', 'namabulan', 'bulanini', 'tahunini', 'leaderboard','salam'));
    }

    public function  dashboardadmin()
    {
        $hariini = date("Y-m-d");
        $hari = date("d");
        $bulanini = date("m");
        $tahunini = date("Y");
        $sapa = "";
        $time = date('H:i:s');
        if ($time >= '03:00:00' && $time <= '10:00:59') {
            $sapa = 'Selamat Pagi';
            // $time_kerja = 'Masuk';
        } elseif ($time >= '10:01:00' && $time <= '15:00:59') {
            $sapa = 'Selamat Siang';
            // $time_kerja = 'Pulang';
        } elseif ($time >= '15:01:00' && $time <= '18:00:59') {
            $sapa = 'Selamat Sore';
        } else {
            $sapa = 'Selamat Malam';
        }
        $rekap_presensi = DB::table('presensi')
            ->selectRaw('COUNT(nik) as jmlhadir')
            ->where('tgl_presensi', $hariini)
            ->first();

        $jumlahuser = DB::table('Karyawan')
            ->selectRaw('COUNT(nik) as jmlhuser')
            ->first();

        return view('dashboard.dashboardadmin', compact('sapa', 'rekap_presensi', 'jumlahuser'));
    }
}
