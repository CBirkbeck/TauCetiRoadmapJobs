<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13156#issuecomment-6868303028 -->
Red team round 2 pass b (claude) of c877c00

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) §1.6 uses `deg Z₂(2; T) = 1`, which no target states

   **Location.** `packages/KloostermanMomentsAndPotentialAutomorphy/README.md:820–822`: "a dihedral image would make
   `Sw_∞(Sym² Kl₂) ≥ 2`, against `Sw_∞(Sym² Kl₂) = dim H¹_c(𝔾_m, Sym² Kl₂) = deg Z₂ = 1` (§§1.4–1.5)".

   **Claim.** §§1.4–1.5 supply `deg Z₂(2; T) = 1`.

   **Witness.** §1.4 gives `Z₂ = det(1 − F_pT | H¹_c)` and §1.5 only integrality; `Z₂ = 1 − T` occurs solely as a Check
   (README:779). The API of §0.2 (README:560–561) has the zeroth and first moments only, and that of §0.3 (README:608–610)
   only `Z₀` and `Z₁`.

   **Repair.** Add to the API list of §0.2, after the first-moment bullet:

   > - The second moment is `−1` for every nontrivial `ψ`: `Σ_{a ∈ Fˣ} Kl₂(a)² = Σ_{x,y} ψ(x + y)·(q·[y = −x] − 1) = q(q − 1) − 1`,
   >   and `h₂(t, q) = t² − q`, so `m₂² = q² − q − 1 − q(q − 1) = −1`.

   Add to the API list of §0.3: "For `k = 2`, `Z₂(p; T) = 1 − T` for every `p`, by the second-moment value of §0.2." In
   §1.6 change "(§§1.4–1.5)" to "(§1.4, and `Z₂ = 1 − T` of §0.3)", and add §0.3 to its `*Needs:*` line. Tested on the
   instance: over `𝔽₂`, `Kl₂(1) = 1`, `1 − 2 = −1`; over `𝔽₃`, `Kl₂ = −1, 2`, `(1 − 3) + (4 − 3) = −1`; over `𝔽₄` the
   computed second moment is `−1`; `Z₂(2; T)` computed to degree 9 is `1 − T`. No cycle: §1.4 at `k = 2` uses §1.3, not
   §1.6.

One new finding, S01 (P3). Both files were read in full (`packages/KloostermanMomentsAndPotentialAutomorphy/README.md`,
2787 lines; `packages/KloostermanMomentsAndPotentialAutomorphy/Suggested.lean`, 232 lines). No finding re-raises a
settled one: the repair report marks nothing `not actionable in this package`.

## Round 1 findings at this head

| Finding | Status | Witness at `c877c00` |
|---|---|---|
| 1a/F01 and 1b/F02 (P2), divisibility headline absent | repaired | `Suggested.lean:196–199`: `theorem momentSeries_coeff_dvd (p : ℕ) [Fact p.Prime] (k : ℕ) (hk : 0 < k) (hpk : p ≠ 2 ∨ Odd k) (n : ℕ) : ∃ c : ℤ, coeff n (momentSeries p k) = (p : ℂ) ^ (n * (n - 1)) * (c : ℂ)`; module docstring lines 19–21; README:2595–2598 (Corollary, with the name) and README:2315. Recomputed below on 42 pairs `(p, k)`. |
| 1a/F02 (P1), differential Galois carrier unowned | repaired | README:332–342 (contract "§5.4 (Picard–Vessiot fields and analytic solutions)"), README:983–987, Needs at README:1016–1018, Layer 2 Dependencies README:1051–1053. The owner paragraph is in §5.4 of DiophantineApproximationAndTranscendence on main (the bold paragraph "Picard–Vessiot fields and analytic solutions", with `K^G = k`, `K^{G⁰}` and path transport). |
| 1a/F03 (P1), local input at `∞` unowned | repaired | New §1.6 (README:786–853); §8.1 proof (README:2092–2095) and §8.2 (README:2129–2130, 2135–2142) cite §1.6; the phrase "§5.2's `ℓ`-adic counterpart" is gone (the two remaining uses of "counterpart", README:149 and :871, are unrelated). Every formula of §1.6 was recomputed (table below). |
| 1a/F04 (P3), scope-only Checks | repaired | The replaced bullets compute: README:1344–1352 (§4.1), :1460–1463 (§4.5), :1764–1766 (§6.3), :1813–1815 (§6.5), :1871–1876 (§7.1), :2549–2554 (§11.1), :2611–2613 (§11.2). Each was recomputed and holds. |
| 1b/F01 (P1), §7.3 open comparison false for `4 ∣ k` | repaired | README:1981–1983: "`π^* : H^{k−1}_c(K)^χ → H^{k−1}_c(K′)^χ` is surjective, and its kernel is the image of `H^{k−2}(T)^χ` under the connecting map, a space of dimension `δ_{4∣k}`"; §7.4 README:2040–2042; §8.4 README:2206–2208; Corrections README:2764–2769. Recomputed: `k = 4`, kernel of dimension 1; `k = 6`, isomorphism. |
| 1b/F03 (P3), PadicHodgeTheory miscited | repaired | README:438–448 (contract), :2600–2603, Needs :2632–2633, Dependencies :2718–2720. `deRham_iff_potentiallySemistable` is in NoncommutativeAndEquivariantIwasawa §F.6 stage 3; `isWeaklyAdmissible_iff_polygon` and `dSt_isWeaklyAdmissible` are in FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.3.2 and §R07.3.3. |

No repair introduced an error that I could find. The one loose end of the repair of 1a/F03 is S01.

## The pass: Suggested.lean declarations

There is no `variable` or `include` line; every binder is in the declaration's own signature. I compared the 22
elaborated types of the worker's signature record with the README statements: none lost a binder, nothing changed
(no Lean was run in this pass). The values below come from exact moments computed in `ℤ[ζ_p]` over `𝔽_{p^m}`:
`p = 2`, `k ≤ 20`, `m ≤ 9`; `p = 3`, `k ≤ 14`, `m ≤ 6`; `p = 5`, `k ≤ 10`, `m ≤ 4`; `p = 7`, `k ≤ 8`, `m ≤ 3`.

| Declaration (layer) | Instances | Values computed | Result |
|---|---|---|---|
| `kloostermanSum` (0) | `𝔽₂`, `a = 1, 0`; `𝔽₃`, `a = 1, 2` | `1, −1`; `−1, 2` | agrees with §0.2 |
| `traceChar` (0) | `m = 0`; `𝔽₄ ⊃ 𝔽₂` at `1`; `𝔽₉ ⊃ 𝔽₃` at `1` | `GaloisField p 0` is `𝔽_p`; `1 = (−1)²`; `ζ₃²` | total; tower law is a power law |
| `symmetricTrace` (0) | `h₂(3, 2)`; `h₃(2, 1)`; `h₂(−1, 2)`, `h₃(−1, 2)` | `7`; `4`; `−1`, `3` | agrees |
| `moment` (0) | `p = 2`, `k = 3`, `m = 1, 2, 3`; `p = 3`, `k = 9`, `m = 1, 2, 3`; `k = 2`, all computed fields | `3, −17, 63`; `53, 115181, −9408475`; `−1` | agrees with README:616, :2243 |
| `momentSeries` (0) | `k = 0`; `k = 1, 2`; `(2, 3)` | `1, 1, 2, 4, …` (`p = 2`), not a polynomial; `1 − T`; `1 + 3T − 4T²` | `0 < k` needed where used |
| `momentSeries_weights` (8) | `(2, 14)`; `(3, 10)`; `(5, 7)`; `(3, 12)` | `Q = (1 + 128T)(1 − 216T + 2¹⁵T²)`; `(1 + 243T)(1 − 252T + 3¹¹T²)`; `1 − 5⁸T²`; `(1 + 729T)(1 − 729T)²` | all roots of norm `p^{−(k+1)/2}` or `p^{−k/2}`, the latter only for even `k` |
| `momentDegree` (8) | the 43 pairs with `k ≥ 1` in the ranges above whose degree is below the computed range | the coefficient of degree `momentDegree p k` is nonzero and every later computed one is `0`, e.g. `(3, 13) → 5`, `(2, 17) → 9`, `(5, 9) → 4`, `(7, 7) → 3` | agrees |
| `momentSeries_eq_intPolynomial` (8) | the same pairs | integer coefficients (the recursion divides exactly), constant term `1` | true on all |
| `thetaPlus`, `thetaMinus` (8) | `(9, 3)`; `(3, 3)`; `(5, 5)`; `p = 2` | `{3}`, `{1}`; `∅`, `{1}`; `∅`, `{1}`; `Θ⁺₂ = ∅` since `v₂(a) = 0` | agrees with FSY line 1798 |
| `oddEulerFactorInv`, `oddEulerFactor` (8) | `(9, 3)`; `(5, 5)`; `(5, 2)`; `(1, p)` | `(1 + 54T + 3¹⁰T²)(1 − 243T)`, Legendre `(−2/3) = 1`; `1 − 125T`; `1 − 4T + 64T²`; `1` | agrees with FSY (5.13) |
| `oddConductor` (8) | `k = 1, 3, 5, 9` | `1, 3, 15, 105` | `= Π sf(j)` |
| `evenEulerFactorInv`, `evenEulerFactor` (8) | `(6, 3)`; `(8, 3)`; `(12, 3)`; `(10, 5)`; `(4, 7)` | `1 + 27T`; `1 + 81T`; `(1 + 729T)(1 − 729T)`; `(1 − 3125T)(1 + 5250T + 5¹¹T²)`; `1` | agrees with FSY (5.3), (5.22) |
| `evenConductor` (8) | `k = 6, 8, 12` | `3, 3, 45` | `= Π oddRad(j)` |
| `middleDim` (8) | `k = 1 … 8` | `0, 0, 1, 0, 2, 2, 3, 2` | `= d_k` |
| `paperGamma` (10) | `d = 0, 1, 2` | `1`; ratio to `Π Γ_ℝ(s − j)` is `π^{1/2}`, `π^{3/2}` | `π^{d(d+1)/4}` |
| `eulerCoeff` (10) | `n = 0, 1, 6`; `L(2) = 2` | `1, 1, a₂a₃`; series `1`, product `2` | Checks of §10.4 hold |
| `momentSeries_coeff_dvd` (11) | all 42 pairs with `p` odd or `k` odd, `k ≥ 1`, in the ranges above, every computed `n`; `k = 0` | holds in all; `Z₁₃(2)`: `0, 0, 2, 6, 12, 20, 30, 42`; `Z₁₀(3)`: `0, 0, 2, 7, 16`; `Z₁₀(5)`: `0, 0, 3, 8, 16`; `k = 0`: `v_p(c₂) = 1 < 2` | true on all; `hk` necessary |
| `oddMoment_functionalEquation` (11) | `k = 1`; `k = 5`; abscissa | `Λ = 1`; `15^{s/2}`, `π^{−s}Γ((s−1)/2)Γ((s−2)/2) ∝ Γ_ℂ(s − 2)`, local factor `1 − 4T + 64T²` = that of a weight-3 form with `a₂ = 1`, `χ(2) = 1`, reflection `w ↦ 3 − w` is `s ↦ 7 − s`; roots of weight `k + 1` give convergence for `Re s > (k + 3)/2` | true as typed |
| `evenMoment_functionalEquation` (11) | `k = 2, 4`; `k = 6`; `k = 8` | `r = 0, P = 1, ε = 1, Λ = 1`; `1 + 27T = 1 − 9a₃T` with `a₃ = −3`, `P = 1 + 8T`, `r = 1`, `s ↦ 8 − s`; `1 + 81T = 1 − 9a₃T` with `a₃ = −9`; `P(2^{−s}) ≠ 0` for `Re s > (k + 3)/2` | true as typed |

Padding probe: no declaration follows by one tactic or one library lemma, restates a definition or mirrors a Check;
all 17 definitions are used by the 5 theorems. Headline theorems of the README: integrality and degree; weights;
coefficient divisibility; Hodge numbers; monodromy and differential Galois groups; classicality and the motive; local
structure, Euler factors and conductors; the compatible system and potential automorphy; the two functional
equations. Stated: 5. Named in the module docstring as not statable: 4 groups. Statable and absent: none.

## The pass: README targets

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| §0.2 second moment (S01) | `𝔽₂, 𝔽₃, 𝔽₄` and all computed fields | `−1` | not a target: S01 |
| §0.3, Examples of Layers 0–1 | `Z₃(5)`, `Z₅(3)`, `Z₄(3)`, `Z₁₂(2)`, `Z₅(2)`, `Z₇(3)` | `1 + 24T − 25T²`; `1 + 26T − 27T²`; `1 − 10T + 9T²`; `1 − T − 4096T² + 4096T³`; `1 − 5T + 68T² − 64T³`; `1 − 91T + 6651T² − 6561T³` | all as printed |
| §1.4 logarithm sign and pairing | `k = 1`; `(2, 3)` | `log(1 − T)`; `16/(−4) = −4` | sound |
| §1.5 Checks | `Z₃(p)`, `p = 2, 5, 7`; `Z₄(7)` | `(1 − T)(1 + 4T)`, `(1 + 25T)`, `(1 − 49T)`; `(1 − T)(1 − 49T)` | sound |
| §1.6 odd `p`: group | index-2 subgroup `ρ(I_t) = P × {±1}`, `det w = −χ(w²)` | order `4p`, `w² = −1` | sound |
| §1.6 Swan conductors | odd `p`: weights `i ≡ k (2)`, `|i| ≤ k`, `p ∤ i`; `p = 2`: `(k + 1 − dim^{Q₈})/3 + (k + 1 − dim^{±1})/6` with `dim^{Q₈} = k/4 + 1` or `(k − 2)/4` | `(k + 1)/2 − ⌊(k + p)/(2p)⌋`, `k/2 − ⌊k/(2p)⌋`, `(k + 1)/2`, `⌊(k + 2)/4⌋`; equal to the computed degree on the 43 pairs | sound |
| §1.6 invariants, `p = 2` | Molien series `(1 + t¹²)/((1 − t⁶)(1 − t⁸))` and `(1 + t¹⁸)/((1 − t⁸)(1 − t¹²))`, even `k ≤ 26` | total `1,0,0,1,1,0,2,1,1,2,2,1,3,2` for `k = 0, 2, …, 26`; `a_k = 1,0,0,0,1,0,1,0,1,1,1,0,2,1`; both match the printed residue classes | sound |
| §1.6 Frobenius at `p = 2` | even `k ≤ 20` | factors `(1 + 8T)` (`k = 6`), `(1 − 16T)` (`8`), `(1 − 64T)(1 + 64T)` (`12`), `(1 + 128T)` (`14`), `(1 − 256T)` (`16`), `(1 − 512T)(1 + 512T)` (`18`), `(1 − 1024T)(1 + 1024T)` (`20`) divide `Z_k(2)` | `a_k, b_k` as stated |
| §1.6 invariants, odd `p` | `(3, 6)`, `(3, 12)`, `(5, 10)` | `1`, `3`, `1` weight-`k` roots; formula `⌊k/(2p)⌋ + δ_{4∣k}` gives `1, 3, 1` | sound |
| §1.6 Checks | lower filtration; `(2, 12)`; `(3, 6)`; `k = 3` | `2/3 + 1/6 + 1/6 = 1`, `7/6`; `64, −64`; `−27`; `Z₃(2) = (1 − T)(1 + 4T)` | sound |
| §2.3, §2.4 | `r·(1/r)`; residue-degree index; rank | `1`; `0 − 2·1 = −2`; `binom(3, 2) = 3`, `binom(4, 2) = 6` | sound |
| §2.5 carrier | `r = 2`; `y′ = y` | closure of monodromy `𝔾_a` against `SL₂`; `𝔾_m` against trivial | the Check discriminates |
| §3.2, §3.6 | `r = 2`, `k = 3` deck signs; `k = 1` | `+, −, +, −`, rank `2`; `g` of degree `2`, `M` of rank `1` | sound |
| §4.1 Checks | `k = 2, 5`; parity `k = 6, 7` | `(3, 3)`; `(2, 4), (4, 2), (6, 6)`; `−1, +1` | consistent with §6.6 |
| §5.1, §5.2, §5.5, §5.6 | `θ(v₀v₁)`; exponents; `d_k`, `k ≤ 10`; `k = 1, 2` | `v₁² + zv₀²`; `k + 1` or `k` nonzero exponents on the cover; `0,0,1,0,2,2,3,2,4,4`; `det = −z`, kernel `u₂ − zu₀` with leading terms `2zu₁ − 2zu₁` | sound |
| §5.7, §6.4, §6.6 | `k = 1, 2, 3`; totals | types `(2,2), (3,3), (4,4)`; `d_k + δ_{4∣k} + 1 = ⌊(k + 1)/2⌋` | sound |
| §6.1 | `k = 2` | `g₁ = 1 + z₁ + z₁²z₂² + z₁z₂²`; `h = 2, 3`; `21` lattice points | sound |
| §6.3, §6.5 Checks | `k = 2`; `k = 3` | `(1, −1, 1)` critical; `F⁴, F³, F²` of dimensions `1, 1, 2`, types `(2,2), (4,4)` | sound |
| §7.1 Checks | `𝔽₂`, `(1, 0)` | `g₁ = 0`, `∂g₁/∂z₁ = 1` | sound |
| §7.2 | `(9, 3)`; `(6, 3)` | constants `6, 18`; orbits `b = 0, 2` | sound |
| §7.3 open comparison | link of a node of odd dimension `n = k − 1`; stabilizer characters, `k = 4, 6, 8` | IC stalk ranks `1` (degree `−n`) and `1` (degree `−1`), `H^{k−2}(T_s)` of rank `2`, so one skyscraper line, the class `h^{(k−2)/2}`; `(u, Ru) ↦ (Ru, u)` keeps `det R`; `χ(σ₀, −1) = +1, −1, +1`; `dim H^{k−2}(T)^χ = 1, 0, 1` | sound; only the inclusion of the image in the `h`-lines is needed on `χ`-parts |
| §8.1, §8.2 | `(3, 12)`; `(3, 10)`; `(5, 10)`; `(3, 8)`; `(2, 10)`; `deg M_k(2)`, even `k ≤ 24` | `u, v, m = 2, 1, 3`; `1, 1, 1`; `1, 1, 1` with sign `+`; `1, 1, 2`; `(1 − T)(1 + 24T + 2048T²)`; `⌊(k + 2)/4⌋ − 1 − a_k − b_k = 2⌊(k + 2)/12⌋ − 2δ_{12∣k}` | sound |
| §8.3–8.6 | `(9, 3)`; `(5, 3)`; `(5, 5)`; `(6, 3)`; dimension count | `243`; `1 + 27T`; `1 − 125T`; `dim V^I = 1`; `k/2 − u − 1 − δ = d_k − u` | sound |
| §9.1 Checks | `(6, 5)`; `(5, 2)` | `1 − 151T + 78275T² − 78125T³`, valuations `0, 0, 2, 7`; `0, 0, 2, 6` | sound |
| §10.1–10.3 | `k = 3, 5`; `d`; `k = 3` | `−3`, `−15` and exponents `−2`, `−6`; `π^{d(d+1)/4}`; `i` | sound |
| §11.1–11.3 Checks | `M₅(2)`; `(6, 3)`; cubic `χ` mod 7 | `2 ± 2√−15`, norm `8`; `F N F⁻¹ = N/3` with eigenvalues `−81 → −27`; `τ(χ)³ = 7J(χ, χ)` | sound |
| §11.5 Checks, Examples | `t₈`; `k = 6, 8` | `1 + 0 + 0 + 1 = 2`; level 6, weights 4 and 6 (FSY line 167, line 172) | sound |

## Dependency check

    depcheck: 240 roadmaps, 2189 edges, 0 problem(s)

No UPWARD or CYCLE line. The overlap listing shows no other open pull request changing this roadmap, no dropped id and
no second copy. `git diff --stat origin/main...HEAD` lists only files under
`packages/KloostermanMomentsAndPotentialAutomorphy/`.

## Verified sound

- Declarations read: 22 of 22 (17 definitions, 5 theorems). Single `import Mathlib`; namespace as required; a docstring
  on each; no `lemma`, `set_option`, `#check`, `#eval`, sorry'd data or free predicate.
- README targets read: all 60 numbered subsections of Layers 0–11 with their Checks, and the supplier contracts.
- Checks recomputed: every Check with a numeric value in Layers 0, 1, 7–11 and the Worked examples, and those listed in
  the table for Layers 2–6 (about 80); none is false. Every definition has at least three Checks.
- Locators verified against the texts (22): Yun-moments §2.3.4 (line 507), §§4.3.1–4.3.2 (lines 1577, 1620), Lemma 4.3.3
  (line 1629), Lemma 4.3.4 and (4.14) (lines 1654, 1743); FSY contents (lines 14–35), Theorems 1.2 and 1.3 (lines 129,
  142), Table 1 (line 165), (5.1)–(5.4) (lines 1681–1729), the involution of §5.1.1 (line 1731), (5.5), (5.7), Theorem 5.8
  (line 1806), (5.13), (5.14), Remark 5.15, §5.1.4 (line 1971), Corollary 5.27 (line 2294), Remark 5.28 (line 2312),
  the end of §5.3.3 (line 2656), Remark 5.41 (line 2660).
- Sibling citations: 46 section ids resolved to a heading at the supplier's head or on main (ArithmeticGaloisRepresentations
  §§1.7, 2.5–2.7, 3.1, 3.3, 5.3, 7.4; EtaleDualityAndPerverseSheaves §§2.3, 2.7, 2.8, 3.3, 5.6, 5.10;
  NoncommutativeAndEquivariantIwasawa §F.6; FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.3.2–R07.3.3;
  LefschetzPencilsAndVanishingCycles §§2.1–2.8, 6.6; CongruenceSpectralGap §§4.2a–4.2b;
  DiophantineApproximationAndTranscendence §5.4; EtaleCohomologyFoundations §§F.0.4, F.2.1–F.2.7, F.4.5, F.10.1–F.10.2b;
  PadicDifferentialEquationsAndRigidCohomology §§RD.6.52a, RD.6.53, RD.6.94–RD.6.98, RD.7.20–RD.7.22). Statements read
  and compared for the nine cited since round 1: perverse Artin vanishing with `H^m_c(X, K) = 0` for `m < 0` (§2.7), the
  decomposition theorem over finite fields (§5.6) and over `ℂ` (§5.10), finite wild image and Swan conductors (§3.1),
  `deRham_iff_potentiallySemistable` (every finite `K/ℚ_p`, `p = 2` included), `isWeaklyAdmissible_iff_polygon`,
  `dSt_isWeaklyAdmissible`, the Picard–Vessiot paragraph, and §RD.7.22 (`k ≥ 1`, `p` odd).
- Pinned declarations: 20 names of the Mathlib and Tau Ceti contracts found at the pins by grep
  (`GaloisField.finrank` and `GaloisField.card` with their hypothesis `n ≠ 0`, `nonempty_algHom_of_finrank_dvd`,
  `Algebra.trace_trace`, `eulerProduct_tprod`, `MeromorphicNFOn`, the two strictness theorems, `TauCeti.Hodge.tate`,
  and the others of the list).
- Declared gaps: the six slugs agree between `design/plan.json` and the README, each with a named supplier; none is
  raised.
- Policy: no pull-request number or process narrative in the README or the docstrings.
- Ownership: searched the open heads and main by object (binary tetrahedral inertia image, Fu–Wan degree, the seven
  definition names). No other roadmap owns the local monodromy of `Kl₂` at `∞`. CharacterSumsOverFiniteFields and
  KloostermanSheavesAndBesselIsocrystals declare `kloostermanSum` and `traceChar` in their own namespaces, so no
  fully qualified name is shared.

## Not verifiable

- Saito-orthogonal: uncertified, cited by locator only.
- The geometric statements of Layers 2–7 (D-module, Hodge-module and toric arguments) beyond the dimension, weight and
  chart computations in the table: checked for internal consistency and against FSY's statements, not reproved.
- The signs of `E⁺` and of the epsilon factors beyond `(9, 3)` and `(6, 3)`.
- FSY locators outside the 17 above, and XZ and Serre-orthogonal: read by the round-1 passes, not reread here.
- Supplier sections whose headings resolve but whose statements were not read this round.
- No Lean was run: the elaborated signatures are the worker's record.
- KloostermanSheavesAndBesselIsocrystals (later in the merge order) declares `gap:scalar-kloosterman-ordinarity` with
  this roadmap as supplier (Newton slopes of `Kl_r⁰` at closed points, every `p` and `r`). No target here states it.
  It is that roadmap's declared gap, so it is recorded and not raised.

## Source issues

- **Misprint** in Yun-moments at Lemma 4.3.4, (4.10), printed page 37: the source says the invariant lines at infinity carry the Tate twist by `d/2`; it should be the twist by `−d/2`, as its own (4.14) gives eigenvalues `±2^{d/2}`; affects a stated result.
- **Error** in Yun-moments at Lemma 4.2.2 and its proof, printed pages 34–35: the source says the diagonal Frobenius parameter is a `p`-th root of unity up to sign, so Frobenius is the scalar `p^{d/2}` on the invariants; it should be: for `p ≡ 3 (mod 4)` its square is minus a `p`-th root of unity, giving `(−1)^j p^{d/2}` on the weights `±2pj` (computed: `−27` at `d = 6`, `p = 3`); affects a stated result.
- **Misprint** in FSY at §5.1.1, printed page 40: the source says the reciprocal roots of the middle polynomial are stable under an involution with exponent `(k + 1)/2`; it should be `α ↦ p^{k+1}/α`; affects nothing.
- **Error** in FSY at the proof of Theorem 5.17, (5.18) and after (5.20), printed pages 46–47: the source says resolving the balanced nodes induces an isomorphism on compact-support cohomology in degree `k − 1`; it should be a surjection whose kernel is the primitive middle cohomology of the exceptional quadrics, of dimension `δ_{4∣k}` on the `χ`-part; affects the proof.

Source independence: 12 passages compared with 2 sources (FSY, Yun-moments), none shared beyond formulas and statement-forced phrases; largest share FSY, 100 mentions against 6 for XZ and 3 for Yun-moments; contents compared with FSY (lines 14–35): independent — the layers regroup FSY §§2–5 in an order forced by the Dependencies lines (3 on 2; 4 on 1–3; 5 on 2–3; 6 on 3–5; 7 on 3, 4, 6; 8 on 1, 4, 7; 9 on 4, 6–8; 10 on 6, 8, 9; 11 on 4, 6–10), not one to one (FSY §5.1 is split over Layers 7, 8 and 9; Layers 0 and 1, §5.7, the boundary localization of §7.1 and the slope theorem of §11.2 have no counterpart section). Saito-orthogonal could not be read; XZ and Serre-orthogonal were not reread in this round.

## For the human reviewers

- **Scope.** One article (FSY, Duke Math. J. 2022) supplies about 100 of 110 source mentions, and Layers 2–11 follow its §§2–5 in dependency order (README "How to read the build"; FSY lines 14–35).
- **Not tested.** Saito-orthogonal (Invent. Math. 1995) is cited through FSY §5.3.3 only; its hypotheses for `gap:orthogonal-motive-root-number` were not read.
- **Source errata.** The README records an error in a published proof (FSY (5.18), README:2764–2769), and this report adds one in Yun-moments Lemma 4.2.2; a specialist may wish to confirm both before they enter the errata register.
- **Companion gap.** KloostermanSheavesAndBesselIsocrystals asks this roadmap for `gap:scalar-kloosterman-ordinarity` (its README, supplier contract for this roadmap); this README has no such target.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "c877c00ac80017dc297e348e8dfd8c813742f972", "job": "RT-KloostermanMomentsAndPotentialAutomorphy~2b", "model": "fable", "worker": "chris-x26"} -->
