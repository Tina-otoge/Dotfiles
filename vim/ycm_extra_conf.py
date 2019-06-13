import os
import ycm_core

def _get_file_extension(path):
    return os.path.splitext(path)[1]

def _get_source_type(path):
    extension = _get_file_extension(path)
    types = {
        '.c': 'c',
        '.h': 'c',
        '.cpp': 'c++',
        '.hpp': 'c++',
    }

    return types.get(extension)

def Settings(**kwargs):
    language = kwargs['language']
    file_path = kwargs.get('filename')
    settings = {
        'cfamily': {
            'flags': [
                '-Wno-unknown-warning-option',
                '-Wall',
                '-Wextra',
                '-Wconversion',
                '-Wdouble-promotion',
                '-Wduplicated-branches',
                '-Wduplicated-cond',
                '-Wjump-misses-init',
                '-Wno-long-long',
                '-Wnull-dereference',
                '-Wshadow',
                '-Wuseless-cast',
                '-Iinclude',
                '-I.',
                # This path will only work on OS X, but extra paths that don't
                # exist are not harmful
                '-isystem', '/System/Library/Frameworks/Python.framework/Headers',
                '-isystem', '/usr/local/include',
                '-isystem', '/usr/local/include/eigen3',
            ]
        }
    }
    result = settings.get(language)
    extra_cfamily_settings = {
        'c': {
            'flags': [
                '-x', 'c',
                '-std=gnu11',
            ]
        },
        'c++': {
            'flags': [
                '-x', 'c++',
                'std=c++11',
            ]
        }
    }
    if language == 'cfamily':
        actual_language = _get_source_type(file_path)
        extra_settings = extra_cfamily_settings[actual_language]
        for key in extra_settings:
            result[key] += extra_settings[key]
    return result
