provide-module search-highlighter %{
  # Faces
  set-face global Search black,yellow+uf

  # Highlighters
  add-highlighter shared/search dynregex '%reg{/}' 0:Search

  # Revert the use of `RegisterModified` hook for performance reasons.
  # hook global RegisterModified '/' %{
  #   add-highlighter -override shared/search regex "%reg{/}" 0:Search
  # }

  # Commands
  # Enable
  define-command search-highlighter-enable -docstring 'Enable search-highlighter' %{
    search-highlighter-show
  }

  # Disable
  define-command search-highlighter-disable -docstring 'Disable search-highlighter' %{
    try search-highlighter-hide
    remove-hooks global search-highlighter
  }

  # Show
  define-command -hidden search-highlighter-show %{
    add-highlighter -override global/search ref search

    # Hide on Escape
    hook -once -group search-highlighter global NormalKey '<esc>' %{
      try search-highlighter-hide
    }
  }

  # Hide
  define-command -hidden search-highlighter-hide %{
    remove-highlighter global/search

    # Show when searching
    hook -once -group search-highlighter global NormalKey '[/?*nN]|<a-[/?*nN]>' %{
      search-highlighter-show
    }

    # Show when search register has been modified
    hook -once -group search-highlighter global RegisterModified '/' %{
      search-highlighter-show
    }
  }
}
require-module search-highlighter
