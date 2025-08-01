# Linux Shell Backup Project – IBM Data Engineering Professional Certificate

## Overview

This project demonstrates the use of **Bash scripting** to automate file backups based on modification time. It was completed as the final project for **Course 6 – Hands-on Introduction to Linux Commands and Shell Scripting** in the [IBM Data Engineering Professional Certificate](https://www.coursera.org/professional-certificates/ibm-data-engineer).

The project simulates a real-world DevOps or system administration task: creating a shell script (`backup.sh`) that identifies recently modified files and backs them up into a timestamped archive. The script uses core Linux utilities including `tar`, `date`, `mv`, and file permission commands, and is designed to support automation via `cron`.

---

## Objectives

- Create a Bash script that:
  - Accepts source and destination directories as arguments
  - Finds files modified within the last 24 hours
  - Archives them into a compressed `.tar.gz` file
  - Moves the archive to the destination folder
- Validate argument count and paths
- Use timestamps to generate unique backup filenames
- Automate the backup using `crontab`

---

## Tools & Technologies

| Category                   | Tools/Technologies                   |
|----------------------------|--------------------------------------|
| **OS Environment**         | Ubuntu Linux (Skills Network Lab)    |
| **Shell Language**         | Bash                                 |
| **Utilities Used**         | `tar`, `date`, `mv`, `chmod`, `cron` |
| **Execution Environment**  | Terminal / Theia IDE                 |

---

## Core Components

### backup.sh

The main Bash script that:

- Verifies correct usage and valid input directories
- Identifies files modified in the last 24 hours
- Creates a compressed archive (`.tar.gz`) with a unique timestamped name
- Moves the archive to the specified backup directory
- Can be scheduled via `crontab` for automation

### output_log.txt

Sample script execution showing successful backup of recently modified files:

```plaintext
# Script Output
the first argument is important-documents
the second argument is .
ana.txt
doi.txt
zop.txt
Backup successful: /home/project/backup-1718832747.tar.gz

# Backup Directory Contents (filtered to show only backup output)
-rw-r--r-- 1 theia users 4423 Jun 19 17:32 backup-1718832747.tar.gz
```

---

## Sample Screenshots

| Task                               | Screenshot                                    |
|------------------------------------|-----------------------------------------------|
| Script made executable             | `task15_executable.png`                       |
| Backup archive created             | `task16_backup_complete.png`                  |
| `crontab` scheduled for automation | `task17_crontab.png`                          |

---

## Repository Structure

```plaintext
Linux_Shell_Backup_Project/
├── README.md                        # Project overview and usage instructions (this file)
├── backup.sh                        # Main backup script written in Bash
├── crontab_entry.txt                # `cron` entry to automate backup execution
├── data/                            # Input data files (used for test backup)
│   ├── ana.txt
│   ├── doi.txt
│   └── zop.txt
├── output/
│   └── output_log.txt               # Sample script execution log
├── images/
│   ├── task15_executable.png        # Screenshot: script made executable
│   ├── task16_backup_complete.png   # Screenshot: successful backup archive
│   └── task17_crontab.png           # Screenshot: `crontab` entry for automation
```

---

## How to Run the Script

1. Make the script executable (if not already):

   ```bash
   chmod +x backup.sh
   ```

2. Create an output folder (if it doesn’t exist):

   ```bash
   mkdir backup-folder
   ```

3. Run the backup script using the existing `data/` folder as input:

   ```bash
   ./backup.sh data backup-folder
   ```

4. If successful, a compressed backup archive (e.g., `backup-<timestamp>.tar.gz`) will appear inside the `backup-folder/` directory.

> **Note:**  
> In the original screenshots and output log, the input folder was named `important-documents` as instructed in the course task.  
> For this repository, the input folder is named `data/`, but the script logic remains the same.

---

## Automating Backups with `cron`

To schedule the backup script to run automatically at a fixed time, you can set up a `cron` job.

For example, to run the backup daily at **midnight**, add the following entry to your crontab:

```bash
0 0 * * * /usr/local/bin/backup.sh /home/project/important-documents /home/project
```

To edit your `crontab`:

```bash
crontab -e
```

**Note:**  
This path (`/usr/local/bin/backup.sh`) reflects the script's location in the original IBM Skills Network environment. **On your local system**, you may need to adjust the full path to the script and input/output folders accordingly.

For convenience, this `cron` entry is also saved in [`crontab_entry.txt`](./crontab_entry.txt).

> **Tip for Local Testing:**  
> If you're running this project locally (not in the IBM Cloud IDE), you can use a `cron` job like the following:
>
> ```bash
> 0 0 * * * /full/path/to/Linux_Shell_Backup_Project/backup.sh /full/path/to/Linux_Shell_Backup_Project/data /full/path/to/Linux_Shell_Backup_Project/output
> ```
> Be sure to replace `/full/path/to/` with the **absolute path** to your project directory.

---

## License

This project was completed as part of the IBM Data Engineering Professional Certificate and is intended for educational use.

---

## Links

- Course Page – [Hands-on Introduction to Linux Commands and Shell Scripting](https://www.coursera.org/learn/hands-on-introduction-to-linux-commands-and-shell-scripting)
- [GitHub Profile](https://github.com/royungar)
- [GitHub Repository](https://github.com/royungar/Linux_Shell_Backup_Project)