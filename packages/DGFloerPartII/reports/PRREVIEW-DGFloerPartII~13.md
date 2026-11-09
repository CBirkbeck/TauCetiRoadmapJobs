# Review of DGFloerPartII (pull request #1799 at 58c40ae)

**Verdict:** needs changes

This is a full review of the head the previous review read. The folder has not changed since then
(0 changed lines), and neither has the pull request description.

- **Gate.** The worker's gate passes. My run fails only on `depcheck` against the unmoved board
  order; with `--movable`, and against the brief's moved order, it reports 0 problems.
- **Build.** `lake env lean` prints exactly the 23 `sorry` warnings.
- **Findings.** R01, R04 and R05 are new. R02 is the AlgebraicTopology half of the previous R01,
  now backed by two more open heads, one of which declares the same theorem as this file. R03, R06
  and R07 carry the previous review's description findings. The repair report for 58c40ae answered
  those with text for the description, and that text is not in it.

## R01 (P2) — Theorem G's route restates Lemma 7.7 for `d ≥ 2`, which leaves out `k = 2` and `k = 3`

**Location.**

- `TauCetiRoadmap/DGFloerPartII/README.md` lines 1791–1793: "Lemma 7.7 (for `d ≥ 2` and `Y`
  `(d+1)`-connected, non-torsion of `j_!β` in `H_d(Ω²Q)` transfers to `j_(Y!)s̃_*β`)".
- Theorem G itself is stated for every `k ≥ 2`: README line 1782, and `hk : 2 ≤ k` in
  `Suggested.lean` line 343.

**Claim.** The route proves Theorem G for every `k ≥ 2`.

**Witness.** `bdho-cotangent` lines 5535–5536 (printed p. 127) apply Lemma 7.7 with `d = k − 2`
(odd `k`) or `d = 2k − 3` (even `k`). That gives `d = 1` for `k = 2, 3`, which includes this
README's own Check `T⁸ # (S³ × S⁵)` (line 1839).

**Repair.** In line 1791 write "Lemma 7.7 (for `d ≥ 1` and `Y` `(d+1)`-connected, …)". Then add:

> It is applied with `d = 2k − 3` for even `k` and `d = k − 2` for odd `k`, so `d ≥ 1` for every
> `k ≥ 2`. For a `(d+1)`-connected `Y` the Serre spectral sequence of `Ω²Q → P_(Q→Y)L₀Q → Y` has
> `E²_(p,q) = 0` for `1 ≤ p ≤ d + 1`, so the fibre inclusion is an isomorphism on `H_i` for
> `i ≤ d`.

**Tested.**

- `k = 3`, `Y = S⁵`, `d = 1`. `Y` is 4-connected, so `H₁(Y) = H₂(Y) = 0` and the coefficients are
  untwisted. Then `E²_(1,0) = E²_(2,0) = 0`, nothing reaches `E_(0,1)`, and
  `H₁(Ω²Q) → H₁(P_(Q→Y)L₀Q)` is an isomorphism.
- `k = 2`, `Y = S⁴`, `d = 1`: the same argument.
- The lemma's proof (`bdho-cotangent` lines 5526–5533) uses nothing that needs `d ≥ 2`.
- The `d ≥ 1` edit passes the gate's text scanners on a scratch copy.

## R02 (P2) — AlgebraicTopology Stage 4.5 (#1808) owns 1.0's coreflection and product criterion, and declares the same theorem

This carries the AlgebraicTopology half of the previous review's R01, with new evidence.

**Location.**

- README lines 471–474: "Mathlib's coreflection `GeneratedByTopCat.adj` transports to a right
  adjoint `k` of `CompactlyGenerated.compactlyGeneratedToTop`
  (`compactlyGeneratedToTop_isLeftAdjoint`)".
- README line 488 (`compactlyGeneratedSpace_prod`).
- `Suggested.lean` lines 83–103.

**Claim.** This roadmap is the single owner of the compact-generation coreflection and of the
locally compact product criterion (README lines 45–54).

**Witness.** #1808 (55323ac), `AlgebraicTopology/Suggested.lean` line 110, declares
`compactlyGeneratedToTop_isLeftAdjoint` with this file's exact statement. Its README line 138 makes
Stage 4.5 the owner, and says any convenient category "consumes it rather than constructing a
second one".

**Context.**

- #1808 also takes the product criterion: its README lines 940–941 state `k(X×Y) = X×Y` for
  compactly generated `X` and locally compact Hausdorff `Y`.
- #1807 (92defa2) gives AlgebraicTopology Stage 4.5 the same coreflection (its line 139).
- #1652 (Layer 4.8, line 137) and #1663 (Stage 4 item 8, line 134) each claim it as well.
- Main's AlgebraicTopology assigns it to HomotopySpheres §3A.1 (lines 117–118). That roadmap
  cannot be cited here, which is why 1.0 currently owns it.
- AlgebraicTopology supplies this roadmap (Stages 2, 4, 6 and 8), so it cannot consume 1.0 back.
  The settled owner is therefore AlgebraicTopology, the one earlier in the order.

**Repair.**

- **`Suggested.lean`.** Delete `compactlyGeneratedToTop_isLeftAdjoint`,
  `compactlyGeneratedSpace_prod`, the `Layer 1` section comment, the first docstring bullet and
  the now unused `universe u w`.
- **README 1.0, "The coreflection" bullet (lines 466–482).** Replace it with:

  > Consume AlgebraicTopology Stage 4.5's coreflection `k`, the right adjoint of
  > `CompactlyGenerated.compactlyGeneratedToTop` for all universes `u` and `w`, which puts
  > `TopologicalSpace.compactlyGenerated` on a space, with the identity map `kY → Y` as counit,
  > and its comparison `k(X × Y) = X × Y` for compactly generated `X` and locally compact
  > Hausdorff `Y`. On Hausdorff spaces `k` agrees with Mathlib's `CompactCoherentification`
  > through the instances recalled in the Mathlib contract.

- **README line 488.** Write "(AlgebraicTopology Stage 4.5; Strickland, Proposition 2.6; Rezk,
  Proposition 7.3)".
- **README line 603.** Write "only under the product criterion of 1.0".
- **README lines 45–54, line 100 and the AlgebraicTopology contract (lines 410–425).** Move the
  coreflection and the product criterion out of "Owned here" and into the AlgebraicTopology row
  and contract, as Stage 4.5.
- **Description, merge-order paragraph.** Add: "#1808 (AlgebraicTopology Stage 4.5) merges before
  this pull request." Name #1807 instead if it is the revision that brings Stage 4.5 to main
  first.

**Tested.**

- On scratch copies I applied the `Suggested.lean` deletions, the 1.0 bullet and the edits to
  lines 488 and 603, together with R04's repair.
- `lake env lean` prints 22 `sorry` warnings and nothing else.
- The gate's identifier, statement-hygiene, empty-section, `set_option` and residue scanners
  report 0 hits.
- The dependency check reports `depcheck: 238 roadmaps, 2321 edges, 0 problem(s)`.

## R03 (P2) — Not repaired: main's DGFloer still owns Theorem B and the §§6.3–6.4 and §7 material, and the description does not put #1798 first

This carries the DGFloer half of the previous review's R01. The repair report for 58c40ae answered
it (H01) with text for the description, and the description does not have that text.

**Location.**

- README lines 41–42: "The base roadmap, cited as **DGFloer** by layer and item, owns every
  other numbered statement of the source".
- The description's merge-order paragraph ends "#1742 (GeneralAlgebraicKTheoryPartII) → **this
  pull request** (#1799)".

**Claim.** This roadmap is the only owner of Theorem B, §§6.3–6.4, §7 and the carriers they use.

**Witness.** Main's DGFloer (0b2b0ef) still holds:

- Layer 1 items 7–8 (lines 834, 841);
- Layer 5 item 7 (line 1053);
- Layer 10 item 5's "Multiple realization and Theorem5.14/TheoremB" (line 1567);
- Layer 11 (line 1577).

These are 1.3, 1.4, Layer 2, 3.1–3.2 and Layer 4 here.

**Repair.** The README needs no change. Add to the description's merge-order paragraph:

> #1798 (DGFloer) merges before this pull request or together with it. It moves the source's
> Theorem B, §§6.3–6.4 and §7, and the homogeneous carriers, explicit degree computations and
> projective loop-space computations they rest on, out of DGFloer's Layers 1, 5, 10 and 11 and
> into this roadmap. Every DGFloer id this README cites resolves on main and at #1798.

**Tested.**

- #1798 (3166898) lines 50–54 hand this material to DGFloerPartII: "DGFloerPartII consumes this
  roadmap and supplies nothing to it".
- At #1798, 10.5 is "Theorems A and C" (line 4064) and Layer 11 is the finite cover (line 4186).
- Every DGFloer id cited here resolves on main and at #1798 (Verified sound).

## R04 (P2) — The stable-plus-Stiefel splitting is statable at the pins, but the docstring says it is not

**Location.**

- `Suggested.lean` lines 67–71: "The stable orthogonal group `O` … has no named carrier at the
  pins, so neither its Bott equivalences (README 4.2c) nor the stable-plus-Stiefel splitting …
  behind Lemma 6.35 for `n ≥ 17` (README 4.3) is stated here."
- Line 321 adds that it "needs the stable orthogonal group and the Stiefel carrier".

**Claim.** The splitting of README 4.3 cannot be stated against the pins.

**Witness.**

- `TauCeti.stiefel` (`TauCeti/Geometry/Manifold/Instances/Stiefel.lean` line 162) is the Stiefel
  carrier, and README line 266 already consumes it.
- The stable term `π_(n−1)(O)` equals `π_(n−1)(SO(n+1))` by 4.2a's range. This is the form the
  file already uses for Bott periodicity.

**Repair.**

1. Add `public import TauCeti.Geometry.Manifold.Instances.Stiefel`.
2. After `isOfFinOrder_pi_SO`, add the following, with a docstring that sets `n = 2j + 17`:

   ```lean
   theorem nonempty_pi_SO_mulEquiv_prod_stiefel (j : ℕ)
       (v : TauCeti.stiefel (EuclideanSpace ℝ (Fin (2 * j + 19))) 2) :
       Nonempty (π_ (2 * j + 16) (SO (2 * j + 17)) 1 ≃*
         π_ (2 * j + 16) (SO (2 * j + 18)) 1 ×
           π_ (2 * j + 17) (TauCeti.stiefel (EuclideanSpace ℝ (Fin (2 * j + 19))) 2) v) :=
     sorry
   ```

3. In the docstring's not-statable bullet, keep only the Bott equivalences.
4. Lines 320–322: replace "needs the stable orthogonal group and the Stiefel carrier of the README
   and is stated there" with "is `nonempty_pi_SO_mulEquiv_prod_stiefel`".
5. README 4.3 (lines 1594–1595): end the bullet with "…is `isOfFinOrder_pi_SO`; the splitting for
   odd `n ≥ 17`, with its stable term in the finite rank `SO(n+1)`, is
   `nonempty_pi_SO_mulEquiv_prod_stiefel`."

**Tested.** The declaration elaborates at the pins (scratch copy of R02). I checked its values:

| `j` | `n` | `π_(n−1)(SO(n+1))` | `π_n(V_(n+2,2))` | `π_(n−1)(SO(n))` |
| --- | --- | --- | --- | --- |
| 0 | 17 | `π₁₆(O) = ℤ/2` (`16 ≡ 0 mod 8`) | `ℤ/2` (Euler number `2`) | `(ℤ/2)²`, as README line 1628 |
| 1 | 19 | `π₁₈(O) = 0` | `ℤ/2` | `ℤ/2` |

## R05 (P3) — Tau Ceti's finite-stage factorization for sequential colimits is cited through AlgebraicTopology

**Location.**

- README lines 526–528: "AlgebraicTopology Stage 4 item 5 factors every compact subset of `X_∞`,
  and every map into it from a compact Hausdorff space, through a finite stage".
- The same citation appears at lines 52, 412–415 and 569.
- The supplier contracts (lines 149–150) say that "what the pins lack is a target of this roadmap
  or of the named supplier".

**Claim.** The pins lack the finite-stage factorization.

**Witness.** `TauCeti/Topology/Category/TopCat/Compact.lean` has
`TauCeti.TopCat.exists_subset_range_ι_of_isCompact` (line 88) and
`TauCeti.TopCat.exists_lift_of_compactSpace` (line 133). `ClosedEmbedding.lean` line 158 has
`TauCeti.TopCat.isClosedEmbedding_ι_of_isColimit`, which supplies the embedding hypothesis.

**Repair.**

- Add four declarations to the Tau Ceti contract, with their files:
  - `TauCeti.TopCat.exists_subset_range_ι_of_isCompact`: for a sequential colimit of T1 spaces
    along injective maps, every compact subset lies in one stage.
  - `TauCeti.TopCat.exists_lift_of_compactSpace`: when the maps from the stages are embeddings,
    every map from a compact space factors through one stage.
  - `TauCeti.TopCat.isClosedEmbedding_ι_of_isColimit`: in a directed colimit of closed
    embeddings, the maps from the stages are closed embeddings.
  - `TauCeti.TopCat.uCompactlyGeneratedSpace_of_isColimit` (`Compact.lean` line 75): a colimit of
    compactly generated spaces is compactly generated.
- Cite these in 1.0's sequential-colimit bullet and its *Needs:* line. Keep AlgebraicTopology
  Stage 4 item 5 only for `cofibrationTowerHomotopyEquivalence` in 4.2c (lines 1519, 1861).
- In 4.2 (lines 1244–1247), cite `TauCeti.MooreLoopSpace.doubleFirstHomologySphereAddEquiv`
  (`TauCeti/AlgebraicTopology/Sphere/HomotopyGroup.lean` line 135, `H₁(ΩᴹΩᴹS³; ℤ) ≅ ℤ`) for
  the `n = 3` case of Proposition 6.21.

**Tested.**

- 1.0's stages are compact Hausdorff, so T1, and its bonding maps are closed embeddings. So
  `isClosedEmbedding_ι_of_isColimit` gives the hypothesis of `exists_lift_of_compactSpace`.
- On the `S^∞` Check (line 582), the set `{q_r}` meets the stage `S^s` in `s` points, so it is
  closed and discrete, and no compact family escapes every stage.

## R06 (P3) — Not repaired: TopologicalKTheory #1807 (now at 92defa2) still consumes 4.2a–4.2b in T1.6, and the description does not order it

This carries the previous review's R02. #1807 has moved from e444d15 to 92defa2 without changing
these citations.

**Location.**

- README lines 1883–1885: "It cannot consume 4.2a–4.2c in T1.5–T1.6 or in T2's `K` and `KO`
  groups".
- The description's merge-order paragraph does not name #1807.

**Witness.** At #1807 (92defa2):

- TopologicalKTheory line 499 (T1.6a): "equivalent to DGFloerPartII 4.2a's stable `O`";
- TopologicalKTheory line 824 (T1.6d): "DGFloerPartII 4.2b's Grassmannian member Ω₇";
- GeneralizedCohomology line 3444: "G4.0a/b consume TopK T1.5–6's carrier/classifier foundation".

**Repair.** The README needs no change. Add to the merge-order paragraph:

> #1807 (TopologicalKTheory, with its other roadmaps) merges after this pull request, and only
> once its T1.6a and T1.6d citations of DGFloerPartII 4.2a–4.2b have moved to T7: 4.2a–4.2b
> consume GeneralizedCohomology G4.0b, which consumes TopologicalKTheory T1.5–T1.6.

**Tested.**

- As #1807 stands, its citations close a cycle: T1.6a → 4.2a (#1807 line 499) → G4.0b (README
  line 1341) → TopologicalKTheory T1.5–T1.6 (#1807 GeneralizedCohomology line 3444; main line
  2612).
- Its T7 citations (lines 1505, 1525, 1537, 1576, 1626) are the uses the Downstream bullet
  allows.

## R07 (P3) — Not repaired: the description is stale

This carries the previous review's R03.

**Location.** The description says:

- "`Suggested.lean` states the rotation family at a fixed pole, the low-rank values of
  `π_(n−1)(SO(n))` and its torsion for odd `n`";
- "HomotopySpheres' James construction and Bott periodicity";
- "TangentialBordism's compact-image embedding".

**Witness.**

- `Suggested.lean` declares no rotation family. It states Theorem B (line 117), five capacity
  theorems (lines 138–214) and Theorem G (line 340).
- `HomotopySpheres` occurs nowhere in the folder.
- 3.1 uses TangentialBordism B5 and B6.3 (README lines 1092–1094).

**Repair.** Make three changes to the description:

- **Summary.** Replace "HomotopySpheres' James construction and Bott periodicity" with
  "GeneralAlgebraicKTheoryPartII's James construction and Bott–Samelson theorem; real Bott
  periodicity is proved here (4.2a–4.2c)".
- **Layer 3 sentence.** Replace "TangentialBordism's compact-image embedding" with
  "TangentialBordism B5's geometric Pontryagin–Thom and B6.3's rational oriented-bordism
  surjection".
- **Last sentence.** Replace it with:

  > `Suggested.lean` states Theorem B; the finiteness of the capacity in Theorem I for spheres,
  > manifolds covered by diffeomorphisms, non-aspherical compact Lie groups, `CPᵈ` and `HPᵈ`; the
  > finite-rank stable range and Bott periodicity of `π_i(SO(n))`; Lemma 6.35's seven low-rank
  > values, its torsion for odd `n` and the splitting for odd `n ≥ 17`; and Theorem G.

  This text assumes R02 and R04 are applied.

**Tested.** Every Lean name and statement in the replacement is in `Suggested.lean` as repaired on
the scratch copy (R02, R04).

## Previous findings

| Finding at 58c40ae | Status | Carried as |
| --- | --- | --- |
| R01 (P2): order against DGFloer #1798 and AlgebraicTopology #1652/#1663 | not repaired | R03 (DGFloer); R02 (AlgebraicTopology, now also #1807 and #1808) |
| R02 (P3): #1807 order | not repaired | R06, at #1807's new head 92defa2 |
| R03 (P3): stale description | not repaired | R07 |

For each finding, the description's merge-order paragraph still ends "#1742
(GeneralAlgebraicKTheoryPartII) → **this pull request** (#1799)". The repair report for 58c40ae
marks all three "answered", none "not actionable in this package", and drafts text for the
description that was not applied.

## Verified sound

### Gate and dependency check

My run of the push gate on this head:

    gate DGFloerPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=1 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 FAIL
      depcheck: UPWARD: DGFloerPartII (#46) -> GeneralAlgebraicKTheoryPartII (#333) at README lines [346, 653, 864, 1278, 1859]

This is the unmoved board order. With `--movable` on that order:

    moved: DGFloerPartII moved in the merge order from #46 to #333, right after its last supplier GeneralAlgebraicKTheoryPartII; checked as moved (the worker moves it there when it submits)
    depcheck: 238 roadmaps, 2321 edges, 0 problem(s)

The brief's dependency check, against `merge-order-moved.txt`:

    depcheck: 238 roadmaps, 2321 edges, 0 problem(s)

In that order:

- TangentialBordism is line 14, GeneralAlgebraicKTheoryPartII line 332 and DGFloerPartII line 333.
- Every other supplier is on main: DGFloer, GeneralizedCohomology, ComplexKahlerGeometry,
  SmoothBundlesConnections, RepresentationTheory/LieGroups, RiemannianGeometry, MorseTheory,
  GeometricTopology and AlgebraicTopology.
- No roadmap on the never-cite list appears in the folder. TopologicalKTheory appears only under
  Downstream consumers.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.
- The branch and main pins agree: Mathlib 1b1ccf4b, Tau Ceti 2fd255d9.

### Build, signatures and padding

- **Build.** `lake env lean TauCetiRoadmap/DGFloerPartII/Suggested.lean` exits 0 with 23 messages,
  all "declaration uses `sorry`", at lines 91, 100, 117, 138, 153, 171, 201, 214, 253, 260, 267,
  273, 280, 286, 294, 297, 300, 304, 308, 312, 316, 323 and 340.
- **Signatures.** I put `#check @name` for all 27 declarations in one scratch file that imports
  the built module, and compared each elaborated type with its README statement. Nothing changed:
  no section binder was lost.
  - The elaborated types match the README's hypotheses: connectedness only in Theorem B, `ℓ > 0`,
    the `Odd` hypothesis, and the stable ranges `j + 3 ≤ m` and `j + 11 ≤ m`.
  - `signatures.md` lists 29 entries because `of` (line 115) and `on` (line 189) are misparsed
    docstring words.
- **Padding probe.** Each of the 23 sorried theorems was tried with `intros` followed by
  `rfl`, `infer_instance`, `simp`, `decide` or `trivial`: 23 failures.
  - `exact?` on restated copies outside the module also fails, for the two Layer 1 statements,
    `π₂(SO(3))` and Lemma 6.35's torsion.
  - The proved `soBlockInclusion_one` is the basepoint proof that `HomotopyGroup.map` needs, not
    padding.

### Library declarations opened at the pins

- **Name check.** Every backticked Mathlib and Tau Ceti name in the README `#check`s at the pins:
  60 names, in one scratch file after `lake build` of the five unbuilt Tau Ceti modules.
  `to_compactlyCoherentSpace` and `of_compactlyCoherentSpace_of_t2` are root-level, in a
  `section` of `Mathlib/Topology/Compactness/CompactlyGeneratedSpace.lean`, lines 365 and 370.
- **Definitions read for the adversarial pass:**
  - `TauCeti.SmoothTwoForm.HasContractibleAlmostExistence`
    (`TauCeti/Geometry/Symplectic/Hamiltonian/AlmostExistence.lean` line 167);
  - `IsContractibleHZAdmissible` and `contractibleHZCapacity`
    (`TauCeti/Geometry/Symplectic/Capacity/HoferZehnder.lean` lines 179, 193);
  - `codiscBundle` (`TauCeti/Geometry/Symplectic/Cotangent/Bundle/Codisc.lean` line 82);
  - `TauCeti.IsAspherical` (`TauCeti/AlgebraicTopology/EilenbergMacLane/Basic.lean` line 59);
  - `TauCeti.subsingleton_homotopyGroup_sphere_of_lt` and `TauCeti.homotopyGroupSphereAddEquiv`
    (`TauCeti/AlgebraicTopology/Sphere/HomotopyGroup.lean` lines 66, 110);
  - `TauCeti.stiefel` (line 162);
  - `TauCeti.ComplexProjectiveSpace` and `TauCeti.QuaternionicProjectiveSpace`, quotients by unit
    complex scalars and by right unit quaternions (`TauCeti/Topology/*ProjectiveSpace/Basic.lean`
    lines 58, 62).
- **Absences checked.**
  - No real-manifold instance on `ComplexProjectiveSpace` exists at the pin, so
    `instIsManifoldRealComplexProjectiveSpace` is needed.
  - Mathlib has no general `compactlyGeneratedToTop` adjunction; its
    `CondensedSet.compactlyGeneratedAdjunction` (`Mathlib/Condensed/TopCatAdjunction.lean` line
    175) is for `u, u+1` through condensed sets.
  - No product instance for compactly generated spaces exists at the pin.
  - Tau Ceti has closed Lie subgroups (`TauCeti/Geometry/Lie/Subgroup/`) but no smooth `G/H`, so
    the docstring's reason for Proposition 6.36 holds.

### Cross-roadmap citations resolved

Main is 0b2b0ef; open heads are those of the 07:56 index.

- **DGFloer, main.**
  - Layer 0; Layer 1 items 1–6, including item 5's Pontryagin–Thom collapse at line 826 and item
    6 at 832; Layer 2 items 1–3; Layer 3.
  - Layer 4 item 5 (the Brown resolution); Layer 5 items 1–6; Layer 6 items 3–5; Layer 7 item 2.
  - Layer 10 items 2–5 (lines 1553–1574); Layer 11 item 3's finite cover and torus criterion.
- **DGFloer #1798 (3166898).** The same ids, with 10.x and 11.x headings; Layer 4 item 5 is the
  "§4.1" the README notes.
- **GeneralizedCohomology, main.** G2.10 (line 533), G4.0/G4.0b (lines 938–958), G4.3–G4.5
  (lines 1224–1246), G5 item 2 "Geometric duality adapter" (line 1523: unframed collapse,
  independence, fundamental-class duality) and G5 item 6, rational spectral Hurewicz (line 2212).
- **TangentialBordism #942 (993f5f4).** B5.1 (§5.1, line 1319), B5.5 (§5.5, line 1667), B6.3
  (§10.1, line 2716).
- **GeneralAlgebraicKTheoryPartII #1742 (3f10248).** §4.30b (line 1208). Its interface bullets
  match the README's James contract: universal property, CW structure, filtration quotients,
  flat-coefficient tensor algebra, Bott–Samelson, and the James map as a homotopy equivalence for
  connected `W`.
- **Other suppliers on main.**
  - ComplexKahlerGeometry K7.1 (line 1407).
  - SmoothBundlesConnections B1.4, B2.2, B2.5, B6.2 and B6.3 (lines 421, 605, 802, 1668, 1716).
  - LieGroups Layer 2 (line 356); RiemannianGeometry R1–R3 (lines 179, 300, 347); MorseTheory M5
    (line 857); GeometricTopology Layers 1 and 3 (lines 177, 357).
  - AlgebraicTopology Stage 4 item 4 (`reducedSuspensionSphereHomeomorph`); item 5
    (`cofibrationTowerHomotopyEquivalence`, line 683; finite-stage factorization, line 697);
    Stage 6 item 5 (the degree); Stage 8 items 5, 7 and 8.11a.
- **Overlaps.** The overlap tool lists no dropped id. I checked the heads that change suppliers:
  - #1807 and #1808 keep AlgebraicTopology Stage 4's item numbering (items 4–5 unchanged).
  - They renumber ComplexKahlerGeometry K7.1 to 7.1 with an old → new table, and keep "(K7.1)" in
    the heading, so the citation still resolves.
  - They keep GeneralizedCohomology G2.10, G4.0b and G5's items 2 and 6.
- **Who cites this roadmap.** `roadmaps grep DGFloerPartII` finds citations only in #1798 (4
  lines) and #1807 (8 lines; R06), none on main.

### Ownership

- **4.2a–4.2c.** HomotopySpheres #1287 and #284 also state stable `O` and real Bott periodicity:
  #1287 line 40, and its `Suggested.lean` line 127. HomotopySpheres is on the brief's never-cite
  list, so this roadmap must own 4.2a–4.2c. That overlap is for HomotopySpheres to settle.
- **TopologicalKTheory.** It owns the `BO` comparisons (#1807 lines 191–205), as the Downstream
  bullet says.
- **Two findings.** The coreflection (R02) and the DGFloer material (R03) are this review's
  ownership findings.
- **Lean names.** No declaration here shares a fully qualified name with another roadmap's.
  `TauCetiRoadmap.AlgebraicTopology.compactlyGeneratedToTop_isLeftAdjoint` (#1808) states the same
  theorem under another namespace (R02).

### Seeded source sample

| Target | Locator checked | Result |
| --- | --- | --- |
| 1.0 | `strickland-cgwh` lines 122 (Prop 2.6), 159 (2.11), 177 (2.12), 290 (2.20), 1033 (5.1), 1086 (5.7), 1096 (Cor 5.8); `rezk-cg-spaces` lines 313 (7.3), 382 (8.6), 409 (8.8), 433 (9.2); Hatcher Theorem A.6 (p. 524) | as stated. Prop 2.6 is LCH × CG; Rezk's k-spaces carry no separation axiom, and his "locally compact" includes Hausdorff (line 292); A.6 gives `(X×Y)_c = X × Y` when one factor is locally compact or both are countable |
| 1.2 | `bdho-cotangent` line 4685 (Prop 6.18, p. 108); Hatcher §4.J (p. 470); GeneralAlgebraicKTheoryPartII §4.30b | polynomial in degree `n − 1`, not graded commutative; contract matches |
| 1.3 | Tau Ceti projective models and `TauCeti.stiefel` as above | dimensions and the right-line Check recomputed (table); Milnor–Stasheff Ch. 5 and Steenrod §7 not verifiable |
| 1.5 | GeneralizedCohomology G5 item 2; TangentialBordism B5.1, B5.5 | suppliers state what the contract uses |
| 2.3 | `bdho-cotangent` lines 5283–5290 (Prop 6.39 proof, p. 122) | `C_k ≅ T¹_pHPⁿ`, dimension `4n − 1`, index `2(k−1)(2n+1) + 3`, first index 3, perfect (Ziller Thms 3, 8) |
| 2.5 | GeneralizedCohomology §G4 items 0 and 3–5 | base cell, cup and Thom classes supplied; the differentials are this roadmap's (values in the table) |
| 2.6 | lines 5222–5240 (Prop 6.38, p. 120), 5257–5310 (Prop 6.39, pp. 121–122), 4792–4796 (Rem 6.19, p. 110), 5201–5210 (Ex 6.37, p. 120) | as stated; the source's "twice" for `CPⁿ` is corrected (Source issues) |
| 3.2 | line 4267 (Thm 5.14, p. 98), lines 4140–4150 (Thm 5.10, p. 95), Hatcher Thm 3.26 (p. 236) | the hypotheses match; orientability follows from the hypothesis on `U` |
| 4.1 | lines 4517–4528 (Def 6.11, Thm 6.12, p. 104), 4608–4616 (Prop 6.13, p. 106) | as stated, including the `α − σ_*ev_*α` step (lines 4541–4578) |
| 4.2a | Hatcher §4.2; ranges recomputed | as stated; Steenrod §7 not verifiable |
| 4.2b | `eschenburg-hanke-bott` line 264 (eq. (3), p. 7), lines 240–246 (Thm 2), 286–288 (Thm 3, p. 8) | `Ω_k = M_k`; module dimensions `1, 2, 4, 4, 8, 8, 8, 8, 16`; one module unless `k ≡ 3 (mod 4)` |
| 4.2c | `eschenburg-hanke-bott` lines 299–354 (Thm 4, Case 1, pp. 8–10), 360–404 (Case 2, pp. 10–11) | tangent space (6), the eigenvalues, the winding `½ tr A/i` and both index bounds recomputed; Milnor §§22–24 not verifiable |
| 4.3 | lines 4919–4925 (Def 6.26, p. 113), 4935 (Prop 6.29, p. 114), 5037–5062 (6.31–6.33, p. 116), 5073–5094 (Lem 6.35, p. 117), 5122–5139 (second proof, pp. 117–118); `css-derivative` lines 222, 249 | as stated, with `π₈(SO(9))` corrected |
| 4.4 | lines 5156–5200 (Prop 6.36, pp. 118–119), 5201–5210 (Ex 6.37, p. 120) | as stated; the nonorientable case gets the twisted capacity conclusion (Source issues) |
| 4.5 | lines 430–445 (Thm I, p. 11), 5218 (Prop 6.38, p. 120), 5247 (Prop 6.39, p. 121) | as stated without `CaP²`; the ℓ-covered hypothesis is corrected (Source issues) |

### Adversarial table

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Theorem B (Lean) | `T^r`; `ℝP³`; `U = ∅`; `Q` a point; `S² ⊔ T²` with `U = D*T²` | `π_(ℓ≥2)(T^r) = 0`, so `hQ` false; `π₃(ℝP³) = ℤ`, so `hQ` true; `H_n(∅) = 0`, so `hU` false; point: `π₂ = 0`; disconnected: hypotheses hold, flat cosphere has no contractible orbit | true; `ConnectedSpace` needed and present | none |
| Theorem B, nonorientable `Q` | closed connected nonorientable `Q` | `H_n(Q; ℤ) = 0` (Hatcher 3.26), so `hU` false | orientability implied | none |
| Theorem B route | `x ∈ π_ℓ` of infinite order, `d = Nb ≠ 0` | `d^m x ≠ 0` for every `m`, which is Thm 5.10 condition 2; `|d| = 1` falls under condition 1 | sound | none |
| 1.0 coreflection (Lean) | `kY` for metrizable `Y`; `k(kY)` | `kY = Y` (sequential); probes into `Y` are probes into `kY`, so `k(kY) = kY` | true for all `u, w` | owner: R02 |
| 1.0 product criterion (Lean) | `ℝ/ℤ₊ × ℚ`; `ℝ/ℤ₊ × [0,1]` | the first is not a quotient (Munkres §22 Ex. 7), so not CG; the second is CG | local compactness needed | owner: R02 |
| 1.0 `S^∞` Check | `q_r ∈ S^r` | meets `S^s` in `s` points; norm limit `e₀`, no colimit limit | as stated | R05 cites Tau Ceti |
| 1.2 ring | `n = 2, 3`; `W = S⁰` | `H_k(ΩS²) = ℤ`, `x² ≠ 0` (graded commutativity would give `2x² = 0`); `ΩS³`: degrees `0, 2, 4…`; `J(S⁰) = ℕ ≠ ΩS¹`, so `n ≥ 2` needed | as stated | none |
| 1.3 dimensions | `V_(n,2)`, `n = 3`; `U(n)/U(n−2)`, `n = 2` | `2n − 3 = 3 = dim SO(3)`; `4n − 4 = 4 = dim U(2)` | as stated | none |
| 1.3 quaternion Check | `v = (1, j)`, `λ = i` | `vλ = (i, −k)`, `iv = (i, k)` | right lines required | none |
| 1.3 metric | `CP¹` of radius `1/2` | curvature 4, period `π`, area `π = π∫ω_FS` | as stated | none |
| 1.4 `τ_u` | `n = 2, 3, 4` | `1 + (−1)ⁿ = 2, 0, 2` | as stated | none |
| 1.4 rotation family | `n = 1, 2, 3` | `2, 0, 2`; `H₂(SO(3)) = H₂(ℝP³) = 0`; `H₃(SO(4)) = ℤ²` | as stated | none |
| 1.5 collapses | `N = ∅`; a framed point; the circle in `S³` | constant map, degree 0; `±1`; `Th ν = Σ²(S¹₊) ≃ S³ ∨ S²` | as stated | none |
| 2.1 indices | `CP²` and `HP²`, `k = 2`; `d = 1` | `(2k−1) + (k−1)(2d−2) = 5 = 2d(k−1)+1`; `3(2k−1) + (k−1)(4d−4) = 13 = 2(k−1)(2d+1)+3`; `2k − 1`, `6k − 3` | as stated | none |
| 2.2 cells | `CP²` | `0, 1, 4, 5, 8, 9` = degrees of `S¹ × ΩS⁵`; `a₂ − b₁ = 1` | rank count needed | none |
| 2.3 cells | `HP²`, `HP¹` | `3, 10, 13, 20` (gap 3); `HP¹`: `3k`; `b₁ = 4d + 2` | as stated | none |
| 2.5 bidegrees | `CP²` | `d₂: E_(2,4) → E_(0,5)`; `d₄: E_(4,1) → E_(0,4)` kills degree 4; total degree drops by 1 | as stated | none |
| 2.6 classes | `CPᵈ`, `HPᵈ`, `HP¹` | fibre maps `S¹ → S¹` of degree `±1`, `S² × S¹ → S³` of degree `1 + (−1)² = 2`; `dim Σ_p = 2d − 1`, `4d + 1` (`= 5` for `HP¹`) | `±g`, `±2g` | none |
| 3.3 sign | `T*ℝ²`, `σ = q₁dq₂` | `−d(p₁dq₁ + (p₂ − q₁)dq₂) = ω + dq₁∧dq₂` | `Ψ'*ω = ω + π*dσ` | none |
| 4.1 abundance | point; `T^r`; products | `Map(S², pt) = pt`, reduced shriek 0; `Ω²T^r ≃ pt`; `deg(α×[N]) = deg α + dim N` | not, not, yes | none |
| 4.2 twistor Check | `S² → CP³ → S⁴` | `π₃(CP³) = π₃(S⁷) = 0`; `E_(1,0) = 0`, so `d₂: E_(2,0) → E_(0,1)` is onto | `2n`-connectivity needed | none |
| 4.2a range (Lean) | `(n, i) = (2, 0), (2, 1), (3, 3), (1, 0)` | `π₀`: pt → pt; `ℤ → ℤ/2` onto, not injective; `ℤ → ℤ²` not onto (neither hypothesis); `π₀(SO(1)) → π₀(SO(2))` onto | bounds sharp | none |
| Bott and stable values (Lean) | `(j, m) = (0, 11)`; `i = 2, 4, 6`; `i = 1, 8`; `i = 3`, `m = 4, 5` | `π₉(SO(11)) = ℤ/2 = π₁(SO(11))`; `π₂(SO(4)) = π₄(SO(6)) = π₆(SO(8)) = 0`; `π₁(SO(3)) = π₈(SO(10)) = ℤ/2`; `π₃(SO(4)) = ℤ²` excluded, `π₃(SO(5)) = ℤ` | true; `i = 0` correctly excluded (`π₈ = ℤ/2` vs `pt`) | none |
| 4.2c index bounds | `m = 1`, `k = 0, 1, 3, 4, 5, 7`; `k = 2, 6`, `c = 0` | `λ = 7, 3, 1, 1, 1, 0`; `w = c`, `2c`; `2·index ≥ p ≥ (s + c)/2`, so `≥ (4 − 0)/4 = 1` and `≥ 1/2` | as stated | none |
| 4.2c stable groups | `i = 1..8` | `π₀(Ω_i)` has 2, 1, ℤ, 1, 1, 1, ℤ, 2 elements; `π₃ = π₁(U/Sp) = ℤ`, `π₇ = π₃(Sp) = ℤ` | as stated | none |
| Lemma 6.35 (Lean) | `n = 3..15`; `n = 4` | `0, ℤ/2, 0, (ℤ/2)², ℤ/2, ℤ/2, ℤ/2`; `π₃(SO(4)) = ℤ²` | `Odd` needed | none |
| Splitting | `n = 3, 7, 9, 17, 19` | `0 ⊕ ℤ/2 ≠ π₂(SO(3)) = 0`; `0 ⊕ ℤ/2 ≠ π₆(SO(7)) = 0`; `(ℤ/2)²`; `(ℤ/2)²`; `ℤ/2` | range `n ≥ 17` needed | R04: statable |
| `π₈(SO(9))` | `css-derivative` 222, 249 | split stabilization with kernel `ℤ/2`, so `(ℤ/2)²`; `π₈(SO(8)) = (ℤ/2)³ → π₈(SO(9))` onto | source's `ℤ/4` is wrong | none |
| ℓ-covered (Lean) | `ℓ = 0`; `T^r`; `S³` with `ℓ = 1, 2` | `A = 0` excluded by `hℓ`; `hM` false; `π₃ = ℤ` has `x^ℓ ≠ 1` | true | none |
| Lie group (Lean) | `T^r`; `SU(2)`; trivial group | aspherical, so excluded; `π₃ ≠ 0`; aspherical | true | none |
| Capacity (Lean) | `CP⁰`; `S⁰`; `S¹` | admissible `F` vanishes on the one-point `W`, so capacity `0`; `F = a` at one point is admissible, so `∞`; flat `S¹`: `∞` | `n ≥ 2` needed, `d ≥ 0` fine | none |
| Metric independence | `D*_g₁ ⊆ λD*_g₂` | `c°(λW) = λc°(W)`; inclusion `π₁`-injective via retractions | as stated | none |
| 4.4 `ℝP²` | `diag(A, −1)`, `det A = −1` | based lift `diag(−A, 1)σ̃` of degree `det A = −1`; `χ = −1` | `(Φ_H)_*([H]×α) ≠ 0` | none |
| Theorem G (Lean) | `S² × S⁴` (`k = 2`); `T⁸ # (S³ × S⁵)` (`k = 3`); `T⁶ ⊔ (S² × S⁴)`, `S = ∅`; `k = n` | `ℓ = 2, 2`; `d ≠ 0` needed; `Y` a point, bound fails, conclusion via Theorem H | true | none |
| Theorem G route | `k = 2, 3` | Lemma 7.7's `d = 2k − 3 = 1`, `k − 2 = 1` | outside the stated `d ≥ 2` | R01 |
| Downstream bullet | #1807 at 92defa2 | T1.6a → 4.2a → G4.0b → T1.5–T1.6 | cycle unless reordered | R06 |

### Headline theorems

- **Stated:**
  - Theorem B (line 117);
  - Theorem I's capacity forms (lines 138, 153, 171, 201, 214);
  - Theorem G (line 340);
  - Lemma 6.35's values and torsion (lines 294–324);
  - the finite-rank range, Bott periodicity and stable values (lines 253–288);
  - 1.0's adjunction and product criterion (lines 91, 100), which belong to AlgebraicTopology
    (R02).
- **Named as not statable, correctly:**
  - Theorem H and the abundance conclusions (no shriek map for `Map(S², Q) → Q`);
  - fibered families, sphere bundles and products;
  - Proposition 6.36 (no smooth `G/H`);
  - the stable `O` with its Bott equivalences;
  - the Clifford chain's index bounds.
- **Statable but absent:** the splitting (R04). Stable Bott periodicity is covered by the
  finite-rank forms together with the stated range.

## Not verifiable

- **Paywalled; the values were recomputed instead:**
  - J. Milnor, *Morse Theory*, §§22–24: the colimit identifications and explicit index bounds of
    4.2b–4.2c. Eschenburg–Hanke Theorems 2–4 support the qualitative statements.
  - R. Bott, *The stable homotopy of the classical groups*, Ann. of Math. 70 (1959).
  - W. Ziller, *The free loop space of globally symmetric spaces*, Invent. Math. 41 (1977). The
    sources service resolved DOI 10.1007/BF01390161 only to a paywalled page. The index formula
    of 2.1 was recomputed from conjugate points and agrees with the source's restatement
    (`bdho-cotangent` line 5286).
- **Paywalled or not held, not read:**
  - BDHO, *Morse homology with DG coefficients* (Birkhäuser 2025), the chapter numbers of Layer 2.
  - Thom (1954) and [Jap87].
  - Steenrod, *The Topology of Fibre Bundles*; Milnor–Stasheff, *Characteristic Classes*;
    Pontryagin, *Smooth manifolds…*; Munkres, *Topology*, §22 Example 7.
- **Read but not in the manifest.** Hatcher, *Algebraic Topology* (author page) was read through
  the sources service into a scratch manifest only: Theorems 3.26 and A.6, §4.J. The board's
  `sources.toml` does not record it.

## Source issues

- **Error** in bdho-cotangent at proof of Lemma 6.35, printed page 117: the source says `π₈(SO(9)) = ℤ/4`; it should be `(ℤ/2)²`, the stabilization to `π₈(SO) = ℤ/2` being split with kernel `ℤ/2` (css-derivative, proof of Lemma 2.2); affects nothing.
- **Misprint** in bdho-cotangent at second proof of Proposition 6.34, printed page 118: the source concludes with Proposition 6.29 after showing `Sⁿ` is 2-covered; it should cite Proposition 6.33, the ℓ-covered form; affects nothing.
- **Error** in bdho-cotangent at proof of Proposition 6.38, printed page 120: the source says the `CPⁿ` family gives up to sign twice a generator of `H_(2n)(ΩCPⁿ)`; it should be a generator, one frame `(v, Iv)` per direction (Remark 6.19 at `n = 1`); affects nothing.
- **Misprint** in bdho-cotangent at proof of Proposition 6.23, printed page 113: the source describes the odd-case fibre as unit tangent vectors orthogonal to `u(p)`, `v(p)`, an `(n−3)`-sphere; it should be the equator `S^(n−2)` of Example 6.20, made of sphere points; affects nothing.
- **Gap** in bdho-cotangent at Lemma 7.7 and the end of the proof of Proposition 7.5, printed pages 126–127: the source states Lemma 7.7 for `d ≥ 2` but applies it with `d = k − 2` or `2k − 3`, which is 1 for `k = 2, 3`; it should state `d ≥ 1`, where its spectral-sequence argument works; affects the proof.
- **Error** in bdho-cotangent at §7 before Theorem 7.1, printed page 123: the source says `ℓ`-connectivity of `Y` forces `n ≥ 3k − 1` (even `k`) or `n ≥ 2k` (odd `k`); it should exclude `k = n`, where `Y` is a point; affects nothing.
- **Gap** in bdho-cotangent at Theorem I(ii), printed page 11: the source lists every non-`K(π,1)` manifold ℓ-covered in the sense of Definition 6.32; it should also require `π₂ ≠ 0` or a first nontrivial `π_k`, `k ≥ 3`, not ℓ-torsion, as Proposition 6.33 does; affects a stated result.
- **Gap** in bdho-cotangent at Proposition 6.36, printed page 119: the source concludes abundance for every closed positive-dimensional `H`; it should restrict to orientable `G/H`, since Definition 6.11 needs an orientation and `ℝP² = SO(3)/O(2)` is not orientable; affects a stated result.
