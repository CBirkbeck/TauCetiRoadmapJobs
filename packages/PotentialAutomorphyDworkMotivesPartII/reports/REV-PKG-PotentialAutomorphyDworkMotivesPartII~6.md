<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13001#issuecomment-6849591961 -->
Review (claude) of d0a1a3a

Verdict: needs_changes

1. **F01** (P2) §§7.8 and 7.10 do not say which exponent datum they are about

   **Location.** `packages/PotentialAutomorphyDworkMotivesPartII/README.md:1293` (§7.8): "Let `l ≡ 1 (mod N)`, so `ℚ(ζ_N)_λ = ℚ_l`, `v | l` and `t ∈ 𝔪_{F_v}`. Then `V_{λ,t}` is ordinary of weight `μ` with `μ_{σ,i} = M(a_σ)`"; and line 1321 (§7.10): "(2) If `v(t) < 0` … the monodromy operator `N` … has minimal polynomial `X^n`".

   **Claim.** Both statements are made for `V_λ` with no hypothesis on the datum; §2.3 defines `V_λ` for every Dwork exponent datum, and §7.2 defines `M(a)` by a formula valid for every vector. §7.8 also uses `λ` and `F` without introducing them. §7.4, by contrast, says "For a zero-shaped datum".

   **Witness.** The README's own non-zero-shaped Checks refute the unscoped reading.

   - §7.8: `N = 7`, `a = (0, 0, 0, 1, 3, 5, 5)` (rank 3, §7.2 Check), `l = 29 ≡ 1 (mod 7)`, `σ = id`. `M(1) = (1+1+1+2+4+6+6)/7 − 1 = 2`, so the statement predicts weights `{2, 3, 4}` (sum 9). The grades at the Fermat point are `21/7 − 1, 21/7 − 1, 28/7 − 1 = 2, 2, 3` (sum 7), and the labelled weights of `V_{λ,t}` equal them.
   - §7.10: `N = 5`, `a = (1, 2, 2, 0, 0)` (rank 2, §8.1 Check): two singleton blocks at infinity, so the monodromy operator is `0`, with minimal polynomial `X`, not `X²`.

   **Repair.**

   - §7.8, first sentence: "Let `a` be a zero-shaped datum, `F ⊇ ℚ(ζ_N)` a number field, `l ≡ 1 (mod N)` a prime, `λ | l` a prime of `O` (so `ℚ(ζ_N)_λ = ℚ_l`), `v | l` a place of `F` and `t ∈ 𝔪_{F_v}`."
   - §7.10(2): begin "For Qian's datum or the self-dual datum, if `v(t) < 0`, …" (the data for which §4.6 gives a single block).
   - Same pattern, same cure: begin §4.5 and §4.6 with "For Qian's datum (`n > 2`)", as §§4.2 and 4.4 already do.
   - Add to §7.8 the negative-control Check: the `N = 7` datum above has weights `{2, 2, 3}` against the formula's `{2, 3, 4}`.

   **Repair test.** With the clause added, the `N = 7` and `N = 5` data are outside the hypotheses. For the zero-shaped self-dual datum `N = 5`, `a = (1, 0, 0, 0, 4)`: `M(1) = (2+1+1+1+5)/5 − 1 = 1`, predicted `{1, 2}`, computed grades `10/5 − 1 = 1` and `15/5 − 1 = 2`.

2. **F02** (P3) The Tau Ceti contract says the pinned library lacks a geometric fibre functor; it has one

   **Location.** `packages/PotentialAutomorphyDworkMotivesPartII/README.md:73`: "The carrier itself has no geometric fibre functor and no monodromy action; those are the inputs taken from EtaleCohomologyFoundations §F.0.2." Line 85 repeats it: "the geometric fibre functor, `π₁` and the monodromy equivalence are that section's". Both sentences were added by the last repair.

   **Claim.** At the pin, Tau Ceti supplies only the category `TauCeti.FiniteEtaleScheme X`; fibre functor, `π₁` and the cover/`π₁`-set equivalence come from the supplier roadmap.

   **Witness.** Pinned Tau Ceti, `TauCeti/AlgebraicGeometry/FiniteEtale/Fiber.lean:122` (`FiniteEtaleScheme.fiber x`, the geometric fibre functor) and `FiniteEtale/Galois/Category.lean:106`, `:111`, `:122`: `FiberFunctor (fiber x)`, `GaloisCategory (FiniteEtaleScheme S)` for connected `S`, `nonempty_fiber_iso`.

   **Repair.**

   - Line 73, replace the last sentence by: "Tau Ceti also has the geometric fibre functor `TauCeti.FiniteEtaleScheme.fiber` (FiniteEtale/Fiber.lean), the instance `GaloisCategory (FiniteEtaleScheme S)` for connected `S` and `TauCeti.FiniteEtaleScheme.nonempty_fiber_iso` (FiniteEtale/Galois/Category.lean), so that finite étale covers are finite continuous sets under the automorphism group of a fibre functor; it has no lisse sheaves, and the identification of finite lisse `Λ`-modules with continuous finite `π₁`-modules is the input taken from EtaleCohomologyFoundations §F.0.2."
   - Line 85, replace "the geometric fibre functor, `π₁` and the monodromy equivalence are that section's" by "the lisse-monodromy equivalence and path transport are that section's".
   - `Suggested.lean`, module docstring, first not-statable bullet: "Mathlib has no …" → "neither library has …", ending "and no lisse sheaves on whose stalks the étale fundamental group (Tau Ceti has it for finite étale covers) could act".

   **Repair test.** The identity cover of `Spec ℚ` has fibre a one-point set under `fiber x`, with trivial action: present at the pin. A finite lisse `𝔽_ℓ`-module on `Spec ℚ` has no carrier in either library (no file of the pinned Tau Ceti or Mathlib defines lisse or constructible étale sheaves), so the geometric headlines stay not statable.

3. **F03** (P3) Two Beukers–Heckman locators point at the wrong item

   **Location.** `packages/PotentialAutomorphyDworkMotivesPartII/README.md:155` (§0.1, sampled): "Beukers–Heckman, Theorem 3.5." for the definition of a pseudo-reflection; line 191 (§0.3): "with Definition 2.9, p. 330, for their order of the triple".

   **Claim.** Theorem 3.5 defines reflections; Definition 2.9 fixes the order of the triple.

   **Witness.** BH89 line 237: Definition 2.9 (p. 330) defines a reflection as `g` with `g − Id` of rank one. BH89 lines 250–255: Definition 3.1 (p. 330), equation (3.2), fixes `h_∞ h_1 h_0 = Id`. Theorem 3.5 (line 287, pp. 331–332) is Levelt's theorem.

   **Repair.** §0.1: "Beukers–Heckman, Definition 2.9, p. 330". §0.3: "with Definition 3.1, equation (3.2), p. 330, for their order of the triple". In `sources.toml`, the `BH89` locator becomes "Definitions 2.9 and 3.1, Proposition 3.3, Theorem 3.5".

   **Repair test.** With (3.2) and Theorem 3.5's `h_∞ = A`, `h_0 = B⁻¹`, `h_1 = A⁻¹B`: `A·A⁻¹B·B⁻¹ = 1`, the order §0.3 translates from.

4. **F04** (P3) §0.10 says Qian cites Artin; the cited text cites Carter

   **Location.** `packages/PotentialAutomorphyDworkMotivesPartII/README.md:307`: "(Qian, Proposition 3.7 with proof, arXiv v1 p. 16, citing Artin, Theorem 2; …)".

   **Claim.** The proof of Proposition 3.7 in the cited version refers to Artin's Theorem 2.

   **Witness.** QIAN23 line 754 refers to the duplication relations in type `A_n` with "[Car72]" (Carter, *Simple groups of Lie type*, QIAN23 line 1322). The string "Artin" occurs in QIAN23 only inside other words; BLGHT11 and BCGNT25 do not cite the paper either.

   **Repair.** "(Artin, Theorem 2; Qian, Proposition 3.7 with proof, arXiv v1 p. 16, which takes the coincidences among the simple groups of type `A_n` from the classification; …)". In `sources.toml`, the `ARTIN55` `version_note` drops "in the restricted form applied in QIAN23 Proposition 3.7" for "the same-rank comparison used in QIAN23 Proposition 3.7, which itself refers to the classification".

   **Repair test.** The readable statement of the coincidences is BCGNT25 lines 2578–2584 (Lemma 5.2.3, p. 51, already cited in §0.10): `PSL₂(p^k) ≅ PSU₂(p^{2k})`, `PSL₂(4) ≅ PSL₂(5)`, `PSL₂(7) ≅ PSL₃(2)`; none has two distinct odd characteristics, e.g. `#PSL₂(11) = 660` against `#PSL₂(9) = 360`.

5. **F05** (P3) §2.1 states integral rank one without listing the torsion-freeness input

   **Location.** `packages/PotentialAutomorphyDworkMotivesPartII/README.md:491`–493 (§2.1, sampled): "the eigensummands are finite projective of rank one; they are free after completion at a prime or reduction modulo a nonzero ideal", with "*Needs:* §1.3; ComplexComparisonPartII …; EtaleCohomologyFoundations §§F.2.1, F.3, F.4.2, F.4.5; InverseGaloisAndArithmeticFundamentalGroups §IG.0.T3."

   **Claim.** The listed inputs give the integral and torsion eigensummands.

   **Witness.** A summand of `H^{N−2}(X, O_λ)` is projective only if that module is torsion-free, and `H^{N−2}(X, O/λ^k) = H^{N−2}(X, O_λ)/λ^k` needs `H^{N−1}` torsion-free. That is EtaleDualityAndPerverseSheaves §4.3(c), listed in §§2.2, 2.3 and 2.7 (§2.2's own Check: "Smooth proper base change alone does not exclude torsion") but not here.

   **Repair.** Add to the *Needs:* of §2.1 "EtaleDualityAndPerverseSheaves §4.3(c); §2.2 (Betti lattices)", and to the proof sketch: "The integral and torsion clauses use the torsion-freeness of `H^q(X_k̄, ℤ_ℓ)` in every degree (EtaleDualityAndPerverseSheaves §4.3(c); §2.2 for Betti coefficients): a direct summand of a finite free module over the local ring `O_λ` is free, of the rank of its rationalisation." §2.2 does not use §2.1, so no cycle arises.

   **Repair test.** Fermat cubic, `λ | 7`: `H¹ ≅ O_λ²`, `H² ≅ O_λ`, both torsion-free, so `H¹(X, O/λ) = (O/λ)²` and the two eigensummands have rank `1 + 1 = 2`. For an Enriques surface (`H²` with `ℤ/2`), the same deduction fails at `ℓ = 2`, which is why the input must be named.

Five findings: one P2 and four P3. None concerns `Suggested.lean`, which elaborates with `sorry` as its only warning; all five are small edits to `packages/PotentialAutomorphyDworkMotivesPartII/README.md` (R03 and R04 also touch one manifest field each). The dependency check passes. No finding re-raises a settled one.

## Verified sound

### Previous findings (round 5), checked first

| Finding | Repaired passage | Status |
|---|---|---|
| F01 (P2), ℓ invertible in `k` | §2.1: "the geometric `ℓ`-adic cohomology `H^{N−2}_ét(X_k̄, E)` … for a prime `ℓ` invertible in `k`"; new Check over `𝔽₂₅` | Repaired. Recomputed: `#X(𝔽₅) = 6` (enumerated), trace 0; over `𝔽₂₅` eigenvalues `±√−5`, squares `−5, −5`, `#X = 25 + 1 + 10 = 36`. |
| F02 (P1), existence of curves of both types | Contract line 129: "What EllipticCurves must provide (gap:ordinary-and-supersingular-curves-over-prime-fields)"; §9.7 *Needs* and lifting argument; §§9.11–9.12 cite it | Repaired. Same slug, supplier and section in `design/plan.json`. WATERHOUSE69 lines 619–629 (Theorem 4.1) with `q = p`: traces prime to `p` by (1), `0` by (5), `±p` for `p = 2, 3` by (4), so every `β` with `β² ≤ 4p` occurs. |
| F03 (P3), torsor used as a module | §9.5 Check: "the rank-two lisse sheaf `π_*𝔽₂` … whose fibre at `y′` is the free `𝔽₂`-module on the two square roots" | Repaired. Squares of `𝔽₅^×` are `{1, 4}`; invariants of dimension 2 at `y = 1`, 1 at `y′ = 2`. |
| F04 (P3), "Definition 3.6" | §§0.4, 4.7: "Qian, the paragraph preceding Lemma 3.6, arXiv v1 p. 15" | Repaired. QIAN23 lines 673–681 hold the argument; Lemma 3.6 starts at line 682. |
| F05 (P3), carrier ownership | Line 85: "on Tau Ceti's carrier `TauCeti.FiniteEtaleScheme`" | Repaired as asked; the sentence added with it is wrong about the pin (R02). |

Repaired patterns searched in the rest of the package: no other étale statement over a positive-characteristic base without ℓ invertible (§§2.2, 2.3, 3.1, 6.1, 6.8 invert it); no other torsor presented as a module; no other "Definition 3.6"; the remaining library "has/lacks" claims were rechecked at the pin (below).

### Principles, shape, residue

- Read the whole README (1686 lines): 84 numbered targets, 84 *Needs:* lines, 84 **Checks.** blocks (none with fewer than three bullets, counted mechanically), 10 `### Examples`, 10 `### Dependencies`.
- The layers run finite groups → pencil → eigensheaves → hypergeometric comparison → complex monodromy → residual monodromy → determinants → local properties → switching; each layer's Dependencies line forces the order, and no layer is named after a source's chapter.
- No copied passage, algorithm, sorry'd data, `set_option`, `lemma`, admitted example, pull-request number, date, machine path, LaTeX delimiter or HTML anchor (pattern scan of README and Lean file: no hit).
- Every Lean name is in the README, and every backticked name of this roadmap's own (`qianIndexSet`, `selfDualIndexSet`, `ZeroShapedDatum` with its three fields, `ZeroShapedDatum.indexSet`, `qianGauss`, the five theorems) is declared in `Suggested.lean`.

### Adversarial table (sampled targets, headlines, targets a finding touches)

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §0.1 pseudo-reflections | `g = 1 + v⊗φ`; `w(2)w(−1)` over `ℚ`; identity; `J₃` | `(g−1)² = φ(v)(g−1)`; `w(2) = [[0,2],[−1/2,0]]`, `w(−1) = [[0,−1],[1,0]]`, product `diag(2, 1/2)`; ranks 0 and 2 | Sound; locator R03 |
| §0.4 irreducibility | `h₀ = diag(1/2,1/3)`, `h∞ = diag(2,4)`; `h₁ = 1` | spectrum of `h₀⁻¹` is `{2,3}`, meets `{2,4}`; both axes invariant | Hypothesis on `h₀⁻¹` discriminates |
| §0.10 | `PSL₂(11)` vs `PSL₂(3^r)`; `PSL₂(9)` | 660 vs 12, 360, 9828; 360 < 660 | Sound; attribution R04 |
| §1.1 | `l = 3`, `N = 35`; `l = 2`, `N = 7`; sketch with `A`, `B` | order `lcm(4,6) = 12`, `3⁶ ≡ 29`; order 3; `j ≡ 2^{t−2} (mod 2^{t−1})` and `j ≡ 2^{t−1} (mod 2^t)` incompatible | Sound |
| §1.4 definitions (Lean) | `(N,n) = (401,3), (501,4), (7,2), (5,2), (7,4), (1101,9), (1201,10)` | `{1,2,398}`, `{1,2,3,495}`, `{3,4}`, `{2,3}`, `{2,3,4,5}` by `decide`; cardinalities 9 and 10; sums `(n−3)N/2`, `(n−4)N/2 ≡ 0` | Real bodies, right values |
| §2.1 Fermat cohomology | `N = 3` over `ℂ`, `𝔽₂₅`; `N = 5` | characters `111`, `222`: `1 + 1 = 2`, degrees 0, 1; `(4⁵ − 4)/5 = 204`; `ℓ = 5` over `𝔽₂₅` excluded | Statement sound; *Needs* R05 |
| §2.4 Poincaré duality | twist; weights | `H^{2N−4} = O(2−N)`; `2(N−2)` against `2N−2` for the printed `1−N`; `χ·χ′ ≠ 1` pairs to zero | Sound |
| §3.4 Katz comparison | ranks; `(1,2,2,0,0)`, `N = 5` | `n = n`; zero occurs twice, not `n + 1 = 3` | Sound |
| §3.5 | weights | `Ψc(Ψ) = ε^{2−N−(1−n)} = ε^{n+1−N}`, weight `2(N−n−1)`; `N=5,n=2`: `2 + 2·2 = 6 = n(N−2)` | Sound |
| §4.7, §5.6 | `N = 5`, `l = 3`, `𝔽₉` | `t` root of `X²+X+2`; orders of `A`, `B⁻¹`, `BA⁻¹` are 3, 5, 3; `#⟨B⁻¹, A⟩ = 720` (enumerated); products of two order-3 elements of `SL₂(𝔽₅)` have orders `{1,3,4,6,10}` (all 400 pairs) | Sound |
| §5.1 `qian_hypergeometric_group_eq_SL` | `N = 401`, `n = 3`, `l = 5, 3, 7, 11` | orders 25, 400, 200, 200; `3^{200} ≡ 7^{100} ≡ 11^{100} ≡ −1`; `∑B = 401`; proper subfield ⇒ `l^jB = B` ⇒ `l^j ≡ 1`; `Sp` ⇒ `B = −B`, but `−B = {400,399,3}` | Hypotheses exact |
| §5.2 `selfDual_hypergeometric_group_conj_Sp` | `N = 7`, `m = 2`; `N = n+1`; `l = 3` | `B = {2,3,4,5}`, sum 14; index set all nonzero residues, field drops to `𝔽_l`; `[𝔽₃(ζ₇):𝔽₃] = 6`, real subfield degree 3 | Sound; `m > 1` needed (rank two is §5.6) |
| §5.3 `qian_hypergeometric_group_conj_SU` | `σ` with `σζ = ζ⁻¹`, `N > 2` | `σ ≠ 1`, `σ²ζ = ζ` so order 2; `#SU₃(9) = 27·8·28 = 6048` | Sound |
| §5.4 `qian_two_prime_hypergeometric_group` | `l = 5`, `l′ = 3209` | `3209 = 8·401 + 1` prime, the least prime `≡ 1 (mod 401)`; `l₁ = l₂` gives the diagonal | Sound |
| §5.8 | `SU_m` inside the arithmetic image | multiplier `ε̄^{1−n}` and determinant trivial on `G_{F(ζ_l)}`; `[SU,SU] = SU` | Sound |
| §5.9 | `n = 3`, `l = 7` | `ε̄₇` of order 6 over `ℚ(ζ₄₀₁)`, `ε̄₇^{−3}` of order 2 | Descent, not triviality |
| §5.11 | `n = 3`, `l = 7` | `7³·48·342 = 5630688` | Sound |
| §6.2 `zeroShaped_gauss_product` | general; `N = 1`, `n = 0`; `a = 0`; `N=5,n=2` | `∏_j g(a_j+b) = g(b)^n ∏_{u≠0}g(u)/∏_{b′≠b}g(b−b′)`; exponent `n(N−1)/2 − n(n−1)/2 = n(N−n)/2`, an integer for odd `N`; `1 = 1`; `q·q² = q³` | True; `g(0)` never occurs; division avoidable since `q ≠ 0` in `R` |
| §6.7 | `N = 401`, `n = 3` | `(N−2n−1)/2 = 197`; `3209 ≡ 2 (mod 3)` | Sound |
| §7.2 Hodge grades | `N=5` self-dual; `N=7` non-zero-shaped; Qian `401` | sums `10, 10, 15` → grades `1, 1, 2`; `21, 21, 28` → `2, 2, 3`; `∑a = 79398 = 401·198` | Sound; agrees with QIAN23 Lemma 3.9 |
| §7.8 | zero-shaped `N=5`; `N=7` datum | `{1,2}` as predicted; `{2,2,3}` against `{2,3,4}` | R01 |
| §7.10 | `(1,2,2,0,0)`, `N=5`; `d ≥ 1` | monodromy operator `0`; `d·log T` keeps order `n` | R01 |
| §7.11 | `N=401`, `t=0` | `S` = places above 401; `Q_v(0) = ±q^{n(n−1)/2}` | Sound |
| §9.7 point counts | `p = 5, 7, 11, 13` | `x³−x`: 8, 8, 12, 8 points; `x³+1`: 12, 12 at 11, 13; `x³+x+1` at 11: 14; `x³+x+4` at 13: 14, `Δ ≡ 5` | Sound |
| §9.8 | `m = 3`, `q₁ = 7` | pair sums `2, 2, 2`; `(1,2,−3) ≡ (1,2,4)`, sum 0; `(m−1)(m+2)/2 = 5 < 7` | Sound |
| §9.10 `R_aux` | `m = 3` | kernel of `x ↦ x^{−2}` on `𝔽_p^×` is `{±1}`; image `G ⊋` multiplier kernel ∩ `SL` only through the determinant | Sound; source's `GU_m` corrected |
| §9.12 `S_UA` | `(n,m) = (2,3), (3,2), (1,2)` | exponent `[m²n(n−1) + nm(m−1)]/2 = nm(nm−1)/2`: 15, 15, 1; multiplier `−m(n−1) + 1 − m = 1 − nm`; sign `(−1)^{n−1}·(−1)` | Sound |
| Gap: curves over `𝔽_p` | `p = 2, 3, ≥ 5` | `|β| ≤ 2√p < p` for `p ≥ 5`; `β = ±2` at 2 and `±3` at 3 by condition (4) | Precise and minimal |

Remark (no change asked): by the list in BCGNT25 Lemma 5.2.3 the bound `max(l₁, l₂) > 10` is not needed to separate same-rank groups in distinct odd characteristics; it is the source's hypothesis and the proof sketch uses it.

### Seeded source sample

| Target | Text opened | Result |
|---|---|---|
| 0.1 | QIAN23 lines 600–603 (Lemma 3.3(3), p. 13), 628 (Lemma 3.4, p. 14); BH89 lines 237–239, 287–300 | Qian supported; BH locator R03 |
| 0.4 | BH89 lines 280–285 (Proposition 3.3, p. 331); QIAN23 lines 673–681 (p. 15); BLGHT11 lines 1185–1189 (p. 32) | Supported |
| 2.1 | DMOS82 lines 2142, 2176, 2312–2324 (Propositions 7.4, 7.6, 7.10, pp. 46–47, 50) | Supported; `ℓ ≠ p` and base change as stated |
| 2.4 | BLGHT11 lines 1018–1021 (p. 28); BCGNT25 line 2064 (p. 42), lines 2375–2377 (p. 47) | Supported; printed twist `1 − N` confirmed and corrected |
| 3.4 | BCGNT25 lines 2042–2054 (Theorem 4.2.1(3), p. 41); KATZ09 lines 493–513 (pp. 96–97) | Supported, at every place `λ` |
| 5.1 | QIAN23 lines 682–716 (Lemma 3.6, pp. 15–16) | Supported; perfectness replaces the source's composition-factor step |
| 5.2, 5.6 | BLGHT11 lines 1182–1244 (Lemma 4.6, Corollary 4.7, pp. 32–34); QIAN23 line 685 | Supported; rank-two exception handled here, not in the source |
| 5.8 | BCGNT25 lines 2388–2409 (Proposition 4.4.2, p. 47) | Supported |
| 5.9 | QIAN23 lines 719–725 (p. 16); BCGNT25 lines 2030–2032, 2066–2068 | Supported |
| 7.2 | QIAN23 lines 980–1008 (Lemma 3.9, pp. 19–20); BLGHT11 lines 1321–1347 (Lemma 5.2, p. 36) | Supported, same convention `⟨x⟩ ∈ {1,…,N}` |
| 7.8 | QIAN23 lines 414–423, 1016–1040; BLGHT11 lines 1358–1392 (pp. 37–38) | Supported for the sources' data; hypothesis R01 |
| 7.11 | BCGNT25 line 2074 onward (Proposition 4.2.5, p. 42) | Supported; BLGGT14 §5.1 through the supplier |
| 9.10 | BCGNT25 lines 3293–3317 (pp. 66–67), 3075 (Proposition 6.2.3(13), p. 62) | Supported with the image correction |
| 9.12 | BCGNT25 lines 3318–3338 (p. 67), 1977 (§4.1, p. 40) | Supported; rank-two branch is the roadmap's own |

Page offsets checked: BLGHT11 printed page = file page − 1 (printed "27" at line 1008); BH89 file page 8 carries "331"; KATZ09 file page 13 carries "97". No locator was flagged by the author as unverified. All 21 works of the References are in `sources.toml`; no source was fetched and the manifest was not changed.

### Lean file

- `lake env lean` on `packages/PotentialAutomorphyDworkMotivesPartII/Suggested.lean` from the content checkout: exit 0; warnings only `declaration uses 'sorry'` at lines 93, 112, 132, 151, 186. One `import Mathlib`, no Tau Ceti import, so nothing to build.
- One-tactic probe on a scratch copy, every sorried theorem with `simp`, `rfl`, `infer_instance`, `simp_all`, `aesop`, `exact?`: 29 of 30 fail (no progress, not reflexive, not a class, unsolved goals, no lemma found, or timeout). The 30th, `exact?` on the Gauss identity, only returned the sorried original from the same file. No padding.
- `#check @name` for all declarations and the three structure fields: types equal the README statements; no binder lost.
- Pinned names: 49 Mathlib declarations cited in the README resolve by `#check` (no unknown constant). Tau Ceti by file and line: `RationalCanonicalFormFinTwo.lean:69`, `SpecialLinearGroup/Transvection.lean:600`, `Perfect.lean:102`, `:116`, `Projectivization/PSL/Simple.lean:127`, `:142`, `AlgebraicGeometry/FiniteEtale/Basic.lean:66`.
- Headlines: the four residual hypergeometric groups and the Gauss product are stated. Katz comparison, complex and geometric residual monodromy, torsors, Hecke-character recognition, the local properties, compatible systems and the switching theorems are named in the docstring as not statable; neither pinned library has étale cohomology, constructible or lisse sheaves, Weil–Deligne representations or Moret-Bailly (file search of both).

### Suppliers, gaps, ownership

- Resolved at main or the open head: HypergeometricMotives §§3.1, 3.2, 3.4 with `levelt_rigidity_field`, `levelt_irreducible_field` (lines 962, 997, 1043–1046); ModularityAndLanglandsExtensions §§2.9–2.12, 2.14, 2.18 (942–1121); PotentialAutomorphyInfrastructure §2.20 (1045–1047); PotentialModularityAndCompatibleSystems §§1.1, 1.3, 1.4, 1.7, 1.9, 1.11, 2.14–2.18, 2.20 (96–856); ClassicalArithmeticCompletion §§2.46, 2.60 (3775, 4188); Chebotarev Layer 10 (410, 416); GlobalNumberFields Layers 9–10 (508, 531); EllipticCurves Layers 3–4 (683, 793); ModularCurves §5C (2252); ModularCurvesPartII §5.14 (1937); EtaleCohomologyFoundations §F.0.2 (200–215). The other supplier sections were taken from the round-5 ledger, whose rows give line numbers, and from `roadmaps resolve`, which reports no citation missing.
- Five gaps: each slug, supplier and section is the same in `design/plan.json` and the README; each names an earlier or main supplier and one interface. The elliptic-curve gap is not already supplied: EllipticCurves Layer 3 has no existence statement, and no roadmap earlier in the order states the curve-level fact as a target.
- Consumer: PotentialAutomorphyInfrastructurePartII (later in the order) cites §§1.1–1.4, 2.3–2.7, 4.6, 5.6, 5.10–5.12, 6.8, 7.4, 7.7–7.10, 9.4; all exist with that content.
- By object: CongruenceSpectralGap §4.2b builds one Kloosterman sheaf by `R^{k−1}mult_!`, not Katz's sheaves of type `(n, n)` nor a general convolution; HypergeometricMotives §5.0 builds motives from toric hypersurfaces. No `Suggested.lean` name of another roadmap is reused. `scratch/overlaps.md` lists no shared change, dropped id or second copy.

Overlap check: read PotentialAutomorphyInfrastructurePartII, ModularityAndLanglandsExtensions, PotentialAutomorphyInfrastructure, HypergeometricMotives, PotentialModularityAndCompatibleSystems, ClassicalArithmeticCompletion; Levelt's theorem and companion normal form — HypergeometricMotives and ClassicalArithmeticCompletion; the pointwise Dwork eigenrealization, semistable models, ordinarity criterion and paired self-dual sheaf with its trivialization scheme — ModularityAndLanglandsExtensions; Moret-Bailly and compatible families — PotentialModularityAndCompatibleSystems; the sheaves over the parameter line, monodromy, torsors for linear and unitary data and the switching points — this roadmap; nothing has two owners.

Dependency check (`gate --depcheck … --movable`), exit 0:

```text
depcheck: 206 roadmaps, 1914 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

Maintainer notes: none were left. No fetched or reviewed text tried to give instructions.

## Not verifiable

- ZS76 (main theorem), KATZ90 (Chapter 8, Theorems 8.4.11, 8.12.2), LEWIS82 (§4), ARTIN55 (Theorem 2), KM74 (Theorem 2), KIS99 (Theorem 5.1): settled as uncertified; cited by locator, not read.
- The second Downstream consumer, KloostermanSheavesAndBesselIsocrystals: it is in the merge order after this roadmap, but has no README on main, at an open head or in the board index, so its use of §§3.1–3.3 could not be read.
- The other three board packages live on other pull requests' branches and were not opened; none is cited here.

## Source issues

- **Misprint** in BCGNT25 at Lemma 4.2.4 and proof, arXiv v3 pp. 41–42: the source says the duality twist is 1 − N and the weight relation has exponent N − n; it should be twist 2 − N and exponent N − n − 1; affects a stated result.
- **Misprint** in BCGNT25 at §4.1, definition of the eigensheaf, arXiv v3 p. 40: the source says the eigensheaf is cut out of the direct image with no degree; it should be the higher direct image in degree N − 2; affects nothing.
- **Misprint** in BCGNT25 at proof of Lemma 4.4.4, arXiv v3 p. 48: the source says the eigenspaces lie in cohomological degree N − 1 of the Fermat fibre; it should be degree N − 2; affects nothing.
- **Error** in BCGNT25 at proof of Theorem 6.2.4, arXiv v3 p. 67: the source says the first auxiliary residual image is the whole unitary similitude group; it should be the subgroup with linked cyclotomic multiplier and determinant; affects the proof.
- **Gap** in QIAN23 at proof of Lemma 3.3(2), arXiv v1 pp. 13–14: the source says semistability of the pencil gives unipotence at infinity for the quotient family; it should treat the quotient monodromy, whose N-th power alone is controlled; affects the proof.
- **Misprint** in QIAN23 at the paragraph before Lemma 3.9, arXiv v1 p. 19: the source says the fixed complex embedding sends the root of unity to an n-th root; it should be the primitive N-th root; affects nothing.
- **Gap** in BLGHT11 at proof of Lemma 4.6, printed pp. 32–33: the source says the transvection classification leaves only the three classical families also in rank two; it should exclude the characteristic-three binary icosahedral subgroup separately; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "d0a1a3adc03f93060f806c73e00dbd395beb2864", "job": "REV-PKG-PotentialAutomorphyDworkMotivesPartII~6", "model": "fable", "worker": "chris-x31"} -->
