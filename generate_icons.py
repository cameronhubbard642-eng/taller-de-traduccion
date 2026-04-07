#!/usr/bin/env python3
import os
import cairosvg
from pathlib import Path

# Define the source SVG and output directory
svg_source = "/sessions/cool-vibrant-babbage/mnt/Spanish/AppIcon.svg"
output_dir = "/sessions/cool-vibrant-babbage/mnt/Spanish/AppIcon.iconset"

# Create the output directory if it doesn't exist
Path(output_dir).mkdir(parents=True, exist_ok=True)

# Define icon sizes: (filename, size_in_pixels)
icon_sizes = [
    ("icon_16x16.png", 16),
    ("icon_16x16@2x.png", 32),
    ("icon_32x32.png", 32),
    ("icon_32x32@2x.png", 64),
    ("icon_128x128.png", 128),
    ("icon_128x128@2x.png", 256),
    ("icon_256x256.png", 256),
    ("icon_256x256@2x.png", 512),
    ("icon_512x512.png", 512),
    ("icon_512x512@2x.png", 1024),
]

# Generate each PNG
for filename, size in icon_sizes:
    output_path = os.path.join(output_dir, filename)
    print(f"Generating {filename} ({size}x{size})...", end=" ")
    try:
        cairosvg.svg2png(
            url=svg_source,
            write_to=output_path,
            output_width=size,
            output_height=size,
        )
        print("Done")
    except Exception as e:
        print(f"Error: {e}")

print(f"\nAll icons generated successfully in {output_dir}")

# List the generated files
print("\nGenerated files:")
for filename in sorted(os.listdir(output_dir)):
    filepath = os.path.join(output_dir, filename)
    size = os.path.getsize(filepath)
    print(f"  {filename} ({size} bytes)")
