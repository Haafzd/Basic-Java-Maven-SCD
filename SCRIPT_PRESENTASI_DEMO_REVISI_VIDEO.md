# Script Presentasi Demo - Haafzd/Basic-Java-Maven-SCD

## Alur Demo Singkat

1. Buka repository package: `Haafzd/Basic-Java-Maven-SCD`.
2. Jelaskan konsep dari materi: ada repo package (`pkg`) dan repo deployment (`deploy`).
3. Buka `pom.xml` untuk menjelaskan artifact, version, dependency JUnit, dan distribution target GitHub Packages.
4. Buka `setting.ini` untuk menjelaskan versioning `major.minor.patch`.
5. Buka `Counter.java` dan `CounterTest.java`.
6. Jalankan `mvn clean test`.
7. Jalankan `mvn clean verify`.
8. Buka `.github/workflows/maven.yml` untuk CI.
9. Buka `.github/workflows/maven-publish.yml` untuk publish package saat release dibuat.
10. Buka `.github/workflows/trigger-deploy.yml` dan `deploy/deploy.sh` untuk simulasi trigger repository deployment.
11. Buat GitHub Release `v0.3.5`.
12. Tunjukkan workflow Actions berjalan.
13. Tunjukkan package di GitHub Packages.
14. Jelaskan error 409 kalau versi yang sama dipublish ulang.

---

## Script Narasi 3-5 Menit

Assalamualaikum warahmatullahi wabarakatuh.

Di video ini saya akan menjelaskan repository `Haafzd/Basic-Java-Maven-SCD`. Project ini adalah project Java Maven sederhana yang dipakai untuk simulasi Continuous Integration dan Continuous Delivery menggunakan GitHub Actions.

Sesuai materi yang diajarkan, alur delivery di sini tidak hanya build project, tapi juga publish package dan menyiapkan proses deployment. Konsepnya ada dua repository: repository package atau `pkg`, yaitu `Haafzd/Basic-Java-Maven-SCD`, dan repository deployment atau `deploy`, yaitu repository yang nantinya menerima trigger setelah package dirilis.

Pertama saya buka file `pom.xml`. Di sini terlihat artifact project bernama `contohproject`, versinya `0.3.5`, dan packaging-nya adalah `jar`. Dependency testing yang digunakan adalah JUnit `4.13.2`. Di bagian bawah juga ada `distributionManagement`, yang mengarah ke GitHub Packages dengan URL `https://maven.pkg.github.com/Haafzd/Basic-Java-Maven-SCD`. Bagian ini penting karena Maven perlu tahu ke mana artifact akan dipublish saat menjalankan `mvn deploy`.

Berikutnya saya buka file `setting.ini`. File ini dipakai untuk versioning dengan format `major.minor.patch`. Untuk project ini nilainya adalah `0.3.5`, jadi sama dengan versi yang ada di `pom.xml`. Tujuannya supaya versi rilis bisa lebih mudah dibaca dan disinkronkan dengan proses deployment.

Sekarang saya buka source code. Di project ini class utamanya adalah `Counter`. Class ini berisi beberapa method seperti `reset`, `increment`, `decrement`, `increaseBy`, `decreaseBy`, `multiplyBy`, `triple`, `powerBy`, `isCountEven`, dan `getCount`. Jadi secara fungsi, project ini fokus ke operasi sederhana pada nilai counter.

Untuk memastikan semua method berjalan benar, ada file `CounterTest.java`. File ini menggunakan JUnit untuk menguji behavior dari class `Counter`. Misalnya ketika `increment` dipanggil, nilai counter harus bertambah. Ketika `decrement` dipanggil, nilai counter harus berkurang.

Sekarang saya jalankan pengujian lokal terlebih dahulu:

```bash
mvn clean test
```

Command ini membersihkan hasil build sebelumnya, lalu menjalankan unit test. Kalau hasilnya `BUILD SUCCESS`, berarti test berhasil.

Setelah itu saya jalankan command verifikasi:

```bash
mvn clean verify
```

Command ini menjalankan lifecycle Maven sampai tahap verify. Jadi project tidak hanya dites, tapi juga dipastikan valid untuk masuk pipeline CI.

Selanjutnya saya buka workflow CI di `.github/workflows/maven.yml`. Workflow ini berjalan saat ada `push` atau `pull_request` ke branch `main`. Runner yang digunakan adalah `ubuntu-latest`, JDK-nya Temurin 17, dan Maven cache diaktifkan agar proses build lebih cepat. Command utama yang dijalankan adalah:

```bash
mvn clean verify
```

Jadi setiap perubahan kode yang masuk ke branch `main` otomatis dicek oleh GitHub Actions. Kalau build atau test gagal, workflow akan merah. Kalau semuanya aman, workflow akan hijau.

Berikutnya saya buka workflow publish di `.github/workflows/maven-publish.yml`. Workflow ini berjalan ketika GitHub Release dibuat. Di workflow ini Maven menjalankan:

```bash
mvn deploy
```

Command ini akan mempublish artifact `contohproject-0.3.5.jar` ke GitHub Packages. Untuk autentikasi, workflow memakai `${{ secrets.GITHUB_TOKEN }}`, yaitu token otomatis dari GitHub Actions.

Dalam materi juga dijelaskan bahwa kalau kita mencoba publish versi yang sama lebih dari sekali, GitHub Packages bisa mengembalikan error `409 Conflict`. Itu artinya versi package tersebut sudah pernah dipublish. Solusinya adalah menaikkan versi, misalnya dari `0.3.5` ke `0.3.6`, lalu buat release baru.

Selain publish package, saya juga menyiapkan workflow `trigger-deploy.yml`. Workflow ini membaca versi dari `setting.ini`, menjalankan script `deploy/deploy.sh`, lalu mengirim trigger ke repository deployment menggunakan repository dispatch. Jadi konsep dua repository dari materi tetap terlihat: repository pertama untuk package, repository kedua untuk deployment.

Untuk simulasi release, langkahnya adalah masuk ke menu `Releases`, klik `Create a new release`, isi tag `v0.3.5`, lalu klik `Publish release`. Setelah release dibuat, GitHub Actions otomatis menjalankan workflow publish package dan trigger deployment. Kita bisa mengeceknya di tab `Actions`.

Kalau workflow sukses, package akan muncul di GitHub Packages. Ini menunjukkan proses delivery berjalan karena artifact sudah tersedia untuk digunakan oleh repository atau environment lain.

Kesimpulannya, repository ini sudah menunjukkan alur CI/CD yang sesuai materi: ada build dan test otomatis lewat CI, publish package saat release dibuat, penggunaan versioning lewat `setting.ini`, dan simulasi trigger ke repository deployment. Dengan alur seperti ini, proses release jadi lebih rapi, lebih konsisten, dan tidak terlalu bergantung pada proses manual.

Sekian penjelasan dari saya. Terima kasih.

Wassalamualaikum warahmatullahi wabarakatuh.

---

## Bagian Layar yang Wajib Ditunjukkan

- Repository GitHub `Haafzd/Basic-Java-Maven-SCD`.
- File `pom.xml` bagian `artifactId`, `version`, dependency JUnit, dan `distributionManagement`.
- File `setting.ini`.
- File `Counter.java`.
- File `CounterTest.java`.
- Terminal saat `mvn clean test` sukses.
- Terminal saat `mvn clean verify` sukses.
- File `.github/workflows/maven.yml`.
- File `.github/workflows/maven-publish.yml`.
- File `.github/workflows/trigger-deploy.yml`.
- File `deploy/deploy.sh`.
- Halaman GitHub Release.
- Tab Actions dengan workflow hijau.
- Halaman Packages.

---

## Catatan Troubleshooting Saat Demo

Kalau workflow publish gagal dengan error `409 Conflict`, jelaskan seperti ini:

> Error ini muncul karena versi package yang sama sudah pernah dipublish ke GitHub Packages. GitHub tidak mengizinkan upload ulang artifact dengan version yang sama. Solusinya adalah menaikkan version di `pom.xml` dan `setting.ini`, misalnya dari `0.3.5` menjadi `0.3.6`, lalu membuat GitHub Release baru.

Kalau workflow trigger deployment gagal karena `DEPLOY_REPO_TOKEN`, jelaskan seperti ini:

> Workflow trigger deploy membutuhkan token tambahan karena dia mengirim event ke repository lain. Token ini disimpan sebagai secret bernama `DEPLOY_REPO_TOKEN`. Untuk demo konsep, bagian script dan payload sudah disiapkan; di GitHub asli token harus ditambahkan lewat Settings > Secrets and variables > Actions.
