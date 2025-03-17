using System;
using System.Collections;
using System.Diagnostics;
using System.IO;
using System.Interop;
using System.Text;

using static fastlz.fastlz;

namespace example;

static class Program
{
	const String input = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla rutrum vulputate purus vitae accumsan. Nam at euismod ante, quis semper ante. Nullam ultrices, leo sed efficitur molestie, neque metus imperdiet ex, ac congue urna ligula eget dui. Ut nulla justo, viverra vel vulputate sed, imperdiet sit amet mauris. Nunc lectus lectus, ultrices vel elementum ut, pellentesque ut mauris. Fusce convallis nulla non laoreet auctor. Donec sodales non nisl a venenatis. Sed ullamcorper orci sed pretium ultrices. Praesent sagittis orci mi, eget iaculis ipsum volutpat id. Proin imperdiet eleifend purus sed suscipit. Vestibulum a vulputate lorem, id facilisis tortor. Praesent turpis arcu, pretium in aliquet et, imperdiet eget turpis. Fusce pulvinar arcu non ante aliquet fermentum.";

	typealias FILE = void*;

	[CLink] public static extern FILE* fopen(c_char* filename, c_char* mode);

	static int Main(params String[] args)
	{
		let orig_len = input.Length;

		c_char* compressed_buf = (c_char*)Internal.StdMalloc(orig_len + (.)(orig_len * 0.05f));
		defer Internal.StdFree(compressed_buf);
		let compressed_size = fastlz_compress_level(2, input, (.)orig_len, compressed_buf);

		c_char* decompressed_buf = (c_char*)Internal.StdMalloc(orig_len);
		defer Internal.StdFree(decompressed_buf);
		let decompressed_size = fastlz_decompress(compressed_buf, compressed_size, decompressed_buf, (.)orig_len);

		Debug.Assert(orig_len == decompressed_size);
		Debug.Assert(input.Equals(StringView(decompressed_buf, decompressed_size)));

		return 0;
	}
}