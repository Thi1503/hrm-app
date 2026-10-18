# HRM App – Mobile (Flutter)

Mobile client for a Human Resource Management (HRM) system, built with **Flutter**.
This is my graduation thesis project at Hanoi University of Science and Technology (HUST), Faculty of Mathematics and Informatics.

- ⚙️ Backend (Spring Boot microservices): [Thi1503/hrm-system](https://github.com/Thi1503/hrm-system)
- 📄 Thesis report (Vietnamese): [Google Drive](https://drive.google.com/drive/folders/1Pl_UIzOCvxO3_jDpaXXWq2yf2yQ3OhWg?usp=sharing)

## Features

**Connected to the backend API**
- Login with JWT; the token is stored on the device.
- GPS check-in / check-out on a map (`flutter_map`, `location`).
- Attendance log history.
- View and update personal information.
- Create, list and view details of **leave**, **overtime** and **attendance explanation** requests.
- **Approval flow:** managers and HR can approve or reject requests (manager → HR, two levels).

**UI only (mock data, not yet connected to the API)**
- Remote work requests.
- Notifications.
- Timesheet, payslip and the management menu (departments, positions, employee records).

## Tech stack

Flutter 3.24.5 (pinned with [FVM](https://fvm.app)) · Dart 3.5 · GetX (state management, routing, DI) · Dio · GetStorage / Hive · flutter_map + latlong2 · location · permission_handler · intl (vi / en)

## Project structure

```
lib
├── application   # app setup (theme, routes, initialization)
├── base          # base controller, base request (Dio), responses, errors, shared widgets, themes
├── const         # API URLs, colors, constants
├── features      # one folder per feature
│   ├── login
│   ├── home
│   ├── attendance      # GPS check-in / check-out
│   ├── propose         # leave, overtime, remote, attendance explanation
│   ├── individual      # attendance history, timesheet, payslip
│   ├── manage
│   ├── notification
│   ├── profile
│   └── update_account_info
├── locales       # translations
├── routes        # route names & pages
└── utils         # helpers, formatters, reusable widgets
```

Each feature is split into `controller` (GetX), `repository` (API calls), `models` and `view`.

## Getting started

**Requirements:** Flutter 3.24.5 (or FVM), Android Studio / Xcode, and the [backend](https://github.com/Thi1503/hrm-system) running locally.

```bash
fvm install          # or use a local Flutter 3.24.5
fvm flutter pub get
fvm flutter run
```

The app calls the API Gateway on port `8086` (see `lib/const/const.dart`):
- Android emulator: `http://10.0.2.2:8086`
- iOS simulator: `http://localhost:8086`

For a real device, change `baseUrl` to your machine's LAN IP.

> Note: `pubspec.yaml` includes `dio_log_sds`, a package hosted on a private Git server. If `pub get` fails because of it, remove the dependency and its usages. It is only a debug HTTP log viewer, used in `base/requests/base_request.dart`, `routes/` and `features/home/view/home_page.dart`.

### Sample accounts

| Username | Password | Role |
|---|---|---|
| admin | admin@123 | Admin |
| hr | hr@123 | HR |
| manager | manager@123 | Manager |
| employee | employee@123 | Employee |

## Author

**Le Dinh Thi** – Graduation thesis, HUST (2026)
Supervisor: MSc. Nguyen Tuan Dung
