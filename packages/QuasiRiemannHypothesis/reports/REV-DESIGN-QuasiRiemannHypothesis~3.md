<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/18769#issuecomment-6936133708 -->
Review (claude) of 7de8cf2

Verdict: needs_changes

**Source independence:** 21 passages compared with 6 sources, one shared (the table of savings of `openai2026quasiRH` §11, 12 consecutive label words, R05), none elsewhere beyond 7 outside formulas; largest share `openai2026quasiRH`, 61 of 130 locators; contents compared with `openai2026quasiRH`: independent.

**Research link:** The headline is Theorem 3.1 of OpenAI (2026), with Liu (2026) as second account; Layers 6 and 8 are the large sieves of Goldmakher–Louvel (2013), Blomer–Goldmakher–Louvel (2014), Heath-Brown (2000) and the cubic theta function of Patterson (1977) used by Dunn–Radziwiłł (2024). Rests on the README and the sources read.

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) §5.2 restates Rademacher's convexity bound, which ExplicitZetaBounds §3.2 owns on main

   Location: `design/README.md` lines 958–990 (§5.2) and lines 259–264 (contract: "the strip bound of
   §3.4 is not consumed … so the bound uniform in the conductor is this roadmap's §5.2");
   `design/plan.json` target 5.2.

   Claim: no roadmap supplies a strip bound for Hecke `L`-functions that is uniform in the conductor,
   so §5.2 proves one by Phragmén–Lindelöf.

   Witness: `TauCetiRoadmap/ExplicitZetaBounds/README.md` lines 1227–1243 (main), §3.2
   `norm_continuedL_le_rademacher`: for every record of finite-order type and `0 < η ≤ 1/2`,
   `‖continuedL d s‖ ≤ P(s) (N (|1+s|/(2π))^n)^((1+η−σ)/2) ζ(1+η)^n` on `−η ≤ σ ≤ 1+η`. At `η = 1/10` and
   `heckeData ψ` this is §5.2.

   Repair. Keep the statement of §5.2 as a corollary and replace its route by: "This is
   ExplicitZetaBounds §3.2 (Rademacher's convexity bound) at `η = 1/10` for the record `heckeData ψ`
   of LFunctions Layer 5, of degree `d` and conductor `N = |d_K| Q`, with
   `continuedL (heckeData ψ) = heckeLFunctionC ψ.character` (ZerosOfLFunctions §1.6): the exponent
   `(11/10 − σ)/2` is at most `3/5` on the strip, `|1 + s|/(2π) ≤ 3 + |t|`, and in the principal case
   `P(s) |(s − 1)/(s + 1)| = 3`, so `C_K = 3 |d_K|^(3/5) ζ(11/10)^d` serves." Delete the
   Phragmén–Lindelöf route and the sentence on `(s + 2)^(6d/5)`. *Needs:* becomes "ExplicitZetaBounds
   §3.2; LFunctions Layer 5 (`heckeData`); ZerosOfLFunctions §1.6". Add the subsection "From
   TauCetiRoadmap.ExplicitZetaBounds" to the contracts and the line "Rademacher's convexity bound on
   records of finite-order type: ExplicitZetaBounds §3.2; §5.2 here is its instance at Hecke records"
   to "Consumed, not redefined"; drop `PhragmenLindelof.vertical_strip` from the Mathlib contract, the
   ZerosOfLFunctions §§3.1, 3.4 clause on finite order from the contract and from §5.2, and both from
   the Layer 5 Dependencies; the same in `plan.json` 5.2. Tested on the instance `K = ℚ`, `ψ = 1`,
   `σ = −1/10`: `3 (|0.9 + it|/(2π))^(3/5) ζ(11/10) ≤ 3 · 10.6 · (3 + |t|)^(3/5)`, the bound of §5.2 with
   `d = 1`.

2. **F02** (P2) §6.2: the power of a Hecke family and the corollary for `χ^(n/2)` fail for a family of smaller exact order

   Location: `design/README.md` line 1118 ("For `d ∣ n` with `d > 1`, `{χ_𝔞^(n/d)}` is a `d`-th order
   Hecke family") and lines 1136–1137 ("for an `n`-th order family with `n ≥ 3` even the same bound
   for `χ_𝔟^(n/2)`"); `design/plan.json` target 6.2, api `pow`.

   Claim: both hold for every `n`-th order Hecke family in the sense of the definition.

   Witness: `k = ℚ(i)`, `n = 4`: a quadratic Hecke family satisfies the three axioms with `n = 4`
   (orders divide `4`, `C` has values in `μ_2 ⊂ μ_4`). Its squares are trivial: axiom (3) fails, and
   with `λ_𝔟 = 1`, `M = N` the left side is `≍ N³` against `N^(2+ε)`.

   Repair. Line 1118: "For `d ∣ n` with `d > 1`, the primitive characters inducing `χ_𝔞^(n/d)` satisfy
   axioms (1) and (2) with `C^(n/d)`; they form a `d`-th order Hecke family when they also satisfy the
   primitivity axiom (3), which is an extra hypothesis: it fails when the `χ_𝔞` have order dividing
   `n/d`." Lines 1136–1137: "and for an `n`-th order family with `n ≥ 4` even whose powers
   `{χ_𝔞^(n/2)}` satisfy axiom (3), that is, form a quadratic Hecke family, the same bound for
   `χ_𝔟^(n/2)` (`goldmakherlouvel2013` Corollary 1.2, p. 2, which omits this hypothesis; it holds for
   the Fisher–Friedberg characters, whose local component at each prime of a squarefree `𝔞` is the
   `n`-th power residue symbol, of exact order `n`)". Add the Check: "A quadratic Hecke family over
   `ℚ(i)` is a fourth-order family whose squares are the trivial characters: with `λ_𝔟 = 1` and
   `M = N` the double sum is `≍ N³`, above `N^(2+ε)`, so the corollary needs the primitivity of the
   powers." The same in `plan.json` 6.2. Tested on the witness: the added hypothesis excludes it
   (axiom (3) fails for the trivial characters, as the README's own second Check says), and §6.4's use
   (Fisher–Friedberg characters, `n = 6`) keeps it.

3. **F03** (P2) §8.5: "the residue at every essential cusp" is stated for every `Γ(N)` and supported only for Patterson's group

   Location: `design/README.md` lines 1479–1480: "`θ` is the residue, up to a nonzero constant, at
   every essential cusp (`patterson1977` Theorem 8.1, p. 152, for `n = 3`)".

   Claim: for every imaginary quadratic `K ⊇ μ_n`, every `N` and every essential cusp of
   `Γ(N) ∩ SL₂(𝓞_K)`, the residue at `1 + 1/n` of that cusp's Eisenstein series is a nonzero multiple
   of `θ`.

   Witness: `patterson1977` lines 135–140 and 1175–1177: the statement is for `Γ₁(3)` and the cusps
   `∞, 0, ±1`, all `SL₂(ℤ)`-translates of `∞`, and says "proportional". `kubota1969` lines 1337–1347
   (p. 49) makes the residues a finite-dimensional space, with no bound `1` on its dimension.

   Repair. Replace the bullet by: "The residues at `s = 1 + 1/n` of the Eisenstein series at the
   essential cusps span a finite-dimensional space of square-integrable automorphic eigenfunctions
   (`kubota1969` §6, p. 49); no bound on its dimension is asserted, and `θ` is its element attached
   to `∞`. For `(Γ₂, κ_P)` every essential cusp is `Γ₂`-equivalent to `∞` (the essential cusps of
   `Γ₁(3)` are `∞, 0, 1, −1`, `patterson1977` §2, p. 127; the cusps `ω`, `ω²` are not essential), so
   there the residues are proportional to the one function of §8.7 (`patterson1977` Theorem 8.1,
   p. 152)." Tested on the instance: for `(Γ₂, κ_P)` the repaired bullet gives the statement §8.7
   uses, and it agrees with §8.7's `C₁ = C₂ = 0` (no constant term at `ω`, `ω²`); for a general
   `Γ(N)` it asserts nothing the sources do not. `plan.json` 8.5 does not carry the bullet and needs
   no change.

4. **F04** (P2) §11.2: the Hecke analogue bounds by the conductor a quantity that depends on the presentation

   Location: `design/README.md` lines 2064–2066: "a nontrivial finite-order Hecke character `η` of `K`
   of conductor `𝔣` whose primitive `L`-function is zero-free right of `θ`, some prime ideal `𝔭` with
   `η(𝔭) ∉ {0, 1}` has `N𝔭 ≤ C_{K,θ} (log N𝔣 + 2)^(1/(1−θ))`"; `design/plan.json` target 11.2.

   Claim: the bound holds for every finite-order Hecke character, which by the Conventions (lines
   150–152) is a ray class character of some modulus with its zero extension.

   Witness: `K = ℚ`, `η` the character modulo `3 ∏_{p ≤ y} p` induced by `(·/3)`: `N𝔣 = 3`, and
   `η(p) = 0` for every `p ≤ y`, so the least prime with `η(p) ∉ {0, 1}` exceeds `y`. The Dirichlet
   statement two lines above uses `log q`, the modulus, for this reason.

   Repair: "for a number field `K`, `θ ∈ [1/2, 1)`, a modulus `𝔪` of `K` and a nontrivial
   `η : RayClassCharacter 𝔪` (zero on the ideals meeting `𝔪`) whose `L`-function `heckeLFunctionC η`
   is zero-free right of `θ`, some prime ideal `𝔭` with `η(𝔭) ∉ {0, 1}` has
   `N𝔭 ≤ C_{K,θ} (log N𝔪 + 2)^(1/(1−θ))`, `N𝔪` the norm of the finite part; for primitive `η` this is
   the bound in the conductor norm `N𝔣`." Add the witness as a Check, and write `N𝔪` in `plan.json`
   11.2. Tested on the witness: `log N𝔪 = log 3 + θ(y) ≍ y`, and the least admissible prime is the
   next prime after `y`, below `C (y + 2)^2`.

5. **F05** (P2) §10.6 takes over the source's table of savings

   Location: `design/README.md` lines 1965–1968: "the savings relative to `C_I(β*)` before adjustable
   losses are `1021/25000` (intermediate rows), `1/40` (unresidued principal `w`-integral), `1/1200`
   (remaining principal `z`-integral), `43/300` (small rows) and more than `1` (large rows …)", and
   lines 1976–1977.

   Claim: the route is in the roadmap's own words.

   Witness: `openai2026quasiRH` lines 3677–3683 (the table opening §11, p. 82): the same five rows in
   the same order with the same labels and header; 12 consecutive label words shared. "Unresidued" is
   the source's coinage and is defined nowhere in the roadmap.

   Repair. Replace the sentence by: "Route: §10.5 gives five exponents below `C_I(β*)`, each before
   the losses chosen next. The rows with `Z^(1/63) < q_u ≤ Z^(h+ς)` are bounded by the retained
   integral with the row count of §10.4 and lie `1021/25000` below. The row `u = 1` contributes, apart
   from its double residue, the part of its `w`-integral moved to `Re w = 19/20`, which lies
   `l_y/20 = 1/40` below, and the `z`-integral left on `Re z = 33/200` after the residue at `z = 1/6`,
   which lies `h/600 = 1/1200` below. The rows with `q_u ≤ Z^(1/63)` lie `43/300` below, and the rows
   with `q_u > Z^(h+ς)`, on the line `Re z = 4000`, more than `1` below (`openai2026quasiRH` §11,
   p. 82)." In the third Check write "the `z`-integral of the row `u = 1` fixes `m₀`". The numbers are
   unchanged: `1/6 − 1/600 = 33/200`, `(1/2)/20 = 1/40`, `(1/2)/600 = 1/1200`, and §10.5 already states
   `43/300`.

6. **F06** (P3) two witnesses that do not test their statement, and three targets whose tests are missing from the plan

   Location and repair, one line each.

   - `design/README.md` lines 1030–1031 (§5.4, third Check): `1 + √2` is not `≡ 1` modulo any `q > 1`,
     so it does not test the ray condition. Replace by "`K = ℚ(√2)`, `χ` the odd character modulo `3`:
     `α = 1 + 3√2 ≡ 1 (mod 3)` has `N(α) = −17`, and `χ(N(α𝓞)) = χ(17) = χ(2) = −1 ≠ 1`, so `χ ∘ N` is
     not trivial on the principal ray modulo `3` without the real places."
   - `design/README.md` lines 943–944 (§5.1): "if `N𝔯 ≤ Z^B` with `B` bounded" needs `Z ≥ 1`: at
     `B = 0`, `𝔯 = 𝓞`, `D = 1` and `1 ≪ Z^ε` fails as `Z → 0`. Write "for `Z ≥ 1`".
   - `design/plan.json` targets 8.4, 10.3 and 10.4 carry 0, 1 and 0 tests; the README has three, four
     and three Checks there (lines 1462–1465, 1847–1857, 1876–1878). Add the missing tests to the plan.

6 findings: 5 P2, 1 P3. All 8 findings of round 2 are repaired, and the repaired passages survive
the adversarial pass. The new findings come from the 15 sampled targets and from the duplication
audit: one statement that a roadmap on main already owns (R01), three statements that are false or
unsupported at a degenerate or wider instance (R02–R04), and one table of the main source taken
over as it stands (R05).

Files read: `packages/QuasiRiemannHypothesis/design/README.md` (all 2167 lines),
`packages/QuasiRiemannHypothesis/design/plan.json` (11 layers, 55 targets, 140 tests, `gaps = []`),
`packages/QuasiRiemannHypothesis/sources.toml` (24 entries, all `certified`, no machine path). No
maintainer notes exist for this roadmap. No supplier gap is declared and no finding needs one.
There is no `Suggested.lean` at the design stage: nothing was elaborated (this lane does not
elaborate), and the padding probe has nothing to run on.

## Round 2 findings

| Id | Status | Repaired passage |
| --- | --- | --- |
| F01 | repaired | §8.7, lines 1547–1550: "`τ(±λ^(3n−4) c d³) = conj g(λ², c) |d/c| 3^(n/2 + 2)`" and the three others; lines 1553–1557 (`θ̄`, `d_j` the conjugate of the coefficient of `θ ∘ H_j` at `−μ`); Check, lines 1571–1575 |
| F02 | repaired | §5.1, lines 943–944: "if `N𝔯 ≤ Z^B` with `B` bounded, then `|D_𝔯(s)|` and `|D_𝔯(s)|⁻¹` are `≪_{K,σ₀,B,ε} Z^ε`" (see R06 for `Z ≥ 1`); §5.3, lines 999–1001: "`|1/ζ_K(s)| ≤ |ℒ(s)|⁻¹` on `Re s ≥ 0`" |
| F03 | repaired | contract, lines 285–289, and §2.1, lines 506–511: "The conductor has exponent `0` at every finite place `v ∤ n a` …"; `mem_support_of_ramified` is gone |
| F04 | repaired | §8.1, lines 1342–1348: "at `v ∣ c`, `v ∤ n`, the tame symbol is `((1 + bc)/𝔭_v)_n^(v(c)) = 1`"; *Needs:* §§1.43, 1.52 |
| F05 | repaired | §11.2, lines 2048–2050: "*leastNonOne* `χ* ≤` *leastNonOne* `χ`; equality can fail (modulo `12`: `2` against `5`)" |
| F06 | repaired | §8.3, lines 1419–1429 (`χ_ij(c, d) = χ(σ_i γ σ_j⁻¹)`, the factor `|U_i|⁻¹`) and the Check of lines 1437–1441 |
| F07 | repaired | scope, lines 106–108; §8.2 Check, lines 1403–1407 |
| F08 | repaired | §9.3, line 1688 ("the lattice `Λ = 𝓞` or `λ⁻⁴𝓞`"); §5.4, line 1021 ("`N_{K/ℚ}` being positive on `K^×`") |

The repair report's two "applied differently" items (F03, F06) are sound: the pinned declarations
it cites say what it says (below), and the factor `|U_i|⁻¹` is the one the `SL₂(ℤ[i])` value
confirms. The repaired pattern of F01 (a lost conjugation bar) was looked for again in §§4.3, 4.5,
4.6, 9.1, 10.1 and 10.3: every bar is forced by a computed Check.

## Adversarial table

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §2.4 | count of numerators; `S ⊇ {(2), (λ)}` | `6` units × `6^|S|` residue vectors `= 6^(|S|+1)`; supports of the moduli of §2.1 lie in the primes of `6 ∏ π_𝔭 ⊆ S` | holds | none |
| §3.1 twist, rescaling | `w'(x) = x^(iτ) w(x)`; `w_k(x) = w(e^k x)`; indicator of `[1, 2]` | `ŵ'(t) = ŵ(t − τ)`, `(1 + |t + τ|)^J ≤ (1 + |τ|)^J (1 + |t|)^J`; `ŵ_k = e^(ikt) ŵ`; `|ŵ| ≍ |sin|/|t|`, not integrable | holds | none |
| §3.2 tail | `|t| > T₁ ≥ 1` | `(1 + |t|)^N ≥ T₁^N`, so the tail is `≤ T₁^(−N) (2π)^d ‖w‖_{J+N,sep}` | holds | none |
| §3.2 joint bound | `a(u) = (1 + |u|)^(−J−N)`, `u ≈ −T`; the split `(1 + |T| + |u| + |w|) ≤ (1 + |T + u|)(1 + 2|u|)(1 + |w|)` | left side `≈ 2^J (1 + |T|)^(−N)`, the stated order; splitting by `(1 + |T|)^J` instead loses `(1 + |T|)^J` | holds, sharp | none |
| §4.3 | `p = 1 + 3ω`, `ω ↦ 2` in `𝔽₇` | `γ_2³ = 0.18898 − 0.98198i = −α(p)`; `γ_3 = i`; `γ_1γ_2 = −0.65465 + 0.75593i = χ̄_p(4) γ_3 γ_2³`; from the Jacobi relation `J(H, H³) = H(4) J(H, H)`: `T_1 = H̄(4) T_3 T_2²/P` | holds | none |
| §5.1 consequence | `B = 0`, `Z → 0` | `𝔯 = 𝓞`, `D = 1`, `Z^ε → 0` | needs `Z ≥ 1` | R06 |
| §5.2 | ExplicitZetaBounds §3.2 at `η = 1/10`; `K = ℚ`, `ψ = 1` | exponent `(11/10 − σ)/2 ∈ [0, 3/5]`; `P(s)|(s−1)/(s+1)| = 3`; `|1 + s|/(2π) ≤ 3 + |t|` | true; owned on main | R01 |
| §5.3 | `a = 1`; `a = 1/2`, trivial character at `t = 0`; `1/ζ_K` | disc `Re s > 1 + 2ε`, bounded by `ζ_K(1 + 6ε)`; `ℒ(1) = Res/2 ≠ 0`; `|(s − 1)/(s + 1)| ≤ 1` exactly on `Re s ≥ 0` | holds | none |
| §5.4 definition | `α ≡ 1 (mod q)` totally positive; `ℚ(√2)`, `q = 3`, `α = 1 + 3√2` | `N(α) ≡ 1`, `N(α) > 0`; `N = −17`, `χ(17) = χ(2) = −1` for the odd `χ` | holds; Check 3's witness is not in the ray | R06 |
| §5.4 factorization | unramified `p`, residue degree `f`, `g` primes; `ℚ(i)` modulo `5` | `∏_ψ (1 − χ(p)ψ(p)T) = (1 − χ(p)^f T^f)^g`; `χ(3)² = (−i)² = −1 = χ(4)` | holds | none |
| §6.2 powers, corollary | quadratic family over `ℚ(i)` read with `n = 4`; Fisher–Friedberg, `n = 6` | squares trivial; `Σ_𝔞 |Σ_𝔟 1|² ≍ N³` against `N^(2+ε)`; exact order `6` at each prime, cubes of conductor `∣ λ𝔞` | false at the first | R02 |
| §6.2 Check 1 | `a = 3, b = 7`; `a = 3, b = 5` | `21 ≡ 1 (mod 4)`: conductor `21`; `15 ≡ 3`: conductor `60` | holds | none |
| §6.3 | `F`, `n = 3`, `𝔠 = (λ)⁴`; `𝔞 = (10)`, `𝔟 = (1 + 3ω)` | `(1 + λ²x)³ ≡ 1 − λ⁴x (mod λ⁶)`, so cubes of `U^(2)` fill `U^(4)`; `10 ≡ 3`, `3² = 9 ≡ 2 ≡ ω` in `𝔽₇` | holds | none |
| §7.1 | `r = 0`; twist `W_v`; `K = ℚ` | `M_0 = W(1)`; `MW_v(s) = MW(s + iv)`, after `s ↦ s − iv` the factor is `L(s − iv)⁻¹`; `Σ μ(n) n^(iv−s) = ζ(s − iv)⁻¹`, pole at `1 + iv` | holds | none |
| §8.1 route | §1.43 with `a = c`, `b = 1 + bc` | `v ∣ 1 + bc`: `(c/𝔭)^(−v(1+bc))`; `v ∣ c`: `((1 + bc)/𝔭)^(v(c)) = 1`; `v ∣ n`: `4v(n) ≥ 2v(n) + 1` | holds | none |
| §8.3 `φ` | `SL₂(ℤ[i])`, `χ = 1` | `4 ζ_K(3)/ζ_K(4) = 4.352670`; `φ(1) = π (−1/4)(4/π) = −1` with `|U| = 4`; `−2` with `1/2` | holds | none |
| §8.5 | imaginary quadratic `K`, `n² ∣ N`; `n = 3, 2`; cusps of `Γ₁(3)` | units `≡ 1 (mod N)`, `N ≥ 4`: only `1`, so `GL₂(𝓞)_N = Γ(N) ∩ SL₂(𝓞_K)`; `(4/3)(2/3) = 8/9`, `(3/2)(1/2) = 3/4`; essential cusps `∞, 0, ±1` only | definition and first bullet hold; cusp bullet unsupported | R03 |
| §8.7 | `c = 1 + 3ω`; the bound at `k = −3`, `3n − 4`, `3n − 3` | `g̃ = 0.89595 − 0.44415i`, `g̃³ = −α(c)`, `|g̃ − conj g̃| = 0.88830`; `γ_2 = χ_c(λ)² g̃ = −0.83262 − 0.55384i`; `3^(5/2) = 27·3^(−1/2)`, `3^(n/2+2) ≤ 3^(n/2+7/3)`, `3^(n/2+5/2)` equal | holds | none |
| §9.2 | `B_p` at `j_p = 4`; `V♯` contour; (5.4)–(5.6) | `−q_p^(−1/2)` off `p`, `q_p^(1/2)(1 − q_p⁻¹)` on `p`; poles at `t = −5/6, −7/6`; orders `⌈4A⌉ + j + 2`, `⌈4A⌉ + J + 4` as printed | holds | none |
| §9.4 | `K = 1`; `N = B = 1`; `M = N = 1` | `|Σβ|² ≤ (NB)² ≤ (1 + NB)NB`; `≤ #k ≪ K`; exponent `O/2 + (1 − O) = 1 − O/2` | holds | none |
| §10.3 local factor | `j = 0` on `D₂` and `D₁(ε₀)`; `j = 2, …, 5` on `D₁` | `P_p(1 − V)(1 − W) = 1 − VW + P*(1 − V)(1 − W)`; on `D₂`: `|V| ≤ q^(−0.99)`, `|R| ≤ q^(−2.24)`, cross term `DW`, `DV ≤ q^(−1.825)`, so `H_p − 1 ≪ q^(−1.8)` and `Σ_{q > P₀} ≪ P₀^(−4/5)`; on `D₁`: `|R| ≤ q^(−1.1)`, `|DW| = q^(−(x+w)) ≤ q^(−1−ε₀)`; `J_2 ≤ q^(−0.03)`, `J_3 ≤ q^(2−2x−(x+w)) < 1`, `J_4`, `J_5 ≤ q^(−0.06)`; `b_p³ = a_p²` since `χ̄_p(4)³ = 1` | holds; the region `Re x + Re w ≥ 1 + ε₀` is exactly what `DW` needs | none |
| §10.3 constants | residues at `w = 1`, `z = 1/6` | `X^(1/3) Z^(x−5/6) Φ(x − 5/6)`; `Res_{z=1/6} ζ^S_F(6z) = Res/6`; `1/6 ≥ 33/200` | holds | none |
| §10.4 `R(δ)` | `δ = 1/50, 2/3, 1` | `1`, `2/3`, `1/2` | holds | none |
| §10.5, §10.6 | probe data; loss budget | `13/150 − 1/4 + 1/50 = −43/300`; `7/4 + 0.501 − 4 = −1.749`; `46·10⁻⁶ < 1/4800 = 2.083·10⁻⁴`; `3/4800 = 1/1600 > 1/2400`; `1/6 − 1/600 = 33/200` | holds; wording | R05 |
| §10.7 | data of §1.3 | `C(11/12) = 1/4`; `σ = 1/4800`, `ω = (β* − 11/12)/2` as in the source's proof of Theorem 3.1 | holds | none |
| §11.2 Dirichlet | `q = 2, 3, 4`; `χ` modulo `12` from `(·/3)`; primes dividing `q` | no nonprincipal `χ` modulo `2`; values `2`, `3`; `5` against `2`; prime sides differ by `≤ 2 Σ_{p ∣ q} log p · log x/log 2` | holds | none |
| §11.2 Hecke | `(·/3)` presented modulo `3 ∏_{p ≤ y} p` | least prime `> y`, `N𝔣 = 3` | false as written | R04 |
| §11.3 | `θ = 11/12`, `7/8`; `p = 7` | exponents `12`, `8`; least nonresidue `3` | holds | none |

## Verified sound

- **Principles.** No algorithm, no `set_option`, no Lean file, no re-planned roadmap, no cycle; the
  `7/8` stage is a named Part II. Layers 2 and 4–7 are stated over general number fields. The
  restriction of Layer 8's analysis to `ℍ³` (imaginary quadratic `K`) is declared in the scope
  section with its reason; rounds 1 and 2 held it as a scope statement and it is not reopened.
- **Sampled sources (15 targets), read at the locator.** §2.4 (`openai2026quasiRH` lines 465–485,
  pp. 11–12), §3.1 (lines 707–718, p. 17), §3.2 (lines 719–760 and proof 774–808, pp. 17–19), §4.3
  (lines 526–564, pp. 13–14), §5.3 (lines 957–998, pp. 22–23), §5.4 (lines 3796–3810, pp. 84–85),
  §6.2 (`goldmakherlouvel2013` lines 45–100, pp. 1–2: R02), §6.3 (`bgl2014` lines 1217–1238, p. 20,
  and 257–262, p. 6), §7.1 (`openai2026quasiRH` lines 489–497, p. 12), §8.5 (`kubota1969` lines
  1326–1374 and 1425–1438, printed pp. 49–52: R03), §9.2 (`openai2026quasiRH` lines 1041–1167,
  pp. 24–27), §9.4 (lines 1603–1631, p. 37, and 1980–1983, p. 44), §10.3 (lines 2218–2262, p. 50;
  the displays of (7.6)–(7.12) are not legible in the text and were checked by the exponent
  computation of the table), §10.6 (lines 3724–3784, pp. 83–84: R05), §11.2 (`lamzourilisound2015`
  lines 55 and 236: Theorem 1.1 and Lemma 2.2 exist and are the case `θ = 1/2`, as the README says).
  12 sound, 3 with a finding. The author flagged no locator as unverified.
- **Library at the pins** (opened this round): `TauCeti.ClassFieldTheory.abelianConductor`,
  `isAdmissibleModulus_iff_abelianConductor_dvd`, `isAdmissibleModulus_abelianConductor`
  (`TauCeti/NumberTheory/ClassFieldTheory/Global/AdmissibleModulus/Basic.lean` 193, 200, 208; the
  conductor is defined as the least admissible modulus, with no hypothesis on `L/K`);
  `conductorExponent_eq_zero_of_isUnramified` (`…/Local/Conductor/Basic.lean` 125, with
  `conductorExponent_le_iff` at 113, which is the "units are norms" gloss);
  `isAdmissibleModulus_iff_le_rayClassField` (`…/ClassFields/RayClassField.lean` 167);
  `kroneckerWeber` (`…/ClassFields/KroneckerWeber.lean` 178);
  `Ideal.powerResidueSymbolIdeal_mul_right`, `_neg` (hypothesis `Odd n`; the README states no gloss
  for it), `map_powerResidueSymbolIdeal` (`…/PowerResidueSymbol/Ideal.lean` 145, 203, 246);
  `powerResidueSymbol_pow_div`, `mk_powerResidueSymbol`, `powerResidueSymbol_mk_of_pow_eq_one`
  (`…/PowerResidueSymbol/Basic.lean` 129, 92, 119); `gaussSum_powerResidueSymbol_three_pow_three_eq`,
  `cubic_reciprocity_intCast` (`…/Cyclotomic/Three/CubicReciprocity.lean` 84, 273);
  `existsUnique_isPrimaryEisenstein_unit_mul`, `isPrimaryEisenstein_add_mul_iff`
  (`…/Three/Primary.lean` 170, 118); `sum_smul_rayClassCoeff` (`…/LFunctions/Hecke/Orthogonality.lean`
  68); `heckeLFunctionC_eventuallyEq_primitive` (`…/Hecke/Basic.lean` 138);
  `eulerCorrection_ne_zero`, `differentiable_eulerCorrection` (`…/Hecke/Primitive.lean` 287, 268);
  `eventuallyEq_of_meromorphic_of_eqOn_halfPlane`, `meromorphicContinuation`
  (`TauCeti/Analysis/Meromorphic/Continuation.lean` 40, 72); `toMultiplicativeIdealWeight`
  (`…/RayClass/Character/Weight.lean` 42). 23 names, all present. The Mathlib names were resolved in
  round 2 and no repair changed them.
- **Supplier citations resolved this round.** ClassicalArithmeticCompletion §§1.33, 1.34, 1.38,
  1.43, 1.52 on main (README lines 1235, 1271, 1362, 1445, 1717; the formula of §1.43 is the one the
  contract quotes and §8.1 uses); SieveMethodsAndPrimePatterns §2.9 `SieveApplications.leastNonresidue`
  (line 2457, value `0` outside odd primes); ZerosOfLFunctions §§1.3, 1.6, 3.4, 4.4, 4.5, 8.4–8.6
  (lines 760, 942, 1166, 1356, 1420, 2412, 2473, 2528); AnalyticNumberTheoryPartIII §8.2 (line 768);
  CharacterSumsOverFiniteFields §3.4 at its open head (the duplication formula, line 1157);
  MaassForms §§7.1, 7.3 at its open head (lines 1545, 1619). `roadmaps resolve` reports no
  cross-roadmap citation and no Lean name found nowhere (the lead on
  `SieveApplications.leastNonresidue` of the worker's list is a roadmap declaration, correctly cited
  by section).
- **Duplication by object.** Searched every roadmap, open and on main, for: the Kubota character,
  the cubic theta function, Hecke families and the Fisher–Friedberg characters, sextic reciprocity,
  the quadratic large sieve, convexity bounds, Borel–Carathéodory and three-circle control, zero-free
  half-planes, least nonresidues and least prime ideals. One second owner (R01). The others: the
  quadratic large sieve over `ℚ` is AnalyticNumberTheoryPartII §5.29, named in the scope section;
  AnalyticNumberTheoryPartI §2.31f bounds regularized Hecke values at `s = 1` only and is not §5.3;
  ExplicitZetaBounds' three-circle statements are for `ζ` with explicit constants and are not §5.3;
  ExplicitNumberFields §7.4 (open) is the least prime ideal in a Chebotarev class with explicit
  constants, not §11.2; ExplicitMultiplicativeFunctions (open) cites the `7/8` half-plane as a
  hypothesis and owns nothing here. No Fisher–Friedberg character, sextic symbol or cubic theta
  function occurs in any other roadmap.

Overlap check: read ZerosOfLFunctions, LFunctions, AnalyticNumberTheoryPartIII, ExplicitZetaBounds, AnalyticNumberTheoryPartI, AnalyticNumberTheoryPartII (main) and ExplicitNumberFields, CongruenceSpectralGap, CharacterSumsOverFiniteFields, EffectiveClassNumbers, AutomorphicLFunctionsAndLocalFactors, MaassForms, ExplicitMultiplicativeFunctions (open); shared: the convexity bound for Hecke records, owner ExplicitZetaBounds §3.2 (R01); the Gauss sum modulo an ideal, owner LFunctions Layer 5 (cited); the Fourier–Bessel expansion on `ℍ³`, MaassForms §7.3 for `PSL₂(ℤ[i])` and this roadmap for general `(Γ, χ)` (recorded in the scope section); nothing else shared.

- **Overlaps.** `scratch/overlaps.md` lists no other pull request changing this roadmap, no cited id
  that an open pull request drops, no id that only an open revision defines and no second copy.
- **Supplier order.** Gate output:

      candidate: QuasiRiemannHypothesis is not in the merge order yet; checked as if placed after BianchiModularForms (the intake inserts it when its design is accepted)
      depcheck: 261 roadmaps, 2605 edges, 0 problem(s)

  No UPWARD or CYCLE line; no excluded roadmap is cited. ExplicitZetaBounds (R01) is on main, so
  citing it adds no upward edge.
- **Shape.** Eleven layers named by their mathematics, each with Examples and Dependencies; every
  section has a `*Needs:*` line; every definition has at least three Checks; Unicode mathematics, no
  LaTeX delimiters; this roadmap's own names are in italics, so no backticked name claims a Lean
  declaration; a scan for process words, pull-request numbers, dates, anchors and machine paths found
  none.
- **Headline theorems** (for the package stage): the `11/12` half-plane (§10.7), the zero strip
  (§11.1), the conditional least-character bound (§11.2), `n(p) ≤ C (log p)^12` (§11.3), the
  continuation principle (§1.3), the transfer (§5.5). All are statable at the pins.
- **Arrangement.** Layers against the sections of `openai2026quasiRH`: 1 ↔ §2 and Lemma 11.1;
  2–4 ↔ parts of §§4.1–4.3; 5 ↔ §4.4 and Proposition 11.3; 6 ↔ Lemmas 6.1, 9.1 and three other
  papers; 7 ↔ §8; 8 ↔ none; 9 ↔ §5; 10 ↔ §§6, 7, 9.2, 10, 11. Not one to one and not in order.
- **Wording.** Beside the 15 sampled locators, compared: §1.4 with `openai2026quasiRH` lines
  3691–3710; §5.1 with lines 999–1008; §5.4's route with lines 3801–3810; §9.2's route and last
  bullet with lines 1149–1153 and 1168–1171 (same steps, at most 5 consecutive words shared); §6.2's
  definition with `goldmakherlouvel2013` lines 45–59 (a definition that can be written one way; the
  name of the notion is the source's); §6.3 with `bgl2014` lines 257–262. A mechanical search for
  runs of 8 or more consecutive words shared with 18 cached sources found, outside formulas, titles
  and names of notions, only the table of R05.

Source independence: 21 passages compared with 6 sources, one shared (the table of savings of `openai2026quasiRH` §11, 12 consecutive label words, R05), none elsewhere beyond 7 outside formulas; largest share `openai2026quasiRH`, 61 of 130 locators; contents compared with `openai2026quasiRH`: independent.

Research link: The headline is Theorem 3.1 of OpenAI (2026), with Liu (2026) as second account; Layers 6 and 8 are the large sieves of Goldmakher–Louvel (2013), Blomer–Goldmakher–Louvel (2014), Heath-Brown (2000) and the cubic theta function of Patterson (1977) used by Dunn–Radziwiłł (2024). Rests on the README and the sources read.

## Not verifiable

- The displays of `openai2026quasiRH` (7.6)–(7.12) (§10.3) and the definition of the separation
  norm in its §4.3 (§3.1): the cached text is an OCR of an image-only scan and drops them; the
  README's formulas were tested for internal consistency instead (table). The same holds for the
  conjugation bars of §4.6, which the computation forces.
- `patterson1977` Table III and `dunnradziwill2024` Appendix A, rows 1, 10, 19; `gaozhao2024`
  Lemma 2.9; `maynardpratt2024` Appendix C; `guthmaynard2026` §13.1; `heathbrown2000` Theorem 2;
  `baierbansal2018` Theorem 3; the `liu2026improved` locators: outside the sample, existence only.
- Whether the residual space of §8.5 has dimension greater than one for a given `Γ(N)` (R03): no
  source read decides it; the finding is that the sources do not support the bullet.
- Agreement of arXiv numbering with the published versions of `dunnradziwill2024`,
  `goldmakherlouvel2013`, `bgl2014`, `lamzourilisound2015`: no published text was read.
- Elaboration: no Lean file at the design stage; this lane does not elaborate.

## Source issues

- **Error** in goldmakherlouvel2013 at Remark 3 and Corollary 1.2, printed p. 2: the source says the `(n/d)`-th powers of any `n`-th order Hecke family form a `d`-th order family, and bounds the sieve for `χ^(n/2)`; it should be restricted to families whose powers still satisfy the primitivity axiom (a quadratic family read as fourth-order has trivial squares); affects a stated result.

## For the human reviewers

- Scope: the primary source `openai2026quasiRH` is an unrefereed, machine-written preprint;
  `liu2026improved` and `openai2026quasiRHalt` are unrefereed too. No refereed source states the
  headline (`sources.toml`, the first three entries).
- Licence: `openai2026quasiRH` and `openai2026quasiRHalt` are read from a public code repository
  recorded as `author-page`; the repository's licence was not read.
- Licence: `liu2026improved` reports public Lean formalisations of the argument; the package's
  `Suggested.lean` should be compared with them when it exists.
- Not tested: the cached text of `openai2026quasiRH` is an OCR of an image-only scan; displayed
  formulas and conjugation bars are missing from it, so wording and formulas were compared on prose
  and by computation only.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "7de8cf2f7d7867ecc8405ace0e82c2e250660d81", "job": "REV-DESIGN-QuasiRiemannHypothesis~3", "model": "fable", "worker": "chris-x29"} -->
