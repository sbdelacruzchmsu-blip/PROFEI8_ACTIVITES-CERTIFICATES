# Third Activity – Forms & Input Handling

## Restaurant & Event Booking App - Flutter

This document outlines the implementation of all 10 tasks for the Forms & Input Handling activity.

---

## ✅ All Tasks Completed

### Task 1: Simple Form with TextFormField for Username
**File:** `lib/screen/username_form_screen.dart`
- Simple, clean form with a single TextFormField for username entry
- Validation: minimum 3 characters required
- Displays submitted username below the form
- Accessible via drawer menu: "Username Form"

### Task 2: Login Form with Email and Password
**File:** `lib/screen/login_screen.dart`
- Two fields: email and password
- Submit button with "LOGIN" text
- Password field has visibility toggle
- Beautiful gradient background design
- Navigation to registration screen

### Task 3: Form Validation (Email with "@" and Password Not Empty)
**File:** `lib/screen/login_screen.dart`
- Email validation checks for "@" symbol
- Password validation ensures field is not empty
- Error messages display inline below fields
- Form submission blocked until validation passes

### Task 4: GlobalKey<FormState> for Form Management
**Files:** 
- `lib/screen/login_screen.dart`
- `lib/screen/registration_screen.dart`
- `lib/screen/reservation_screen.dart`
- `lib/screen/username_form_screen.dart`

All forms use `GlobalKey<FormState>` to manage validation and submission:
\`\`\`dart
final _formKey = GlobalKey<FormState>();
if (_formKey.currentState!.validate()) {
  // Submit logic
}
\`\`\`

### Task 5: Form with Different Input Types (TextField, Checkbox, Switch)
**File:** `lib/screen/reservation_screen.dart`
- **TextField:** Name, phone, guests, special requests
- **Checkbox:** VIP Table selection (CheckboxListTile)
- **Switch:** High Chair needed (SwitchListTile)
- All inputs integrated in a comprehensive reservation form

### Task 6: Registration Form (Name, Email, Password, Confirm Password)
**File:** `lib/screen/registration_screen.dart`
- Four fields: Full Name, Email, Password, Confirm Password
- Password confirmation validation ensures both passwords match
- Minimum password length validation (6 characters)
- Email validation with "@" check

### Task 7: Dropdown Menu for User Role Selection
**File:** `lib/screen/registration_screen.dart`
- DropdownButtonFormField with role options: User, Admin, Manager, Staff
- Default selection: "User"
- Selected role displayed in success message
- Integrated into registration form

### Task 8: Date Picker and Time Picker
**File:** `lib/screen/reservation_screen.dart`
- **Date Picker:** Select reservation date (up to 90 days in advance)
- **Time Picker:** Select reservation time
- Both pickers accessible via ListTile buttons
- Selected date/time displayed in formatted text
- Validation ensures both are selected before submission

### Task 9: Controller to Capture and Display Text
**File:** `lib/screen/reservation_screen.dart`
- TextEditingController captures name input
- "Preview Name" button displays captured text
- Text displayed in styled format: "Reservation for: [Name]"
- Demonstrates controller usage separate from form submission

### Task 10: Form Saves to Local List and Displays Below
**File:** `lib/screen/reservation_screen.dart`
- Reservation data saved to `List<Reservation>` on submission
- ListView displays all submitted reservations below the form
- Each reservation shows:
  - Name, date, time, phone, number of guests
  - VIP status (⭐ icon)
  - High chair requirement (🪑 icon)
  - Special requests
- List updates dynamically with setState()

---

## 🔧 Fixes Applied

### 1. Import Path Errors Fixed
**File:** `lib/main.dart`
- Changed `import 'screens/...'` to `import 'screen/...'`
- All imports now match actual folder structure

### 2. Missing Model Created
**File:** `lib/models/reservation.dart`
- Created Reservation class with all required fields
- Includes: name, phone, guests, date, time, isVIP, needsHighChair, specialRequests

### 3. Widget Improvements
**Files:** `lib/widgets/drawer_menu.dart`, `lib/widgets/bottom_nav.dart`, `lib/screen/home_screen.dart`
- Added const constructors for better performance
- Added Key parameters following Flutter best practices
- Improved drawer menu with better organization and icons
- Added subtitles for better UX

### 4. Navigation Structure
- All screens properly registered in routes
- Drawer menu provides access to all form screens
- Proper navigation flow between screens

---

## 📱 App Structure

\`\`\`
lib/
├── main.dart                          # App entry point with routes
├── models/
│   └── reservation.dart               # Reservation data model
├── screen/
│   ├── username_form_screen.dart      # Task 1: Simple username form
│   ├── login_screen.dart              # Tasks 2, 3, 4: Login with validation
│   ├── registration_screen.dart       # Tasks 4, 6, 7: Registration with dropdown
│   ├── reservation_screen.dart        # Tasks 4, 5, 8, 9, 10: Complete reservation
│   ├── event_booking_screen.dart      # Event booking placeholder
│   ├── reservation_history_screen.dart # History view
│   └── home_screen.dart               # Dashboard home
└── widgets/
    ├── drawer_menu.dart               # Navigation drawer
    └── bottom_nav.dart                # Bottom navigation bar
\`\`\`

---

## 🎨 Design Features

- **Theme:** Deep Orange color scheme (restaurant/food theme)
- **Consistent Styling:** All forms use Material Design with rounded corners
- **Input Decoration:** Filled backgrounds, prefix icons, proper labels
- **Validation Feedback:** Inline error messages with clear instructions
- **Success Feedback:** SnackBar notifications for successful submissions
- **Responsive Layout:** SingleChildScrollView for all forms
- **Card Elevation:** Forms wrapped in elevated cards for depth

---

## 🚀 How to Run

1. Ensure Flutter is installed: `flutter --version`
2. Get dependencies: `flutter pub get`
3. Run the app: `flutter run`

---

## 📋 Testing Checklist

- [x] Task 1: Username form validates and displays input
- [x] Task 2: Login form has email and password fields
- [x] Task 3: Email requires "@", password cannot be empty
- [x] Task 4: All forms use GlobalKey<FormState>
- [x] Task 5: Reservation form has TextField, Checkbox, Switch
- [x] Task 6: Registration has all 4 required fields
- [x] Task 7: Role dropdown works with 4 options
- [x] Task 8: Date and time pickers functional
- [x] Task 9: Preview button captures and displays name
- [x] Task 10: Reservations save to list and display below form

---

## 🎯 Key Learning Outcomes

1. **Form Validation:** Using validators and GlobalKey<FormState>
2. **Controllers:** TextEditingController for capturing input
3. **State Management:** setState() for updating UI
4. **Date/Time Pickers:** showDatePicker() and showTimePicker()
5. **Input Variety:** TextField, Checkbox, Switch, Dropdown
6. **Data Persistence:** Local list storage and display
7. **User Feedback:** SnackBars and inline validation messages
8. **Navigation:** Routes and named navigation
9. **Widget Composition:** Breaking UI into reusable components
10. **Flutter Best Practices:** Const constructors, proper disposal, key parameters

---

## 📞 Support

All tasks have been successfully implemented and tested. The app is ready to run without errors!
