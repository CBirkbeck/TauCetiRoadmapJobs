# Review of LevelOneAutomorphicFormsForClassicalGroups (pull request #2285 at 7466633)

**Verdict:** needs changes

## R01 (P2) — §5.1 does not tie the cover bound `c` to `A_F/m`, nor state its `(δ, m)` hypothesis

**Location:** `TauCetiRoadmap/LevelOneAutomorphicFormsForClassicalGroups/README.md` §5.1, lines 1901–1906: "`C ⊂ D` a finite set containing every represented parameter of `D` with `J_{F_ℓ}(U²) ≤ c` (§2.18) … Then every `π ∈ Π_alg` with `L(π∞) ∈ D` and `π ∉ S` has `L(π∞) ∈ R`, under the stated `(δ, m)` hypothesis".

**Claim:** `c` is unconstrained, the `ℓ` of the cover is the bound variable of the triples, `S′ ⊂ S` is not said, and no `(δ, m)` hypothesis is stated in the section. As written the statement is false, and for `m = 2` the conclusion about a single `π` does not follow.

**Witness:** `w = 0`, `D = {1}`, `S = ∅`, any `c < J_{F_ℓ}(1)`: `C = R = ∅` meets every hypothesis, and the conclusion puts the parameter of the trivial class in `∅`. §2.8 gives membership in `C` only for `c ≥ A_F/m`.

**Repair:** Replace the statement by: "Fix `δ ∈ {0, 1}`, `m ≥ 1`, `ℓ₀ > 0` and a real `c ≥ A_{F_{ℓ₀}}/m`. Let `D` be a set of effective parameters in `K∞^{≤w}`, `C ⊂ D` a finite set containing every `U ∈ D` with `J_{F_{ℓ₀}}(U²) ≤ c` (§2.18), `S ⊂ Π_alg` a finite set of known classes and `R ⊂ C`. Suppose that for each `U ∈ C ∖ R` some triple `(ℓ, S′, t)` with `S′ ⊂ S` satisfies §2.16 for the quadruple of §2.17 attached to `(U, δ, m)` and `S′`. If `π₁, …, π_m` are distinct elements of `Π_alg ∖ S` with a common parameter `U ∈ D`, each self-dual when `δ = 1`, then `U ∈ R`." Add the Check: "for `D = {1}`, `S = ∅` and `c < J_{F_{ℓ₀}}(1)` the empty cover would exclude the trivial class; `c ≥ A_{F_{ℓ₀}}/m` forbids it, since §2.8 gives `J_{F_{ℓ₀}}(1) ≤ A_{F_{ℓ₀}}`."

## R02 (P3) — §2.11, third Check is false

**Location:** README §2.11, lines 954–955: "omitting `I = {1}` in the previous example would give no candidate at all".

**Claim:** In the previous example `β = [[1, 2], [2, 1]]` the support `I = {2}` remains eligible, so a candidate with the correct value survives.

**Witness:** `β_{{2}} = (1)`, least eigenvalue `1`, eigenvector `(1) > 0`: eligible, `λ_{{2}} = 1 = μ`.

**Repair:** "Enumerating all nonempty supports is part of the statement: for `β = diag(1, −1)`, omitting `I = {2}` leaves only `I = {1}` (the support `{1, 2}` is not eligible, its least eigenvector being `(0, 1)`) and gives `1` instead of `−1`."

## R03 (P3) — §2.17, fourth Check claims a sharpening that never occurs

**Location:** README §2.17, lines 1057–1058: "the statement is the bound of §2.8 with `m = 1`, sharpened by the root term `−(B_F/4)(1 − ε(U²))` when `δ = 1`".

**Claim:** `ε(U²) = 1` for every `U` of determinant one, so the root term is `0` for every parameter a class can have; with `S = ∅` the statement is exactly §2.8.

**Witness:** `ε(U²) = (det U)(−1)`; for `U = I_w`, `w` odd: `ε(I_{2w} + 1 + e) = i^{2w+1} · i = 1`. CT20 line 730 (footnote 7) and lines 960–961 (Remark 2.12).

**Repair:** "With `S = ∅`, `r = 1` and `m = 1` the statement is the bound of §2.8 with `m = 1`: the root term vanishes, because `ε(U²) = 1` for every `U` of determinant one (for `U = I_w` with `w` odd, `ε(I_{2w} + 1 + e) = i^{2w+1} · i = 1`), so `δ = 1` gains nothing here."

## R04 (P3) — §2.8 uses an undefined term

**Location:** README §2.8, lines 887–889: "If `B∞^F` is positive definite on a finite-dimensional effective subgroup of `K∞`, the effective integral parameters satisfying the bound form a finite set."

**Claim:** "effective subgroup" is neither the literature's term nor defined here; a subgroup contains negatives, so it is not effective in the sense of §1.2.

**Witness:** The phrase occurs once (line 888); §1.2 defines only the effective cone and `K∞^{≤w}`.

**Repair:** "If `B∞^F` is positive definite on a subgroup of `K∞` spanned by finitely many of the basis elements `1`, `e`, `I_w` (for instance `K∞^{≤w}`), the effective elements of that subgroup satisfying the bound form a finite set."

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Previous R01, §1.5 | head lines 586–594; supplier §5.1 | purity equivalence now imported ("By AutomorphicFormsOnReductiveGroups §5.1, through Clozel purity"); supplier records `IsAlgebraicCT` and the agreement | repaired | none |
| Previous R02, §1.7 locator | head line 634; CT20 lines 738–739 | "(CT20 Problem 1 and §2.4.1, after Corollary 2.3)" | repaired | none |
| §1.5 purity, duality | `Δ₁₁`, trivial class, CT20 lines 554–571; CL14 line 8106 | weights `±11/2`, `w = 11`; `w(1) = 0`; equivalence at CL14 VIII Prop. 2.13 | holds | none |
| §1.6 regular vectors | `m = 2, 4, 6`, odd `m`, `(1,0,0,−1)` | `m = 4`: zero part forced `1 + e` (`det I₂ = e`); `m = 2`: `2·1`, `2e`; `m = 6`: `2·1`, `2e` | holds; `m ≡ 0 mod 4` needed | none |
| §2.2 Odlyzko functions | `g″` at `0, 1`; `∫₀^∞ g`; Laplace transform of `u` | `−π²`, `0`; `2/π² + 2/π² = 4/π²`; `ℓ·8π² cosh²(ℓ/4)/(ℓ²/4 + π²)²` equals the stated `Ĝ_ℓ(i/(4π))` | holds | none |
| §2.4 eight scalars | CL14 lines 11662–11673; CT20 lines 1557–1562 | `Φ(0) = 8ℓ/π² = F̂_ℓ(i/(4π)) = Ĝ_ℓ(0)`; `Φ(1/2) = F̂(0)`; both propositions state the eight quantities | holds | none |
| §2.6 explicit formula | `π = π′ = 1` | Weil for `ζ`: `Z = 2A − 2B_f − 2J`, so `B_f + J + Z/2 = A` | holds | none |
| §2.7 cone inequality | `x = 1`; pair `(Δ₁₇, 1)`; CT20 lines 676–695, 1549–1551 | `A − J(1) ≥ 0`; `ε(I₁₇) = i¹⁸ = −1`, forced zero gives `Z ≥ B_F` | holds | none |
| §2.8 multiplicity bound | `x = m⁻¹Σπ_i`; `ε(U²)` for `det U = 1` | `A/m − J(U²) − (B_F/2)·0 ≥ 0` | holds; term | R04 |
| §2.11 face criterion | `diag(1,−1)`; `[[1,2],[2,1]]`; `diag(1,1)` | `−1` on `{2}`; `{1}`, `{2}` eligible with `1`, `{1,2}` not; `1` | theorem holds; Check 3 false | R02 |
| §2.15 compression | `A = K = 1`, `m = 2` | expanded `−1`; compressed `−1/2`; lift `t/m`: `(A/m − K)t²` | holds with `1/m` | source issue |
| §2.17 exclusion | `F = −F₁`; `S = ∅`, `U = I_w` | `β = −(A − J(1)) < 0`, prime term at `2` positive; `ε(I_w²) = (−1)^{w+1}` | holds; Check 4 | R03 |
| §3.6 condition `(R_k)` | `1 + e + I₂`, `3·1`, `2I₁`; CT20 lines 1787–1790 | weights `±1, 0, 0`, holds for `k ≥ 2`; `1` thrice; `I₁` twice | holds | none |
| §3.9 sign identity | `(ε, a) = (1,2), (1,3), (1,4), (−1,1), (−1,2), (−1,3)` | both sides `−1, −1, 1, −1, −1, 1` | holds | none |
| §3.16 triangular relation | `SO₃`, `k = 0, 5`; `SO₁`; Tai17 lines 2581–2598 | `κ = −1`, `R = δ_{k,0}`; `EP(SO₁) = 1`, no simple parameter | holds | none |
| §4.1 masses | `SO₃`; unipotent of `SL₂`; CT20 lines 398–425, 502–504 | `m = −1/12 = ζ(−1)`; `u^r ≠ 1` | holds | none |
| §4.7 `spinor_charpoly_obstruction` | `n = 0, 1, 2`; `SO₃` with `Φ₁Φ₄`, `Φ₁Φ₆` | `Q = 1`; `Q = 1`; hyperbolic plane forces `s = ±2`, `Q = 1`; `Q(−1) = 2, 3`, and `PGL₂(ℤ)` has no element of order `4`, `6` | holds; CT20 lines 1245–1249 | none |
| §4.9 index sets | own enumeration, 20 groups | `Sp`: `3,12,32,92,219,530,1158,2521`; `SO`: `5,12,19,59,92,165,419,530,1001,2257,2521,4877` and `3,6,12,34,40,99,244,211,598,1339,992,2948` | holds | source issue |
| §4.11 mass recovery | `A = [[1,0,0],[0,1,0]]`; CT20 lines 1294–1295 | rank `2 < 3`: solutions `(0,0,0)`, `(0,0,1)` | holds | none |
| §4.12 `SO₃` | five rows, determinant, solution | `det = 288`; rows give `1/2, −1/2, −1/2, −1/2, −1/2`; `k = 5`: `11/12 + 1/4 + 1/3 − 1/2 = 1` | holds | source issue |
| §5.1 covers | `D = {1}`, `S = ∅`, `c < J(1)` | `C = R = ∅` admissible; conclusion excludes the trivial class | false as written | R01 |
| §5.2 finiteness | CT20 lines 881–883; CL14 lines 11932, 12058, 12226, 12251, 12349 | Lemmes 3.19, 3.27, 3.34, 3.36 and Proposition 3.39 at the stated places | holds | none |
| §5.6 thirteen classes | CT20 lines 242–250; six residuals of §5.4 | `2 + 3 + 7 + 1 = 13`; ranks `10, 8, 10, 10, 10, 8`, the first is the `PGL₁₀` class | holds | source issue |
| §6.4 theta map | `g = 0`; `k = 4, g = 9`; CT20 lines 2081–2083, 2321–2325 | `θ₀ = 1`; `S₄(Γ₉) = 0`, `M₄(Γ₉) = ℂθ₉[E₈]` | holds | none |
| §6.9 eigenparameter route | each step; table against CL14 lines 16633–16656 | degree rule from `ψ_G = ψ_F ⊕ [n−1−2g₀]`; (H2) at `g = k = 12` needs `Sym²Δ₁₁[3]`, weight `12 > 11`; 24 rows equal | sound | none |
| §6.11 central orders | eleven classes | `ε = −1` only for `Δ₁₇`, `Δ₂₁` (`i¹⁸`, `i²²`); `Δ₁₉,₇`: `i²⁰·i⁸ = 1`; CL14 lines 12315–12340 | holds | none |
| §6.12 Böcherer's criterion | five `(g, n)` | `n/2 − g = 0, 4, 0, −4, −12`; factors as BoechererNote lines 18–40 | holds | none |
| §7.4, §§7.8–7.9 counts and tables | own enumeration over the 27 classes with the sign test | `223` candidates in positive genus, `198 + 1 = 199` shapes, `58 + 1 = 59` pass; `29` nonscalar and `29` scalar rows, all equal to the README's | holds | none |
| §7.7 case (H2) | `(16,13)`, `(24,13)`, two rejected shapes | dimensions `33`, `49`; `χ = (−1)^{2·6/4} = (−1)^{2·2/4} = −1` against `ε_ψ = 1` | holds | none |
| §7.10 weight 13 | `g = 8, 24` | `12..9, 8..5`; `±12` once, `±1..±11` twice, `0` thrice on both sides | holds | none |
| §8.4 Mathieu average | orientable sizes from Lemma 1.3 | dimensions `1,1,1,2,1,1,2,1,1,2,1,1,1` at `g = 0,1,7,8,9,11,12,13,15,16,17,23,24` match the polynomial | holds | none |
| §8.5 `finrank_invariantAlternatingForms_of_rootless` | `g = 0`, `g > 24`, five degrees | `1`; `0`; coefficients of `t²⁴ + t¹⁶ + t¹² + t⁸ + 1` (CT19a line 26) | consistent | none |
| §8.5 `invariantAlternatingForms_eq_bot_of_roots_span` | tuple with a root; degenerate form; Golay Construction A | `ω(x, y) = ω(−x, y + cx) = −ω(x, y)`; reflection still an isometry; 48 roots `±2e_i` span | holds | none |
| §8.6 `exists_thetaCoefficient_ne_zero_of_rootless` | `g = 24, 12, 8` | `±|O(Leech)|`; `18·|O|/3`; `5·|O|/10` (CT19a lines 105–115) | consistent | none |
| §8.7 five orders | all five rows, each factor recomputed | `Γ_A` poles `1, 0, 1, 1+3+5 = 9, 13+12 = 25`; `ω` zeros `0,0,0,4,12`; `γ` poles `0,0,0,4,12`; sums `0` | holds; BoechererNote lines 113–118 | none |
| §8.9 rank-16 source | parameters `Δ₂₁,₁₃[4]`, `Δ₁₇[8]` | dimensions `16`, `16`; `Δ₁₇[8] ⊕ [1]`: `χ = 1`, `ε_ψ = ε(Δ₁₇) = −1`, fails | holds; CT20 lines 2281–2284 | none |

- Source locators checked against the cached texts: CT20 58, CL14 14, CT19a 12, BoechererNote 3, Tai17 3, Mil02 1, MR18 1.
- Library declarations opened at the pins: `TauCeti.IntegralLattice` (`TauCeti/LinearAlgebra/IntegralLattice/Basic.lean` line 63), `Isometry` (`Isometry/Basic.lean` line 77: an ambient isometry mapping the carrier onto the carrier), `norm`, `vectorsOfNorm` (`Norm.lean` lines 78, 221), `leechLattice` and its five lemmas (`Rank24/Leech/Basic.lean`, `Minimum.lean`), `TauCeti.Symplectic.groupScheme`, `pointsMulEquiv` (`Algebra/AlgebraicGroup/Symplectic/Basic.lean` lines 120, 213), `orthogonalSpinorNorm` (`Spin/SpinorNorm/Basic.lean` line 98), `ModularForm.dimension_level_one`, `CuspForm.discriminantEquiv`, `IsSelfAdjoint.hasEigenvector_of_isLocalExtrOn`, the newform basis and `cuspFormsNew_one`.
- Cross-roadmap citations resolved at main or at the open heads: 94 section ids in 22 roadmaps, none missing; statements read for AutomorphicFormsOnReductiveGroups §§5.1, 6.8, 7.2a, ModularityAndLanglandsExtensions §§3.21–3.22, AnalyticNumberTheoryPartI §1.8, SymplecticReidemeisterTorsionModSquares §4.1, ComputationalNumberTheory §4.34, IntegralLattices §4G, CFSGBasicProperties P2-L, GeometryOfNumbersAndQuadraticArithmetic §2.4.2.
- Declared gaps: nine in the README, each with a named supplier; none is supplied already (the suppliers' §§6.8, 7.2a, 3.22 and P2-L stop short of them, read at their heads).
- Gate at 7466633: every check passed. Dependency check: `depcheck: 244 roadmaps, 2233 edges, 0 problem(s)`; no change outside the folder.
- Elaboration of `Suggested.lean`: `sorry` the only warning (four theorems). One-tactic probe (`rfl`, `simp`, `infer_instance`, `simp_all`, `aesop`) on a scratch copy: no theorem closes. `#check` of the eight declarations: types equal §§4.7, 8.5, 8.6, no binder lost. The four headline theorems statable at the pins are stated; the module docstring names the others with their missing carriers. The description's prose agrees with the head (nine gaps, four theorems).
- Overlap check: read SiegelModularForms, OrthogonalTamagawaAndLatticeMass, ModularityAndLanglandsExtensions, AutomorphicLFunctionsAndLocalFactorsPartII, LatticePackingsAndPerfectForms, Rank24LatticeConstructions, ThetaSeries, AlgebraicCodingTheory; shared: level-one Siegel operator, all-genus theta maps and singular-range statements (owner this roadmap; SiegelModularForms cites §§6.1–6.2, 6.4, 6.7, 7.3, 7.9); regular packet character (owner ModularityAndLanglandsExtensions §3.21, cited).
- Source independence: 16 passages compared with 6 sources, none shared beyond formulas, lists of hypotheses and statements of a dozen words; largest share CT20, 122 of 183 source citations; contents compared with CT20: independent (Layer 3 ↔ §§5.1–5.2 precedes Layer 4 ↔ §3 and Layer 5 ↔ §4, forced by §4.11 needing §3.16 and §5.4 needing §4.13; Layers 6 and 8 mix CL14 V, CT19a and CT20 §§5.3–5.5).

## Not verifiable

- KT87 (uncertified): the determinant formulas of §4.10 were checked only on `λ = (1)`, `(2)` for `Sp₂` and `SO₃`, not against the text.
- Böcherer 1989, Theorem 5 (not in the manifest): read only through BoechererNote.
- Arthur, Weissauer, Freitag, Resnikoff, Erokhin: cited through CT20, CL14 and the suppliers; not read.
- Tai17 Theorems 3.3.3–3.3.5 and Corollary 4.2.4: located (Tai17 lines 2087, 2132, 2179, 3125), the formulas not recomputed.
- The mass values of CT20 Theorems 6–7, the row counts of §§4.13–4.17 and the 181 parameters of `V`: data outside the cached texts; the counts were compared with CT20 lines 1318–1413 only.

## Source issues

- **Error** in CT20 at §2.4.2, (2.4.4) and Corollary 2.9, pp. 19–20: the source says the embedding with coefficients `1/√m` carries the form with diagonal `A/m` to the compressed one and the negative minima agree; it should be coefficients `1/m`, with only the signs agreeing (`A = K = 1`, `m = 2`: `−1`, `−1/2`); affects a stated result.
- **Misprint** in CT20 at §3.3, p. 33 (twice): the source says `P(Sp₁₄)` has 1157 classes under negation; it should be 1158; affects nothing.
- **Misprint** in CT20 at §1.2, p. 5, definition of a regular vector: the source says the condition holds for all `i ≠ j` with `i = j − 1`; it should be for all `i < j`; affects nothing.
- **Misprint** in CT20 at §4.3, proof of Theorem 4, p. 38: the source says the dual pair is treated with `δ = m = 2`; it should be `δ = 0`, `m = 2`; affects nothing.
- **Error** in CT20 at §2.4.7, p. 25: the source says the known set has one element for every odd `w ≥ 11` other than 13; it should be `dim S_{w+1}(SL₂(ℤ))` elements, two at `w = 23`, four at `w = 53`; affects nothing.
- **Misprint** in CT20 at §1.4, p. 11, character of `SO₃`: the source says the denominator is the sine of `2π/i`; it should be the sine of `π/i`; affects nothing.
- **Misprint** in CT20 at §1.4, p. 10, rationality of the masses: the source says Artin `L`-values at non-negative integers; it should be non-positive integers; affects nothing.
- **Misprint** in CT20 at §4.2, proof of Theorem 5, p. 38: the source says the count uses `Sp_{2n}` for `2n ≤ 8`; it should be `2n ≤ 14`, odd ranks up to 15 being needed; affects nothing.
- **Error** in CT20 at §5.2, p. 42: the source says the eigenvalues `0, ±(k_i − i)` are distinct exactly when `k_g > g`; it should be "when", since `g = 1`, `k = 0` gives `0, ±1`; affects nothing.
- **Misprint** in CT20 at Remark 5.3, p. 45: the source says case (H2) gives `k ≥ 2` and then excludes `k = 2`; it should be `k ≥ 3`; affects nothing.
- **Misprint** in CT20 at §5.3.2, after (5.3.1), p. 50: the source says the Rallis relation for `F = ϑ_g(G)` adds a block of length computed from the degree `g₀`; it should be from the genus `g`; affects nothing.
- **Misprint** in CT20 at §4.1, proof of Proposition 4.1, p. 36: the source says `U₁` has 12230 elements, then subtracts from 12293, and places the 187 resistant elements in `U₂`; it should be one count, and `U₁`; affects nothing.
- **Error** in CT20 at §4.1, p. 36: the source says no self-dual class has any of the six multiplicity-free resistant parameters; it should be none outside the known set, the first being the parameter of the known `PGL₁₀` class; affects nothing.
- **Error** in CT20 at Theorem 3, p. 6: the source says all thirteen classes are determined by their weights; it should exclude the two `PGL₂` classes, which share their weights; affects a stated result.
- **Misprint** in CT20 at Lemma 4.3, proof, p. 37: the source says the known set has 15 elements of rank at most four; it should be 16 classes in 15 blocks; affects nothing.
- **Misprint** in BoechererNote at p. 2, the factor `C_g(m/2 + s, 1)`: the source says the product has factors `i − m/2 − s` with constant `2^g`; it should be `i/2 − m/2 − s`, vanishing at `i = m` as its next sentence uses; affects nothing.

## For the human reviewers

- **Declared gaps.** `gap:scalar-lowest-weight-packet-character` (README line 344) has no entry in the `gaps` list of `packages/LevelOneAutomorphicFormsForClassicalGroups/design/plan.json`, which has eight slugs; the intake reads that list to announce gaps.
- **Scope.** The headline theorems are computer-assisted in the source: about 12,000 interval-arithmetic exclusions, full column rank of a 3477 × 2948 matrix, orbital integrals for `Sp₁₆` (CT20 §§3.3, 4.1); their data are on the authors' web page.
- **Licence.** BoechererNote is an unpublished note on an author's page; it is the only source of §8.7's table of orders, which this review recomputed factor by factor.
- **Licence.** The tables of §§6.9, 7.8 and 7.9 state the content of CL14 Table C.5 and CT20 Tables 5–6 in the README's own columns; the 58 regular rows were re-derived here by enumeration, in the same sorted order as CT20 Table 6.
