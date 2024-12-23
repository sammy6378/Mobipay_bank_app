
# Mobipay

Mobipay is a modern and intuitive banking application built with Flutter and Dart. It provides seamless financial management and transaction features, ensuring users have full control over their finances at their fingertips.

## Features

- **Secure Login and Authentication**   
  Robust authentication system to protect user data.

- **Fund Transfers**  
  Send money effortlessly to friends, family, or business contacts.

- **Transaction History**  
  View detailed records of all your transactions in an organized manner.

- **Account Management**  
  Check your account balances, manage multiple accounts, and track spending.

- **Customer Support**  
  Integrated customer care for prompt support and inquiries.

- **Personalized UI**  
  A user-friendly and aesthetically pleasing interface to enhance user experience.

## Technologies Used

- **Flutter**: For cross-platform app development (iOS and Android).  
- **Dart**: The programming language for developing the app.
- **Firebase**: For Authentication and Authorization
- **State Management**: Efficient state management for a seamless user experience.  

## Screenshots

<table style="width:100%; table-layout:fixed; border-collapse:collapse;">
  <tr>
    <td><img src="https://github.com/user-attachments/assets/b1cf0de2-1bb7-406c-a817-84378e219bd5" alt="mobipay#1" width="200"/></td>
    <td><img src="https://github.com/user-attachments/assets/984a0aff-12d5-4496-a35f-8e6fc12f2654" alt="mobipay#2" width="200"/></td>
    <td><img src="https://github.com/user-attachments/assets/33e42af1-4869-4a56-ac1a-0726c86028d5" alt="mobipay#3" width="200"/></td>
  </tr>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/d55fbfb2-60a4-4e06-ad86-a9c802f3057e" alt="mobipay#1" width="200"/></td>
    <td><img src="https://github.com/user-attachments/assets/b74f3b56-854e-4d6a-9704-a1ef691a9a59" alt="mobipay#2" width="200"/></td>
    <td><img src="https://github.com/user-attachments/assets/2e60d626-cbee-4486-976c-8de7facb6f15" alt="mobipay#3" width="200"/></td>
  </tr>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/1f87e156-1496-4842-b8f4-73336f8f3e43" alt="mobipay#1" width="200"/></td>
    <td><img src="https://github.com/user-attachments/assets/9ad60205-d484-4ab7-b918-7e46b44e5b70" alt="mobipay#2" width="200"/></td>
    <td><img src="https://github.com/user-attachments/assets/e9759d60-1356-49cc-990f-1a9f6499b59a" alt="mobipay#3" width="200"/></td>
  </tr>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/db463696-2087-41ae-8cb3-1acdc654a9ab" alt="mobipay#1" width="200"/></td>
    <td><img src="https://github.com/user-attachments/assets/a4d11271-8c9e-439d-aae2-325207f6d93a" alt="mobipay#2" width="200"/></td>
  </tr>
</table>



## Getting Started

Follow these instructions to set up and run the Mobipay application on your local machine.

Here's the updated list of **prerequisites** to include Firebase setup for a Flutter project:

### **Prerequisites**

1. **Install Flutter:**
   - Follow the [Flutter Installation Guide](https://docs.flutter.dev/get-started/install) to install Flutter on your machine.
   
2. **Install Dart SDK:**
   - Dart comes pre-installed with Flutter, so installing Flutter will automatically install Dart as well. However, if needed, you can install Dart separately by following the [Dart installation guide](https://dart.dev/get-dart).

3. **Install a Code Editor:**
   - Use a code editor like **VS Code** or **Android Studio** for Flutter development.
     - [Install VS Code](https://code.visualstudio.com/Download)
     - [Install Android Studio](https://developer.android.com/studio)

4. **Install Firebase:**
   - **Create a Firebase Project:**
     - Go to [Firebase Console](https://console.firebase.google.com/), and click on "Add Project".
     - Follow the steps to create your Firebase project.
   - **Configure Firebase with Flutter:**
     - Follow the instructions in the Firebase console to set up Firebase with your Flutter project.
     - Add Firebase dependencies to your `pubspec.yaml` file:
       ```yaml
       dependencies:
         firebase_core: ^1.10.0
         firebase_auth: ^3.3.3 # For Authentication
         # Include any other Firebase packages you need (e.g., Firestore, Firebase Database)
       ```
     - **Install Firebase SDK:** Ensure you have the Firebase SDK set up by running:
       ```bash
       flutter pub get
       ```

5. **Download the `google-services.json` File:**
   - **Firebase Project Configuration:**
     - In the Firebase Console, go to **Project Settings** > **General**.
     - Scroll down to **Your apps** and select the Android app you want to configure.
     - Download the `google-services.json` file.
   - **Place the `google-services.json` File:**
     - Place the downloaded `google-services.json` file in the `android/app` directory of your Flutter project.
     - Make sure the file is located exactly in `project_directory/android/app/google-services.json`.

6. **Set Up Firebase for Android:**
   - Open `android/build.gradle` and add the following line in the `buildscript` section:
     ```gradle
     classpath 'com.google.gms:google-services:4.3.10'  // Add this line
     ```
   - In `android/app/build.gradle`, at the bottom of the file, add:
     ```gradle
     apply plugin: 'com.google.gms.google-services'  // Add this line
     ```

7. **Run the Project:**
   - After completing the above steps, run your project using:
     ```bash
     flutter run
     ```

### Setup Instructions

1. Clone the repository:
   ```bash
   git clone https://github.com/sammy6378/Mobipay_bank_app.git
   cd Mobipay_bank_app
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the application:
   ```bash
   flutter run
   ```

## Learn More

A few resources to help you with Flutter development:

- [Flutter Documentation](https://docs.flutter.dev/)
- [Flutter Cookbook](https://docs.flutter.dev/cookbook)
- [Dart Language Overview](https://dart.dev/guides)

## Contributions

Contributions, issues, and feature requests are welcome! Feel free to open an issue or create a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

