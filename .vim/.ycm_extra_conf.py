def Settings( **kwargs ):
    return {
        'flags': [
            '-x',
            'c++', 
            '-Wall', 
            '-Wextra', 
            '-Werror',
            '-L/usr/lib64'
        ],
    }

def FlagsForFile(*args, **kwargs):
    return Settings(**kwargs)
