import os
import subprocess
import sys


def run_all():
    script_dir = os.path.dirname(os.path.abspath(__file__))
    current_file = os.path.basename(__file__)
    output_dir = os.path.join(script_dir, "output")
    os.makedirs(output_dir, exist_ok=True)
    cwd = os.getcwd()
    for file in os.listdir(script_dir):
        if file.endswith(".py") and file != current_file:
            print(f"\n>>> Running {file} ...\n")
            try:
                os.chdir(script_dir)
                subprocess.run([sys.executable, file], check=True)
            except subprocess.CalledProcessError as e:
                print(f"Error while running {file}: {e}")
            finally:
                os.chdir(cwd)


if __name__ == "__main__":
    print(">>> Running all TP1 scripts ...")
    run_all()
    print("\n>>> All TP1 scripts executed.")
