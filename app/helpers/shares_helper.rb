module SharesHelper
    def last_updated(share)
        share.updated_at.strftime("Last updated %A, %b %e, at %l:%M %p")
      end
end
