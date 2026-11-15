# Review of PadicHodgeTheory (pull request #1062 at f919453)

**Verdict:** accepted

Incremental re-review of the 96 lines changed since c1968e3, and of the pull request's title and description against this head. No finding.

## Previous findings

- R01 — repaired: README line 404 reads "(FO, (4.10), p. 80; B08, §I.2, p. 5)"; FO line 3173 carries (4.10) under the running head of printed p.80 (FO line 3164).
- R02 — repaired: none of the listed names remains (no `PG.` prefix, no `wachModule`, `IsOrdinaryOfWeight`, `HerrCohomology`, `deRhamDiffEq…`, `cyclotomicNormField`, `fieldEtaleRealization`, `CoefficientRobbaModule`); lines 80–88, 908–919, 940, 1320–1350 cite by section and object.
- R03 — repaired: the description now reads "the localization presentation of the de Rham differential lattice (§5.1; the lattice and the p-adic monodromy theorem are imported from NoncommutativeAndEquivariantIwasawa §F.6)".
- R04 — repaired: the description lists twelve open suppliers with their sections, says "This pull request adds the roadmap folder", and the sentence on author-side passes is gone.

## Verified sound

| Statement | Instances | Values | Result |
|---|---|---|---|
| §1.4 `γ_a(π)=(1+π)^a−1` (line 404, locator restored) | `a=2,b=3`; φ | `γ_2∘γ_3(π)=(1+π)^6−1=γ_6(π)`; `φγ_a(π)=(1+π)^(pa)−1=γ_aφ(π)`; `a=1` identity | holds |
| §4.4 `N(T)=N(V)∩D(T)`, `N(T)[1/p]=N(V)`, `λ_V` (lines 908–919, de-named) | `V=ℚ_p`, `T=ℤ_p`, `F=ℚ_p` | `B⁺∩A_F=ℤ_p[[π]]`; inverting p gives `B⁺`; `N/πN=ℚ_p=D_cris`; `Fil¹`: `φ(x)∈qB⁺` forces `x(0)=0`, image 0 | holds |
| §4.5 Herr complex `C_Herr(D)` (line 940, de-named) | scalars `φ=3`, `γ=5` | `d⁰(1)=(2,4)`; `d¹(2,4)=4·2−2·4=0`; Liu's order `(4,2)`: `2·4−4·2=0`, degree-two sign −1 matches | holds |
| §5.1 twist `N_dR(V)=t^(−h)N_dR(V(−h))⊗e_h` (lines 984–986, de-named) | `V=ℚ_p(1)`, `h=1`; `V=ℚ_p(−1)` | `t⁻¹R⊗e₁`, localizes to `K_n[[t]]·t⁻¹e₁=K_n[[t]]⊗D_dR` (`g(t⁻¹e₁)=χ⁻¹χ`); `N_s=tR^s e₋₁`, `D_dR=K·te₋₁` | holds |
| §3.6 ordinary of weight `λ` (line 756, de-named) | `K=ℚ_p`, n=2, `λ=(0,0)` | supplier's shift `i−1` gives labelled weights `0,−1`: strictly ordered without a regularity predicate | holds |

The rows for untouched statements stand as in the previous review, of c1968e3; the diff changes no statement and `Suggested.lean` is byte-identical to c1968e3.

- Source locators re-read at the text: 1 (FO 56590ae4 lines 3164–3173, display (4.10) on printed p.80, PDF page 86). Seeded sample inside the diff: §§1.4, 2.3, 2.7, 4.3, 4.4 (supplier names only, apart from §1.4's page); the other sampled sections are untouched.
- Cross-roadmap citations of the changed passages resolved at the open heads or on main, 24: NoncommutativeAndEquivariantIwasawa §F.6 stages 1 and 3 (norm field, Cohen-ring étale equivalence, overconvergence and radius models; embedded lattice, deRham_iff_potentiallySemistable); PhiGammaModulesAndIwasawaCohomology §§1.0 (its *Needs* names §F.6 stage 1; API has tensor, dual, restriction/induction, reduction), 1.0b (extended Robba annulus), 1.0c (period-module/bundle and /B-pair equivalences, classical B-pair specialization, derived period comparison), 1.3, 1.6, 3.9, 5.6a (radius lattice `N_dR^r(V)`), 6.0; LocalGaloisDeformationRings §§0.2.1, 0.3, 0.4 (`C_Herr(D)`), 1.7; PadicLocalLanglandsForGL2Qp §0.2 (horizontal-basis criterion, both Robba comparisons); AInfCohomology §AI.3.1 (all six target titles) and §AI.6.4 (*Rational normalization of Hyodo–Kato monodromy*); FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.3.3 (`D*_st(V)≅D_st(V^∨)`); SelmerIwasawaCohomology §0.8 (`nonempty_padicKummer_equiv`, its `Suggested.lean` line 73); SchemeAndStackFoundations §0.20 on main (`Ring.IsNagata.of_complete_local`, `Suggested.lean` line 155).
- Library declarations opened at the pins, 9: Mathlib `1b1ccf4` `RingTheory/Perfectoid/FontaineTheta.lean` lines 166, 183, 196; Tau Ceti `2fd255d` `RingTheory/Huber/Restricted/TwoSidedSeries/Basic.lean` lines 109, 116 and `Convolution.lean` lines 61, 75, 96, 121. Both pins of lines 34 and 38 equal `lake-manifest.json`.
- Gate at f919453: every check 0, `OK`. `lake env lean TauCetiRoadmap/PadicHodgeTheory/Suggested.lean`: exit 0, `declaration uses sorry` (line 70) the only diagnostic; signatures and the padding probe stand, the file being unchanged.
- Dependency check: `depcheck: 245 roadmaps, 2253 edges, 0 problem(s)`; no UPWARD or CYCLE line. Diff outside the folder against `origin/main`: empty.
- Pull request text: title, summary block and prose agree with the head. Every section list of the description was tallied against the README (PadicPeriodRings §§1–4; PhiGamma §§1.0–1.0c, 1.3, 1.5–1.6, 3.9, 5.6a, 6.0–6.1; LocalGaloisDeformationRings §§0.2.1, 0.3–0.4, 1.7; ArithmeticGaloisRepresentations §§2.4, 2.6, 6.1–6.3; Néron §§1.7–1.10, 3.10–3.14, 5.0b–5.3; the rest likewise); the ten other suppliers of the task list are each named in the contracts; 3 Lean declarations and `metadata.toml` as stated.
- Overlap facts: RigidAnalyticGeometry §§7.4 and 8.4 (lines 1374, 1451), dropped by the open revision of RigidAnalyticGeometry, are still cited beside AdicSpacesPartIII §§R3.6 and R3.7, where the content now is; no other open pull request changes this roadmap.
- Overlap check: read PhiGammaModulesAndIwasawaCohomology, FiniteFlatGroupsAndIntegralPadicHodgeTheory, CohomologyComparisons (the third list is empty); nothing shared: the norm field, étale equivalence and differential lattice are NoncommutativeAndEquivariantIwasawa §F.6's, used by PhiGamma and imported here; Wach modules and relative B-pairs are PhiGamma's.
- Remark on untouched text: line 104 cites `KottwitzMap.kottwitz` at ReductiveGroupsPartII §RG2.1.5; main has the namespace `KottwitzMap` with `torus`, `torus_surjective`, `connected_zero`, and no declaration of that exact name.
- Source independence: changed passages only; 1 changed locator passage compared with 1 source (FO), nothing shared beyond the formula; the other changed passages replace declaration names by supplier objects and add no source wording; largest share BC, 35 locator groups, then S13 29 and B02 28; arrangement not compared again (the diff adds, removes and reorders no layer).

## Not verifiable

- The items of the earlier reviews stand unchanged (Kottwitz 1986, Fontaine 1982, the printed pages of Gleason–Lim–Xu, Heuer, Qian and Nakamura); the diff touches none of them.

## Source issues

- none

## For the human reviewers

- none
