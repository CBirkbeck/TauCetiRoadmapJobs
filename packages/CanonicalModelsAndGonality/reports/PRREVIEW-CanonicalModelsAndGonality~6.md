# Review of CanonicalModelsAndGonality (pull request #1726 at 7fc9455)
**Verdict:** needs changes

## R01 (P2) — §6.4 states “(ii) ⟹ (iii)” without the characteristic hypothesis, and it fails in characteristic two

**Location:** `TauCetiRoadmap/CanonicalModelsAndGonality/README.md:1489–1490`: “record `(ii) ⟹ (iii) ⟺ IsBielliptic k F ⟹ (i)` (the middle equivalence for `(2 : k) ≠ 0`)”.

**Claim:** In characteristic two a bielliptic involution is wildly ramified, so it has fewer than `2g − 2` fixed points. Condition (ii) therefore does not imply (iii), yet the sentence restricts only the middle equivalence.

**Witness:** Over `𝔽₂`: `E : v² + v = u³`, `F = E(w)`, `w² + w = v`. `v` has only a triple pole, at `O`, so `d_O = 4`, `g = 3`. `w ↦ w + 1` meets (ii) (`O ∈ E(𝔽₂)`) but fixes one point, not 4.

**Repair:** Replace the sentence with: “record, for `(2 : k) ≠ 0`, `(ii) ⟹ (iii) ⟺ IsBielliptic k F`, and in every characteristic `(ii) ⟹ IsBielliptic k F ⟹ (i)`”. Add the Check: “Over `𝔽₂`, `w² + w = v` over `v² + v = u³` has `g = 3`, and `w ↦ w + 1` has a pointed genus-one quotient but one fixed point, not `2g − 2 = 4`.”

## R02 (P2) — §8.2 re-plans BelyiMaps §§9.2–9.4 (on main): `M(X)`, its exact constants and the degree theorem

**Location:** `TauCetiRoadmap/CanonicalModelsAndGonality/README.md:1783–1788`: “`M(X)`, the field of meromorphic functions, is a function field over `ℂ` and, for every nonconstant `f`, `[M(X) : ℂ(f)] = deg f` (Forster Thm. 8.12 gives `≤` … ). Hence `IsFunctionField ℂ (M(X))`, `IsIntegrallyClosedIn ℂ (M(X))`”.

**Claim:** BelyiMaps, on main, owns these objects. §8.2 plans them again by its own route (Forster plus ModularForms 10B) and cites BelyiMaps nowhere in the README. It also does not cite the half that Tau Ceti already proves at the pin.

**Witness:** `TauCetiRoadmap/BelyiMaps/README.md:3581–3585` (main): `M(X)` has degree exactly `n` over `ℂ(t)`. Lines `:3533–3535` and `:3684–3685` give its exact constants. Tau Ceti has `MeromorphicFunction.natDegree_minpoly_ratFunc_le` (`RiemannSurface/FunctionField/Degree.lean:352`).

**Repair:** Replace lines 1783–1788 with: “`IsFunctionField ℂ (M(X))`, `IsIntegrallyClosedIn ℂ (M(X))` and `[M(X) : ℂ(f)] = deg f` for every nonconstant `f` are BelyiMaps §§9.2–9.4 (the first half is Tau Ceti `TauCeti.RiemannSurface.MeromorphicFunction.natDegree_minpoly_ratFunc_le`). Hence ***gonAn X = gonality ℂ (M(X))***”. Set *Needs:* to “§8.1; BelyiMaps §§9.2–9.4; Tau Ceti `RiemannSurface.MeromorphicFunction`”. List BelyiMaps §§9.2–9.4 under *Consumed, not redefined* and *From named roadmaps*.

## R03 (P2) — The hgcwa `hyperelliptic`/`cyclic_trigonal` columns have two owners with different meanings

**Location:** `TauCetiRoadmap/CanonicalModelsAndGonality/README.md:1574–1578`: “(the hgcwa setting, `k = ℂ`) and a finite `G ≤ F ≃ₐ[k] F` …: `hyperelliptic` is `IsHyperellipticFunctionField k F` … `cyclic_trigonal` is `IsCyclicTrigonal k F`”. The same claim is at `:68` (“the hgcwa booleans”, *Owned here*), `:172–174` and `:2010–2011`.

**Claim:** GroupActionsOnRiemannSurfaces (#1728) also owns these columns, and its owned-here list includes “the hgcwa record semantics”. It reads them on the generic member of a family, and it names this roadmap as its consumer. A single-curve predicate is not constant on such a family.

**Witness:** #1728's `TauCetiRoadmap/GroupActionsOnRiemannSurfaces/README.md:130–131` (columns → its 6.2–6.4), `:245–248` (generic member), `:1696` (this roadmap as consumer). `C₂`, `(1; 2⁴)`, genus 3: Fermat quartic, `z ↦ −z` (not hyperelliptic); `y² = x⁸ + 3x⁴ + 1`, `x ↦ −x` (hyperelliptic).

**Repair:**
- Replace the paragraph at `:1574–1580` with: “The hgcwa columns `hyperelliptic`, `cyclic_trigonal` and `g0` are GroupActionsOnRiemannSurfaces' (its §§6.3, 6.4 and 4.1), read on the generic member of a family. This roadmap supplies, for each member `F` with `G ≤ F ≃ₐ[ℂ] F`, the predicates `IsHyperellipticFunctionField ℂ F` and `IsCyclicTrigonal ℂ F`, the quotient genus by 6.2, and the uniqueness 5.2(f) that its §6.4 uses. The two readings differ on special members: in signature `(1; 2⁴)` in genus 3, the Fermat quartic is not hyperelliptic and `y² = x⁸ + 3x⁴ + 1` is.”
- Delete “the hgcwa booleans” at `:68`.
- At `:2010–2011`, write “the hgcwa columns are GroupActionsOnRiemannSurfaces' (6.7)”.

## R04 (P3) — Results already proved at the Tau Ceti pin are deferred to AlgebraicCurves Layer 10 or planned as targets

**Location:** `TauCetiRoadmap/CanonicalModelsAndGonality/README.md:511–512`: “(AlgebraicCurves Layer 10, perfect-field genus-two criterion; the pin's `isHyperellipticFunctionField_of_genus_eq_two` assumes `(2 : k) ≠ 0`)”. Also `:742–743`: “the grading and comparison with the section ring `⊕_m L(mD)` are targets here”.

**Claim:** The pin has the perfect-field genus-two criterion, separability of prime-degree pencils, the smooth-plane genus formula and the section ring. §§1.5, 1.9, 3.4, 5.2, 4.3, 2.3 and 2.7 attribute these to AlgebraicCurves Layer 10 or plan them here.

**Witness:** At Tau Ceti `2fd255d`:
- `isHyperellipticFunctionField_of_genus_eq_two_of_perfectField` (`Hyperelliptic/Basic.lean:234`)
- `isSeparable_adjoin_of_finrank_prime` (`Consequences/GenusZero.lean:226`)
- `two_mul_genus_eq_of_aeval_eq_zero` (`PlaneCurve/Genus.lean:52`)
- `Divisor.sectionRing` (`RiemannRoch/SectionRing.lean`)

**Repair:**
- §1.5(c): cite Tau Ceti `TauCeti.isHyperellipticFunctionField_of_genus_eq_two_of_perfectField`.
- §1.5(b), §1.9 (`:639`), §3.4 (`:968`) and §5.2 (`:1307–1308`): cite `TauCeti.isSeparable_adjoin_of_finrank_prime` instead of the Layer 10 separability milestone, and in §1.5(b) also `TauCeti.isHyperellipticFunctionField_iff_two_le_genus_and_exists_finrank_adjoin_eq_two`.
- §4.3 (`:1148`): cite `TauCeti.two_mul_genus_eq_of_aeval_eq_zero` (chart form).
- §2.3: write “the section ring is Tau Ceti's `TauCeti.Divisor.sectionRing D`, graded by `sectionRingGrade D`; the comparison `R̃_m = L(mD)` is the target here”. Cite it in §2.7 as well.
- List all five names under *From Tau Ceti*.

## R05 (P3) — Two Tau Ceti citations do not resolve at the pin

**Location:** `TauCetiRoadmap/CanonicalModelsAndGonality/README.md:1417`: “with exact constants (`isIntegrallyClosedIn_intermediateField`)”, also at `:104` and `:1433`. `README.md:1016`: “`TauCeti/FieldTheory/FunctionField/Consequences/GenusZero.lean:95`”.

**Claim:** The first name is declared in neither pinned library. The theorem cited at `GenusZero.lean:95` is at line 120 at the pin.

**Witness:** No `isIntegrallyClosedIn_intermediateField` in Mathlib `1b1ccf4` or Tau Ceti `2fd255d`; Tau Ceti `Automorphism/HurwitzBound.lean:95` proves the fact as `E.val.isIntegrallyClosedIn E.val.injective hex`. `GenusZero.lean:120` declares the cited theorem; line 95 lies inside another proof.

**Repair:** At `:104`, `:1417` and `:1433`, replace the name with “Mathlib `AlgHom.isIntegrallyClosedIn` (`Mathlib/RingTheory/IntegralClosure/IntegrallyClosed.lean:82`) applied to the inclusion `(fixedField H).val`”. At `:1016`, write `GenusZero.lean:120`.

## Previous findings

- R01 (Layer 8 headlines): repaired. `Suggested.lean:640–660` states `analyticGonality`, `analyticGonality_eq_gonality` and `le_analyticGonality_compactifiedQuotient`. The docstring (`:45–49`) now lists only §8.4, §8.5 and the *SelbergBound* form as not statable.
- R02 (`arithmeticGenus` chose its datum): repaired. `Suggested.lean:268–272` uses `Nat.find h`.
- R03 (`canonicalField` chose a divisor): repaired. `Suggested.lean:328–331` defines `canonicalField (k F)` as the union over all `W`.
- R04 (old pin hash, §8.4 lemmas): repaired. `README.md:305` reads “At the pin,” and `:344–348` lists both divergence-theorem lemmas.
- R05 (G4 scope): repaired at `:144–147`, `:387–391` and `:746–750`: “for the coordinate ring `S/I`, agreement of `(S/I)_m` with `Γ(X, 𝒪_X(m))`”.
- R06 (Yang–Yau locator): repaired at `:1855–1856`: “Yang–Yau 1980, §2, Proposition, p. 58, with the energy `d · 8π/3` of each coordinate on pp. 59–60”.
- R07 (milestone count): repaired. The description says 61, and the head has 61 `### k.n` headings (`10, 7, 9, 7, 4, 7, 6, 7, 4`).

## Verified sound

| Statement | Instances tried | Values computed on each side | Result and change |
|---|---|---|---|
| 1.1 `gonality` | `k(t)`; `k(s,t)`; genus-2 field | `t` gives rank 1, so 1; for `k(s,t)` every finrank is 0, so `sInf = 0`; genus 2: canonical pencil gives 2, and 1 would mean rational | Matches lmfdb-ag.gonality line 90 and poonen-2007 lines 16–17. Positivity needs `hF`. Keep |
| 1.2 `gonality_eq_sInf_degree` | `k(t)`; genus-1 curve of index 3 | `(t)_∞` has degree 1, so 1 = 1; least degree with `ℓ ≥ 2` is 3, so 3 = 3 | Equal. Keep |
| 1.4 genus 0 and 1 | `ℙ¹`; real conic; elliptic curve; Selmer cubic | index 1, 2, 1, 3; `if index = 1 then 1 else 2` gives 1, 2; `max 2 index` gives 2, 3 | True: `deg(−W) = 2` forces the index to divide 2 in genus 0. Keep |
| 1.6–1.7 finite maps, constant extensions | `F' = F(√·)` of degree 2; real conic to `ℂ`; `ℚ̄(t)` to `ℂ(t)` | `gon F ≤ gon F' ≤ 2 gon F`; `1 ≤ 2` (strict); `1 = 1` | Matches Poonen A.1(i), (ii), (vii) (poonen-2007 lines 328–337). Keep |
| 1.8 point counts | `ℙ¹/𝔽₂`; Klein/𝔽₈; `y²+y=x⁵`/𝔽₂; Picard/𝔽₇; Hermitian, `q = 3` | counts recomputed: 3, 24, 3, 12, 28; bounds 3, 27, 6, 24, 30 | True. Klein with gonality 2 would give `24 ≤ 18`, which is false. Keep |
| 1.10 `gonality_eq_finrank_mul_…` | `F = K(t)` with `[K:k] = 2` | `gon_k = 2` and `[K:k]·gon_K = 2·1` | True without `hex`. Keep |
| 2.2 Hilbert function | `(t,1)`; `(t²,t,1)`; cusp `(1,u,u³)` | `m+1`; `2m+1`; `3m` (exponent `3m−1` missing), normalization `3m+1` | Checks recomputed; the ideals are `0` and `(XZ−Y²)`. Keep |
| 2.3 `arithmeticGenus` | line; smooth cubic; smooth quartic; cusp | `Nat.find` gives 0, 1, 2, 1; `p_a` = 0, 1, 3, 1; `δ` = 0, 0, 0, 1 | Choice-free definition gives the README values. Keep |
| 2.5 base-point-free and very ample bounds | place of degree `e`, `deg D = 2g`; elliptic `2O`, `3O` | `ℓ(W−D+P) ≤ e−1 < e`; for `3O − E`: `ℓ = 1 = 3−2`; for `2O − fibre`: `ℓ = 1 ≠ 0` | True at places of every degree; the `2g+1` threshold is sharp. Keep |
| 3.2 canonical system base-point-free | `g ≥ 1`, place of degree `e` | Clifford gives `ℓ(P) ≤ e`, so `ℓ(W−P) ≤ g−1 < g` | True; `g = 0` excluded since `ℓ(W) = 0`. Keep |
| 3.4 `noether`, `noether_iff_canonicalField` | genus 2; Klein quartic | genus 2: all four conditions false; Klein: very ample, gonality 3, canonical field `⊤` | Consistent. Keep |
| 3.5 `finrank_canonicalField_eq_two` | `y²=x⁹−1`, `g = 4` | `W ∼ 3(x)_∞`, `L(W) = ⟨1,x,x²,x³⟩`, ratios generate `k(x)`, index 2 | True without perfectness. Keep |
| 3.6 even genus | `g = 2, 4, 3` | `index K₀ ∣ gcd(g−1, 2)` gives 1, 1, 2 | True. Locator wrong (R05) |
| 3.7 `noether_projectiveNormality` | non-hyperelliptic genus 4, `m = 2` | `ℓ(2W) = 9`; `dim Sym² L(W) = 10`; kernel is one quadric | Surjective. Keep |
| 3.8 `petri`, `petri_quadrics_and_cubics` | `g = 3` quartic; `g = 4`; nontrigonal `g = 5` | `g = 3` excluded by `4 ≤ g`; `g = 4`: `(Q, C)` and `petri` vacuous (trigonal); `g = 5`: 3 quadrics | `(g−2)(g−3)/2` = 1, 3. Keep |
| 4.1 `Model.exists_generator` | constant field `k(α)`, model `(t, α, 1)`; conic | degree of `∞` is 2, the degree of `Y² + aYZ + bZ²`; conic: `XZ − Y²` of degree 2 | Holds without `hex`. Keep |
| 4.2–4.3 genus–degree formula | nodal quartic; tacnodal quartic; `Y²Z⁴ = X⁶ + Z⁶` | `2g = 6 − 2·1 = 4`; `6 − 2·2 = 2`; `20 − 2·8 = 4` | Genera 2, 1, 2 as stated. Keep |
| 5.1 Clifford equality | `g = 2`, `deg D = 1`; hyperelliptic `g = 3`, `D₂` | `2ℓ = 3` impossible by parity; `2·2 = 2 + 2`, hyperelliptic | `D` is special automatically, since `ℓ(W−D) = 0` would force `deg D = 2g`. Keep |
| 5.2 Castelnuovo corollaries | `(n₁,g₁,n₂,g₂)` = (2,0,3,0), (3,0,3,0), (2,1,2,1), (2,1,3,0), (2,0,2,1) | bounds 2, 4, 5, 4, 3, against the hypotheses `g ≥ 3, 5, 6, 5` and conclusion `≤ 3` | Each hypothesis exceeds its bound by one. Keep |
| 5.4 Brill–Noether | `(g,r,d)` = (0,0,0), (0,1,0), (4,1,3), (1,1,5) | `0 ≤ 0`, `ℓ = 1`; `2 ≤ 0` false; `4 ≤ 4`, coefficient `1/12`, `θ⁴/12 = 2`; `−6 ≤ 1`, `ℓ = 5` | True, including `g − d + r < 0`. `⌊(g+3)/2⌋` = 2, 3, 3, 4. Keep |
| 6.1 quotient | trivial `H`; `t ↦ −t`; `S₃` on `k(t)` | degrees 1, 2, 6 = `Nat.card H` | True. Cited name does not exist (R05) |
| 6.3–6.4 Lean (with `h2`) | `y²=x⁶+1` with `x ↦ −x`, with `ι`; elliptic 2-torsion translation | `deg Fix` = 2, 6, 0 = `2g+2−4g_H` | True. Unconditional README chain false (R01) |
| 6.5 descent | `g = 6` bielliptic; double cover of a pointless conic | unique involution, hence Galois-stable; `ι` unique, quotient a genus-0 conic over `k` | True; `g = 5` excluded (bound 5). Keep |
| 6.7 hgcwa (R03) | `C₂`, `(1;2⁴)`, `g = 3`: Fermat quartic; `y² = x⁸ + 3x⁴ + 1` | 4 fixed points each; `IsHyperellipticFunctionField`: false, true | Not a family invariant. R03 |
| 7.2 | rational point in genus 2; degree-2 point in genus 1 | `ℓ(P) = 1 < 2 = gon`; `ℓ = 2`, `deg P = 2 ≥ g + 1` | True. Keep |
| 7.3 definitions | BELOV Def. 4.1, p. 11 (belov lines 478–485) | `ℙ¹`-isolated iff `ℓ(P) = 1`; positive rank iff `B(k)` infinite (Mordell–Weil) | Agrees. Sporadic ⟹ isolated is Thm. 4.2(1), line 490. Keep |
| 7.4 Frey | `X₀(37)` with `d = 2`; `ℙ¹` with `d = 1`; `d = 0` | `2 ≤ 4`; `1 ≤ 2`; premise empty | True. Keep |
| 7.6 criteria | `J(k)` finite; `J` simple with `d < g`; `2 deg P < gon` | no infinite `B(k)`; `a_d(P) + J = Pic^d ⊄ W_d` (`dim ≤ d`); 7.4 gives `gon ≤ 2d` | True; §4.1 of BELOV is pp. 12–14 (lines 525–638). Keep |
| 8.2 `analyticGonality_eq_gonality` | `ℙ¹`; elliptic curve; genus 2 | `gonAn` = 1, 2, 2; `[M : ℂ(f)]` = 1, 2, 2 | True. Ownership: R02 |
| 8.4 Li–Yau (not statable) | round `S²`; square torus | `8π = 8π`; `39.48 ≤ 50.27` (with 1 in place of `gonAn`, 25.13 fails) | True; yang-yau-1980 line 114 (p. 58), line 160 (p. 60). Keep |
| 8.6 `le_analyticGonality_…` | `SL₂(ℤ)`, `Γ(2)`, `Γ(3)`, `Γ(7)` | `withCenter.index` 1, 6, 12, 168; bound 0.009, 0.053, 0.105, 1.47; `gonAn` 1, 1, 1, 3 | True; `Γ(3)`: plain index 24, not 12. Matches abramovich-1996 lines 14–17. Keep |
| 9.1 closed immersions | `ℙ¹` with `O(1)`; elliptic `2O`, `3O`; quartic `K+P`; `D = 0` | yes; no, yes; excluded since `ℓ = 3 = ℓ(D−P)`; constant map to `ℙ⁰` | Matches Fulton Ex. 8.33(b)–(c), p. 110 (fulton-curves lines 4231, 4242–4255). Keep |
| 9.4 model codes | LMFDB `web_curve.py` lines 31–38, 603–614, 729 | 0, 2, −2, 5, 7, 8 and `j = 1728E₄³/(E₄³−E₆²)` agree | Codes 1 and 3 are not in that file (see Not verifiable) |
| R04: 1.5(c) | genus 2 over a perfect field of characteristic 2 | the pin's `…_of_genus_eq_two_of_perfectField` gives hyperelliptic | Deferral to AlgebraicCurves stale. R04 |

- **Gate:** the worker's gate passes at 7fc9455 (every count 0). My rerun has the same counts plus `depcheck: NOT IN ORDER`, which comes from the default order. With the candidate order: `depcheck: 205 roadmaps, 1896 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. Nothing changes outside the folder.
- **Elaboration:** `lake env lean Suggested.lean` exits 0 with 50 `sorry` warnings, one per theorem, and nothing else. The file has 68 declarations; the 1.6 theorems keep `[FiniteDimensional F F']`. One-tactic probe (`rfl`/`simp`/`infer_instance`/`omega`/`decide`/`norm_num`/`trivial`/`aesop`): 0 of 50 theorems close.
- **Sources (14 locators):** poonen-2007 lines 41, 327–381; belov lines 478–491, 525–638; abramovich-1996 lines 14–17 and 23–24; yang-yau-1980 lines 114, 160; fulton-curves lines 4231, 4242–4255; lmfdb-ag.gonality line 90, lmfdb-ag.bielliptic_curve lines 90–96, lmfdb-ag.isolated_point line 90; LMFDB `web_curve.py` lines 31–38, 603–614, 729.
- **Library declarations opened (Tau Ceti `2fd255d`):**
  - `RiemannRoch/Uniqueness.lean:89`; `Differential/CanonicalDivisor.lean:459`
  - `Hyperelliptic/Basic.lean:87, 211, 223, 234`; `Hyperelliptic/RationalSubfield.lean:113, 152`
  - `Consequences/GenusZero.lean:120, 226`; `Consequences/Castelnuovo.lean:585`; `ConstantExtension/RiemannRoch.lean:242`; `GeometricDegree.lean:115`
  - `RiemannSurface/Degree.lean:121, 134`; `RiemannSurface/FunctionField/Degree.lean:352, 378`; `Fuchsian/Compactification/Basic.lean:75`
  - `ProjectiveSpecialLinearGroup.lean:56, 174`; `GroupTheory/Index/Basic.lean` (`withCenter`); `RiemannRoch/SectionRing.lean`; `PlaneCurve/Genus.lean:52`; `RingTheory/GradedAlgebra/Veronese.lean` (no Veronese graded algebra, as the docstring says)
- **Library declarations opened (Mathlib):** `Galois/Basic.lean:92, 220`; `IntegrallyClosed.lean:82`; `Fixed.lean:379`; `CongruenceSubgroups.lean:164`.
- **Cross-roadmap citations (9 resolved):**
  - MinimalSurfaces 10.3 and 10.4 at #2226 (lines 1930–1990; its hypotheses match the contract at `:399–405`).
  - HeightsRationalPointsAndObstructions §5.9 and §1.7 at #1017; MotivesAndAlgebraicCycles §§0.4–0.5 at #1313; CongruenceSpectralGap §§0.2, 0.4, 0.7 and 5.3 at #1504.
  - GroebnerGeometry G4, RiemannianGeometry/Surfaces and AlgebraicCurves on main.
  - ModularCurves §0A through #2140's former-label table (lines 4495–4504), so the overlap lead needs no change.
- **Overlap check:** read AlgebraicCurves (main and #1808), AdelicImagesAndModularCurves (#1727), GroupActionsOnRiemannSurfaces (#1728), HyperellipticCurves (#1707), BelyiMaps (main) and GeometricFreyMazur (#2130). Shared objects and their owners:
  - Castelnuovo's inequality and the smooth-plane genus: AlgebraicCurves, cited here.
  - `M(X)` and the degree theorem: BelyiMaps (R02).
  - hgcwa column semantics: two owners (R03). Trigonal uniqueness for `g ≥ 5`: this roadmap's 5.2(f), re-proved in GroupActionsOnRiemannSurfaces 6.4.
  - Models, isolation, Frey and Abramovich: this roadmap; AdelicImagesAndModularCurves and GeometricFreyMazur consume them, the latter with distinct qualified names.
  - HyperellipticCurves owns nothing this roadmap states.

## Not verifiable

- These texts are paywalled; earlier lookups through the sources service found no legal copy, and they were not re-requested:
  - Stichtenoth (Prop. 1.6.3, Cor. 3.1.12, Thm. 3.11.3, Lemma 6.2.2, Prop. 6.2.4) and Hartshorne IV.3.1, IV.5.2, IV.5.4.
  - ACGH V 1.1, Kempf 1971, Kleiman–Laksov 1972 and Mattuck 1961 (the §5.4 locators).
  - Forster 8.12, Li–Yau Thm. 1 and Selmer 1951.
- `columns.modcurve_models.model_type`: the cached knowl is a reCAPTCHA page, and `web_curve.py` does not contain domain code 1 (`ℙ¹`) or codomain code 3 (`j − 1728`).
- Klein-quartic worked example: the isogeny over `ℚ(ζ₇)⁺` and `L ≈ 0.516` were not checked; the `𝔽₁₁` count (12) was recomputed.
- Abramovich's printed IMRN version: only arXiv alg-geom/9609012v1 was read.

## Source issues

- **Misprint** in belov at the proof of Theorem 4.2(2), printed p. 14, belov line 630: the source says Riemann–Roch gives `ℓ(P) = d − g + 1` for `d > g + 1`; it should be `ℓ(P) ≥ d − g + 1`, with equality only for `d > 2g − 2`; affects nothing.
