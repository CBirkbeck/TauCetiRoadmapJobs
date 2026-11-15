# Review of EllipticCurveModularityPartII (pull request #1491 at 99111f0)

**Verdict:** accepted

Incremental re-review of the 149 lines changed in the folder since `cd7c37d`. No findings. The acceptance is conditional on the declared gap `gap:mixed-modular-jacobians` (ModularCurvesPartII).

## Previous findings

- R01 — repaired: README line 1151 reads "§2.0's `GeometricTorsion` and `torsionRepresentation` and §5.1's `FullRationalTwo` (EC.6)".
- R02 — repaired: §2.2 (line 351) calls `deletionLevel` "this roadmap's rendering of that M₀ on the pinned carriers … consumed together with them"; line 1151 lists it under EC.1 and says ErdosProgressionPowers §1.7 restates it.
- R03 — repaired: the description says EllipticModularityEffectiveComparisons "planned the same results under its own layer numbering; its pull request (#1810) was closed as a duplicate of this one, and this roadmap owns them"; #1810 is not in the index of open pull requests.

## Verified sound

### Adversarial table (statements the diff changes or adds)

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| `sharpF` (§1.5) | N = 0, 1, 11, 35, 47 | 0 (convention); g⁺=0 → 1; μ=12, g⁺=1 → (√2+1)² = 5.828; μ=48, g⁺=3 → (1+√8)⁶; μ=48, g⁺=4 → (1+2√2)⁸ = 46149.08 | agrees with Kraus (7) and the Checks |
| `sharpG` (§1.6) | N = 0, 1, 4, 11, 15 | 0; lcm=4, μ(4)=6 → 4; 4 (μ(16)=24 would give 9); μ(44)=72 → 13+4√3 = 19.928; μ(60)=144 → 25+4√6 = 34.798 | agrees with Kraus (8) |
| `sharpH` (§1.7) | N = 0, 1, 4, 11; bound 4 ≤ H♯ | max(0,0)=0, closed by `simp` on a scratch copy; max(1,4)=4; 4; 19.928; 4∣lcm(N,4) ⇒ μ ≥ 6 ⇒ G♯ ≥ (1+1)² = 4, so H♯ < ℓ forces ℓ ≥ 5 | sound |
| §2.2 new bullet M₀ ≥ 1 | pins | `algorithmicConductor_ne_bot` (ideal ≠ ⊥) and `Ideal.absNorm_eq_zero_iff` give M ≠ 0; M₀ = M / (divisor of M) ≥ 1 | sound; junk `sharpF 0` never reached |
| `deletion_level_realization` (§3.4), route | each case of a prime q ≤ μ(M₀)/6 | g⁺ ≥ 1 ⇒ F♯ ≥ μ/6+2√(μ/6)+1 > μ/6, so q < ℓ; q∣M₀: c_q ∈ {0, ±1}; q∤M: conjugates of c_q−a_q bounded by 4√q ≤ (√q+1)²; deleted q: 0 < \|c_q∓(q+1)\| ≤ (√q+1)²; §2.1 gives ℓ ≤ (√q+1)^(2d) ≤ F♯ | each step holds; matches Kraus Lemma 1 and BS Lemma 2.1 |
| same, positive control | 11a1, ℓ = 11 | Δ = −11⁵, 11∤5 ⇒ M₀ = 11; F♯ = 5.828 < 11; a₂ = −2, disc −4 ≡ 7, no root of x²+4 mod 11 ⇒ irreducible; C = E | holds |
| same, negative controls | 11a1, ℓ=5; 26b1 `[1,−1,1,−3,3]`, ℓ=7; 141a1 `[0,1,1,−12,2]`, ℓ=7 | M₀=1, F♯=1, rational 5-torsion; c₄=129, Δ=−2⁷·13, M₀=13, g⁺(13)=0, (1,0) has order 7 (computed); c₄=592, Δ=3⁷·47, a₂=−2, −4≡3 nonsquare mod 7, M₀=47, F♯=46149 > 7 | irreducibility excludes the first two, the threshold the third |
| same, ℓ = 3 | g⁺(M₀) ≥ 1 vs = 0 | g⁺ ≥ 1 ⇒ M₀ ≥ 11, μ ≥ 12, F♯ ≥ 5.828 > 3: hypothesis fails; g⁺ = 0: the level-M₀ newform of deletion-level-lowering cannot exist | consistent with BS Theorem 3 (ℓ ≥ 3) |
| `deletion_level_full_two_realization` (§5.6), route | q ≤ μ(lcm(M₀,4))/6, q∤2M₀ | (√q+1)² ≤ G♯ < ℓ; q∤M: \|a_q(C₀)−a_q(E)\| ≤ 4√q < (√q+1)² < ℓ ⇒ equal; deleted q: 0 < \|a_q∓(q+1)\| ≤ (√q+1)² < ℓ, contradiction | each step holds; §§4.3 and 4.6 are stated at a general conductor |
| same, controls | 15a1 `[1,1,1,−10,−10]`; 11a1 at ℓ=23; ℓ ∈ {2, 3} | 4x³+5x²−38x−39 = (x+1)(x−3)(4x+13), c₄=481, Δ=3⁴·5⁴, F♯(15)=9, H♯(15)=34.798, first prime 37; H♯(11)=19.928 < 23, −4≡19 nonsquare mod 23, a₃=−1 ⇒ #C(𝔽₃)=5 odd; H♯ ≥ 4 makes the hypothesis false | holds; full two-torsion of E is needed; no ℓ ≥ 5 hypothesis is missing in the Lean |
| §4.8 level comparison | q ≠ ℓ multiplicative, additive potentially good, additive potentially multiplicative; ℓ = 3 | exponent 0 iff ℓ∣ord_q(Δ); inertia image of order dividing 24, prime to ℓ ≥ 5, same invariants on E[ℓ] and V_ℓ; ramified quadratic twist, exponent 2 both; at ℓ=3 an inertia image of order 3 has a fixed line in E[3], exponent drops | sound for ℓ ≥ 5; ℓ ≥ 5 is needed |
| §6.0f via GroupSchemesOverABase §4.5 | E³ with B₁=E×E×0, B₂=E×0×E; α_p | intersection E×0×0: proper, dimension 1, not affine, outside the `IsAffine` hypothesis of Tau Ceti's theorem; α_p: tangent dimension 1, dimension 0, excluded by `[CharZero k]` | the imported statement covers the use |

The rows for every other statement stand as in the previous review, of `cd7c37d`.

- Sources (5 locators, all supporting the text): Kraus1997 lines 239–244 (eq. (7), p. 1143), 270–283 (eqs. (8)–(9), p. 1144), 249–258 and 284–297 (Theorems 3–4, Lemma 1, p. 1144); BS2020 lines 164–207 (eq. (3), Theorem 3, Lemmas 2.1–2.2, pp. 358–359), 213–239 (majorants F, G, H and Theorem 4, p. 360). Seeded targets falling in changed passages: 1.6, 1.8, 3.4; the other twelve are untouched.
- Library declarations opened at the pins: Mathlib `Ideal.absNorm_eq_zero_iff` (`RingTheory/Ideal/Norm/AbsNorm.lean:398`); Tau Ceti `WeierstrassCurve.algorithmicConductor_ne_bot` (`TateAlgorithm/Reduction/Conductor.lean:115`), `smooth_of_grpObj_of_charZero` (`AlgebraicGeometry/Group/Cartier.lean:32`, with `[IsAffine G.left]`), `Newform.qExpansion_coeff_prime_eq_zero_of_sq_dvd` (`Newforms/BadPrime/Vanishing.lean:101`) and `qExpansion_coeff_prime_sq_of_factorization_eq_one` (`Newforms/BadPrime/Classification.lean`).
- Cross-roadmap citations resolved: GroupSchemesOverABase §4.5 at the head of its pull request (README lines 818 and 852; `Suggested.lean` line 302, `smooth_of_charZero` with `[CharZero k]`, `[LocallyOfFiniteType G.X.hom]`, no affineness; it names this roadmap only as a consumer, line 1428); ErdosProgressionPowers §§1.7 and 1.12 and its EC.0–EC.6 table (README lines 657–663, 1119, 1195); SerreWeightAndLevelOptimisation §§6.1–6.3 as in the previous review.
- Gate rerun at `99111f0`: every counter 0, `OK` (the worker's gate adds `build=0`); nothing changed outside the folder. Dependency check: `depcheck: 245 roadmaps, 2241 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `Suggested.lean` gives 17 `declaration uses sorry` warnings and nothing else; the elaborated types of the five new declarations (`sharpF`, `sharpG`, `sharpH : ℕ → ℝ` and the two realization theorems) agree with README §§1.5–1.7, 3.4 and 5.6, with no lost binder. One-tactic probe (`simp_all`, `aesop`, `rfl`, `C := E`) closes neither new theorem; the three new definitions are needed to state them. The module docstring names Kraus's forms at N(E[ℓ]) as not statable.
- Description against the head: the sorry count (17), the supplier sentence on GroupSchemesOverABase §4.5, the depends-on entry #1522 and the EllipticModularityEffectiveComparisons paragraph all match; the summary's realization sentence describes §§3.3 and 4.7, which the head keeps.
- Overlap check: read EisensteinIdealAndRationalTorsion, ErdosProgressionPowers, EllipticCurveModularity (open) and ModularForms (main); the third list is empty; `deletionLevel`: owner this roadmap (§2.2), restated in ErdosProgressionPowers §1.7; `sharpF`, `sharpG`, `sharpH` and the two realization theorems are declared nowhere else.
- Source independence: changed passages only — 7 passages (§§1.5–1.7, 3.4 statement and route, 4.8, 5.6, two docstrings) compared with 2 sources (Kraus1997, BS2020), none shared; largest share Lemos2017, about 15 of 69 locators by a pattern count; arrangement not compared again (no layer added, removed or reordered).
- Remarks, no change requested here: ErdosProgressionPowers §1.7 still defines `deletionLevel` with its own API and Checks without citing §2.2, and FaltingsFinitenessAndIsogenyTheoremsPartII says §6.0f proves Cartier's theorem; both belong to those pull requests. README gap slugs `kato-labelled-pushforward` and `kato-labelled-reciprocity` are not in `design/plan.json` (settled earlier as not actionable in the package).

## Not verifiable

- **Kenku1982**, pp. 199–201 (§§5.0b, 5.2): uncertified, cited by its locator; neither section changed.
- Whether #1810 was closed "as a duplicate": only that it is no longer open was checked.

## Source issues

- none

## For the human reviewers

- none
