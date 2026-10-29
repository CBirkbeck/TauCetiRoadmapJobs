# Review of PadicPeriodRings (pull request #940 at ded1f45)

**Verdict:** needs changes

🤖 AI review by independent-review-PRREVIEW-PadicPeriodRings~2. Full re-review of the repaired head. The gate passes, the dependency check reports no upward edge, every sampled locator resolves, and the Lean signatures carry their binders. One blocking finding remains: the two targets this head took over from its suppliers in response to the previous review are now also built, by name, in the open revisions of those suppliers, so each has two owners. No file of the pull request was changed.

## Status of the previous review's findings

| Previous | Passage at this head | Status |
| --- | --- | --- |
| R01 (P1) general-residue ramification unsupplied | `README.md:72` "General perfect-residue ramification — generalResidueRamification" with lower numbering on the pinned `TauCeti.IsLocalRing.ramificationGroupReal`, Herbrand, absolute upper filtration and completed unramified comparison | Repaired as asked (owned in §0.3); superseded by R01 below, which is new |
| R02 (P1) unit-filtration reciprocity attributed to a section that does not state it | `README.md:124` "Unit-filtration reciprocity — unitFiltrationReciprocity" on the pinned `localArtinMap`/`artinMap`, with the three depth checks | Repaired as asked (owned in §1.3); superseded by R01 below |
| R03/R04 (P2) gate upward edges | `README.md:26,28,30`: Tau Ceti row lists the exact pinned declarations; ProfiniteArithmetic row is provenance only | Repaired: dependency check now reports 0 problems (output below) |
| R05 (P2) joint-continuity headline absent | `Suggested.lean:100` `completedGaloisAction_continuous`; `README.md:96` names it | Repaired |
| R06 (P2) envelope definitions lose `[Fact p.Prime] [Algebra ℤ_[p] A]` | `Suggested.lean:242,249,256,279` carry both binders explicitly; the `#check` pass below confirms the elaborated types keep them | Repaired |
| R07 (P3) shape and prose names | Target names such as periodTraceIdeal, senUpperBreaks, tate_cocycleLimit are now unbackticked prose; the headings of main-branch roadmaps do not use the "How to read the build/Examples/Dependencies" form either (0 of 3 sampled), so that part is not held against this head; one stale scope sentence remains (R04) | Partly, remainder P3 |
| R08 (P3) small definitions without API/Checks | `README.md:246–278` §1.6 defines `padicUnitLog`, `residueInertia`, `cyclotomicTower` with three Checks each; values recomputed below | Repaired |
| R09 (P3) locators | `README.md:112` p. 89; `README.md:487,506` Colmez–Fontaine author version pp. 11–12; `README.md:515–516` arXiv version notes | Repaired |
| R10 (P3) no `sources.toml` | Still absent; no roadmap folder on main carries one (0 of 146), so this is not a requirement of the content repository | Not a finding |

## R01 (P2) — General-residue ramification and unit-filtration reciprocity now have two owners each

**Location:** `TauCetiRoadmap/PadicPeriodRings/README.md:72` ("General perfect-residue ramification — generalResidueRamification"), `README.md:124` ("Unit-filtration reciprocity — unitFiltrationReciprocity"), `README.md:304` ("Deduce Hasse–Arf over every general `p`-adic field"), and the supplier rows at `README.md:29–30`.

**Claim:** This roadmap owns ramification over complete discretely valued fields with perfect residue field (lower and upper numbering, Herbrand, absolute upper filtration, completed maximal unramified comparison), Hasse–Arf over such fields, and the comparison of the unit filtration with the upper ramification filtration under the local Artin map; LocalFieldsRamification and ClassFieldTheory are cited only for the finite-residue-field API on main.

**Witness:** The open revision of LocalFieldsRamification (pull request #1410, same author) adds Layer 3a (§§3a.1–3a.3: integer rings, lower filtration and different, Herbrand functions and upper numbering, Hasse–Arf "over a separable residue extension", with "No finiteness of the residue field is assumed") and Layer 4a (§§4a.1–4a.3: absolute upper filtration, finite separable transition functions, completed maximal unramified base change), packaged as the "Perfect-residue Herbrand contract (`perfectResidueHerbrand`)", and it names this roadmap as the consumer: "PadicPeriodRings uses these unit groups for its geometric reciprocity construction; its finite-isogeny fundamental group, reciprocity map and Sen tower estimates belong there." The open revision of ClassFieldTheory (pull request #1411, same author) adds to Layer 7 "unit-filtration reciprocity, which carries `U_K^(n)` onto the upper ramification group `G^n` at every depth `n ≥ 0`, in both characteristics", exported as `map_unitFiltration_normResidue` and `conductorExponent_eq_sInf_upperRamificationGroup`, with its own proof paragraph. Both suppliers precede this roadmap in the merge order (LocalFieldsRamification and ClassFieldTheory are on main; this roadmap is line 17), so the ownership direction is fixed: a supplier cannot import §0.3 or §1.3 from here, and after either revision merges, §0.3, §1.3's reciprocity target and §2's Hasse–Arf paragraph re-plan a main roadmap's sections. The previous review offered ownership here or a declared supplier gap; the author took the first option while the same author's supplier revisions took the second, and the two now collide.

**Repair:** Repoint to the earliest owner. Delete the generalResidueRamification target of §0.3, the unitFiltrationReciprocity target of §1.3 and the "Deduce Hasse–Arf over every general `p`-adic field" sentence of §2, keeping their Checks as supplier-contract checks. In the LocalFieldsRamification row cite Layers 3a and 4a by section (§§3a.1–3a.3, §§4a.1–4a.3, the `perfectResidueHerbrand` contract) and in the ClassFieldTheory row cite Layer 7's unit-filtration reciprocity by name (`map_unitFiltration_normResidue`), each as a section the supplier's open revision adds and this roadmap consumes; repoint every `*Needs:*` line that names §0.3 or unitFiltrationReciprocity (`README.md:128,146,160,308,321,333,383`). Keep here what the revisions leave to this roadmap: the proalgebraic unit group, its finite-isogeny fundamental group, geometric reciprocity, the eventual upper-break spacing and the Sen tower estimates. List the two revisions in the pull request's merge-order block, since this roadmap then depends on them. Retest: the depth-zero check `ℚ₃(ζ₃)/ℚ₃` (`U^0` onto the order-two inertia group, `U^1` to 1) and the `K = Frac W(𝔽_p(s)^perf)`, `L = K(√p)` check (`i_G(σ) = 1`, upper break 0) must still be reachable through the cited sections; both are stated in the revisions' domains (arbitrary perfect residue field, both characteristics). If the author instead keeps ownership here, the two revisions must drop their copies and say so, and this report's finding stands until they do.

## R02 (P3) — PerfectoidTowers P9.0 is cited for a target it does not state

**Location:** `TauCetiRoadmap/PadicPeriodRings/README.md:33`: "P9.0: **Lifting continuous cochains along finite surjections**, … These three targets have a single owner there."

**Claim:** P9.0 states three targets, including lifting continuous cochains along finite surjections.

**Witness:** PerfectoidTowers P9.0 at its open head has two bold targets, *Continuous cochains into an inverse limit* and *Comparison with the canonical carrier for compact coefficients*. Lifting is a prose remark there: "Lifting along discrete surjections is Tau Ceti's `TauCeti.ContCohomology.exists_continuous_lift` … and is not restated." The pinned declaration is `TauCeti/RepresentationTheory/Homological/ContCohomology/ShortExact.lean:164`.

**Repair:** Cite `TauCeti.ContCohomology.exists_continuous_lift` in the Tau Ceti row for the lifting step (also at `README.md:49`), and leave P9.0 with its two named targets.

## R03 (P3) — One Fontaine–Ouyang page

**Location:** `TauCetiRoadmap/PadicPeriodRings/README.md:170`: "Fontaine–Ouyang, §1.4, Theorem 1.92 (Sen's filtration theorem), Corollary 1.96 …, pp. 36–39".

**Claim:** Theorem 1.92 lies within pp. 36–39.

**Witness:** `fontaine-ouyang line 1746` states Theorem 1.92 at the foot of printed p. 35 (the p. 36 header follows at line 1750). Corollaries 1.96 and 1.99 are on p. 38 (lines 1832, 1847) and Proposition 1.104 on p. 39 (line 1901).

**Repair:** Write "pp. 35–39".

## R04 (P3) — Stale scope sentence

**Location:** `TauCetiRoadmap/PadicPeriodRings/README.md:7`: "Section 0 contains the procyclic and low-degree continuous-cochain preliminaries needed by those targets."

**Claim:** Section 0 is cohomological preliminaries only.

**Witness:** §0.3 (`README.md:70`) is ramification theory. The sentence predates the repair.

**Repair:** After R01, say that §0 contains the procyclic and low-degree continuous-cochain preliminaries and the ramification inputs consumed from LocalFieldsRamification (or, if §0.3 is kept, name it).

## Verified sound

I read all 516 README lines and all 301 Lean lines, every `*Needs:*` line, every Check, and the 205-line change set.

**Gate and dependency check.** The worker's gate at this head passed every scanner and the targeted build. `lake env lean` on `Suggested.lean` from the project root: 14 `declaration uses sorry` warnings, no other output, exit 0. The movable dependency check returned:

```text
depcheck: 201 roadmaps, 1313 edges, 0 problem(s)
```

No UPWARD or CYCLE line; `git diff --stat origin/main...HEAD` outside the folder is empty.

**Signatures.** A scratch copy with `#check @name` for all 22 declarations (14 theorems, 7 definitions, 1 abbreviation) elaborated with only `sorry` warnings. Every elaborated type agrees with its README statement: the three procyclic theorems keep discrete-torsion, finitely generated Hausdorff `ℤ_p`, and finite-dimensional normed `ℚ_p` coefficients with `ContinuousSMul zHat`; the Tate–Sen block keeps `CompleteSpace K`, `IsUltrametricDist K`, `IsAlgClosed L`, `Algebra.IsAlgebraic K L`, the discrete-valuation, `CharP … p` and `PerfectRing` hypotheses on the valuation subring; the de Rham theorems keep `Fact ¬IsUnit (p : R)` and `IsAdicComplete`; all four envelope declarations keep `[Fact p.Prime]` and `[Algebra ℤ_[p] A]` (the R06 erasure is gone). `cyclotomicTower` takes a bare `p : ℕ`, which its body does not need to be prime.

**One-tactic probe.** On a scratch copy each of the 14 `sorry`s was replaced by `first | rfl | trivial | simp | infer_instance | simp_all | (intro; rfl) | exact fun _ => rfl`. All 14 fail to close (14 errors, 0 sorries). No padding finding.

**Pinned declarations opened** (paths relative to the library roots):

- Tau Ceti `Topology/Algebra/Group/Profinite/ZHat/Basic.lean:89,100,140,223`: `zHat.gen`, `denseRange_ofInt`, `lift`, `continuous_lift`.
- `RingTheory/LocalRing/RamificationGroup.lean:114,680`: `IsLocalRing.ramificationGroup`, `ramificationGroupReal` (ceiling convention, any group acting on a local ring, no valued-field hypothesis).
- `NumberTheory/LocalField/Herbrand/Basic.lean:100–103,254,258,417`: `herbrand`, `inverseHerbrand`, `upperRamificationGroup`, in namespace `TauCeti.LocalFieldsRamification`, with `[IsNonarchimedeanLocalField K] [IsNonarchimedeanLocalField L]`; `Herbrand/UpperQuotient.lean:98`: `map_restrictNormalHom_upperRamificationGroup`.
- `NumberTheory/ClassFieldTheory/Local/Reciprocity.lean:70–73,116,158`: `localArtinMap`, `normResidue`, nonarchimedean local field; `Local/ArtinMap.lean:109,145,174,215`: `artinMap`, `artinMap_restrict`, `denseRange_artinMap`, `continuous_artinMap`.
- `FieldTheory/Galois/AbsoluteGaloisGroup/Cyclotomic/Character.lean:33`: `localCyclotomicCharacter`; `RepresentationTheory/Homological/ContCohomology/Inflation/Basic.lean:251,350`: `explicitInfl1_injective`, `explicitInfRes_exact`; `ContCohomology/ShortExact.lean:164`: `exists_continuous_lift` (R02).
- Mathlib `RingTheory/Perfectoid/BDeRham.lean:49–50,62,75,88`: the standing `[Fact ¬IsUnit (p : R)] [IsAdicComplete (span {p}) R]`, `fontaineThetaInvertP`, `BDeRhamPlus` as the `ker θ`-adic completion of `Localization.Away p (𝕎 R♭)`, `BDeRham` as its localization at the generators of `ker θ`; both are the zero ring when `p = 0` in `R`, which the theorems' `Fact ¬IsUnit p` and the `‖x‖ ≤ 1` characterisation of `R` exclude.
- `NumberTheory/Cyclotomic/CyclotomicCharacter.lean:307`: `cyclotomicCharacter` is trivial when `L` lacks the `pⁱ`-th roots; `IsAlgClosed L` of characteristic 0 supplies them. `NumberTheory/Padics/Complex.lean:78,140,244,251`: `PadicAlgCl.spectralNorm_eq`, `ℂ_[p]`, `PadicComplex.isAlgClosed`, `PadicComplexInt`; `Analysis/Normed/Unbundled/SpectralNorm.lean:451`: `spectralNorm_eq_of_equiv`; `RingTheory/DividedPowers/Padic.lean:139`: `PadicInt.dividedPowers`; `DividedPowers/DPMorphism.lean:62`: `IsDPMorphism`; `FieldTheory/LinearDisjoint.lean:744`: `trace_algebraMap`; `RingTheory/DedekindDomain/Different.lean:480`: `differentIdeal`.

**Cross-roadmap citations resolved** (all on main unless stated): ProfiniteCohomology Layers 3 (line 777) and 5 (line 960); Completed/ProfiniteArithmetic; LocalFieldsRamification Layer 2 (maximal unramified extension, line 648) and Layer 3 (lower and upper numbering, Herbrand, norm on the unit filtration with Herbrand shift, Hasse–Arf for finite abelian extensions, different; lines 859–1040); ClassFieldTheory Layer 6 (line 1220, `localArtinEquiv`, `normResidue`, `localArtinMap`) and Layer 7 (line 1312, absolute Artin map, conductors; it does not state the unit-filtration comparison on main); Completed/LocalGaloisGroups Layer 5 (line 447, cyclotomic orientation); PerfectoidSpaces §§P1.6 (4040), P1.10 (4292, `isPerfectoidField_padicComplex` at `Suggested.lean:543`), P1.11 (4355), P1.16 (4525), P1.17 (4611), P1.18 (4652), P1.31 (5517), P3.7 (8424), P3.12 (8688); EtaleCohomologyFoundations §F.4.0 (850, `exists_stable_lattice_iff`); DerivedModuleAlgebra §0.DP.3 (239, `PD.augmentation`, `PD.augmentationIdeal`), §1.T.1 (1403, `Tower.lim`, `Tower.limOne`, `limOne_subsingleton_of_isMittagLeffler`, `limOne_exact` at `Suggested.lean:407,478`), §1.1 (1573, `derivedLimit_milnor`), §§1.2–1.5 (1693–1808); PerfectoidTowers P9.0 at its open head (line 1896; two bold targets, see R02). The two citation-resolver leads (`Tower.limOne_exact`, `Tower.limOne_subsingleton_of_isMittagLeffler`) are DerivedModuleAlgebra's own declarations, not pinned-library claims: not findings.

**Ownership.** Searched by object with `roadmaps grep` over main and the 432 open roadmap pull requests: Ax–Sen–Tate, Tate–Sen, `B_dR^+`, `A_cris`, the divided-power envelope, procyclic `H¹`, unit-filtration reciprocity, Herbrand theory over perfect residue fields. Every other hit for the period rings and Tate–Sen is a consumer importing from this roadmap by section (PadicHodgeTheory §0.1–0.3, SelmerIwasawaCohomology, FiniteFlatGroupsAndIntegralPadicHodgeTheory, DerivedDeRhamCohomology, CrystallineCohomology, ArithmeticGaloisRepresentations §3.0, ArithmeticGaloisDuality, ColemanIntegrationPartII, AInfCohomology). The only competing builders are the two supplier revisions of R01. No `Suggested.lean` elsewhere declares a `TauCetiRoadmap.PadicPeriodRings.*` name. No declared gaps exist (no readable `design/plan.json`).

**Sources.** All eleven open texts were fetched through the sources service (Fontaine 1994a/b and Serre 1961 from Numdam, Stacks, Bhatt and BMS from arXiv, Brinon–Conrad, Fontaine–Ouyang, Colmez–Fontaine and Stix from author pages, Rubin from the Arizona Winter School site). Page mapping: Brinon–Conrad PDF page = printed page; Fontaine–Ouyang printed = PDF − 10; Fontaine 1994a printed = PDF + 57; Fontaine 1994b printed = PDF + 111; Serre 1961 printed = PDF + 103; Rubin printed = PDF − 10.

| Target | Text read and result |
| --- | --- |
| 0.1 | `rubin line 6638`, printed p. 153: Lemma 2.8 for `Ẑ`, three coefficient domains, evaluation at the generator; its discrete domain is `p`-primary torsion, the README's arbitrary discrete torsion is the Serre XIII §1 form the lemma cites. `rubin line 6571` Definition 2.1 (p. 151), `line 6601` Proposition 2.5(i) (p. 152). Supported. |
| 0.2 | Rubin as above; `brinon-conrad line 10833,10838` Propositions 14.3.3 and Theorem 14.3.4 (pp. 253–254), with the degree-one inflation–restriction on continuous cocycles at line 10848. Supported. |
| 0.3 | `brinon-conrad line 259` Definition 1.3.1 (p. 7: characteristic 0, complete discrete valuation, perfect residue field); `line 375–386` Exercise 1.4.4(2)–(3) (p. 10: `K^un` not complete, `K̂^un` has algebraically closed residue field, Krasner gives `I_K ≅ G_{K̂^un}`, `L ↦ L ⊗ K̂^un` an equivalence with `L ⊗ K̂^un ≅ L̂`); `line 8547–8584` the absolute upper filtration as a limit over finite subextensions, closed subgroups, trivial intersection (pp. 200–201). Serre, Local Fields III §6, IV §§1–3 not readable (paywalled); the statements are the standard ones under a separable residue extension. Supported where readable. |
| 1.1 | `brinon-conrad line 444` (p. 12): `G_K` acts by isometries and extends uniquely to `C_K`; `fontaine-ouyang line 3880–3883` (p. 91, before Question 4.8): the action extends by continuity. Supported. |
| 1.2 | `fontaine-ouyang line 3757` Proposition 4.3 (p. 89): Ax–Sen lemma with constant `p/(p−1)² · v(p)`; `line 3888` Proposition 4.9 (p. 91): `C^H = L̂` in characteristic 0; `brinon-conrad line 452` Proposition 2.1.2 (p. 12). Supported. |
| 1.3 | `brinon-conrad line 8495` Theorem 13.1.2 (p. 199: trace image contains `𝔪_{K_∞}` for `Gal` isomorphic to `ℤ_p` near the identity); `line 8585` Lemma 13.1.6 (p. 201: `y_{m+1} = y_m + e`); `line 8674` Lemma 13.1.8 (p. 203); `line 8714` Proposition 13.1.9 (p. 204: `v(𝔇_{K_n/K}) = n + c + p^{−n}a_n`); `line 8748` Lemma 13.1.10 (p. 204: `pⁿ v(𝔇_{L_n/K_n})` bounded); `line 9779,9834` Exercises 13.7.2 and 13.7.4 (pp. 228–229); `line 10168` Lemma 14.1.3 (p. 237); `line 10204` Lemma 14.1.4 (p. 238); `line 10291` Proposition 14.1.7 (p. 240). `fontaine-ouyang line 1746` Theorem 1.92 (p. 35, R03), `line 1832` Corollary 1.96 (p. 38, almost-étale trace-one element), `line 1847` Corollary 1.99 (p. 38), `line 1901` Proposition 1.104 (p. 39: `K̂_∞ = K_n ⊕ X_n`, bounded inverse of `γ_n − 1`, invertibility of `γ_n − λ` for a principal unit `λ` not a root of unity). Serre XV §2 and III §3 Proposition 7 not readable; the trace-ideal formula is recomputed below. Supported. |
| 1.4 | `brinon-conrad line 10735–10747` Lemma 14.3.1 (pp. 251–252): the primitive `h = (−1)ⁿ Σ τ(α) f(…, τ)`, which for `n = 1` is the README's `b = −Σ τ(α) a(τ)`; `line 10806` Proposition 14.3.2 (p. 252); `line 10833` Proposition 14.3.3 (p. 253); `line 10838–10843` Theorem 14.3.4 (p. 253: image a `p`-adic Lie group of dimension ≤ 1, vanishing when `η(I_K)` infinite, one-dimensional when finite); `line 579` Theorem 2.2.7 (p. 15). `fontaine-ouyang line 4435` Corollary 4.45 and `line 4452–4459` Proposition 4.46 (pp. 105–106: `H⁰ = K`, `H¹` spanned by `log χ`, vanishing for `i ≠ 0`). Supported. |
| 1.5 | `fontaine-corps line 399–494` §§1.5.1–1.5.7 (pp. 71–74): `B_dR^+` the `J_K`-adic completion of `A_inf[1/p]`, a complete DVR with residue field `C`; the canonical topology as the inverse limit of the `p`-adic topologies, coarser than the DVR topology; `log(ν(ε))` a uniformizer; `grᵐ = C(m)`; continuous Galois action; `(B_dR)^H = K^H`. Supported. |
| 1.6 | `brinon-conrad line 5874–5877` (p. 139): the canonical log on units kills Teichmüller lifts and is the series on 1-units; `line 298–300` (p. 9): `log` identifies `1 + pℤ_p` with `pℤ_p` for odd `p` and `1 + 4ℤ₂` with `4ℤ₂`. Supported. |
| 2 | `brinon-conrad line 8587–8592` (p. 201): reduction to `K̂^un` and Serre's geometric reciprocity `π₁`-form; `line 10380` Lemma 14.1.9 (p. 242); `line 1472–1482` Lemma 3.2.6 (pp. 36–37: finitely generated `R'`-modules with continuous semilinear `G_k`-action, exact invariants, rank and invariant factors preserved). `serre-geometric line 970` Théorème 1 of §3.2 (p. 129: `π₁(U_K^s)` maps onto the upper ramification group for every real `s ≥ 0`), `line 1275` Proposition 9 (p. 137: conductor `= φ(c) + 1`), `line 1302` Théorème 2 (p. 138: Artin conductors integral, Arf's general case); §§1.6, 2.1–2.4 at lines 309, 556–680. `stix line 3757` Theorem 88 (p. 72). Supported. |
| 3 | `fontaine-corps line 539` Théorème 2.2.1 (p. 76) and `line 611–618` §2.3.3 (p. 78): `A_cris` is the `p`-adic completion of the `W(R)`-subalgebra of `W(R)[1/p]` generated by `ξᵐ/m!`; `line 619–633` §2.3.4 (pp. 78–79): `log ν(ε)`, `tᵖ ∈ pA_cris`, `φ(t) = pt`. `stacks-07H7 line 50,74,108` Lemma 2.1 (07H8), Definition 2.2 (07H9), Lemma 2.4 (07HC). `bhatt line 1709` Proposition 9.9 (p. 35). `bms line 1312–1315` Definition 3.22(i) (p. 27). Supported. |
| 4.1 | `brinon-conrad line 5428,5434,5457` Propositions 9.1.1–9.1.3 (pp. 129–130: `A_cris` `ℤ_p`-flat domain, continuous action, `tᵐ/m! ∈ A_cris`); `line 5868–5877` the branch dependence of `B_st → B_dR` (p. 139); `fontaine-corps line 855–890` Théorème 4.2.4 and Remarques 4.2.5(a)–(d) (p. 86: injectivity of `K ⊗_{K₀} B_st → B_dR`, dependence on the logarithm branch, functoriality); `line 748–758` §4.1 (p. 83). Supported. |
| 4.2 | `fontaine-semistable line 1437–1480` §§5.1.4–5.1.7 (pp. 155–157): the invariant functors, `D_cris = ker N` in `D_st` (5.1.6), dimension criterion (5.1.7). Supported. |
| 4.3 | `fontaine-corps line 485–493` §1.5.7 (p. 74: `(B_dR^+)^H = (B_dR)^H = K^H`); `fontaine-semistable line 1403–1411` Proposition 5.1.2 (p. 155: `(B_cris)^G = (B_st)^G = K₀`, regularity) and `line 1412–1436` Lemma 5.1.3; `line 353–357` Proposition 1.4.2 (p. 123: `dim D_B(V) ≤ dim V`, equality gives an isomorphism); `brinon-conrad line 6368` (9.3.1) (p. 151); `colmez-fontaine line 568–580` Proposition 1.3(iv)–(v) (pp. 11–12). Supported. |

**Computed adversarial table.** Values are computations on test instances; `v(p) = 1` unless an `ord` is named.

| Statement / object | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| Conventions: `e N_p` for `ord_K(π) = 1` | `e = 2`, `N_p(u) = −1` | uniformizer-normalized `N(u) = −2`; `Nφ(u) = −2p = pφN(u)` | consistent |
| 0.1 discrete torsion | `Ẑ` on trivial `ℤ/2`, `ℤ/3`, on `0` | `Hom(Ẑ, ℤ/n) = ℤ/n = C/(σ−1)C`; `0 = 0` | pass |
| 0.1 integral | `ℤ₂`, `σ = 3`; `ℤ₃`, `σ = 4` | `(σ−1)C = 2ℤ₂, 3ℤ₃`; `H¹ = 𝔽₂, 𝔽₃`; invariants `0, 0` | pass, coinvariants not invariants |
| 0.1 rational | trivial `ℚ₃`; `σ = 2` on `ℚ₃`; `p = 2`, `σ = 2` | `H¹ = ℚ₃`; `σ − 1 = 1` invertible, `H¹ = 0`; `2 ∉ ℤ₂^×`, no such action | pass, Check 3's `p = 2` exclusion correct |
| 0.1 negative control | finite `Γ = C₂`, trivial `ℚ₂` | averaging gives `H¹ = 0`; quotient by `σ−1 = 0` gives `ℚ₂` | theorem correctly restricted to `Ẑ` |
| 0.2 inflation–restriction | `H = 1`; `H = G` | maps `(id, 0)`; `(0, id)`; image = kernel both | pass |
| 0.2 finite descent | `C₃` trivial on `ℚ₃`; `ℤ/3` trivial on `𝔽₃` | `H¹ = 0` via `1/3`; `H¹(ℤ/3, 𝔽₃) = 𝔽₃` | characteristic-zero hypothesis needed |
| 0.3 Check 1 | `K = Frac W(𝔽_p(s)^perf)`, `L = K(√p)`, `p` odd | `i_G(σ) = ord_L(−2√p) = 1`; `Σ_{g≠1} i_G = 1 = e − 1` (tame); `G_0 = G`, `G_1 = 1`; `φ(u) = u/2` for `u ≥ 0`; break `φ(0) = 0` | pass |
| 0.3 Check 2 | `ℚ_p(μ_{p^∞})`, `p = 3`, `v ∈ (1, 2]` | Serre IV §4: `G^v = 1 + 9ℤ₃ = 1 + p^{⌈v⌉}ℤ_p`; `∩_v = 1` | pass |
| 0.3 Check 3 | unramified `L/K`; `L = K(√p)` | base change to `K̂^un` splits, inertia `1`; `G_0 = G`, `G_1 = 1` unchanged, `ord(p)` unchanged | pass |
| 1.1 action | `σ = id`; `σ(√3) = −√3` | extension `x ↦ x`; moves `√3` by `3^{−1/2} < 1`, nontrivial | pass |
| 1.2 fixed fields | `H = 1`; `H = G_{ℚ_p}`; `H = ker χ` | `ℂ_p`; `ℚ_p`; `\widehat{ℚ_p(μ_{p^∞})} ≠ ℚ_p(μ_{p^∞})` (countable dimension, Baire) | pass both directions |
| 1.3 unit filtration, depth 0 | `ℚ₃(ζ₃)/ℚ₃`, `Art(−1)` | `χ(Art(u)) = u^{−1}` (ClassFieldTheory main Layer 7, step 4): `ζ ↦ ζ^{−1}`, order 2 = `Gal^0`; `U^1 ↦ 1 = Gal^1` | pass, matches the supplier's sign |
| 1.3 unit filtration, unramified | `L/F` unramified, `n ≥ 0` | `Gal^0 = 1`; `U^n ↦ 1`; uniformizer `↦` arithmetic Frobenius `≠ 1` | pass, `n ≥ 0` essential |
| 1.3 unit filtration vs lower numbering | `ℚ₃(ζ₉)/ℚ₃`, `n = 0, 1, 2` | `G^0 = (ℤ/9)^×`, `G^1 = 1 + 3ℤ/9` (order 3), `G^2 = 1`; `G_2` has order 3 (`G_u = G^{(1)}` for `1 ≤ u ≤ 2`) | pass, upper numbering only |
| 1.3 trace ideal | `L = ℚ₂(√2)`, `e = 2`, `d = 3`, `r = 0, 1` | `⌊3/2⌋ = 1 → 2ℤ₂`; `⌊4/2⌋ = 2 → 4ℤ₂`; direct: `Tr(a + b√2) = 2a`, `Tr(2b + a√2) = 4b` | pass, floor essential |
| 1.3 trace inequality | `x = 1`, same `L` | `v(Tr 1) = 1`; `0 + 3/2 − 1/2 = 1`; unrounded `3/2` false | pass |
| 1.3 Sen different | `L_n = ℚ₂(ζ_{2^{n+2}})` over `ℚ₂(i)` | `v(𝔇_{L_n/ℚ₂}) = n + 1`, `v(𝔇_{ℚ₂(i)/ℚ₂}) = 1`, relative `n = n + c + 2^{−n}a_n` with `c = a_n = 0` | pass |
| 1.3 almost-trace negative control | unramified `ℤ_p`-tower, `M = K'_∞(p^{1/p²})` | `ord_M(𝔇) = ord_M(p²) + p² − 1 = 3p² − 1`; `Tr(O_M) = 𝔪^{⌊(3p²−1)/p²⌋} = p²O ∌ p` | pass, deep ramification essential |
| 1.3 normalized trace | `K = ℚ₃(ζ₉)`, `n = 2, 3` | `[K_n : K] = 3^{n−2} = 1, 3`; `R_n(1) = 1`; `3^{1−n}Tr(1) = 1/3` | pass |
| 1.3 unramified normalization | `[K_m : K_n] = p^{m−n}` unramified | integral trace surjective; `‖R_n‖ = p^{m−n} → ∞` | correct negative control |
| 1.4 homotopy identity | finite `Q`, `Σ τ(α) = 1`, any cochain `a` | `db(g) − a(g) = −Σ gτ(α)[g a(τ) − a(gτ) + a(g)] = −Σ gτ(α) da(g, τ)`, using `Σ gτ(α) = g(1) = 1` and reindexing `gτ` | identity holds |
| 1.4 Check 2 sign | `a(g) = g(x) − x` | `b = x − Σ τ(αx)`, second term `Q`-invariant, `db = a` | pass |
| 1.4 limits | `c = 1/2`, `v_∞(f) = 0` | `v(u_j) ≥ j − 1/2 → ∞`, `v_∞(r_j) ≥ j`; `v(b) ≥ −1/2 > −δ`; `v_∞(r − du) ≥ min(v_∞(r−a), v_∞(a−du)) ≥ v_∞(r) + 1` | pass |
| Tate–Sen `H⁰` | `i = 0, 1, −1`; `x = 0, 1` | `K, 0, 0`; `x = 1` invariant only at `i = 0` | pass |
| Tate–Sen `H¹` | `c = log χ`, `i = 0`; `c = 0`; `i ≠ 0` | `k = 1`; `k = 0`; class `0` | pass, `b` not asserted unique |
| 1.4 Check 4 | extensions of `ℂ_p` by `ℂ_p(1)` | classified by `H¹(G_K, ℂ_p(1)) = 0`: split | pass |
| 1.5 de Rham | `t`, `p` | `θ(t) = 0`, `θ(p) = p`; `t`-orders `1, 0`; `B_dR^+/(t) = ℂ_p` | pass |
| 1.6 `padicUnitLog` | `p = 2`, `x = ±1`; `p = 3`, `x = 4`; `x = −1` | `(±1)² = 1 → 0`; `m = 4`, `(1/4)log(4⁴) = log 4 = 3 − 9/2 + 9 − … ≡ 3·7 mod 27`, so `log(4)/3 ≡ 7 mod 9`, valuation 1; without `m⁻¹`: `4·7 ≡ 1 mod 9`; plain series in `−2` diverges, `log((−1)⁴) = 0` | all three Checks correct |
| 1.6 image | `p` odd: `x = ω u`; `p = 2`: `x = ±u`, `u ∈ 1 + 4ℤ₂` | `m⁻¹ log(uᵐ) = log u ∈ pℤ_p`; `(1/2)log(u²) = log u ∈ 4ℤ₂` | pass |
| 1.6 `residueInertia` | identity; `√3 ↦ −√3` over `ℚ₃`; `ζ₈ ↦ ζ₈³` over `ℚ₃` | `0 < 1`; `‖2√3‖ = 3^{−1/2} < 1`; `ζ(ζ² − 1)` has norm `N(i − 1) = 2`, a 3-adic unit | pass (the third Check needs `K = ℚ₃` from the previous bullet; at `p = 2`, `i − 1` is a uniformizer) |
| 1.6 `cyclotomicTower` | `n = 0`; `p = 2` levels 1, 2 | root set `{1}`; `μ₂ ⊆ ℚ₂`; `μ₄` gives `ℚ₂(i)` of degree 2 (`−1` not a square) | pass |
| 2 breaks | `ℚ₂(ζ₄)` tower; unramified tower | spacing `ord_K(2) = 2`; `Γ^y = 1` for `y ≥ 0`, no break | pass |
| 2 `γ − λ` | `λ = 1`; `ζ_{pⁿ} ∈ K`, `K_n = K[Γ/pⁿΓ]` | kernel `K`; normal basis gives eigenvalue `ζ_{pⁿ}` with multiplicity 1, kernel nonzero; `λ = −1` at `p = 2` included | exclusion of all `p`-power roots necessary |
| 2 descent | `M = R'^r` (`r = 0` included); `R'/πⁿ`; `η(Frob) = 1 + p` | invariants `R^r`; `R/πⁿ`; invariant unit generator from `H¹(G_k, R'^×) = 0` | pass |
| 2 character criterion | `η = 1`; unramified `η(Frob) = 1 + p`; `χ` | `η(I_K) = 1, 1, ∞`; `(dim H⁰, dim H¹) = (1,1), (1,1), (0,0)` | pass, inertia image not full image |
| 3 envelope generator | `A = ℤ₂[X]`, `ξ = X`, `n = 3`; `A = ℤ[X]`, `p = 2` | `6γ₃(X) = X³` with `3` a unit; `Ring.inverse 6 = 0` in `ℤ[X, 1/2]`, excluded by `[Algebra ℤ_[p] A]` | pass |
| 3 quotients | Fontaine `ξ`, `p = 2` | `ξ² = 2γ₂(ξ) ≡ 0 mod 2`; `D/J₀ = O_C` (`A ∩ J₀ = ξA`), `D/(J₀ + pD) = O_C/p` | pass |
| 3 universal property | `ℤ_p[X] → ℤ_p`, `X ↦ p`, `I = (p)` | `γ_n(X) ↦ pⁿ/n!`, `n = 1, 2`: `p, p²/2`; base PD agrees; zero map fails at `1` | pass |
| 3 completed uniqueness | ring map `g : D̂ → E`, `E` `p`-adically separated | `x = d + pⁿy` gives `g(x) ≡ g(d) mod pⁿE` for all `n`; `g` determined by `g|_D` without a continuity hypothesis | the `∃!` is sound |
| 4.1 `B_dR` multiplication | `p^{−m}tᴺ`, `pᵐt^{−N}` | `V ⊇ tᴺA ∋ p^{−m}tᴺ`; `pᵐ ∈ pᵏA_inf^n` for `m ≥ k`, so `pᵐt^{−N} → 0` in `t^{−N}A`; product `1 ∉ U` | joint continuity fails at `(0,0)`; fixed-stage maps continuous |
| 4.1 monodromy | `u`, `u²` | `N_pφ(u) = −p = pφN_p(u)`; `N_pφ(u²) = −2p²u = pφ(−2u)`; `φ(u) = u` gives `−1 ≠ −p` | pass |
| 4.1 Frobenius | `t`, `a ∈ K₀` | `φ(t) = pt`, `g(t) = χ(g)t`, `φ g(t) = g φ(t) = pχ(g)t` | pass |
| 4.2 twists | `V = ℚ_p(1)` | covariant generator `t⁻¹`, `φ = p⁻¹σ`, jump `−1`; contravariant `t`, `pσ`, `+1` | pass |
| 4.2 `N_p = 0` | `V = ℚ_p` | `D_st = K₀`, `N = 0`, `= D_cris` | pass |
| 4.3 fixed fields | ramified finite `K`; `K = Frac W(𝔽_p(s)^perf)` | `K₀ ≠ K` versus `K`; `K₀ = K` | pass |
| 4.3 fundamental sequence | `1`; `a ∈ K₀` with `σ(a) ≠ a` | `1 ↦ 0`, `φ`-fixed; `a ↦ 0` but `φ(a) ≠ a` | kernel `ℚ_p`, not `K₀` |
| 4.3 filtered surjectivity | `r = 0, 1` | `Fil⁰B^{φ=1}/ℚ_p = 0`; `Fil^{−1}B_dR/B_dR^+ = C(−1)` hit by `U(−1)` | agrees with Colmez–Fontaine |

## Not verifiable

- Ax (1970), J. Algebra 15: Elsevier (paywalled DOI prefix); cited by locator, uncertified. The fixed-point statements were checked in Fontaine–Ouyang and Brinon–Conrad.
- Tate (1967), §3.3, Theorems 1–2, pp. 176–177: Springer; uncertified. Checked through Brinon–Conrad Theorems 2.2.7 and 14.3.4.
- Neukirch–Schmidt–Wingberg (2008), (1.6.7): Springer; uncertified. Rubin Proposition 2.5(i) and the pinned Tau Ceti theorem were read instead.
- Serre, Local Fields (1979), I §7, III §§3, 6, IV §§1–4, V §§3, 6, XV §2: Springer; uncertified. The trace-ideal formula, the upper numbering of `ℚ₃(ζ₉)` and the tame quadratic different were recomputed above.

Ownership against open pull requests was checked through `roadmaps grep` and `roadmaps show` (index of 2026-10-29); the sibling checkouts listed in the brief do not include the two supplier revisions, which were read at their heads through the tool.

## Source issues

- **Misprint** in fontaine-ouyang at Proposition 4.46 proof, printed p. 106: the source says the trace-weighted sum `Σ_h g₁⋯g_{n−1}h(α) c(…, h)` is a primitive with `dc' = c`; it should carry the sign `(−1)ⁿ` (Brinon–Conrad Lemma 14.3.1), as the `n = 1` case `db = −c` shows; affects the proof.
- **Error** in fontaine-ouyang at Proposition 4.46 proof, printed p. 106: the source says the cyclotomic `ℤ_p`-extension has `C(i)^{H_K} = K̂_∞(i)` with `χ` descended to `Γ_K`; it should use the full cyclotomic extension or first absorb the finite torsion of `χ`, since `χ` is nontrivial on `Gal(K̄/K(μ_{p^∞}))`'s complement in the `ℤ_p`-kernel; affects the proof.
- **Error** in brinon-conrad at Lemma 13.1.8, printed p. 203: the source says the different formula holds for arbitrary finite `M/L` using `Gal(M/L)`; it should assume `M/L` Galois for that formula (its proof cites Serre IV Prop. 4, a Galois statement); affects a stated result.
- **Gap** in brinon-conrad at Theorem 14.3.4 proof, printed p. 253, footnote 8: the source says the argument still needs to be finished; it should complete the infinite-inertia degree-one case; affects the proof.
