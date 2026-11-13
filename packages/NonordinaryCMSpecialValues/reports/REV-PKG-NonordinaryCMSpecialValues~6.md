<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13089#issuecomment-6849590098 -->
Review (claude) of e9514df

Verdict: needs_changes

1. **F01** (P3) Two deep inputs are named without their primary source

   **Location.** `packages/NonordinaryCMSpecialValues/README.md:379`, §2.5: "applying the height `h = 1` case of Kato's generalised explicit reciprocity law"; line 613, §4.2: "reformulating Yang's theta-lifting formula". `sources.toml` has no entry for either work.

   **Claim.** Each target is proved from the cited source.

   **Witness.** KATO04 line 5495 applies [KK3, Thm 4.3.1] without proof (bibliography, lines 6648–6649). FINIS06 line 529 quotes Yang's result from [Y, p.43, (2.19)] (line 1800).

   **Exact repair.** At line 379 add the locator "Kato, Generalized explicit reciprocity laws, Adv. Stud. Contemp. Math. 1 (1999), 57–126, Theorem 4.3.1 with `h = 1`"; at line 613 add "Yang, Theta liftings and Hecke L-functions, J. reine angew. Math. 485 (1997), (2.19), p.43". Add both to `## References`, and record both through the sources service (new keys, `cited_for` `2.5` and `4.2`; `uncertified` if only a paywalled copy resolves). No statement changes. Tested on the witness: after the repair both named results resolve to a manifest key with a locator.

2. **F02** (P3) The §6.2 Check names a support that no character has

   **Location.** `README.md:827`, §6.2 Check: "`K = Q(√−7)`, support `{5}`: the rational term omits multiples of `5`".

   **Claim.** Some `η = φρ` over `Q(√−7)` has rational conductor support `R = {5}`.

   **Witness.** By §0.1, `φ((n)) = κ_K(n) n` for `n` prime to `f`, so `κ_K`, of conductor `7`, is periodic modulo `f ∩ Z`: `7 ∈ R` always. The least support containing `5` is `{5, 7}`.

   **Exact repair.** Replace "support `{5}`" by "support `{5, 7}` (the ramified `7` always lies in the support and contributes the factor `1 − κ_K(7)/7 = 1`)". Tested: `2L(1, κ_K)(1 − κ_K(5)/5)(1 − 0/7) = 2L(1, κ_K)(1 + 1/5)`, the value already printed, so only the support changes.

3. **F03** (P3) The §3.2 Check uses a prime outside the roadmap's hypotheses

   **Location.** `README.md:491`, §3.2 Check: "`K = Q(√−7)`, `p = 5`, `l = 3` would divide `p² − 1 = 24`; the argument still applies".

   **Claim.** The instance illustrates disjointness when `l | p² − 1`.

   **Witness.** `−7 ≡ 2 mod 3` is a nonsquare, so `3` is inert in `Q(√−7)`; `L[r]` and `X_l` (§0.6) exist only for split `l ≥ 5`. For `p = 5` the only primes dividing `24` are `2, 3`: no admissible instance exists.

   **Exact repair.** Replace the bullet by: "`K = Q(√−7)`, `p = 47`, `l = 23`: `47` is inert (`(−7/47) = −1`), `23` splits (`−7 ≡ 4²`), `23 ∤ h_K = 1`, `47 ∤ 22`, and `23 | p − 1 = 46`, so `l | [F_n : H]`; the ramification argument applies although the degrees are not coprime." Tested: `(−1/47) = −1`, `(7/47) = −(47/7) = −(5/7) = 1`, so `(−7/47) = −1`; `46 = 2·23`.

4. **F04** (P3) The JIA24 manifest entry omits two sections that cite it

   **Location.** `packages/NonordinaryCMSpecialValues/sources.toml`, entry `JIA24`: `cited_for = ["0.1", "1.4", "3.4", "6.2", "6.3", "6.4"]`, locator "Theorem 1; Property 1; §2; §4, Proposition 5".

   **Claim.** The entry lists every section that cites the work.

   **Witness.** `README.md:154` (§0.2) cites "Jia, Introduction, p.1, JIA24 line 18"; `README.md:806` (§6.1) cites "Jia, §4, pp.18–20". Neither `0.2` nor `6.1` is in `cited_for`, and the locator has no Introduction.

   **Exact repair.** Set `cited_for = ["0.1", "0.2", "1.4", "3.4", "6.1", "6.2", "6.3", "6.4"]` and prefix the locator with "Introduction, p.1; ". Tested: a per-section scan of the README then matches the manifest for all eleven keys.

Four findings, all P3, none blocking. The three findings of round 5 are repaired on their witnesses, the Lean file elaborates with `sorry` as its only warning, and no mathematical statement was refuted this round. The verdict is `needs changes` only because a package is accepted with no repair outstanding, and each of the four below is a repair of a line or two.

## Previous findings, checked first

| Round-5 finding | Repaired passage in `packages/NonordinaryCMSpecialValues/README.md` | Status, with the witness recomputed |
| --- | --- | --- |
| F01 (P1), theta system with a zero initial value | §2.5, line 379: "The Kummer input is the tail `n ≥ m`"; "The levels `n < m` are never evaluated". §2.3, line 340: "`(_az_{p^n f})_{n ≥ n_f}`". | **Repaired.** `Q(i)`, `p = 7`, `f = (7)`, `f_0 = O_K`, `m = 1`: `α_0 = 7 ≡ 0`, so the old system contained `_aθ_E(0) = 0`; the tail starts at `α_1 = 1 mod 7Z[i]` (annihilator `(7)`), `α_2 = 1/7` (annihilator `(49)`), neither in `E[5]`; degrees `48/4 = 12`, `2352/4 = 588`, ratio `49`. |
| F02 (P2), local signs in the opposite additive character | §1.1, line 252: "In Rohrlich's normalisation of the additive character"; "AL.1's standard character is Rohrlich's composed with `x ↦ −x` at every place". | **Repaired.** `D = 7`: Rohrlich `(−i, i)`, AL.1 `(i, −i)`, both products `1 = (2/7)`; mixed `(i, i)` gives `−1`. General `D` with `t` primes `≡ 3 mod 4` (`t` odd): Rohrlich `i^{t−1}(−1)^{t(t−1)/2}(2/D) = (2/D)`, AL.1 `i(−i)^t(−1)^{t(t−1)/2}(2/D) = (2/D)`. |
| F03 (P3), inverse quadratic character | §0.1, line 146: "Omitting the quadratic character gives the wrong value `φ((7)) = 7`". | **Repaired.** Kept `−1·7 = −7`; omitted `1·7 = 7`; inverted `(−1)⁻¹·7 = −7`. |

Pattern searches on the repaired text: no other system is evaluated at a level without a canonical pair (§§2.2, 2.3, 2.5, 2.6, 2.7 all use tails or corestriction); no other passage states a local factor in a fixed additive character (§§1.2–1.4 use only `ψ`-independent quantities: the pairing `ν_λ(−1) = 1`, unramified twists, Fröhlich–Queyrut with `χ` trivial on `Q_p×`); no other passage inverts a quadratic character.

The earlier finding F10 (ModularIwasawaMainConjecturesPartII restating §§2.1–2.6) stays settled as not actionable in this package: this roadmap is the earlier owner (merge order 345 against 378). It is not re-raised.

Maintainer notes for this review: none were left.

## Verified sound

### Coverage

Read the whole README (43 numbered targets in seven layers, conventions, supplier contracts, references), `Suggested.lean` (10 declarations and one local instance), `metadata.toml` and the 11-entry manifest, after the round-5 review and its repair report. The repair touched §§0.1, 1.1, 2.2, 2.3, 2.5, 2.6, 2.7 and one manifest locator; those passages were re-derived in full. For untouched text the round-5 table was relied on only where its rows carry values; the fifteen sampled targets were reviewed in full regardless.

Principles: no route-specific shortcut (§§2.1–2.6 keep every prime, split, inert, ramified, `2` and `3`; the BKO restrictions are confined to §§2.7–2.10 and Layers 3 and 5), no re-planned roadmap, no copied passage, no algorithm, no sorry'd data, no `set_option`. The layers are named by their mathematics and the order is forced by the dependency lines (Layer 4 is independent of 1–3; Layer 6 needs only 0–1). The sentence at line 535 ("following Finis, the *tower prime* …") fixes the roles of two primes and says nothing about the plan's order; no finding. A scan for LaTeX delimiters, pull-request numbers, round labels, dates, machine paths, HTML anchors and `lemma` found none. Every layer ends with Examples and Dependencies; there are 49 `**Checks.**` blocks, each definition with at least three.

### Seeded source sample (15 of 15 read at the locator)

| Target | Text opened | Result |
| --- | --- | --- |
| 0.2 | JIA24 lines 17–27, p.1 | Anticyclotomic extensions, ring-class union and `Gal(L/K) ≅ finite × ∏ Z_p` as cited. Conductor rule recomputed: `#Pic(O_{p^c})` has `p`-part `p^{c−1}`, so order `p^n` first occurs at `c = n + 1`; `c = 1` never occurs (`p + 1` prime to `p`). Manifest: R04. |
| 0.6 | BKO21 lines 388–395, 435–438, 507, pp.951–954 | `l ≥ 5` split, prime to `h_K f`, `p ∤ (l − 1)`; one letter `m` for order, layer and conductor in print, as the README says. `l`-part of the depth-`m` quotient is `l^{m−1}`. |
| 1.1 | ROHRLICH-NOTES lines 666–679 (pp.14–15), 1614–1728 (pp.34–36), 1840–1846 (p.38) | Proposition 1.5, (2.41), (2.44)–(2.49), (2.56)–(2.57) as cited; the factor at `q` is (2.48) with letters renamed. |
| 1.4 | JIA24 lines 42–63, p.2; BKO21 lines 475–488, p.953 | `L(s, χ) = L(s, χ̄)`, `Λ(s) = W Λ(2 − s)`, `W = ±1`; Proposition 3.3(3) and its proof. |
| 2.6 | KATO04 lines 5463–5475, 5478–5536, pp.258–259 | Statement, reduction to `K(g)`, `β`, `ξ`, `α_n`, `ν_n`, the system indexed by `n ≥ 1` (lines 5491, 5523), (15.9.1)–(15.9.2). The README's sign corrections are explicit and consistent with (15.5.1). |
| 2.8 | BKO21 lines 414–432, pp.951–952 | (3.4) with `γ = per_φ(ω)/Ω`, `L_{pg}` over ideals prime to `pg`. |
| 2.9 | BKO21 lines 433–435, p.952 | (3.5) as a statement of `R[[Gal(K(gp^∞)/K)]]`-modules; the general character twist is the declared gap. |
| 3.2 | BKO21 line 461, p.953 | `M_{n,m} = H(E[p^{n+1}]) ⊗_K L_m` "as `l ∤ h_K`". Route recomputed: the intersection lies in `L[r]`, is unramified above `l` (good reduction, `l ≠ p`) and away from `l`, so lies in `H`; `l`-power degree dividing `h_K` is `1`. Check: R03. |
| 3.4 | RUBIN87 lines 191–205, p.409 | Lemma 3.1 `φ((p)) = −p`, complete splitting in `H/K`, Lubin–Tate parameter `−p`. |
| 4.4 | FINIS06 lines 1571–1592, p.803 | Lemma 4.5 and its use of Boxall's Theorem 1 as stated. Boxall's own text is waived. |
| 4.6 | FINIS06 lines 101–122, p.769; 1134–1148, p.794 | Theorem 1.1 at `k = 1`, both cases, the inequality for all `λ`, the `Q(√−3)`, `ℓ = 3` exception. |
| 5.5 | BKO21 lines 501–513, p.954 | (3.9) for all but finitely many `ν`; distinct orders give arbitrarily large conductor. |
| 5.7 | BKO21 lines 503–507; Mathlib `Subalgebra.linearDisjoint_iff_injective` | A deduction, presented as one: `U/Φ` unramified is Galois, `Φ_n ∩ U = Φ`, hence linear disjointness. |
| 6.1 | ROHRLICH84 lines 763–800 (pp.401–402), 896–900 (p.404) | Definition of `M(q, t)`, Proposition 1, (67)–(68) with the example `d = 11/20`, `s = 7/16`. |
| 6.2 | JIA24 lines 212–218, 256–347 (pp.5–8), 486 (p.10), 596, 799, 880–936 | (2.13)–(2.29), Propositions 1–2, Main Lemma 2, Lemma 3, Proposition 5 on the cited pages. Check: R02. |

No locator is flagged as unverified by the author.

### Adversarial table (values computed this round)

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| §0.1 Check (repaired) | `Q(i)`, `7`; `y² = x³ − x` at norm 5 | `−7 − 1 = (2 + 2i)(−2 + 2i)`, so `φ((7)) = −7`; `−1 + 2i − 1 = i(2 + 2i)`, `a_5 = −2`, `#E(F_5) = 8` | Correct |
| §0.2 conductor formula | `Q(√−7)`, `p = 5`; `Q(√−31)`, `p = 3` | `#Pic(O_5) = 6`; order 5 at `c = 2`, 25 at `c = 3`; `h = 3`, unramified order-3 character has `c = 0 ≠ 2` | Correct |
| §0.2 every `c ≥ 2` occurs | kernel of `Pic(O_{p^c}) → Pic(O_{p^{c−1}})` | order `p`; a character trivial on `1 + p^{c−1}O_Φ` and `Z_p×` factors through level `c − 1` | Exact conductor `p^c` |
| §0.6 | `l = 23`, `r = 1, 2` | degrees 23, 529; conductors `23²`, `23³` | Order and conductor indices distinct |
| §1.1 (repaired) | `D = 7, 11, 15`; general `t` | Rohrlich: `(−i)(i) = 1`; `(−i)(−i) = −1`; `(−i)(i)(1) = 1`. AL.1: `(i)(−i)`; `(i)(i) = −1`; `(i)(−i)(1)`. `∏_{q | D}(−1/q) = (−1/D) = −1 = φ_∞(−1)` | Both equal `(2/D)` |
| §1.1 against the supplier | AL.1.3.5 (iv), `(a, b) = (1, 0)`; its `ℚ₃` Check | `i^{max(1,0)} = i`; the supplier's finite character is the negative one, Rohrlich's the positive | Transport by `φ_v(−1)` at every place is right |
| §1.2–1.3 | split `l`, inert `p` | `(φ((l))/l)^a = κ_K(l)^a = 1`; unramified twist of `χ_p` contributes `(−1)^c`; `χ_p(Δ) = 1` (odd order, `Δ² ∈ Q_p×`) | Correct |
| §1.4 | `c = 2, 3`, `ε = 1` | signs `+1`, `−1`; `Λ(1) = −Λ(1)` | Zero forced only for odd `c` |
| §2.2 norm relation | levels `n ≥ 1` against `n = 0` | for `n ≥ 1` every `x ≡ 1 mod p^n f` is prime to `p`, the `p²` conjugates are `1 + p^n f/p^{n+1}f`; at `n = 0` an Euler factor appears | Level restriction needed and stated |
| §2.3 (repaired) | `Q(i)`, `f = O_K`, `p = 7, 2` | `n_f = 1`; `n_f = 2` (`2, 2i, ±1 ± i ∉ 4Z[i]`), `[K(4) : K] = 8/4 = 2`, `K(2) = K` | Correct |
| §2.3 membership in `O[1/p]×` | `p^n f` with one or several primes | one prime with `n ≥ 1` lies above `p`; two or more give a unit | Correct |
| §2.5 (repaired) | `g = (56)`; `g = (7)` | `ξ_1 = 8`, `α_1 = 1`, `ν_1 = 7`, `8 − 7 = 1`, `8 + 7 = 15`; annihilator of `α_n` is `p^n f_0` | Correct |
| §2.5 rationality of `α_n` | `σ` fixing `K(p^n f_0)` | `σα_n = εα_n`, `ε` a unit fixing `α_m`; units inject modulo `g`, so `ε = 1` | `α_n ∈ E(K(p^n f_0))` |
| §2.5 cofinality | `p^k f_0 ⊂ f` | `p^n f ⊂ p^n f_0`, `p^{n+k} f_0 ⊂ p^n f` | `K(p^n f_0) ⊂ K(p^n f) ⊂ K(p^{n+k} f_0)` |
| §2.6 sign of the unit | `Q(i)`, `f = (3)`, `a = (5)`, `χ = 1` | `24 · ζ_K(0) · log 9 = −12 log 3`; a theta value at a prime-power torsion point has positive valuation, so the unit is its inverse | Consistent with (15.5.1) |
| §2.7 smoothing | `α ≡ 2 mod p`, `α ≡ 1 mod f` | `α(ᾱ − 1) ≡ 2`; `α ≡ 1 mod p` gives `0` | Unit exactly as stated |
| §2.8–2.9 | `χ = 1`; scalar `a` on `T` | `1 − φ̄((p))/p² = 1 + 1/p`; diagonal action `gx ⊗ a⁻¹t∨` | Correct |
| §3.4–3.5 | `p = 5` | Frobenius `[−5]`, trace `−10`, `#E(F_25) = 36 = (5 + 1)²`; `s = −1` in the Lubin–Tate supplier; degrees 24, 600 | Correct |
| §4.4 | point; `E` in `E¹` | trivial stabiliser; whole curve | Translate of stabiliser in both |
| §4.6 / §5.4 | `D = 7`, `ℓ = 5`, `λ` unramified at inert primes | `Σ μ = 0`, `b_5 = 0`, `v_5(7^{1/4}) = 0` | Unit statement follows |
| §5.7 | `F = Φ_0`, `U = Φ(ζ_23)`; `U = F` | field of degree `24 [U : Φ]`; `a ⊗ 1 − 1 ⊗ a ≠ 0` maps to `0` | Injective exactly when stated |
| §6.1 `rohrlichCount_eq_zero` | `P = ∅`; `c = 0`, `P = {5}`, `α = 5`, `β = 0`; `c < 0` | only `q = 1` supported, vacuous above `Q = 2`; counts 6 at `q = 5`, 0 at `q = 25`; box `{(0, 0)}` excluded | "Sufficiently large" needed and present |
| §6.1 `rohrlichCount_lt` | `d = 11/20`, `s = 7/16` | `5d/2 − 1 = 3/8 < 7/16 < 1/2` | Admissible |
| §6.2 limit | `Q(√−7)`, `R = {5, 7}` | `2L(1, κ)(1 + 1/5)(1 − 0)` | Value right; support named wrongly: R02 |
| §6.5 `centralValue_parity_dichotomy` | orders 1, 5, 25, 125; wrong `ε`; `p = 2`, `3` | `c = 0, 2, 3, 4`, signs `+ + − +`; wrong `ε` puts infinitely many zeros in the finite set; `p = 2` excluded, `p = 3` allowed | `ε` determined; hypotheses exact |
| Lean conventions | `idealCharacter_apply_prime`, `idealCharacter_apply_toPrincipalIdeal` at the pin | value at a prime is the local component at a uniformizer; value at `(x)` is the inverse of the archimedean components | `IsEquivariantTypeOneZero` and `eulerFactor` match the README |

Zero rings, positive characteristic and non-abelian groups do not meet the number-field and character-group hypotheses of any statement here.

### Lean acceptance test and padding

`lake env lean` on `packages/NonordinaryCMSpecialValues/Suggested.lean`, run from the content checkout, exits 0; the only output is "declaration uses `sorry`" at lines 130, 140 and 166. Both `TauCeti.*` object files were present.

`#check @name` for all ten declarations, on a scratch copy: the six definitions keep `[Field K] [NumberField K]` (and `[IsCMField K]` where used); the two Rohrlich theorems keep algebraicity, the nonzero direction and the exponent ranges; the parity theorem keeps `IsCMField`, `IsQuadraticExtension ℚ K`, `Fact p.Prime`, `p ≠ 2`, `v = (p)`, equivariance, both unramifiedness hypotheses, odd finite order, anticyclotomy and the uniformizer hypothesis. Nothing lost, nothing changed.

One-tactic probe on all three sorried theorems with `simp`, `rfl`, `infer_instance`, `exact?` and `aesop`: fifteen attempts, none closes. None restates a definition, mirrors a Check or treats a boundary case. No padding.

| README headline | Treatment |
| --- | --- |
| §6.5 parity dichotomy with the §1.4 zeros | `centralValue_parity_dichotomy` |
| §6.1 Rohrlich's two bounds | `rohrlichCount_eq_zero`, `rohrlichCount_lt` |
| §4.6 Finis; §§5.4–5.5 unit theorem and witness | docstring: CM period, algebraic avatar, local invariants missing |
| §§2.6–2.8 Kato reciprocity, integral class | docstring: coefficient cohomology, dual exponential, period map missing |
| Layer 3 | docstring: CM attachment, torsion fields, Lubin–Tate modules missing |
| §§1.1–1.3 root numbers | docstring: root-number carrier missing |
| §6.2 Galois average | docstring: `Aut(ℂ/K)` action on Hecke characters missing |

Imports: `import Mathlib` and the two Hecke-character modules used. All ten Lean names occur in the README, and every backticked name the README attributes to this roadmap is declared. The local instance `factPrime` duplicates nothing global: Mathlib itself uses a local instance of the same shape at `Mathlib/NumberTheory/Padics/HeightOneSpectrum.lean:57`.

### Pinned declarations opened

Mathlib: `MonoidAlgebra.lift_single` (`Mathlib/Algebra/MonoidAlgebra/Basic.lean:250`, `b • F a`, no inversion); `Subalgebra.linearDisjoint_iff_injective` (`Mathlib/RingTheory/LinearDisjoint.lean:233`); `DirichletCharacter.LFunction_apply_one_ne_zero` (`Mathlib/NumberTheory/LSeries/Nonvanishing.lean:412`, needs `χ ≠ 1`); `NumberField.IsCMField` and `complexConj` (`Mathlib/NumberTheory/NumberField/CMField.lean:70, 142`).

Tau Ceti: `HeckeCharacter`, `IsFiniteOrder` (`…/HeckeCharacter/Basic.lean:70, 80`); `finiteComponent`, `conductorExponent`, `finiteConductor`, `finiteConductor_ne_bot` (`…/HeckeCharacter/FiniteComponent.lean:85, 181, 254, 270`); `idealCharacter`, `idealCharacter_apply_prime`, `idealCharacter_apply_toPrincipalIdeal` (`…/HeckeCharacter/Ideal.lean:120, 155, 200`); `Modulus`, `IsCongrOne`, `idealsPrimeTo` (`…/RayClass/Modulus.lean:98, 316, 498`); `IsCongrOne.toPrincipalIdeal_mem_idealsPrimeTo` (`…/RayClass/Basic.lean:87`); `ringClassField`, `isUnramifiedAt_ringClassField`, `ringClassArtinEquiv`, `isArithFrobAt_ringClassArtinEquiv_picClass`, `finrank_ringClassField`, `ncard_primesOver_ringClassField_eq_finrank_iff` (`TauCeti/NumberTheory/ClassFieldTheory/ClassFields/RingClass/Field.lean:111, 155, 178, 214, 222, 251`). The elided prefix is `TauCeti/NumberTheory/NumberField/Global`.

### Duplication and ownership

No open head or roadmap on main defines `IsAnticyclotomic`, `conductorModulus`, `eulerFactor`, `HasCentralValue`, `rohrlichCount`, `IsPAnticyclotomic` or `IsEquivariantTypeOneZero` in a Lean file. Object searches for Finis's theorem, the ideal-indexed theta function, canonical CM pairs, Proposition 15.9, Rohrlich's count and Fröhlich–Queyrut found no second owner among the open heads or on main. ArtinRepresentations mentions Fröhlich–Queyrut for orthogonal Artin root numbers, a different statement from the local quadratic-extension form of the declared gap.

The overlap file lists no conflicting head, no dropped id and no revision-only citation. AnticyclotomicLocalUnits, a later roadmap, cites this one by `NCM.0–NCM.5` labels that this README does not use; that is for the consumer to align with §§0–6 here.

Overlap check: read KatoEulerSystems, AnticyclotomicLocalUnits, ComplexMultiplicationAndExplicitReciprocity; nothing shared (KatoEulerSystems owns modular-curve zeta classes and imports `_cθ_E` from PadicFamilies §4.0.1 as this roadmap does; AnticyclotomicLocalUnits owns the local projections and its local conductor-parity convention and defers root numbers and the unit theorem here; ComplexMultiplicationAndExplicitReciprocity owns canonical characters, periods and the torsion dictionary, all imported here).

### Suppliers, gaps and merge order

Every supplier citation was resolved against the supplier's current text. For open heads and main the line numbers are those printed by `roadmaps show`, which adds one header line to the file.

| Supplier | Resolved at |
| --- | --- |
| ComplexMultiplicationAndExplicitReciprocity (open head) | §§1.2, 2.2, 3.2, 4.1, 4.2, 4.3 at lines 355, 446, 584, 635, 667, 685; the nine named items at lines 373, 454, 596, 639, 643, 647, 671, 675, 689–704 |
| AutomorphicLFunctionsAndLocalFactors (open head) | AL.1.1.1, 1.3.1, 1.3.4, 1.3.5 at lines 652, 901, 974, 1005; AL.1.5.2, 1.6.2 forwarded at lines 26, 28; AL.5.1.1, 5.3.2 at lines 2380, 2449 |
| ArithmeticGaloisRepresentations (open head) | Root-number product formula, line 2399 |
| SelmerIwasawaCohomology (open head) | §§0.8–0.11 at lines 223–265; §§3.6, 3.7 at lines 1469, 1493 (§3.7 is cyclotomic only, as the gap says) |
| PadicHodgeRegulators (open head) | §§1.4, 1.7, 1.11 at lines 524, 573, 647 |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory (open head) | §R07.1.8, 1.9, 1.12, 1.13, 1.14 at lines 989, 1028, 1161, 1221, 1248 |
| PadicFamilies; NoncommutativeAndEquivariantIwasawa (open heads) | §4.0.1 at line 2365; §4.3 at line 2017, its elliptic-unit construction at line 2064 |
| ModularSymbolsPadicLFunctions; GL2AutomorphicRepresentationsAndTransfer; NeronModelsAndSemistableAbelianVarieties (open heads) | §§1.2, 4.3 at lines 1381, 2521; R17.4.16 at line 2693; §5.1 at line 3110 |
| DiophantineApproximationAndTranscendence (main) | §§2.1, 2.3 at lines 860, 942 |
| LubinTateFormalModulesAndQuasiCanonicalLifts (board package, order 344) | `packages/LubinTateFormalModulesAndQuasiCanonicalLifts/README.md:605, 635, 657, 688, 1066, 1101`; sign `a_{p²} = 2sp` matches `s = −1` here |

The one lead of the citation resolver (no roadmap LubinTateFormalModulesAndQuasiCanonicalLifts on main or in an open pull request) is a false positive: the roadmap is a board package immediately before this one in the merge order.

Gaps: `al-local-frohlich-queyrut` and `sic-character-twist` carry the same slug in the README (lines 77, 102) and in `design/plan.json`; each names its supplier and section, states its hypotheses, and asks for nothing the supplier's current text provides. Not findings.

Dependency check, as prescribed with `--movable`:

```text
depcheck: 206 roadmaps, 1906 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. No forbidden supplier is cited.

## Not verifiable

- BOXALL92, Theorem 1: waived; only Finis's application (FINIS06 lines 1585–1592) was read.
- Kato 1999 and Yang 1997 (R01): not in the manifest and not read; the locators in R01 are those the secondary sources give (KATO04 line 5495, FINIS06 line 529).
- JIA24: only arXiv v1 was read, as the manifest records; nothing is claimed about the published numbering.
- Several KATO04 displays (lines 5274, 5517–5527) are garbled in the extraction; the standard-unit definition and the final formula were checked through the surrounding prose and (15.5.1), not character by character.
- LubinTateFormalModulesAndQuasiCanonicalLifts, InertAnticyclotomicCMMainConjecture and ModularIwasawaMainConjecturesPartII are board packages with no entry in the board index; they were read in this checkout only.
- Elaboration and numerical instances do not prove the admitted theorems.

## Source issues

- **Error** in KATO04 at (15.4.2), printed p.252: the source says the norm along any CM isogeny carries the theta function to the theta function; it should require the kernel to meet the `a`-torsion trivially; affects a stated result.
- **Misprint** in KATO04 at the proof of Proposition 15.9, printed p.258: the source translates by plus the difference point while claiming evaluation at the torsion point; it should translate by minus that point; affects the proof.
- **Misprint** in BKO21 at §3.0.2, printed pp.952–954: the source uses one exponent for the order, the field layer and the conductor of an auxiliary character; it should give conductor exponent one more than the order exponent; affects a stated result.
- **Misprint** in JIA24 at the line before (2.1), p.4: the source gives the rational-principal value with the inverse of the integer; it should be the quadratic character times the integer; affects nothing.
- **Gap** in JIA24 at (2.10) and (2.25), pp.5–7: the source sums the rational term over all integers and takes the full quadratic value as limit; it should sum over integers prime to the conductor, giving the value with those Euler factors removed; affects the proof.
- **Misprint** in JIA24 at (2.43), p.10: the source prints a growing exponential in the tail bound; it should be the decaying exponential of (2.29); affects the proof.
- **Misprint** in JIA24 at §4, condition (1), p.18, and (4.9), p.20: the source prints the congruence modulo the full ring and the box bound as the inverse of the modulus; it should be divisibility by the modulus and the box bound as its `c`-th power; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "e9514df768be7996eadcfcf186a637d3e532bcbd", "job": "REV-PKG-NonordinaryCMSpecialValues~6", "model": "fable", "worker": "chris-x18"} -->
