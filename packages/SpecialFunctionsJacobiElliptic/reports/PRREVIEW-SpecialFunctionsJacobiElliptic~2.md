# Review of SpecialFunctionsJacobiElliptic (pull request #3075 at 2e8dbd8)

**Verdict:** needs changes

**Summary.** Needs changes, for one point: at `k = 0` the modulus forms of Landen's and Gauss's transformations (4.4, 4.5) now assert laws whose right sides are `0/0`; in 4.4 this comes from replacing "the denominators do not vanish" by the single condition `1 + k₁ sn² ≠ 0`, which is enough for the `τ` form only. The `τ` forms, the Lean statements and every other repair of the previous round are correct and were recomputed. There are no small corrections and no format notes; the questions left to the human reviewers are unchanged.

## R01 (P2) — At `k = 0` the modulus forms of 4.4 (third law) and 4.5 (second and third laws) read `1 = 0/0` and `cos u = 0/0`

An implementer who states the modulus forms as the README now gives them proves false statements at `k = 0`, a modulus the README treats as a legitimate one (3.4, and the Check of 4.3 at `k = 0`).

In 4.4 the conditions are now "where `θ_n(w|2τ) ≠ 0` and `1 + k₁ sn²(w|2τ) ≠ 0`" (line 495), justified by "The two denominators vanish together: `1 + k₁ − dn² = k₁(1 + k₁ sn²)` by 1.2, and `k₁ ≠ 0`" (line 500). That is true for `k₁ = k(2τ)`, and the Lean statement `jacobiSnTau_landen`, which is the `τ` form, is correct without `hd` (recomputed at the three test values of `τ`). But the next bullet carries the laws over to the modulus form "for either root `k′` of `k′² = 1 − k²` with `k′ ≠ −1`" (line 502), and there `k = 0`, `k′ = 1` gives `k₁ = 0`: both conditions hold (`θ_n = 1`, `1 + 0 ≠ 0`), the first two laws read `sin u = sin u`, `cos u = cos u`, and the third reads `dn(u, 0) = 1 = (1 − 1)/(1 + 0 − 1)`, which is `0` with `x / 0 = 0`. The earlier wording excluded this case.

In 4.5 the modulus form is stated "for `k ≠ −1`" (line 532) where `θ_n` and `θ_d` at `(w, k₂)` do not vanish. At `k = 0`: `k₂ = 0`, `k₂′ = 1`, `w = u/2`, both thetas are `1`, the first law is `sin u = 2 sin(u/2) cos(u/2)` (both `0.3696183984 + 0.1972309663i` at `u = 0.37 + 0.21i`), and the second and third have the denominator `k₂² dn = 0`: they read `cos u = 0` and `1 = 0`, while `cos u = 0.9529608247 − 0.0764986262i`.

The smallest change: in the modulus form of 4.4 add "and `k ≠ 0` for the third law (there `k₁ = 0`)", or give the third law there as `dn(u, k) = (1 − k₁ sn²)/(1 + k₁ sn²)`, which is the same function and has no further exception; in 4.5 write "for `k ≠ −1`, and `k ≠ 0` for the second and third laws (there `k₂ = 0`)". A line in the Checks of each, beside the one for `k = −1`, would pin it.

## Previous findings

The previous report had no finding; its small corrections and format notes at this head:

- C01 — repaired: 4.4 derives `sc(u|τ) = (1 + k₁) sn/(cn dn)` from the second pair of quotients and 2.4; 4.5 uses the first pair at `τ/2`, "as Whittaker–Watson §22.42 derive it". Both recomputed.
- C02 — repaired: "corners `−π`, `π`, `πτ`, `−2π + πτ`, whose sides avoid the poles"; the poles inside are `−π + πτ/2` and `πτ/2`.
- C03 — repaired: "Whittaker–Watson §22.11, p. 491, for `μ` off the two cuts".
- C04 — repaired: "`k₂′ = (1 − k)/(1 + k)`, the quotient of DLMF 22.7.5; the other root of `1 − k₂²` fails (Checks)".
- C05 — repaired: "DLMF 19.25.33 with `p = n`, and 22.15.11 for real `−1 ≤ x ≤ 1` and `0 ≤ k ≤ 1`", in 8.1 and in the docstring.
- C06 — repaired: the list of inputs names only files at the pin, cites EllipticIntegrals 7.5–7.7 and 3.2, and adds `TauCeti.Real.legendre_relation`.
- C07 — repaired in the `τ` form and in Lean (`hd` dropped); the same change makes the modulus form of 4.4 false at `k = 0`: R01.
- C08 — repaired as asked ("for `k ≠ −1`"), with a Check; `k = 0` is also exceptional, which the previous review did not see: R01.
- C09 — repaired: the description says "recorded errata, none of which fall in this roadmap's scope" and "§§10.3, 10.4 and 10.6".
- N01 — repaired: "SpecialFunctionsHeun 2.4 states the Jacobi form"; the three comparisons with software values are now the `R_F` inversion of 8.1 and the integral for `E`.
- N02 — repaired: DLMF 22.6.19–22.6.21; Whittaker–Watson §22.21, p. 497; §22.341, p. 504; §10.6 in the Summary.

## Verified sound

Values from a double-precision recomputation of the Lean definitions (`jacobiTheta₂` as its series, `R_F` by duplication with principal roots). `T` = `τ = 0.3 + 0.8i`, `−1.2 + 0.5i`, `0.55 + 1.4i`; `u = 0.37 + 0.21i`.

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| 4.4 `jacobiSnTau_landen` without `hd` (sample) | `T` | `sn = 0.3732144444 + 0.1874422823i` both sides at `τ₁`; `cn`, `dn` residuals `≤ 3.3 · 10⁻¹⁵`; `k₁ = (1 − k′)/(1 + k′)` to `2 · 10⁻¹⁶` | holds |
| 4.4 denominators vanish together | `T` | `1 + k₁ − dn² = k₁(1 + k₁ sn²) = 0.1892183908 + 0.2675790237i` at `τ₁`; difference `≤ 6 · 10⁻¹⁶`; `k₁ ≠ 0` | holds in the `τ` form |
| 4.4 sketch: theta constants, second pair, `sc` law | `T` | constants `≤ 2 · 10⁻¹⁶`; both quotients `= θ₂(0|τ)/2 = 0.5169189373 + 0.1275248791i`; `sc` law `≤ 6 · 10⁻¹⁶`; squares checked by hand | holds |
| 4.4 modulus form | `k = 0`, `k′ = 1` | `k₁ = 0`; third law `1` against `0/0 = 0` | fails; R01 |
| 4.5 `jacobiSnTau_gauss` and sketch (sample) | `T` | first pair both `= θ₄(0|τ) = 0.9047060821 − 0.1311155585i`; `2z = ζ` to `3 · 10⁻¹⁶`; three laws `≤ 2 · 10⁻¹⁵`; squares by hand | holds |
| 4.5 modulus form | `k = ±0.6`, `−3`, `−0.7 + 0.9i`, `0.5 + 0.3i`, both roots; `k = 0`, `−1` | residuals `≤ 10⁻¹⁵`; wrong root off by `0.0285396`; `k = −1`: `0.36798 + 0.18538i` against `0.36732 + 0.15968i`; `k = 0`: `cos u` against `0` | holds for `k ≠ 0, −1`; R01 |
| 1.1, 3.3 Checks by `R_F` | `τ₁`; `k = 0.5 + 0.3i` | `1 − x²`, `1 − λx²` have real parts `0.896`, `0.978`; `x R_F − u` `= 3 · 10⁻¹⁶`, `5 · 10⁻¹⁶`; `x = 0.3729377463 + 0.1948314770i` | holds |
| 5.2 half arguments (sample; locator only) | DLMF 22.6.19–22.6.21 | three equations read; `dn²(z/2)` is 22.6.21 | holds |
| 6.1 contour | `τ₁` | `θ_n` `≈ 10⁻¹⁵` at `−π + πτ/2`, `πτ/2`; `min |θ_n| = 1.0000` on the side `π → πτ`; `4 · 10⁻¹⁶` on the old side | holds |
| 7.4 Legendre, rectangular case, `E` Check (sample) | `k = 0.6`; `k = 0.5 + 0.3i`; `T` | `−1/τ = carlsonTau k′` to `3 · 10⁻¹⁶`; `E = 1.4180833944`, `E′ = 1.2763499432` both ways; left side `1.5707963268`; `E = 1.5139493183 − 0.1245176877i` by theta and by the integral | holds |
| 8.1 locators (sample) | DLMF 19.25.33, `Δ(c,n) = −1`, `Δ(d,n) = −k²` | gives `x R_F(1, 1 − x², 1 − k²x²)` | holds |

The rows for the untouched statements stand as in the previous review, of `eb82a19`.

- Source locators checked against the text: Whittaker–Watson (3rd ed. text) §22.21 at p. 497, §22.341 across pp. 503–504, §22.42 with Example 2 at p. 508, §22.6 corners at p. 510, §22.11 p. 491; DLMF 22.6.19–22.6.21, 22.7.5, 19.25.33.
- Library declarations opened at the pin: `TauCeti.Real.legendre_relation` (`TauCeti/Analysis/SpecialFunctions/EllipticIntegral/Relation.lean`, line 88: `0 < k`, `k < 1`, with `√(1 − k²)`); the directories `JacobiElliptic/` (only `Basic.lean`) and `Elliptic/` (`Uniformization.lean`, `WeierstrassZeta.lean`).
- Cross-roadmap citations resolved on main: SpecialFunctionsTheta 2.4 (the two theta-constant identities are its Checks) and 4.4 (both pairs of quotients as quoted); EllipticIntegrals 3.2, 7.5, 7.6, 7.7; SpecialFunctionsHeun 2.4 at its open head.
- Dependency check: `depcheck: 129 roadmaps, 1436 edges, 0 problem(s)`; no change outside the folder.
- Elaboration: `Suggested.lean` elaborates with 33 `sorry` warnings and nothing else; the new import exists at the pin; the elaborated type of `jacobiSnTau_landen` has the hypotheses `hτ`, `hk₁`, `hw`, `hn`, `hs` and agrees with 4.4.
- Pull request text: the description's suppliers (SpecialFunctionsTheta §§2.2–2.4, EllipticIntegrals §3.2), imports (`EllipticIntegral.Relation`), counts (33 `sorry`) and source list agree with this head.

Overlap check: read SpecialFunctionsTheta, EllipticIntegrals, SpecialFunctionsLame; SpecialFunctionsLame consumes 2.1–2.3, 3.4, 3.5, 4.1, 7.1 of this roadmap and owns none of its objects; theta quotients and `λ`: SpecialFunctionsTheta; real `sn, cn, dn` and the real Legendre relation: EllipticIntegrals; nothing has two owners.

Source independence: changed passages only; 9 passages compared with 2 sources (Whittaker–Watson Ch. XXII, DLMF §§19.25, 22.6, 22.7), none shared; largest share DLMF, as in the previous review (Lawden not readable); no layer added, removed or reordered, so the contents were not compared again.

Research link: the complex-modulus theory is that of Walker (2003), which DLMF §22.17(ii) cites for it; the README's consumers are Lamé functions and ellipsoidal harmonics (Whittaker–Watson Ch. XXIII), cnoidal-wave solutions of KdV and NLS, and conformal maps by `sn` (DLMF §22.18(ii)). Rests on the README and DLMF.

## Not verifiable

- Lawden 1989, Armitage–Eberlein 2006, Magnus–Oberhettinger–Soni 1966 at the changed locators of 4.4, 4.5, 5.1, 5.2, 7.4, 8.1: paywalled books; no legal copy found.
- Whittaker–Watson: read in the 3rd edition (1920) text; the README cites the 4th (1927).
- The README's agreements to `10⁻³⁰` were recomputed only to double precision.

Automatic checks set aside as false positives: a section comment of `Suggested.lean` with no declaration under it, which holds the `#check` lines that pin library declarations, as the rules allow.

## Source issues

- none

## For the human reviewers

- Not tested: nine of eleven cited texts, among them Lawden (36 of about 170 locators), could not be read; wording and arrangement were compared only with DLMF Chapter 22 and Whittaker–Watson Ch. XXII.
- Licence: the description says the author's lean-DLMF project formalized much of DLMF Chapter 22; `Suggested.lean` was not compared with that repository.
