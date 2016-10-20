"""
    This script is intended to demonstrate using gplaycli to
    programmatically search for Android applications by name
    from the Google Play Store, in addition to downloading an
    application's APK file given we already know the AppID.
"""

import subprocess

# $ gplaycli -c credentials.conf -s "Google Earth"
print("First search for the 'Google Earth' application.")
p = subprocess.Popen(['gplaycli', '-c', 'credentials.conf', '-s', "'Google Earth'"],
                     stdout=subprocess.PIPE,
                     stderr=subprocess.PIPE)
out, err = p.communicate()
print(out)

# $ gplaycli -c credentials.conf -d com.google.earth
print("Now assuming we already have the appID 'com.google.earth', download the APK.")
appID = 'com.google.earth'
p = subprocess.Popen(['gplaycli', '-c', 'credentials.conf', '-d', appID],
                     stdout=subprocess.PIPE,
                     stderr=subprocess.PIPE)
out, err = p.communicate()
print(out)

# $ ls
print("Display files in the current working directory to confirm we have the APK.")
p = subprocess.Popen(['ls'],
                             stdout=subprocess.PIPE,
                                                  stderr=subprocess.PIPE)
out, err = p.communicate()
print(out)
