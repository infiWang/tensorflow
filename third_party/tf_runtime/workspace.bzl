"""Provides the repository macro to import TFRT."""

load("//third_party:repo.bzl", "tf_http_archive", "tf_mirror_urls")

def repo():
    """Imports TFRT."""

    # Attention: tools parse and update these lines.
    TFRT_COMMIT = "209b7ffc7a3e6ca6c6cd8b68f642e1e3d4e03016"
    TFRT_SHA256 = "fad83722eee5014e462e4703d52c02c293ec17c0475c99a57cf2f0369b27f680"

    tf_http_archive(
        name = "tf_runtime",
        sha256 = TFRT_SHA256,
        strip_prefix = "tensorflow-runtime-{commit}".format(commit = TFRT_COMMIT),
        urls = tf_mirror_urls("https://github.com/infiWang/tensorflow-runtime/archive/{commit}.tar.gz".format(commit = TFRT_COMMIT)),
        # A patch file can be provided for atomic commits to both TF and TFRT.
        # The job that bumps the TFRT_COMMIT also resets patch_file to 'None'.
        patch_file = None,
    )
