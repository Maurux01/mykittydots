# 🤝 Contributing to MyKittyDots

Thank you for your interest in contributing to MyKittyDots! This document provides guidelines and information for contributors.

## 📋 Table of Contents

- [Code of Conduct](#code-of-conduct)
- [How Can I Contribute?](#how-can-i-contribute)
- [Development Setup](#development-setup)
- [Pull Request Process](#pull-request-process)
- [Style Guides](#style-guides)
- [Reporting Bugs](#reporting-bugs)
- [Suggesting Enhancements](#suggesting-enhancements)

## 📜 Code of Conduct

This project and everyone participating in it is governed by our Code of Conduct. By participating, you are expected to uphold this code.

## 🚀 How Can I Contribute?

### 🐛 Reporting Bugs

- Use the GitHub issue tracker
- Include detailed steps to reproduce
- Provide your OS and Kitty version
- Include screenshots if relevant

### 💡 Suggesting Enhancements

- Use the GitHub issue tracker
- Describe the enhancement clearly
- Explain why this enhancement would be useful
- Include mockups if applicable

### 🔧 Pull Requests

- Fork the repository
- Create a feature branch
- Make your changes
- Test thoroughly
- Submit a pull request

## 🛠️ Development Setup

### Prerequisites

- Kitty terminal emulator
- Git
- A text editor (VS Code, Vim, etc.)

### Local Development

1. **Fork and clone the repository:**
   ```bash
   git clone https://github.com/YOUR_USERNAME/mykittydots.git
   cd mykittydots
   ```

2. **Create a development branch:**
   ```bash
   git checkout -b feature/your-feature-name
   ```

3. **Make your changes and test:**
   ```bash
   # Test the installation script
   ./install.sh
   
   # Test the theme switcher
   ~/.config/kitty/theme-switcher.sh list
   ```

4. **Commit your changes:**
   ```bash
   git add .
   git commit -m "feat: add your feature description"
   ```

5. **Push and create a pull request:**
   ```bash
   git push origin feature/your-feature-name
   ```

## 📝 Pull Request Process

1. **Update the README.md** if you add new features
2. **Update the CHANGELOG.md** with your changes
3. **Ensure the installation script works** on multiple platforms
4. **Test all themes** to ensure they work correctly
5. **Update documentation** if needed

### Pull Request Template

```markdown
## Description
Brief description of changes

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Documentation update
- [ ] Theme addition
- [ ] Other (please describe)

## Testing
- [ ] Tested on Linux
- [ ] Tested on macOS
- [ ] All themes work correctly
- [ ] Installation script works

## Screenshots
Add screenshots if applicable

## Checklist
- [ ] My code follows the style guidelines
- [ ] I have tested my changes
- [ ] I have updated the documentation
- [ ] My changes generate no new warnings
```

## 🎨 Style Guides

### Git Commit Messages

Use conventional commit format:

```
type(scope): description

[optional body]

[optional footer]
```

Types:
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style changes
- `refactor`: Code refactoring
- `test`: Adding tests
- `chore`: Maintenance tasks

Examples:
```
feat(themes): add new dracula theme
fix(install): resolve font installation issue
docs(readme): update installation instructions
```

### Code Style

- Use consistent indentation (4 spaces)
- Add comments for complex logic
- Follow shell script best practices
- Use descriptive variable names

### Configuration Files

- Keep configurations well-organized
- Add clear section headers
- Include helpful comments
- Maintain consistent formatting

## 🐛 Reporting Bugs

### Before Creating Bug Reports

1. Check existing issues
2. Test with the latest version
3. Try to reproduce the issue

### Bug Report Template

```markdown
## Bug Description
Clear and concise description of the bug

## Steps to Reproduce
1. Go to '...'
2. Click on '...'
3. Scroll down to '...'
4. See error

## Expected Behavior
What you expected to happen

## Actual Behavior
What actually happened

## Environment
- OS: [e.g. Arch Linux, Ubuntu, macOS]
- Kitty Version: [e.g. 0.28.1]
- Shell: [e.g. zsh, bash]

## Additional Context
Add any other context about the problem
```

## 💡 Suggesting Enhancements

### Before Creating Enhancement Requests

1. Check existing feature requests
2. Consider if it fits the project scope
3. Think about implementation complexity

### Enhancement Request Template

```markdown
## Enhancement Description
Clear and concise description of the enhancement

## Problem Statement
What problem does this solve?

## Proposed Solution
How would you like to see this implemented?

## Alternatives Considered
Any alternative solutions you've considered

## Additional Context
Add any other context or screenshots
```

## 📞 Getting Help

If you need help with contributing:

1. Check existing documentation
2. Search existing issues
3. Create a new issue for questions
4. Join our community discussions

## 🎉 Recognition

Contributors will be recognized in:
- README.md contributors section
- Release notes
- Project documentation

Thank you for contributing to MyKittyDots! 🐱✨ 