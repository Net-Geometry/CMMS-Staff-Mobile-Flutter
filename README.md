
# CMMS Staff Mobile


## 🚀 Getting Started

Follow these instructions to get a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

* [Flutter SDK version 3.29.3 or Latest](https://flutter.dev/docs/get-started/install)
* Android Studio or Xcode (for Android/iOS emulators)
* Git

### Installation

1. **Clone the repository**

   ```bash
   git clone https://github.com/Net-Geometry/CMMS-Staff-Mobile-Flutter.git
   ```
2. **Install dependencies**

   ```bash
   flutter pub get
   ```

## 🌿 Branching Strategy

We use a feature-branch workflow. Create a new branch for each feature or fix:

```bash
# Replace <developer-name> with your GitHub username or team alias
git checkout -b <developer-name>/feature/<short-description>
```

## 🔄 Git Workflow

1. **Keep your branch up to date**

   ```bash
   git checkout main
   git pull origin main
   git checkout <your-branch>
   git merge main
   ```
2. **Push your branch**

   ```bash
   git push origin <your-branch>
   ```
3. **Open a Pull Request**

   * Target branch: `main`
   * Include a clear title and description of your changes

## 📝 Commit Message Guidelines

Use [Conventional Commits](https://www.conventionalcommits.org/) for clean and consistent history:

| Type          | Description                     | Example                              |
| ------------- | ------------------------------- | ------------------------------------ |
| `init`        | Initial commit or project setup | `init: setup project structure`      |
| `feat`        | A new feature                   | `feat: add login screen`             |
| `fix`         | A bug fix                       | `fix: correct validation on form`    |
| `enhancement` | Improvement or refactor         | `enhancement: optimize image loader` |

Commit message format:

```
<type>(<scope>): <short description>

<body>             # optional longer description

<footer>           # optional metadata (e.g., related issues)
```

## 🎉 Ready to Contribute?

Thank you for your contributions! Feel free to open issues, pull requests, and discuss enhancements. Let's build something great together!

