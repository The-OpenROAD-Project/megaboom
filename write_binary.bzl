"""
This module contains a rule for writing binary files.
"""

def _write_binary_impl(ctx):
    out = ctx.actions.declare_file(ctx.label.name)
    ctx.actions.write(
        output = out,
        content = ctx.attr.data,
    )
    return [DefaultInfo(files = depset([out]))]

write_binary = rule(
    implementation = _write_binary_impl,
    attrs = {
        "data": attr.string(),
    },
)
