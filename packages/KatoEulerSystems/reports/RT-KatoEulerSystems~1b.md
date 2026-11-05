<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/163#issuecomment-6416862018 -->
Red team round 1 pass b (claude) of 0ff66a0

Verdict: accepted

1. **F01** (P3) The adapter's conductor domain excludes the fields its consumers evaluate it on

   **Location.** `packages/KatoEulerSystems/README.md` lines 715–720 ("The conductor domain consists of the `m ≥ 1` with `prime(m) ∩ Σ = {p}`. Define katoEulerAdapter as the member of the module of Euler systems … whose class at `ℚ(ζ_m)` is …"), the Extensionality bullet at lines 746–747, and the Check at lines 766–767 ("At `m = 1` the component is the f-projection of the class at `ℚ` itself, with no Euler factor").

   **Claim.** The domain is Kato's set `S` (Kato2004 line 4182: `prime(m) ∩ Σ = {p}`, so `p | m`; Example 13.2 at line 4198 says so explicitly). The supplier's carrier is indexed by every finite subextension `F` of the abelian tower (`EulerSystemsAndKolyvaginSystems` §2.2 at its head: "a family `c = (c_F)_F` … for all `K ⊂_f F ⊂_f F′ ⊆ 𝒦`", with `EulerSystem.ext` quantified over all `F`), and the package itself uses components outside `S`: `c_(ℚ(ζ_(p^n)))` at `n = 0` (line 1365), `c_ℚ` and `c_(ℚ_n)` for the `ℤ_p`-layers (lines 2058–2059, 2191, 2224). The Check at `m = 1` asserts a component at an index the definition does not cover, and the Extensionality bullet credits §2.2 with a statement (equality on `S` suffices) that §2.2 makes only for all `F`.

   **Witness.** `m = 1`: `prime(1) ∩ Σ = ∅ ≠ {p}`, so `1 ∉ S`; `ℚ_1 ⊂ ℚ(ζ_(p²))` has conductor `p²` and is not of the form `ℚ(ζ_m)`. The components on `S` do determine the member: for `F` of conductor `m`, `F ⊂ ℚ(ζ_m) ⊂ ℚ(ζ_(mp))`, and both corestrictions carry no Euler factor because `p ∈ Σ ⊂ N` and `ℚ(ζ_m)/F` ramifies at no new prime (§2.2 there, "`Σ(F′/F) = ∅`"). So the definition is consistent but incomplete, and the Check contradicts the stated domain.

   **Exact repair.** After "The conductor domain consists of the `m ≥ 1` with `prime(m) ∩ Σ = {p}`." add: "This is Kato's index set; the member of the module of §2.2 is indexed by every finite `F` in the tower, and its component at an `F` of conductor `m` prime to `p`, including `F = ℚ`, `ℚ(ζ_m)` and the layers `ℚ_n` of 4.3, 6.6 and 7.3–7.4, is the corestriction of the class at `ℚ(ζ_(mp))`; no Euler factor appears because `p ∈ Σ`." Replace the Extensionality bullet by: "two members of the module of Euler systems with equal classes at every `ℚ(ζ_m)`, `m` in the conductor domain, are equal, since every other component is a corestriction of one of these and §2.2 there gives extensionality over all `F`." Replace the Check by: "At `F = ℚ`, outside the conductor domain, the component is the corestriction of the class at `ℚ(ζ_p)`, equal by `modularZeta_trace` to the f-projection of the class at `ℚ` itself, with no Euler factor; a rule that multiplies every component by its Euler factors would change it."

2. **F02** (P3) 6.4 applies uniqueness in a space that is not defined and that need not contain the regulator

   **Location.** `packages/KatoEulerSystems/README.md` line 1980 ("then apply uniqueness in `ℋ_(v_p(α),L)` (§2.5 there; the slope bound is essential)").

   **Claim.** Kato's `ℋ_(h,L)` is defined for integers `h ≥ 1` by `|c_(n,σ)|_p n^(−h) → 0` (Kato2004 lines 5871–5876), and 6.1 (line 1842–1843, following Kato 16.4 at lines 5954–5956) places `ℒ_η` in `ℋ_(h,L)` only for `h` strictly above the slope. The two sides of 6.4 are compared in `ℋ_(k−1,L)`: Kato's `L_(p-adic)` lies there by Theorem 16.2 (line 5907) and the regulator by 6.1 since `v_p(α) < k − 1`; Remark 16.3(1) (lines 5921–5925) gives uniqueness in `ℋ_(h,L)` from `h` distinct integer points, here the `k − 1` critical values. `ℋ_(v_p(α),L)` is undefined for fractional slope and, for integral slope `h₀`, contains the regulator only after enlarging to `h > h₀`.

   **Witness.** The package's own instance at lines 1992–1996: `y² = x³ − x`, `p = 3`, `k = 2`, `α = √−3`, `v_3(α) = 1/2`; `ℋ_(1/2,L)` is not one of Kato's spaces, and the comparison is made in `ℋ_(1,L)` from the single point `r = 1` and almost all `χ`, which Remark 16.3(1) with `h = 1` allows.

   **Exact repair.** Replace "then apply uniqueness in `ℋ_(v_p(α),L)` (§2.5 there; the slope bound is essential)" by "then apply uniqueness in `ℋ_(k−1,L)` (Kato Remark 16.3(1), p. 269; §2.5 there): both sides lie in `ℋ_(k−1,L)` because `v_p(α) < k − 1`, and they agree at `κ^rχ^(−1)` for `1 ≤ r ≤ k − 1` and almost all `χ`; the slope bound is essential, since at `v_p(α) = k − 1` the distribution of 6.5 is a nonzero element of order `k − 1` vanishing at all of these points."

3. **F03** (P3) Target 4.2a has no source locator

   **Location.** `packages/KatoEulerSystems/README.md` lines 1310–1327 (§4.2a, "prove strictKernel_eq_dualSelmer").

   **Claim.** Every other target of the roadmap carries a locator into a source; 4.2a cites only supplier sections, and its one source reference (Kato 12.9, p. 223, line 1332) is inside a Check and concerns the example `T = ℤ_p(1)`, not the statement.

   **Witness.** The statement is Rubin's Iwasawa Poitou–Tate sequence: Rubin2000 line 1442, Proposition II.3.7, PDF p. 39, printed p. 29 (the README's own page rule), and its finite-level form is Theorem I.7.3 there; the identification of `H²(T)₀` with the dual Selmer module is the first step of Kato's proof of 12.5(3) in 13.13 (pp. 233–234).

   **Exact repair.** After "(classes in `H¹(ℤ[1/Σ], ·)` with zero restriction at every place of Σ)" add "(Rubin draft Proposition II.3.7, p. 29, and Theorem I.7.3; Kato 13.13, pp. 233–234)", and add "Rubin draft Proposition II.3.7 (p. 29)" to the Rubin entry of the References.

Three findings, all P3, none blocking. No pass-a red-team report exists on pull request #163 (its comments are the five review rounds and the fix notices), so there is nothing to confirm or reject; the three residual P3 items of the accepting review of 0ff66a0 (Check allocation in §§0.1, 0.2, 3.3; the word "integral" in §4.6; the second owner of the theta unit) are still unrepaired at this head and are not re-raised here.

## Verified sound

Head: the board checkout is at `0ff66a0`, the pull request's current head; `git diff --stat origin/main...HEAD` touches only `packages/KatoEulerSystems/` (README.md, Suggested.lean, metadata.toml, sources.toml, design/plan.json, reports/). The whole README (2,731 lines) and Suggested.lean (73 lines) were read line by line.

Dependency-check output, verbatim:

    depcheck: 56 roadmaps, 653 edges, 0 problem(s)

No UPWARD, CYCLE or moved line. `design/plan.json` declares no gaps (`"gaps": []`) and the README states none. The citation resolver reported no cross-roadmap citation and no Lean name found nowhere.

### Suggested.lean against the pins (3 declarations read)

No Lean was run (the brief gives no Lean command); the three declarations were compared with the pinned sources by reading. Pinned files opened at the manifest revisions (Mathlib `6b7abb3c…`, Tau Ceti `a91d3aaf…`): `Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean` lines 43–50 (`localPolynomial`: `1 − aT + qT²`, `1 − T`, `1 + T`, `1`, on the local minimal model), 79–81 (`LFunction : ArithmeticFunction ℤ`, Euler product over `HeightOneSpectrum (𝓞 K)`), 84–85 (`WeierstrassCurve.LSeries = LSeries ((↑) ∘ W.LFunction)`); `TauCeti/AlgebraicGeometry/EllipticCurve/Affine/Point/Galois.lean` lines 42–60 (`pointGaloisAction : (K ≃ₐ[F] K) →* Multiplicative (AddAut (W⁄K).toAffine.Point)`, acting by `Affine.Point.map e.toAlgHom`, with `[DecidableEq K]` and `[W.IsElliptic]`).

| Declaration (section) | Binders carried in the signature | README statement | Agreement |
|---|---|---|---|
| `ellipticCyclotomicFiniteGeneration` (§7.9, Kato 14.4) | `W : WeierstrassCurve ℚ`, `[W.IsElliptic]`, `m : ℕ`, `1 ≤ m`; conclusion `AddGroup.FG` of the points over `adjoin ℚ {x : ℂ ∣ ∃ n, x^(m^n) = 1}` | lines 2557–2562 | agree; the field is `⋃_n ℚ(ζ_(m^n))`; `m = 0` would adjoin all of ℂ (`x⁰ = 1`), excluded by `1 ≤ m` |
| `ellipticCharacterPart` (§7.9, Kato 14.2's `M^(χ)`) | `W`, `[W.IsElliptic]`, `K`, `[Field K] [DecidableEq K] [Algebra ℚ K]`, `ψ : (K ≃ₐ[ℚ] K) →* ℂ`; body `{P ∣ ∀ a, lift ψ a = 0 → ∑ n_σ σ(P) = 0}` | lines 2498–2508; Kato2004 lines 4600–4603 (`I_χ = ker(ℤ[G] → ℂ)`, `M^(χ) = {x : I_χ x = 0}`) | agree; a real body on native points, no `|G|` division |
| `ellipticCharacterPoints_finite` (§7.9, Kato 14.3(2)) | `W`, `[W.IsElliptic]`, `m`, `[NeZero m]`, `K`, `[Field K] [DecidableEq K] [Algebra ℚ K] [IsCyclotomicExtension {m} ℚ K]`, `χ : DirichletCharacter ℂ m`, `F`, `Differentiable ℂ F`, agreement with `LSeries (a_n χ(n))` on `3/2 < Re s`, `F 1 ≠ 0` | lines 2510–2522; Kato2004 lines 4604–4614 (`L(f,χ,s) = L_S(f,χ,s)`, `S = prime(m)`, `χ` through `(ℤ/m)^× → Gal(ℚ(ζ_m)/ℚ)`) | agree; `autEquivPow` sends σ to the `a` with `σζ = ζ^a`, Kato's identification |

Truth of the two theorems as typed: the twisted series converges absolutely on `Re s > 3/2` (`|a_n| ≤ d(n)√n`), so an entire `F` agreeing there is the continued `L_(prime(m))(E,χ,·)` and `F(1)` its value at 1. When `m` is not Kato's minimal modulus (`m ≡ 2 mod 4`, minimal `m/2`) the only extra removed factor is at `q = 2`, and `1 − a_q χ(q)q^(−1) + χ(q)²q^(−1)` is nonzero because `|χ(q)/q| = 1/q ≠ q^(−1/2)` (roots of `1 − a_qX + qX²` have absolute value `q^(−1/2)`); multiplicative `1 ∓ χ(q)/q ≠ 0`; additive 1. So `F(1) ≠ 0` is Kato's hypothesis exactly, and the conclusion is Corollary 14.3(2) for `A = E`, which is a quotient of `J₁(N_E)` by `EllipticCurveModularity` R29.6 (its head, "The three equivalent modularity formulations", unconditional for every `E/ℚ`). `m = 1` and `m = 2` give `K = ℚ`, the trivial character part `E(ℚ)`, and `F(1) = L(E,1)` up to the nonzero factor at 2. Theorem 14.4 (Kato2004 line 4630–4631) is for every `m ≥ 1` and every such `A`, CM included.

Headlines and padding: the README's headlines are the zeta morphisms (§§5.1, 5.4, 5.6), the regulator equality (§6.4), non-torsion and the cohomological bound (§§7.1–7.2), finite generation and classical finiteness (§7.3), the divisibilities (§7.4), no finite submodule (§7.6), the rank-zero bound (§7.8), and §7.9's four theorems. The two statable at the pins are stated; the module docstring names each of the others with the carrier it lacks (Iwasawa cohomology, the modular Galois realization, the `p^∞`-Selmer group and Ш of `E(ℚ̄)`, `A_f`, `J₁(N)`), and 7.3's classical finiteness is the `m = 1` case of the stated theorem, as the docstring says. Serre's open image (§4.7) is not statable without a CM predicate, which the pins lack. One-tactic probe by reading: neither theorem is a library lemma, a definition restatement, a Check or a small value; the one `def` is used by a headline. No `lemma`, `set_option`, `#eval`, `#print`, `#synth`, `True`, sorried data or admitted example; imports are `import Mathlib` and the one existing `TauCeti.*` module.

### Targets, sources and suppliers

Targets read: every target of §§0.1–7.9 (46 sections, 71 named targets). Locators verified in the cached texts (56): Kato2004 2.6 (line 456), 12.4 (4046–4051), 12.5(1)–(4) with (12.5.1)–(12.5.2) (4052–4095), 13.1 (4174–4196), 13.3 (4208–4226), 13.5 (4262–4272), 13.7 (4277–4292), 14.1–14.5 (4566–4649), `[M : z]` (4650–4658), 14.6 (4663), 14.7 (4707–4720), 14.8 (4721–4739), (14.10.1)–(14.10.5) (4793–4813), 14.11 (4814–4830), 14.13 (4850–4870), 14.14 (4897–4911), 16.1 (5868–5876), 16.2 (5902–5919), 16.3 (5920–5927), 16.4 (5932–5956), 16.5 (5957–5966), 16.6 (5973–5997); Rubin2000 III.5.1 (2200–2209), 5.3 (2247–2253), 5.6 (2279–2284), 5.8–5.10 (2298–2321), 5.11 (2323–2346), 5.13 (2374–2389), 5.14 (2392–2403), 5.15 (2409–2416), 5.17 (2433–2454), 5.18 (2455–2460), II.3.7 (1442); Nakamura2023 Lemma 3.4, Remark 3.5, Corollary 3.6 (2076–2095), Theorem A.1 (3749–3760), Remark A.2 (3797–3803), Lemma A.3 (3814–3828), Definition A.4 (3831–3836), Corollary A.5 (3840–3852), Remark A.6 (3853–3862); Loeffler2017 (A)–(B) (24–26), Definition 1.2.1 (126–137), Remark 1.2.4 (198–202), Theorem 2.2.2 with (†) (254–263), Theorem 2.3.1 (282–289); Weibel2013 III Corollary 1.7.1 (395, page 8) and Exercise 5.6 (2381, page 46, listed among the exercises after 5.5); Greenberg1999 Theorem 4.1 (1480–1488, the factor `|Ẽ_v(f_v)_p|²` and the Tamagawa factors); Colmez1998 Théorème 7 (306). Page rules used: Kato printed = PDF + 115; Rubin printed = PDF − 10. All agree with the README as stated, including the misprints the References list (the `D_crys` space in 16.4(ii), line 5952; (12.5.1) in 14.5(3), line 4647; the integral modules in 12.5(4), lines 4085–4095).

Sibling citations checked (147 located, 24 read in substance), each against the roadmap as it is now, on main for `ModularCurves` (§§0A, 2A, 2D, 2E, 5B), `ModularForms` (Layers 0, 4, 7, 8G, 9 with the inner-twist sublayer), `EllipticCurves` (Layers 1, 4, 4.5b, 6, 7, the absolute real period at its line 1303) and `PadicMeasuresIwasawaAlgebras` (§§4.1–4.6), and at the open heads for `PadicFamilies` (§§4.0.1–4.0.3, 4.5; `thetaUnit`, `modularZeta_moment/_norm/_trace/_hecke/_smoothing/_explicitReciprocity`, `classicalOrdinarySelmer_torsion` present; the norm factor `1 − ℓ^(−r)A_ℓ + ℓ^(k−1−2r)B_ℓ` and the three `p`-level branches as the README states them), `SelmerIwasawaCohomology` (27 sections, all present; §3.7's `φ_k(σx) = κ(σ)^(−k)σφ_k(x)` and its finite-coefficient diagonal limit match 4.6; §2.12a's `abelianSelmerGroup` and `abelianSelmerGroup_finite`; §4.26's Kummer-equals-Bloch–Kato at every finite place; §3.20's elliptic cyclotomic case under `p` odd, `E(F)[p] = 0`, good ordinary, cotorsion; §3.11's snake sequence), `EulerSystemsAndKolyvaginSystems` (14 sections; §2.2 as in R01; §4.17(b) finiteness under `Hyp(K,V)` for any `p`; §8.39 Rubin II.3.8 with the rank-one torsion hypothesis at `p`), `PadicHodgeRegulators` (18 sections; §8.22 the Coleman map for odd `p` with Néron differential, `α^(−k)τ(χ)Σχ(g)^(−1)exp*` and `(1 − α^(−1))(1 − β^(−1))^(−1)` at `χ = 1`; §9.36 augmentation containment in the split case; §9.35 all `p`; §1.4), `ModularSymbolsPadicLFunctions` (10 sections; §2.5 slope `h < k + 1` in its weight, Kato's `k − 1`; §3.2 the critical-slope nonuniqueness; §3.3 the family comparison needing a jointly analytic section, as the README's scope says; §0.8), `AutomorphicGaloisRepresentations` (11 sections; §6.1 `V_ℓ(A_f) = ⊕_(λ|ℓ)`; §7.5 Ribet–Momose with the inner-twist field retained), `ModularCurvesPartII` (17 sections; §16.2 `A_f = J₁(N)/B_f`), `CompletedCohomologyAndLocalGlobalCompatibility` §2.6 (Nakamura Lemma 2.10, rational isomorphism, integral map), `AutomorphicLFunctionsAndLocalFactors` anchor `rs-boundary-nonvanishing` (zero-free on `Re(s) ≥ 1`, poles only when `π₂ ≅ π₁^∨ ⊗ |det|^(−it)`), `GL2AutomorphicRepresentationsAndTransfer` §R16.5.3 (`L(s,π_f) = L_f(s + (k−1)/2)`), `ArithmeticGaloisDuality` (9 sections), `SchemeKTheoryOperations` (5), `K2SymbolsBrauer` (5), `EllipticCurveModularity` (R29.4–R29.6; R29.6 states all three modularity formulations for every `E/ℚ`, unconditional through ClassicalSerreModularity §R27.6), `HeightsRationalPointsAndObstructions` §1.7 (`AbelianVariety.fg_points`), `EllipticCurveModularityPartII` §6.0e (the second theta-unit owner the accepting review named). Every supplier is earlier than `KatoEulerSystems` (merge order 262) or on main. Consumers: `ModularIwasawaMainConjectures` at its head cites §§2.2, 4.2–4.3, 4.6, 5.1–5.4, 6.2–6.6, 7.2, 7.4, 7.6, 7.9 of this roadmap under the hypotheses stated here and declares its own gaps against it (`gap:modular-zeta-extensions`, `gap:central-critical-specialization`), which are that roadmap's; `HeegnerPointEulerSystems` at its head consumes §§6.6, 7.4, 7.7 (its lines 59, 1060, 1467, 1630), as the README's Downstream consumers says. `AutomorphicCongruences` is the board package of #129 and `RankZeroOneBSDPartII` is in the merge order (line 299) with no readable package; both are named only as downstream consumers, not as suppliers. No `Suggested.lean` name of this package is declared elsewhere. Ownership against the open pull requests was checked for the objects of §§0, 4.5–4.7, 5.1, 6.1, 7.9 through the sibling checkouts the brief gives and the roadmap grep; the explorer's search of the accepting review was not repeated beyond those.

Policy: no `lemma`, `set_option`, pull-request number, process word, LaTeX delimiter or machine path in the README or the Lean file; no computational algorithm; the package is only its folder.

### Adversarial computations

"Retain" means the computed instance agrees with the stated passage; it proves nothing beyond it.

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| Conventions, Frobenius polynomial (lines 130–138) | `k = 2, ℓ = 3, a₃ = 2, ε = 1` | geometric `1 − 2u + 3u²`, eigenvalues `α, β`; arithmetic eigenvalues `1/α, 1/β`: trace `a_ℓ/(εℓ^(k−1)) = conj(a_ℓ)ℓ^(1−k) = 2/3`, det `1/3`: `1 − (2/3)t + (1/3)t²` | Retain |
| 2.1 twisted polynomial | `T = V(f)(k−r)` | multiply the arithmetic Frobenius by `ℓ^(k−r)`: `1 − conj(a_ℓ)ℓ^(1−r)t + conj(ε)ℓ^(k+1−2r)t²`; Kato line 4224 displays the same coefficients | Retain |
| 2.1 conductor domain | `m = 1`; `m = p`; `m = ℓp` | `prime(1) ∩ Σ = ∅`; `{p}`; `{p}`: `1 ∉ S` although the Check and 6.6 use `c_ℚ` | R01 |
| 2.1 evaluation | `k = 4, r = 2, ℓ = 3, a = 2, ε = 1` | `P(t) = 1 − 2·3^(−1)t + 3t²`; at `t = X/3`: `1 − (2/9)X + (1/3)X²`; at `t = X`: `1 − (2/3)X + 3X²` | Retain |
| 2.2 operator dictionary | Nakamura Lemma A.3 proof (lines 3819–3821) | `S = ℓ^(2(k−2))S′^(−1)`, `T = ℓ^(k−2)S′^(−1)T′`, so `T′ = ℓ^(k−2)S^(−1)T`, `S′ = ℓ^(2(k−2))S^(−1)`; with prefactor `ℓ^(k−2)` the `S′` eigenvalue becomes `ε(ℓ)` | Retain |
| 2.2 integral pairing | `p = 2, k = 4` | antidiagonal `−2, 1, −2`: determinant `−4` | Retain |
| 0.3 Bernoulli exponent | `x = 0, 1/2, 2/5` | `1/12`; `(1/4 − 1/2 + 1/6)/2 = −1/24`; `(4/25 − 2/5 + 1/6)/2 = −11/300`; printed formula `−23/300` | Retain |
| Conventions, smoothing direction | `c = 5, a = 2` | `P ∈ E[2] ∖ 0`: coefficient in `25[0] − E[5]` is 0, in `25E[2] − E[10]` is `25 − 1 = 24` | Retain |
| Conventions, row action | `σ = [[1,1],[0,1]]`, `v = (1/5,0)` | `(aα + cβ, bα + dβ) = (1/5, 1/5)`; transpose `[[1,0],[1,1]]` gives `(1/5, 0)` | Retain |
| 1.1 prime sets | `(2,3) → (6,9)` | `prime(M) = {2} ≠ {2,3} = prime(M′)`, `prime(N) = prime(N′) = {3}`; unions equal | Retain |
| 1.1 projection formula | Weibel Ex. 5.6 with `i = 1` | `f_*({f^*r, s}) = {r, N(s)}`; skew-symmetry gives `f_*{s,r} = {N(s), r}` | Retain |
| 3.2 normalization | `k = 4`, zero index | constant term `3!·2ζ(4)/(2πi)⁴ = 12(π⁴/90)/(16π⁴) = 1/120 = ζ(−3)`; `E₄/120 = 2G₄` | Retain |
| 3.2 level factor | `N = 3, k = 4` | class sum over `3ℤ²`: `2ζ(4)/81`, times `3!/(2πi)⁴`: `1/9720`; `81 · 1/9720 = 1/120` | Retain |
| 3.3 two branches | `k = 2, r = r′ = 1, M = N = 5` | `(−1)·1·5^(−1)·5^(−1) = −1/25` on both | Retain |
| 3.3 sign | `k = 4, r = 2`, even χ | `(−1)^(1)·1 = −1` | Retain |
| 3.4 Euler factor | `T′(2) = 3`, trivial diamonds | `(1 − 2^(−s))(1 − 2^(1−s)) = 1 − 3·2^(−s) + 2^(1−2s)` | Retain |
| 3.4 η-form | `f = 2`, `g = z` on `𝔾_m` | `log 2 · dlog(z/|z|) = log 2 · i dθ`; integral `2πi log 2` | Retain |
| 4.1 reduced norms | `k = 3`, odd `p` | `[ℤ_p^× : (ℤ_p^×)²] = 2`; `[ℚ_p^× : (ℚ_p^×)²] = 4` (8 at 2); Loeffler (†) line 260 `det ∈ ℤ_p^(×(k−1))` | Retain |
| 4.1 nebentypus on `H` | `ε ≠ 1` | `(c, ε^(−1))` is an inner twist since `conj(a_ℓ) = ε(ℓ)^(−1)a_ℓ`, so `H ⊂ ker ε` and `det ρ_f|_H = κ^(1−k)`; Loeffler line 282 | Retain |
| 4.2 edge line | `k ≥ 3` | `r = k − 1 ≥ (k+1)/2 ⇔ k ≥ 3`; Kato (14.10.5) line 4812 | Retain |
| 4.3 residual irreducibility | `p` odd; `p = 2` | stable lines `1`, `2` or `q + 1`, all prime to odd `p`; a pro-`p` orbit is a `p`-power, so size 1; at `p = 2` two lines may be swapped | Retain |
| 4.4 CM fields at 2 | `ζ₈ + ζ₈³` | `(1+i)/√2 + (−1+i)/√2 = i√2`, so `ℚ(√−2) ⊂ ℚ(ζ₈)` | Retain |
| 4.5 argument | height-one `𝔭 ∋ p, μ` | minimal primes consist of zero divisors so `μ ∉ 𝔭_min`; `𝔭` minimal over `μR`, so `𝔭 ∈ Ass(R/μR)` and `p` kills a nonzero class | Retain |
| 4.6 finite twist | `p = 3, n = j = 1`, `κ(σ) = 4` | `4 ≡ 1 mod 3`: `#H⁰(F,μ₃) = 3`; `4t = t ⇒ t = 0` in `ℤ₃(1)` | Retain |
| 4.7 Hyp over ℚ | `K = ℚ` | units `±1`, `(−1)^(1/p^n) = ζ_(2p^n)^(odd) ∈ ℚ(μ_(2p^∞)) = ℚ(μ_(p^∞))` for odd `p`, `ℚ(μ_(2^∞))` at 2; `K(1) = ℚ` | Retain |
| 6.1 Gauss sum | quadratic χ mod 3 | `ζ₃ − ζ₃² = i√3`; `G² = −3 = χ(−1)·3` | Retain |
| 6.1 uniqueness | Kato 16.1 and 16.3(1) | `ℋ_h`: `|c_n|_p n^(−h) → 0`, `h ≥ 1` integer; `h` integer points determine an element; `∏_(r=1)^(k−1)log_p(u^(−r)s)` has `|c_n| = O(n^(k−1))`, not `o`, so it is outside `ℋ_(k−1)` | R02 |
| 6.4 CM instance | `y² = x³ − x`, `p = 3` | points `∞, (0,0), (1,0), (2,0)`: `a₃ = 0`; `α² = −3`, `v₃(α) = 1/2`; `α^(−1) = −α/3`; `(1 + α/3)² = 2/3 + 2α/3 ∉ ℚ₃` | Retain, R02 |
| 6.6 dyadic logarithm | `y² + xy = x³ + 1`, `t = 2u` | `b₂ = 1, b₄ = 0, b₆ = 4, b₈ = 1`, `Δ = −1 − 432 = −433`; `log t = t + t²/2 + t³/3 + …`: `2u(1+u) ∈ 4ℤ₂`, `(8/3)u³ ∈ 8ℤ₂`, `v₂(2^n/n) ≥ 2` for `n ≥ 4`; image `4ℤ₂` | Retain |
| 6.6 real components | `y² = x³ − x`; `y² = x³ + x` | roots `−1, 0, 1`: two components; one root: one; `ord₂(2) = 1`, `ord₃(2) = 0` | Retain |
| 7.3 descent | `P ∈ E(ℚ_∞)`, layer containing `T₀` | `kP ∈ E(ℚ_n)` gives `σP − P ∈ T₀`; `Γ` acts trivially on `T₀`, so `σ ↦ σP − P` is a homomorphism killed by `eΓ`, open in `Γ ≅ ℤ_p` | Retain |
| 7.5 universal norms | `y² = x³ + x`, `p = 5` | squares mod 5: `0, 1, 4`; points `∞, (0,0), (2,0), (3,0)`, `a₅ = 2`, `Δ = −64`; `[5] = id` on a group of order 4; `Ẽ[5^∞] = 0` | Retain |
| 7.7 anomalous factor | `p = 5`, `X² − X + 5` | `#Ẽ = 5`; unit root `α ≡ 21 mod 25`; `α − 1 = −β`, `v₅ = 1` | Retain |
| 7.8 supersingular | odd `p`, `p ∣ a_p` | `#Ẽ(𝔽_p) = p + 1 − a_p ≡ 1 mod p` | Retain |
| 7.9 χ-part | `m = 3`, χ(2) = −1; `m = 5`, χ(2) = i | `I_χ = (1 + σ)`; order-3 fixed point: `2P ≠ 0`; 2-torsion: `2P = 0`; `1 + σ₂² ↦ 1 + i² = 0` | Retain |
| 7.9 extra Euler factor | `m = 2m₀`, `q = 2` | good: `1 − a_2χ(2)/2 + χ(2)²/2 ≠ 0` since `|χ(2)/2| = 1/2 ≠ 2^(−1/2)`; multiplicative `1 ∓ χ(2)/2`; additive 1 | Retain |
| 7.9 exceptional prime | `k = 2, r = 1` | `𝔭 = ker κ^(−1)`; `κ^(−1) = κ^(−2)χ` forces `χ = κ`, not of finite order | Retain |
| 7.9 edge for `r < k/2` | integer `r` | `r ≤ (k−1)/2 ⇔ 2r < k`; then `k − r ≥ (k+1)/2` | Retain |
| 4.2a local term | `T = ℤ_p(2)`, odd `p` | `T^∨(1) = (ℚ_p/ℤ_p)(−1)`: `G_(ℚ_p)`-invariants `0` (`u = 2`), `G_(ℚ_p(μ_(p^∞)))`-invariants all, dual `ℤ_p` | Retain |
| 4.2a class-group example | `ℤ[ζ_(p^n), 1/p]`, odd `p` | one place over `p`, `Br = 0` by the sum-zero condition at a single place; `(1 − ζ)` principal | Retain |
| Headline 1 | `m = 0`; `m = 1`; `m = 6` | all of ℂ (excluded); `{1}`, field ℚ; orders `2^a3^b`, nested union | Retain |
| Headline 1 nonsingular | `y² = x³` | `Δ = 0`; nonsingular points `≅ (ℚ,+)`, not finitely generated; excluded by `IsElliptic` | Retain |
| Headline 2 | `m = 2`; χ imprimitive mod 5 | `K = ℚ`, series `L_((2))(E,s)`, `F(1) = L(E,1)·(1 − a_2/2 + 1/2)`; `ψ = 1`, `I_ψ` augmentation, part `E(ℚ)`, `F(1) ≠ 0 ⇔ L(E,1) ≠ 0` | Retain |

## Not verifiable

- Rohrlich1984, Rohrlich1988, Ribet1980, PerrinRiou1990, PerrinRiou1994, Schneider1985, BlochKato1990, DiamondShurman2005 and JacquetShalika1976 are settled uncertified and FontaineMessing1987 waived; their locators were left as recorded and none was requested.
- Kato2004 line 4860 (14.13, the period of `z`) and line 5912 (16.2(i), the sign) are garbled in the extraction; the README's reading of both was not independently certified.
- Kato2004 Theorem 17.4, cited in 7.4 for the dyadic good-ordinary case, could not be located by text search in the extraction (OCR); its content was not checked.
- The Betti scalar `(2πi)^(1−k)` of §5.4 against Nakamura's Corollary A.5 (lines 3840–3852), which states the interpolation without the Betti identification, as the accepting review also noted.
- Nakamura2023 was read in the arXiv v2 the package cites; the published numbering was not compared.
- No Lean was elaborated in this pass; binder retention was checked by reading the signatures against the pinned declarations, not by `#check`.

## Source issues

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "0ff66a0", "job": "RT-KatoEulerSystems~1b", "model": "fable", "worker": "fable-rt234"} -->
