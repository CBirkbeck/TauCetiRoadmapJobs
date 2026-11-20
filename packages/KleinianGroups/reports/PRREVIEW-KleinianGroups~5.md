# Review of KleinianGroups (pull request #432 at e85a407)

**Verdict:** needs changes

**Summary.** Changes are needed for one reason: Layer 2 defines the Dirichlet domain and plans the proof that it is a fundamental domain, while the pinned Tau Ceti already has both in general, so the definition is a second copy and the plan re-proves a library theorem. The three findings of the previous review are repaired, every statement and Check of the five layers survived recomputation, and `Suggested.lean` elaborates with `sorry` as its only warning. There are two small corrections, three format notes and one question, none blocking; the licence of the cited prior formalization is left to the human reviewers.

## R01 (P2) — Layer 2 defines and re-proves the Dirichlet domain that the pinned Tau Ceti already has for every isometric action

An implementer following §2.1 would write a second `dirichletDomain` and prove closedness, covering and disjointness for `ℍ³` anew, although the library has done all three for every properly discontinuous isometric action on a proper metric space; and the supplier contracts, which name no Dirichlet-domain file, hide that.

At the pin, `TauCeti.dirichletDomain G p` (`TauCeti/MeasureTheory/Group/DirichletDomain/Basic.lean`, line 79) is `{x | ∀ g : G, dist x p ≤ dist x (g • p)}`; on a probe copy of `Suggested.lean` with that module imported, `dirichletDomain Γ p₀ = TauCeti.dirichletDomain Γ p₀` closes by `rfl`. In the same file `TauCeti.isFundamentalDomain_dirichletDomain` (line 299) proves `IsFundamentalDomain G (dirichletDomain G p) μ` from `IsIsometricSMul`, `ProperSpace`, `ProperlyDiscontinuousSMul`, `stabilizer G p = ⊥` and the nullity of the equidistant set of any two distinct orbit points. The two API bullets of §2.1 are there too: `TauCeti.locallyFinite_smul_dirichletDomain` (line 278) and `TauCeti.smul_dirichletDomain` (line 225). Tau Ceti's Fuchsian theorem `Subgroup.isFundamentalDomain_dirichletDomain` (`TauCeti/Analysis/Complex/Fuchsian/DirichletDomain/Basic.lean`, line 63) is the two-dimensional model: one application of the general theorem with `UpperHalfPlane.volume_setOf_dist_eq_dist`.

The smallest change: drop the definition from `Suggested.lean` and state `isFundamentalDomain_dirichletDomain` with `TauCeti.dirichletDomain Γ p₀` (one more `TauCeti` import); list the two pinned declarations under "From Tau Ceti"; and replace the route of §2.1 by what is new for `ℍ³`: the action is isometric (§0.2), `ℍ³` is proper (from completeness, §0.4), the action is properly discontinuous (§1.1), and the equidistant set of two distinct points is null, being a vertical plane or a hemisphere by `cosh_dist`. That last statement is the layer's real target and deserves to be named as one. The theorem for `ℍ³` stays.

## C01 — The scope section still says this roadmap adds the Euler product of `ζ_F(2)`

In "Scope and ownership", the AdelicAlgebraicGroups boundary (line 672) ends "this roadmap adds the Euler product of `ζ_F(2)` and the archimedean comparison", while §4.5 (line 496) says the Euler product is Tau Ceti's `TauCeti.dedekindZeta_eulerProduct_hasProd` and "neither is planned again here". The sentence describes the text before §4.5 was repaired. Write "this roadmap adds the archimedean comparison; the Euler product is Tau Ceti's".

## C02 — The docstring of `hyperbolicVolumes` omits "orientable"

The README (summary, §5.1, scope) now says the set is the volumes of the orientable manifolds and explains why; the docstring in `Suggested.lean` (line 445) still reads "The volumes of finite-volume hyperbolic `3`-manifolds". A reader of the Lean file alone gets the wider claim. Insert "orientable".

## N01 — Elstrodt–Grunewald–Mennicke is still cited by chapter only

The classification by trace (§1.2, line 213) and the Bianchi domains (§3.5, line 376) cite "Chapter 1" and "Chapter 7"; a section or theorem number with its page would let a reader check the two statements. This was a format note of the previous review and is unchanged.

## N02 — "The Tau Ceti suppliers listed above" are now below

The Dependencies paragraph of Layer 0 (line 187) points upward to supplier contracts that stand at the end of the README.

## N03 — In §3.3 "`A ≢ ±1`" should be "`A ≠ ±1`"

At line 336 the matrix `A` lies in the kernel, so `A ≡ 1 mod I`; with no modulus named, `≢` reads as a congruence modulo `I`, which is not what is meant.

## Questions for the author

- §5.1 (line 568) says that adding the non-orientable manifolds "changes the set". Is a non-orientable manifold known whose volume is not that of an orientable one? The obvious candidate, the Gieseking manifold of volume `1.0149…`, does not decide it as far as I recall, since a closed orientable manifold of the census has the same volume; I did not find a source either way, so I could not check the sentence. "May change the set" would be safe, and the conclusion about rational relations does not depend on it.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 0.1 Möbius action | `(0 −1; 1 0)` at `(1,1)`; `diag(i,−i)`; `diag(a,a⁻¹)`; supplier formula | `J = 2`, image `(−1/2, 1/2)`; `J = 1`, `(−w, t)`; `(a²w, a²t)`; same formula as Polylogarithms §2.4 | Checks hold | none |
| 0.2 `exists_toIsom` | `(a b; 0 a⁻¹)`; `(0 −1; 1 0)` | `w ↦ a²w + ab`, `a² = |a|²·(a/conj a)`; inversion then `w ↦ −conj w` | Checks hold | none |
| 0.3 Volume | cusp box; `t ∈ [1,2]`; densities `t⁻²`, `t⁻¹` | `1/2`; `3/8`; `∫₁^∞ t⁻² = 1`; `∫₁^∞ t⁻¹ = ∞` | repaired Check true | none |
| 0.4 Distance | `(0,1),(0,2)`; `(0,1),(1,1)`; `arsinh` form | `cosh = 5/4 = cosh log 2`; `3/2`; `sinh²(d/2) = ‖p−q‖²/(4hh′)` | correct; metric topology is the carrier's by `rfl` | none |
| 1.1 torsion-free iff | `⊥`; non-discrete `Γ`; `⟨diag(i,−i)⟩`; image of `SL(2,ℤ)` | both sides true; `γ_n → 1` gives infinitely many returns, both false; fixes axis; `(0 −1; 1 0)² = −1` | iff holds both ways | none |
| 1.2 fixed sets, free locus | elliptic; parabolic; `−1 ∈ SL` | a geodesic; empty; all of `ℍ³` | `PSL` statement needed and stated | N01 |
| 1.3 covolume, index law | pinned hypotheses; translations by `ℤ[i]`; `Γ(2+i)` | `Γ` countable with a domain, `Δ ≤ Γ`; column of infinite volume; `60·G/3 = 20G` | agrees with pinned `covolume_eq_card_mul_covolume` | none |
| 2.1 Dirichlet domain | `rfl` against the pinned definition; `⟨w ↦ w+1⟩`; centre on a fixed axis | equal by `rfl`; `|re w| ≤ 1/2`; whole space | true, already in Tau Ceti in general | R01 |
| 3.1 definitions | `(2i 5; −5 12i)`; `I = (2)`; `σ` | `det = −24+25 = 1`, `(2i)² ≡ 1 (5)`, `2i−1` of norm `5`; `14400/4 = 3600`, `14400/2 = 7200`; `6·8 = 48`; `ι∘σ` gives level `σ(I)` | correct | none |
| 3.3 torsion | `(1, 1+i; −1+i, −1)`; `(1, √−3; √−3, −2)`; `I = ⊥` | `det = −1+2 = 1`, `tr 0`; `det = −2+3 = 1`, `tr −1`; trivial group | both hypotheses needed; `2 − tr ∈ {1,2,3}` | N03 |
| 3.4 named groups | `i ↦ 3`; `ω ↦ 4`; orders | `9+1 ≡ 0 (5)`; `16+4+1 = 21 ≡ 0 (7)`; `120/2 = 60`, `336/2 = 168` | correct | none |
| 3.5 Bianchi domains | floors; norms of `c`; `(0,1/2)` | areas `1/2`, `1/(2√3) = (√3/2)/3`; `2(1−1/2) = 1`, `3(1−1/3) = 2 > 1`; image `(0, 2)` | disjointness argument closes | N01 |
| 4.1 constants | 4 terms; `4·10⁶` terms | `0.908481`, `0.7725`; `0.9159656`, `0.7813024` | correct | none |
| 4.2 log-sine integrals | quadrature against series; `sin(mπ/3)`, `m = 1..6` | `−I = 0.45798, 0.33831, 0.50747`; pattern `1,1,0,−1,−1,0` gives `(3/2)·lchi3` | correct | none |
| 4.3 domain volumes | polar integrals; density `t⁻²` | `0.3053219`, `0.1691569`; `0.55129`, `0.31215` | repaired Check true | none |
| 4.4 manifold volumes | index law | `20G = 18.31931`, `21√3·L = 28.41836` | correct | none |
| 4.5 zeta factorizations | `p = 5, 3, 2` in `ℤ[i]`; pinned theorem | `(1−5⁻²)⁻²`; `(1−9⁻²)⁻¹`; `(1−2⁻²)⁻¹`; hypotheses `finrank = 2`, `Re s > 1` | cites the pin | C01 |
| 4.6 Humbert | `d = −4, −3, −7`; constant | `0.3053219`, `0.1691569`, `0.8889149` with `L(2,χ₋₇) = 1.1519255`; `c = 48ζ(2) = 8π²` | repaired Check true; agrees with Milnor's report | none |
| 5.1 set of volumes | `G/3`, `√3L/8`; `Γ((2+i)²)` | below `0.943` and `2.0299`; index `5³ = 125`, `2 ∉ (3+4i)` | correct | C02, question |
| 5.2 quotient | `(1, 2+i; 0, 1)` | in the kernel modulo `(2+i)`, parabolic | Check holds | none |
| 5.3 Thurston's question | negation; ratio of the two named volumes | all members rational multiples; `0.6446293 ∈ (78/121, 595/923)`, `595·121 − 78·923 = 1` | faithful to the question | none |

- Previous review: R01 repaired (§4.5, "from Tau Ceti's `TauCeti.NumberField.dedekindZeta_eq_riemannZeta_mul_LFunction` at `s = 2`"; one stale sentence remains, C01); R02 repaired ("would give the cusp box volume `1`", "`≈ 0.5513` and `≈ 0.3122`"); R03 repaired ("`≈ 0.888915`, with `L(2, χ₋₇) ≈ 1.151925`"); C01–C04 and N01–N02 repaired (C03 in the README only, see C02); N03 not repaired (N01 here).
- Source locators checked against the text: 5 (thurston1982 line 913, printed p. 380; milley2009 lines 47–48, Theorem 1.3; millichap2017 lines 161–167, Theorem 1.5; milnor1982 lines 455–460; borel1981 lines 690–716 and 910–922, §§7.3–7.5 and 9.1).
- Library declarations opened at the pins: Tau Ceti `MeasureTheory/Group/DirichletDomain/Basic.lean` lines 79, 225, 278, 299; `Analysis/Complex/Fuchsian/DirichletDomain/Basic.lean` line 63; `MeasureTheory/Group/FundamentalDomain.lean` lines 140, 315, 358, 368, 382; `MeasureTheory/Group/ProperlyDiscontinuous.lean` line 100; `Topology/Algebra/GroupAction/FreeLocus.lean` lines 36, 122; `Topology/Algebra/Group/Subgroup.lean` line 164; `Analysis/Complex/Fuchsian/Covolume.lean` lines 117, 125; `Hyperbolic/Completeness.lean` line 43; `Isometry/UpperHalfSpace.lean` line 397; `GeometricStructure/Basic.lean` line 84; `VolumeDensity/Isometry.lean` line 215; `NumberTheory/ArithmeticDirichletSeries/EulerProduct/Analytic.lean` line 498; `NumberTheory/NumberField/Quadratic/DedekindZeta.lean` line 199. Mathlib `Analysis/SpecialFunctions/Integrals/Log.lean` line 46; `Integrability/Log.lean` line 93.
- Cross-roadmap citations resolved on main: Polylogarithms §2.4 (README lines 119–131, 182); PolylogarithmFunctions §§1.5, 1.7 (lines 135, 169–176); GeometricTopology §7.1 (lines 6685–6704); AdelicAlgebraicGroups AA.2.4 (lines 1707–1715), AA.3.4 (lines 2764–2778), AA.4.2 (line 4073); EndoscopicTransferAndUnitaryTraceComparison §6.2 (lines 1980–1992). Consumers: AdelicAlgebraicGroups line 2775, ArithmeticLocallySymmetricSpaces line 4881, BianchiModularForms and MaassForms at their open heads.
- Dependency check output: `depcheck: 176 roadmaps, 1990 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `Suggested.lean` elaborates with 44 `sorry` warnings and no other diagnostic; no `set_option`, no sorry'd data, a single `import Mathlib` and eight Tau Ceti modules. The file has no `variable` block; the 72 elaborated signatures were read against the README, nothing changed.
- One-tactic probes on a copy: `one_smul'`, `continuousConstSMul`, `secondCountableTopology_psl`, `countable_of_discrete`, `properlyDiscontinuousSMul_of_discrete`, `IsCofinite.covolume_pos`, `dist_ofUpperHalfPlane`, `bianchi_comp_algEquiv`, `twenty_catalan_mem_hyperbolicVolumes` do not close by `simp`, `infer_instance` or one library lemma; the Dirichlet definition equals the pinned one by `rfl` (R01).
- Pull request text: the title and description agree with the head (a new roadmap of 45 headings and 72 declarations; the four endpoints; the build). No change outside the roadmap folder. The automatic checks all passed.

Overlap check: read FuchsianOrbifolds, ArithmeticFuchsianGroups, BallQuotientsAndComplexHyperbolicLattices (main), BianchiModularForms, MaassForms (open); FuchsianOrbifolds and ArithmeticFuchsianGroups put Kleinian groups outside their scope, BianchiModularForms and MaassForms consume the Bianchi groups, domains and covolumes from here; nothing owned twice.

Source independence: 7 passages compared with 5 sources (thurston1982, milley2009, millichap2017, milnor1982, borel1981), none shared beyond the two words "rationally related" of the question; largest share Elstrodt–Grunewald–Mennicke, 2 of 6 claim-level locators; its text and table of contents could not be read, so contents were not compared with it.

Research link: §4.6 is Humbert's volume formula (Humbert 1919) by the Tamagawa route of Borel 1981, §§7.3–7.5 and 9.1, as Milnor 1982 reports it; Layer 5 states question 23 of Thurston 1982, p. 380. Rests on borel1981 lines 707–716 and 922, milnor1982 lines 455–460, thurston1982 line 913.

## Not verifiable

- Elstrodt–Grunewald–Mennicke, *Groups Acting on Hyperbolic Space*: paywalled; Chapters 1 and 7 are cited without section numbers and were not opened.
- Maclachlan–Reid, GTM 219, and Ratcliffe, GTM 149: paywalled; cited in the references only.
- Cao–Meyerhoff, Invent. Math. 146 (2001): paywalled; the cusped minimum `2.0299` was not read in the text.
- Humbert (1919) and Neumann–Yang (1999): not fetched; the formula was checked against milnor1982 line 460 and numerically at `d = −4, −3, −7`.
- The displayed formulas of borel1981 §§7.3–7.4 and 9.1 are lost in the extraction; the normalization was checked from Milnor's report of it.

## Source issues

- none

## For the human reviewers

- **Licence.** `TauCetiRoadmap/KleinianGroups/README.md` lines 773–776 say the domains, indices, integration route and ratio bound were first formalized in the repository `t4v1/thurston23`; its licence, and how far `Suggested.lean` is adapted from it, were not checked.
- **Not tested.** Elstrodt–Grunewald–Mennicke has the largest share of the locators (2 of 6); neither its text nor its table of contents could be read, so wording and arrangement were not compared with it.
