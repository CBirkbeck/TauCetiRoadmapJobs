# Review of KloostermanMomentsAndPotentialAutomorphy (pull request #2301 at 399a75b)

**Verdict:** needs changes

Three findings, all P3; none blocks. The gate passes and the dependency check shows no UPWARD or CYCLE line.

## R01 (P3) — the excluded case `p = 2`, `k` even is presented as unasserted, while the cited remark records it as proved

**Location:** `TauCetiRoadmap/KloostermanMomentsAndPotentialAutomorphy/README.md:2752` (§11.2, Checks): "For `p = 2` and even `k` no bound is asserted; `Z₆(2; T) = 1 + 7T − 8T²` happens to satisfy it." Same hypothesis at `Suggested.lean:210` (`hpk : p ≠ 2 ∨ Odd k`).

**Claim:** The hypothesis is a limit of this roadmap's route (the moment motive), not of the theorem. The README does not say so, and nothing in Scope and ownership places the remaining case.

**Witness:** FSY line 2317 (Remark 5.28, p. 51, the locator §11.2 cites): Haessig proves (5.29) for all `p ≥ 2`. `Z₁₀(2; T) = 1 + 23T + 2024T² − 2048T³` has valuations `0, 0, 3, 11 ≥ 0, 0, 2, 6`.

**Repair:** Replace the sentence by: "For `p = 2` and even `k` the bound also holds, by Haessig's `p`-adic analysis (as recorded in FSY Remark 5.28, p. 51); that proof does not pass through the moment motive and is not built here, so the corollary and `momentSeries_coeff_dvd` state the cases `p` odd or `k` odd. `Z₆(2; T) = 1 + 7T − 8T²` and `Z₁₀(2; T) = 1 + 23T + 2024T² − 2048T³` (valuations `0, 0, 3, 11`) are instances of the remaining case." Add the same clause to Scope and ownership. (Alternative: drop `hpk` and add Haessig's theorem as a target with its source.)

## R02 (P3) — the pull request description states the coefficient divisibility without its hypothesis

**Location:** pull request description, first paragraph: "whose reciprocal roots have weights `0`, `k` and `k + 1` and whose coefficients satisfy `p^{n(n−1)} ∣ c_n`".

**Claim:** The head states the divisibility only for `p` odd or `k` odd.

**Witness:** `Suggested.lean:209–211`: `theorem momentSeries_coeff_dvd … (hpk : p ≠ 2 ∨ Odd k) (n : ℕ)`; README §11.2 Corollary: "a prime `p` with `p` odd or `k` odd".

**Repair:** "… and whose coefficients satisfy `p^{n(n−1)} ∣ c_n` when `p` is odd or `k` is odd".

## R03 (P3) — locator of §2.4: Proposition 2.7 is in FSY §2.2, which starts on p. 12

**Location:** `TauCetiRoadmap/KloostermanMomentsAndPotentialAutomorphy/README.md:1066–1067`: "(FSY §2.1, Proposition 2.7, p. 12; §2.2, pp. 13–14)".

**Claim:** Proposition 2.7 is not in §2.1, and the definition of the symmetric powers and their rank, which this target states, are on p. 12 at the start of §2.2.

**Witness:** FSY line 506 (heading of §2.2, on p. 12, which begins at line 489); FSY lines 507–511 (definition), 524–528 (rank), 529 (Proposition 2.7).

**Repair:** "(FSY §2.2, pp. 12–14; Proposition 2.7, p. 12)".

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| §0.2 moments (sampled) | `𝔽₂`, `k = 1, 2, 3`; `𝔽₃`, `k = 0, 1`; `p = 2, …, 13`, `k = 1, 2` | `−1, −1, 3`; `2, −1`; first and second moments all `−1` numerically, as the API bullets say | holds |
| §1.2 local structure, pairing (sampled) | `𝔽₂`, `a = 1`; XZ lines 125–130 | `1 + T + 2T²`, roots of modulus `2^{−1/2}`; irreducible, single block, Swan one at lines 127–130 | holds |
| §2.1 Kloosterman connections (sampled) | `r = 2`; FSY lines 441–452 | `θ² − z`, slopes `1/2, 1/2`; operator `(z∂_z)^{n+1} − z`, dual by `z ↦ (−1)^r z` | holds |
| §2.4 symmetric powers (sampled) | `r = 2`, `k = 2`; locator | rank `binomial(3, 2) = 3`; FSY line 529 lies under the §2.2 heading of line 506 | statement holds; locator R03 |
| §3.4 middle cohomology (sampled) | `r = 2`, `k = 1, 3, 4` | full `⌊(k + 1)/2⌋ = 1, 2, 2`; middle `d_k = 0, 1, 0`; FSY line 655 | holds |
| §3.5 exponential realization (sampled) | `r = 2`, `k = 3, 6, 7` | cover/descended `4/2`, middle `3/1`; parity `(−1)^{k+1} = −1` on `d₆ = 2`, `+1` on `d₇ = 3`; FSY line 656 | holds |
| §4.4 motive `M_{r,k}` (sampled) | `k = 1, 2, 3, 4` | `d = 0, 0, 1, 0`; `M₃` weight `2 + 2 = 4`; FSY line 777 has the same projector and twist | holds |
| §5.4 inverse Fourier object (sampled) | `k = 1, 2, 3` | ranks `(k + 1, k) = (2,1), (3,2), (4,3)`; `k = 3`: `τ ∈ {−6, −2, 2, 6}`; FSY lines 1219–1227 | holds |
| §7.2 quadratic singularities (sampled) | `(k, p) = (9, 3), (3, 3), (6, 3)`; `p = 2`, `k` odd | `a ∈ {1, 3}`, constants `6, 18`; `a = 1`; `b ∈ {0, 2}`; `v₂(2k) = 1`; FSY lines 1772–1777, 1972–1977 | holds |
| §8.2 / `momentSeries_eq_intPolynomial` (sampled, headline) | `(p, k) = (3, 9), (2, 12), (3, 8)` by `decide`; first moments | degrees `3, 3, 3`; `m(3; 8) = −1 = −1 + 81 − 81`; `m(3; 12) = −730 = −1 + 729 − 2·729`; `m(2; 10) = 23 = −1 + 24` | holds |
| §8.1 `momentSeries_weights` (headline) | `(k, p) = (3, 2), (6, 3), (8, 2), (1, p)` | roots `−1/4 = 2^{−2}`; `−1/27 = 3^{−6/2}`; `1/16 = 2^{−8/2}`; `Q = 1` | holds |
| §11.2 `momentSeries_coeff_dvd` (headline) | `Z₅(2)`, `Z₉(3)`, `Z₆(5)`; `k = 0`; `Z₁₀(2)`, `Z₁₂(2)` | valuations `0,0,2,6`; `0,0,3,10`; `0,0,2,7`; `v(p² − p) = 1 < 2`; `0,0,3,11` and `0,0,12,12` (excluded case, bound holds) | holds; scope sentence R01 |
| §§8.5–8.6 Euler factors, conductors | `(k, p) = (9, 3), (5, 5), (6, 3), (4, p)`; `N₉`, `N′₈` | `Θ⁺ = {3}`, symbol `(−2/3) = +1`, factor `1 − 243T`; `m(5; 5) = −126`; `1 + 27T`; `1`; `105`; `3` | holds; FSY lines 1950, 1964–1967, 2156–2176 |
| §10.1 determinants (sampled) | `k = 3, 5, 7, 9` | radicands `−3, −15, +105, +945`, each `≡ 1 (mod 4)`; exponents `−2, −6, −12, −20`; FSY lines 2386–2397, 2471 | holds |
| §10.4 completed functions (sampled) | `eulerCoeff` at `n = 0, 1, 6`; `L ≡ 1`; `k = 3` | `1` (junk), `1`, `a₂a₃`; series `1`; `w = s − 2`, `s ↦ 5 − s` is `w ↦ 1 − w`, `Γ((w + 1)/2)` | holds |
| §11.1 potential automorphy (sampled) | sign of the multiplier at complex conjugation | `χ_cyc^{−(k+1)}(c) = (−1)^{k+1}`: `+1` orthogonal, `−1` symplectic; FSY lines 2569–2584, 2613–2622 | holds |
| §11.4 `oddMoment_functionalEquation` (sampled, headline) | `k = 1`; `k = 3` at `p = 2, 3, 5, 7, 11, 13` | `Λ₁ = 1`; reciprocal roots `−4, none, −25, 49, −121, 169 = (p/3)p²`; `N₃ = 3`; sign `i·(−i) = +1` | holds; FSY lines 118–131 |
| §11.5 `evenMoment_functionalEquation` (sampled, headline) | `k = 2, 4, 6` | `Λ = 1` with `r = 0, P = 1, ε = 1`; `d₆ = 2`, `N′₆ = 3`, factor `(1 + 27·3^{−s})⁻¹`; FSY lines 142–146 are existential in `ε, r, L(2; T)` | holds |
| §1.6 invariants at `∞`, `p = 2` | `k = 6, 8, …, 24` by the Molien series of `2.A₄` and the signs of `2.S₄` | dimensions `1,1,0,2,1,1,2,2,1,3`; `(a, b)` at `12, 18, 20, 24`: `(1,1), (1,1), (1,1), (2,1)`; Swan `(k + 1 − dim V^{Q₈})/3 = ⌊(k+2)/4⌋` | holds; Yun-moments lines 1629–1663 |
| §8.2 trivial factors, even `k`, odd `p` | `(k, p) = (6, 3), (8, 3), (12, 3), (4, p)` | `(u, v, m) = (1,1,1), (1,1,2), (2,1,3), (0,0,1)`; degrees `2, 3, 4, 2` equal `momentDegree` | holds; FSY lines 1699–1707 |
| §10.3 local signs, even `k` | `k = 6`, `p = 3` | eigenvalue `3·(−27) = −81` on `V/ker N`; factor `3^{4−s}`; `u − v = ⌊k/(4p)⌋ = 0` | holds; FSY lines 2498–2509 |

- Source locators checked against the text: 53 (FSY 44, XZ 2, Yun-moments 5, Serre-orthogonal 2); one wrong (R03).
- Library declarations opened at the pins: 22. By `#check`: `AddChar.sum_eq_ite`, `AddChar.map_nsmul_eq_pow`, `Algebra.trace_trace`, `Algebra.trace_algebraMap`, `Module.finrank_mul_finrank`, `FiniteField.nonempty_algHom_of_finrank_dvd`, `FiniteField.algebraMap_trace_eq_sum_pow`, `GaloisField.finrank`, `GaloisField.card`, `Complex.natCast_mul_natCast_cpow`, `EulerProduct.eulerProduct_tprod`, `MvPolynomial.hsymm`, `Polynomial.Chebyshev.U`. By file: `MeromorphicNFOn` (`Mathlib/Analysis/Meromorphic/NormalForm.lean:632`), `EllAdicCohomology` (`Mathlib/AlgebraicGeometry/Sites/ElladicCohomology.lean:76`), `SymmetricPower.finrank_eq` (`TauCeti/LinearAlgebra/SymmetricPower/Basis.lean:192`), `range_inf_F_eq_map_F` (`TauCeti/Geometry/Hodge/Mixed/Strictness.lean:110`), `tate` (`TauCeti/Geometry/Hodge/Tate/Basic.lean:93`), and four more.
- Cross-roadmap citations resolved: 152 section or layer headings in 26 roadmaps, on main or at their open heads, and 6 named declarations (`finite_subgroup_SL2_classification`, `finite_subgroup_SL2_conjugate_of_mulEquiv`, `deRham_iff_potentiallySemistable`, `dSt_isWeaklyAdmissible`, `isWeaklyAdmissible_iff_polygon`, `ExtremelyRegularIrreducibility`); none missing. The six declared gaps carry the same slugs in `design/plan.json` and in the README, and none asks for what its supplier already states.
- Gate: every check `0`, build OK. Dependency check: `depcheck: 241 roadmaps, 2192 edges, 0 problem(s)`. Outside-folder diff: empty.
- Elaboration: `lake env lean` on `Suggested.lean`, five `sorry` warnings and nothing else. `#check @name` on the 12 declarations with binders: each elaborated type equals its README statement; nothing lost a binder.
- One-tactic probe (`simp`, `rfl`, `simp` with the definitions unfolded) on `momentSeries_coeff_dvd` and `momentSeries_eq_intPolynomial`: both left open. The other three theorems were decided by reading. No padding; all 17 definitions are used by a headline.
- Overlap check: read KloostermanSheavesAndBesselIsocrystals, MixedHodgeModulesAndIrregularHodgeTheory, PadicDifferentialEquationsAndRigidCohomology, LefschetzPencilsAndVanishingCycles, PotentialAutomorphyDworkMotivesPartII; nothing shared. KloostermanSheavesAndBesselIsocrystals cites §§1.1, 1.3, 2.1, 2.5–2.6 here as owner; PadicDifferentialEquationsAndRigidCohomology §§RD.7.21–RD.7.22 own the `p`-adic conclusions, whose hypotheses §9.1 supplies. No `Suggested.lean` shares a fully qualified name.
- Source independence: 60 passages compared with 4 sources, none shared beyond formulas and standard names; largest share FSY, 75 of 85 parenthesised locators; contents compared with FSY: independent. Layers 2–11 follow FSY §§2–5 in the order the `*Needs:*` lines force (3 needs 2, 4 needs 3, 5–6 need 3, 7 needs 4 and 6, 8 needs 7), not one to one: §5.1 is split over Layers 7–9, and Layer 1 gathers §1.2, §3.2.1, §5.1.1 and Yun-moments §4.3.

## Not verifiable

- Saito-orthogonal: uncertified; checked only that FSY line 2656 invokes it as §11.3 says.
- Fu–Wan, Katz, Haessig, Patrikis–Taylor and Huber–Müller-Stach: read only through FSY's citations of them.
- FSY §4.3 and Appendix A (Layer 6 and the locators A.6, A.13, A.24, A.27, A.30, A.31): not in the sample; pages matched, statements not compared.
- Eight of the thirteen entries of the README's "Corrections to the sources" (FSY pp. 23, 33, 41, 52, 63, 71; XZ; the `E₂^{1,k−2}` consequence): not checked; the other five are confirmed below.

## Source issues

- **Misprint** in FSY at §5.1.1, p. 40 (line 1731): the source says the reciprocal roots are stable under multiplication of the inverse by `p^{(k+1)/2}`; it should be `α ↦ p^{k+1}/α` (at `k = 3`, `p = 2`: `16/(−4) = −4`, while `4/(−4) = −1` is no root); affects nothing.
- **Gap** in FSY at the proof of Theorem 5.17, (5.18), p. 46: the source says three vanishing groups give an isomorphism between the compact cohomology of `K′` and of `K`; it should be a surjection from `K` to `K′` whose kernel is the image of `H^{k−2}(T)`; affects the proof.
- **Gap** in FSY at the proof of Proposition 5.23, p. 50 (lines 2249–2254): the source says every quadratic point is `Q − u(√−p)²` with `u` a unit; it should allow `(√−p)^{2e}`, `e = 1 + v_p(a)`, since the constant term is `2ap` (`18` at `k = 9`, `p = 3`, `a = 3`); affects the proof.
- **Error** in FSY at §5.3.1, p. 55 (lines 2476–2480, with the character fixed at line 2415): the source says the archimedean constant is `i^{(k²−1)/8}` for `exp(−2πix)`; it should be `(−i)^{(k²−1)/8}` (at `k = 3`, `i·(−i) = +1` is the root number of `L(s, χ₋₃)`); affects nothing.
- **Misprint** in Yun-moments at Lemma 4.3.4, p. 37 (lines 1660–1663): the source says the invariant lines carry the twist `(d/2)`; it should be `(−d/2)`, geometric Frobenius `±2^{d/2}` (`Z₁₂(2; T)` has reciprocal roots `±64`); affects nothing.

## For the human reviewers

- The README has a section `## Corrections to the sources` (`README.md:2877–2913`) with thirteen claims of slips in FSY, XZ and Yun-moments; I confirmed five against the texts and did not check the other eight.
- KloostermanSheavesAndBesselIsocrystals (open) states that "scalar ordinarity at every prime and rank is a supplier gap" on this roadmap; this README has no such target. Whether this roadmap takes it is the supplier's decision.
