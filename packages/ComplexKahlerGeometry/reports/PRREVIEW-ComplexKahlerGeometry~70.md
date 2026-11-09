# Review of ComplexKahlerGeometry (pull request #1234 at 258d35d)

**Verdict:** needs changes

A full review of the repaired head. Of the previous review's four findings, two are repaired (its R01, the ComplexComparisonPartII cycle, and its R04, the missing K1 Checks) and two are unchanged (its R02 and R03, here R03 and R04). One finding is new (R01): a roadmap-level cycle between K8 and DGFloer that main already carries and that #1854 cuts; this head keeps the citation. R02 is the ownership residue the previous review's R01 said the description must record; the description still names #848 as a supplier.

## R01 (P1) — K8 consumes DGFloer's filtered-complex spectral sequence while DGFloer consumes K7.1–K7.2: a two-roadmap cycle

Location: `TauCetiRoadmap/ComplexKahlerGeometry/README.md:2506`, "Consume DGFloer's generic filtered-complex spectral sequence and own its decreasing cohomological column-filtration adapter"; `:2585–2586`, "Generic DGFloer machinery supplies convergence/naturality"; `:2649` and `:2676–2677` ("the generic spectral-sequence machinery", "the generic filtered-complex machinery").

Claim: DGFloer on main lists ComplexKahlerGeometry among its suppliers, so each roadmap supplies the other. The merge-order model admits one direction per pair; a cycle is a design defect whatever the layer-level order (K8 needs DGFloer Layer 1, DGFloer's geometric layers need K7). The dependency check does not see it because neither citation sits on a `*Needs:*` line (K8 has none) and DGFloer's is a link.

Witness: `TauCetiRoadmap/DGFloer/README.md:168` on main (`34f48ff`), in its supplier list: "ComplexKahlerGeometry K7.1–K7.2. K7.1 supplies the single complex projective carrier, complex/real atlases and orientation"; `:226` names DGFloer Layer 1 item 3 the owner of "the filtered-complex and ordinary Serre spectral sequences". Main's own copy of this README has the same two sentences at `:1538` and `:1613`, and #1854 ("Cut the dependency loops main acquired after the pin bump") replaces exactly them with "AlgebraicTopology Stage 5.0's generic" machinery (its head's `:1539`, `:1614`); AlgebraicTopology on main has no Stage 5.0 (its Stage 5 is "bundles, covers, products, and finite-cover descent", `README.md:849`, and its spectral sequences are the Serre, Künneth and Cartan–Leray ones at `:112`, `:858`, `:889`), so that repoint resolves only with whatever #1854 adds there.

Repair, either route, and say which in the description:
- Own it here. K8 already owns "its decreasing cohomological column-filtration adapter"; make the finite-filtration machinery K8's own target on Mathlib's pinned carriers (`Mathlib/Algebra/Homology/SpectralObject/`, `Basic.lean`, `Page.lean`, `SpectralSequence.lean` exist at the pin): the pages `E_r^(p,q)` with `d_r:E_r^(p,q)→E_r^(p+r,q−r+1)` of a finitely filtered cochain complex of complex vector spaces, convergence to the associated graded of the induced filtration on cohomology, and the comparison theorem for a filtered map that is a quasi-isomorphism on `E_r`. Delete the two DGFloer sentences and reword `:2649` and `:2676–2677` to name K8. Add a `*Needs:*` line to K8 (Mathlib `SpectralObject`; K2's type bicomplex; K5/K6 for degeneration; ComplexManifolds Milestone 4; LieGroupoidsPoisson G1.3) so the check sees its suppliers.
- Or rebase on #1854, take its K8 wording, and state in the description that #1854 merges first; this needs the section #1854 names to exist at its head.

Test: after either repair `grep -n DGFloer` in the folder returns nothing, the dependency check stays at `0 problem(s)`, and DGFloer `:168` keeps its one-way edge into K7.

## R02 (P2) — The holomorphic exponential segment has two owners: K4.P here and C5.4 at the head of #848, which #1285 and #1186 cite; the description still lists #848 as a supplier

Location: `README.md:769–774`, "K4.P owns, on every complex manifold, the holomorphic exponential sequence, the isomorphism `Pic_hol(M)≃H¹(M,𝒪×)` and the identification of its connecting map with the integral first Chern class ... to K3Surfaces 1.1 and to GeometricQuantization §3.3, which are its consumers"; `:52–54`, `:876–881`, `:2651–2654`; the pull-request description, "**Depends on** (suppliers still open; they merge first): #848 ComplexComparisonPartII".

Claim: the folder is now right (this roadmap is on main, so it is the earliest possible owner, and it cites no section of ComplexComparisonPartII), but the other side has not moved and the description contradicts the README. The previous review's R01 said this residue is settled by one sentence in the description; the sentence is absent, and the depends-on line asserts the opposite direction.

Witness: ComplexComparisonPartII at #848's head, `README.md:150`: "C5.4 is the single owner, on every complex manifold, of the holomorphic-to-smooth forgetful adapter, the frame-torsor bijection from holomorphic line-bundle classes to `H¹(M,O_M^×)`, the holomorphic exponential sequence with its cocycle `δu`, and the identification of its connecting map with the integral first Chern class ... the group of their isomorphism classes, its description in `H¹(M,O_M^×)` and the exponential sequence are not taken from [ComplexKahlerGeometry K4]"; the same at `:96`, `:453–454` and `:2125`. K3Surfaces at #1285 (`e565cd5d`) takes the segment from C5.4 (`README.md:13–21`, `:99`, `:415–437`, `:462–463`), and GeometricQuantization at #1186 (`2c84ca05`) likewise (`:26`, `:228–233`, `:718`, `:727`); neither names K4.P, as `:53` and `:880` here claim.

Repair: description only; nothing in the folder changes. Delete the depends-on line for #848 (a roadmap on main cannot wait for an open pull request, and this README consumes nothing from it). Add one sentence to the merge-order paragraph: #848 replaces its single-owner clauses at `:96`, `:150`, `:453–454` and `:2125` with a citation of ComplexKahlerGeometry K4.P, and #1285 and #1186 take the exponential segment and `c₁` from K4.P. Test: after those three pull requests move, the only edges between the four roadmaps run from K4.P outward, and the ℂP¹ normalisation `c₁(O(1))·[ℂP¹]=+1`, `c₁(O(−1))·[ℂP¹]=−1` is unchanged on every side.

## R03 (P2) — The open-pair relative de Rham theory still has two owners (previous R02, not repaired)

Location: `README.md:1923–1926`: "K6.1.RelativeIntegration owns these boundaryless open-pair statements; DeRhamCohomologyAndDuality §§2.4, 3.1–3.3 and 4.1, which extend them to models with corners, consume these instances."

Claim: DeRhamCohomologyAndDuality's head is the one the previous two reviews read and still names itself the single owner and K6.1 its consumer. This roadmap is on main and #1768 is open, so the direction stated here is the only one the gate admits; the repair is on #1768's side and the description must record it. It does not name #1768.

Witness: `TauCetiRoadmap/DeRhamCohomologyAndDuality/README.md:70–76` at `1b57dbe0`: the relative smooth chain comparison, the relative form complex, relative integration and the compact-support formula "have a single owner, this roadmap", and the instances K6.1 uses are "consumed from §§2.4, 3.1–3.3 and 4.1"; `:695–702` repeats it under its consumers.

Repair: one sentence in the merge-order paragraph: #1768 replaces `README.md:70–76` and `:695–702` with a citation of ComplexKahlerGeometry K6.1.RelativeIntegration for the boundaryless open-pair complex, relative integration and the compact-support formula, and keeps the corners extension and its §4.2. The two texts agree in content (cone, pairing `(a,b)↦a(c)−b(∂c)`, compact-support formula), so nothing in this folder changes.

## R04 (P3) — The description states no order against the four heads that conflict with this one (previous R03, not repaired)

Location: the pull-request description. Its order statements are "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1186" and the depends-on line of R02.

Claim: #1398, #1807, #1808 and #1854 each change this folder's README, the first three also `Suggested.lean`, and their heads conflict with this one. The description does not say which rebases on which.

Witness: the overlap computation from main `34f48ff` and the open heads reports "#1234 and #1398 conflict in `README.md`, `Suggested.lean`", the same for #1807 and #1808, and "#1234 and #1854 conflict in `README.md`". Measured against this head's README: #1807's copy (2546 lines) differs by 5229 diff lines, #1808's (2630 lines) by 5313, #1398's (2877 lines) by 3246, and #1854's (1704 lines, main plus the three-line K8 cut of R01) by 1679.

Repair: one sentence per pull request saying whether it rebases on this one or this one on it; for #1854 the answer is fixed by the route chosen in R01.

## Previous findings

- R01 (K4.P consumed ComplexComparisonPartII C−1.1, C0.3, C1.9, C5.4; cycle; gate failure) — repaired. The supplier block at former `:105–114` is gone; `:762–815` reconstruct 𝒪× with local logarithms, the frame 𝒪×-torsor with cocycles, coboundaries and refinements in the convention `e_j=e_i g_ij`, the group isomorphism `Pic_hol(M)≃H¹(M,𝒪×)` with tensor, dual, trivial-line and pullback laws (Demailly V (8.2)), exactness of `0→ℤ→𝒪→𝒪×→1`, the long exact sequence through `Sheaf.H.δ`, the segment (Demailly VI (9.1) for compact Kähler, own statement in general), the `c₁` identification through SBC B6.1 and the ℂP¹ check with (9.5). `Suggested.lean:56–59` says the pins lack a units sheaf and a bundle tensor product, nothing about C5.4. The remaining mentions of ComplexComparisonPartII (`:52–53`, `:643`, `:772`, `:777`, `:880`, `:2316`, `:2653`) are consumer statements, a convention remark and a deferral; none is a supplier citation. My dependency check: `depcheck: 238 roadmaps, 2312 edges, 0 problem(s)`. The ownership residue is R02 above.
- R02 (open-pair theory two owners) — not repaired; R03 here.
- R03 (no order against the conflicting heads) — not repaired; R04 here.
- R04 (K1 without Checks) — repaired. `:212–244` add five bullets; every value recomputed: `det_ℝ(z↦2z)=|2|²=4`, `det_ℝ(z↦z̄)=−1`, `det_ℝ(z↦iz)=1`; `φ=z̄` has `φ_z=0`, `φ_z̄=1`, `φ*dz=dz̄`, `ℓ(i)=−i≠i=i·ℓ(1)`; `φ=|z|²` has `φ_z̄=z`; `G=v²−z`, `∂_vG(1,1)=2`, `F=√(z+w)`, `G(z,F)=w`, `F(1,0)=1`, no holomorphic `√w` at 0; `d(w−z²)=dw−2z dz≠0`; `2z dz−3w² dw=0` at 0 and `(3t²,2t)=0` at `t=0`; the circle's tangent at 1 is `∂_y`, `J∂_y=−∂_x`; `∂_z=(∂_x−i∂_y)/2`, `J∂_z=(∂_y+i∂_x)/2=i∂_z`, `(u+iJu)/2=∂_z̄`; conjugation `i dz↦−i dz̄`.

## Verified sound

**Gate.** The worker's run on this head: every check 0, `OK`. My dependency check (`--movable`), exact output: `depcheck: 238 roadmaps, 2312 edges, 0 problem(s)`, no UPWARD or CYCLE line. The roadmap is on main and not in `ORDER.txt`. The cycle of R01 is between two roadmaps on main and is carried by prose citations, which the check does not read; it is reported from the texts.

**Outside the folder.** `git diff --stat origin/main...HEAD` lists only this folder's `README.md` and `Suggested.lean`. The branch's merge base with main is `eaf17b10`; main's copy of this folder has since changed only in `STATUS.md` (a progress report), and the branch's `lake-manifest.json` is identical to main's, so the pins below are main's.

**Lean.** `lake env lean` on `Suggested.lean` at the pins: exit 0, 25 `declaration uses sorry` warnings, nothing else. The only change since the previous review is 7 lines of the module docstring; every declaration is byte-identical. A scratch copy with `#check @` for all 33 declarations elaborated (the worker's file lists two spurious entries, `on` and `in`, which are words of the docstring, not declarations); each type matches its README statement. Binder facts: `dolbeaultCocycles`, `dolbeaultCoboundaries` and `DolbeaultCohomology` drop `[FiniteDimensional ℂ E]` and `lefschetzMap` keeps only the binders its body uses; every theorem about them carries the dropped binders in its own signature (`finiteDimensional_dolbeaultCohomology` and `finrank_dolbeaultCohomology_serre` carry `[FiniteDimensional ℂ E] [T2Space M] [CompactSpace M]`, `hard_lefschetz` carries `[FiniteDimensional ℝ E] [I.Boundaryless] [T2Space M] [CompactSpace M]`). No `lemma`, no `set_option`, no sorry'd data; imports are `Mathlib` plus nine `TauCeti.*` modules, each present at the pin.

**Padding probe.** On the scratch copy every `sorry` became `first | rfl | infer_instance | fun_prop | (simp; done) | (simp_all; done) | (norm_num; done) | decide | (exact ⟨inferInstance, inferInstance⟩) | (constructor <;> simp; done) | (intros; simp_all; done) | (aesop; done) | sorry`; the run reports 25 `sorry` warnings and no error, so every theorem fell back. Nothing closes in one tactic; no declaration mirrors a Check or computes a value.

**Headline theorems.** 25, all stated: Newlander–Nirenberg (local); Dolbeault–Grothendieck on a polydisc; the mixed parameter solver; Weierstrass preparation, its uniqueness and division; Rückert; Oka; Cartan; Riemann extension; the regular local ring; the UFD; Hartogs at a point; the temperate symbol; finiteness of `h^(p,q)`; the dual diamond symmetry; `∂∂̄`; Hodge decomposition (dimensions); Hodge symmetry; odd `b_k` even; Hard Lefschetz; `h^(p,q)`, `b_k` and the integral ring of `ℂPⁿ`; the genus dictionary. The docstring's not-statable reasons hold at the pins: `Projectivization.instTopologicalSpace` is declared both in `Mathlib/Topology/Algebra/Projectivization.lean:44` and in `TauCeti/Topology/Algebra/Projectivization.lean:90`; no file under `TauCeti/Geometry/Manifold/Complex/StructureSheaf/` defines a units sheaf (the only `Units` there is inside a proof in `NodeLocalRing.lean:237`); no tensor product of vector bundles, complex torus or Hopf surface carrier exists at the pins.

**Seeded sample, locators** (source id and cache line; for Demailly the cache page equals the printed page; for Hörmann–Steinbauer printed p. 35 is cache page 123 and printed p. 90 is cache page 277, checked on the running heads at lines 1517 and 3751).

| Target | Locator | Source lines | Result |
| --- | --- | --- | --- |
| Parameter Cauchy–Green | own; GH §0.3 | GlobalHolomorphicFunctions `README.md:554` at `af99bc58` (Compact-support Cauchy–Green), `:2128` ("ComplexKahlerGeometry is a consumer only") | supports |
| K3.HolomorphicStalk | Demailly II (2.1), (2.3)–(2.4), (2.7), (2.10) | `demailly-agbook` 3794–3800 (preparation), 3804–3807 and 3817–3823 (division, "The representation (2.4) is unique", proof of uniqueness), 3872–3873 (Noetherian), 3931–3936 (factorial) | supports |
| K4.ComponentwiseFiniteRankAssembly | Demailly V (6.6), (6.7), pp. 260–261; IV (16.8), p. 249 | 12832 (flat), 12846–12859 (parallel frames on simply connected opens, locally constant transitions), 12860–12862 (universal cover), 12242–12249 (locally constant sheaf ↔ representation of π₁ on a locally contractible space) | supports the fixed-rank connected case; the componentwise statement is declared own at `:724` |
| K4.P | Demailly IV (4.11)–(4.12), p. 204, (4.15), p. 205; V (8.2), (9.2), p. 264, (9.5), p. 265; VI §9.1 (9.1), p. 314 | 10201–10209 (continuous and `C^∞` function sheaves soft on paracompact spaces), 10232 (soft ⇒ acyclic), 13017–13019 (smooth lines ↔ `H¹(M,𝓔×)`), 13035–13044 (exponential sequence, connecting map an isomorphism, `c₁`), 13051–13052 (image of `c₁` is `{(i/2π)Θ(D)}`), 15564–15571 (the segment for compact connected Kähler `X`) | supports; the README's "own statement" qualification at `:803–805` is exactly Demailly's hypothesis |
| K5a (heading) | Hörmann–Steinbauer 4.22, pp. 89–90; 1.70, p. 35; Hörmander 2.3.4–2.3.5 | `hormann-steinbauer-distributions` 3752–3761 (`E_k∈C^(k−2)`, `(∂₁⋯∂_n)^k E_k=δ`, Theorem 4.22), 3763–3772 (cutoff, finite order `N`, `E_(N+2)`), 1522–1526 (point support) | supports; Hörmander not verifiable |
| K5a.DistributionLocalStructure | as above | same | supports as written |
| K5a.ComponentwiseCompact | own | values below | consistent |
| K5b (heading) | Demailly VI (7.2), (7.3), (8.12) | 15385–15387, 15390–15395, 15523–15528 ("`h^(p,q)=h^(n−p,n−q)` holds as soon as X is compact") | supports |
| K5b.0 | Demailly VI §7, p. 309; (5.2)–(5.3), p. 300 | 15370–15374 (`D*_E=−⋆D_E⋆`, principal part of `Δ''_E` half that of `Δ_E`), 14858–14868 (`u∧⋆v=⟨u,v⟩dV`, `⋆:Λ^(p,q)→Λ^(n−q,n−p)`, `d''*=−⋆d'⋆`) | supports |
| K7.1 | pinned modules | `TauCeti/Topology/Algebra/Projectivization.lean:90`; `Mathlib/Topology/Algebra/Projectivization.lean:44` | supports the import remark |
| K7.2 | Demailly V (15.10), VI (8.8), (4.4) | 13812–13813, 15486–15487, 14688–14694 | supports |
| Fubini–Study block | Ballmann §4 Example 5, (4.12)–(4.14), pp. 43–44; Demailly VI (4.4), p. 297 | `ballmann-kahler` 1822–1835 (`i∂∂̄ ln det`, independence of the section, closed), 1849–1855 (`λ_A*ω=ω` for unitary `A`), 1856–1874 (positivity at one point by transitivity); `demailly-agbook` 14688–14694 (`(i/2π)d'd'' log`, `∫ω^n=1`) | supports |
| K7.2.TautologicalIncidence | Knutson §1, p. 1 | `knutson-borel-weil` 12–31 (incidence variety, blowup of the origin, tautological line), 58–72 (sections of the dual line ↔ linear functionals) | supports |
| K7.2.RationalQuartic | own | values below | consistent |
| K7.FlatDegreeZero | Berwick-Evans–Tripathy Remark 2.1 | `berwick-evans-tripathy` 287–292 (degree-zero lines ↔ unitary characters `τm+n↦e^(2πi(mx+ny))`) | supports |
| K8.NilpotentCentralReduction | Sakane p. 189; Raghunathan 1.13, p. 23, Cor. 1, p. 31; Angella §§4.1–4.2, p. 13 | `sakane-parallelisable` 106–115 (last nonzero term of the descending central series, central, simply connected closed; cites [11] p. 31 Cor. 1 and p. 23 Thm 1.13 at this step; holomorphic principal torus bundle), `angella-iwasawa` 701 (`b₁=4`), 717–724 (`h^(1,0)=3` in class (i), `h^(0,1)=2`) | supports; Raghunathan read only through Sakane |

Also opened: Demailly I (3.29) at 1288–1293; VI (8.5)–(8.6) at 15442–15456, (8.17) at 15557–15560, (10.1)–(10.2) at 15715–15716; Ballmann 4.17 at 1990–1996.

**Pinned declarations opened** (Mathlib and Tau Ceti at the manifest pins): `LinearMap.det_restrictScalars` (`RingTheory/Norm/Transitivity.lean:178`), `Algebra.norm_complex_eq` (`RingTheory/Complex.lean:42`), `Complex.isCoveringMap_exp` (`Analysis/Complex/CoveringMap.lean:46`), `IsCoveringMap.existsUnique_continuousMap_lifts` (`Topology/Homotopy/Lifting.lean`, simply connected and locally path-connected domain), `PartitionOfUnity.exists_isSubordinate` (`Topology/PartitionOfUnity.lean:430`, normal paracompact), `CategoryTheory.Sheaf.H.δ` (`CategoryTheory/Sites/SheafCohomology/ExactSequences.lean:60`), `Differentiable.exists_eq_const_of_bounded` (`Analysis/Complex/Liouville.lean:131`), `curveIntegral_eq_intervalIntegral_deriv` (`MeasureTheory/Integral/CurveIntegral/Basic.lean:148`), `Mathlib/Algebra/Homology/SpectralObject/` (nine files; R01's carrier).

**Cross-roadmap citations resolved.** On main (`34f48ff`): SmoothBundlesConnections B2.1–B2.5 (`README.md:559–802`), B5.0–B5.2 (`:1072–1209`), B6.1 (`:1375`), B6.2 (`:1668`); DifferentialGeometry 0.4 (`SmoothForm I M ℝ 2`, `:211`, `:299`), 5.4 `homotopyOperator` (`:524`), 5.5 `Density`/`RoughDensity` (`:528`), 12.4 and `TauCeti.riemannianVolume` (`:182–184`); StableReduction Layer 4 (`:529`); LieGroupoidsPoisson G1.3 (`:18`, `:86`, which names K8 as its consumer); RealAnalyticGeometry R3.2 (`:728`), R5 (`:1007`); RealAlgebraicGeometry Layer 7 (`Completed/…/README.md:479`); ComplexManifolds Milestones 1–7 (`:172–319`); ComplexTori Milestone 1 (`:130`); PseudodifferentialOperators P1.0 (`:164`), P1.1 (`:507`); AlgebraicTopology Stages 4, 6, 7, 8 (`:499`, `:946`, `:1573`, `:1602`); GeometricTopology Layer 11 (`:831`); TopologicalKTheory `:78`, `:156` (consumer of K5–K7); DGFloer `:168`, `:226` (R01). At open heads: GlobalHolomorphicFunctions §0.3, §2.5, §4.1, §7.4 (`:554`, `:1104`, `:1438`, `:2090` at `af99bc58`; `:58` and `:2128` name this roadmap a consumer); VariationalMethods §§2.3, 3.1, 5.1–5.3 (`:494`, `:562`, `:839`, `:882`, `:924` at `7ea28a3b`), and `CompactFormPair.operatorDomainV`, the one name the citation tool found nowhere, is defined there in §5.1 ("Define `CompactFormPair.operatorDomainV` as the submodule of `u : V` with such an `f`"), so that lead is a false positive; UnboundedOperators UO-D06 (`:703` at #1027's head). GlobalHolomorphicFunctions is in the brief's list of permitted earlier suppliers; VariationalMethods and OperatorTheory are open pull requests adding new folders, cited as the previous reviews recorded. Ownership against open pull requests was checked for the objects of R01–R03 and against the five roadmaps closest in vocabulary (#848, #946, #886, #1186, #992), not against every open pull request.

**Adversarial pass.** One row per statement; each gives the instances and the values computed.

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| `newlander_nirenberg` | `n=0`; `M=ℂ`, `J=i` | `E=0`: `M` discrete, `φ` constant, intertwining vacuous; `φ=id`, `dφ∘i=i∘dφ` | Pass |
| `dolbeault_grothendieck_polydisc` | `n=0`; `r₀≤0`; `n=1`, `p=q=0` | point: forms of degree ≥1 vanish, `ψ=0`; `ball c r₀=∅`; `φ=f dz̄` needs `∂̄u=f`, the whole-plane Cauchy–Green solution | Pass |
| `exists_mixed_parameter_dbar_solution` | `u=z̄`; `u=z`; `Q=∅` | `(Du(1)+i·Du(i))/2=(1+i(−i))/2=1=∂̄z̄`; `(1+i·i)/2=0`; vacuous | Pass |
| `weierstrass_preparation` | `f=w²−z`, `n=1`; `d=0` | `d=2`, `a₀=−z`, `a₁=0`, `u=1`; `u=f`, `f(0,0)≠0`, empty sum, polynomial `1` | Pass |
| `weierstrass_preparation_unique` | `f=w²−z` | `u′P′=P` forces `u′=1`, `a′=a` by uniqueness of division (3820–3823) | Pass |
| `weierstrass_division` | `g=w²−z`, `f=w³` | `w³=w·(w²−z)+zw`, `q=w`, `r=zw`, degree `1<2` (K3 Check) | Pass |
| `ruckert_nullstellensatz` | `k=0`; `f₁=z²`, `g=z` | `g≡0` near `x`, `m=1`; `z²=1·z²`, `m=2` | Pass |
| `oka_coherence` | `f=(z₁,z₂)`; `k=0` | relations generated by `(z₂,−z₁)`, `m=1`; zero module, `m=0` | Pass |
| `cartan_coherence_reducedIdeal` | `f₁=z²` on ℂ; `(zw)²` on ℂ² | reduced ideal `(z)`, not `(z²)`; gradient of `(zw)²` vanishes on all of `V` (K3 Check) | Pass |
| `riemann_extension` | `1/z`; `sin z/z`; `k=0` | unbounded, excluded by `hbdd`; extends by `1`; `A=U` forces `U=∅` | Pass |
| `isRegularLocalRing_holomorphicStalk` | `E=0`; `E=ℂ` | `spanFinrank 0=dim 0`; `𝔪=(z)`, dimension 1 | Pass |
| `uniqueFactorizationMonoid_holomorphicStalk` | `ℂ{z,w}` | `w²−z³` irreducible: roots `±z^(3/2)∉ℂ{z}` | Pass |
| `hartogs_extension_across_point` | dim 1; ℂ² | `1/z` excluded by `2≤finrank`; every holomorphic function on `ℂ²∖{0}` extends (K3 Check) | Pass |
| `complexBesselSymbol(_temperate)` | `z=0,2,it`, real `s`, `‖ζ‖=2` | `1`; `1+‖ζ‖²`; modulus `exp(Re((it/2)log(…)))=1`; `(1+‖ζ‖²)^(s/2)`; wrong symbol `1+‖ζ‖` gives `3` not `5` | Pass |
| `dolbeaultCocycles`, `dolbeaultCoboundaries`, `DolbeaultCohomology` | ℂ; ℂ×; `q=0` | `h dz` is ∂̄-closed of type `(1,0)`, excluded by the type projection; `dz̄/z̄=∂̄log|z|²`, class 0, while `∮dz̄/z̄=−2πi`; coboundaries `⊥`; `B⊆Z` by `∂̄²=0` so the image is `Z/B` | Pass |
| `finiteDimensional_dolbeaultCohomology` | `M=ℂ` | `H^(0,0)` = entire functions, infinite-dimensional: compactness needed and present | Pass |
| `finrank_dolbeaultCohomology_serre` | ℂP¹; Hopf `S¹×S³` | `h^(0,0)=1=h^(1,1)`, `h^(1,0)=0=h^(0,1)`; `h^(0,1)=1=h^(2,1)`, `h^(1,0)=0=h^(1,2)` | Pass |
| `del_delBar_lemma` | Kähler form of `ℂ/Λ`; `p+1>n` | `∫ω>0`, not exact, excluded by `hexact`; `α=0`, `γ=0` | Pass |
| `finrank_deRhamCohomology_eq_sum_dolbeault` | ℂP¹ `k=2`; `ℂ/Λ` `k=1`; `k>2n` | `1=0+1+0`; `2=1+1`; `0=0` | Pass |
| `finrank_dolbeaultCohomology_symm` | Hopf | `h^(0,1)=1≠0=h^(1,0)`, not Kähler (`H²(M;ℝ)=0`) | Pass |
| `even_finrank_deRhamCohomology_odd` | Kodaira–Thurston; annulus | `b₁=3`, `N_J≠0`; `b₁=1`, has boundary, excluded by `I.Boundaryless` | Pass |
| `lefschetzMap`, `hard_lefschetz` | `j=0`; ℂP² `k=0`; `S²×S²` | identity; `1↦[ω]²`, `∫ω²=1≠0`; `(aσ₁+bσ₂)²=2ab σ₁σ₂`, `σ₁²=0`; degree `k+2(n−k)=2n−k` | Pass |
| `finrank_dolbeaultCohomology_complexProjectiveSpace` | `n=0`; `n=1` | `(0,0)↦1`, `(1,1)↦0`; `(1,1)↦1`, `(1,0)↦0`, `(2,2)↦0` by `p≤n` | Pass |
| `finrank_deRhamCohomology_complexProjectiveSpace` | `n=0`; `n=2` | `b₀=1`, `b₂=0`; `b₀=b₂=b₄=1`, odd and `b₆` zero, `χ=3=n+1` | Pass |
| `integralCupPow`, `integralCohomology_complexProjectiveSpace` | `n=0`; `S²∨S⁴`; `u=2g` | `H²(pt)=0` so `u=0`, `u⁰=1` generates `H⁰=ℤ`, all `j>0` vanish; `u²=0` fails `k=2`; `m↦2mg` not surjective, fails `k=1` | Pass |
| `finrank_dolbeaultCohomology_riemannSurface` | two elliptic curves; ℂP¹ | `2=2`, `4=2·2`; `0=0`, `0=0` | Pass |
| `IsKahler`, `polydisc` | `(ℂ,dx∧dy,i)`; `r=−1`; `n=0` | `ω(v,iv)=|v|²>0`, closed, `N=0`; `ball=∅`; a point | Pass |
| K1 Checks (new) | `z↦2z`, `z↦z̄`, `z↦iz`; `φ=z̄`, `z²`, `|z|²`; `G=v²−z`; `{w=z²}`, `{z²=w³}`, `{|z|=1}`; `∂_z` | `4`, `−1`, `1`; `φ_z̄=1`, `0`, `z`; `∂_vG(1,1)=2`, `F=√(z+w)`; `dw−2z dz≠0`, `2z dz−3w² dw=0` at 0, `J∂_y=−∂_x`; `J∂_z=i∂_z`, `(u+iJu)/2=∂_z̄` | Pass |
| K3 Checks: node and cusp | `t↦(t(t²−1),t²−1)`; `t↦(t³,t²)` | `z²=t²(t²−1)²=(t²−1)²(1+(t²−1))=w²+w³`; `t=±1↦0`; `t⁶=t⁶` | Pass |
| K3.MeromorphicGermField example | `e(z)=2z` | `1/z↦1/(2z)`, back along `w↦w/2`: `1/w`; `1+z↦1+2z`, value `1` | Pass |
| K4 Checks: Chern connection, frame change | `h=e^(−|z|²)`; `g=e^z`; `g=2` | `A=∂log h=−z̄ dz`, `F=dz∧dz̄`, `(i/2π)F=(1/π)dx∧dy`; `A′=A+dz`; `h′=4h`, `A′=A` | Pass |
| K4 Checks: monodromy | `d−a dz/z` | parallel sections `cz^a`, positive loop `e^(2πia)`; `a∈ℤ`: gauge `z^a` | Pass |
| K4.ComponentwiseFiniteRankAssembly | `ℂ⊔ℂ`, ranks 0 and 2; empty base | fibres `0` and `ℂ²`, no single `F`; zero objects | Pass |
| K4.P frame convention | `s=e_i s_i=e_j s_j`, `e_j=e_i g_ij` | `s_i=g_ij s_j`: `g_ij` carries `j`- to `i`-coordinates, as `:787` says | Pass |
| K4.P segment and `c₁` | point; ℂP¹; `ℂ/Λ` | `0→0→0→0→0`, `exp(2πi·):ℂ→ℂ×` onto with kernel ℤ (`exp` alone: `2πiℤ`); `c₁(O(±1))=±1`, inverse cocycle gives `∓1`; `H¹(𝒪)=ℂ`, `Pic⁰=ℂ/(ℤ+τℤ)≅Hom(Λ,U(1))`, `c₁` not injective | Pass (ownership: R02) |
| K4.P `F_M` | ℂP¹; `ℝP²`; `S¹`; `S²` | both sides ℤ, `O(1)↦+1`; `H¹(ℝP²;ℤ)=0` so the Bockstein `H¹(ℤ/2)→H²(ℤ)=ℤ/2` is injective, `c₁(L_ℂ)=β(w₁)≠0`; `H¹(S¹;ℂ_const)=ℂ` versus acyclic `C⁰_ℂ`; `H¹(S²;ℤ/2)=0` misses `O(k)` | Pass |
| K4.P exactness route | chart ball | simply connected and locally path-connected, so the lifting lemma applies to `exp` onto `{z≠0}` | Pass |
| K5a.DistributionLocalStructure | `m=2,3`; `u=∂_zδ⊗1` | `D²t_+=δ`, `t_+²/2∈C¹`; `z·u=−δ⊗1=(−1)¹1!u_(1)` | Pass |
| K5a Checks: density, tests, Sobolev | `x↦−x`; `y=2x`; delta on `Sⁿ`, `S¹` | `|dx|` fixed, `dx` negated; `∫φdy=2∫φdx`; `∫(1+‖ζ‖²)^s dζ<∞` iff `s<−n/2`, `s<−1/2` on `S¹`, weight `(…)^(2s)` moves it to `s<−n/4` | Pass |
| K5a.ComponentwiseCompact | compact `M` with components `C`; empty `M` | components open, disjoint, cover: finite subcover contains each; zero spaces, empty eigenbasis | Pass |
| K5b.0 | `H=I` | `|dz|²=2`; `dz♯=2∂_z`; `∂̄*`: `(p,q)→(n−q,n−p)→(n−q+1,n−p)→(p,q−1)`; `σ(Δ_∂̄)=½σ(Δ_d)` | Pass |
| K5b Checks: volume, adjoint, stars | ℂ, ℂ²; `f dz̄`; `*dz` | `(i/2)dz∧dz̄=dx∧dy`, `ω²/2!=dx₁dy₁dx₂dy₂`; `Δ_∂̄g=−2∂_z∂_z̄g=−½Δ_flat g`, symbol `½|ξ|²`; `*dz=dy−i dx=−i dz` type `(1,0)`, `barStar dz∝dz̄` | Pass |
| K6.0 Checks | ℂP¹ scaled by `√π`; `H=diag(1+z₂+z̄₂,1)` | `H=(1+π|u|²)^(−2)`, `|H−1|≤2π|u|²`; `dω=(i/2)(dz₂+dz̄₂)∧dz₁∧dz̄₁≠0` | Pass |
| K6.1 Checks | elliptic curve; Hopf; annulus; `S²×S²` | `2=1+1`; `b₁=1` odd; `b₁=1` with boundary; `σ₁²=0` | Pass |
| K6.1.RelativeIntegration (ii), cone | `d²`; `(ψdx,Ψ|_U)` on `[−1,1]`; `(dx,0)` | `(δδa,(δa)|_U−δ(a|_U)+δδb)=(0,0)`; `d(Ψ,0)=(ψdx,Ψ|_U)`, pairing `1−(1−0)=0`, the wrong sign gives `2`; `d(dx,0)=(0,dx|_U)≠0`, `(∫dx,0)([1,2])=1` | Pass |
| K6.1.RelativeIntegration (ii), pairing | `c=∂e+c_U`, cocycle `(a,b)` | `a(∂e)+a(c_U)−b(∂c_U)=(δa)(e)+(a|_U−δb)(c_U)=0` | Pass |
| K6.1.RelativeIntegration (iii) | `N=ℝ`, `K=[−1,1]`, `[−3,3]`; `S¹` | `∫ψ=1` both; `2π`, reversal negates both sides | Pass |
| K7.1 comparison | `v=(3,4)`, `2iv`; `(1,i)`; `n=1`, `(0,1)` | `(3/5,4/5)`, `i(3/5,4/5)`, chart `4/3`; chart `i` versus `−i` for the conjugate map; value `0` in the chart `v₁≠0` | Pass |
| Fubini–Study | `w=(1,i)/√2`; `z=(1,0)`; `c=2`; `diag(1,2)`; `∫_(ℂP¹)` | `−w₁w̄₂/(r²π)=−(1/√2)(−i/√2)/(4π)=i/(8π)`; `H_z(v,v)=1/π`; `|c|⁴=16` cancels; `4/π`; `∫(1/π)(1+|w|²)^(−2)dλ=1` | Pass |
| K7.2 cohomology Checks | `n=0,1,2` | `u=0`, `u⁰=1`; `h^(2,2)(ℂP¹)=0`; `S²∨S⁴`; `Σ(−1)^k b_k=n+1` | Pass |
| K7.2.TautologicalIncidence | overlap; `d=2`, `k=1`; `k<0`; `exp(v₁)` | `a′=az_k`, `z′_i=1/z_k`; `(t·F)=t⁻¹F`; `F(v)=tF(tv)→0`; no homogeneity | Pass |
| K7.2.RationalQuartic | `n=1,2` | `(a,b,c,d)↦(a,b,0,c,d)`; pair sums of `{0,1,3,4}`: `0,1,2,3,4,5,6,7,8`; `10−9=1`, `x₀x₃−x₁x₂↦s⁴t⁴−s⁴t⁴=0` | Pass |
| Genus dictionary and normal form | `ℂ/(ℤ+τℤ)`; `[[0,2],[−2,0]]`; `[[1,0],[0,1]]` | cup matrix `[[0,1],[−1,0]]`, det `1`; det `4`, image of `ω(x,−)` is `2ℤ`; `ω(e₁,e₁)=1` not alternating | Pass |
| K7.FlatDegreeZero | `ρ=exp(aλ)`; square torus; holonomy | `u=α`, `v=αx−βy`, recovers `α+iβ`; `exp(πix)` gives `−1`, `1`; `(λ,v)~(0,ρ(λ)⁻¹v)` | Pass |
| K8.NilpotentCentralReduction | `H₃(ℝ)`, `H₃(ℂ)` | `log(1,1,1)=X+Y+½Z` (`(g−I)²=xyZ`), `exp(X+Y)` has `z=½∉ℤ`; `A=exp(ℝZ)`, `Γ∩A≅ℤ`, `G/A≅ℝ²`; `Γ∩A=ℤ[i]`, fibre `τ=i` | Pass |
| K8 Checks: Frölicher | Iwasawa; torus; Hopf | `3+2=5>4`; `d₁[φ₃]=−[φ₁∧φ₂]≠0` in `E₁^(2,0)`; `2n=b₁`; `0+1=1=b₁` and `1+1+1+1=4=Σb_k` | Pass (supplier: R01) |

That is 56 rows computed; none fails on the mathematics. R01 is a supply cycle, R02 and R03 ownership, R04 the description.

## Not verifiable

- Hörmander, *The Analysis of Linear Partial Differential Operators I*, Theorems 2.3.4–2.3.5: uncertified; second-edition numbering assumed.
- Griffiths–Harris ch. 0, Wells and Webster: uncertified, not opened.
- Raghunathan, Theorem 1.13 and Corollary 1: uncertified; read only through Sakane's citation at `sakane-parallelisable` 112–113.
- Bott–Tu §6, p. 78: uncertified; the relative complex was checked by computation instead.
- Nakamura's Hodge numbers, which Angella cites: not opened.
- The heads of #1398, #1807 and #1808 were read only to measure their distance from this head (R04); #1854's three-line change was read in full (R01).
- Ownership was not checked against all 468 open pull requests.
- The adversarial rows check instances; they are not proofs.

## Source issues

- none
