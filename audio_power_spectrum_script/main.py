import numpy as np
import matplotlib.pyplot as plt
import sounddevice as sd
import soundfile as sf
import scipy.signal as signal

# Audio Capture Constants
audio_duration_s = 10  # seconds
audio_sample_freq_hz = 44100  # 88200  # std sample rate of 44100 Hz
audio_channel_count = 1  # only care about 1 channel for this
audio_sample_count = int(audio_duration_s * audio_sample_freq_hz)
audio_sample_period_s = 1.0 / audio_sample_freq_hz


def CaptureRecording():
    print("Recording is starting...")
    recording = sd.rec(
        audio_sample_count,
        samplerate=audio_sample_freq_hz,
        channels=audio_channel_count,
        # dtype="float64",
    )
    sd.wait()  # wait for recording to finish
    return recording


def PlayRecording(recording):
    print("Audio is playing...")
    sd.play(recording, audio_sample_freq_hz)
    sd.wait()


def PlotPSD(f, Pxx_den):
    plt.semilogy(f, Pxx_den)
    plt.xlabel("frequency [Hz]")
    plt.ylabel("**proportional** PSD [W/Hz]")
    plt.show()


def EstimatePowerSpectralDensity(recording):
    # Estimate the Power Spectral Density (PSD) of the recorded audio--note that the
    # estimate is proportional to the real PSD since the microphone's sensitivity is
    # unknown.
    f, Pxx_den = signal.welch(
        recording,
        audio_sample_freq_hz,
        "flattop",
        scaling="spectrum",
        average="median",
        nperseg=min(audio_sample_freq_hz, audio_sample_count),
    )
    # f, Pxx_den = signal.periodogram(recording, audio_sample_freq_hz)
    PlotPSD(f, Pxx_den)


def DifferenceEstimatePowerSpectralDensity(background_recording, active_recording):
    f_bg, Pxx_den_bg = signal.welch(background_recording, audio_sample_freq_hz)
    f_active, Pxx_den_active = signal.welch(active_recording, audio_sample_freq_hz)

    # make bg and active the same maximum size
    length = max(len(f_bg), len(f_active))
    f = f_bg[:length]  # f should be the same, choose bg.
    Pxx_den_bg = Pxx_den_bg[:length]
    Pxx_den_active = Pxx_den_active[:length]

    # compute difference
    Pxx_den_delta = Pxx_den_active - Pxx_den_bg
    PlotPSD(f, Pxx_den_delta)


def SaveRecording(recording):
    file_path = input("Enter the relative path to the recording file: ")
    sf.write(file_path, recording, audio_sample_freq_hz)


def LoadRecording():
    try:    
        file_path = input("Enter the relative path to the recording file: ")
        recording, _ = sf.read(file_path)
        return recording
    except:
        print("File not found")



def CLIManipulateRecording(recording, action_encoding):
    if action_encoding == "C":
        recording = CaptureRecording()
        recording = recording[:, 0]
    elif action_encoding == "P":
        if recording is None:
            print("Load or Capture Recoding First")
        else:
            PlayRecording(recording)
    elif action_encoding == "S":
        if recording is None:
            print("Load or Capture Recoding First")
        else:
            SaveRecording(recording)
    elif action_encoding == "L":
        recording = LoadRecording()
    elif action_encoding == "G":
        if recording is None:
            print("Load or Capture Recoding First")
        else:
            EstimatePowerSpectralDensity(recording)
    elif action_encoding == "E":
        exit(0)
    return recording


if __name__ == "__main__":
    device_active_recording = None
    ambient_recording = None
    is_ambient_recording_selected = None
    while 1:
        if is_ambient_recording_selected is None:
            # select recording
            recording_selection_encoding = input(
                "==================================================\n"
                "Please select a recording:\n"
                "\t[D]evice Active Recording\n"
                "\t[A]mbient Recording\n"
                "==================================================\n"
            )
            is_ambient_recording_selected = recording_selection_encoding == "A"

        recording_selection_string = "DEVICE ACTIVE"
        if is_ambient_recording_selected:
            recording_selection_string = "AMBIENT"

        # prompt user for action
        action_encoding = input(
            "==================================================\n"
            "           "
            + recording_selection_string
            + " RECORDING SELECTED                 \n"
            "==================================================\n"
            "Please choose one of the following actions:\n"
            "\t[C]apture Recording\n"
            "\t[P]lay Recording\n"
            "\t[S]ave Recording\n"
            "\t[L]oad Recording\n"
            "\t[G]raph Estimate Proportional PSD of Recording\n"
            "\t[GD] Graph Difference between Active Device and\n"
            "\t\tAmbient Recordings\n"
            "\t[R]eselect Recording\n"
            "\t[E]xit\n"
            "==================================================\n"
        )

        # perform action
        if action_encoding == "R":
            is_ambient_recording_selected = None
            continue
        if is_ambient_recording_selected:
            ambient_recording = CLIManipulateRecording(
                ambient_recording, action_encoding
            )
        else:
            device_active_recording = CLIManipulateRecording(
                device_active_recording, action_encoding
            )
        if action_encoding == "GD":
            DifferenceEstimatePowerSpectralDensity(
                ambient_recording, device_active_recording
            )
