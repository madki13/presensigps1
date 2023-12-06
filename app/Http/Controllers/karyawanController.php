<?php

namespace App\Http\Controllers;

use App\Models\Karyawan;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;

class karyawanController extends Controller
{
    public function index(Request $request)
    {
        $query = Karyawan::query();
        $query->select('karyawan.*', 'nama_divisi');
        $query->join('divisi', 'karyawan.kode_divisi', '=', 'divisi.kode_divisi');
        $query->orderBy('nama_lengkap');
        if (!empty($request->nama_karyawan)) {
            $query->where('nama_lengkap', 'like', '%' . $request->nama_karyawan . '%');
        }

        if (!empty($request->kode_divisi)) {
            $query->where('karyawan.kode_divisi', $request->kode_divisi);
        }
        //atur 1 halaman tampil berapa data
        $karyawan = $query->paginate(5);

        $divisi = DB::table('divisi')->get();
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
        return view('karyawan.index', compact('sapa', 'karyawan', 'divisi'));
    }

    public function store(Request $request){
        $nik = $request->nik;
        $nama_lengkap = $request->nama_lengkap;
        $jabatan = $request->jabatan;
        $no_hp = $request->no_hp;
        $kode_divisi = $request->kode_divisi;
        $password = Hash::make('12345');
        if ($request->hasFile('foto')) {
            $foto = $nik . "." . $request->file('foto')->getClientOriginalExtension();
        } else {
            $foto = null;
        };

        try {
            $data = [
                'nik' => $nik,
                'nama_lengkap' => $nama_lengkap,
                'jabatan' => $jabatan,
                'no_hp' => $no_hp,
                'kode_divisi' => $kode_divisi,
                'foto' => $foto,
                'password' => $password
            ];
            $simpan = DB::table('karyawan')->insert($data);
            if ($simpan) {
                if ($request->hasFile('foto')) {
                    $folderPath = "public/uploads/karyawan";
                    $request->file('foto')->storeAs($folderPath, $foto);
                }
                return Redirect::back()->with(['success' => 'data berhasil disimpan']);
            }
        } catch (\Exception $e) {
            // dd($e->message);
            return Redirect::back()->with(['success' => 'data gagal disimpan']);
        }
    }

    public function edit(Request $request) {
        $nik = $request->nik;
        $divisi = DB::table('divisi')->get();
        $karyawan = DB::table('karyawan')->where('nik', $nik)->first();
        return view('karyawan.edit', compact('divisi', 'karyawan'));
    }

    public function update($nik, Request $request){
        $nik = $request->nik;
        $nama_lengkap = $request->nama_lengkap;
        $jabatan = $request->jabatan;
        $no_hp = $request->no_hp;
        $kode_divisi = $request->kode_divisi;
        $password = Hash::make('12345');
        $old_foto = $request->old_foto;
        if ($request->hasFile('foto')) {
            $foto = $nik . "." . $request->file('foto')->getClientOriginalExtension();
        } else {
            $foto = $old_foto;
        };

        try {
            $data = [
                'nama_lengkap' => $nama_lengkap,
                'jabatan' => $jabatan,
                'no_hp' => $no_hp,
                'kode_divisi' => $kode_divisi,
                'foto' => $foto,
                'password' => $password
            ];
            $update = DB::table('karyawan')->where('nik', $nik)->update($data);
            if ($update) {
                if ($request->hasFile('foto')) {
                    $folderPath = "public/uploads/karyawan";
                    $folderPathOld = "public/uploads/karyawan" . $old_foto;
                    Storage::delete($folderPathOld);
                    $request->file('foto')->storeAs($folderPath, $foto);
                }
                return Redirect::back()->with(['success' => 'data berhasil diupdate']);
            }
        } catch (\Exception $e) {
            // dd($e->message);
            return Redirect::back()->with(['success' => 'data gagal diupdate']);
        }
    }

    public function delete($nik) {
        $delete = DB::table('karyawan')->where('nik', $nik)->delete();
        if ($delete) {
            return Redirect::back()->with(['success' => 'data berhasil dihapus']);
        }else{
            return Redirect::back()->with(['success' => 'data gagal diupdate']);
        }
    }

    public function resetpassword($nik){

        $nik = Crypt::decrypt($nik);
        $password = Hash::make('12345');
        $reset = DB::table('karyawan')->where('nik', $nik)->update([
            'password' => $password
        ]);

        if($reset) {
            return Redirect::back()->with(['success' => 'Password Berhasil Direset Menjadi 12345']);
        }else {
            return Redirect::back()->with(['success' => 'Password Gagal Diresetk']);
        }
    }
}
