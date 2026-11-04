# Review of ShimuraCompactifications (pull request #1053 at 63e3f03)

**Verdict:** needs changes

No P1 or P2 finding. The verdict is driven by the push gate, which fails on this head on two style
rules (158 target ids and 13 README-only Lean names); everything else below is P3. The dependency
check is clean (`depcheck: 205 roadmaps, 1422 edges, 0 problem(s)`), the targeted build passes, and
the two headline statements of `Suggested.lean` survive the adversarial pass.

## R01 (P3) — Gate: target ids carry the `C` prefix (158 headings)

Location: `TauCetiRoadmap/ShimuraCompactifications/README.md` lines 403–4107, every `### Ck.n …`
heading, and the layer headings `## Layer C0: …` … `## Layer C6: …`.

Claim: the gate rule reads `target-ids (158): write `### k.n Title` (digits only, no prefix)`; the
same rule rejects the letter-suffixed ids `C3.6a`, `C6.12a`, `C6.20a` and the sub-layers
`C2.general.1`, `C3.general.1`.

Witness: `gate.md` for this head, `target-ids=158 … FAIL`, first line `line 403: target id 'C0.1'`.

Repair: renumber the layers and targets with plain digits in README order, for example
`## Layer 0` … `### 0.1`, …, with `C2.general` and `C3.general` becoming numbered layers of their own
(`Layer 3`, `Layer 5`) and `3.6a`, `6.12a`, `6.20a` absorbed into the running count of their layer;
update every internal `Ck.n` reference (the conventions line "Internal references use `Ck.n`", the
"How to read the build" paragraph, every `*Needs:*` line and the headline table). Six open consumers
cite the present labels (`C0.16`, `C0.17`, `C5.16–C5.20`, `C3.general.1`, `C6.43–C6.49`):
AnalyticToricGeometryPartII, PerfectoidShimuraVarieties, HilbertModularSurfaces, AutomorphicBundles,
HodgeTateAndCanonicalSubgroups, IgusaVarietiesAndTorsionConcentration. The worker should announce
the new numbering on their jobs when it submits.

## R02 (P3) — Gate: thirteen `HilbertCusp.*` names are claimed but not declared

Location: README lines 3076, 3094, 3107, 3122, 3166, 3177, 3296, 3309–3310, 3323, 4054 (the
`HilbertCusp.` names of C6.1–C6.4, C6.6–C6.8, C6.13, C6.14, C6.54).

Claim: a backticked name in the roadmap's own namespace is a claim that `Suggested.lean` declares
it; the file declares only `HilbertCusp.bounded_cusp_support_is_positive`.

Witness: `gate.md`, `readme-ids-missing=13`, listing `HilbertCusp.admissibleFan_iff` through
`HilbertCusp.unramified_iff`.

Repair: state each of the thirteen facts in prose without the backticked name (for example "Prove
that a nonzero element of `F` that is not totally positive has a negative real embedding"), as the
gate rule prescribes; do not add declarations to `Suggested.lean` (C6.1–C6.4 and C6.6–C6.8 are
one-line consequences of Mathlib and would be padding there).

## R03 (P3) — Three supplier declaration names exist nowhere

Location: README line 332 (supplier entry for HilbertModularVarietiesAndShimuraCurves, "H4.8–H4.9
supply `HilbertIntegralGamma0` and `gamma0Cartesian`"), line 3914 (C6.47, the same two names), and
line 346 (`AbelianVariety.zarhin_dim`, the PadicDifferentialEquationsAndRigidCohomology §RD.5.116
entry, used by C5.32 and C5.33).

Claim: the three names are cited as declarations of their suppliers.

Witness: `roadmaps grep 'HilbertIntegralGamma0\|gamma0Cartesian'` answers "no match on main or in
any open roadmap pull request"; `grep zarhin_dim` on PadicDifferentialEquationsAndRigidCohomology at
its head (#1002) finds nothing, although `### RD.5.116 Zarhin's trick` exists there (a lemma on
`(A × A^∨)^4`, with étale-local polarisation hypothesis). HilbertModularVarietiesAndShimuraCurves at
#1005 has `### H3.6 Arithmetic Hilbert quotient`, `### H4.8 Integral Iwahori and higher subgroup
levels`, `### H4.9 Polarization quotient at subgroup level` with the quotient-stack square, the free
locus `X^free/Δ(N)` and the 2-Cartesian statement C6.47 uses, under no Lean name.

Repair: cite H3.6, H4.8 and H4.9 and §RD.5.116 by section only; drop the three backticked names.

## R04 (P3) — C6.49 cites the definition of the modified lattice for the natural one

Location: README line 3966, "([BHW], §7.1, Definition 7.3 and Proposition 7.4, pp. 1759–1760)".

Claim: the target identifies the natural integral conormal lattice with BHW's `ω^+` and says the
modified lattice "is a different sheaf".

Witness: bhw line 1379–1380 defines `ω^+_{Ig(p^m)}` as the integral subsheaf obtained from the
formal model (the paragraph after Definition 7.1); bhw line 1386 (Definition 7.3) defines
`ω^int_{Ig(p^m)}`, the modified lattice; bhw line 1390–1396 (Proposition 7.4) is about `ω^int`, with
(2) comparing it to `ω^+`.

Repair: cite "§7.1, the definition of `ω^+` following Definition 7.1, and Proposition 7.4(2) for the
comparison with the modified lattice `ω^int`"; keep Definition 7.3 only in the sentence about the
modified sheaf.

## R05 (P3) — Lan page numbers are the printed book's, the copy read is the revision

Location: README line 4224 (reference `[Lan]`, listing the PUP 2013 monograph and the author-hosted
revision of 14 March 2021) and every `[Lan] …, pp. …` locator (for example line 415 "pp. 443–445",
line 1793 "pp. 191–192", line 2256 "pp. 503–505").

Claim: "page numbers follow those editions" (line 40).

Witness: in the revision, Lemma 6.1.2.6 is on its page 472 (lan line 19699–19725), Proposition
3.3.1.5 on page 220 (lan line 9073–9091), Definition 6.3.2.5 on page 531 (lan line 22005–22017);
the README's 443, 192 and 503 are the printed book's pages, which the revision does not reproduce.
Theorem numbers agree in both.

Repair: say in the `[Lan]` entry that page numbers are those of the 2013 printing and that the
revision keeps the theorem numbering, or cite Lan by theorem number only.

## R06 (P3) — C4.9's locator does not state the extension of the `O`-action

Location: README line 1995, "([Lan], 6.3.2.5–6.3.2.6, pp. 503–504)".

Claim: the generic `O`-action extends uniquely over the normal boundary base as a ring action
compatible with the polarization and Rosati involution.

Witness: lan line 22005–22049: Definition 6.3.2.5 defines good algebraic models (with the action `i`
already part of the degenerating family of Definition 5.3.2.1) and Proposition 6.3.2.6 asserts their
existence; neither states an extension theorem. The extension is Proposition 3.3.1.5 (lan line
9091–9094, uniqueness over a noetherian normal base), applied to each endomorphism.

Repair: cite "[Lan], Proposition 3.3.1.5 with Definition 5.3.2.1; the models of 6.3.2.5–6.3.2.6
carry the extended action".

## R07 (P3) — "Part II of AnalyticToricGeometry" names another roadmap

Location: README line 5, "It is Part II of AnalyticToricGeometry".

Claim: this roadmap is the Part II of AnalyticToricGeometry.

Witness: an open roadmap pull request carries the folder `AnalyticToricGeometryPartII` (its README
line 1: "analytic toric geometry, part II — nonarchimedean models and perfectoid approximation"); it
consumes this roadmap's C0.1, C0.4–C0.7, C0.9, C0.10, C0.16–C0.18 and declares
`gap:toric-field-fibres` on it (its line 57). Two roadmaps cannot both be "Part II".

Repair: replace the sentence by "Layer C0 extends AnalyticToricGeometry Layer 0 to arbitrary
coefficient rings, torsor bases and arithmetic cone systems", and keep the existing deferral of the
nonarchimedean development to AnalyticToricGeometryPartII by name.

## R08 (P3) — C5.26 is conditional on a depth hypothesis the roadmap never discharges

Location: README lines 2826–2830, "Assume, as part of the hypotheses, that the special fibre of the
formal model has depth at least two at the points of the minimal boundary".

Claim: the formal Hilbert–Siegel Koecher principle of BCGP §8.2 is delivered.

Witness: bcgp21 line 11498–11502 (printed p. 240) asserts the extension from normality of the formal
scheme and codimension ≥ 2 alone. For a normal `p`-adically complete `A` with `p` a nonzerodivisor,
`S2` of `A` gives only `depth (A/p)_q ≥ min(2, dim A_q) − 1`, so the thickenings need not be `S2`
along a codimension-two locus; the README's added hypothesis is therefore necessary for its route
(EGA IV₂ 5.10.5), but no target proves it for the normalized blow-up models of C5.31 that BCGP use.

Repair: either add the depth statement for those models as a target (with its route: for instance
Cohen–Macaulayness of the completed torus-torsor charts of C5.20 along the minimal boundary), or
state in the headline table and in `## Downstream consumers` that C5.26 is conditional and name
the consumer that must supply the depth input.

## Verified sound

**Gate.** `gate.md` for 63e3f03: `build=0`, `depcheck=0`, `set_option=0`, `sorry-data=0`,
`imports=0`, `stray-files=0`, `outside-folder=0`; only `readme-ids-missing=13` and
`target-ids=158` fail (R01, R02). `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ShimuraCompactifications'`
is empty. The dependency check run by me:

    depcheck: 205 roadmaps, 1422 edges, 0 problem(s)

**Principles.** No route-specific shortcut (every PEL statement keeps Lan's good-prime hypotheses
(C4-b) and the Hilbert layer keeps all primes prime to the level); no re-planned roadmap: the
principal Siegel compactification is imported from ArakelovGeometryAndAbelianHeights §§5.0a–5.0b
(its README at #1000, lines 1343–1366: `SiegelModuli.ToroidalCompactification`,
`toroidalDegenerationChart`, `toroidalRefinement`, `MinimalCompactification`,
`hodgePower_generated`, `hodgeDegree_zero_criterion` all present) and the general PEL and Hilbert
constructions are new; ShimuraVarieties at #933 line 17 says "ShimuraCompactifications supplies no
input here", HilbertModularVarietiesAndShimuraCurves at #1005 never mentions this roadmap, so there
is no cycle. No copied passages found in the sampled sections; no algorithm; no sorry'd data; no
`set_option`; no `lemma`.

**Ownership against open work.** `roadmaps grep -i 'toroidal compactif'`: the only other builders
are ArakelovGeometryAndAbelianHeights (§5.0a, principal Siegel over `ℤ`, earlier in the order and
cited here) and consumers later in the order (PerfectoidShimuraVarieties, AutomorphicBundles,
HodgeTateAndCanonicalSubgroups, IgusaVarietiesAndTorsionConcentration, HilbertModularSurfaces, all
citing this roadmap's sections). `roadmaps grep '0E0L'` finds only this roadmap, so
`proper_flat_globalFunctions_baseChange` has no other owner; SchemeAndStackFoundations §§0.8, 2.6,
4.9 on main do not state it. Tau Ceti at the pin has `TauCeti.Toric.Fan.IsSubdivision` and
`IsSubdivision.toFanHom` (`TauCeti/Geometry/Toric/Algebraic/Fan/Subdivision.lean` lines 48, 95) but no
scheme morphism and no coefficient ring other than `ℂ`, so C3.5 is correctly not stated.

**Library declarations opened at the pins (file:line).** Mathlib `6b7abb3`:
`AlgebraicGeometry/Geometrically/Connected.lean:40` (`GeometricallyConnected`, via `ConnectedSpace`,
which includes `Nonempty`), `Geometrically/Reduced.lean:44`, `NumberTheory/NumberField/Units/Basic.lean:133`
(`pos_at_place`), `:137` (`sum_mult_mul_log`), `Units/DirichletTheorem.lean:292`
(`dirichletUnitTheorem.exists_unit`), `InfinitePlace/TotallyRealComplex.lean:61` (`IsTotallyReal.mult_eq`),
`GroupTheory/Index.lean:588` (`exists_pow_mem_of_index_ne_zero`), `RingTheory/DedekindDomain/Different.lean:57,69`
(`Submodule.traceDual`, `mem_traceDual`), `Analysis/SpecificLimits/Basic.lean:182,189`,
`Algebra/MonoidAlgebra/MapDomain.lean:127` (`comapDomain`), `:310` (`mapRingHom`),
`Algebra/MonoidAlgebra/Basic.lean:251,284,302` (`lift_single`, `mapDomainAlgHom`, `domCongr`),
`Data/Finsupp/Basic.lean:516` (`comapDomain_apply`), `RingTheory/Ideal/Quotient/Operations.lean:544`
(`quotientKerAlgEquivOfRightInverse`). Tau Ceti `a91d3aa`: `NumberTheory/NumberField/TotallyPositive.lean`
(`IsTotallyPositive`, printed by `#print` as strict positivity at every real place, and
`isTotallyPositive_iff`), the directories `Geometry/Toric/Algebraic`, `Geometry/Hodge/Mixed/Strictness.lean`,
`AlgebraicGeometry/RelativeSpec/Functor.lean`, `AlgebraicGeometry/RationalPoint/Basic.lean`,
`Algebra/AlgebraicGroup/SplitTorus/Scheme.lean` and `Frobenius.lean` named in the supplier table all exist.

**Elaboration.** `lake env lean` on a scratch copy of `Suggested.lean` with `#check @` for both
declarations: the elaborated types equal the README statements of C6.5 and C6.53 (all binders carried
explicitly; nothing lost). One-tactic probe (`first | rfl | simp | infer_instance | simp_all |
(intros; simp_all)`) leaves both goals open, so neither is padding.

**Cross-roadmap citations resolved** (at the heads the brief names, or on main): ShimuraVarieties
#933 §P.1–P.6 (`TauCeti.Shimura.finite_analytic_quotient` at line 204), 0.5, 1.5, 2.1, 2.2, 2.5,
2.7, 5.2 (`TauCeti.Shimura.weight_one_algebraization` at line 1365), Layers 4, 7, 8.1, 8.4,
8.22–8.23; FiniteFlatGroupsAndIntegralPadicHodgeTheory #879 R07.1.1 (`frobeniusHom`,
`verschiebungHom`, line 604–639), R07.2.21 (`Ha(G) = det V*`, line 305, 3831);
AlgebraicModuliForArithmeticGeometry #853 Layer 6 (`Approximation.HasArtinApproximation`, line 8999);
PadicDifferentialEquationsAndRigidCohomology #1002 §RD.5.116 (section exists; name missing, R03);
ComplexComparisonPartII #848 §C−1.1 (`ComplexAnalyticSpace` line 765, `complexSchemeAnalytification`
line 385), C0.4, C2, C3.3, C4.1–C4.4; PELModuli #966 M1.2, M1.7, M2.8–M2.10, M3.6, M4.3, M4.5–M4.6;
ShimuraData #1038 §1.1, §4.3 (`SV4`, `sv4_rationalHodge`), Layers 3–4; NeronModels #852 Layer 1,
3.1, 3.10, 3.13, 3.14; AbelianSchemesAndArithmeticModuli #849 A0.1, A1.3, A2.2, A2.3, A2.5, A2.8,
A3.2, A3.6, A3.9, A4.1, A5.3; ModularCurvesPartII #913 3.5, 3.6, 3.7, 3.11, 4.8, 5.2, 5.13, 9.1;
AdelicAlgebraicGroups #792 3.2, 3.3, 3.4, 3.6; ArithmeticGaloisDuality #858 R02.1.1;
HilbertModularVarietiesAndShimuraCurves #1005 H0.3–H0.5, H1.1, H1.6, H1.7, H1.9, H2.2, H2.2a–b, H2.3,
H2.5–H2.8, H3.6, H4.4, H4.8, H4.9, H4.11, H4.13, H5.1; ArakelovGeometryAndAbelianHeights #1000 §2.0
(`GroupScheme.IsSemiAbelianFamily`, `semiAbelianHom_extend`, its README lines 669–673), §§5.0a–5.0b. On main:
SchemeAndStackFoundations §§0.3, 0.6, 0.8, 0.28, 0.29, 1.1, 1.2, 1.9, 1.15, 1.17, 1.19, 1.23, 2.1,
2.2, 2.5, 2.6 (`ample_serre_vanishing`, line 3445), 2.19, 2.20, 3.4, 4.7–4.10, 4.17; AdicSpacesPartIII
F0.2–F0.8, R2.8, R2.10, R3.7 and all eleven item names (`formal-functions-affine`,
`theorem-on-formal-functions`, `formal-direct-image-comparison`, `cohomology-of-mittag-leffler-limit`,
`grothendieck-existence`, `grothendieck-algebraization`, `formal-completion-and-algebraic-comparison`,
`fractional-valuation-bound`, `hasse-domain`, `gaga-comparison-map`, `proper-gaga`); AdicSpacesPartII
R1.3 (`analytification-functor`), R1.4; ReductiveGroups Layer 7; AnalyticToricGeometry (Completed)
Layers 0, 2, 3, 4, 5 (support criterion stated for nonempty finite fans, its line 164, as C0.17
records); AlgebraicVectorBundles L0B, L0C, L1A, L1B, L2A, L2B; JacobianChallenge Layer C;
ModularCurves Layer 10 and §0E. The worker's `citations.md` lists no cross-roadmap citation found
nowhere, and I found none either.

**Source sample (15 targets, seeded from the head, none chosen by heading), each read at the locator.**

| Target | Source, locator | Read at | Supports as written |
| --- | --- | --- | --- |
| C0.3 | [Lan] Lemma 6.1.2.6 | lan line 19725–19742 | yes: stratum ideal `⊕_{χ∈σ^∨_0} O_χ`, quotient `Spec ⊕_{χ∈σ^⊥} O_χ`; page is the book's (R05) |
| C0.19 | [Dimitrov] §2, pp. 529–530 | dimitrov line 173–189 (printed 529–530) | yes: `(Z_1⋯Z_r)`-entire Laurent series, condition (ii) is the diagonal-tail finiteness |
| C4.8 | [Lan] 3.3.1.5; [BP] Lemma 4.2.2, p. 43 | lan line 9091–9094; bp line 2242–2244 (page 43) | yes: unique extension over noetherian normal base; BP proves by FC I.2.7 |
| C4.9 | [Lan] 6.3.2.5–6.3.2.6 | lan line 22005–22049 | partly: locator defines good models, not the extension (R06) |
| C4.12 | [Lan] 4.4–4.5 "in rank one" | lan line 11471 (Remark 4.4.7) | yes as a range; Lan has no explicit Tate-curve statement, the comparison is the roadmap's own |
| C5.1 | [Lan] 6.3.2.5–6.3.2.9; errata 60–77 | lan line 22005–22061; lan-errata line 228–283 | yes: two embeddings `ı_nat`, `ı_alg`, conditions (3a)–(3c); errata (61), (63)–(65), (72) are the étaleness corrections |
| C5.25 | [BCGP21] §8.2, p. 240 | bcgp21 line 11494–11502 (page 240) | yes: codimension ≥ 2 boundary of the minimal compactification; the `3d` and `≤ d` figures are the roadmap's derivation |
| C5.30 | [BCGP25] Thm 1.8.29, p. 17 | bcgp25 line 818–832 (page 17) | yes: hyperspecial at `ℓ`, smooth integral model, footnote 2 cites smooth toroidal compactifications |
| C5.33 | Moret-Bailly XI Thm 4.5, pp. 235–236 | moretbailly line 8318–8343 (printed 235) | yes: (iv) isotrivial ⟺ (v) ⟺ (v bis), `S` projective |
| C6.18 | [Dimitrov] Prop 4.1(ii), p. 537 | dimitrov line 521–523 (printed 537) | yes: `q^ξ ↦ ζ_C^{n Tr(ξx)} q^ξ`; additivity is linearity of the trace |
| C6.24 | [Dimitrov] Cor 7.4, p. 544 | dimitrov line 839–847 (printed 544) | yes, including free action of `o_C^×` on non-open strata |
| C6.26 | [Dimitrov] Prop 7.6, p. 544 | dimitrov line 850–852 | yes: unique semi-abelian extension with `o`-action, torus over the boundary |
| C6.32 | [Dimitrov] Thm 8.6(iii), pp. 548–549 | dimitrov line 1014–1017, 1039–1041 | yes: finite generation, normal projective, Zariski connectedness |
| C6.40 | [Dimitrov] Prop 8.5(i), p. 547; [DT] §7 | dimitrov line 994–997; dt line 1471 (Prop 7.3) | yes: injectivity over `o′[1/Δ,ζ_C]`-algebras, proof deferred to DT |
| C6.49 | [BHW] §7.1, Def 7.3, Prop 7.4 | bhw line 1379–1396 | partly: Def 7.3 is the modified lattice (R04) |

Also read for claims the README makes about its sources: Dimitrov line 917 (§8 assumes `d_F > 1`),
line 982–986 (proof of 8.3), lan17 line 202–210 (Definition 2.5: `pol(x+y) ≥ pol(x)+pol(y)`, page 5),
lan17 line 1235–1248 (Proposition 7.5, page 28), lanhk line 915–920 (Lemma 7.5, page 18), pink line
1057–1065 (2.1(v), printed p. 30), pilloni20 line 3899–3900 (13.2.1, page 85), rapoport line 792
(Théorème 3.5), stacks-0E0L line 3679–3685, stacks-0A18 lines 3920, 3989, 4141 (Tags 0A19, 0A1B,
0E0D), stacks-0CBN lines 1173, 1235 (Lemmas 21.2, 21.6).

**Adversarial table** (values computed on each side).

| Statement | Instances tried | Values | Result | Change |
| --- | --- | --- | --- | --- |
| `bounded_cusp_support_is_positive` (C6.5) | `R = 0` | `a ξ ≠ 0` never holds | vacuous-true, fine | none |
| same | `F = ℚ(√2)`, `U = o^×`, `a` supported at `ξ = −√2`, `y = (1,1)` | `u = (1+√2)^n`: pairing `−√2(1+√2)^{2n} + √2(1−√2)^{2n} → −∞` | bound hypothesis fails, so excluded | none |
| same | `F = ℚ` | one infinite place; `a` at `−1` with any bound satisfies all other hypotheses, conclusion false | `hd` excludes it | none |
| same | `a` supported at `0` only | sum `= 0`, `B = 0` works; conclusion `ξ = 0` | holds; constant term allowed, as C6.5 says | none |
| same | `U` of infinite index | `U.index = 0`, `hU` false | excluded; needed for `exists_pow_mem_of_index_ne_zero` | none |
| `proper_flat_globalFunctions_baseChange` (C6.53) | `f = id`, `S = Spec ℤ/4`, any `T`, `U` | map is `O_T(U) → O_T(U)` identity | holds | none |
| same | `X = Spec ℂ → S = Spec ℝ` | fibre over `Spec ℂ` is `ℂ×ℂ`, disconnected; `O_S(S) = ℝ ≠ ℂ` | hypothesis excludes, conclusion false without it | none |
| same | `X = Spec k[ε] → Spec k` | not geometrically reduced; `k ≠ k[ε]` | excluded | none |
| same | `X = ∅`, `S ≠ ∅` | `ConnectedSpace` needs `Nonempty`; `O_X = 0 ≠ O_S` | excluded | none |
| same | `X = ℙ¹_T` over any `T` | `H^0 = O_T` on every open | holds (Stacks 0E0L, hypotheses identical) | none |
| C0.1 multiplicativity | even submonoid of `ℕ` | `π(e_1) = 0` but `π(e_2) = e_2 ≠ 0 = π(e_1)²` | face condition needed, Check correct | none |
| C0.4 kernel | `R = ℤ/4`, `P = ℕ`, `F = {0}` | `J = (e_1)`, `2e_0 ∉ J` | correct | none |
| C0.15 `pol` | quadrant subdivided at `(1,1)`, `pol = x+y+min(x,y)` | `(1,0) ↦ 1`, `(0,1) ↦ 1`, `(1,1) ↦ 3 ≥ 2`; linear pieces `x+2y`, `2x+y` | superadditive, matches Lan17 Def 2.5(4) | none |
| C0.19 completion | `r = 2`, `Σ x_1^n` vs `Σ x_1^n x_2^n`; `R[x,x^{-1}]` at `(x)` | first has infinitely many terms with `a_2 = 0 < 1`; `(x) = (1)` so completion `0` | Checks correct | none |
| C0.20 finiteness | rank one, index `e` | `q ↦ q′^e`, `e·m′ ∈ M`, so integral of degree `e` | correct | none |
| C3.3 `q_power_test` | `g = diag(p,1)`, `Γ(N) ∩ gΓ(N)g^{-1}` | translations `n ∈ pNℤ`, width `pN`; `t = e^{2πiz/pN}` pulls `q_N` back to `t^p` and `t` | correct | none |
| C3.5 blow-up Checks | `Bl_0 A²`, `I = (xy)` | `π_*I′ = (x)∩(y) = (xy)`; `π^*(xy) = u²v`, order 2 on `E`; `x ∉ (xy)` | correct | none |
| C3.8 Veronese Check | `A = k[s³,s²t,st²,t³] → k[u,v]` | `I/m_A I` has dimension 2 (degree-3 generators, `m_A I` in degree 6), `IB = (uv)` | nonzero kernel, correct | none |
| C4.16 Klingen Checks | `L = ⟨e_1,pe_2,pf_2⟩`, `H_1 = ⟨pf_1⟩` | `⟨pe_2,pf_2⟩ = p² = 0`; `[p]^{-1}H_1 = ⟨f_1,pe_1,pe_2,pf_2⟩`; quotient by `L` is `⟨f_1⟩ ≅ ℤ/p²`; for `L_0 = ⟨e_1,e_2⟩` it is `⟨f_1⟩⊕⟨pf_2⟩` | correct, `L_0` of wrong type excluded | none |
| C4.15 degree of `Ha` | `det V^* : det E → det Frob^*E` | `Frob^*L = L^{⊗p}` so `Ha ∈ ω^{⊗(p−1)}` | correct for all `p` including 2 | none |
| C5.8 Check | `ℙ¹×ℙ¹`, `w = 1`, `w = z²` | `z = ±1`, two points when `2` invertible | correct | none |
| C5.29 | rank-two `E`, `diag(t_1,t_2)` | `Sym²` eigenvalues `t_1², t_1t_2, t_2²`, product `(t_1t_2)³` | `det Sym²E = (det E)^3` | none |
| C6.3 | `ℚ(√2)`, `ξ = −√2`, `v = 1+√2`, `y = (1,1)` | as in row 2 | correct | none |
| C6.13 lattices | `F = ℚ`, `b′ = ℤ` and `b′ = ⅓ℤ` | `X = ℤ, X^* = ℤ, ⟨m,n⟩ = mn`; `X = ⅓ℤ, X^* = 3ℤ, ⟨⅓,3⟩ = 1` | correct | none |
| C6.15–C6.19 phases | `A = ℤ, B = ⅓ℤ, n = 3, x = 1`; `B = ¼ℤ, n = 4, ζ = 2 ∈ (ℤ/5)^×, x = 0,1`; `ℤ/8, ζ = 3` | `m = 1`; values `1` and `2`; `3^4 = 81 ≡ 1 (mod 8)`, order 2 | all correct; `m_{ξ+η} = m_ξ + m_η` exactly by linearity of the trace | none |
| C6.37 Check | `F = ℚ(√5)`, `u = φ^5` | `φ^5 = 5φ+3 = (11+5√5)/2`; `N(u−1) = (81−125)/4 = −11`; `N(u) = (−1)^5 = −1` | character of weight `(1,1)` is `−1`; `(2,2)` trivial | none |
| C6.47 Check | `F = ℚ(√3)`, `N = 7`, `S`, `u = 7+4√3`, `E: y² = x³−x` | `S² = 3I`; `u = (2+√3)²`; `η = u² = 97+56√3 ≡ −1 (mod 7)`; `f†f = (7I+4S)² = 97I+56S`; `#E(𝔽_5) = 8`, `a_5 = −2` | correct, point ordinary, class nontrivial | none |
| C6.54 Checks | `s = [[1,0],[2,1]]`, `γ = −sTs^{-1}`; `diag(2,½)` | `γ = [[1,−1],[4,−3]] ∈ Γ_1(4)`, `s^{-1}γs = −T`; conjugate of `T` is `[[1,4],[0,1]]` | correct, matches C6.26 | none |
| C6.11 scope | `F = ℚ` | `q^{-1}` not excluded (`o^× = ±1`) | hypothesis `g > 1` present; base `o′[1/Δ]` inverts the discriminant, as Dimitrov §8 (line 917, 975) | none; see R08 for the only conditional target |
| C5.25 | `d = 1` | open part dimension 3, boundary ≤ 1, codimension 2 | consistent with bcgp21 p. 240 | none |

**Generality README versus Lean.** C6.5: both quantify over an arbitrary commutative `R`, a finite-index
`U ≤ o^×`, `[F:ℚ] > 1` (as `1 < card InfinitePlace F`, equal to the degree for totally real `F`),
arbitrary positive `y`, covariance with unit multipliers. C6.53: both take proper, flat, locally of
finite presentation (with properness this is finite presentation), geometrically reduced and
connected fibres, and conclude bijectivity on every open after every base change; neither assumes
reducedness of the base.

**Conventions with witnesses.** `pol` superadditive (Lan17 Def 2.5(4), witness `3 ≥ 1+1`); Tate
curve `(du/u)^{⊗2} ↦ dq/q` with `du/u ↦ p·du/u` and `dq/q ↦ p·dq/q` under `q ↦ q^p`; cusp-unit
action `ξ ↦ u²εξ` with pullback `q^ξ ↦ q^{a_gξ}` and the contragredient `ξ ↦ a_g^{-1}ξ` (C6.54,
witness `[[1,4],[0,1]]` versus `1/4`); the phase `ζ_e^{e·Tr(ξx)}` (Dimitrov line 523); Pink's weight
`w` with the inverse-diagonal convention (C1.1 witness `diag(t^{-2},1)` scaling `b` by `t^{-2}`).

**Shape.** Summary, scope and ownership, conventions, exact supplier contracts (Mathlib, Tau Ceti,
roadmaps), how to read the build, layers in build order each ending with Examples and Dependencies,
downstream consumers, worked examples, references: present. Every target has a locator and a
`*Needs:*` line; every definition has an API list and at least three Checks (counted on C0.1–C0.21,
C1.1–C1.6, C4.1, C4.4, C4.5, C4.14, C5.15, C5.19, C5.28, C5.31, C6.13, C6.19). No process words,
pull-request numbers, LaTeX delimiters or local paths. Headline theorems listed in the README table;
of them only C6.5 and the general theorem behind C6.53 are statable at the pins, and the module
docstring names each missing carrier for the rest (torus torsors and arithmetic cone systems; mixed
boundary data; Shimura varieties and their toroidal models; semi-abelian families and degeneration
data; PEL moduli; Hilbert moduli, cusp charts, weight sheaves, formal algebraic spaces).

## Not verifiable

- [FC] Faltings–Chai, *Degeneration of Abelian Varieties* (Springer, paywalled): cited in C4.2, C4.5,
  C4.6, C4.8, C5.13, C5.14, C5.16, C5.32, C5.33 and the sampled C4.8, C5.33; recorded as
  `uncertified`, cited by locator. The corresponding Lan and Moret-Bailly locators were read instead.
- Ash–Mumford–Rapoport–Tai, *Smooth Compactifications* (cited through Pink 6.19 in C1.5): not fetched;
  Pink's text was read.
- [BHW], [CG], [Pilloni12], [BPS], [Yuan], [Bresciani]: read in the arXiv or author copies, whose
  pagination differs from the journal pages the README cites; theorem numbers were checked, pages
  were not.
- EGA IV₂ 5.10.5 and SGA 1/SGA 3 locators: not fetched (standard references; statements as cited are
  the standard ones).

## Source issues

- **Misprint** in dimitrov at proof of Théorème 8.3, printed p. 547: the source says take `ξ_0` with
  `a_{ξ_0} ≠ 0` and `ξ_0` not totally positive, then finds a negative trace; it should be `ξ_0 ≠ 0`
  and not totally positive, since `0` is not totally positive and has no negative pairing; affects
  nothing.
- **Gap** in dimitrov at Proposition 8.5(ii), printed p. 547: the source says the descent of a form
  holds for every `R`-algebra `R′`; it should be for inclusions `R ⊆ R′`, which is what the cited
  proof (DT §7, Proposition 7.3) covers; affects a stated result.
- **Misprint** in lan17 at Proposition 7.5, author-copy p. 28: the source says when `H′` is normal in
  `H` the group `H/H′` acts and the invariants give the left side, although the map goes from level
  `H` to level `H′`; it should be `H` normal in `H′` with `H′/H`-invariants; affects nothing.
- **Misprint** in pink at Definition 2.1(v), printed p. 30: the source says `W_{−1}(Lie P) = Lie V` and
  `W_n(Lie P) = Lie W` for `n ≥ 0`; it should be `W_{−1} = Lie W` and `W_n = Lie P` for `n ≥ 0`
  (`V = W/U` is a quotient, not a subalgebra); affects nothing.
- **Misprint** in pilloni20 at 13.2.1, author-copy p. 85: the source says `t_2(G,H_n,L) = (G/L, p^{-1}H_n + L/L)`;
  it should be `(G/L, (p^{-1}H_n + L)/L)`; affects nothing.
- **Gap** in bcgp21 at §8.2, printed p. 240: the source says sections of a line bundle on a normal
  formal scheme extend across an open whose complement has codimension at least two; it should add
  that the thickenings are `S2` along that locus (normality of the formal scheme gives only depth one
  on the special fibre), or argue otherwise; affects the proof.
