# Review of KleinianGroups (pull request #432 at 4eec6e2)

**Verdict:** needs changes

The gate fails at this head (`readme-ids-missing=4`, R04); every other gate check passes, and the dependency check prints `depcheck: 261 roadmaps, 2600 edges, 0 problem(s)`. Three findings block.

## R01 (P2) — The covolume, the fundamental domain and torsion-freeness are stated for two discriminants only; the general theorem is cut

**Location.** `TauCetiRoadmap/KleinianGroups/README.md` lines 45–46: "it does not prove Humbert's formula for a general imaginary quadratic field"; lines 516–517: "It is **not** a target of this roadmap, and contributors should not attempt it from here"; lines 448–449: "torsion-freeness for the two named levels only".

**Claim.** Two special cases, with the general statement displayed as a non-target, are the roadmap's covolume theory.

**Witness.** The README's own locator (Elstrodt–Grunewald–Mennicke, chapter 8) is the formula for every imaginary quadratic `F`; BianchiModularForms (open), README line 110, excludes it too, so no roadmap owns it. Torsion in `Γ(I)` has trace `0, ±1`, forcing `2`, `1` or `3 ∈ I`.

**Repair.** Make Humbert's formula a layer with targets and `*Needs:*` lines (cusps of `PSL(2, O_F) \ ℍ³` and ideal classes; the Eisenstein series on `ℍ³`, its Fourier expansion, continuation and residue), state `covolume_bianchi` in `Suggested.lean` exactly as README lines 510–513 give it (it elaborates at the pins), and keep the two computed covolumes as its Checks. Replace the two-level torsion statement by: for `F` imaginary quadratic and `I ≠ ⊤` with `2 ∉ I` and `3 ∉ I`, `bianchiGamma F ι I` is torsion free (elaborates as `isKleinian_bianchiGamma … (hI : I ≠ ⊤) (h2 : (2 : 𝓞 F) ∉ I) (h3 : (3 : 𝓞 F) ∉ I)`); negative control `I = (1 + i)`: `(1, 1+i; −1+i, −1)` has determinant `1`, trace `0`, lies in the kernel, and has order `2` in `PSL`.

## R02 (P2) — The Moebius action and the Lobachevsky function already have an earlier owner (previous R03, partly repaired)

**Location.** `TauCetiRoadmap/KleinianGroups/README.md` lines 93–94: "This roadmap **owns** the Moebius action of `SL(2,C)` and `PSL(2,C)` on `TauCeti.UpperHalfSpace C`, its coordinate formula"; lines 490–494: "`lobachevsky` as a definition, with `lobachevsky_neg`, `lobachevsky_add_pi`, … the duplication formula, the Fourier series".

**Claim.** No other roadmap plans these objects.

**Witness.** Polylogarithms (open, merge order 330; this roadmap 443), README §2.4 lines 207–215: the same formula with `J = |cw+d|² + |c|²h²`, composition law, `−1`-independence, isometry; line 266: `lobachevsky`, oddness, π-periodicity, duplication, Fourier series; its `Suggested.lean` line 114.

**Repair.** In `## Scope and ownership`, consume Polylogarithms §2.4: delete the Lobachevsky definition, oddness, periodicity, duplication and Fourier-series deliverables of layer 4 and keep only the two values `Л(π/4)`, `Л(π/3)` with `*Needs:* Polylogarithms §2.4`; for the action, cite §2.4 for the coordinate formula, composition law and isometry, and own here only what it lacks (the instance on `TauCeti.UpperHalfSpace ℂ`, `toQuaternion_smul`, `toIsom`, the measure-theoretic instances). Say in the same section that `toIsom` is the `PSL₂(ℂ)` factor of GeometricTopology 7.1's identification of `Isom(ℍ³)` with `PSL₂(ℂ) ⋊ ℤ/2` (main, README line 6695), transported along `UpperHalfSpace.congr`.

## R03 (P2) — Two headline statements that are statable at the pins are absent from `Suggested.lean`

**Location.** `TauCetiRoadmap/KleinianGroups/Suggested.lean` lines 29–31: "the homomorphism to `TauCeti.Isom`, …, the Lobachevsky function, the zeta factorizations … are specified in the markdown rather than represented here"; README completion criteria 1 and 5 (lines 58–61, 74–76).

**Claim.** These headlines cannot be stated, so the file omits them.

**Witness.** Appended to a probe copy and elaborated at the pins (with `import TauCeti.Geometry.Manifold.Riemannian.Isometry.Action`), the three statements below elaborate with `sorry` the only warning. The file does declare `lobachevsky` (line 389), against its own docstring.

**Repair.** Add

```lean
theorem zeta_gaussian_two :
    dedekindZeta GaussianField 2 = riemannZeta 2 * (catalanConstant : ℂ) := by sorry
theorem zeta_eisenstein_two :
    dedekindZeta EisensteinField 2 = riemannZeta 2 * (lchi3 : ℂ) := by sorry
theorem exists_toIsom :
    ∃ f : PSL(2, ℂ) →* Isom 𝓘(ℝ, WithLp 2 (ℂ × ℝ)) ℍ³,
      Function.Injective f ∧ ∀ (g : PSL(2, ℂ)) (p : ℍ³), f g • p = g • p := by sorry
```

and correct the module docstring: name only what is not statable (the Dirichlet domain as data, `UpperHalfSpace.congr`, the quotient manifold) and the carrier each lacks.

## R04 (P3) — Gate: four backticked names the README presents as its own are not in `Suggested.lean`

**Location.** `TauCetiRoadmap/KleinianGroups/README.md` line 295 (`UpperHalfSpace.completeSpace_of_riemannianMetric`) and line 492 (`lobachevsky_neg`, `lobachevsky_add_pi`, `lobachevsky_pi_div_two`).

**Claim.** Each backticked name of the roadmap's own is declared in `Suggested.lean`.

**Witness.** Gate rule `readme-ids-missing`. The first is a library declaration, `TauCeti.UpperHalfSpace.completeSpace_of_riemannianMetric`, `TauCeti/Geometry/Manifold/Riemannian/Hyperbolic/Completeness.lean` line 43, written without its namespace.

**Repair.** Write the first with its full name and file. State the three Lobachevsky facts in prose ("`Л` is odd, `π`-periodic and vanishes at `π/2`"), or drop them with R02.

## R05 (P3) — Padding in `Suggested.lean` (previous R08, partly repaired)

**Location.** `TauCetiRoadmap/KleinianGroups/Suggested.lean` lines 92 (`smul_def`), 123 (`mk_smul`), 169 (`measurableConstSMul`), 231 (`covolume_eq_index_mul_covolume`, after `have`s of lines 169 and 173), 245 (`isCofinite_iff_covolume_ne_top`), 300 and 303 (two `IsCyclotomicExtension` instances), 441 (`hyperbolicVolumes_nonempty`).

**Claim.** Each is a headline or a definition a headline needs.

**Witness.** Probe at the pins: line 441 closes by `⟨_, twenty_catalan_mem_hyperbolicVolumes⟩`; 231 by `MeasureTheory.covolume_eq_card_mul_covolume h`; 169, 300, 303 by `infer_instance`; 92, 123 are `rfl`; 245 restates the structure.

**Repair.** Delete them from `Suggested.lean`; the README keeps each statement as a target.

## R06 (P3) — `NoSmallRationalRatio 1000` is a numerical certificate (previous R09, not repaired)

**Location.** `TauCetiRoadmap/KleinianGroups/README.md` lines 573–586: "With `N = 2000` and `1732050807 / 10⁹ < sqrt 3 < 1732050808 / 10⁹`, exact rational arithmetic places the ratio … the final comparison is `norm_num` on rationals"; lines 23–24, 81; `Suggested.lean` lines 478–485.

**Claim.** This bound is a headline of a general library.

**Witness.** Recomputed: the enclosure is `(0.64462932, 0.64462937)` inside `(78/121, 595/923)`, so the statement is true; the partial sum `G_2000` it needs is a rational with a 3456-digit denominator. The principles exclude certificates and large computations.

**Repair.** Delete `NoSmallRationalRatio` and `noSmallRationalRatio_thousand` from `Suggested.lean`, completion criterion 6's last clause and the summary's "one explicit finite approximation"; keep the enclosure, the Farey pair `595 · 121 − 78 · 923 = 1` and the bound `1044` as one worked example in the README.

## R07 (P3) — `IsKleinian` names the torsion-free groups, against the roadmap's own use of "Kleinian"

**Location.** `TauCetiRoadmap/KleinianGroups/README.md` line 170: "A **Kleinian action** is free and properly discontinuous by isometries"; `Suggested.lean` line 194.

**Claim.** `IsKleinian` is the standard notion.

**Witness.** By `isKleinian_iff_discrete_and_torsionFree`, `IsKleinian bianchiGaussian` is false (`diag(i, −i)` has order `2`), while README lines 27 and 47 use "Kleinian groups" for all discrete subgroups and lines 95–97 list the Bianchi groups under "everything Kleinian".

**Repair.** Name the predicate for what it says, for example `IsTorsionFreeKleinian` (free and properly discontinuous), and reserve "Kleinian group" for a discrete subgroup of `PSL(2, ℂ)`, which `IsCofinite` already carries as a field; rename the three theorems that use it.

## R08 (P3) — The README is not yet in roadmap form (previous R06, partly repaired)

**Location.** `TauCetiRoadmap/KleinianGroups/README.md`, whole file; for example lines 348–349: "Covolume carries monotonicity under inclusion, invariance under conjugation …, the value on the trivial group".

**Claim.** Every definition has its API with hypotheses and three discriminating Checks, every theorem a locator, every layer its Examples and Dependencies.

**Witness.** No `**Checks.**` list under any of the eleven definitions; no `### Examples`, `### Dependencies` or `## Exact supplier contracts`. The quoted bullet has no direction (`Δ ≤ Γ` gives `covol Γ ≤ covol Δ`). Elstrodt–Grunewald–Mennicke is cited by chapter only.

**Repair.** Move the ten acceptance checks under the definitions they test and add the missing ones, each with its computed value, for example: `gaussianDomain` — `(0, 1/2)` is outside and `(0 −1; 1 0)` sends it to `(0, 2)`, inside; the floor has area `1/2`; `bianchiGamma` — the `(5)` example of lines 196–199; `lchi3` — `1 − 1/4 + 1/16 − 1/25 = 0.7725`, limit `0.78130`; `catalanConstant` — limit `0.91597`, and `catalan 2 = 2` is a different object. State each API bullet with hypotheses and conclusion, give theorem or section and page for each cited result, and add the house headings (`## Conventions`, `## Exact supplier contracts`, `## How to read the build`, `### k.n`, `### Examples`, `### Dependencies`, `## Downstream consumers`).

## R09 (P3) — Layer 2 needs layer 3

**Location.** `TauCetiRoadmap/KleinianGroups/README.md` lines 402–404: "*Needs:* layer 1 …; layer 3 (`bianchiGaussian`, `bianchiEisenstein`, their stabilizers of `∞`), for the explicit domains only".

**Claim.** The layers are in build order.

**Witness.** `isFundamentalDomain_gaussianDomain` (layer 2) is stated for `bianchiGaussian` (layer 3); `Suggested.lean` line 254 already places layer 3 first, with a comment saying so.

**Repair.** Move the two explicit domains, their four lemmas and the two theorems into layer 3, after the definitions and the stabilizer of `∞`; layer 2 keeps the Dirichlet domains. No layer number changes.

## R10 (P3) — Milley's theorem is the closed case (previous R10, not repaired)

**Location.** `TauCetiRoadmap/KleinianGroups/README.md` lines 569–570: "below the minimum volume `0.9427` of an orientable hyperbolic 3-manifold (Milley)".

**Claim.** Milley's theorem excludes the two Bianchi covolumes from `hyperbolicVolumes`.

**Witness.** milley2009 line 47: Theorem 1.3 is for closed orientable manifolds; `hyperbolicVolumes` also contains cusped quotients (both named members are cusped).

**Repair.** "below the minimum volume `0.9427` of a closed orientable hyperbolic 3-manifold (Milley, Theorem 1.3) and the minimum `2.0299` of a cusped one (Cao–Meyerhoff, Invent. Math. 146 (2001))"; add the second reference.

## R11 (P3) — A cited library name does not exist (previous R10, not repaired)

**Location.** `TauCetiRoadmap/KleinianGroups/README.md` line 327 and `Suggested.lean` line 244: "`Fuchsian.Covolume.isCofinite_iff_covolume_ne_top`".

**Claim.** That is the pinned declaration.

**Witness.** `TauCeti/Analysis/Complex/Fuchsian/Covolume.lean` line 125, inside `namespace Subgroup` (line 67): the name is `Subgroup.isCofinite_iff_covolume_ne_top`.

**Repair.** Write `Subgroup.isCofinite_iff_covolume_ne_top` in both places.

## R12 (P3) — Process narrative (previous R10, not repaired)

**Location.** `TauCetiRoadmap/KleinianGroups/README.md` line 124: "These conventions prevent two agents from building locally plausible but mutually unusable APIs"; line 517: "contributors should not attempt it from here"; lines 635–636: "an auditor given only the Lean statement … reports back".

**Claim.** The README is timeless.

**Witness.** The three sentences address the people or agents doing the work, not the mathematics.

**Repair.** Delete the first and third sentences; the second goes with R01.

## R13 (P3) — Lean names the README never mentions

**Location.** `TauCetiRoadmap/KleinianGroups/Suggested.lean` lines 295–320 (`GaussianField`, `EisensteinField`, `gaussianEmbedding`, `eisensteinEmbedding`, `gaussianI`, `eisensteinOmega`), 446 and 449 (`twenty_catalan_mem_hyperbolicVolumes`, `eisenstein_mem_hyperbolicVolumes`), 70, 100 (`mobius`, `ofComplex`).

**Claim.** Every Lean name appears in the README.

**Witness.** None of the ten names occurs in `README.md` (searched by name).

**Repair.** Name each in the layer that owns it: the six field names in the convention at README lines 205–207, `mobius` and `ofComplex` at lines 151–160, the two membership theorems in layer 5's Deliverables.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| L0 What to build: coordinate formula | `(0 −1; 1 0)`; `diag(i, −i)`; `(a b; 0 a⁻¹)` | `(−conj w/J, t/J)`, `J = |w|²+t²`; `(−w, t)`; `(a²w + ab, |a|²t)` | agrees with lines 163–167, 617–620 | none |
| L0 factorisation for `c ≠ 0` | `(1/c a; 0 c)(0 −1; 1 0)(1 d/c; 0 1)` | `(a, (ad−1)/c; c, d) = (a b; c d)` | correct | none |
| L0 Deliverables: `cosh_dist` | `(0,1)`, `(0,2)` | `1 + 1/(2·1·2) = 1.25 = cosh(log 2)` | correct; agrees with Polylogarithms §2.4 Check | none |
| L0 Deliverables: `volume_eq_withDensity` | cusp box `[0,1]² × [1, ∞)` | `∫₁^∞ t⁻³ dt = 1/2` | correct | none |
| L0 API: instance topology | metric topology against subtype topology on `ℍ³` | equal by `rfl` on the probe | no diamond | none |
| L1 What to build: fixed points null | `diag(i, −i)`; `−1` in `SL` | vertical geodesic over `0` (uncountable, in a plane); all of `ℍ³` | projective statement needed, as stated | none |
| L1 Deliverables: index law | `Δ = Γ`; infinite index | `1 · covol Γ`; `⊤ · positive = ⊤` | matches pinned `covolume_eq_card_mul_covolume` hypotheses | R05 |
| L1 `isKleinian_iff_discrete_and_torsionFree` | `⊥`; `PSL(2,ℂ)`; `bianchiGaussian` | true/true; false/false; false/false (order-2 element) | iff holds | R07 |
| L1 Design note | Millichap | millichap2017 lines 161–167: Theorem 1.5, pairwise incommensurable knot complements of equal volume | supported | R08 (locator) |
| L2 What to build: Gaussian floor | stabilizer of `∞`: `w ↦ ±w + b` | half-square area `1/2`; `max |w|² = 1/2`; `|c|² ≥ 2 ⇒ 2t² > 1` | disjointness argument closes | R09 |
| L2 What to build: Eisenstein floor | vertices `0`, `(1/2, ±1/(2√3))`, `(0, 1/√3)` | area `1/(2√3)` = one third of the hexagon; `max |w|² = 1/3`; `3t² > 2` | correct | R09 |
| L3 Deliverables: indices | `SL(2, 𝔽₅)`, `SL(2, 𝔽₇)`; `2 ∉ I` | `120/2 = 60`, `336/2 = 168`; `N(2+i) = 5`, `N(3+ω) = 7` | correct | none |
| L3 convention: `(5)` in `ℤ[i]` | `(2i 5; −5 12i)` | `det = −24 + 25 = 1`; `(2i)² ≡ 1`; `14400/4 = 3600`, `14400/2 = 7200` | correct | none |
| L3 torsion-freeness | traces `0, ±1`; `tr ≡ 2 mod I` | `2, 1, 3` have norms `4, 1, 9`, not multiples of `5` or `7`; `I = (1+i)` has `2`-torsion | two cases sound; general statement available | R01 |
| L4 What to build: integrals | `a = π/4`, `π/6` in `Л(3a)/3 − Л(a) + 2Л(π/2 − a)` | `(2/3)Л(π/4)`; `2Л(π/3) − Л(π/6)`; numerically `0.305322`, `0.169157` | correct | none |
| L4 Deliverables: `Л` values | quadrature against series | `Л(π/4) = 0.45798 = G/2`; `Л(π/3) = 0.33831 = √3·L/4`; `Л(π/6) = 0.50747 = (3/2)Л(π/3)` | correct | R02 |
| L4 covolumes and Humbert | `d = −4`, `−3` | `8ζ(2)G/(4π²) = G/3 = 0.3053219`; `3^{3/2}ζ(2)L/(4π²) = √3L/8 = 0.1691569` | agree | R01 |
| L4 manifold volumes | `60 · G/3`, `168 · √3L/8` | `20G = 18.31931`, `21√3L = 28.41836`; ratio of ratios `5/14` | correct | none |
| L5 Deliverables: `mul_index_mem_hyperbolicVolumes` | `Δ = Γ`; index `n` | `1 · v`; `n · v`, witness `Δ` | holds | none |
| L5 `rat_ratio_of_commensurable` | `Γ = Δ`; `Δ ≤ Γ` of index `n` | `q = 1`; `q = 1/n` | holds | none |
| L5 API: non-membership | `G/3 = 0.3053`, `√3L/8 = 0.1692` | below `0.9427` (closed) and `2.0299` (cusped) | true; citation incomplete | R10 |
| L5 The finite approximation | `N = 2000` enclosure | ratio in `(0.64462932, 0.64462937)`; `78/121 = 0.6446281`, `595/923 = 0.6446371`; `595·121 − 78·923 = 1` | true | R06 |
| L5 Design note / `ThurstonQuestion23` | `w = 0`; non-orientable manifolds | excluded by positivity; double cover doubles volume | faithful to thurston1982 line 913 | none |
| `isDiscrete_bianchi` | `F = ℚ(√2)` with a real embedding | `SL(2, ℤ[√2])` is not discrete in `SL(2, ℝ)` | hypothesis needed and present | none |

- Previous review: R01, R02, R04, R05, R07 repaired; R03, R06, R08 partly (R02, R08, R05 here); R09 not (R06); of R10, the `π/6` constant and the list are repaired, three bullets are not (R10–R12).
- Source locators checked against the text: 5 (thurston1982 line 913, printed p. 380; milley2009 line 47; millichap2017 lines 161–167; milnor1982 lines 338 and 351).
- Library declarations opened at the pins: `TauCeti/MeasureTheory/Group/FundamentalDomain.lean` lines 140, 315, 358, 368, 382; `…/ProperlyDiscontinuous.lean` line 99; `Topology/Algebra/GroupAction/FreeLocus.lean` line 122; `Geometry/Manifold/Riemannian/VolumeDensity/Volume.lean` line 82; `…/VolumeDensity/Isometry.lean` line 215; `…/Isometry/UpperHalfSpace.lean` lines 133, 397; `…/Isometry/Group.lean` line 49; `…/Hyperbolic/UpperHalfSpace/Basic.lean` lines 91, 406; `…/Hyperbolic/Completeness.lean` line 43; `…/GeometricStructure/Basic.lean` line 84; `…/ModelGeometry/Basic.lean` line 87; `Topology/Algebra/Group/Subgroup.lean` line 164; `Analysis/Complex/Fuchsian/Covolume.lean` lines 90, 125; Mathlib `NumberTheory/NumberField/DedekindZeta.lean` line 50.
- Cross-roadmap citations resolved: GeometricTopology 7.1 on main (README lines 6685–6704: quotient theorem, volume of a fundamental domain, `y⁻ⁿ dx dy`); AdelicAlgebraicGroups AA.3.4 on main (lines 3238–3254, `Reduction.levelArithmetic`, and the adapter row at line 5726); FuchsianOrbifolds on main (line 37).
- Gate: only `readme-ids-missing=4` fails; `build=0`, `sorry-data=0`, `set_option=0`, imports clean. Dependency check: `depcheck: 261 roadmaps, 2600 edges, 0 problem(s)`, no UPWARD or CYCLE line. No change outside the roadmap folder.
- Elaboration: a verbatim copy of lines 1–485 plus probes elaborates with 43 `sorry` warnings and no other diagnostic from the original lines. The file has no `variable` block, so no declaration can lose a section binder; the 75 elaborated signatures were read against the README.
- Probes that did not close in one tactic (kept as targets): `SecondCountableTopology PSL(2, ℂ)`, `LocallyCompactSpace ℍ³`, `countable_of_discrete`, `one_smul'`. `T2Space PSL(2, ℂ)`, `T2Space ℍ³` and `OpensMeasurableSpace ℍ³` synthesize, as the README says.
- The pull request's title and description agree with the head (a new roadmap, its two suppliers, no `sorry` bodies).

Overlap check: read FuchsianOrbifolds, AdelicAlgebraicGroups (main), ArithmeticFuchsianGroups, BianchiModularForms, BallQuotientsAndComplexHyperbolicLattices, MaassForms, FuchsianOrbifoldsPartII (open), and Polylogarithms; shared objects: the Moebius action on the half-space and `lobachevsky`, owner Polylogarithms §2.4 (R02); `isDiscrete_bianchi`, owner here by AdelicAlgebraicGroups' adapter row; BianchiModularForms, MaassForms and QuaternionicModularForms consume layers 0–4 and own none of it.

Source independence: 7 passages compared with 5 sources (thurston1982, milley2009, millichap2017, milnor1982, neumannyang1999), none shared beyond the nine words of Thurston's question, which the statement forces; largest share Elstrodt–Grunewald–Mennicke, 3 of 6 claim-level locators; its text and table of contents could not be read, so the contents comparison rests on the three chapter subjects the README names (layers 0, 2–3 and the Humbert paragraph against chapters 1, 7, 8): not one to one, layers 4 and 5 have no counterpart.

Research link: Layer 4 proves the `d = −4, −3` cases of Humbert's volume formula (Humbert 1919; Elstrodt–Grunewald–Mennicke 1998, ch. 8; Milnor 1982 for the Lobachevsky route); layer 5 states question 23 of Thurston 1982, p. 380. Rests on the README's references and thurston1982 line 913, milnor1982 lines 451–479.

## Not verifiable

- Elstrodt–Grunewald–Mennicke, *Groups Acting on Hyperbolic Space* (egm1998): Springer, paywalled; chapters 1, 7, 8 are cited without theorem numbers and could not be opened.
- Maclachlan–Reid, GTM 219, and Ratcliffe, GTM 149: paywalled; cited in the references only, with no locator.
- Humbert, C. R. Acad. Sci. Paris 169 (1919): no legal copy found by the sources service; the formula was checked numerically at `d = −4, −3` and against milnor1982 lines 451–479, which reports it.
- Cao–Meyerhoff (the cusped minimum volume used in R10): not fetched; cited from the previous review's value.

## Source issues

- none

## For the human reviewers

- **Licence.** README lines 663–666 say the domains, indices, integration route and ratio bound "were first formalized in" the repository `t4v1/thurston23`; its licence and how much of `Suggested.lean` is adapted from it were not checked.
- **Not tested.** Elstrodt–Grunewald–Mennicke has the largest share of the locators (3 of 6); neither its text nor its table of contents could be read, so wording and arrangement were not compared with it.
- **Scope.** Whether a roadmap whose covolume theorems cover two discriminants, with Humbert's general formula outside it, is an acceptable scope is the question behind R01; BianchiModularForms and MaassForms (open) already consume it in that form.
