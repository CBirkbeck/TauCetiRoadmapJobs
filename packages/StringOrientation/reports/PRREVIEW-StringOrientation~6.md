# Review of StringOrientation (pull request #948 at 8b2dcbc)

**Verdict:** needs changes

The gate fails on this head (`statement-hygiene=1`, `build=2`), so no acceptance is possible; both failures are findings below. The branch has merged main since the previous review, so its pins are now Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9` (the branch's `lake-manifest.json`), the same as main's. Every other check passes: the mathematics of the sampled sections and the headline recomputes (table below), the new SmoothBundlesConnections citations resolve on main at the sections and names claimed, and the dependency check reports no problem. One P2 (an overlap with an open revision) and seven P3 findings follow.

**Previous findings, checked first, individually** (the previous review read `ccf7738`; this head is `8b2dcbc`, 191 changed lines, all in `TauCetiRoadmap/StringOrientation/README.md`). No repair report exists for this folder, so nothing is settled as "not actionable".

- Previous R01 (Serre spectral sequence owner in S2.2 and S5.3) — not repaired. README.md:560 still reads "Compute `H*(BString;ℚ)=ℚ[p₂,p₃,…]` by the Serre spectral sequence with λ-normalized transgression"; the S2.2 `*Needs:*` line (591–592) and the S5.3 one (1141–1142) name no owner; the DGFloer contract (228) still says only "normalized long exact sequence of a homotopy fibre". Restated as R06.
- Previous R02 (locator and route for S4.2's modularity theorem) — not repaired. README.md:1009–1011 is unchanged ("prove modularity of weight 2k with integral q-expansion, using ModularForms' q-expansion comparison") and the References (1353–1406) still name neither Zagier nor Hirzebruch–Berger–Jung. Restated as R07.
- Previous R03 (TangentialBordism among the downstream consumers) — not repaired. README.md:1349–1351 still lists FourManifolds alone. Restated as R08.

The change set itself (Scope 70–77, Conventions 121–125, contract 210–218, S3.0 666–740, S3.1 769–771, S5.1 1041–1044 and 1077–1081, Dependencies 969–971 and 1262) replaces S3.0's own principal-bundle, connection and good-cover definitions with citations of SmoothBundlesConnections B1.0–B1.5, B2.1, B2.5, B3.1, B4.1, B4.2 and B6.0, which is on main (ORDER line 8) and does not cite this roadmap. Every cited section and name was opened and says what the README says of it (list under Verified sound).

## R01 (P2) — DifferentialGeometry §5.5 is renumbered, and §6.2, §§8.3–8.5 removed, at DifferentialGeometry's open revision

**Location:** `TauCetiRoadmap/StringOrientation/README.md:236` ("§5.5 (Stokes with corners)"), 695 ("uses DifferentialGeometry §§5.5 and 8.3–8.5 for corner Stokes, locally extendable smooth chains and de Rham"), 739, and 236–238, 690–691 for §6.2 and §§8.3–8.5.

**Claim:** The overlap data lists DifferentialGeometry §5.5 as an id this README cites that the open revision of DifferentialGeometry (pull request #886, same author) no longer defines. Checked at that head: the corner-Stokes content is now lane **5.5b** ("Smooth faces, abstract boundary and corner Stokes", `TauCetiRoadmap/DifferentialGeometry/README.md:850` at the #886 head, with 5.5a densities at 841), so "§5.5" alone stops pointing at Stokes with corners when #886 merges. The same head has no Layer 6, no §6.2 and no Layer 8 at all: its heading list runs Layer 0–5, 5.6 and 12, and it states that "smooth singular chains and the de Rham theorem" are DeRhamCohomologyAndDuality's (#886 head README.md:258–261). DeRhamCohomologyAndDuality at its own head (#1768) does not own them either: it consumes "DifferentialGeometry 8.3's equivalence directly" and "DifferentialGeometry 6.2's flat Poincaré lemma" as stated on main (`TauCetiRoadmap/DeRhamCohomologyAndDuality/README.md:192–193, 215, 367–368`). So after #886 merges, §6.2 and §§8.3–8.5 have no owner at any head this review can read; and DeRhamCohomologyAndDuality sits at ORDER line 381, far below this roadmap (line 7).

**Witness:** `grep -n -E '^#+ ' TauCetiRoadmap/DifferentialGeometry/README.md` at the #886 head lists no Layer 6 or Layer 8 heading; on main the same command shows "Layer 6: the de Rham complex and cohomology" (782), "6.2 Degree zero and the Poincaré lemma" (791), "Layer 8: the de Rham theorem" (816), "8.3 Smooth chains" (836), "8.4 Simplices, Stokes for chains, the de Rham map" (845), "8.5 The de Rham theorem" (852), "5.5 Densities, and Stokes with corners" (528).

**Repair:** At lines 236, 695 and 739 cite the corner-Stokes lane by its content and by the id it has at the revision: "DifferentialGeometry §5.5, lane 5.5b (Stokes with corners through the abstract boundary)". That names a numbering only the open revision defines, so the worker lists DifferentialGeometry's revision in the merge-order paragraph of the pull request. For §6.2 and §§8.3–8.5 there is nothing else to cite and nothing to state here (the de Rham theorem is not this roadmap's to re-plan): keep the content-named citations of main's §6.2, §§8.3–8.5 as they stand at 236–238, and the reviewer records that DifferentialGeometry's revision removes them without a receiving owner at any open head. A scratch README naming DeRhamCohomologyAndDuality as a supplier was run through the dependency check: it yields a `moved:` line placing this roadmap after ORDER line 381, which would in turn put TangentialBordism (line 10, a consumer of S1.3, S1.5, S2.2, S2.3 and S5.3) above its supplier; that route is not recommended.

## R02 (P3) — `Suggested.lean` needs the module header at the merged pin (gate `build=2`)

**Location:** `TauCetiRoadmap/StringOrientation/Suggested.lean:1` (`import Mathlib`).

**Claim:** The gate's build check counts Lake's advisory "imports `Mathlib` from package `mathlib`, which is designed for use with the module system; consider adding `module` to the start of this file" twice and fails. At the previous head the branch pinned the older Mathlib `6b7abb3c`, where a plain header passed; the merge of main (commit `5e2f3dd8`) moved the pin to `1b1ccf4b`, which sets `requiresModuleSystem`. The file itself elaborates: `lake env lean` on it gives only the `sorry` warning (2.96 s).

**Witness:** my own gate run on this head reproduces `build=2 FAIL` with exactly those two lines and no other build message. Precedent on main: `TauCetiRoadmap/CoboundaryExpansion/Suggested.lean:1, 3, 36` (`module`, `public import Mathlib`, `@[expose] public section`); `TauCetiRoadmap/AffineMorseLefschetz/Suggested.lean:1–5`.

**Repair:** Replace line 1 by `module`, a blank line and `public import Mathlib`; add `@[expose] public section` before `namespace TauCetiRoadmap.StringOrientation` (the single theorem needs no `public` modifier). Tested: a scratch copy with `module` / `public import Mathlib` elaborates with only the `sorry` warning, and `#check @` on the theorem prints the same type as `signatures.md` (both binders `n` and `5 ≤ n` present).

## R03 (P3) — `homotopyGroup_sphere_three_stem` concludes `Nonempty (… ≃* …)` without the `nonempty_` name (gate `statement-hygiene=1`)

**Location:** `TauCetiRoadmap/StringOrientation/Suggested.lean:48–52`; `README.md:627–628` names it.

**Claim:** The statement-hygiene rule admits a `Nonempty (A ≃* B)` conclusion only under a name `nonempty_*`. No canonical map `π_(n+3)(Sⁿ) → ℤ/24` exists at the pins (no J-homomorphism, no e-invariant), so the alternative repair the rule names (state the map and `IsIso`) is not available; the honest form is the renamed existence statement.

**Witness:** gate line "P3 theorem `homotopyGroup_sphere_three_stem` concludes `Nonempty (π_ (n + 3) …`", reproduced by my run.

**Repair:** Rename the theorem `nonempty_homotopyGroup_sphere_three_stem` and update README.md:628 to the new backticked name (the gate checks every backticked name of the roadmap's own). Tested: the renamed theorem elaborates on the scratch copy of R02. An equivalent rule-conforming form, if preferred, is the conjunction `IsCyclic (π_ (n+3) …) ∧ Nat.card (π_ (n+3) …) = 24`, which states "cyclic of order 24" without an isomorphism.

## R04 (P3) — The prism-cover definition of S3.0 keeps one Check

**Location:** `TauCetiRoadmap/StringOrientation/README.md:684–696` (the definition of the prism covers of `M×[0,1]` and their contractibility) and 716–727 (the Checks).

**Claim:** This head deleted the Checks "S¹ with two arcs" and "In dimension zero a point is ℝ⁰; the empty manifold has the cover with empty index set" and reassigned the SU(2) curvature Check to B4.1's object, so the only Check left on the prism cover is the `[0,ε)` contraction (721–727). A definition keeps at least three discriminating Checks.

**Witness:** README.md:716–735 has four bullets: the B4.1 curvature witness, the `[0,ε)` prism model, the two fibre-product examples, and the non-submersion `x↦x²`; only the second concerns the prism cover.

**Repair:** Add, for instance: (i) `M` a point and `[0,1]` covered by `J₁=[0,⅔)`, `J₂=(⅓,1]`: the three nonempty intersections `J₁`, `J₂`, `J₁∩J₂=(⅓,⅔)` are intervals, each contracted to its midpoint by the affine homotopy, and the Čech complex of this cover computes `H⁰=ℝ`, `H¹=0`, the cohomology of the point; (ii) the negative control `J₂′=(⅓,½)∪(½,1]`: `J₁∩J₂′=(⅓,½)∪(½,⅔)` is disconnected, so no contraction exists and the interval hypothesis on the second factor is needed; (iii) nerve of the product: `(U_i×J_a)∩(U_j×J_b)=(U_i∩U_j)×(J_a∩J_b)` is nonempty exactly when both factors are, so the Čech complex of `M×[0,1]` is the tensor product of the two Čech complexes, and restricting at `t=0` recovers the good-cover comparison of `M`, consistent with `dK+Kd=id−ev_0*`.

## R05 (P3) — S3.1 re-derives the Čech–de Rham and Čech–singular comparisons that SmoothBundlesConnections B6.1 owns on good covers

**Location:** `TauCetiRoadmap/StringOrientation/README.md:766–772`: "Derive the comparison and independence of good cover from the Poincaré lemma and the partition-of-unity contraction on SmoothBundlesConnections B6.0's good covers … the exact sequences above and the five lemma prove that evaluation is an isomorphism."

**Claim:** The double-complex argument "Poincaré lemma plus partition-of-unity contraction" is the proof of the real Čech–de Rham isomorphism on a good cover, and the identification of Čech cohomology of the constant sheaves ℤ, ℝ/ℤ with singular cohomology is the Čech–singular comparison; both are stated and owned by SmoothBundlesConnections B6.1 for boundaryless Hausdorff second-countable manifolds, the setting S3.1 uses on `M`. What is this roadmap's is the Deligne-complex step (the truncated cone `ℤ→Ω⁰→…→Ω^(k−1)`, the two exact sequences and the five lemma) and the prism case `M×[0,1]`, which B6.1 does not cover (boundary) and S3.0 builds. This head cites B6.0 but not B6.1.

**Witness:** `TauCetiRoadmap/SmoothBundlesConnections/README.md:41` (Scope: "the Čech–de Rham and Čech–singular comparisons on good covers"), 1556 ("Čech–de Rham and Čech–singular comparisons. Build Čech cochains, refinement and comparison with …"), 1604 ("Prove the real-constant-coefficient Čech–de Rham isomorphism using the specified smooth contractions").

**Repair:** In 766–772 say that on `M` the real Čech–de Rham isomorphism and the Čech–singular comparison for ℤ and ℝ/ℤ coefficients are SmoothBundlesConnections B6.1's, on B6.0's good covers; that S3.0's prism contractions supply the same local exactness on `M×[0,1]`, where the comparison is proved here; and that the Deligne cone and the five-lemma step are owned here. Add B6.1 to S3.1's `*Needs:*` (805–806), to Layer 3's Dependencies (969) and to the contract at 210–218.

## R06 (P3) — Cite DGFloer Layer 1 item 2's Serre spectral sequence where S2.2 and S5.3 use it (previous R01, unrepaired)

**Location:** `README.md:560` and 591–592 (S2.2); 1123–1126 and 1141–1142 (S5.3); 228 (contract).

**Claim:** `H*(BString;ℚ)=ℚ[p₂,p₃,…]` from `H*(K(ℤ,3);ℚ)=Λ(ι₃)` with `ι₃` transgressing to `p₁` is a Serre-spectral-sequence computation, and the passage from `H̃_*(RP^∞;ℤ[1/2])=0` to the ℤ[1/2]-homology isomorphism `BSpin→BSO` is another; neither section names an owner, while S5.4 cites "DGFloer Layer 1 item 2 (Serre sequence)" for the same tool (1231).

**Witness:** `TauCetiRoadmap/DGFloer/README.md:140–142` ("Layer 1 item 2 … owns … Serre spectral sequence consumed by AT5.5").

**Repair:** Add "DGFloer Layer 1 item 2 (cohomological Serre spectral sequence)" to the S2.2 and S5.3 `*Needs:*` lines and to the Layer 2 and Layer 5 Dependencies, and widen the contract sentence at 228 accordingly. For the step from a ℤ[1/2]-homology isomorphism of Thom spectra to an equivalence after inverting 2, cite GeneralizedCohomology G5.6's stable Hurewicz comparison beside AlgebraicTopology 8.5.

## R07 (P3) — Give S4.2's modularity theorem a locator and its route (previous R02, unrepaired)

**Location:** `README.md:1009–1011`.

**Claim:** Modularity of the Witten genus is one of the six end theorems (Summary, 12–13) and the only theorem of the roadmap with neither a literature locator nor a proof route.

**Witness:** `grep -n -i 'zagier\|hirzebruch' README.md` returns only the Borel–Hirzebruch entries (461, 1088–1089, 1392–1394).

**Repair:** Cite Zagier, *Note on the Landweber–Stong elliptic genus*, Lecture Notes in Mathematics 1326 (1988), and Hirzebruch–Berger–Jung, *Manifolds and Modular Forms*, Chapter 6 (both `uncertified`), and state the route in one sentence: the coefficients of `log Q` are `2G_(2k)/(2k)!` (S4.1), only `G₂` is non-modular, and it enters the genus of a 4k-manifold only through `exp(−(2G₂/2!)p₁)`, so rational `p₁=0` removes it; integrality is the index interpretation of the first sentence of S4.2.

## R08 (P3) — Name TangentialBordism among the downstream consumers (previous R03, unrepaired)

**Location:** `README.md:1349–1351`.

**Claim:** TangentialBordism, three lines below this roadmap in the merge order, consumes S1.3, S1.5, S2.2, S2.3 and S5.3 by name; the section lists FourManifolds alone.

**Witness:** `TauCetiRoadmap/TangentialBordism/README.md:176` at the #942 head (supplier row "StringOrientation S1.3, S1.5, S2.2, S2.3, S5.3"); ORDER.txt lines 7 and 10.

**Repair:** Add one sentence naming TangentialBordism and the five sections; no direction of supply changes.

## Verified sound

**Mechanical checks and scope.** Both files read in full at `8b2dcbc`. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/StringOrientation'` prints nothing; the folder holds `README.md`, `Suggested.lean` and `metadata.toml`; the worktree is clean. My gate run (`--build --order`) gives every counter zero except `statement-hygiene=1` and `build=2`, as the worker's. `lake env lean` on `Suggested.lean`: one `sorry` warning, 2.96 s. The scratch `#check @homotopyGroup_sphere_three_stem` prints `∀ (n : ℕ), 5 ≤ n → Nonempty (π_ (n + 3) ↑(Metric.sphere 0 1) ⟨EuclideanSpace.single 0 1, ⋯⟩ ≃* Multiplicative (ZMod 24))`, matching S2.3 (627–628). One-tactic probe on a scratch copy: `simp` makes no progress, `infer_instance` fails, `rfl` fails ("not a binary relation"), `exact?` finds only the sibling copy in the same file; the theorem is not padding. No definition, no `set_option`, no sorry'd data, a single `import Mathlib`, docstring names each unstatable headline with the missing carrier (BSpin, K(ℤ,4), Thom spectra and bordism groups, differential cohomology and gerbes, Dirac index, tmf/TMF). Mathlib `Geometry/Manifold/Bordism.lean` at `1b1ccf4b` defines `SingularManifold` (111) and says bordism groups are future work (16–17), so S2's headlines remain unstatable.

The dependency check of the brief returned exactly `depcheck: 239 roadmaps, 2349 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line (SmoothBundlesConnections is on main, ORDER line 8, and never cites this roadmap). ORDER.txt: EllipticCohomology 6, StringOrientation 7, SmoothBundlesConnections 8, TangentialBordism 10, DeRhamCohomologyAndDuality 381. No supplier gap is declared (no `plan.json`). No copied passage, algorithm, route-specific shortcut or re-planned roadmap. Ownership of the objects this roadmap owns was searched by object with `roadmaps grep` across the open heads and main ("StringOrientation S3" cited by no one; the previous round's searches for Pontryagin–Thom, bundle gerbe, differential character, Cayley plane, string connection, J-homomorphism found no second owner, and the only change since is that this roadmap stopped owning principal bundles, connections and good covers in favour of SmoothBundlesConnections). LieGroupoidsPoisson G0.2 (main, README.md:420–427) builds the composable-arrow manifolds of a groupoid from B1.0 fibre products of source and target; the Čech nerve `Y^[k]` of one submersion is a different object and S3.0 is its only owner. Ownership against open pull requests whose files the brief did not supply was not checked.

**SmoothBundlesConnections citations, every one opened on main (`TauCetiRoadmap/SmoothBundlesConnections/README.md`).** B1.0 (221–314): transverse fibre product `{(x,y) // f x = g y}` "with no Hausdorff hypothesis on the ambient manifolds" (223–224), either projection a submersion when the other map is, transversality automatic for a submersion (289–291), matching S3.0's "without separation assumptions" and the iteration `Y^[k+1]=Y^[k]×_M Y`. B1.1 (315): local sections, division map, `P×_M P` from B1.0. B1.2 (366) pullbacks; B1.3 (395) cocycles and gluing; B1.4 (421): free proper quotient headline with both manifolds Hausdorff second countable (437–443), homogeneous spaces `G/H` (452–455), as S5.1 uses for `(P×OP²)/F₄` (F₄ compact, so the diagonal action is proper, and free because it is free on `P`). B1.5 (498) Ehresmann connections; B2.1 (559) associated bundles; B2.5 (802) adjoint bundle `ad(P)` with pointwise bracket (829–830); B3.1 (871): `ω(A#)=A`, `R_g*ω=Ad_(g⁻¹)ω`, affine action of `Ω¹(M;ad(P))`, existence by partitions of unity (874–881); B4.1 (979): curvature descending to `Ω²(M;ad(P))`, Bianchi, `F_(A+a)=F_A+d_Aa+½[a∧a]` (987–988), with the ½-normalization witnessed on the Maurer–Cartan form (1001–1002); B4.2 (1010): gauge action on connections and curvature. B6.0 (1306–1311): `SmoothGoodCover I` with a chosen centre and a smooth contraction `ℝ×W→W` per nonempty finite intersection, `exists_smoothGoodCover_refining` under `T2Space`, `SecondCountableTopology`, `I.Boundaryless` (1347–1348), matching this roadmap's Conventions (121–125); both names are declared in `TauCetiRoadmap/SmoothBundlesConnections/Suggested.lean:132, 155`. SmoothBundlesConnections' bases are "Hausdorff, second-countable … without boundary" (Conventions 106), as here.

**Other supplier citations, resolved at their current text.** On main: GeneralizedCohomology G2 (211), `stableBSpin_hopfGenerator_cTwo` (1504); AlgebraicTopology Stages 4, 5, 6 (499, 849, 946); CharacteristicClasses C2 (728), C4 (1321); DGFloer Layer 1 item 2 with the Serre spectral sequence (140–142); Orbifolds O2 item 6 manifold diffeology (223); BordismFormalGroups F3–F5 (284, 329, 466); SchemeAndStackFoundations `bertini_smoothness` (5680); SpinGeometry G6 Lichnerowicz (569, 636); TopologicalKTheory λ_t on virtual classes (633–688); RepresentationTheory/LieHighestWeight Layer 8 sublanes (1255, 1332; also present at the #1220 head, 2052, 2139); GeometricTopology collars (206); ModularForms level-one dimension formula (10); EllipticCohomology, now on main (commit `2c09e17e`): E4.S (913), `π₁₂S⁹≅π₃S≅ℤ/24` (1675), Δ⁸/Δ³/Δ²⁴ lifts and `tmf[(Δ²⁴)⁻¹]≃TMF` (1478–1481), MString and σ (1529–1573), E6 localization criterion (1912); DifferentialGeometry 5.4, 5.5, 6.2, 8.3–8.5 (524, 528, 791, 836–852). At open heads: IndexTheory (#1077) twisted Dirac index (527, 548); TangentialBordism (#942) consumes S1.3, S1.5, S2.2, S2.3, S5.3 (176); FourManifolds (#936) consumes S1 (183, 2196); HomotopySpheres (#1287) states `π₃S≅ℤ/24` and imports it (399, 2468), as the Scope says. `roadmaps resolve` lists nothing unresolved.

**Pins (branch manifest = main: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`).** `DiffeologicalSpace` (Geometry/Diffeology/Basic.lean:159), `IsPlot` (197), `DSmooth` (202), `CorePlotsOn` (286), `ofCorePlotsOn` (321), `IsDTopologyCompatible` (355), `IsContDiffCompatible` (372), `NormedSpace.toDiffeology` (380, a def; instance on ℝ at 414); the directory holds only `Basic.lean`. `HomotopyGroup` (Topology/Homotopy/HomotopyGroup.lean:441); `Manifold.IsSubmersion` (Geometry/Manifold/Submersion.lean:554, with `IsSubmersionAt` 172); `SmoothPartitionOfUnity.exists_isSubordinate` (PartitionOfUnity.lean:366 with `T2Space`, `SigmaCompactSpace`; 556); `IsLeviCivitaConnection` (LeviCivita.lean:202), `leviCivitaConnection` (360); `ContMDiffMap` (ContMDiffMap.lean:41); `ContinuousMap.Homotopy` (Topology/Homotopy/Basic.lean:76); Tau Ceti `CovariantDerivative.ricciTensor` (Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/Ricci.lean:65).

**Seeded source audit, 15 targets, every locator opened in the cache.** redden-canonical-3forms Proposition 2.2 (line 214; (1) at 217 "if and only if λ(P)=0", (2) at 218–219 the `H^(n−1)`-torsor) and Proposition 2.3 (237–242); waldorf-string-connections Theorem 1.3.3 (404–415: unique `H` with `π*H=K+TP(A)`, `dH` one half of the Pontryagin 4-form, `H_(T·κ)=H+Ω(κ)`), Theorem 1.3.4 (428–430: existence for any connection, affine space), curvature as a real 3-form representing the Dixmier–Douady class (697–699), the normalization `⅙⟨θ∧[θ∧θ]⟩` representing the generator (726–730), Lemma 3.1.2 (759–762), `V_T` and `U` (876–882), Proposition 3.3.4 (885–887), display (4.2.1) without 2πi (1092–1097) against the degree-one holonomy with 2πi (1210–1216), Lemmas 4.3.2 (1258) and 4.3.3 (1289–1290, under the cobordism-hypothesis assumption, as the README's explicit hypothesis says); cjmsw-bundle-gerbes Proposition 4.8 (913–914) and Theorem 5.8 (1109–1111); meinrenken-basic-gerbe §5.2 (524–529, `1/12 θ·[θ,θ]` representing the generator) and §5.4 (627); cheeger-simons definition (100–101), Theorem 1.1 (114), Theorem 1.11 (254), Theorem 2.2 (341–344); bunke-differential-cohomology Lemma 3.5 (1264), (23) (1442–1445), Proposition 3.28 (1585–1589), Corollary 3.131 (2619–2621); mctague-cayley-plane Theorem 1 (58), family vanishing (104–109, Jung's proof unpublished), Theorem 4 (324–332), Pontryagin numbers detect (370), Hovey's theorem for p>3 (446–448), Borel–Hirzebruch 10.7 and 20.3 (739–743, 775–778), lines 947–969, Lemma 8 (1030–1031), Proposition 10 (1066–1078), Proposition 11 (1114), Lemma 12 (1131); mctague-tmf-quotient Theorem 1 (124) and Corollary 2 (146); hovey-ravenel Corollary 1.5(2) (292–299); hopkins-icm2002 table and tmf-degree (396–405: `π₃=ℤ/24`, `π₈=ℤ⊕ℤ/2`, nonzero on SU(3)); bmq-hurewicz (128–129: `π_*tmf` = pattern ⊗ `ℤ_(2)[Δ⁸]`); belmont-shimomura Theorem 6.1 (653–655: multiplication by Δ³ injective at 3). Hovey's own paper was fetched this round into a scratch manifest from Ravenel's author page (author-page licence, 14 pages); its abstract (lines 8–11: at primes > 3 the rings are quotients of polynomial rings by infinite regular sequences, not polynomial) supports the S5.3 Check, while its body is font-garbled in extraction, so Theorem 2.4 was checked through McTague's restatement at 446–448.

**Computed adversarial pass.** One row per statement; values on both sides recomputed. Rows cover the sampled sections (S1.1, S1.3, S2.3, S3.0, S3.1, S3.3–S3.6, S4.2, S5.1, S5.3, S6.1–S6.3), the headline, and every target a finding touches.

| # | Statement | Instances | Values computed / wrong model | Result |
|---|---|---|---|---|
| 1 | S1.1 `2λ=p₁` | universal generator | λ=1, p₁=2; model λ:=p₁ gives 2·2=4≠2 | Pass |
| 2 | S1.1 Hopf sign | quaternionic line, rank 2 complex | `p₁(E_ℝ)=c₁²−2c₂=−2c₂`, λ=−c₂, pairing −1 against G5.0's c₂ pairing +1 | Pass |
| 3 | S1.1 adjoint | SU(2) weights 0,±2x | c(ad⊗ℂ)=1−4x², c₂(ad_ℂ)=−4x², p₁(ad)=4x²=−4c₂(V) since c₂(V)=−x²; λ(ad)=−2c₂(V); "−c₂ on BSpin(3)" off by 2 | Pass |
| 4 | S1.1 torsion control | S³∪₂e⁴, S⁴∪₂e⁵ | ×2 in degrees 3→4: H³=0, H⁴=ℤ/2; in 4→5: H⁴=0, H⁵=ℤ/2 | Pass |
| 5 | S1.3 iff | pt trivial; Hopf on S⁴ | λ=0 ⇒ lift; λ=−1 ⇒ none; converse Redden 2.2(1) lines 217–222 (nullhomotopy ⇔ class zero) | Pass both ways |
| 6 | S1.3 torsors | S³, S¹×S², Moore | H³=ℤ; H⁴=0,H³=ℤ; [X,BSpin]=ℤ/2, 2λ=0≠λ, H³=0 one lift | Pass |
| 7 | S1.3 dim ≤7 bijection | S⁴, S⁸ | [S⁴,BSpin]=ℤ→H⁴=ℤ bijective; [S⁸,BSpin]=ℤ→H⁴(S⁸)=0 not injective, bound sharp | Pass |
| 8 | S2.3 unit range | cells of MString/S | bottom cell degree 8 ⇒ iso i≤6, onto i=7 | Pass |
| 9 | S2.3 stable range | n=4,5,6 | n+3≤2n−2 ⇔ n≥5; π₇S⁴=ℤ⊕ℤ/12; π₈S⁵=π₉S⁶=ℤ/24 | Pass |
| 10 | S2.3 e-invariant | K3 minus disc | σ=−16, p₁=3σ=−48, ½p₁=−24≡0 (24); σ∈16ℤ ⇒ ½p₁∈24ℤ; /48 would give ℤ/48 | Pass |
| 11 | S2.3 framing change | S³⊔S³, α=(1,−1); ∅ | Ωλ(g)=−1 ⇒ β=(−g,g); −J(g)+J(g)=0; empty sum 0 | Pass |
| 12 | S2.3 orders and low stems | π₃, π₄–π₆ | 8·3=24; π₄S=π₅S=0, π₆S=ℤ/2 both sides; π₃MSpin=0 | Pass |
| 13 | Lean headline | n=5,6 | indices 8, 9; `5 ≤ n` retained in `#check`; probe fails (`simp`, `infer_instance`, `rfl`) | Pass; R03 rename |
| 14 | S3.0 curvature witness (B4.1) | A=τ₁dx+τ₂dy | ½[A∧A](∂x,∂y)=[τ₁,τ₂]=2τ₃; without ½: 4τ₃; abelian: 0 | Pass |
| 15 | S3.0 prism contraction | F(t,x)=tx on [0,ε) | F*dx=x dt+t dx; K(dx)=∫₀¹x dt=x; dK(dx)=dx; Kd(dx)=0; dx=dx−ev₀*dx (=0); K(dc)=0 | Pass; R04 Checks |
| 16 | S3.0 local homology | 0∈[0,ε) vs interior | H₁(X,X∖0)=0 at 0 (contractible rel contractible), ℤ at an interior point | Pass |
| 17 | S3.0 fibre products | ℝ²→ℝ; doubled origin; x² | dim 2+2−1=3; {(t,t):t≠0} misses its limit (0₁,0₂)∉Y×_MY, not closed; {x²=y²} crossing lines | Pass |
| 18 | S3.0 iteration via B1.0 | k=1,2 | transversality automatic for a submersion (SBC 289–291); dim Y^[k]=k·dimY−(k−1)dimM: k=1 gives dim Y | Pass |
| 19 | S3.0/Conventions vs SBC hypotheses | B6.0, B1.0 | B6.0 needs T2 + second countable + boundaryless (SBC 1347–1348) = README 121–125; B1.0 needs no Hausdorff (SBC 223–224) = "without separation assumptions" | Pass |
| 20 | S3.1 degrees | point | Ĥ⁰=ℤ; Ĥ¹=Hom(ℤ,ℝ/ℤ)=ℝ/ℤ (H⁰(pt;ℝ/ℤ)=ℝ/ℤ, Ω¹=0); Ĥᵏ=0, k≥2 | Pass |
| 21 | S3.1 homotopy sign | h(x)=x, F(t)=t/2, t/3 | h(½)−h(0)=½ = ∫₀¹½dt; ⅓ vs reversed −⅓ | Pass |
| 22 | S3.1 sequence | S³, k=3 | H²(S³;ℝ/ℤ)=0 ⇒ Ĥ³(S³)≅Ω³_ℤ(S³) | Pass |
| 23 | S3.1 Čech comparison owner | boundaryless M vs M×[0,1] | B6.1 owns the real Čech–de Rham and Čech–singular comparisons on good covers (SBC 41, 1556, 1604); prism case not covered there | R05 |
| 24 | S3.3 levels | Sp(1); adjoint Spin(3) | ±1; π₃ map ×2 ⇒ ±2, consistent with λ|BSpin(3)=−2c₂ | Pass |
| 25 | S3.3 normalization sources | Waldorf 728, Meinrenken 526 | both forms normalized to represent the generator of H³(G;ℤ) (729–730; 529) | Pass |
| 26 | S3.4 obstruction | Hopf on S⁴; flat trivial | ∫½p₁(A)=λ=−1 vs ∫dH=0 ⇒ no H; flat: 0 and 0 | Pass |
| 27 | S3.4 affine space | pt | Ω²(pt)=Ω¹(pt)=0 ⇒ V_T=0, unique connection | Pass |
| 28 | S3.5 compatibility class | C^∞(pt,S¹) | π₁=ℤ; normed space contracts by (1−t)v, π₁=0; `IsContDiffCompatible` needs a normed space (Basic.lean:372) | Pass |
| 29 | S3.5 fibre integration sign | du∧dθ, dθ∧du on S¹ | 2π du; −2π du | Pass |
| 30 | S3.5 plots | |x|, x³ | |x| not smooth at 0; x³ smooth, inverse x^(1/3) not | Pass |
| 31 | S3.6 holonomy | ∫H=1 | exp(2πi)=1; exp(1)=e∉U(1); κ with ∫curv=1 shifts ∫H by 1, holonomy unchanged | Pass |
| 32 | S4.1 series | q⁰, k=1,2 | log((x/2)/sinh(x/2))=−x²/24+x⁴/2880−…; 2G₂/2!=−1/24; 2G₄/4!=(2/240)/24=1/2880 | Pass |
| 33 | S4.2 OP² | Â, L, weight 8 | Â₄=(−7488+7488)/464486400=0; L₄=(14859−684)/14175=1; M₈=ℂE₄² with constant term 0 ⇒ φ_W(OP²)=0 | Pass; R07 locator |
| 34 | S4.2 dimension 4 | weight 2 | M₂=0; Â=−p₁/24 | Pass |
| 35 | S1.5 s-number (feeds S5) | OP² | s₄=2p₂²−4p₄=72−156=−84=−2²·3·7 | Pass |
| 36 | S5.1 | F₄/Spin(9); OP²×HP² | 52−36=16; 1152/384=3; λ=0+u≠0 so not String though fibre and vertical bundle are | Pass |
| 37 | S5.3 splitting | p=3,5; d=8 | p=3: one factor BP⟨1⟩₈, map from 12 is [v₁] (|v₁|=4); p=5: BP⟨1⟩₈×BP⟨1⟩₁₂, identity on 12, [v₁]:BP⟨1⟩₁₆→BP⟨1⟩₈ (|v₁|=8); HR Cor 1.5(2) lines 292–299 | Pass |
| 38 | S5.3 odd-primary comparison | fibre RP^∞ | H̃_*(RP^∞;ℤ[1/2])=0; π₁MSpin=ℤ/2≠0=π₁MSO | Pass; R06 owner |
| 39 | S5.3 Hovey | p>3 | McTague 446–448 restates Thm 2.4 for p>3; Hovey abstract 8–11 "not polynomial … quotients by infinite regular sequences" | Pass |
| 40 | S5.4 (feeds S5.5) | n_f=2; V²(2,3,3)⊂CP⁵ | lattice (2x₁,2x₂,−2x₂,0); 2Σe_i²→16(x₁²+x₂²); p₁=(3−3−16)x²=−16x², c₁=−2x, ∫x²=18; constant classifier λ=−8x², pairing −144 | Pass |
| 41 | S5.5 | degree 3 | ℤ/24 has zero genus, not in I_OP (degrees ≥16) ⇒ 6 inverted | Pass |
| 42 | S6.1 | round Sⁿ | Ric=(n−1)r⁻²g: n=2,r=1 gives 1; n=1 gives 0 | Pass |
| 43 | S6.2 | weights 2…16 | dim M_(2k)=0,1,1,1,1,2,1,2; dimensions 4,8,12,16,20,28 kept, 24 and 32 excluded | Pass |
| 44 | S6.3 curvature | bi-invariant g=−B | ∇_XY=½[X,Y]; R=¼[X,[Y,Z]]−¼[Y,[X,Z]]−½[[X,Y],Z]=−¼[[X,Y],Z] by Jacobi; Ric=−¼B=¼g; SU(2): 2/r²=¼ ⇒ r=2√2, K=1/8 | Pass |
| 45 | S6.3 orders | d₂,d₃,D; u₈ | 192·3=576=72·8; ν order 8 at 2 and 3 at 3; u₈ order 2 (Hopkins 397) | Pass |
| 46 | S2.2 ranks (feeds S5.3) | degrees 4–16 | String 0,1,1,2; Spin 1,2,3,5 | Pass |
| 47 | R04 prism Checks | J₁=[0,⅔), J₂=(⅓,1]; J₂′ | intersections (⅓,⅔) interval, H⁰=ℝ, H¹=0; J₁∩J₂′=(⅓,½)∪(½,⅔) disconnected, no contraction | Values for the repair |
| 48 | R01 DG ids at #886 | 5.5, 6.2, 8.3–8.5 | 5.5→5.5b (850); 6.2, 8.3–8.5 absent, declared DeRhamCohomologyAndDuality's (258–261), which cites DG 8.3/6.2 on main (192–193, 215) | R01 |
| 49 | R01 depcheck of the DRCD route | scratch README | `moved: DeRhamCohomologyAndDuality moved … before StringOrientation` (ORDER 381 vs 7) | Recorded |

**Shape and completeness.** Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, six layers each ending in Examples and Dependencies, Downstream consumers, References. Checks: S3.0's prism cover has one (R04); every other definition keeps at least three; every Check was evaluated against its section (table). No LaTeX delimiters, process words, pull-request numbers or absolute paths. The only Lean name claimed by the README, `homotopyGroup_sphere_three_stem` (628), is declared; "intended name" mentions are unbackticked.

## Not verifiable

- **Milnor–Stasheff §§8, 15, 18; Stong Chapter II; Lee Theorems 4.26, 6.30; Toda Chapters V and XIII; Borel–Hirzebruch I §19, 10.7, 20.3; Stolz 1996 §1:** books and journal papers with no legal full text known to the sources service; the README marks all but Milnor–Stasheff `uncertified`. The classical statements were checked independently (rows 4, 7, 9, 10, 12, 35, 37) and McTague's restatements of Borel–Hirzebruch (739–743, 775–778) were read.
- **Hovey, AGT 8 (2008), Theorem 2.4:** the author-page copy fetched this round is font-garbled in extraction beyond its abstract; checked through mctague-cayley-plane 446–448.
- **Jung's unpublished proof of the family vanishing (S5.2):** mctague-cayley-plane 106–109 says it has not appeared in print; the trivial-family instance (row 33) is the only computable check.
- **lean-catdg at the cited commit:** not reopened; the README treats it as comparison material only.
- **Zagier and Hirzebruch–Berger–Jung for R07:** paywalled; the suggested locators are by chapter.

## Source issues

- **Misprint** in waldorf-string-connections at display (4.2.1), printed p. 30 (lines 1092–1097): the source writes the degree-three holonomy as the exponential of a real integral; it should carry the factor 2πi, as its degree-one formula at lines 1210–1216 does; affects a stated result.
- **Misprint** in mctague-cayley-plane at the pulled-back p₁ formula, printed p. 16 (lines 1016–1024): the source says the root scaling contributes 4n_f; it should be 4n_f², since the class is quadratic in the roots; affects the proof (lines 1405–1411 inherit it).
- **Misprint** in mctague-cayley-plane at the complete-intersection tangent sequence, printed p. 16 (line 1001): the source places the normal sum as the subbundle and TV as the quotient; it should be TV as the subbundle with the normal sum as quotient; affects the proof.
- **Error** in mctague-cayley-plane at its account of Stolz's conjecture, printed pp. 2–3 (lines 116–120): the source states the conjecture as an equivalence between vanishing Witten genus and existence of positive Ricci curvature; Stolz's conjecture is the forward implication only; affects a stated result.
- **Misprint** in bunke-differential-cohomology at Problem 3.4, printed p. 33 (lines 1257–1262): the case distinction assigns both F and 0 to k=0; it should read F for k=0 and 0 for k>0; affects nothing.
