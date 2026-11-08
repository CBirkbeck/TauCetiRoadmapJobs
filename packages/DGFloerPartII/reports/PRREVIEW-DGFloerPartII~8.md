# Review of DGFloerPartII (pull request #1799 at d1b2ba2)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/DGFloerPartII/README.md` (1733 lines) and
`TauCetiRoadmap/DGFloerPartII/Suggested.lean` (337 lines, 28 declarations). The gate passes, the
dependency check reports no problem, and the Lean file elaborates with exactly 24 `sorry` warnings
and no error. Of the previous review's four findings, two are repaired in the README (R02, R03)
and two concern the pull request description and are not repaired (R01, R04). This head no longer
cites HomotopySpheres. It now owns the convenient category (1.0) and real Bott periodicity
(4.2a–4.2c) itself; the ownership section below says why that is correct here.

One finding is blocking: R01, an ordering against DGFloer's open revision that nothing in the
folder can repair. The other six are P3 repairs.

Source ids: `bdho-cotangent` is arXiv:2404.07953v3, 139 pages; the printed page is the footer at
the end of each page. `css-derivative` is arXiv:2012.13634v1. Eschenburg–Hanke, arXiv:1610.04385v2,
was read for this review through the sources service. It is not in the roadmap's manifest, and
this review edits no manifest.

## R01 (P2) — Re-raised: DGFloer on main still owns Theorem B's realization and Layer 4

Re-raised: R01 of the previous review (R06 and R01 before it). No repair report was available
giving a reason for leaving it.

**Location.** README lines 38–43: "every numbered statement of its §§6.3–6.4 and §7, and the
carriers, comparisons and explicit maps those statements consume". Also Layers 3–4, and the
description's merge-order paragraph.

**Claim.** This roadmap is the only owner of Theorem B's multiple realization, of §§6.3–6.4
and of §7.

**Witness.** Main's `TauCetiRoadmap/DGFloer/README.md` (3b3f7ef) line 1567 has "Multiple
realization and Theorem5.14/TheoremB", and line 1577 has "Layer 11: manifolds abundant with
2-spheres, and knotted hypersurfaces". DGFloer's revision #1798 (63e59c6c) drops both: see its
10.5 (line 3987), its Layer 11 (line 4109) and line 54.

The description's merge order ends "#1742 (GeneralAlgebraicKTheoryPartII) → **this pull
request**" and does not name #1798.

**Repair.** Nothing in the folder. The description's merge-order paragraph should say that
DGFloer's revision #1798 merges before this pull request. That is an ordering, not a supplier
dependency: the README cites DGFloer by layer and item, and every cited id resolves both on main
and at #1798. Checked: Layer 4 item 5 is #1798's §4.1, which the README already names; Layer 11
is the finite cover in both versions.

## R02 (P3) — 4.2: the negative control of the Serre-comparison Check is wrong

**Location.** README lines 1166–1169: "a base that is only `(2n−1)`-connected would allow
`r = 2n − 1 > 2n − 2` and the argument would fail at `q = 2n − 3`."

**Claim.** The failure mode for a `(2n−1)`-connected base is a differential `d_(2n−1)` into
`E_(0,2n−3)`.

**Witness.** A differential into `E_(0,q)` starts at `E_(r,q−r+1)`, which needs `r ≤ q + 1`. For
`q = 2n − 3` that means `r ≤ 2n − 2`, so `r = 2n − 1` never occurs. What a `(2n−1)`-connected base
actually allows is `d_(2n−2) : E_(2n−2,0) → E_(0,2n−3)`. Take `n = 2`, `B = S⁴`:
`H₂(Ω²S⁴) = π₄(S⁴) = ℤ`, so `d₂ : E_(2,0) → E_(0,1)` is no longer excluded.

**Repair.** Replace the clause after the semicolon with: "for a base that is only
`(2n−1)`-connected, `H_i(Ω²B) = 0` only for `1 ≤ i ≤ 2n − 3`, so `E_(2n−2,0) = H_(2n−2)(Ω²B)` may
be nonzero and `d_(2n−2) : E_(2n−2,0) → E_(0,2n−3)` is no longer excluded (for `n = 2`,
`B = S⁴`: `H₂(Ω²S⁴) = ℤ`)." Tested on `n = 2`, `B = S⁴` as above.

## R03 (P3) — Suggested.lean: two Layer 1 declarations are padding

**Location.** `Suggested.lean` lines 88–90 (`isGeneratedBy_compHaus_iff`) and 103–105
(`isGeneratedBy_compHaus_prod`); README lines 407 and 436 name them.

**Claim.** These are statements the finished roadmap is tested against.

**Witness.** The one-tactic probe, in a scratch copy elaborated with `lake env lean`, closes both:

- the first by
  `rw [Topology.IsGeneratedBy.iff_le_generatedBy, TopologicalSpace.generatedBy_eq_coinduced]; exact ⟨fun h => ⟨h⟩, fun h => h.1⟩`,
  which only unfolds the two definitions;
- the second by
  `inferInstanceAs (Topology.IsGeneratedBy (fun K : CompHaus.{u} ↦ K) (CompHaus.of (K × L)))`,
  which is Mathlib's instance `IsGeneratedBy X (X i)` (`Mathlib/Topology/Convenient/GeneratedBy.lean:204`).

**Repair.**

- Delete both declarations from `Suggested.lean`.
- In README 1.0, keep both statements as prose but drop the backticks on the two names.
- In the docstring of `compactlyGeneratedToTop_isLeftAdjoint` (line 94), replace "transported
  along `isGeneratedBy_compHaus_iff`" with "transported along the equality of the two full
  subcategories".
- Shorten the module docstring's first bullet (lines 24–30) to match.

Tested: `infer_instance` fails on `compactlyGeneratedSpace_prod` and on
`compactlyGeneratedToTop_isLeftAdjoint`. Neither is in Mathlib at the pin, so keep both.

## R04 (P3) — 1.0 and 4.2c restate AlgebraicTopology Stage 4 item 5 instead of citing it

**Location.**

- README lines 453–461 (1.0): "Prove that every compact subset of `X_∞` lies in some `X_r`; so
  continuous maps from a compact Hausdorff space into `X_∞`, and homotopies between them, factor
  through a finite stage".
- Lines 1340–1342 (4.2c): "Prove that `Ω_(k+1)` and `Λ_k` have CW type (the first is a
  sequential colimit of compact manifolds along smooth closed embeddings…".

**Claim.** No earlier roadmap owns these.

**Witness.** Main's `TauCetiRoadmap/AlgebraicTopology/README.md`, Stage 4 item 5:

- line 683 owns `cofibrationTowerHomotopyEquivalence` (mapping telescopes of closed-cofibration
  towers of Hausdorff spaces, compared with their colimits);
- line 696 reads "Prove that every compact subset, or map from a compact Hausdorff space, in the
  final-topology union factors through a finite stage";
- line 700 owns `cwSubcomplexTowerUnion`.

**Repair.**

- In 1.0, cite AlgebraicTopology Stage 4 item 5 for the finite-stage factorization and drop the
  restated proof obligation. Keep the `T₁`, closed-embedding form only if a consumer needs it,
  with one clause saying how it differs. None does: 4.2a and 4.2c use compact Hausdorff stages
  joined by smooth closed embeddings, and those are closed cofibrations through GeometricTopology
  Layer 1's tubular neighbourhoods.
- In 4.2c, take the CW type of `Ω_(k+1)` from `cofibrationTowerHomotopyEquivalence`. Its stages
  are compact manifolds of finite CW type (AlgebraicTopology, line 68).
- Add "AlgebraicTopology Stage 4 item 5" to the *Needs:* lines of 1.0 and 4.2c and to the Scope
  table's AlgebraicTopology row.

Tested on `O = colim O(r)`: each `O(r) → O(r+1)` is a smooth closed embedding of compact
manifolds, hence a closed cofibration, so the cited item applies.

## R05 (P3) — Pinned Tau Ceti declarations the README uses without citing

**Location.**

- The Tau Ceti contract (lines 196–247) lists none of the three declarations below.
- 4.2b line 1228: "fix a module over the Clifford algebra `Cl₈` … the irreducible `Cl₈`-module
  being `16`-dimensional".
- 4.2c lines 1286–1287 (the table of `m_j`) and line 1306 ("since `k + 1 ≢ 3 (mod 4)` the `M_h` are
  mutually isomorphic").
- Lines 97 and 354–355 take "the inclusion `O(n+1) → Diff(Sⁿ)`" from GeometricTopology Layer 3.
- 3.3 lines 1050–1059 compute the magnetic sign by hand.

**Claim.** These inputs come from the named roadmaps, or need no supplier.

**Witness.** Each exists at the Tau Ceti pin:

- `TauCeti.realClifford_classification` (`TauCeti/LinearAlgebra/CliffordAlgebra/Classification.lean:339`);
- `TauCeti.continuousOrthogonalToDiffSphere` (`TauCeti/Geometry/Diffeomorphism/Sphere.lean:315`);
- `TauCeti.CotangentBundle.mpullback_vectorBundleTranslateDiffeomorph_symplecticForm`
  (`TauCeti/Geometry/Symplectic/Cotangent/Bundle/Fiberwise.lean:114`), which proves
  `τ_α^*ω = ω − π^*dα`.

**Repair.**

- Add all three to the Tau Ceti contract with their files.
- Derive `m_j` and the count of irreducible modules from the first, and add it to the *Needs:*
  lines of 4.2b and 4.2c.
- In 4.3, cite the second for the inclusion. Keep GeometricTopology Layer 3 for the
  topological-group structure, which the pin lacks.
- In 3.3's sign Check, cite the third.

Tested:

- In `realCliffordForm 0 j` the residue is `j mod 8`. `j = 8` gives `M₁₆(ℝ)`, so `m₈ = 16`. `j = 3`
  and `j = 7` give split products, two irreducible modules each, matching the `k + 1 ≢ 3` clause.
- Taking `α = −σ` gives `ω + π^*dσ`, which is 3.3's formula.

## R06 (P3) — Locators: 1.0 cites three sources without theorem or section, and 1.4 uses an unknown source id

**Location.**

- README lines 495–498: "Sources: N. Steenrod, *A convenient category of topological spaces*,
  Michigan Math. J. 14 (1967); N. Strickland, *The category of CGWH spaces*; M. Escardó, J.
  Lawson, A. Simpson, …".
- Line 708: "(bdho-floer, second proof of Proposition 6.34)".

**Claim.** Every claim carries a locator at the claim.

**Witness.** Three claims in 1.0 carry no theorem or section number: the exponential law, the
product with a locally compact Hausdorff space, and the pointed closed monoidal structure. Only
Hatcher A.6 and Munkres §22 have locators. The id `bdho-floer` is in no manifest: the roadmap's
ids are `bdho-cotangent` and `css-derivative`. 1.4's statement is the paper's second proof of
Proposition 6.34 (`bdho-cotangent` lines 5130–5135).

**Repair.**

- Put a theorem or section locator from the version read at each of those 1.0 claims, or cite
  AlgebraicTopology Stage 4 item 5 where R04 applies.
- At line 708, replace "bdho-floer" with "the source paper".

Tested: lines 5130–5135 give the degree `1 + (−1)^(n−1)` with preimages `(u, θ)` and
`(−u, 2π − θ)`, as 1.4 states.

## R07 (P3) — The pull request description is stale

This is R04 of the previous review, not repaired, with one new stale sentence.

**Location.**

- The description's last paragraph: "`Suggested.lean` states the rotation family at a fixed
  pole, the low-rank values of `π_(n−1)(SO(n))` and its torsion for odd `n`."
- "Why Tau Ceti wants it": "HomotopySpheres' James construction and Bott periodicity".

**Claim.** The description describes this head.

**Witness.** `Suggested.lean` states no rotation family. It states:

- 1.0's lemmas (lines 88–114);
- Theorem B (line 128);
- five capacity theorems (lines 149–232);
- the finite-to-stable range (lines 264, 271);
- Bott periodicity in finite rank (lines 278–299);
- Lemma 6.35 (lines 305–335).

The README cites no HomotopySpheres. It owns Bott periodicity (4.2c) and takes the James
construction from GeneralAlgebraicKTheoryPartII §4.30b.

**Repair.** Regenerate both paragraphs from the module docstring (lines 22–71) and the README
Summary (lines 16–24). Also name #1798, as R01 asks.

## Previous findings

- **R01 (P2, DGFloer on main owns the same material): not repaired.** The merge-order paragraph
  still omits #1798. Re-raised as R01.
- **R02 (P3, 3.2 misdescribed `S` in Theorem 5.10): repaired.** Lines 1007–1010 now read "takes
  `φ` continuous on a closed smooth oriented `n`-manifold `S` (the source's Theorem 5.10, whose
  Umkehr map is built from Morse data on `S`)". Lines 981–982 now read "a closed smooth oriented
  manifold `S` (a finite disjoint union)".
- **R03 (P3, base numbering): repaired.** Lines 267–269 add "(the base's §4.1 where it numbers its
  sections; cited below as Layer 4 item 5)", and lines 878, 892 and 959 follow it. The rank-one
  twist is now Tau Ceti `TauCeti.RankOneLocalSystem` with `twistedCochainComplexIso` (contract,
  lines 212–218; 4.4's *Needs:*, line 1526).
- **R04 (P3, stale description): not repaired.** See R07.

## Verified sound

**Gate and build.**

- Every scanner in the worker's gate is 0, including `depcheck=0`, `build=0`, `outside-folder=0`
  and `stray-files=0`.
- The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- The dependency check on this head:

      depcheck: 244 roadmaps, 2465 edges, 0 problem(s)

  TangentialBordism is merge-order line 15, GeneralAlgebraicKTheoryPartII line 332 and
  DGFloerPartII line 333. Every other supplier is on main.
- `lake env lean` on `Suggested.lean` gives 24 "declaration uses `sorry`" warnings, at lines 88,
  95, 103, 111, 128, 149, 164, 182, 212, 225, 264, 271, 278, 284, 291, 297, 305, 308, 311, 315,
  319, 323, 327 and 334. No error.
- Pins: Mathlib 1b1ccf4b, Tau Ceti 2fd255d9.
- Form:
  - `public import Mathlib` plus eleven `TauCeti.*` modules, all present at the pin;
  - one module docstring and `namespace TauCetiRoadmap.DGFloerPartII`;
  - `theorem` only, with no `set_option`, no `#eval` and no sorry'd data;
  - the definitions `SO`, `soBlockInclusion` and `instIsManifoldRealComplexProjectiveSpace` have
    real bodies, and `soBlockInclusion_one` is proved (`ext; simp`);
  - the file has no section `variable`, so no binder can be dropped.

**Signatures.** A scratch file importing the built module ran `#check @` on the ten new
declarations and on `soBlockInclusion`. Each elaborated type matches its README sentence:

- `isGeneratedBy_compHaus_iff`: `(Y : Type w)` with the family `fun K => ↑K.toTop` of `CompHaus.{u}`.
- `compactlyGeneratedSpace_prod`: `{X Y : Type u}` with `[CompactlyGeneratedSpace X]`
  `[LocallyCompactSpace Y]` `[T2Space Y]`.
- The range theorems are `HomotopyGroup.map (soBlockInclusion n) ⋯`, under `i + 2 ≤ n` and
  `i + 1 ≤ n`.
- The Bott theorems take `j % 8` conditions with `j + 3 ≤ m`, and `j + 11 ≤ m` for periodicity.

The sixteen declarations left unchanged since `17ee91f` match the worker's signature file. The
signature file's entries `of` and `on` are parsing artefacts of docstring text, not declarations.

**Library declarations opened at the pins**, by file and line:

- Mathlib:
  - `Topology.IsGeneratedBy` (`Topology/Convenient/GeneratedBy.lean:133`), with
    `iff_le_generatedBy` (150), the instance `IsGeneratedBy X (X i)` (204), and `Quot.`, `Sum.` and
    `Sigma.isGeneratedBy` (257, 267, 272);
  - `TopologicalSpace.generatedBy` (51) and `generatedBy_eq_coinduced` (55);
  - `Topology.ContinuousMapGeneratedBy.curryEquiv` (`Convenient/HomSpace.lean:96`, with its
    hypotheses at line 92: locally compact members, pairwise products generated) and `ev` (120);
  - `GeneratedByTopCat.adj` (`Convenient/Category.lean:297`) and `TopCat.toGeneratedByTopCat` (277);
  - `TopologicalSpace.compactlyGenerated` and `UCompactlyGeneratedSpace`
    (`Compactness/CompactlyGeneratedSpace.lean:68, 91`); the sequential instance (211); the
    instance for weakly locally compact Hausdorff spaces (355);
    `to_compactlyCoherentSpace` (365) and `of_compactlyCoherentSpace_of_t2` (370);
  - `CompactlyGenerated.compactlyGeneratedToTop` (`Topology/Category/CompactlyGenerated.lean:78`),
    which has no adjunction at the pin;
  - `Topology.IsQuotientMap.continuous_lift_prod_left` (`Topology/CompactOpen.lean:587`).
- Tau Ceti:
  - `subsingleton_homotopyGroup_sphere_of_lt` and `homotopyGroupSphereAddEquiv`
    (`AlgebraicTopology/Sphere/HomotopyGroup.lean:66, 110`);
  - `HomotopyGroup.map` (`Topology/Homotopy/HomotopyGroup/Map.lean:45`);
  - `HomotopyGroup.pathLoopSpaceMulEquiv` (`…/LoopSpace.lean:321`);
  - `RankOneLocalSystem.twistedCochainComplexIso` (`AlgebraicTopology/DGLocalSystem/RankOne.lean`);
  - `TauCeti.Diff` (`Geometry/Diffeomorphism/Group.lean:214`): a bare group. No topological-group
    instance exists, as the README says at line 236.
  - The three declarations of R05.

**Cross-roadmap citations resolved.**

- **GeneralAlgebraicKTheoryPartII at #1742 (8a4b822a), §4.30b (lines 1208–1241).** It supplies
  everything 1.2 consumes:
  - the James reduced product with its universal property and word filtration;
  - the CW structure for a Hausdorff CW complex `W` whose base point is a 0-cell;
  - the James map into Moore loops of the reduced suspension `(W×I)/(W×∂I∪{w₀}×I)`, a weak and a
    homotopy equivalence for connected `W`, homotopic to the unit on `J₁W`;
  - "for every commutative ring R such that H̃_*(W;R) is a flat R-module" the tensor algebra, and
    the same for `ΩΣW` through the James equivalence.

  It applies to `W = S^(n−1)`, `n ≥ 2`, with `R = ℤ`.
- **AlgebraicTopology on main:**
  - Stage 8 item 5, Whitehead for spaces of CW type (line 1700);
  - item 11a, `finiteSourceMappingCWType` and `basedLoopCWType` (line 1949);
  - Stage 4.4, Stage 6 item 5, Stages 2 and 8.1–8.7, as in the previous review.
- **DGFloer:** main (3b3f7ef) and #1798 (63e59c6c), as in R01. The ids cited (Layer 0, Layer 1
  items 1–6, Layer 2, Layer 3, Layer 4 item 5, Layer 5 items 1–6, Layer 6 items 3–5, Layer 10
  items 2–5, Layer 11) resolve in both.
- **Other roadmaps on main:** GeneralizedCohomology (G4.0b at line 939, G5 and G2.10);
  LieGroups Layer 2 (line 275); RiemannianGeometry R3 (line 347); SmoothBundlesConnections;
  MorseTheory; GeometricTopology; ComplexKahlerGeometry. The citation tool lists nothing
  unresolved.
- **TangentialBordism at #942:** B5.1, B5.5 and B6.3, unchanged from the previous review.

**Ownership.** This head owns the convenient category (1.0) and the stable orthogonal groups with
real Bott periodicity (4.2a–4.2c). Searching by object found no admissible owner:

- `roadmaps grep` for "real Bott periodicity" and "stable orthogonal group" finds only
  HomotopySpheres (#284; #1287 §§4A–4B). This brief forbids HomotopySpheres as a supplier.
- The coreflection and the suspension–loop adjunction are assigned on main by AlgebraicTopology
  (lines 113–118) to "HomotopySpheres §3A.1". AlgebraicTopology's open revisions #1652 and #1663
  move them to its own Stage 4 item 8. A revision of an existing roadmap is never a supplier, and
  main's text points at a forbidden one.

So this roadmap is the owner at this point. TopologicalKTheory, OperatorKTheory and
SpinRepresentations own complex, operator and Clifford-algebra periodicity, which this roadmap
excludes (line 111). Two facts for the operator follow: HomotopySpheres #1287 still lists
DGFloerPartII as a consumer of its 3A.2, 3B and 4A–4B (its line 3144), and #1652/#1663 claim
1.0's objects for AlgebraicTopology. Neither can be repaired from this folder. The overlap report
lists no pull request that changes this folder and no dropped id; confirmed. The DGFloer pull
request #963 and the HomotopySpheres pull request #284 were not checked against their files
beyond the grep above.

**Seeded source sample.**

| Target | Locator checked | Result |
| --- | --- | --- |
| 1.0 | Mathlib declarations above; Munkres §22 Example 7 (product of quotient maps); Hatcher A.6 (cited) | the claims about Mathlib hold at the pin; the 1.0 locators are missing (R06); one part restates AlgebraicTopology (R04) |
| 1.1 | metrizability of `C(Y,Z)` for compact metrizable `Y`; Mathlib's sequential instance (`CompactlyGeneratedSpace.lean:211`) | as stated |
| 1.3 | Prop 6.38 proof, `bdho-cotangent` 5221–5227: homogeneous metric, totally geodesic complex line, frame `(v, Iv)` | as stated |
| 2.1 | 5283–5286: `C_k ≅ T¹_pHPⁿ`, dimension `4n − 1`, index `2(k−1)(2n+1)+3` [Zil77, Thm 3] | as stated; the `CPᵈ` index is recomputed below |
| 2.2 | 5234–5239: Ziller perfectness, twice the fundamental class of `T¹_pCPⁿ`, index 1 | supports the factor 2; the rank-count route is the README's own |
| 2.3 | 5287–5310: `H_(4n+2)(Ω_pHPⁿ) ≅ ℤ`, fibrewise degree `±2` | as stated |
| 2.4 | the README's own construction (no source claim) | checked by the `CP¹` total-space computation below |
| 3.2 | Thm 5.14, 4267–4279 (Thom II.29, `d = Nb`); Thm 5.10, 4140–4150 (smooth `S`); Thm B, 243–246 | hypotheses identical; orientability implied |
| 3.3 | Cor D, 265–292 (transported by `Ψ`, projection unchanged); Cor E, 304–307 | as stated |
| 4.1 | Def 1.7, 415–423; Def 6.11, 4517–4523; Thm 6.12, 4525–4528; Prop 6.13, 4608–4616 | identical |
| 4.2 | Def 6.14, 4621–4632; Prop 6.15, 4633–4643 (degree `dim Q + dim Σ_p`) | identical; one negative-control Check is wrong (R02) |
| 4.2b | Eschenburg–Hanke §3, lines 247–293 (centrioles as Clifford systems; one irreducible module unless `k ≡ 3 mod 4`; table of `S_k`) | as stated; `m_j` agrees with the table |
| 4.2c | Eschenburg–Hanke Thm 4 and proof, lines 299–408 (Case 1: `r − 1` pairs at `t = 1/b`; Case 2: `J₀ = J₁⋯J_(k−1)`, winding `½ tr A/i`); lines 225–236 (index `≥ 2n − 2` in `SO(2n)`) | as stated; the explicit bound `(s − |c|)/4` is the README's sharpening, checked below |
| 4.4 | Prop 6.36, 5141–5158 (`G` compact connected, `H` closed, positive dimension, no orientability) | as stated, with the two conclusions |
| 4.6 | §7 hypotheses, 5354–5364; Thm 7.1, 5366–5372; Prop 7.5, 5404 | identical |

**Adversarial table.** All values computed in this review.

| Statement | Instances | Values | Result | Change |
| --- | --- | --- | --- | --- |
| `isGeneratedBy_compHaus_iff` | the two definitions | `generatedBy = ⨆ coinduced f`, rewritten to the sigma coinduced form of `compactlyGenerated`; probe closes | true but definitional | R03 |
| `isGeneratedBy_compHaus_prod` | `K × L = CompHaus.of (K × L)` | instance `IsGeneratedBy X (X i)` applies; probe closes | true, one tactic | R03 |
| `compactlyGeneratedSpace_prod` | `X = ℝ/ℤ₊`, `Y = ℚ`; `X = pt` | `p × id_ℚ` is not a quotient map, so `X × ℚ` is not CG (`ℚ` not locally compact); `X = pt`: Mathlib's locally-compact-`T2` instance; `infer_instance` fails | hypotheses needed; not in Mathlib | none |
| `compactlyGeneratedToTop_isLeftAdjoint` | universes `u`, `w` | `GeneratedByTopCat.{w}` of `CompHaus.{u}`; unit invertible (`adjUnitIso`, `Convenient/Category.lean:284`); `infer_instance` fails | true, not at the pin | none |
| 1.0 sequential colimits | `ℝ^∞`, points `e_r/r` | meets every `ℝ^s` in a finite set, so closed and discrete; norm `1/r → 0` | Check correct | R04 (ownership) |
| 1.1 | `Map(S², Q)` | compact metrizable source, metrizable target, so metrizable, hence CG, so the counit is a homeomorphism | as stated | none |
| 1.3 dimensions | `V_(n,2)`, `U(n)/U(n−2)` | `n(n−1)/2 − (n−2)(n−3)/2 = 2n − 3`; `n² − (n−2)² = 4n − 4` | as stated | none |
| 1.3 quaternions | `v = (1, j)`, `λ = i` | `vλ = (i, −k)`, `iv = (i, k)` | right quotient needed | none |
| 1.4 degree | `n = 1, 2, 3`; matrix | `1 + (−1)^(n−1) = 2, 0, 2`; `Rp = p + (cos θ − 1)p + sin θ·u = cos θ·p + sin θ·u` | as stated, as the source (5133–5134) | none |
| 2.1 indices | `CPᵈ`, `HPᵈ` | `(2k−1)+(k−1)(2d−2) = 2d(k−1)+1`; `3(2k−1)+(k−1)(4d−4) = 4dk+2k−4d+1 = 2(k−1)(2d+1)+3` | as stated | none |
| 2.2 cells | `d = 2` | `a_(k+1) − b_k = 1`; cells `0, 1, 4, 5, 8, 9` = `H_*(S¹ × ΩS⁵)` | as stated | none |
| 2.3 gaps | `d = 1, 2` | successive gap 3; within a level `4d − 1 ≥ 3`; `d = 2`: `3, 10, 13, 20` | the degree argument is valid | none |
| 2.4 | `CP¹` | `E² = H_*(S²) ⊗ ℤ[x]`, `d²: E_(2,q) → E_(0,q+1)` iso; `q = 0` kills `x` | as stated | none |
| 2.6 | dimensions | `dim Σ_p = 2d − 1` → `H_(2d)`; `(4d−1)+2` → `H_(4d+2)`; source 5262: `dim Σ = 8n + 1` | as stated | none |
| Theorem B (Lean) | `T^r`; `ℝP³`; `S²`; `c < min F`; nonorientable `Q` | all `π_ℓ = 0`: `hQ` false; `π₃ = ℤ`; `π₂ = ℤ`; `U = ∅`, `H_n = 0`; `H_n(Q;ℤ) = 0` | true where it should apply, vacuous elsewhere | none |
| `¬ IsMulTorsion` versus Thm 5.14 | definition | negation gives an element of infinite order, as in 4268–4269 | agrees | none |
| 3.3 sign | `T*ℝ²`, `σ = q₁dq₂` | `−d(p₁dq₁ + (p₂ − q₁)dq₂) = ω_can + dq₁∧dq₂`; Tau Ceti `τ_α^*ω = ω − π^*dα` at `α = −σ` gives the same | agrees | R05 (citation) |
| 4.1 products | `deg α = dim M` | `deg(α × [N]) = dim(M × N)`; `σ_*[Q]` has reduced shriek 0 | as stated | none |
| 4.2 degrees | even `n`; `n = 4k − 1` | `n + (2n−3) = 3n − 3`; `n + (n−2) = 2n − 2` | as stated | none |
| 4.2 Serre control | `q = 2n − 3`; `n = 2`, `B = S⁴` | needs `r ≤ q+1 = 2n−2`; `E_(2n−1,−1) = 0`; `H₂(Ω²S⁴) = ℤ` | the stated mechanism is false | R02 |
| 4.2a range (Lean) | `n = 0, 1, 2, 3` | `n = 0`: hypotheses impossible; `n = 1`, `i = 0`: two points, onto; `π₁: ℤ → ℤ/2` onto, not injective; `π₃(SO(3)) = ℤ → ℤ²` not onto (`i = r`) | bounds sharp | none |
| 4.2a `U`, `Sp` | `r = 1` | `i ≤ 2r − 1 = 1`: `π₁(U) = ℤ`; `i ≤ 4r + 1 = 5`: `π_i(Sp) = π_i(S³)` | as stated | none |
| 4.2b | `Cl₈`; dims; `γ_J`; `k = 3`; `m = 1` | Tau Ceti residue 0 gives `M₁₆(ℝ)`; `128m² − 8m − 64m² = 64m² − 8m = n²/4 − n/2`; `A = J_k⁻¹J`, `A² = −I`; `J₁J₂J₃` a symmetric involution anticommuting with `J₄`, eigenspaces `8m`; `Ω₇(16) = pt ⊔ S¹ ⊔ pt` | as stated | R05 (citation) |
| 4.2b stabilization | `γ_(J ⊕ J_(k+1))` | `= γ_J ⊕ γ_(J_(k+1))`; Grassmannian `p → p + 2` (`k = 3`), `p → p + 1` (`k = 7`) | as stated | none |
| 4.2c, `k = 0` | one `±3i` pair | `ad A` eigenvalues `±4i`, `±2i` on each other plane: `K_A = 4` (×2), `1` (×2); index `2(8m−1) = n − 2 ≥ λ₀ = 8m − 1` | as stated (E–H 232–236) | none |
| 4.2c, `k = 2, 6` | winding; bound | `w = c·m_k/4` (`m₂ = 4`, `m₆ = 8`); `det_ℂ(−I) = (−1)^(8m) = 1`; `2·index ≥ p`, `2p ≥ s + c ⟺ Σ|a_h| ≥ s` | `λ_k(c) = (s − |c|)/4` correct | none |
| 4.2c, `k = 7`, `m = 1` | circle `G₁(ℝ²)` | `λ₇ = 0`; geodesics on a circle have no conjugate points | Check correct | none |
| 4.2c stable groups | `π₀(Ω_i)`, `i = 1..8` | `2, 1, ℤ, 1, 1, 1, ℤ, 2`, giving `ℤ/2, 0, ℤ, 0, 0, 0, ℤ, ℤ/2`; `π₁(U/Sp) = π₁(U)` since `π₁(Sp) = π₀(Sp) = 0` | as stated | none |
| Bott theorems (Lean) | `j = 0..7`, smallest `m` | `π₂(SO(4))`, `π₄(SO(6))`, `π₅(SO(7))`, `π₆(SO(8))` all 0; `π₁(SO(3))`, `π₈(SO(10))` are `ℤ/2`; `π₃(SO(5))`, `π₇(SO(9))` are `ℤ`; `π₉(SO(11)) = ℤ/2 = π₁` | true | none |
| Bott bounds sharp | `m = j + 2` | `π₃(SO(4)) = ℤ²`; `π₈(SO(9)) = (ℤ/2)²` | hypotheses needed | none |
| stable versus low-rank values | `n = 5, 7, 11, 13, 15` | `π₄(SO(5)) = ℤ/2`, stable 0 needs `m ≥ 6`; `π₁₀(SO(11)) = ℤ/2`, stable 0 needs `m ≥ 12`; and so on | no contradiction | none |
| Lemma 6.35 | `n = 9, 17, 19`; control `n = 7` | `(ℤ/2)³ ↠ π₈(SO(9))`, split onto `ℤ/2` with kernel `ℤ/2`; `ℤ/2⊕ℤ/2`; `0⊕ℤ/2`; `0⊕ℤ/2 ≠ π₆(SO(7)) = 0` | as stated; refutes the source's `ℤ/4` | none |
| 4.3 inclusion | `O(n+1) → Diff(Sⁿ)` | exists at the pin (`Sphere.lean:315`) | uncited | R05 |
| 4.4 | `ℝP² = SO(3)/O(2)`; finite `H` | `χ = −1`, coorientation `−1`, product `+1`; shriek of degree 0 | as stated | none |
| 4.5 capacity (Lean) | `CP⁰`, `HP⁰`; `S⁰`, `S¹`; `ℓ = 0`; `T^r` | capacity `0 < ⊤`; `∞`, excluded by `2 ≤ n`; `ev_*0 = 0·[M]`, excluded; `hcov` true but `hM` false | true | none |
| Lie group (Lean) | `T¹`, `SU(2)` | `T¹` aspherical, excluded; `π₃(SU(2)) = ℤ`, included | as stated | none |
| 4.6 | `k = n`; `Tⁿ # (S^k × Y)` | `Y = pt`, the bound fails (stated); `π₂ = 0` for `k ≥ 3` | as stated | none |

**Headline theorems.**

| Headline | In `Suggested.lean` |
| --- | --- |
| Theorem B (3.2, Theorem 5.14) | stated, line 128 |
| Corollaries D and E in Theorem B form (3.3) | corollaries by transport along a fibre translation, not separate headlines; the base roadmap's `Suggested.lean` (#1798) likewise omits its Theorem A forms |
| Theorem H (4.1) | not statable; docstring line 54 |
| Theorem I: spheres, Lie groups, covered manifolds, `CPᵈ`, `HPᵈ` (4.5) | stated, lines 149, 164, 182, 212, 225 |
| Theorem I: fibered families, sphere bundles, products; Proposition 6.36 | not statable; docstring lines 58–62 |
| Theorem G (4.6) | not statable; docstring lines 63–66 |
| Finite-to-stable range (4.2a) | stated, lines 264, 271 |
| Real Bott periodicity and `π_*(O)` (4.2c) | stated in finite rank, lines 278–299, equivalent through 4.2a's range; stable `O` and the Bott equivalences named in the docstring, lines 67–71 |
| Lemma 6.35 (4.3) | values at lines 305–328, torsion at line 334; the `n ≥ 17` splitting named in the docstring |

**Padding probe.** Probed with one tactic in the scratch copy: `isGeneratedBy_compHaus_iff` and
`isGeneratedBy_compHaus_prod` close (R03). `compactlyGeneratedSpace_prod`,
`compactlyGeneratedToTop_isLeftAdjoint` and `subsingleton_pi_SO_of_stable` fail under
`infer_instance`, and `surjective_map_soBlockInclusion` fails under `simp` (no progress). The
previous review's probe of the capacity theorems and the `SO` values still stands; those
declarations are unchanged.

## Not verifiable

- J. Milnor, *Morse Theory*, §§22–24, cited for Theorems 22.3 and 24.5 and Lemmas 24.1–24.4 and
  24.8: a print monograph with no legal copy found. The index argument was checked against
  Eschenburg–Hanke Theorem 4, which follows Milnor pp. 144–147 (its line 317).
- R. Bott, Ann. of Math. 70 (1959), and W. Ziller, Invent. Math. 41 (1977): paywalled, not
  fetched. Ziller's indices were recomputed and agree with `bdho-cotangent` 5285.
- N. Strickland, *The category of CGWH spaces*: the author's page failed with an SSL hostname
  error, and the copy on the nLab files area is not in a recognised licence class. N. Steenrod,
  Michigan Math. J. 14 (1967), and Escardó–Lawson–Simpson, Topology Appl. 143 (2004): not
  fetched. 1.0's mathematics was checked directly; its locators are R06.
- Hatcher, *Algebraic Topology* (Theorem 3.26, §4.2, §4.J, A.6) and Munkres, *Topology* §22: not
  fetched; the facts used are standard and were checked.
- [Jap87] Tables 6.VII–6.VIII: not available. The values were checked by exact sequences and
  `css-derivative`.
- The DGFloer pull request #963 and the HomotopySpheres pull request #284 were not given with
  their files and were checked by grep only.

## Source issues

- **Error** in bdho-cotangent at proof of Lemma 6.35, printed page 117: the source reads `π₈(SO(9))` as cyclic of order four; it should be `ℤ/2 ⊕ ℤ/2` (stabilization onto `ℤ/2` splits with kernel `ℤ/2`, Crowley–Schick–Steimle); affects nothing.
- **Misprint** in bdho-cotangent at second proof of Proposition 6.34, printed page 118: the source concludes by Proposition 6.29 after showing `Sⁿ` is 2-covered; it should cite Proposition 6.33, the `ℓ`-covered form; affects nothing.
- **Gap** in bdho-cotangent at §7 preamble before Theorem 7.1, printed page 123: the source derives `n ≥ 3k − 1` or `n ≥ 2k` from connectivity of `Y`; it should assume `dim Y > 0`, since `Q = Sⁿ` with `Y` a point meets the hypotheses; affects nothing.
- **Gap** in bdho-cotangent at Proposition 6.36, printed page 119: the source concludes abundance for every `G/H` with closed `H` of positive dimension; Definition 6.11 needs `Q` oriented, so nonorientable quotients such as `SO(3)/O(2)` need an orientation twist; affects a stated result.
- **Misprint** in arXiv:1610.04385v2 (Eschenburg–Hanke) at proof of Theorem 4, printed page 9: the source calls each minimal subspace an irreducible module over the Clifford algebra on `k` generators; it should be `k + 1` generators, as the next paragraph's comparison of those modules uses; affects nothing.
