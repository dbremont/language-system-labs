# FFmpeg

> **FFmpeg** is a comprehensive multimedia framework designed for handling various audio and video processing tasks.

> **FFmpeg**  stand for “Fast Forward MPEG”.

## Breviarium

| **Aspect** | **Description** |
| --- | --- |
| **System Type** | Multimedia Processing Framework |
| **Core Components** | `ffmpeg` (CLI tool), `libavcodec`, `libavformat`, `libavfilter`, `libswscale`, etc. |
| **Main Functions** | Encoding, decoding, transcoding, muxing, demuxing, streaming, filtering |
| **Input/Output** | Supports a wide range of audio/video formats (MP4, AVI, MP3, MKV, etc.) |
| **Programming Language** | C |
| **Execution Model** | Command-line interface; also used as a C library embedded in other applications |
| **License** | LGPL/GPL (depending on build configuration) |
| **Deployment Mode** | Standalone binary or embedded in applications |
| **Platform Support** | Cross-platform (Linux, macOS, Windows, BSD, etc.) |
| **Parallelism** | Multithreaded processing, SIMD acceleration (e.g., via x264, libvpx, etc.) |
| **Use Cases** | Video editing, live streaming, video surveillance, transcoding pipelines |
| **Extensibility** | Filter graphs, plugin-style architecture via libavfilter |
| **Community** | Large open-source community; many downstream projects (e.g., VLC, OBS Studio) |

## Install

```bash
sudo apt update
sudo apt install ffmpeg libavcodec-dev libavformat-dev libavutil-dev libswscale-dev libavfilter-dev libavdevice-dev
```

## Core Components

> …
> 

| **Component** | **Description** |
| --- | --- |
| `ffmpeg` | Command-line tool for processing multimedia files (encode, decode, convert, etc.) |
| `ffplay` | Simple media player based on SDL and FFmpeg libraries for testing/playback |
| `ffprobe` | Command-line tool to analyze multimedia streams and extract metadata |
| `libavcodec` | Library for encoding and decoding audio/video codecs (e.g., H.264, AAC) |
| `libavformat` | Library for demuxing/muxing container formats (e.g., MP4, MKV, FLV) |
| `libavfilter` | Library for applying filters to audio/video streams (e.g., scaling, cropping) |
| `libavdevice` | Library for handling input/output from audio/video capture devices |
| `libswscale` | Library for high-performance image scaling, colorspace conversion |
| `libswresample` | Library for audio resampling, rematrixing, and format conversion |
| `libpostproc` | Optional library for post-processing decoded video |
| `libavutil` | Utility library with common functions used by other FFmpeg components (e.g., math, data structures, logging) |

## Core Functions

| **Function** | **Component(s)** | **Description** |
| --- | --- | --- |
| **Encoding** | `libavcodec` | Compresses raw audio/video into specified formats (e.g., H.264, AAC) |
| **Decoding** | `libavcodec` | Decompresses encoded audio/video into raw streams |
| **Format Handling** | `libavformat` | Reads/writes containers like MP4, MKV, AVI (demuxing/muxing) |
| **Filtering** | `libavfilter` | Applies filters to media streams (e.g., scale, crop, overlay) |
| **Device I/O** | `libavdevice` | Captures from or sends to hardware devices (e.g., webcams, soundcards) |
| **Scaling/Conversion** | `libswscale` | Performs image scaling and pixel format conversion |
| **Audio Resampling** | `libswresample` | Converts sample rates, formats, and channel layouts of audio |
| **Media Analysis** | `ffprobe` | Inspects and reports detailed media file metadata |
| **Playback** | `ffplay` | Lightweight media player built with SDL |
| **Command Execution** | `ffmpeg` | Main CLI interface; connects all libraries for full pipeline execution |
| **Utility Functions** | `libavutil` | Provides support functions (e.g., timebase conversion, random numbers, hashing) |
| **Post-Processing** | `libpostproc` *(opt)* | Applies optional video post-processing filters (e.g., deblocking) |

## References

- [FFmpeg](https://ffmpeg.org/)
- [awesome-ffmpeg](https://github.com/transitive-bullshit/awesome-ffmpeg)
- https://github.com/FFmpeg/FFmpeg/blob/master/fftools/ffplay.c
- https://github.com/FFmpeg/FFmpeg
