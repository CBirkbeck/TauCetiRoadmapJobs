# Review of CanonicalModelsAndGonality (pull request #1726 at 6999a59)
**Verdict:** needs changes

Full re-review of the repaired head (1531 changed lines since 9c138c9). The status of each of the previous review's nineteen findings is recorded under *Verified sound*; eighteen are repaired and one (R12, statable headlines) is repaired except for the point raised as R02 below. The gate at this head is clean (every scanner 0, `build=0`, `depcheck=0`); the dependency check run by this review reports no UPWARD or CYCLE line.

## R01 (P2) — §1.9's hyperelliptic characterization needs a perfect (or separability) hypothesis

Location: `TauCetiRoadmap/CanonicalModelsAndGonality/README.md:572-574`: "For `g ≥ 2`, `2` is a pole number at some rational place iff `F` is hyperelliptic over `k` with `P` a branch place (AlgebraicCurves Layer 10, hyperelliptic pole numbers)."

Claim: the equivalence holds for every exact constant field `k`, as §1.9 states no hypothesis (the Conventions say each milestone records its own).

Witness: `k = 𝔽₂(a)`, `F = k(x, y)` with `y² = x⁵ + a`. The quintic plane model has `p_a = 6`; its point at infinity is a `(3,5)`-cusp with `δ = 4` (orders of `s = x/y`, `t = 1/y` at the unique place `P_∞` are `3`, `5`); the closed point `(x, y² + a)` of degree two is regular over `k` (`𝔪 = (x)` since `y² + a = x⁵`), so `g = 2` with exact constants. `P_∞` is rational with uniformizer `v = y/x³` and `v_{P_∞}(x) = −2`, so `2` is a pole number there. But `F` is not `IsHyperellipticFunctionField k F`: every index-two rational subfield equals `k(x)` (Tau Ceti `adjoin_eq_adjoin_of_finrank_adjoin_eq_two`, no hypothesis on `k`), and `F / k(x)` is purely inseparable. The same curve, over `k̄`, is `k̄(√x)`.

Repair: state the "iff" for `[PerfectField k]` (or with "`F / k(x)` separable" in the conclusion's hypothesis side), keep `gonality k F ≤ first pole number` general, and add the witness as a negative-control Check (the §4.5 Check already records a sibling example). Also repoint the locator: AlgebraicCurves Layer 10 has no "hyperelliptic pole numbers" item; what it supplies is the list of ramified places of a hyperelliptic field (Prop. 6.2.3, `TauCetiRoadmap/AlgebraicCurves/README.md:1327-1329`), and pole numbers are Layer 5 / Tau Ceti `IsPoleNumber` (`TauCeti/FieldTheory/FunctionField/Consequences/WeierstrassGaps.lean:71`). On the witness the repaired statement is silent (imperfect `k`), and over perfect `k` the argument `ℓ(2P) = 2 ⟹ [F : k(x)] = 2`, with separability automatic, goes through.

## R02 (P2) — The §6.5 descent theorems are statable at the pins but absent from `Suggested.lean`

Location: `TauCetiRoadmap/CanonicalModelsAndGonality/README.md:1429-1432`: "**for `g ≥ 6` and perfect `k`, geometrically bielliptic ⟺ bielliptic over `k`**, and for `g ≥ 2` geometrically hyperelliptic ⟺ the hyperelliptic involution is defined over `k`"; `Suggested.lean:26-40` (the list of headlines that cannot be stated) does not mention §6.5.

Claim: the acceptance file states every headline that is statable at the pins (brief rule; previous review R12).

Witness: both bold statements are statable on carriers the file already uses. In the `ConstantExtension` section (`Suggested.lean:150-181`) the setup `[IsAlgClosed k'] [Algebra.IsAlgebraic k k']`, `hF'`, `hex'`, `constantCompositum F k' F' = ⊤` is in place, and `IsBielliptic k' F'` (`Suggested.lean:492`) and `IsHyperellipticFunctionField k' F'` elaborate there. The statements are
`[PerfectField k] … (hg : 6 ≤ genus k F) : IsBielliptic k' F' ↔ IsBielliptic k F` and
`[PerfectField k] … (hg : 2 ≤ genus k F) : IsHyperellipticFunctionField k' F' ↔ ∃ H : Subgroup (F ≃ₐ[k] F), Nat.card H = 2 ∧ genus k (IntermediateField.fixedField H) = 0`.
Both are true as stated (uniqueness from §5.2(d) holds in characteristic two as well, since `F / F^H` is Galois, hence separable; the unique nonidentity element of a Galois-stable subgroup of order two is semilinearly fixed; the quotient genus is preserved by the perfect-field constant extension). They are the theorems that let the LMFDB's geometric booleans (`ag.bielliptic_curve`, `ag.hyperelliptic_curve`) be computed from the `k`-predicates this file defines.

Repair: add the two statements (with `sorry`) to Layer 6 of `Suggested.lean`, and name them in §6.5. The same carriers also state §5.2(b) (`[PerfectField k]`, `3 ≤ g`, `Module.finrank (canonicalField hF hex) F = 2`, `index k (canonicalField hF hex) = 2 → gonality k F = 4`, the model-type-7 fact of §9.4) and §5.2(f) (two transcendental `x, z` with `finrank k⟮x⟯ F = 3 = finrank k⟮z⟯ F` and `5 ≤ g` give `k⟮x⟯ = k⟮z⟯`); these two are recommended, not required.

## R03 (P3) — `(2 : k) ≠ 0` is unused in the three Castelnuovo–Severi corollaries

Location: `TauCetiRoadmap/CanonicalModelsAndGonality/Suggested.lean:521`, `:528`, `:537`.

Claim: the hypothesis `h2` is needed for `genus_le_three_of_isHyperelliptic_of_isBielliptic`, `eq_of_isBielliptic_of_six_le_genus` and `gonality_eq_four_of_isBielliptic`.

Witness: Castelnuovo's inequality (Stichtenoth 3.11.3, AlgebraicCurves Layer 8) needs `k` perfect and one of the two extensions separable. In the three proofs the separable extension is `F / fixedField H` (Galois of degree two, separable in every characteristic) or `F / k(x)` (separable by the hyperelliptic predicate); the bound `gonality ≤ 4` composes the elliptic quotient's gonality `2` (1.4(b) over an algebraically closed field) with degree `2`, with no characteristic input; a degree-three pencil with `F / k(z)` purely inseparable would make `F` rational. README §5.2 itself says separability is "automatic in characteristic ≠ 2, 3 for the degrees involved" but states the corollaries without a characteristic clause.

Repair: delete `(h2 : (2 : k) ≠ 0)` from the three signatures (keep it on `degree_tameDifferent_of_natCard_eq_two` and `isBielliptic_iff_exists_degree_tameDifferent`, where tameness is used).

## R04 (P3) — `hurwitz_fixedField_tame` instantiates the pinned Hurwitz formula; `arithmeticGenus` is built on a sorried theorem

Location: `TauCetiRoadmap/CanonicalModelsAndGonality/Suggested.lean:480-485` and `:251-253`.

Claim: `hurwitz_fixedField_tame` is a headline; `arithmeticGenus` is a simple definition with a real body.

Witness: the first is `two_mul_genus_sub_two_eq_iff_forall_isTame` (`TauCeti/FieldTheory/FunctionField/Different/Hurwitz.lean:120`) with `k' = k`, closed by `isTame_of_charZero` (`Different/Tame.lean:203`) and `finrank_fixedField_eq_natCard` (`TauCeti/FieldTheory/Galois/FixedField.lean:304`) for the geometric degree: an instantiation of three library facts, of the kind the previous review's R15 removed. The second is `(exists_arithmeticGenus hF hex x).choose`, so the definition (and `delta`, `petri`'s `hquintic`, `two_mul_genus_eq`, `delta_eq_zero_of_isSmoothPlaneEquation`) depends on the axiom behind a `sorry`; the one-tactic probe confirms no admitted statement closes by `rfl`, `simp`, `infer_instance`, `omega`, `decide` or `norm_num`, so this is the only declaration whose *value* rests on a sorry.

Repair: delete `hurwitz_fixedField_tame` from `Suggested.lean` (README §6.2 keeps the statement). Give `arithmeticGenus` a total body that mentions no sorried declaration, for instance `if h : ∃ p : ℤ, ∃ N : ℕ, ∀ m, N ≤ m → (x.hilbertFunction m : ℤ) = m * x.degree hF + 1 - p then h.choose else 0` (classical), and keep `exists_arithmeticGenus` as the headline that makes it meaningful.

## R05 (P3) — Supplier-contract bookkeeping: a phantom heights name, a later roadmap listed as a supplier, a wrong stage label, a pinned iff with a characteristic clause

Location: `TauCetiRoadmap/CanonicalModelsAndGonality/README.md:118`, `:340-341`, `:283`, `:343`, `:1747`, `:1762`, `:1805`, `:883`.

Claim: each supplier citation names a section or declaration that exists where it is cited and is consumed by some layer.

Witness: (a) `Curve.finite_rationalPoints` (§4.6) is not a name of HeightsRationalPointsAndObstructions at its open head; §4.6 there is `mordell_finite` (`TauCetiRoadmap/HeightsRationalPointsAndObstructions/README.md:2049-2051`); neither it nor `finite_nonconstant_hom` (§4.3) is cited by any `*Needs:*` line of Layers 1–9 (only §5.9 and Layer 1 are). (b) EffectiveDiophantineMethods sits at position 161 of the merge order, after this roadmap (142), and is listed under "From named roadmaps" of *Exact supplier contracts* although "it supplies nothing here"; the dependency check does not count it (0 problems), but a later roadmap does not belong in the supplier list. (c) "AlgebraicTopology Stage 0 item 7": the no-retraction item is item 7 of **Stage 2** (relative singular chains and homology), `TauCetiRoadmap/AlgebraicTopology/README.md:393-406`; there is no Stage 0. (d) §3.4 cites the pinned `isHyperellipticFunctionField_iff_two_le_genus_and_exists_degree_eq_two_and_two_le_dim` for the step over `k̄`, but at the pin it carries `(2 : k) ≠ 0` (`Hyperelliptic/Basic.lean:167-169`); over an algebraically closed field of characteristic two the step is the perfect-field separability milestone of AlgebraicCurves Layer 10 (`README.md:1314-1320`) together with the pin's `exists_transcendental_finrank_adjoin_eq_two_of_degree_eq_two`.

Repair: (a) drop the two unused heights contracts or rename the second to `mordell_finite` and say where it is used; (b) move the EffectiveDiophantineMethods sentence out of the supplier list (it is already covered under *Scope exclusions* and belongs, if anywhere, under *Downstream consumers*); (c) write "Stage 2, item 7" in the five places; (d) cite the Layer 10 milestone for the characteristic-two case.

## Verified sound

**Previous findings.** Each finding of the previous review was checked against the new head.

| Previous | Status at 6999a59 |
|---|---|
| R01 odd degrees only (5.2(b)) | Repaired: `README.md:1210-1213` ("every pencil of degree at most `g` factors through the degree-two pencil and has even degree; only the odd degrees from `3` to `g` are excluded") with the `y² = x⁹ − 1` Check. |
| R02 cyclic subgroup vs generator (6.5) | Repaired: `README.md:1424-1428` descends the subgroup and the quotient, not a generator; Check with `y³ = x⁷ − 1`. |
| R03 graded normalization (2.3) | Repaired: `README.md:630-642` (dimension-two standard graded domain, finite normalization from SchemeAndStackFoundations §§0.19–0.21, constant Hilbert polynomial); cusp Check `3m` vs `3m + 1`. |
| R04 characteristic two (3.7) | Repaired: `README.md:936-943` keeps `w² + h_{g+1} w = f_{2g+2}`; Check `w² + v³w = u⁵v`. |
| R05 Chow vs numerical (5.4) | Repaired: `README.md:1266-1273` works in `N^*(Pic^d)_ℚ` from MotivesAndAlgebraicCycles §§0.4–0.5; elliptic Check. |
| R06 Layers 4 ↔ 9 | Repaired: §2.7 owns the image curve and cohomological genus; `README.md:822` "No input from Layers 4 or 9"; `:1171` "no Layer 9 input". |
| R07 module warning | Repaired: `Suggested.lean:1` has `module`; gate `build=0`. |
| R08 separable residue fields (4.5) | Repaired: `README.md:1121-1125`; `𝔽₂(a)` Check. |
| R09 Frey's two branches (7.4) | Repaired: `README.md:1588-1600`; `ℙ¹` Check. |
| R10 pencil vs model, cross-multiplication (2.1, 2.6) | Repaired: `README.md:605-608`, `:735-739`; Checks `(X,Z)` vs `(2X,2Z)`. |
| R11 holomorphic in Hersch's lemma (8.4) | Repaired: `README.md:1744-1748`; plateau Check. |
| R12 headline coverage | Repaired except R02 above: `petri_quadrics_and_cubics`, `card_degree_eq_one_le_geometric_gonality`, `gonality_eq_of_isAlgClosed`, `noether_iff_canonicalField` and `noether_projectiveNormality` over perfect `k`; docstring names the unstatable headlines. |
| R13 no-retraction owner | Repaired (owner cited), label wrong: R05(c). |
| R14 pin and Mathlib hypothesis | Repaired: `README.md:261-267`, `:287`. |
| R15 wrappers | Repaired; one instantiation remains: R04. |
| R16 locators | Repaired: §2.6 Fulton §4.2 pp.46–47; §3.6 derived from Stichtenoth 1.6.3 and 6.2.4; §3.8 Saint-Donat unnumbered theorem p.157, §3 p.165, §§4.11–4.13 pp.174–175; §4.6 Fulton App. A p.113; §6.5 and §7.6 derived with inputs named. |
| R17 roadmap form | Repaired: Summary, Scope, Conventions, Exact supplier contracts, How to read the build; Checks and `*Needs:*` throughout; Examples/Dependencies per layer. |
| R18 zero values, delta type | Repaired: `README.md:220`, `:226`. |
| R19 Abel map on points | Repaired: `README.md:1502-1506`; real-conic Check. |

**Gate and dependency check.** The worker's gate at 6999a59: every scanner `0`, `build=0`, `OK`. The dependency check run by this review returned exactly

```text
depcheck: 204 roadmaps, 1629 edges, 0 problem(s)
```

with no UPWARD or CYCLE line. The merge order lists this roadmap at position 142, after HeightsRationalPointsAndObstructions (126), MotivesAndAlgebraicCycles (69), CongruenceSpectralGap (141); AlgebraicCurves, JacobianChallenge, SchemeAndStackFoundations, StableReduction, ModularCurves, ModularForms, FuchsianOrbifolds and AlgebraicTopology are on main. The diff outside the roadmap folder is empty. The folder holds only `README.md`, `Suggested.lean`, `metadata.toml`. Imports are `import Mathlib` and eleven `TauCeti.*` modules that exist at the pin; no `set_option`, no sorried data definition (the `choose` dependence is R04), no `lemma`, no process words.

**Elaboration and the one-tactic probe.** A scratch copy of `Suggested.lean` with every terminal `sorry` replaced by `first | (rfl; done) | (simp; done) | (infer_instance; done) | (omega; done) | (decide; done) | (norm_num; done) | sorry` elaborated with `lake env lean`: 47 declarations still report `declaration uses sorry`, none closed. The worker's elaborated signatures (64 declarations) were compared with the README statements; no section binder is dropped, and the generalities agree (`[IsAlgClosed k]` for `noether`, `petri`, `petri_quadrics_and_cubics`, Clifford equality, Brill–Noether, `gonality_eq_four_of_isBielliptic`; `[PerfectField k]` for 1.5(b), 2.5, 3.4', 3.6, 3.7, 5.2(c)(d); `[Finite k]` for 1.8; `[Infinite k]` for 7.2; `[NumberField k]` for 7.4), matching the README's hypotheses line by line.

**Adversarial pass.** Values computed on both sides; `k(t)` is a rational function field, characteristic zero unless stated.

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| `gonality` (1.1) | `k(t)`; genus-two `y² = x⁶ + 1`; `k(s,t)` | `[k(t):k(t)] = 1`; canonical pencil `2`, `≠ 1` since genus `2 ≠ 0`; every `finrank = 0` so `sInf = 0` | sound; junk value documented at `README.md:220` |
| `gonality_eq_sInf_degree` (1.2) | `ℙ¹`, `D = ∞`; degree-`0` divisors on `ℙ¹` | `ℓ(∞) = 2`, degree `1`; `ℓ(D) = 1 < 2` so degree `0` not in the set | both sides `1` |
| 1.3(b)(c)(d) | `g = 0`, `D` degree `1`; `g = 2` | `ℓ((g+1)D) ≥ 2`, bound `g + 1 = 1`; `ℓ(W) = 2`, `deg W = 2`, so `gon ≤ 2`, `≠ 1` | sound |
| `gonality_of_genus_eq_zero` (1.4a) | `ℙ¹`; real conic `x²+y²+z²=0` | index `1`, gonality `1`; `deg(−W) = 2`, `ℓ = 3`, index `2`, gonality `2` | both sides agree |
| `gonality_of_genus_eq_one` (1.4b) | `11.a2`; Selmer cubic | index `1`, `max 2 1 = 2`; index `3`, `ℓ(D) = deg D` so least pencil degree `3 = max 2 3` | sound |
| 1.5(b) separability over perfect `k` | char `2`, `F / k(x)` inseparable of degree `2` | `F ⊆ k(x^{1/2})`, equal degrees, `F` rational, `g = 0 < 2` | hypothesis sufficient |
| **1.9 iff** | `𝔽₂(a)`, `y² = x⁵ + a` | `p_a = 6`, `δ_∞ = 4` (semigroup `⟨3,5⟩`), `δ = 0` at `(x, y²+a)`, `g = 2`; `v_{P_∞}(x) = −2`; unique index-two subfield `k(x)` inseparable | **false as stated: R01** |
| 1.6 lower bound | `z` of degree `d` on `F'`, `s_i` symmetric functions | `s_i ∈ L(N(z)_∞)`, `deg N(z)_∞ = d` (`Σ_{P'|Q} f(P'|Q) v_{P'} ≥ −(ND')_Q`); not all `s_i ∈ k` by `hex'` | sound (Poonen A.1(vii) route also checked) |
| 1.6 upper bound | `x` of degree `n` on `F`, `[F':F] = r` | `[F' : k(x)] = r n` by the tower | sound, no `hex` needed |
| 1.7 inequality without algebraicity | `k' = ℂ ⊇ ℚ̄`, `F' = Frac(F ⊗ ℂ)` | `x` stays transcendental (else `F'/k'` algebraic); `k'(x)`-span of a `k(x)`-basis is a field containing `F k'`, so `[F':k'(x)] ≤ [F:k(x)]` | sound |
| `gonality_eq_of_isAlgClosed` | `k = ℚ̄`, `k' = ℂ` | kernel of `F ⊗_k k' → F'` has height `0` by transcendence degree, so `F' = Frac(F ⊗ k')`; `C¹_d(k') ≠ ∅ ⟺ C¹_d(k) ≠ ∅` | sound |
| 1.8 arithmetic | `ℙ¹/𝔽₂`; Klein quartic `/𝔽₈`; `y²+y=x⁵` `/𝔽₂` | `3 ≤ 1·3`; `24 ≤ 3·9 = 27` and `24 > 2·9`; affine points `(0,0),(0,1)` plus `∞` give `3 ≤ 2·3` | sound |
| 1.8 geometric form | `h = σ(z) − z^q` | `deg σ(z) = d ≠ qd = deg z^q`, so `h ≠ 0`; residue map intertwines `σ` with Frobenius at the unique `σ`-stable place over a rational place; zeros `≤ d + qd` | sound |
| 1.10 | `K = algebraicClosure k F` | `[K(x):k(x)] = [K:k]` by linear disjointness of algebraic and purely transcendental extensions | sound |
| `Model.divisor` (2.1) | `(t,1)`; `t·(t,1) = (t²,t)`; `(t²,t,1)`; `(t³,t,1)` | `sup(∞−0, 0) = ∞`; `sup(2∞−2·0, ∞−0) = 2∞−0 = ∞ + (∞−0)`; `2∞`; `3∞`, span `3 < 4 = ℓ(3∞)` | sign and lattice sup correct |
| `(x,1)` on `y² = x³ − x` | ratios | generate `k(x)`, index `2`: a pencil, not a `Model` | `generates` excludes it |
| 2.2 Hilbert functions | line; conic; cusp `k[s³,s²t,t³]` | `m+1`; `2m+1`; degree-`1`: `3` of `4`, degree-`2`: `6` of `7` (missing `st⁵`), so `3m` and `3m+1` | sound |
| `exists_arithmeticGenus`, `genus_le_arithmeticGenus` (2.3) | normalization sequence | `χ(O_{C'}) = χ(O_X) − length Q`, `h¹(C') ≥ h¹(X)` by the surjection `H¹(O_{C'}) → H¹(O_X)`; `p_a = g + δ` | sound; leading coefficient `deg D` since `φ^*O(1) ≅ O(D)` |
| `IsBasePointFree` (2.4) | `0` on positive genus; negative degree | `ℓ(0) = 1 > 0 = ℓ(−P)`; `ℓ(D) = 0` so `ℓ(D−P) < 0` impossible | matches Checks |
| `IsVeryAmple` (2.4) | `2O`, `3O` on an elliptic curve; `W` in genus `2`; pointless conic double cover | fibre `P+Q ∼ 2O`: `ℓ(0) = 1 ≠ 0`; `3O`: `ℓ(3O − E) = 1 = 3 − 2`; `ℓ(W − g¹₂) = 1 ≠ 0`; conjugate pair over `k'` violates the law although no `k`-pencil exists | definition excludes the `k`-only wrong model |
| `isBasePointFree_of_two_mul_genus_le` (2.5), no perfectness | place `P` of degree `e`, `deg D ≥ 2g` | `ℓ(D) − ℓ(D−P) = e + i(D) − i(D−P)`, `i(D) = 0`, `i(D−P) ≤ e − 1` since `deg(W − D + P) ≤ e − 2` | `≥ 1`: sound over every exact constant field |
| `isVeryAmple_of_two_mul_genus_add_one_le` | `deg(D − E) ≥ 2g − 1` | `ℓ(conorm D − E) = deg D − deg E + 1 − g`, `ℓ(D) = deg D + 1 − g`; `dim_conorm` needs `[Algebra.IsSeparable k k']` (pin `ConstantExtension/RiemannRoch.lean:54`), given by perfect `k` | sound |
| 2.6 cross-multiplication | `(X,Z)` vs `(2X,2Z)`; `(X,Z)` vs `(X+Z,Z)`; `(t+1)/t` | `2XZ − 2XZ = 0`; `XZ − (X+Z)Z = −Z² ≠ 0`; `(X+Z, X)` | sound |
| 2.7 image curve | cusp | image `h¹ = 1`, normalization `h¹ = 0`; `χ(O_{C'}(m)) = 3m + 0` | agrees with 2.3 |
| 3.1–3.2 | `g = 1`; `A` effective nonzero with `ℓ(A) = deg A + 1` | `W = 0`, `ℓ(−P) = 0 < 1`; Clifford gives `deg A ≤ 0` if `deg A ≤ 2g−2`, else RR gives `g = 0` | base-point-freeness holds over every exact constant field |
| `canonicalField`, 3.3 Checks | `k(t)`; `g = 1`; `y² = x⁹ − 1`; plane quartic | empty ratio set, `⊥`; constants, `⊥`; `k(x)`, index `2`; `⊤`, degree `4` | sound |
| `canonicalModel_divisor` | `g = 1` with `0 ≤ W`; `g ≥ 2` | `W = 0`, basis `(c)`, `−div c = 0`; some basis element attains `−v_P(W)` at every `P` (else a combination would too) | sound |
| `noether` third clause | `g = 2` | gonality `2`, `[F : canonicalField] = 2`: both sides false | sound |
| `noether_iff_canonicalField` | perfect `k`, not geometrically hyperelliptic | `[F : K₀] = [F k̄ : K₀ k̄] = 1` by linear disjointness over perfect `k` with exact constants | sound |
| `finrank_canonicalField_eq_two` without perfectness | `𝔽_p(a)`, `y² = x^p − a`, `p ≥ 5` (separable, `g = (p−1)/2`, regular not smooth) | `(δx) = P₀ − 3P_∞`, `L(W) = ⟨x^i/y : i ≤ g−1⟩`, ratios generate `k(x)` | holds in this imperfect example |
| `isHyperellipticFunctionField_of_even_genus` | `g = 4`; `g = 3` | `index K₀ ∣ gcd(3,2) = 1`; `gcd(2,2) = 2` allows a pointless conic | parity argument correct |
| 3.7 dimensions | `g = 2`: `m = 1,2,3`; hyperelliptic `g = 3`, `m = 2`; non-hyperelliptic `g = 4`, `m = 2` | `2,3,5` vs binary forms `2,3,4`; `6` vs `5 + 1`; `9` vs `10 − 1` | sound; `(2m−1)(g−1)` checked |
| 3.8 `dim I₂` | `g = 4, 5, 6` | `g(g+1)/2 − 3(g−1) = 1, 3, 6 = (g−2)(g−3)/2` | sound |
| `petri` hypotheses | `g = 6`, plane quintic | `δ = 0 ⟺ p_a = 6 = g ⟺` normalization iso `⟺` smooth over `k̄` | `hquintic` is the right exclusion |
| 4.2 Hilbert function | `m = d−3, d−2, d−1` | `C(m+2,2) − C(m−d+2,2) = dm + 1 − (d−1)(d−2)/2` fails at `d−3` by `1`, holds from `d−2` | threshold `m ≥ d − 2` exact |
| `Model.exists_generator` | `k[X]/I` | `Frac = F(T)`, dimension `2`, height-one prime in a UFD | principal; `deg G = deg D` by 2.7 |
| `IsSmoothPlaneEquation` | `X`; `0`; `Y²Z − X³`; `X² + aY² + bZ²` over `𝔽₂(a,b)` | unit ideal, `N = 0`; zero ideal; cusp common zero; Jacobian ideal `(G)` contains no `X_i^N`, yet the conic is regular with `δ = 0` | matches 4.3 and 9.2 (regular, not smooth) |
| 4.5 imperfect example | `𝔽₂(a)`, `y² = x³ + a` at `(x, y² − a)` | `𝔪 = (x)`, `r = 1`, `δ = 0`; after `√a`: `v² = x³`, `r = 2`, `δ = 1` | separability hypothesis needed and stated |
| 4.7 | `g = 2`, sextic | multiplicity `4` at `(0:1:0)`; `δ = 10 − 2 = 8 = 2g²`; odd case `2g² − 2g` | sound |
| 5.1 equality case | `0 < deg D < 2g−2`, `2ℓ = deg D + 2` | `i(D) = g − deg D/2 > 1`, special; `g ≥ 2` forced | hypotheses sufficient |
| 5.2 arithmetic | `(2,0,2,1)`, `(2,1,2,1)`, `(3,0,2,1)`, `(2,0,3,0)` | `3`, `5`, `4`, `2` | matches worked examples |
| 5.2(b) | `y² = x⁹ − 1`, `g = 4`; pointless-conic double cover | `[F:k(x²)] = 4 ≤ g`, even; degree `3` would give `g ≤ 2`, degree `2` would be `K₀` | sound |
| 5.2(e)(f) in characteristic `3` | degree-three pencil `k(z)` | purely inseparable would make `F` rational; swap roles so the Galois quotient is `F₁` | separability obtainable: R03 |
| 5.4 numbers | `g = 4, r = 1, d = 3`; `g = 0`, `(r,d) = (0,0), (1,0), (1,1)`; `g = 2, d = 100, r = 98, 99` | codim `4`, coefficient `0!/2!·1!/3! = 1/12`; `0 ≤ 0`, `2 ≤ 0` false, `0 ≤ 0` with `ℓ(P) = 2`; `0 ≤ 2` with `ℓ = 99`, `100 ≤ 2` false | `ρ ≥ 0 ⟺ 2d ≥ g + 2` for `r = 1`; bound `⌊(g+3)/2⌋ = 1, 2, 2, 3` for `g = 0..3` |
| 6.2, `hurwitz_fixedField_tame` | `k' = k` in the pin's formula | `geometricDegree F k F' = [F':F] = Nat.card H`; all places tame in characteristic `0` | true, library instantiation: R04 |
| 6.3 | hyperelliptic `g = 2`; bielliptic `g = 2`; `y²+y=x⁵` char `2` | `6`; `2`; one ramified point, different degree `6`, Hurwitz `2 = −4 + 6` | sound |
| 6.4 iff | `deg Fix = 2g − 2` | `2g + 2 − 4g_σ = 2g − 2 ⟺ g_σ = 1` | sound |
| 6.5 | `y³ = x⁷ − 1 /ℚ` | `8` branch points, `g = 6`; conjugation sends `σ ↦ σ⁻¹`: subgroup stable, generator not | R02 statements true; witness recorded |
| 6.6 | Picard `y³ = x⁴ − 1`; `y³ = x⁷ − 1`; `y³ = x³` | `5` branch points, `g = 3`; `8`, `g = 6`; cube, no degree-three extension | sound |
| 7.2 | rational point on `ℙ¹`, on genus `2`; degree-two point on an elliptic curve | `ℓ = 2`; `ℓ = 1 < 2`; `ℓ = 2`, threshold `g + 1 = 2` | sound; `(f)_∞ = P` exactly for a single place |
| 7.3 | rank-zero elliptic curve; positive rank | `J(k)` finite: AV-parametrization impossible; translate of `J` | matches Checks |
| 7.4 | `ℙ¹/ℚ`; `e = 2 ≤ d = 3`; `d = 0` | repeated class, gonality `1`; `2e = 4 ≤ 6`; empty set, premise false | sound |
| 7.6(c) | `J` simple, `d < g` | `B = J`, `Pic^d ⊄ W_d` since `dim W_d ≤ d < g` | sound |
| 8.3 area, 8.6 constants | `PSL₂(ℤ)`; `λ/24` | `π/3`; `1/128, 7/800, 325/32768, 1/96`; `X(7)`: `7/800·168 = 1.47 ≤ 3`; `X₁(17)`: index `288/2 = 144`, `325/32768·144 ≈ 1.43` | sound |
| 8.4 | round sphere, identity; plateau map | area `4π`, energy `8π`, `λ₁A = 2·4π`; atom `0.9`, barycentre component `≥ 0.8` | sound |
| 9.3 | closure of a Cartier divisor in a smooth model | flat, horizontal, finite locally free of degree `d`; `h⁰` upper semicontinuous | sound |
| Worked examples | Klein quartic `/𝔽₈`, `/𝔽₁₁`; Picard `/𝔽₇`; Hermitian `q = 3, 4`; nodal quartic; tacnode quartic | `24`; `12 = 11 + 1`; `3 + 2 + 6 + 1 = 12`, `12/8`; `28/10 → 3`, `65/17 → 4`; single node `x² − y²`, `g = 2`; `δ = 2`, `g = 1` | all recomputed |

**Seeded sample.** Texts read in the worker's cache (ids by their first eight characters):

| Target | Locator examined | Outcome |
|---|---|---|
| 1.5 | pin `Hyperelliptic/Basic.lean:76-84`, `:167-169`, `:207-211`; AlgebraicCurves `README.md:1314-1333` | predicate carries separability; the pin's iff and genus-two theorem carry `(2 : k) ≠ 0` as the README says; the perfect-field milestone exists in Layer 10 |
| 1.7 | poonen2007 (7e222607) lines 327-341, Prop. A.1(i)(ii), p.8 | matches; Poonen's curves are geometrically integral (footnote 1), the README's inequality is proved for every compositum |
| 1.9 | pin `WeierstrassGaps.lean:71`; AlgebraicCurves Layer 10 | no "hyperelliptic pole numbers" item; statement false over imperfect `k`: R01 |
| 2.1 | Fulton (937a5c2a) §4.2; pin `Finsupp` lattice | model divisor is the pointwise sup; Checks recomputed above |
| 2.3 | SchemeAndStackFoundations `README.md:1302` (§0.20, `nagata_normalization_finite`), `:3437` (§2.6), `:4713-4735` (§3.3) | finite normalization and `vectorBundle_riemann_roch` exist where cited |
| 2.5 | pin `ConstantExtension/RiemannRoch.lean:160` (`dim_conorm`, separable `k'/k`), `HighDegree.lean:65` | hypotheses match (perfect `k`) |
| 2.6 | Fulton §4.2 pp.46-47 (lines 1093-1214 region) | homogeneous fractions; cross-product criterion derived here, as the README says |
| 5.2 | AlgebraicCurves `README.md:1093-1095` (Castelnuovo 3.11.3 over perfect `k`); pin `RationalSubfield.lean:110`, `:154` | hypotheses as stated; `h2` unused in Lean: R03 |
| 6.3 | pin `Different/Tame.lean:320` (`tameDifferent k' F' hF`, top pair explicit), `Hurwitz.lean:72`, `:120` | argument order in the Lean matches (`tameDifferent k F (hF.fixedField H)`) |
| 6.7 | lmfdb `ag.cyclic_trigonal` (2ed74eb5) lines 90-92; `ag.bielliptic_curve` (ec0eb3e9) lines 90-98 | order-three subgroup with `ℙ¹` quotient; three "iff" conditions as the README reports |
| 7.5 | belov (2dd9e48c) lines 478-491 (Def. 4.1, Thm. 4.2, p.11), 525-553 (§4.1, pp.12-13) | definitions and finiteness as cited; repeated-class branch and finite-index subgroup of represented classes at lines 527-533, 546-551 |
| 8.3 | CongruenceSpectralGap (#1504 head) `README.md:172-178` (§0.2), `:219-225` (§0.4), `:315-321` (§0.7), `:826-834` (§5.3) | form core, Rayleigh identification, `inf({1/4} ∪ S_Γ)`, `21/100` all present |
| 8.6 | abramovich1996 (5ff2134f) lines 14-24, 141-142 | `7/800 D ≤ d_ℂ`, `λ₁A ≤ 8π d`, `1/96` under Selberg |
| 8.7 | poonen2007 lines 328-329, 340-341 | Lefschetz step as "standard specialization"; the README's `C¹_d` route is its own |
| 9.2 | SchemeAndStackFoundations `README.md:1956` (§0.30) | normal curves section exists |
| 3.8 (R16 follow-up) | saint-donat (7f7c0f4b, image-only scan; printed pages rendered from the cached PDF) printed pp.157, 165, 174-175 | theorem (1)–(3) with exceptions (i) plane quintic `g = 6`, (ii) trigonal; §3 assumes `g ≥ 4`; (4.11) Veronese, (4.12) scroll `F_n`, (4.13) `g = 3, 4, 5` as the README states |
| 3.7 | voight2022 (3a0e76dd) line 771 (eq. 2.3.2, printed p.14), §2.7 printed p.20 | relation keeps `h(x₁,x₂)y` |
| 4.5, 4.6 | Fulton lines 3522 (§7.4 Thm 2, p.91), 3937-3939 (§8.3 Prop 5, p.102), 4325-4358 (App. A, p.113) | as cited; Fulton's `k` is algebraically closed throughout |
| 7.2 | viray-vogt2024 (312c8f4b) lines 464-483 (Lemma 4.1.1, Cor. 4.1.2, pp.11-12) | `h⁰([x]) ≥ 2`, basepoint-free, `d ≥ g + 1` |
| 7.4 | abramovich-harris1991 (1efb8526) line 191 (Lemma 1, printed p.231) | `r(a) ≥ dim A` on `A₂` |
| 8.4 | yang-yau1980 (89993e76) lines 114-115 (§2 Proposition, p.58) | "non-constant holomorphic map of degree `d`" |
| Worked examples | ogg (65054846) lines 29, 298; derickx (d75c8794) lines 249-255 | nineteen hyperelliptic `X₀(N)`, largest `71`, including `41, 47, 59, 71`; `X₁(N)` table |

**Pinned declarations opened** (Tau Ceti `358314d4`, Mathlib as pinned): `IsHyperellipticFunctionField` (`Hyperelliptic/Basic.lean:76`), `Divisor.IsRiemannRochDivisor` (`RiemannRoch/Uniqueness.lean:89`, the RR identity for all `D`), `exists_isRiemannRochDivisor` (`CanonicalDivisor.lean:412`), `hurwitz_genus_formula` (`Hurwitz.lean:72`, separable `F'/F` and `k'/k`), `two_mul_genus_sub_two_eq_iff_forall_isTame` (`:120`), `tameDifferent` (`Tame.lean:320`), `isTame_of_charZero` (`:203`), `dim_conorm` (`ConstantExtension/RiemannRoch.lean:160`), `IsFunctionField.fixedField` (`Automorphism/FixedField.lean:35`), `finrank_fixedField_eq_natCard` (`Galois/FixedField.lean:304`), `mem_adjoin_of_finrank_adjoin_le_genus` and `adjoin_eq_adjoin_of_finrank_adjoin_eq_two` (`RationalSubfield.lean:110`, `:154`, no hypothesis on `k`), `IsPoleNumber` (`WeierstrassGaps.lean:71`), `degree_poles` (`ProductFormula.lean:234`), `constantCompositum` (`GeometricDegree.lean:96`), `finiteDimensional_algebraicClosure` (`ConstantField.lean:109`), `Divisor.dim` (`RiemannRoch/Basic.lean:99`), `conorm` (`Divisor/Conorm.lean:127`).

**Cross-roadmap citations resolved** (on main or at the open head given): AlgebraicCurves Layers 8, 10, 11, 12 (`README.md:870`, `:1193`, `:1396`, `:1468`; 12B.0b geometric integrality `:1597`, 12B `:1670`); JacobianChallenge Layers B–F (`:135-448`, semicontinuity `:175`, symmetric powers `:203`, Poincaré bundle `:224`); SchemeAndStackFoundations §§0.3, 0.11, 0.19–0.21, 0.30, 2.6, 3.2 (`lineBundle_degree_bounds`, `:4687`), 3.3 (`vectorBundleDegree_pullback` `:4723`, `vectorBundle_riemann_roch` `:4735`), 3.6, 3.7 (`abelMaps_highDegree` `:4958`, surjective as a scheme morphism only), 5.3–5.8; HeightsRationalPointsAndObstructions (#1017) §4.3 `finite_nonconstant_hom` `:2017`, §5.9 `rationalPointsClosure_cosets` `:2412`, Layer 1 `:521`, §4.6 `mordell_finite` `:2049` (R05a); MotivesAndAlgebraicCycles (#1313) §0.4 algebraic equivalence `:120`, §0.5 adequate and numerical relations with `I ⊆ Num` `:135`; CongruenceSpectralGap (#1504) as in the sample; AlgebraicTopology `:393-406` (R05c); ModularForms 10A `:1052`, 10B `:1068`; FuchsianOrbifolds Layers 2 `:235`, 4 `:286`; StableReduction Layer 0 `:343`; ModularCurves §0A `:238`.

**Ownership.** No other `Suggested.lean` on main or at the 439 open heads declares `gonality`, `Model` (HyperellipticCurves #1707 declares `TauCetiRoadmap.HyperellipticCurves.Model (R) (g)`, a different name and object), `IsBasePointFree`, `IsVeryAmple`, `canonicalModel`, `IsSmoothPlaneEquation`, `IsBielliptic`, `IsCyclicTrigonal` or `IsP1Parametrized`; the namespace is unique. The siblings at their heads defer models, gonality and isolated points to this roadmap (AdelicImagesAndModularCurves `README.md:122-123`, `:215-216`; QuaternionArithmetic `:91-92`, `:2194`; HyperellipticCurves `:208`). One note for coordination, not a finding here: GroupActionsOnRiemannSurfaces (#1728) `README.md:1654` lists this roadmap as a *consumer* of its fixed-point formulas, while this README consumes nothing from it and lists it as a consumer of Layer 6; the two READMEs should agree on the direction. No declared gaps (no `design/plan.json`).

## Not verifiable

- Stichtenoth (all cited theorems), Hartshorne IV.3.1/IV.5.2/IV.5.4/Examples 5.5.1–5.5.3, ACGH III §§2–3 and V 1.1, Forster Thm. 8.12, Serre IV §11, Fulton *Intersection Theory* 14.4, Frey Prop. 2, Li–Yau Thm. 1, Hersch 1970, Kleiman–Laksov, Kempf, Mattuck, Selmer 1951, Kato 2004 (the rank-zero step of the Klein-quartic example): no legal text in the cache; the previous review's service lookups found publisher-only results. Cited by locator only.
- The LMFDB knowls `columns.modcurve_models.model_type`, `modcurve.gonality` and `ag.isolated_point`: the cached pages are reCAPTCHA interstitials with no content, so the model-type codes of §9.4 and the isolation codes of §7.6 were not checked against the knowl text (they are data, and no theorem depends on them).
- The Klein-quartic worked example's isogeny class over `ℚ(ζ₇)⁺`, the value `L(E/ℚ(ζ₇)⁺, 1) ≈ 0.516` and the rank-zero conclusion; the `X₁(17)` canonical-model description. The `𝔽₁₁` count `12 = 11 + 1` and `11 + 1 − 3·4 = 0` were recomputed.
- The `k̄`-gonality values of individual LMFDB records in the worked examples (labels are data).

## Source issues

- **Error** in saint-donat at the unnumbered theorem, part (2), printed p.157: the source says the kernel of the canonical ring map is generated in degrees two and three for every non-hyperelliptic genus at least three; it should exclude genus three, where the kernel is generated by a quartic; affects a stated result; corrected in print at (4.13), printed p.175.
- **Error** in lmfdb-ag-bielliptic_curve at the definition, unpaginated, lines 90-96: the source lists a geometric double cover of an elliptic curve, a ground-field involution with a pointed genus-one quotient, and a ground-field involution with exactly `2g − 2` fixed points as equivalent conditions; they are not (a pointless quotient, an involution not defined over `k`), and the fixed-point count needs tameness; affects a stated result.
- **Misprint** in belov at the proof of Theorem 4.3(1), printed p.12, line 503: the source puts the second point `y′` in `Sym^d C` although `y` is a point of `D`; it should be `Sym^d D`; affects nothing.
