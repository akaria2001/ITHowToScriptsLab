#!/usr/bin/python3
import os


def main():
    while True:
        os.system('clear')
        print("Linux Menu")
        print("-------------------------")
        print("1. Show current working directoy")
        print("2. Show uptime")
        print("3. Show disk space")
        print("4. Show OS Version")
        print("5. Quit")
        print("\n")

        user_choice = int(input("Enter your choice: "))
        if(user_choice == 1):
            print("\nDisplaying current working directory\n")
            os.system('pwd')
            print("\n")
            input("Press any key to continue: ")

        elif(user_choice == 2):
            print("\nDisplaying uptime\n")
            os.system('uptime')
            print("\n")
            input("Press any key to continue: ")

        elif(user_choice == 3):
            print("\nDisplyaing Disk Space\n")
            os.system('df -h')
            print("\n")
            input("Press any key to continue")

        if(user_choice == 4):
            print("\nDisplaying current OS Version\n")
            os.system('cat /etc/os-release')
            print("\n")
            input("Press any key to continue: ")

        if(user_choice == 5):
            print("\nExiting applicaton\n")
            exit()

        else:
            input("Press any key to continue")


if __name__ == '__main__':
    main()
