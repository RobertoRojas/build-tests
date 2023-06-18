import argparse
import ctypes
import os
import sys

VERSION = '1.0.0'

def load_clibrary_function(librarypath: str='./libs/clibrary.so') -> tuple[any, str]:
    try:
        if not os.path.isfile(librarypath):
            return None, f'Cannot find the clibrary into the path[{librarypath}]'
        clibrary = ctypes.CDLL(librarypath)
        cfactorial = clibrary.factorial
        cfactorial.argtypes = [ctypes.c_int]
        cfactorial.restype = ctypes.c_int
        return cfactorial, None
    except Exception as ex:
        return None, str(ex)
    
def parser_args(args: list[str]) -> argparse.Namespace:
    parser = argparse.ArgumentParser(description='This program return the factorial of a number')
    parser.add_argument('-n', '--number', type=int, default=5, \
                        help='Number to calculate the factorial', \
                        dest='numb')
    parser.add_argument('--version', action='version', version=VERSION, \
                        help='Show the version of the program')
    return parser.parse_args(args=args)

def main() -> None:
    args = parser_args(sys.argv[1:])
    funct, err = load_clibrary_function()
    if err != None:
        print(f'Cannot load the clibrary function, reason: {err}')
        sys.exit(1)
    result = funct(args.numb)
    print(f'The result of the function is {result}')
    sys.exit(0)

if __name__ == '__main__':
    main()