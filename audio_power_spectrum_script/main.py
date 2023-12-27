import numpy as np
import matplotlib.pyplot as plt
import sounddevice as sd
import soundfile as sf
import scipy.signal as signal

# Audio Capture Constants
audio_duration_s = 3  # seconds
audio_sample_freq_hz = 44100  # std sample rate of 44100 Hz
audio_channel_count = 1  # only care about 1 channel for this
audio_sample_count = audio_duration_s * audio_sample_freq_hz
audio_sample_period_s = 1.0 / audio_sample_freq_hz


def CaptureRecording():
    print("Recording is starting...")
    recording = sd.rec(
        int(audio_duration_s * audio_sample_freq_hz),
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


def EstimatePowerSpectralDensity(recording):
    # Estimate the Power Spectral Density (PSD) of the recorded audio--note that the
    # estimate is proportional to the real PSD since the microphone's sensitivity is
    # unknown.
    f, Pxx_den = signal.welch(recording, audio_sample_freq_hz)
    plt.semilogy(f, Pxx_den)
    plt.xlabel("frequency [Hz]")
    plt.ylabel("**proportional** PSD [W/Hz]")
    plt.show()


def SaveRecording(recording):
    file_path = input("Enter the relative path to the recording file: ")
    sf.write(file_path, recording, audio_sample_freq_hz)


def LoadRecording():
    file_path = input("Enter the relative path to the recording file: ")
    recording, _ = sf.read(file_path)
    return recording


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
            "\t[R]eselect Recording\n"
            "\t[E]xit\n"
            "==================================================\n"
        )
        if action_encoding == "R":
            is_ambient_recording_selected = None
            continue

        # perform action
        if is_ambient_recording_selected:
            ambient_recording = CLIManipulateRecording(
                ambient_recording, action_encoding
            )
        else:
            device_active_recording = CLIManipulateRecording(
                device_active_recording, action_encoding
            )
