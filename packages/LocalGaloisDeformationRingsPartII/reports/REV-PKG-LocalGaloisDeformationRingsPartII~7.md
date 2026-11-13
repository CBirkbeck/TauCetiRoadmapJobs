<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12941#issuecomment-6851369594 -->
Review (claude) of 66adc07

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) gap:tame-types-unramified names the wrong Deligne–Lusztig representation

   **Location.** `README.md` line 64: "a tame inertial type `τ ≅ τ(s,μ+η)` with `μ` 1-deep, … its identification with the inflation of the Deligne–Lusztig representation `R_s(μ)` of `GL₂(𝔽_q)`". The same sentence is the `needs` of the gap in `design/plan.json`.

   **Claim.** `σ(τ(s, μ+η))` is the inflation of `R_s(μ)`.

   **Witness.** `LLHL19 lines 549–550` (Corollary 2.3.5, p. 15): `σ(τ(w,μ))` is `R_w(μ)`, the type's own label; so here `R_s(μ+η)`. `f = 1`, `p = 7`, `s = 1`, `μ = (1,0)`: `τ = ω̃² ⊕ 1`, but `R_1((1,0))` has type `ω̃ ⊕ 1`.

   In detail: `BHHMS23 line 733` (proof of Proposition 2.4.3, p. 16) uses the same labelling. The two gaps that 0.5 composes therefore disagree. For `τ = τ(sw^{−1}, μ − sw^{−1}ν)` the first gives `R_{sw^{−1}}(μ − sw^{−1}ν − η)`, and gap:deligne-lusztig-reduction (line 84) reduces `R_{sw^{−1}}(μ − sw^{−1}ν)`.

   **Repair.** Replace `R_s(μ)` by `R_s(μ+η)` in the gap, in the README and in `design/plan.json`. The full sentence, which also carries R02, is under R02. Tested on the instance: `R_1((2,0))` is the principal series of `ω̃² ⊕ 1`, which is `τ`; in 0.5 both gaps now speak of `R_{sw^{−1}}(μ − sw^{−1}ν)`.

2. **F02** (P2) 4.3 and 7.2 use `σ(τ)` for every tame type; the gap supplies it only for 1-deep ones

   **Location.** `README.md` line 479 (4.3): "for any tame inertial type `τ`, `JH(σ̄(τ) ⊗ (N_{k/𝔽_p} ∘ det)) ∩ W(ρ̄) ≠ ∅` if and only if `τ ≅ τ_{w̃}`". Line 712 (7.2): "some tame type `τ` with `σ ∈ JH(σ̄(τ) ⊗ N_{k/𝔽_p} ∘ det)`". Line 64: "with `μ` 1-deep". Line 63: "stated there for `GL₂(ℤ_p)` and, in the supercuspidal case, for every nonarchimedean `F`".

   **Claim.** `σ̄(τ)` is defined for every tame inertial type of `K`, and the route of 4.3 may treat `σ(τ)` as a constituent of `P̃_σ[1/p]`.

   **Witness.** `f = 2`, `τ = 1 ⊕ 1`: not supercuspidal, `K ≠ ℚ_p`, and a scalar type has no 1-deep presentation (its root coordinates are `0` or `p − 1`). No supplier section and no gap defines `σ(τ)`, yet 4.3 quantifies over it.

   In detail: the route of 4.3 also needs `σ(τ)` to be inflated from `GL₂(k)`, which nothing states. The Check of 0.5 on scalar types uses the Steinberg twist of §4.4, whereas `BHHMS23 lines 593–596` (§2.2, p. 13) takes `χ ∘ det`.

   **Repair.**

   - Line 64 and the `needs` of `tame-types-unramified` in `design/plan.json`, replace the sentence after the colon by: "for `K/ℚ_p` unramified of degree `f` and every tame inertial type `τ` of rank two (`τ ≅ τ(s,μ+η)` for some `s ∈ S₂^f` and `μ ∈ (ℤ²)^f`), the type `σ(τ)` of `GL₂(𝒪_K)` in the normalization of BHHMS23 §2.2 (pp. 13–14; for scalar `τ = χ ⊕ χ` it is `χ ∘ det`, the `σ^cr(τ)` of §4.4) with its occurrence property, the fact that it is inflated from an irreducible representation of `GL₂(𝔽_q)`, the twist rule `σ(τ ⊗ χ) ≅ σ(τ) ⊗ (χ ∘ det)` and a lattice-independent semisimplified reduction `σ̄(τ)`; and, when `μ` is 1-deep, its identification with the inflation of the Deligne–Lusztig representation `R_s(μ+η)` of `GL₂(𝔽_q)` (BHHMS23, proof of Proposition 2.4.3, p. 16)."
   - Line 163 (0.5, second Check), replace "there `σ(τ)` is a twist of the Steinberg type (PadicLocalLanglandsForGL2Qp §4.4)" by "there §4.4 has two types, the Steinberg twist `σ(τ)` and `σ^cr(τ) = χ ∘ det`, and the normalization used here is the second (BHHMS23, §2.2, p. 13); its reduction is a one-dimensional weight, which is not in `W(ρ̄)`".

   Tested on the witness: for `f = 2` and `τ = 1 ⊕ 1` the gap now supplies `σ(τ) = 1`, inflated from `GL₂(𝔽_{p²})`, with `σ̄(τ) = F(0,0)`. For normalized data every weight of `W(ρ̄)` has all coordinates `r` with `11 < r < p − 11`, so the intersection of 4.3 is empty, as 4.3 asserts for a type that is no `τ_{w̃}`. The manifest needs no change: both locators are in the BHHMS23 entry.

3. **F03** (P3) the twist Check of 0.5 is false for `f ≥ 2`

   **Location.** `README.md` line 164: "Twisting `τ` by `ω̃_f^c` twists every constituent by `(N_{k/𝔽_p} ∘ det)^c`".

   **Claim.** The niveau-`f` twist of the type corresponds to the norm twist of the weights.

   **Witness.** By the third bullet of 0.1, adding `(b_j, b_j)` to every `μ_j` twists `τ` by `ω̃_f^{Σ b_j p^j}`, and it tensors `F(λ)` with `∏_j (σ_j ∘ det)^{b_j} = (σ₀ ∘ det)^{Σ b_j p^j}`. So `ω̃_f^c` gives `(σ₀ ∘ det)^c`. `N_{k/𝔽_p} ∘ det = (σ₀ ∘ det)^{(q−1)/(p−1)}`; at `f = 2`, `c = 1` the exponents `1` and `1 + p` differ modulo `q − 1`. `BHHMS23 line 1232` agrees: the norm twist is `(1,1)` at every `j`.

   **Repair.** Replace the bullet by: "Twisting `τ` by `ω̃_f^c` twists every constituent by `(σ₀ ∘ det)^c`: adding `(b_j, b_j)` to every `μ_j` multiplies `τ` by `ω̃_f^{Σ_j b_j p^j}` (0.1) and tensors every `F(λ)` with `∏_j (σ_j ∘ det)^{b_j} = (σ₀ ∘ det)^{Σ_j b_j p^j}`. The norm twist `N_{k/𝔽_p} ∘ det = (σ₀ ∘ det)^{(q−1)/(p−1)}` is the case `b_j = 1` for all `j`, the twist of `τ` by the Teichmüller lift of `ω`. For `f = 2` and `c = 1` the two differ, since `σ₀ ∘ det` has order `q − 1`, which does not divide `p`. Omitting the twist in the formula changes the central character of every label."

   Tested on the witness: `f = 2`, `c = 1` gives `σ₀ ∘ det` on both sides; `f = 1` gives `det^c = (N ∘ det)^c`, the old value.

4. **F04** (P3) two Checks report random numerical trials

   **Location.** `README.md` line 582 (5.4): "verified exactly at 2000 random rational points with `κ ≠ 0`". Line 593 (5.5): "At `p = 29`, 2000 random such `a°` all give valuation exactly `7`."

   **Claim.** A Check states a computed value that a formalizer can reproduce.

   **Witness.** Neither sentence names its points, so neither can be recomputed; both describe how the text was tested. The identity has an exact coefficient check, and the sentence in 5.5 repeats what the sentence before it proves.

   **Repair.**

   - Line 582, replace the bullet by: "The identity holds as a polynomial identity in `x, y, p, κ`. With `s = xy`, `κF = (s + p)(s + κp)` and `κxF_x = s(2s + p(κ+1))`; in `κ` times the left side the coefficient of `s³` is `2(κ+1) − 2(κ+1) = 0`, that of `s²` is `p((κ+1)² + (κ−1)² − 2(κ²+1)) = 0`, that of `s` is `p²(κ+1)(2κ + (κ−1)² − κ² − 1) = 0`, and the constant term is `κp³(κ−1)²`."
   - Line 593, delete the last sentence.

   Tested: the four coefficients were expanded by hand this round (table below), and they give `p³(κ−1)²` after division by `κ`.

Four findings: two P2 and two P3. All are in `packages/LocalGaloisDeformationRingsPartII/README.md`; R01 and R02 also change the `needs` of one gap in `design/plan.json`. `Suggested.lean`, `metadata.toml` and `sources.toml` need no change. Both findings of round 6 are repaired. R01–R03 come from the sampled target 0.5, which no earlier adversarial table covered with computed values; R04 is partly in a sentence the last repair added.

## Round-6 findings

| Id | Status | Repaired passage (README) |
| --- | --- | --- |
| F01 (P2), the coefficient field need not contain the residue field of `K′` | repaired | line 26: "Throughout, `E` is large enough that `𝔽` contains a subfield isomorphic to `k₂ = 𝔽_{q²}`"; line 27: "Fix also an embedding `σ′₀ : k₂ → 𝔽` extending `σ₀`"; line 29: "composed with the local Artin map of `K′` (whose inertia group is `I_K`)"; line 181: "along `σ′_{−j′}`". Read against `BHHMS23 lines 456–457, 617–622, 808–813`. |
| F02 (P2), 5.4 and 5.5 need a starred coordinate to be a unit | repaired | line 575: "let `B_j` be the dense polynomial ring of 5.2 in its eight parameters with the starred coordinate that divides `G₅` inverted: `e₁₁*` in chart 1, `e₂₂*` in chart 3, none in chart 2"; line 587: "a point at which the coordinate inverted in 5.4 is a unit of `A`". |

Both repairs differ from the suggested ones, and both are sound. One coordinate is inverted instead of two; that suffices, because `G₁, …, G₄` are polynomial in the parameters of 5.2 (recomputed for the three charts). The Artin sentence now uses `K′`, which is the source's definition.

Patterns looked for in the rest of the package:

- A hypothesis attributed to the Conventions that they do not state: none left.
- A "unit" that is not one in its ring: none. 5.2, 5.8 and 6.3 work in `R_j`; 7.1, 7.4 and 7.5 in `S_j` and `S`.
- A niveau outside the divisors of `2f`: none (`1`, `2` at `f = 1`, `f`, `2f`).

## Verified sound

**Principles.** Every profile in `{(3,0),(2,1)}^f`, reducible and irreducible `ρ̄`, and ramified `𝒪` are covered. The base roadmap is imported by section. No algorithm, no sorried data, no `set_option`.

**Elaboration.** `lake env lean` on `packages/LocalGaloisDeformationRingsPartII/Suggested.lean`, run from the content checkout, gave one message: `47:8: warning: declaration uses 'sorry'`. The import header is `import Mathlib` alone.

**Binder check.** The worker's `#check @crossing_prime` shows `CommRing O`, `IsDomain O`, `IsDiscreteValuationRing O`, `IsAdicComplete (IsLocalRing.maximalIdeal O) O`, `Irreducible ϖ`, `0 < d`, a unit `u` of `MvPowerSeries (Fin (n + 2)) O`, and the conclusion `Prime (X 0 * X 1 + C (ϖ ^ d) * ↑u)`. This is the generality of 5.3. Nothing was lost.

**Padding probe**, on the one sorried theorem, in a scratch file elaborated the same way:

- `simp` leaves the goal.
- `rfl` fails.
- `infer_instance` fails ("type class instance expected").
- `aesop` fails.
- `exact?` offers only the earlier scratch copy of the theorem.

No file of either pin has a `UniqueFactorizationMonoid` instance for power series in several variables. Not padding.

**Headlines.** From the Summary: 6.1, 6.2, 6.3, 7.3, 7.5, with the deep intermediate results 4.3, 3.6, 3.9 and 5.3. Only 5.3 is statable at the pins, and it is stated. The module docstring names each of the others with its missing carrier. No file of Mathlib or Tau Ceti at the pins contains `DeformationRing`, `FramedDeformation`, `SerreWeight`, `KisinModule`, `EtalePhiModule` or `BreuilKisin`. The only backticked name of this roadmap's own is `crossing_prime`, extracted by script from 65 backticked identifiers; the file declares it.

**Pinned declarations**, each elaborated by `#check` in one scratch file and opened:

- Mathlib `MvPowerSeries.C`, `MvPowerSeries.X` (`RingTheory/MvPowerSeries/Basic.lean` 334, 374).
- `MvPowerSeries.isEmptyEquiv`, `MvPowerSeries.finSuccEquiv` (`RingTheory/MvPowerSeries/Equiv.lean` 54, 169).
- `IsRegularLocalRing`, `IsRegularLocalRing.of_ringEquiv` and the instance for a local principal ideal domain (`RingTheory/RegularLocalRing/Defs.lean` 52, 69, 80). `inferInstance : IsRegularLocalRing O` elaborates for a discrete valuation ring.
- `PowerSeries.isWeierstrassDivision_weierstrassDiv_weierstrassMod`, `PowerSeries.exists_isWeierstrassFactorization` (`RingTheory/PowerSeries/WeierstrassPreparation.lean` 561, 814). Both need `IsAdicComplete (maximalIdeal A) A` and a nonzero reduction, as line 44 says.
- `IsLocalRing.notMem_maximalIdeal`, `Ideal.span_le`, `Ideal.minimalPrimes`, `Matrix.det_fin_two`, `Matrix.adjugate`, `Polynomial.derivative`, `Field.absoluteGaloisGroup`, `modularCyclotomicCharacter`, `LaurentSeries`.
- Tau Ceti `TauCeti.PowerSeries.isRegularLocalRing` (`RingTheory/RegularLocalRing/PowerSeries.lean` 157).
- `TauCeti.IsRegularLocalRing.uniqueFactorizationMonoid` (`RingTheory/RegularLocalRing/UniqueFactorization.lean` 59, hypothesis `ringKrullDim R ≤ 2`).
- `TauCeti.inertiaTameCharacter`, `TauCeti.quotientWildInertiaSubgroupEquiv` (`NumberTheory/LocalField/Tame/Character.lean`).

All exist with the stated meaning.

**Dependency check** (the brief's command):

```text
depcheck: 208 roadmaps, 1902 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

**Supplier citations resolved now**, on main, at the open heads of the index of 2026-11-13, and in the board package for ModpRepresentationsOfGL2OverLocalFields (it has no pull request yet and is earlier in the merge order). Every cited heading exists:

- LocalFieldsRamification (main) Layer 4 (line 1155). It has no Kummer-tower statement, so the gap is not redundant. ClassFieldTheory (main) Layer 7 (1205).
- PadicLocalLanglandsForGL2Qp §§0.3, 0.4, 4.4 (268, 292, 1473). §0.3 keeps the residue embedding at every niveau; §4.4 is for `GL₂(ℤ_p)` and supercuspidal classes, as line 63 says.
- FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.4.1, .2, .5, .6, .24, .36, .39 (5483, 5559, 5684, 5715, 6528, 7307, 7412), with `kisinOpenDiscBounded` and `KisinModuleCoeff`.
- LocalGaloisDeformationRings §§1.1, 1.2, 1.8, 3.1, 3.4, 3.5, 3.9, 3.10, 6.9, 6.28, 6.33, 8.10 (1276, 1284, 1399, 2241, 2292, 2300, 2388, 2396, 3052, 3380, 3521, 3810), with `heightLatticeFunctor`.
- ModpRepresentationsOfGL2OverLocalFields §§3.1, 3.2, 3.4, 5.5 (938, 963, 1008, 1373). It has no Deligne–Lusztig statement, so that gap is not redundant.
- DeformationAndDerivedPatchingAlgebra §§1.8, 1.9, 1.11, 1.12, 1.13, 1.14, 4.6, 4.7, 6.8 (213, 233, 262, 282, 305, 325, 991, 1006, 1327), with `seriesPresentation_surjective` and `flatCompletion_finiteComparison`. It has no power-invariance statement.
- PurityForFlatCohomology §7.4 (2299), `isRegularLocalRing_uniqueFactorizationMonoid`.

**Gaps.** A script compared `design/plan.json` with the README: 9 and 9 slugs, the same suppliers, every `needs` equal word for word. Eight are precise and minimal. `tame-types-unramified` is R01 and R02.

**Ownership and overlaps.** `scratch/overlaps.md` lists no pull request that changes this roadmap, no dropped id, no id that only a revision defines, and no second copy. Searches by object on main and at the open heads:

- "gauge basis", "monomial étale", "cyclotomic-free", `crossing_prime`, the framed ring of `G_{K∞}` with `Φ_p`: no match.
- "cyclotomic free": one unrelated match (StableHomotopyKTheoryPartII).
- "BHHMS": only HilbertModularVarietiesAndShimuraCurvesPartII, the consumer.
- No other `Suggested.lean` declares `TauCetiRoadmap.LocalGaloisDeformationRingsPartII.crossing_prime`.

Overlap check: read HilbertModularVarietiesAndShimuraCurvesPartII, LocalGaloisDeformationRings, PotentialAutomorphyInfrastructurePartII, FiniteFlatGroupsAndIntegralPadicHodgeTheory, PadicLocalLanglandsForGL2Qp; Kisin modules with tame descent: owner LocalGaloisDeformationRings §6.9 (cited, with a gap); the types `σ(τ)`: owner PadicLocalLanglandsForGL2Qp §4.4 (cited, with a gap); single- and multiple-type rings of BHHMS23 §4: owner this roadmap; nothing has two owners.

Remark, no change here. HilbertModularVarietiesAndShimuraCurvesPartII cites this roadmap as `T.0–T.7`, the layer names of the design, where the README has Layers 0–7. It also declares three gaps on this roadmap; they are listed for the human reviewers.

**Sources, seeded sample**, each read at its locator in the cached text.

| Target | Locator read | Result |
| --- | --- | --- |
| 0.1 | Definition 2.3.1, (11)–(12) (`BHHMS23 lines 612–648`, p. 14) | matches: `α′`, `a′^(j)`, `s_τ`, `f′`, `e′` |
| 0.5 | Proposition 2.4.3 (722–740, p. 16); Remark 2.4.5(iv) (764, p. 17); `LLHL19 lines 549–550` | statement matches; the gap label and the twist Check do not (R01–R03) |
| 1.3 | Definition 3.1.6, Proposition 3.1.5(i)–(ii) (855–877, pp. 19–20) | matches, degree bounds recomputed for the three shapes |
| 2.3 | (16), Proposition 3.1.9 (946–971, pp. 20–21) | matches: `N ≥ 2h − 3`, `(N−1)(p−1) ≥ h` |
| 3.1 | Definition 3.2.1, Remark 3.2.2 (1008–1024, p. 22) | matches: `d(i)` is the orbit length under `s_τ` |
| 3.5 | Lemma 3.2.6 (1055–1074, p. 23) | matches |
| 3.7 | lines 1094–1096 (p. 23); `LLHLM23 lines 4802–4819` (p. 107); `LLHLM18 lines 1114–1129` (p. 29) | matches |
| 3.9 | Corollary 3.2.9 (1104–1116, p. 24) | matches: `ρ₂` arbitrary |
| 3.10 | proof of Proposition 4.3.1 (1700, p. 35; 1825–1827, p. 37); `LLHLM18 lines 1223–1236` (p. 31) | matches: the ring is used without construction |
| 5.4 | Lemma 4.2.3 (1478–1495, p. 31); `R^(j)_poly` (1435–1443, p. 30) | identity matches; the unit is the README's addition |
| 5.6 | (26) and lines 1523–1536 (p. 32); `GHLS17 lines 174, 1041` (pp. 4, 21) | matches |
| 5.8 | Lemma 4.2.4, lines 1517–1558 (pp. 32–33) | matches: `N ≥ 9` suffices |
| 6.2 | Proposition 4.2.1 (1319–1333, p. 28); 1890–1893 (p. 38) | matches |
| 6.3 | Corollary 4.2.6, (27)–(28) (1588–1616, pp. 33–34); Lemma 8.1.2 (4405, p. 88); `Hamann75 line 101` | matches: `m ≤ f` |
| 7.1 | Proposition 4.3.1 (1644–1680, pp. 34–35); Figure 2 (1852–1856, p. 38) | matches, entry by entry |

Also read: `BHHMS23 lines 453–460` (§1.4, p. 10), `576–579` (star operation, p. 13), `653–674` (0.2–0.4), `797–945` (1.1, 1.2, 1.4, 2.1, 2.2), `1025–1134` (3.2–3.8, 5.3), `1136–1284` (4.1–4.3), `1345–1465` (5.2, 5.7), `1900–1954` (7.4, 7.5), the constants under Tables 1–3 (2012, 2098, 2170), `5070–5110` (Theorem 8.3.9); `Elkik73 lines 90, 118`. All eight cited works are in `sources.toml`, which has no local path. The author flagged no locator as unverified.

**Adversarial table** (values computed this round).

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions, `𝔽 ⊇ k₂` (repaired) | `f = 1`, `p = 5`, `s = w`, `μ = (1,0)` | `a′^(0) = (2,10)`; orders `24/gcd(2,24) = 24/gcd(10,24) = 12`; `μ(ℚ_5)` prime to 5 has order 4 | needed, stated | none |
| Conventions, Artin sentence (repaired) | `r = 2`; `r = 1` | `ω_{2f}^q ≠ ω_{2f}`, so only `Art_{K′}` makes sense; at `r = 1` it is `ω_f(Art^{geo}_K(u)) = σ₀(ū)` | holds | none |
| 0.1, twist bullet | `r = 1`; `r = 2` | exponent `Σ_j b_j p^j`; at `r = 2` it is `(1+q)Σ_j b_j p^j`, and `ω̃_{2f}^{1+q} = ω̃_f` | holds | none |
| 0.3 | `f = 1`, `s = w`, `μ = (1,0)`, `p = 5` | orientations `w, 1`; `a′^(1) = (10,2)`; (13) at `j′ = 0, 1`: both sides `w(μ+η)` | holds | none |
| 0.5 statement | `f = 1`, `s = w = 1`, `ν = η`, `μ = (a,b)` | `τ = ω̃^{a−1} ⊕ ω̃^b`; formula `F(a−1,b)`, `F(b, a−p)`; principal series reduction `F(a−1,b)`, `F(b+p−1,a−1)`, equal modulo `(p−1)(1,1)` | holds | none |
| gap:tame-types-unramified, label | `f = 1`, `p = 7`, `s = 1`, `μ = (1,0)` | `τ = ω̃² ⊕ 1`; `R_1((1,0))` has type `ω̃ ⊕ 1`; `R_1((2,0))` has type `τ` | wrong label | R01 |
| gap:tame-types-unramified, domain | `f = 2`, `τ = 1 ⊕ 1` | not supercuspidal, `K ≠ ℚ_p`; root coordinates `0` or `p − 1`, so `N < 1`: no 1-deep presentation, no owner of `σ(τ)` | too narrow for 4.3, 7.2 | R02 |
| 0.5, twist Check | `f = 2`, `c = 1`; `f = 1` | `(σ₀∘det)^1` against `(σ₀∘det)^{1+p}`; equal only if `(q−1)` divides `p`; at `f = 1` equal | false for `f ≥ 2` | R03 |
| 1.1, minor Check | `λ_j = (2,1)`, `(3,0)` | exponents `1, 3` and `0, 3` | holds | none |
| 1.3, degree bounds | `t^(2,1)`, `w t^(2,1)`, `t^(1,2)` against `A₁, A₂, A₃` | bounds `(2,0;2,1)`, `(1,1;2,1)`, `(1,1;1,2)`; pivots at `(w_j(k),k)`; all twelve chart entries within them | holds | none |
| 2.1, Frobenius rule | `u′e` | `−p(u′)^pλ` against `−E(u′)^pφ(λ)`, equal by `pλ = Eφ(λ)` | holds | none |
| 2.3 | `h = 3`, `L = 11`; `h = 2` | `p⁹, p⁸`; `L ≥ 1`, one jet | holds | none |
| 3.1 | `f = 1`, `s = w`, `μ = (a,a)`, `(1,0)` | `(p+1)a`; `1` and `p` | holds | none |
| 3.2 | `p = 5`, `μ = (3,1)`; `f = 2`, `p = 3`, `δ = (2,−1)` | `8 ≡ 2` mod 6; `2 − 3 = −1` | holds | none |
| 3.6 | `f = 1`, `s′ = 1`, `μ′ = (a,a)` | Frobenius with irreducible characteristic polynomial over `𝔽`: irreducible, scalar inertia; split after a quadratic extension | "finite extension of `𝔽`" needed and present | none |
| 3.7 | digits `|δ_i| ∈ [3, p−3]`; `ω ⊕ 1` | `|δ_i ∓ 1| ∈ [2, p−2]`; sum nonzero, at most `(p−2)(p^{f′}−1)/(p−1) < p^{f′}−1`; `μ = (1,0)` 0-deep only, `(p−1,1)` 1-deep | holds; depth 2 sharp | none |
| 3.8 | `W = 𝔽`, `K = ℚ_p`, `p > 2` | the only degree-`p` subfield of `K∞` is `K(p₁)`, not Galois | holds | none |
| 3.9 | `ρ₂` of another dimension or semisimplification | both sets empty | holds | none |
| 3.10 (iv) | `T ↦ T²` | every tangent vector pulls back to `0`; image `𝒪⟦T²⟧` | hypothesis needed | none |
| 4.1 | `μ = (r+2,1)` | coordinates `r`, `r+2` in `(N−1, p−N+1)` | `(N−1)`-deep | none |
| 4.3 | `f = 1`, `(w,ν) ∈ {(1,η),(w,η),(1,−η)}` | `θ(0) = U₃`, `θ(η) = U₁` | matches (21) | none |
| 5.2, constants | `a₁, a₂, a₃` modulo `p` | `a₁ + a₂ ≡ 2`; `a₂ − 1 ≡ ±(r+1)`; `κ − 1 = −2/(a₂(a₂−1))`; denominators `a₁`, `a₂ ± 1`, `a₂ − 2`, `a₃ − 1` are `±r`, `±(r+2)`, `r+3`, `r−1`: units | holds | none |
| 5.2, polynomial parameters | charts 1, 2, 3 | every `G_i`, `i ≤ 4`, is one of `d₁₁, c₂₂, c₂₁, c₁₁` (resp. `c₂₁, c₁₂, c₁₁, c₂₂`; `d₂₂, c₁₁, c₁₂, c₂₂`) plus a polynomial in the other four | as 5.4 says | none |
| 5.3 / `crossing_prime` | `d = 0`; `u = x₁`; `ϖ^d` divides `b(b+x₂)` | unit; `x₁(x₂ + ϖ)`; `ϖ` cannot divide both factors | hypotheses needed, present | none |
| 5.4, chart 2 (repaired) | coefficients in `s = xy` | `s³`: `0`; `s²`: `0`; `s`: `0`; constant `κp³(κ−1)²` | holds, no inversion | R04 (wording) |
| 5.4, charts 1 and 3 (repaired) | `H = X(cXY − 2p)`; mirror | `2pcXY − 2p² − 2pcXY = −2p²`; same for `H = Y(cXY − 2p)` with roles exchanged | holds with the inversion | none |
| 5.4, Check without inversion | `e₁₁* = X = d₁₁ = c₁₁ = c₂₁ = c₂₂ = 0` | `G₁ = … = G₅ = 0`; `∂G₅ = (X(…), e(…), ecX²) = 0` | Check true | none |
| 5.5 (repaired) | `e₁₁* = X = p³`, `Y = 1`, `n = 7` | `v(G₅) = 3 + 3 + 1 = 7`; every `a° ≡ a` modulo `p⁴` keeps the three valuations | Check true | R04 (wording) |
| 5.5, Newton step | `n > 6` | `2(n−3) > n`; `p³ = m + p^n b` gives `p³(1 − p^{n−3}b) = m` | holds | none |
| 5.8 | counts | `2^f` components of dimension `3f + 1` on both sides; reduced source | injective | none |
| 6.2, 6.3 | `f = 1`, `f = 3`; charts | `f + 4 = 5, 7`; variables `3f + m + 4 − 2f` | holds | none |
| 7.1 | Table 1 into Table 4 | `(z²d₁₂* + z(c₁₂ − pd₁₂*) + b − pc₁₂)/v = zd₁₂* + c₁₂ + b/v`; `(zd₁₁ + c₁₁)/v = d₁₁` exactly when `c₁₁ + pd₁₁ = 0` | matches | none |
| 7.3 | tangent bound | `pk_j ≤ k_{j−1} + r_j + 3 < k_{j−1} + p − 1` gives `max k_j < 1` | holds | none |
| 7.4 | `p = 5`, units `1` | `25 − 25`, `5 − 5`; `−5 + 5` | vanish | none |
| 7.5 | elimination | `(a₂−1)·2/(a₂(a₂−1)) = 2/a₂`; modulo `Q₂ + P`: `p = 0`, `ϖ ≠ 0` if `e ≥ 2` | holds; `p`, not `ϖ` | none |
| gaps | plan against README | 9 slugs, 9 equal `needs` strings | agree | R01, R02 change one |

**Shape and style.** Every definition has its API and at least three Checks. Every theorem has a locator. Every layer ends with Examples and Dependencies. A scan of the README and the Lean file found no LaTeX delimiter, pull-request number, date, machine path or HTML anchor. The Lean file has `theorem` only, one module docstring, no `#eval` and no `set_option`.

**Copyright.** The README's statements were set beside the source at the fifteen sampled locators and at seven further passages:

- the Conventions on `σ′₀`,
- the definitions of 1.1 and 3.3,
- the routes of 5.3, 5.5 and 7.3,
- the docstring of `crossing_prime`.

None shares a run of words with the source beyond formulas and standard names. The chart equations, the substitutions of 7.1 and the ideals of 7.4 are formulas, written in the README's own notation (`u, d, a, x, t` for the recurring quantities) and without the tables' layout.

Arrangement: BHHMS23 has 61 of 87 locators. Its sections 2.3, 2.4, 3.1, 3.2, 3.3, 4.1, 4.2, 4.3 against the layers:

- Layer 0 ↔ §§2.3–2.4.
- Layers 1–2 ↔ §3.1.
- Layer 3 ↔ §3.2, with 3.10 taken from the proof of §4.3 and from LLHLM18.
- Layer 4 ↔ §4.1.
- Layer 5 ↔ §3.3 and the proof of Proposition 4.2.1.
- Layer 6 ↔ the statements of §4.2.
- Layer 7 ↔ §4.3.

The map is not one to one. §3.3 moves behind §4.1, and the dependency lines force the order (1←0; 2←1; 3←0,1; 4←0,1,3; 5←1–4; 6←5; 7←3–6).

Source independence: 22 passages compared with 7 sources, none shared; largest share BHHMS23, 61 of 87 locators; contents compared with BHHMS23: independent.

## Not verifiable

- Kisin06, Corollary 1.3.15: recorded `uncertified`; it is cited behind BHHMS23 Proposition 3.1.7, which states the result used.
- LLHLM18, LLHL19 and LLHLM23 were read in their arXiv versions; their numbering was compared with the published versions only through BHHMS23's citations.
- Ownership against open pull requests was checked with `roadmaps grep` and `roadmaps show` at the heads of the index of 2026-11-13 and in the board's packages; nothing newer was looked at.

## Source issues

- **Gap** in BHHMS23 at Lemma 4.2.3, printed page 31: the Jacobian bound for the two outer tables is stated in the polynomial ring; it should invert the starred coordinate that divides the last generator; affects the proof.
- **Gap** in BHHMS23 at the proof of Proposition 4.2.1, printed pages 28–29: Proposition 3.1.9 is applied over a complete local ring, though §3.1.2 assumes algebras topologically of finite type; it should state the complete local case; affects the proof.
- **Gap** in BHHMS23 at Proposition 3.2.7, printed page 23: the proof splits every semisimple representation with the given inertia along the orbits; it should allow a finite extension of the residue field, since scalar inertia admits irreducible members; affects a stated result.
- **Misprint** in BHHMS23 at the final note of Table 5, printed page 45: the note says the tails come from Tables 1–2; it should say Tables 2–3, whose constants it names; affects nothing.
- **Misprint** in BHHMS23 at the proof of Theorem 8.3.9, printed page 102: the type-label bijection twists the weight by the norm of the determinant; it should use the inverse determinant, as five lines earlier; affects nothing.

## For the human reviewers

- **Scope.** HilbertModularVarietiesAndShimuraCurvesPartII (README lines 71–75) declares three gaps on this roadmap for potentially Barsotti–Tate rings, lattices of `σ(τ)` and Breuil–Mézard multiplicities; `README.md` line 9 here excludes that profile.
- **Licence.** The fifteen chart generators of 5.2, the substitutions of 7.1 and the ideals of 7.4 restate the formulas of BHHMS23 Tables 1–5 and Figure 2 (arXiv, pp. 38–45) in the README's notation.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "66adc0788eac0d631fbed9fbefe3150f409a9ae7", "job": "REV-PKG-LocalGaloisDeformationRingsPartII~7", "model": "fable", "worker": "chris-x52"} -->
