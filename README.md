# Assembly Lab Exercises and Lessons Setup Guide

This repository contains assembly files from our **Computer Organization and Architecture** lessons. Follow the instructions below to set up DOSBox, TASM, and run the assembly programs on your machine.

## Prerequisites
- **DOSBox**: A DOS emulator to run 16-bit programs like TASM and TLINK.
- **TASM**: Turbo Assembler, a tool used to assemble the assembly language files.
- **TLINK**: Turbo Linker, used to link the object files to create executables.

---

## 1. Installing and Configuring DOSBox

### Step 1: Download DOSBox
- Download and install DOSBox from the [official DOSBox website](https://www.dosbox.com/download.php?main=1).

### Step 2: Set Up TASM in DOSBox
- Download or copy TASM and TLINK to a directory on your computer (e.g., `C:\TASM`).
- Add the assembly files from this repository into the same directory (`C:\TASM\`).

### Step 3: Configure DOSBox to Access TASM
- Open DOSBox and mount the directory where TASM and your assembly files are stored.
- Use the following command in DOSBox to mount the directory:
  ```
  mount C C:\TASM
  ```
- Switch to the newly mounted directory by typing:
  ```
  C:
  ```

Now, DOSBox will recognize the `C:\TASM` directory as the `C:` drive in DOSBox, where you'll be working with your assembly files.

---

## 2. Running and Editing Assembly Code

### Step 1: Assemble the Code Using TASM
- To assemble an assembly file (`filename.asm`), type the following in DOSBox:
  ```
  TASM filename.asm
  ```
  - This will create an object file (`filename.obj`) if there are no syntax errors in the code.

### Step 2: Link the Object File Using TLINK
- After successfully assembling the `.ASM` file, use TLINK to generate an executable:
  ```
  TLINK filename.obj
  ```

### Step 3: Run the Executable
- If the linking is successful, an executable file (`filename.exe`) will be created. Run it using the command:
  ```
  filename.exe
  ```

### Step 4: Edit the Assembly Files
- To edit any assembly code, open the `.ASM` file in a text editor. After making changes, save the file and re-run the above commands to assemble and link again.

---

## 3. Automating the Build Process (Optional)
- Create a batch file (`compile.bat`) to automate assembling, linking, and running the code. The contents of the batch file should look like this:
  ```
  @echo off
  TASM %1.asm
  TLINK %1.obj
  %1.exe
  ```
- To use the batch file, type:
  ```
  compile filename
  ```
  This will assemble, link, and run your code in one step.

---

## 4. Example

If you have an assembly file named `example.asm`, follow these steps:
1. Assemble: `TASM example.asm`
2. Link: `TLINK example.obj`
3. Run: `example.exe`

You can now experiment with your assembly exercises and learn from the lessons provided in this repository!

---

This setup should enable you to efficiently run and edit assembly language programs using DOSBox, TASM, and TLINK for your Computer Organization and Architecture exercises.

