module Lita
  module Handlers
    class Manatee < Handler
      route /^manatee(?:\s+me)?$/, :manatee, command: true, help: { "lita manatee" => "Returns a random calming manatee" }

      def manatee(response)
        endpoint = "http://calmingmanatee.com/"
        resp = http.get(endpoint)
        location = resp.headers["location"]
        return unless location

        id = /[0-9]+$/.match(location).to_s
        response.reply("http://calmingmanatee.com/img/manatee#{id}.jpg")
      end
    end

    Lita.register_handler(Manatee)
  end
end
