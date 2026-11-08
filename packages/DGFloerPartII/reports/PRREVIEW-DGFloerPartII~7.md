# Review of DGFloerPartII (pull request #1799 at 17ee91f)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/DGFloerPartII/README.md` (1311 lines) and
`TauCetiRoadmap/DGFloerPartII/Suggested.lean` (226 lines, 18 declarations). The gate passes on
this head, the dependency check reports no problem, the Lean file elaborates with exactly its 14
`sorry` warnings, and every elaborated type matches its README statement. Of the previous
review's nine findings, seven are repaired, one (R08) is resolved another way but with a wrong
description of the supplier, and one (R06, two owners on main) is not repaired and is re-raised.

The findings below are one blocking item that nothing in the folder can repair (the sequencing
of the base roadmap's revision) and three P3 repairs.

Source ids used below:

- `bdho-cotangent`: arXiv:2404.07953v3 (cached, 139 pages; the printed page is the footer at the
  end of each page of the text).
- `css-derivative`: arXiv:2012.13634v1.

This folder has no `sources.toml`, and this review edits none.

## R01 (P2) — Re-raised: DGFloer on main still owns Theorem B's realization and all of Layer 4

Re-raised: R06 of the previous review (R01 of the one before). The repair report's reason was
that the sequencing discharges it; the pull request still does not state that sequencing.

**Location.** README lines 36–41 (Scope: "every numbered statement of its §§6.3–6.4 and §7, and
the carriers, comparisons and explicit maps those statements consume"); Layers 3–4.

**Claim.** This roadmap is the only owner of §§6.3–6.4, §7 and the realization step of Theorem B.

**Witness.**

- Main's `TauCetiRoadmap/DGFloer/README.md` (eaf17b1) still carries all of it: the Layer 10
  item 5 bullet "Multiple realization and Theorem5.14/TheoremB" at line 1567 with the
  compact-image embedding at line 1569; `## Layer 11: manifolds abundant with 2-spheres, and
  knotted hypersurfaces` at line 1577 with items 1–6 at lines 1579, 1581, 1620, 1632, 1645 and
  1647 (abundance and Theorem H, fibered families, covering by diffeomorphisms with Lemma 6.35,
  homogeneous spaces, projective spaces, Theorem G); and Layer 1 items 7–8 at lines 834 and 841
  (the homogeneous carriers and the explicit degrees of 1.3–1.4).
- DGFloer's open revision #1798 (now at f28741c5) removes them: its Layer 11 is "the finite
  cover of a compact connected Lie group" (11.1–11.3, line 3991), its 10.5 is "Theorems A and
  C", and its line 54 reads "DGFloerPartII consumes this roadmap and supplies nothing to it".
- The description's merge-order paragraph lists #860 → … → #942 → #284 → #1287 → #1799 and
  does not name #1798.

**Repair.** Nothing in the folder. The description's merge-order paragraph should state that
DGFloer's revision #1798 lands before this pull request. This is an order, not a supplier
dependency: the README cites DGFloer by layer and item, as on main.

## R02 (P3) — 3.2 misdescribes the hypothesis on `S` in the base roadmap's Theorem A

**Location.** README lines 843–845: "DGFloer Layer 10 item 5 takes `φ` continuous and `S` a
compact topological manifold, so the map that 3.1 produces is used as it is … and no smoothing
step is needed."

**Claim.** The base's Theorem 5.10 accepts a topological `S`.

**Witness.** `bdho-cotangent` lines 4140–4142: Theorem 5.10 takes `φ : S → T*Q` continuous
"defined on a smooth `n`-dimensional orientable closed manifold `S`". DGFloer at #1798, 10.5
(lines 3 and 6 of that section): "`S` is a closed **smooth** manifold, as in the source's
Theorem 5.10: the route goes through the Umkehr map … built from Morse data on `S`", and its
`Suggested.lean` line 541 states Theorem A with `[IsManifold 𝓘(ℝ, E) ∞ S]` and
`φ : C(S, CotangentBundle 𝓘(ℝ, E) Q)`; its Check "`S` smooth: … Freedman's `E₈` manifold … has no
Morse function" says the hypothesis is used. Main's item 5 (line 1569) smooths `e ∘ f` for the
same reason.

The route itself is fine: 3.1's `S` comes from TangentialBordism B6.3's geometric preimages,
which are smooth closed oriented manifolds, and `φ` is continuous there as in the source's proof
(`bdho-cotangent` 4274–4277). Only the sentence is wrong.

**Repair.** In 3.2 write: "DGFloer Layer 10 item 5 takes `φ` continuous on a closed smooth
oriented `n`-manifold `S` (the source's Theorem 5.10); the manifold 3.1 produces is such an `S`,
so the map is used as it is and no smoothing step is needed." In 3.1 write "closed smooth
oriented manifold `S` (a finite disjoint union)". Tested: Theorem 5.10 at lines 4140–4142 and
#1798's Lean signature both accept a continuous `φ` on a smooth `S`.

## R03 (P3) — Two citations of the base use numbering that DGFloer's open revision drops

**Location.** README line 267 ("Layer 4: … the arbitrary-CW Brown resolution of item 5"), line
709 (2.4 *Needs:* "DGFloer Layer 4 item 5"), and line 1129 (4.4 *Needs:* "Layer 3 item 4
(rank-one twists)").

**Claim.** These ids resolve on the base roadmap this pull request will merge against.

**Witness.** They resolve on main: `TauCetiRoadmap/DGFloer/README.md` lines 962 ("Twisting by
a rank-one local system `L`", Layer 3 item 4) and 1004 ("Arbitrary-CW Brown resolution before
derived coefficients", Layer 4 item 5). At #1798, which R01 places before this pull request,
Layer 4 has the single section 4.1 "Arbitrary-CW Brown resolution before derived coefficients"
(#1798 line 1631; its consumers paragraph at line 4124 already says "DGFloerPartII consumes …
Layer 4 item 1"), and Layer 3 has the single section 3.1 (basepoint change), its preamble (lines
1562–1569) routing rank-one twisting to Tau Ceti's `TauCeti.RankOneLocalSystem` with
`TauCeti.RankOneLocalSystem.twistedCochainComplexIso` (at the pin,
`TauCeti/AlgebraicTopology/DGLocalSystem/RankOne.lean:96` and the file header). Every other
"Layer `k` item `j`" citation keeps its number at #1798 (Layer 1 items 1–6, Layer 2 items 1–3,
Layer 5 items 1–6, Layer 6 items 3–5, Layer 10 items 2–5, Layer 11).

**Repair.** Write "DGFloer Layer 4 item 5 (4.1 at the base's open revision)" at lines 267 and
709, and at line 1129 cite the rank-one twist as "Tau Ceti `TauCeti.RankOneLocalSystem` (DGFloer
Layer 3 item 4)", adding the declaration to the Tau Ceti contract. Tested: both names exist at
2fd255d9, and no other cited id changes number at #1798.

## R04 (P3) — The pull request description's account of `Suggested.lean` is stale

**Location.** The description's last paragraph: "`Suggested.lean` states the rotation family at
a fixed pole, the low-rank values of `π_(n−1)(SO(n))` and its torsion for odd `n`."

**Claim.** The description describes the Lean file.

**Witness.** `Suggested.lean` states no rotation family. It states Theorem B
(`hasContractibleAlmostExistence_of_map_singularHomology_ne_zero`, line 80), five finite-capacity
forms of Theorem I (lines 101, 116, 134, 164, 177), the real-manifold instance on `CPᵈ` (line
155), and the seven low-rank values with the torsion statement (lines 194–224).

**Repair.** Regenerate the paragraph from the module docstring (lines 21–39): Theorem B in its
Theorem 5.14 form, the finite capacity of Theorem I for spheres, manifolds covered by
diffeomorphisms, non-aspherical compact Lie groups and the projective spaces, and Lemma 6.35's
values and torsion. Name #1798 in the merge order as R01 asks.

## Previous findings

- **R01 (real Bott periodicity re-plans HomotopySpheres 4A–4B): repaired.** Sections 2.7, 2.8 and
  4.2a are gone; the four 4.2a theorems are gone from `Suggested.lean`; the contract "From
  TauCetiRoadmap.HomotopySpheres" (lines 287–300) consumes 4A.1 and 4B.1–4B.8 with the range
  `r ≥ i + 2` and the stable table; the Scope table (line 76) lists them under "Left to named
  roadmaps"; the Summary (lines 17–19) names HomotopySpheres' real Bott periodicity; 2.1 (lines
  621–626) keeps the locally symmetric Jacobi statement.
- **R02 (convenient category owned twice): repaired.** 1.0 and its four theorems are gone; 1.1
  (line 343) and 1.2 (lines 374–381) cite HomotopySpheres §3A.1–3A.2; the Mathlib contract (lines
  165–176) adds `CompactCoherentification` with its Hausdorff agreement; the Scope table (line
  74) lists the convenient category under HomotopySpheres.
- **R03 (Euclidean framed collapse owned twice): repaired.** 1.4a is gone; 1.5 (lines 548–578)
  compares DGFloer Layer 1 item 5's collapse with GeneralizedCohomology G5 item 2's followed by
  the Thom map of the framing, identified with TangentialBordism B5.1's coefficient collapse,
  and keeps the three Checks.
- **R04 (Theorem I statable but absent): repaired.** Lines 101–184 state the sphere, Lie-group,
  covered-manifold, `CPᵈ` and `HPᵈ` forms; line 80 states Theorem B; the docstring (lines 41–58)
  now says what Theorem H and Theorem G lack.
- **R05 (nonorientable Proposition 6.36): repaired.** 4.4 (lines 1070–1076) states two
  conclusions; the `ℝP² = SO(3)/O(2)` instance is worked at lines 1104–1114; 4.5 (lines
  1152–1154) says "orientable homogeneous spaces … which the source's Theorem I does not list";
  the Check at lines 1200–1203 is the one asked for.
- **R06 (two owners on main): not repaired**, re-raised as R01.
- **R07 (4.6 bound at `k = n`): repaired.** Lines 1227–1232 begin "for `k < n`" and state the
  `k = n` failure.
- **R08 (3.2 without a locator): resolved differently.** The smoothing step is gone, so no
  locator is needed; the sentence that replaces it misdescribes the supplier (R02).
- **R09 (description versus README suppliers): partly repaired.** The depends-on list (#1287,
  #284, #942) matches the README's open suppliers, and no GeneralAlgebraicKTheoryPartII citation
  remains; the Lean summary is stale (R04) and #1798 is still unnamed (R01).

## Verified sound

**Gate and build.**

- The worker's gate at 17ee91f: every scanner is 0, `depcheck=0`, `build=0`, `outside-folder=0`,
  `stray-files=0`. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`; `git diff
  --stat origin/main...HEAD` outside the folder is empty.
- The dependency check, rerun on this head:

      depcheck: 243 roadmaps, 2456 edges, 0 problem(s)

  TangentialBordism is merge-order line 15, HomotopySpheres line 72, DGFloerPartII line 73; every
  other supplier is on main.
- `lake env lean` on `Suggested.lean`: exactly 14 "declaration uses `sorry`" warnings, at lines
  80, 101, 116, 134, 164, 177, 194, 197, 200, 204, 208, 212, 216 and 223, in 20 s. No error.
- Pins: Mathlib 1b1ccf4b, Tau Ceti 2fd255d9 (the same as main and #1798).
- Form: `module` / `public import Mathlib` plus ten `TauCeti.*` modules, all present at the pin;
  one module docstring; `@[expose] public section`; `namespace TauCetiRoadmap.DGFloerPartII`;
  two layer comments; `theorem` only; no `lemma`, no `set_option`, no `#eval`, no sorry'd data.
  The two definitions (`SO`, `instIsManifoldRealComplexProjectiveSpace`) have real bodies and
  exist only to state Lemma 6.35 and the `CPᵈ` headline; no real `IsManifold` instance on
  `ComplexProjectiveSpace` exists at the pin (only `instIsManifold` over `𝓘(ℂ, Fin n → ℂ)`,
  `TauCeti/Geometry/Manifold/Instances/ComplexProjectiveSpace.lean:65`).

**Signatures.** A scratch file importing the built module ran `#check @` on all 18 declarations.
The file has no section `variable`, so no binder can drop; every elaborated type equals the
worker's signature file and matches its README sentence:

- Theorem B (3.2): `Q` compact connected Hausdorff smooth over finite-dimensional `E`;
  `Nontrivial (π_ 2 Q q) ∨ ∃ ℓ, ¬ IsMulTorsion (π_ (ℓ+3) Q q)`; `F` smooth with compact sublevel
  sets; `c` regular; the map on `H_{finrank E}(−; ULift ℤ)` of the projection restricted to
  `{F < c}` nonzero; conclusion `HasContractibleAlmostExistence Set.univ F c`. The same carriers
  and the same `F`, `hFc`, `hc` shape as the base's Theorem A at #1798 (`Suggested.lean:541`),
  which has `φ`, `S` and a degree in place of the homology hypothesis; neither main nor #1798
  states Theorem B in Lean.
- Covered manifolds (4.3/4.5): `o : HomologicalOrientation M E (finrank ℝ E)`, `0 < ℓ`, the class
  `A` in `H_n(M ≃ₘ^∞⟮𝓘(ℝ,E),𝓘(ℝ,E)⟯ M)` for the scoped `Diffeomorph.weakWhitneyTopology`
  (`TauCeti/Geometry/Diffeomorphism/Topology.lean:85`, scoped instance line 89,
  `continuous_eval_const` line 114, `[CompactSpace M]` in scope) with
  `ev_* A = ℓ • o.mapFundamentalClass rfl (id M)` (`…/FundamentalClass.lean:275`), and the
  homotopy hypothesis as in Propositions 6.29 and 6.33.
- Lie groups: `[LieGroup 𝓘(ℝ, E) ∞ G] [CompactSpace G] [ConnectedSpace G]`, `¬ IsAspherical G 1`
  (`TauCeti/AlgebraicTopology/EilenbergMacLane/Basic.lean:59`: path connected and every
  `π_(n+2)` trivial). `LieGroup` gives `IsManifold` (an `inferInstance` in the scratch file
  succeeds), and a locally Euclidean group is Hausdorff, so no binder is missing.
- The capacity statements use `SmoothTwoForm.contractibleHZCapacity`
  (`TauCeti/Geometry/Symplectic/Capacity/HoferZehnder.lean:193`, the supremum of maxima of
  `IsContractibleHZAdmissible` Hamiltonians, line 176: compact support in the interior of `W`,
  vanishing on a nonempty open set, no nonconstant `T`-periodic orbit with `0 < T ≤ 1`
  contractible in `W`), `CotangentBundle.codiscBundle` (`…/Codisc.lean:82`, `‖z.2‖ ≤ 1` for a
  `RiemannianBundle` on the tangent bundle) and `CotangentBundle.symplecticForm`
  (`…/Liouville.lean:279`).
- `SO n = Matrix.specialOrthogonalGroup (Fin n) ℝ` (`Mathlib/LinearAlgebra/UnitaryGroup.lean:338`),
  `π_ k (SO n) 1`, `IsMulTorsion = ∀ g, IsOfFinOrder g` (`Mathlib/GroupTheory/Torsion.lean:56`).

**Padding probe.** `first | infer_instance | simp | rfl` (plus `decide`, `exact
isOfFinOrder_of_finite x`, `exact ENNReal.coe_lt_top`, `simp [hG]`) was run on eight of the
fourteen theorems in the scratch file: the five `SO` values of lowest rank, `isOfFinOrder_pi_SO`,
the `CPᵈ` capacity and the Lie-group capacity. All eight fail (`Decidable` and `Finite`
instances missing, `rfl` not a relation, `simp` no progress). The remaining six are the same
shape (capacity finiteness, `π_k(SO m)` values), and the pin has no lemma about `HomotopyGroup.Pi`
of a matrix group (Tau Ceti has no homotopy statement about `orthogonalGroup` or
`specialOrthogonalGroup`). Nothing restates a definition or mirrors a Check.

**Headline theorems.**

| Headline | Status in `Suggested.lean` |
| --- | --- |
| Theorem B (3.2, = Theorem 5.14) | stated, line 80 |
| Corollaries D and E in Theorem B form (3.3) | transports of Theorem B; not separately statable (the magnetic translation and Liouville flow are DGFloer Layer 6 targets); covered by the docstring's Theorem B entry |
| Theorem H (4.1) | not statable: "abundant" needs `H_*(Map(S², Q))` over the fundamental class; said in the docstring |
| Theorem I (4.5): spheres, covered manifolds, Lie groups, `CPᵈ`, `HPᵈ` | stated, lines 101, 134, 116, 164, 177 |
| Theorem I: fibered families, sphere bundles, products, homogeneous spaces | not statable (evaluation fibration, `G/H`); said in the docstring |
| Theorem G (4.6) | not statable (transversality, trivial normal bundle); said in the docstring |
| Lemma 6.35 (4.3) | stated: seven values and `isOfFinOrder_pi_SO`; the `n ≥ 17` splitting named as not statable |

**Library declarations opened at the pins** (file and line): `IsAspherical` (above),
`HomotopyGroup.pathLoopSpaceMulEquiv` (`TauCeti/Topology/Homotopy/HomotopyGroup/LoopSpace.lean:321`),
`LocalCoefficientSystem` (`TauCeti/AlgebraicTopology/LocalCoefficient.lean:46`),
`HomologicalOrientation` (`…/Orientation/Homological.lean:75`, needs `[T2Space M]`),
`IsRegularValue` (`TauCeti/Geometry/Manifold/RegularValue.lean:92`),
`HasContractibleAlmostExistence` (`…/AlmostExistence.lean:167`: some `ε > 0` with almost every
regular level in `(c − ε, c + ε)` carrying a characteristic contractible in `W`),
`IsNondegenerate.contractibleHZCapacity_image` (`…/HoferZehnder.lean:295`, as 1.3 uses it),
`QuaternionicProjectiveSpace.instIsManifold` over `𝓘(ℝ, Fin n → ℍ)`
(`…/QuaternionicProjectiveSpace.lean:88`), `IsManifold.restrictScalars`
(`…/IsManifold/RestrictScalars.lean`, header line 33), `TauCeti.stiefel`
(`…/Instances/Stiefel.lean:162`), `SmoothEmbedding.NormalSpace` (the docstring's claim; used in
`…/TubularNeighborhood/Riemannian/Basic.lean:59`), Mathlib's `SequentialSpace →
UCompactlyGeneratedSpace` instance (`…/CompactlyGeneratedSpace.lean:211`, used by 1.1),
`CompactCoherentification` (`…/CompactlyCoherentSpace.lean`), `compactlyGeneratedToTop`
(`…/Category/CompactlyGenerated.lean:78`), `ContinuousMap.curry` (`…/CompactOpen.lean:430`).

**Cross-roadmap citations resolved.**

- **DGFloer on main (eaf17b1):** Layer 1 items 1–6 (lines 462, 470, 621, 659, 826, 832), Layer 2
  items 1–3, Layer 3 item 4 (962), Layer 4 item 5 (1004), Layer 5 items 1–6, Layer 6 items 3–5,
  Layer 10 items 2–5 (1549–1567), Layer 11 (the finite cover and torus criterion inside item 3's
  compact-Lie bullet, line 1623). Main's item 5 and #1798's 10.5 both take `φ` continuous (R02).
- **HomotopySpheres at #1287 (a4f5c1e2):** 3B.1, 3B.3 (Bott–Samelson "over a commutative
  coefficient ring when the reduced homology of `X` is free over that ring"), 3B.4, 4A.1 (stable
  `O`, `SO`, the range from `SO(r) → SO(r+1) → S^r`), 4B.1–4B.8 (4B.8's table `ℤ/2, ℤ/2, 0, ℤ,
  0, 0, 0, ℤ` is the README's). §3A at that head (lines 857–865) has no 3A.1 and its 3A.2 is
  "Pointed cones and Puppe sequences": it says that citations of 3A.1, and of 3A.2 for the
  reduced suspension, based loops, smash product and suspension–loop adjunction, refer to
  AlgebraicTopology Stage 4 item 8. Main's AlgebraicTopology (lines 113–118) in turn names
  "HomotopySpheres §3A.1" as the owner of the coreflection and §3A of the pointed adjunction,
  and its 4.4 (line 567) builds on "HomotopySpheres §3A.1's coreflection"; Stage 4 item 8 exists
  only at AlgebraicTopology's open revisions (#1652 §4.8, #1663). So the README's citation is the
  form main uses, and the supplier's own redirect makes it readable at its head. Not a finding.
  HomotopySpheres states nothing about the unstable groups `π_(n−1)(SO(n))`.
- **TangentialBordism at #942 (8e5c510e):** B5.1 (line 1177: the coefficient collapse is "G5.2's
  unframed collapse `S^(n+k) → Th ν_M` … followed by the Thom map"), B5.5 (line 1510, Checks: a
  framed point `±1`, the empty manifold `0`), B6.3 (line 2506: the rational `SO` surjection in
  every degree with geometric preimages).
- **Main:** GeneralizedCohomology G2 item 10 (mapping-path replacements), G4.0/G4.0b, G4 items
  3–5, G5 item 2 ("construct the unframed collapse `S^N → Th ν` here", independence of
  embedding, stabilization and metric, fundamental-class duality), G5 item 6 (rational spectral
  Hurewicz); ComplexKahlerGeometry K7.1 (line 1407) and K7.2 (1444); LieGroups Layer 2 (line 275,
  the closed-subgroup theorem); SmoothBundlesConnections B1.4 (421, anchor matches), B2.2 (605),
  B2.5 (802), B6.2 (1668), B6.3 (1716); RiemannianGeometry R1 (179; radius-½ projective lines at
  296), R2 (300), R3 (347; `j : S^(n−1) → ΩSⁿ` at 587); MorseTheory M5 (857); GeometricTopology
  Layers 1 (177) and 3 (357, `Diff(M)` with the `C^∞` topology); AlgebraicTopology Stage 2 (item
  6, local coefficient systems), Stage 4.4 (`reducedSuspensionSphereHomeomorph` at 544,
  `compactReducedSuspensionCarrierComparison` at 565), Stage 6 item 5 (the shared manifold
  degree, line 1560), Stage 8 items 1–7 (Hurewicz at item 3).

**Ownership and overlaps.** The overlap report lists no open pull request changing this folder,
no dropped id and no id defined only by a revision; confirmed, with the one base-numbering
exception of R03 (item numbers inside a layer, which the report does not track). The closest
roadmaps are DGFloer (#1798, read above), HomotopySpheres (#1287), TangentialBordism (#942) and
AlgebraicTopology (#1663). The other DGFloer pull request #963 and the other HomotopySpheres
pull request #284 were not given with their files and were not checked. `roadmaps grep` for
"abundant with 2-spheres", "covered by diffeomorphisms" and "π_(n−1)(SO(n))" finds only DGFloer
and this roadmap.

**Seeded source sample.**

| Target | Locator checked | Result |
| --- | --- | --- |
| 1.1 | no theorem; Mathlib `SequentialSpace` instance (`CompactlyGeneratedSpace.lean:211`); HomotopySpheres §3A at #1287 lines 857–865 | claims supported; the supplier redirects §3A.1 as noted |
| 1.2 | Prop 6.18, `bdho-cotangent` 4685–4694 (polynomial ring, not graded commutative, Hatcher §4.J at 4693); HomotopySpheres 3B.3–3B.4 | as stated; `H̃_*(S^(n−1); ℤ) = ℤ` is free, so 3B.3's ring form applies |
| 1.3 | Prop 6.38 proof 5221–5227 (homogeneous metric, totally geodesic complex line, frame `(v, Iv)`); CKG K7.1/K7.2; RG line 296 (radius ½) | as stated |
| 1.5 | GC G5 item 2; TangentialBordism B5.1 lines 1177–1196 and B5.5 Checks | the composite collapse is B5.1's by its own definition |
| 2.1 | `bdho-cotangent` 5283–5286 (`C_k ≅ T¹_pHPⁿ`, dimension `4n − 1`, index `2(k−1)(2n+1) + 3`, Ziller Thm 3) | as stated; `CPᵈ` index recomputed below |
| 2.2 | 5234–5239 (Ziller perfectness; twice the fundamental class of `T¹_pCPⁿ`, dimension `2n − 1`, index 1) | supports the generator and the factor 2; the rank-count route is the README's own |
| 2.5 | own construction; GC G4.0, G4.3–4.5 | computed below |
| 2.6 | 5226 (frame), 5302–5310 (`H_(4n+2)(Ω_pHPⁿ) ≅ ℤ`, fibrewise degree `±2`, twice a generator) | as stated |
| 3.1 | Thm 5.14 proof 4273–4277 (Thom II.29; `N·α = φ_*[S]`, `d = Nb`) | as stated |
| 3.2 | Thm 5.14 statement 4267–4272; Thm 5.10 4140–4150 | hypotheses identical; `S` smooth in 5.10 (R02) |
| 3.3 | line 289 (Theorem B form transported by `Ψ`); Cor D 265–292, Cor E 304–307 (as in the previous review) | as stated; sign witness recomputed below |
| 4.2 | Def 6.14 4621–4632, Prop 6.15 4633–4643 (degree `dim Q + dim Σ_p`) | identical |
| 4.3 | Def 6.26 4919–4925, Prop 6.29 4935–4937, Def 6.32 5051–5057, Prop 6.33 5059–5062, Prop 6.34 5063–5064, Lemma 6.35 5073–5094 (`ℤ₄` at 5076, `n ≥ 16` at 5078, `n ≥ 17` at 5093), second proof 5122–5139 (degree `1 + (−1)^(n−1)` at 5131); `css-derivative` 214 (proof of Lemma 2.2), 222, 249 | as stated; the `ℤ₄` is the source's error |
| 4.4 | Prop 6.36 5141–5158 (`G` compact connected, `H` closed of positive dimension, no orientability), Ex 6.37 5201–5210, Remark 6.2 at 4351 and 5214–5217 | as stated with the two conclusions |
| 4.6 | §7 hypotheses 5354–5364, Thm 7.1 5366–5372 (`φ` continuous, `S` closed orientable `(n−k)`-manifold, `d ≠ 0`), Prop 7.5 5404, Lemmas 7.6 (5467) and 7.7 (5503) | identical |
| Theorems H, I | 424–427, 430–445 (no homogeneous spaces in (i)–(iv)); Def 6.11 4517–4523, Thm 6.12 4525–4528, Prop 6.13 4608–4616 | identical |

**Adversarial table** (values computed in this review).

| Statement | Instances | Values | Result | Change |
| --- | --- | --- | --- | --- |
| Theorem B Lean, hypotheses | `Q = pt` (`E = 0`); `Q = T^r`; `Q = ℝP³`; `Q = S²` | `π₂ = 0` and every `π_(ℓ+3) = 0` (torsion), so `hQ` false; `T^r` all `π_ℓ = 0`, excluded; `π₃(ℝP³) = ℤ` not torsion; `π₂(S²) = ℤ` | vacuous or true where it should be | none |
| Theorem B Lean, `U` | `c < min F`: `U = ∅` | `H_n(∅) = 0`, `hU` false; `Q = S² ⊔ T²` excluded by `ConnectedSpace` | hypotheses needed | none |
| Theorem B, orientability | closed connected nonorientable `Q` | `H_n(Q; ℤ) = 0` (Hatcher 3.26), so `hU` fails | the source's orientability is implied | none |
| `¬ IsMulTorsion` versus Thm 5.14 | definition `∀ g, IsOfFinOrder g` | negation = an element of infinite order = "not torsion" (4268–4269); then `π_ℓ(Q)` is not annihilated by `d^m` for any `m`, condition 2 of 5.10 (4146–4147) | agrees | none |
| covered Lean, `ℓ = 1` | `x^1 ≠ 1 ⇔ x ≠ 1` | `hM` says some `π_(k+2)(M) ≠ 0`, i.e. `M` not aspherical | docstring claim true | none |
| covered Lean, instances | `T^r`, `A = [T^r]` by translation; `S³`, `A` from `S³ → SO(4)`; `Sⁿ` odd, `A` from 1.4; `ℓ = 0` | `T^r`: `hcov` true with `ℓ = 1`, `hM` false; `S³`: `k = 1`, `π₃ = ℤ`, `ι ≠ 1`; `Sⁿ`: `ℓ = 2`, `ι² ≠ 1` in `π_n(Sⁿ) = ℤ`; `ℓ = 0`: `ev_*0 = 0·[M]` for every `M` | `0 < ℓ` needed; the rest agrees | none |
| "`ℓ`-torsion" | source Thm 5.10 line 4144–4145 | "not of `d`-torsion" = not annihilated by `d`; Lean `x ^ ℓ ≠ 1` | agrees | none |
| Lie-group Lean | `T¹`; `SU(2)`; the trivial group | `T¹` aspherical (path connected, `π_(n+2) = 0`), excluded; `π₃(SU(2)) = ℤ`, included; trivial group aspherical, excluded (capacity `0` anyway) | agrees | none |
| Lie-group binders | `LieGroup → IsManifold`; Hausdorff | `inferInstance` succeeds; a locally Euclidean group is `T1`, hence `T2` | no binder missing | none |
| `CP⁰`, `HP⁰` | `d = 0` | `T*pt = pt`, an admissible `F` vanishes on a nonempty open subset of a point, so `F = 0` and the capacity is `0 < ⊤` | true | none |
| spheres `n = 0, 1` | `S⁰`, `S¹` | `S⁰`: `F = a·1_{q}` is admissible (support `{q}`, vanishes on `{p}`, no orbits), capacity `∞`; `S¹ = T¹`: `∞` | `2 ≤ n` sharp | none |
| metric independence (4.5) | metrics `g`, `g′`, `λ = max ‖·‖_g/‖·‖_{g′}` | `D*_gQ ⊆ λD*_{g′}Q`; the inclusion is `π₁`-injective (both retract to the zero section), so admissible on the smaller is admissible on the larger; `c(λW, ω) = c(W, λω) = λc(W, ω)` | finiteness transfers | none |
| `π_(n−1)(SO(n))` values | `n = 3, 5, 7, 9, 11, 13, 15` | `π₂(SO(3)) = π₂(S³) = 0`; `π₈(SO(9))`: `(ℤ/2)³ = π₈(SO(8)) ↠ π₈(SO(9))` (`∂ι₈` of infinite order), stabilization onto `ℤ/2` split with kernel `ℤ/2` (`css-derivative` 222), so `(ℤ/2)²`, not `ℤ/4` | agrees; refutes the source | none |
| splitting controls | `n = 7`; `n = 3`; `n = 17, 19` | `π₆(O) ⊕ π₇(V_(9,2)) = 0 ⊕ ℤ/2 ≠ π₆(SO(7)) = 0` (connecting map of `S⁷ → V_(9,2) → S⁸` is `χ(S⁸) = 2`); `n = 3`: `0 ⊕ ℤ/2 ≠ 0`; `n = 17`: `ℤ/2 ⊕ ℤ/2`; `n = 19`: `0 ⊕ ℤ/2` | range `n ≥ 17` needed; values as stated | none |
| `isOfFinOrder_pi_SO` | `k = 0, 1, 6` | `Odd 3`: `π₂(SO(3)) = 0`; `Odd 4` false, excluding `π₃(SO(4)) = ℤ²`; `π₈(SO(9))` exponent 2 | agrees | none |
| 1.4 degree | `n = 1, 2, 3` | `1 + (−1)^(n−1) = 2, 0, 2`; `H₂(SO(3); ℤ) = 0` for `n = 2`; `H₃(SO(4)) = ℤ²` for `n = 3` | agrees | none |
| 1.3 projective convention | `d = 1, 2` | stabilizer of `[e_d]` is `diag(U(d), U(1))`; `d ≥ 2`: `diag(A, 1)e₀ = e₁` breaks `[g e₀]` | agrees | none |
| 1.3 quaternionic model | `v = (1, j)`, `λ = i` | `vλ = (i, ji) = (i, −k)`; `iv = (i, ij) = (i, k)` | right quotient needed | none |
| 1.3 curvature and area | `CP¹` radius ½ | circumference `π`, curvature `4`, area `π`; `ω_g = π·ω_FS` with `∫ω_FS = 1` | agrees | none |
| 1.5 | `N = ∅`; framed point; `S¹ ⊂ S³` | degree `0`; `±1` by framing; `Th(ν) = S¹₊ ∧ S² = S² ∨ S³` | agrees | none |
| 1.2 ring | `n = 2, 3` | `ℤ` in every degree, `x² ≠ 0`; even degrees only | agrees | none |
| 2.1 indices | `CPᵈ`, `HPᵈ` | `(2k−1) + (k−1)(2d−2) = 2d(k−1) + 1`; `3(2k−1) + (k−1)(4d−4) = 2(k−1)(2d+1) + 3` (source 5285) | agrees | none |
| 2.2 cells | `d = 1, 2` | `b_k = 2d(k−1) + 1 + 2d − 1 = 2dk`; `d = 2`: `0, 1, 4, 5, 8, 9`, `a₂ − b₁ = 1` | agrees | none |
| 2.3 gaps | `d = 1, 2` | `a_(k+1) − b_k = 2(2d+1) − (4d − 1) = 3`; `3, 10, 13, 20` | agrees | none |
| 2.5 `CP²` | fibre classes | `E_(0,4)` killed by `d₄` from `E_(4,1) = ℤ`; `E_(0,5)` by `d₂` from `E_(2,4)`; total degrees drop by one | agrees | none |
| 2.6 dimensions | `CPᵈ`, `HPᵈ` | `2d − 1 → 2d`; `(4d − 1) + 2 = 4d + 1 → 4d + 2` | agrees | none |
| 4.1 products | `deg α = dim M` | `deg(α × [N]) = dim(M × N)`; shriek `j_!α × 1 ≠ 0`; constant spheres have reduced shriek `0` | agrees | none |
| 4.2 degrees and Serre | even `n`; `n = 4k − 1`; `2n`-connected `B` | `3n − 3`; `2n − 2`; `π_i(Ω²B) = 0` for `i ≤ 2n − 2`, every `d_r` into `E_(0,q)`, `q ≤ 2n − 3`, has `2 ≤ r ≤ 2n − 2` and vanishes | agrees | none |
| 4.4 `ℝP²` | `H = {diag(A, det A)}`, `α` of lift-degree 1 | reflection `diag(A, −1)` lifts to `diag(−A, 1)` of degree `−1`; components `+1`, `−1`; sum `≠ 0`; `χ = −1`, coorientation `−1`, product `+1` | hypothesis holds; capacity conclusion only | none |
| 4.4 `dim H = 0` | finite `H` | shriek of degree `0`, reduced condition can fail | hypothesis needed | none |
| 4.4 degree bound | `dim H > 0` | `deg β = dim G + deg α > dim G − dim H = dim M` | agrees | none |
| 4.6 bounds | `Q = Sⁿ`, `k = n`, `Y = pt`; `Q′ = Tⁿ`, `k ≥ 3` | `n ≥ 3n − 1` false (now a stated Check); `π₂(Tⁿ # (S^k × Y)) = 0`, rationally essential | agrees | none |
| 3.3 sign | `T*ℝ²`, `σ = q₁dq₂` | `Ψ'^*λ = λ − π^*σ`, `−d` gives `ω_can + π^*dσ`; `+dλ` would give `ω_can − π^*dσ` | agrees | none |
| 3.1 torsion | `α` of order `N` | `f_*[∅] = 0 = Nα` | agrees; excluded by 3.2 | none |
| 3.2 supplier hypothesis | `S` from B6.3 | smooth closed oriented; Thm 5.10 needs smooth (4141) | sentence wrong, route right | R02 |
| base numbering at #1798 | Layer 4 item 5; Layer 3 item 4 | 4.1; Tau Ceti `RankOneLocalSystem` | citations break at the merge | R03 |

## Not verifiable

- W. Ziller, *The free loop space of globally symmetric spaces*, Invent. Math. 41 (1977),
  Theorems 3 and 8: paywalled; not fetched. The indices were recomputed from conjugate points and
  agree with `bdho-cotangent` 5285.
- R. Bott, Ann. of Math. 70 (1959); Milnor, *Morse Theory*: not in the cache (JSTOR, print).
  Cited for Layer 2 background only.
- Hatcher, *Algebraic Topology*, Theorem 3.26, §4.2 and §4.J; Milnor–Stasheff Chapter 5;
  Steenrod Part I §7; Pontryagin Chapter II: not fetched. The facts cited are standard and were
  checked mathematically (the top homology of a nonorientable closed manifold vanishes; the
  James model of `ΩSⁿ`; Stiefel fibrations).
- [Jap87] Tables 6.VII–6.VIII, the source's reference for Lemma 6.35: not available. The values
  were checked by exact sequences and `css-derivative`.
- BDHO, *Morse homology with DG coefficients*, Chapters 5–13: not reread; the DG Morse inputs are
  consumed from DGFloer.
- The HomotopySpheres pull request #284 and the DGFloer pull request #963: not given with their
  files; ownership against them was not checked.

## Source issues

- **Error** in bdho-cotangent at proof of Lemma 6.35, printed page 117: the source reads
  `π₈(SO(9))` as cyclic of order four; it should be `ℤ/2 ⊕ ℤ/2` (stabilization onto `ℤ/2` is split
  with kernel `ℤ/2`, Crowley–Schick–Steimle); affects nothing.
- **Misprint** in bdho-cotangent at second proof of Proposition 6.34, printed page 118: the source
  concludes by Proposition 6.29 after showing `Sⁿ` is 2-covered; it should cite Proposition 6.33,
  the `ℓ`-covered form; affects nothing.
- **Gap** in bdho-cotangent at §7 preamble, printed page 123: the source derives `n ≥ 3k − 1` or
  `n ≥ 2k` from `ℓ`-connectivity of `Y`; it should assume `dim Y > 0`, since `Q = Sⁿ`, `Y` a point
  meets the hypotheses; affects nothing.
- **Gap** in bdho-cotangent at Proposition 6.36, printed page 119: the source concludes abundance
  for every `G/H` with `H` closed of positive dimension; Definition 6.11 needs `Q` oriented, so
  nonorientable quotients such as `SO(3)/O(2)` need an orientation twist; affects a stated result.
