import { type Build } from 'cmake-ts-gen';

const build: Build = {
    common: {
        project: 'fastlz',
        archs: ['x64'],
        variables: [],
        copy: {},
        defines: [],
        options: [],
        subdirectories: [],
        libraries: {
            fastlz: {
                sources: ['FastLZ/fastlz.c']
            },
        },
        buildDir: 'build',
        buildOutDir: 'libs',
        buildFlags: []
    },
    platforms: {
        win32: {
            windows: {
                buildFlags: ['-T ClangCl']
            },
            android: {
                archs: ['x86', 'x86_64', 'armeabi-v7a', 'arm64-v8a'],
            }
        },
        linux: {
            linux: {}
        },
        darwin: {
            macos: {}
        }
    }
}

export default build;