const electronInstaller = require('electron-winstaller');
const path = require('path');

const rootPath = path.join('./');

resultPromise = electronInstaller.createWindowsInstaller({
    appDirectory: './release-builds/abdbillcounter-win32-x64',
    outputDirectory: './installers',
    authors: 'Hosting Domain',
    noMsi: true,
    exe: 'abdbillcounter.exe',
    setupExe: 'abdbillcounterInstaller.exe',
    setupIcon: path.join(rootPath, 'assets', 'images', 'icon.ico')
  });

resultPromise.then(() => console.log("It worked!"), (e) => console.log(`No dice: ${e.message}`));