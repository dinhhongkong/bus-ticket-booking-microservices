package org.kong.gateway.utils;

import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.io.Decoders;
import io.jsonwebtoken.security.Keys;
import org.springframework.stereotype.Component;

import javax.crypto.SecretKey;
import java.security.Key;


@Component
public class JwtUtil {
    public static final String SECRET = "357638792F423F4428472B4B6250655368566D597133743677397A2443264629";


    public void validateToken(final String token) {
        Jwts.parser().verifyWith((SecretKey) getSignKey()).build().parse(token);
    }


    private Key getSignKey() {
        byte[] keyBytes = Decoders.BASE64.decode(SECRET);
        return Keys.hmacShaKeyFor(keyBytes);
    }
}
