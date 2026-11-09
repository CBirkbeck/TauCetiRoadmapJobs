# Review of FlagVarieties (pull request #2114 at c2f3de4)

**Verdict:** needs changes

🤖 Independent AI review. This is a full review of the folder at c2f3de4. FlagVarieties is now on main, and this pull request revises it: 64 README lines and 32 Lean lines change against main, adding §4.0 and `exists_closed_projectiveOrbit_borel_quotient`. The gate fails on `depcheck` and `prnum`. The pinned Tau Ceti (`2fd255d`) now proves several things the README still asks suppliers for. §4.0 duplicates objects that other open roadmaps already own.

## Previous findings

PRREVIEW-FlagVarieties~5 (the previous pull request, head 3ce938d) accepted with no finding, so there is nothing to mark repaired. The repairs it confirmed still read the same at this head:

- `README.md:162` still reads "*Needs:* `gap:standard-parabolic-scheme`, ReductiveGroups 7/7b Bruhat and root-cell inputs, 0.1."
- `Suggested.lean:18–19` still lists `HopfIdeal.IsParabolicOverAlgClosed` and "the `B W_J B` classification of subgroups containing `B`" as missing.

That second passage was true at the old pin (358314d4). At the current pin (2fd255d, from the unchanged `lake-manifest.json`) both declarations exist. This now feeds R05 and R06.

## R01 (P1) — §4.0(b)–(c) rest on seven declarations absent at the pinned Tau Ceti

**Location.** `TauCetiRoadmap/FlagVarieties/README.md:56–60, 226–238`; `Suggested.lean:36–38`. Line 235: "extend this line to an upper-triangular basis with `Comodule.exists_basis_coefficientMatrix_isUpperTriangular_first_span_of_isSolvable` (`Solvable/LieKolchin.lean`, PR #33891, in progress)".

**Claim.** The supplier table and the route of 4.0(b)–(c) cite seven declarations as if they were supplied:

- `Module.Basis.flagTensorVector`
- `Module.Basis.stabilizerHopfIdeal_span_singleton_flagTensorVector`
- `FGComoduleCat.tensorFin`
- `Comodule.flagExteriorPowers`
- `Comodule.exists_basis_coefficientMatrix_isUpperTriangular_first_span_of_isSolvable`
- `HopfIdeal.IsBorelOverAlgClosed.ringKrullDim_quotient_le` (`Borel/Dimension.lean`, "Tau Ceti main")
- `Comodule.isProper_projectiveOrbitToSpec_of_isClosed` ("main")

None of them exists at the pin, and no roadmap section owns them, so these are unowned prerequisites.

The dimension bound is the essential one. For an arbitrary Borel `B`, the bound "every closed subgroup with solvable points has dimension ≤ dim B" amounts to Borel conjugacy. Milne proves 17.9(a) first for a Borel of *maximum* dimension.

**Witness.** A scratch file that `#check`s each name against the pins (Tau Ceti 2fd255d, Mathlib 1b1ccf4b) reports `Unknown constant` seven times. The pin's `Algebra/AlgebraicGroup/Borel/` has no `Dimension.lean`. Milne 2017 (503f1a7d line 14527, p.354) starts the proof with "a Borel subgroup of maximum dimension".

**Repair.** Apply R02, which deletes §4.0 and with it all seven citations. If §4.0 is kept instead, replace each citation by a pinned declaration or by a stated target here:

1. Derive the dimension bound from pinned `TauCeti.HopfIdeal.IsBorelOverAlgClosed.exists_le_conjugate_of_isBorelCandidate` (`Borel/Conjugacy/Containment.lean:47`). Apply it to the reduced identity component of the stabilizer, which is a Borel candidate.
2. Derive the prescribed first line from pinned `TauCeti.Comodule.exists_basis_coefficientMatrix_isUpperTriangular_of_isSolvable` (`Solvable/LieKolchin.lean:420`) applied to `V/L`.
3. Derive properness of a closed orbit from pinned `Comodule.range_projectiveOrbitι` (`ProjectiveOrbit/Scheme.lean:100`) and `IsClosedImmersion.of_isPreimmersion`, exactly as in `ProjectiveOrbit/FixedPoint/Basic.lean:84–88`.
4. State the tensor module `⊗_i Λ^i V`, the prefix-wedge vector and its `GL(V)` line stabilizer (the upper-triangular subgroup of the basis) as targets of 4.0(b), with no Lean names.

## R02 (P2) — Complete `G/B` gets a second owner; ReductiveGroups, a supplier of this roadmap, plans it

**Location.** `README.md:17, 52, 232` ("**(c) Complete G/B.** For `G` smooth connected affine of finite type over an algebraically closed field `k` and `B` a Borel subgroup, prove that there exist …"); `Suggested.lean:80–96`.

**Claim.** Three open revisions of ReductiveGroups state the same theorem in ReductiveGroups Layer 7, and one of them uses the same flag-tensor route. ReductiveGroups is this roadmap's supplier (Layers 0–3 consume its Layers 3, 3A, 7, 7b and 7C), so it is the earlier owner. Owning complete `G/B` here creates two owners. It also leaves ReductiveGroups no way to use the theorem without an upward edge.

The pull request description calls this a move of `gap:complete-borel-quotient` into FlagVarieties. The supplier did not give that gap up.

**Witness.**
- ReductiveGroups at #1676, README 2259: "Prove that `G/B` is complete (Milne, Theorem 17.9, p. 354)".
- At #1797, README 1989–2000: complete `G/B` via "the orbit of the Plücker line of `F` in `P(⊗_i Λ^i V)` … closed by 3A.4".
- At #1332, README 1759: the same theorem.

**Repair.** Keep ReductiveGroups as the single owner:

1. Restore the contract that main has: "What ReductiveGroups must provide (gap:complete-borel-quotient): `G/B` is proper over `k` for a Borel `B` of a smooth connected affine `G` (Milne Theorem 17.9(a), p.354)." Restore its table row (`Complete G/B | ReductiveGroups 7 | gap:complete-borel-quotient`), and make 4.1's `*Needs:*` consume it.
2. Delete §4.0 (lines 212–244); its (a)–(b) exist only to serve (c), see R03. Delete the §4.0 clause of line 17, table rows 52 and 54–61, the 4.0 items of lines 253, 277, 307 and 343, and the theorem `exists_closed_projectiveOrbit_borel_quotient` with the import only it uses (`Representation.Stabilizer`, `Suggested.lean:9`; keep `ProjectiveOrbit.Quotient` for R06).

ReductiveGroups is on main, so the dependency check accepts this edge. It is the edge main already has (main README line 50).

## R03 (P2) — The complete-flag scheme duplicates AlgebraicModuliForArithmeticGeometry §1.3, and the stated SchubertGeometry consumer does not exist

**Location.** `README.md:19`: "No merged roadmap owns complete-flag schemes. Construct them here from the existing Grassmannians; SchubertGeometry's incidence, embedding and Schubert comparisons consume this construction." Also line 326 and 4.0(a) at line 216.

**Claim.** 4.0(a) is the `flagBundle` of AlgebraicModuliForArithmeticGeometry §1.3 restricted to `S = Spec k`, so the object has two owners.

SchubertGeometry on main takes its incidence scheme from Moduli §1.3, not from this roadmap, and no roadmap on main mentions FlagVarieties. Meanwhile FlagVarieties 6.1 (lines 307, 314, 322) consumes SchubertGeometry S1. The supply relation the README asserts would therefore be a cycle.

Line 19 also hands the identification to the other roadmap ("if merged later, should identify") and links its pull request.

**Witness.**
- AlgebraicModuliForArithmeticGeometry at #853, README 685: `flagBundle` "is the closed incidence subscheme of the product over S of `Gr_(n-a_i)(E)`".
- SchubertGeometry on main, README 32: "Consume Moduli §1.3's closed incidence immersion into the product of quotient-rank Grassmannians".

**Repair.** Delete 4.0(a)–(b) with §4.0 (R02), and delete the second paragraph of Scope (line 19). Restore line 326 to "There are no downstream roadmap consumers." followed by its existing second sentence (that sentence must also drop ShimuraData, see R04). Restore line 307 to main's wording, without "including 4.0's complete-flag scheme".

## R04 (P2) — Upward supplier: a roadmap on main cites ShimuraData and GroupSchemesOverABase

**Location.** `README.md:21, 25, 249–250, 253, 277, 326, 343`. Line 253: "*Needs:* `gap:homogeneous-quotient-scheme`, 4.0(c), 0.2 and ShimuraData §3.8's `Par_t(G)` comparison and projectivity."

**Claim.** FlagVarieties is on main. ShimuraData is an open roadmap (merge order line 116), and GroupSchemesOverABase is neither on main nor in the order. A roadmap on main consumes only Mathlib, Tau Ceti and roadmaps on main.

Line 21 also promises a "field-fibre comparison" with GroupSchemesOverABase GS7's `Bor(G)` and ShimuraData's `Par_t(G)`, but no target carries it.

**Witness.** Gate and dependency check at c2f3de4: `UPWARD: FlagVarieties (on main) -> ShimuraData (#116) at README lines [25, 253, 277]`.

**Repair.** Prove the projective direction here, which needs no new carrier. Realize `G/H` by pinned `TauCeti.HopfIdeal.exists_fppfHomogeneousQuotient_iso_projectiveOrbitPoints` (`Representation/ProjectiveOrbit/Quotient.lean:241`). Its orbit scheme is locally closed in `P(M)`, so properness (from complete `G/B`) makes it closed, hence projective.

Then delete:
- the sentence of line 21 starting "GroupSchemesOverABase GS7 owns", up to "the only work here", keeping "ReductiveGroups 7C.5 owns type-A block maps";
- line 25's ShimuraData sentence, replaced by the realization above;
- lines 249–250 ("Compare Borel containment … second projectivity construction");
- the ShimuraData items of lines 253 and 277, and the ShimuraData sentence of line 326;
- the clause "and ShimuraData §3.8's projectivity of `Par_t(G)`" in line 343.

Tested: a scratch copy of the README with exactly these edits gives `depcheck: 236 roadmaps, 2268 edges, 0 problem(s)`.

## R05 (P2) — Five declared ReductiveGroups gaps ask for what the pinned Tau Ceti already provides

**Location.** `README.md:68, 70, 74, 78, 80` and their uses at 33, 45–46, 49, 51, 134, 142, 166, 172, 188, 194, 208, 247 and 253; `Suggested.lean:18–22`. Line 78: "What ReductiveGroups must provide (gap:parabolic-predicate): `HopfIdeal.IsParabolicOverAlgClosed` meaning a smooth closed subgroup scheme whose ideal is contained in some Borel ideal."

**Claim.** Each of these gaps is already provided or implied at the pin (2fd255d):

| Gap | Pinned declaration (file:line) | Comparison |
| --- | --- | --- |
| `parabolic-predicate` | `TauCeti.HopfIdeal.IsParabolicOverAlgClosed`, `Algebra/AlgebraicGroup/Parabolic/Basic.lean:82` | definition is `IsAlgClosed k ∧` smooth quotient `∧ ∃ J` Borel with `I ≤ J`: exactly the gap |
| `borel-conjugacy-connected` | `TauCeti.HopfIdeal.IsBorelOverAlgClosed.exists_conjugate_eq`, `Borel/Conjugacy/Existence.lean:133` | any finite-type `H`, no `hcontain`, no smoothness or connectedness: stronger than the gap |
| `tits-standard-parabolic` | `TauCeti.TitsSystem.standardParabolicOrderIso : Set T.simple ≃o Set.Ici T.subgroupB`, `GroupTheory/TitsSystem/Parabolic/Classification.lean:146`; `standardParabolic_eq_of_subgroupB_le`, `:114` | the `B W_J B` classification with unique `J` |
| `homogeneous-quotient-scheme` | `TauCeti.HopfIdeal.exists_fppfHomogeneousQuotient_iso_projectiveOrbitPoints`, `Representation/ProjectiveOrbit/Quotient.lean:241` | for reduced (hence smooth) `G` and every closed `N`, an orbit scheme represents `G/N`; it is immersed in `Proj` (`Scheme.lean:79`), locally of finite type (`:162`) and separated (`:155`) |
| `borel-pointwise-normalizer` | `TauCeti.TitsSystem.normalizer_subgroupB`, `GroupTheory/TitsSystem/Parabolic/Normalizer.lean:83` | its only use (Layer 3, reductive `G`) follows from `gap:tits-system-of-points` with this lemma, so the gap is not minimal |

The module docstring of `Suggested.lean` (items 1–3) lists the predicate, the `B W_J B` classification, unconditional Borel conjugacy and the represented quotient as missing.

**Witness.** All five names elaborate in a scratch `#check` file at the pins. For example, `@HopfIdeal.IsBorelOverAlgClosed.exists_conjugate_eq : ∀ … {H : FiniteTypeCommHopfAlgCat k} {I J}, IsBorelOverAlgClosed k H I → IsBorelOverAlgClosed k H J → ∃ g, I.conjugate g = J`.

**Repair.**
- Delete the five gap paragraphs.
- Cite the pinned declarations, with their files, in table rows 45, 46, 49 and 51, in Conventions line 33 and in the `*Needs:*` lines of 1.1, 2.2, 3.1, 4.1 and the Layer 1–3 Dependencies.
- In 3.1, derive the normalizer from `gap:tits-system-of-points` and `TitsSystem.normalizer_subgroupB`.
- Rewrite docstring items 1–3 so they name only what is absent at the pin: the Tits system on `G(k)` for reductive `G`, the scheme `P_J`, the fixed point for general proper schemes, and the scheme-action/orbit comparison.

## R06 (P2) — Headline 3 is statable at the pins and absent from `Suggested.lean`

**Location.** `Suggested.lean:23–24`: "3. Projective `G/H` iff parabolic: the predicate and a represented homogeneous quotient scheme with projectivity and complete-scheme Borel fixed point."

**Claim.** Both carriers exist at the pin (R05). The file's own 4.0(c) statement already uses the representing projective-orbit scheme. The fixed-point theorem is a proof input, not a carrier.

**Witness.** The statement below, in a scratch copy elaborated against the pins, gives only a `sorry` warning. So does its characteristic-zero form with `[CharZero k]` and no `hH`.

**Repair.** Import `TauCeti.Algebra.AlgebraicGroup.Parabolic.Basic`, add the statement below under `/-! ## Layer 4: projectivity and the homogeneous-space dictionary -/`, name it in README 4.2 as the export "H parabolic ⇔ G/H proper", and delete docstring item 3.

```lean
/-- Headline 3: a smooth closed subgroup `H` of a smooth connected affine group is parabolic
exactly when the orbit scheme representing `G/H` is proper over `k`. -/
theorem isProper_projectiveOrbitToSpec_iff_isParabolicOverAlgClosed {k : Type u} [Field k]
    [IsAlgClosed k] (G : FiniteTypeCommHopfAlgCat.{u, u} k)
    (hG_smooth : smoothCommHopfAlgProperty k G.obj)
    (hG_connected : geometricallyConnectedCommHopfAlgProperty k G.obj)
    (H : HopfIdeal k G)
    (hH : smoothCommHopfAlgProperty k (FiniteTypeCommHopfAlgCat.quotient G H).obj)
    (M : FGComoduleCat.{u, u, u} k G) (m : M) (hm : Module.IsUnimodular k m)
    (e : CommHopfAlgCat.fppfHomogeneousQuotient G.obj H ≅
      Comodule.projectiveOrbitPointsSheaf (H := G.obj) m hm) :
    AlgebraicGeometry.IsProper (Comodule.projectiveOrbitToSpec (H := G) m hm) ↔
      HopfIdeal.IsParabolicOverAlgClosed k G H := by
  sorry
```

Computed instances (row A17 below):
- `SL₂` with `H = B`: proper ↔ parabolic, true ↔ true.
- `H = T`: the orbit of `[xy]` in `ℙ(Sym² k²)` is `ℙ²` minus a conic, not proper; `T` contains no Borel; false ↔ false.
- `F⁻¹(B)` in characteristic `p`: excluded by `hH`.

## R07 (P3) — Pull-request numbers and process words (gate `prnum`)

**Location.** `README.md:19, 56, 57, 58, 60, 226, 230, 235, 237, 238`; `Suggested.lean:38`: "`Module.Basis.flagTensorVector` are in progress in TauCeti PR #33233, not at this pin."

**Witness.** The gate reports `prnum=6`, at lines 56, 57, 226, 230 and twice at 235. Line 19 links `pull/853`. "In progress", "Tau Ceti main", "(main)", "if merged later" and "No merged roadmap" are process narrative.

**Repair.** Delete every pull-request number, link and status word. Cite roadmaps by name and section, and library declarations only as they exist at the pin. Most of these lines go with §4.0 under R02; line 19 goes under R03.

## R08 (P3) — A §4.0 Check about Chevalley lines is false where it is placed

**Location.** `README.md:241`: "An arbitrary Chevalley line need not have closed orbit; the flag locus and the dimension bound establish this for the constructed tensor line."

**Claim.** In 4.0(c), a Chevalley line is a line with stabilizer `B` (step 1). Every such line has a closed orbit, because the orbit is the image of the complete `G/B`. Read with an arbitrary stabilizer, the sentence is true but tests nothing in §4.0.

**Witness.** `SL₂` on `k²` with the line `⟨e₁⟩` (stabilizer `B`): the orbit is `ℙ¹`, which is closed. `Gₘ` on `k²` with weights 0 and 1, line through `(1,1)`: the stabilizer is trivial and the orbit is `ℙ¹∖{[1:0],[0:1]}`, which is not closed.

**Repair.** Moot under R02. If §4.0 is kept, replace the sentence with the `Gₘ` instance as a negative control, and add "every line with stabilizer `B` has closed orbit" as a consequence of (c).

## R09 (P3) — §4.0 form: theorem not named in the README, (a)–(b) without a locator, Lean section title

**Location.** `Suggested.lean:80, 85` (`/-! ## Layer 4: complete G/B -/`, `exists_closed_projectiveOrbit_borel_quotient`); `README.md:216–230`.

**Witness.**
- `exists_closed_projectiveOrbit_borel_quotient` occurs 0 times in the README.
- The README's Layer 4 is titled "projectivity and the homogeneous-space dictionary".
- 4.0(a)–(b) carry no locator. Milne 2017 §7.g, Propositions 7.29–7.30, p.146 (503f1a7d lines 6202–6208) give representability and projectivity of flag varieties.

**Repair.** Moot under R02. If §4.0 is kept: name the theorem in 4.0(c), cite Milne §7.g, Props 7.29–7.30, p.146 at (a)–(b), and use the README's Layer 4 title for the Lean section.

## Verified sound

**Read.** The whole README (343 lines) and `Suggested.lean` (98 lines) at c2f3de4, and the diff against main (2 files, +84/−12). Nothing outside the folder changed: `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/FlagVarieties'` is empty. `STATUS.md`, `PROGRESS.md` and `metadata.toml` are on main (gate `stray-files=0`).

**Gate.** My run of the brief's gate command:

```text
gate FlagVarieties: set_option=0 blob=0 latex=0 tex=0 prnum=6 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=1 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 FAIL
  depcheck: UPWARD: FlagVarieties (on main) -> ShimuraData (#116) at README lines [25, 253, 277]
```

The dependency check as instructed printed `UPWARD: FlagVarieties (on main) -> ShimuraData (#116) at README lines [25, 253, 277]` and `depcheck: 236 roadmaps, 2269 edges, 1 problem(s)`. This is R04; it is not a false positive.

**Elaboration.** `lake env lean TauCetiRoadmap/FlagVarieties/Suggested.lean`: exit 0, three `sorry` warnings (lines 61, 71, 85). To `#check` the cited names I built five pinned modules whose object files were missing, with `lake build <module>`. In a scratch copy, `#check @name` for all four declarations gives types identical to the worker's signature file, and each matches its README statement:

- `exists_closed_projectiveOrbit_borel_quotient` keeps `hG_smooth`, `hG_connected` and `hB`, matching README 232.
- `exists_unique_standardWeight_eq` keeps `[IsReduced …]` and `hIB`, matching README 128.
- `conjugate_eq_of_borel_le` keeps `hG_connected`, matching README 23.

No binder is lost. One-tactic probe: `simp_all` leaves all three sorried goals unsolved, so there is no padding. No Lean process is left running.

**Pinned declarations opened** (Tau Ceti 2fd255d; paths under `TauCeti/`):
- `HopfIdeal.IsParabolicOverAlgClosed` `Algebra/AlgebraicGroup/Parabolic/Basic.lean:82`
- `IsBorelOverAlgClosed.exists_conjugate_eq` `Borel/Conjugacy/Existence.lean:133`
- `IsBorelOverAlgClosed.exists_le_conjugate_of_isBorelCandidate` `Borel/Conjugacy/Containment.lean:47`
- `exists_conjugate_eq_of_isBorelOverAlgClosed` `Borel/Conjugation.lean:162` (README's `:161` is its docstring)
- `isBorelOverAlgClosed_iff_exists_eq_conjugate_of_isClosed_projectiveOrbit` `Borel/ProjectiveOrbit.lean:90`
- `TitsSystem.standardParabolicOrderIso` `GroupTheory/TitsSystem/Parabolic/Classification.lean:146` and `standardParabolic_eq_of_subgroupB_le` `:114`
- `TitsSystem.normalizer_subgroupB` `Parabolic/Normalizer.lean:83`
- `HopfIdeal.exists_fppfHomogeneousQuotient_iso_projectiveOrbitPoints` `Representation/ProjectiveOrbit/Quotient.lean:241`
- `Comodule.fppfHomogeneousQuotientIsoProjectiveOrbitPoints` `Quotient.lean:213` (needs the coset hypothesis and `IsReduced`)
- `Comodule.isClosed_range_projectiveOrbitMap_of_forall_mem` `ClosedOrbit.lean:104`
- `Comodule.topologicalKrullDim_range_projectiveOrbitMap_add_ringKrullDim_eq` `StabilizerDimension.lean:140`
- `Comodule.range_projectiveOrbitι` `Scheme.lean:100`
- `Comodule.exists_fixed_mem_of_isClosed_of_isSolvable` `ProjectiveOrbit/FixedPoint/Existence.lean:73`
- `HopfIdeal.exists_finite_subcomodule_exteriorPower_line_stabilizer` `Representation/ExteriorStabilizer/Character.lean:101`
- `AffineGroupSchemeCat.exists_isClosedImmersion_generalLinear` `Representation/Embedding.lean:212`
- `Comodule.exists_basis_coefficientMatrix_isUpperTriangular_of_isSolvable` `Solvable/LieKolchin.lean:420`
- `Module.Grassmannian.scheme` `AlgebraicGeometry/Grassmannian/Basic.lean:161` and `isProper_toSpec` `Proper.lean:230`
- Mathlib `Module.Grassmannian` `RingTheory/Grassmannian.lean:66` (quotient-rank convention, as README 216 says)
- `smoothCommHopfAlgProperty_of_charZero` `Smooth/CharZero.lean:151` (README's `:148` is its docstring)
- `HopfIdeal.eq_of_quotientPointsSubgroup_eq` `HopfIdeal/Points/Separation.lean:83` and `le_of_quotientPointsSubgroup_le` `:57`
- `CommHopfAlgCat.pointConjugation_mem_conjugate_iff` `HopfIdeal/Conjugation.lean:360`
- `glTitsSystem` `LinearAlgebra/Matrix/GeneralLinearGroup/Diagonal/TitsSystem.lean:195`

That is 24 declarations. The worker's Loogle and LeanSearch leads for the four declarations are all measure-theoretic or `GL₂` items, and none matches.

**Cross-roadmap citations resolved** (main 3090489, open heads from the index of 2026-11-09):
- On main: ReductiveGroups Layer 3A (README 249), 3A.4 (324), Layer 5 Lie–Kolchin (452), Layer 7 (627), 7b (732), 7C.5 (682); SchubertGeometry S1 (30), S1.1 (32), Scope (19); SchemeAndStackFoundations Layer 0 (463).
- At open heads: ShimuraData #1038 §3.8 (529); AlgebraicModuliForArithmeticGeometry #853 §1.3 (610, `flagBundle` 685); ReductiveGroups #1797 (1989–2000), #1676 (2259), #1332 (1759).

That is 15 citations. `roadmaps grep` finds `namespace TauCetiRoadmap.FlagVarieties` and the four names only in this roadmap (main and #2114), so there is no fully qualified name collision. The overlap file lists no other pull request changing this roadmap and no dropped ids.

**Seeded sample (15 targets).** Milne 2017 is read from the author page (cache 503f1a7d; printed page = marker − 12). Conrad–Feng is the version of 5 December 2020 (cache a0caf508). Every Milne and Conrad–Feng locator in the sample is correct in number, page and hypotheses:
- 0.2 / 5.1: Prop 5.22, p.104, line 4545.
- 0.3: Prop 7.11, p.141, line 6036; Prop 7.15, p.142, line 6061.
- `gap:homogeneous-quotient-scheme`: Thm 7.18, p.143, line 6102.
- 2.2 / 3.1: Thm 21.91, p.453, line 18691.
- 3.1: Thm 17.9(b), p.354, line 14526; Conrad–Feng T.1, p.305, line 13453.
- 3.2: Thm 17.48, line 15049, and Cor 17.49, p.367, line 15075.
- 4.0(c): Thm 17.9(a), p.354, line 14525.
- 4.1: Thm 17.16, p.356, line 14608.
- 4.2: Cor 17.3, p.353, line 14478.

Humphreys locators (2.1, 4.0, 4.1 and the reference list) are under Not verifiable. 1.1, 4.3, 5.2 and 6.1 carry no source locator of their own (they cite Layers 0–3 and the pin), and are checked by values below.

**Supplier order.**
- Every `*Needs:*` line resolves to a pinned declaration, a section on main or a declared gap, except 4.0(b)–(c) (R01) and 4.1/Layer 4 (R04).
- No layer depends on a later one; §4.0 is independent of Layers 1–3, as it says.
- ReductiveGroups, SchubertGeometry and SchemeAndStackFoundations are on main.

**Adversarial table** (22 rows; values computed by hand unless marked as elaborated).

| # | Statement | Instances tried | Values on each side | Result / change |
| --- | --- | --- | --- | --- |
| A01 | 0.1 point detection (94–96) | `μ_p` vs trivial, char `p`; `GL₃/𝔽₂`, `B ⊂ P_{s₁}` | both have points `{1}`, ideals `(x^p−1) ≠ (x−1)`; `#B(𝔽₂)=2³=8`, `#P_{s₁}(𝔽₂)=#GL₂(𝔽₂)·2²=24`, `8∣24` | sound; reducedness needed and present |
| A02 | 0.2 conjugation/quotient (104) | `g = 1`; Milne 5.22 | pinned `conjugate_one`: `I.conjugate 1 = I`; unique equivariant map from an `H`-fixed point | sound |
| A03 | 0.3 orbit comparison (110–112) | `Gₘ` on itself; Frobenius-twisted `SL₂` on `ℙ¹`, char `p` | `Gₘ/1` affine, homogeneous, not projective; stabilizer `F⁻¹(B)`, ideal `(c^p)`, nonreduced, excluded by smoothness | sound |
| A04 | H1 `exists_unique_standardWeight_eq` | `n = 0, 1, 2`; `F⁻¹(B) ⊂ GL₂` | `n=0`: only `J=∅`, weight `(0)`, ideal `⊥`; `n=1`: `∅ ↦ (0,−1) ↦ B`, `{0} ↦ (0,0) ↦ GL₂`, two overgroups ↔ two `J`; `F⁻¹(B)`: `(c^p) ≤ (c)` not reduced, excluded | sound; `simp_all` fails (elaborated) |
| A05 | 1.1 weights and Check | `n = 2` | `∅: (0,−1,−2)`, `{0}: (0,0,−1)`, `{1}: (0,−1,−1)`, `S: (0,0,0)`; `(2,1,0) − 2 = (0,−1,−2)`, same Borel | sound |
| A06 | 2.1 Check, point orders | `GL₃/𝔽₂` | `#P_J = 8, 24, 24, 168`; `#P_J/#B = 1, 3, 3, 21 = Σ_{w∈W_J} 2^{ℓ(w)}`; `#W_J = 1, 2, 2, 6` | sound |
| A07 | 2.2 classification | Milne 21.91; pin | source: unique `P_I` per `I`, every parabolic `⊇ B` is one; pin: `Set T.simple ≃o Set.Ici T.subgroupB` | sound; gap stale (R05) |
| A08 | 3.1 Check, orientation | `g=[[1,0,0],[1,1,0],[0,1,1]]`, char 2 | `g e₁ = (1,1,0)`; `g⁻¹ = [[1,0,0],[−1,1,0],[1,−1,1]]`, `g⁻¹e₁ = (1,1,1)` | directions differ, as stated |
| A09 | 3.1–3.2 bridge | Milne 17.9(b), 17.48, 17.49; Conrad–Feng T.1 | route equals Milne's proof (lines 15080–15084); conjugacy pinned | sound; gaps stale (R05) |
| A10 | H2 `conjugate_eq_of_borel_le` | `SL₂`, `P=B`; constant `S₃` | `gBg⁻¹ ⊇ B ⇒ = B`; `S₃`: `B={1}`, `⟨(12)⟩ ≠ ⟨(13)⟩` conjugate | connectedness needed and present |
| A11 | 4.0(a) Checks | `dim V = 0,1,2,3` | 0: empty product `= Spec k`, `⊗_∅ = k`, point; 1: `Gr` rank 0 = point; 2: `ℙ¹ × pt`, `g ⊗ det g` same projective action; 3: `Σ xᵢyᵢ = 0` in `ℙ²×ℙ²*`, dim `3 = 3·2/2` | true; duplicate (R03) |
| A12 | 4.0(b) basis change | upper-triangular `U`, `n=3` | tensor scales by `u₁₁³u₂₂²u₃₃ ≠ 0` | sound |
| A13 | 4.0(c) Lean theorem | trivial `G`; `Gₘ`; `SL₂` char 2 | trivial: `B=⊥`, `M=k`, `m=1`, orbit a point, proper; `Gₘ`: `B=G`; `SL₂`: `m=e₁`, Stab ideal `(c)` = `B`, orbit `ℙ¹` closed and proper | true; unpinned route (R01), second owner (R02) |
| A14 | 4.0 Check, Chevalley lines | `SL₂` line with stabilizer `B`; `Gₘ` weights 0, 1 | `ℙ¹` closed; `ℙ¹∖{0,∞}` not closed, stabilizer trivial | false as placed (R08) |
| A15 | 4.1, Milne 17.16 | `H = B, G`; `SL₂` | `G/B → G/H` surjective; `G/G` = point; `SL₂/B = ℙ¹` | sound; ShimuraData removable (R04, depcheck 0 after edit) |
| A16 | 4.2, Milne 17.3 | `SL₂`, `H=T`; `F⁻¹(B)` | `SL₂/T` dim 2, affine, not proper; `SL₂/F⁻¹(B) ≅ ℙ¹` proper but `H` not smooth, excluded | sound |
| A17 | H3 (R06 statement) | `SL₂`, `H = B, T, G`; `F⁻¹(B)` | `B`: true ↔ true; `T`: `ℙ²` minus conic, not proper; `dim T = 1 < 2`, no Borel: false ↔ false; `G`: point ↔ parabolic: true ↔ true; `F⁻¹(B)` excluded by `hH` | true; elaborates (scratch) |
| A18 | 4.3 / Layer 3 Examples | `GL₃` plane vs line types | both maximal parabolics have dim `9−2 = 7`; `Gr₂(k³)` and `ℙ²` abstractly isomorphic; types differ | sound |
| A19 | 5.1–5.2 | `GL₃`, `∅ → {s₁}`, `{s₁} → {s₂}` | `∅ ⊆ {s₁}`: one map; `{s₁} ⊄ {s₂}`: none | sound |
| A20 | 6.1 models | torus; `GL₃` | torus `S=∅`, `B=G`, one space; retained `D={1,2}∖J`: `∅→{1,2}`, `{s₁}→{2}`, `{s₂}→{1}` | sound; agrees with 2.1 Check |
| A21 | declared gaps vs pin | 5 slugs | 4 provided, 1 implied (table in R05) | stale (R05) |
| A22 | §4.0 cited names | 7 names | 7 × `Unknown constant` (elaborated) | unowned (R01) |

**Headline inventory.**
- Stated: headline 1 in `GL_{n+1}` form; the uniqueness half of headline 2.
- Statable but absent: headline 3 (R06).
- Not statable at the pin: headline 1 in general and headlines 2, 4 and 5. They lack the Tits system on `G(k)` for reductive `G` and the scheme `P_J` (`gap:tits-system-of-points`, `gap:standard-parabolic-scheme`; no reductive Tits system and no `P_J` at the pin). Headline 4 also lacks scheme actions with stabilizers.

## Not verifiable

- **Humphreys, *Linear Algebraic Groups*** (§§11–12, 17.6, 19, 21.2–21.3, 23.3, 24–30.1): Springer GTM 21, paywalled. It is not in the sources cache, and the README cites it by locator only (uncertified, line 343).
- **Bourbaki, *Lie* IV §2.5 Theorem 3** (in `gap:tits-standard-parabolic`): paywalled, not in the cache. The pinned `standardParabolicOrderIso` cites the same locator, so the statement is checked against the pin, not the text.
- **`design/plan.json`**: none is readable, so the README's gap slugs could not be compared with a plan's `gaps` list.
- **Tau Ceti #33233 and #33891**: outside the pins and not read; the README must not rely on them (R01).

## Source issues

- **Misprint** in Milne 2017 (503f1a7d) at Proposition 7.15, printed p.142: the smooth/finite clause names the morphism `G/H' → G/H`; it should be the canonical `G/H → G/H'` of the preceding sentence; affects a stated result.
- **Misprint** in Milne 2017 (503f1a7d) at Corollary 17.49, proof, printed p.367: conjugacy of the two Borel subgroups of `P°` is credited to 17.10 (maximal tori); it should be Theorem 17.9(b); affects the proof.
- **Gap** in Milne 2017 (503f1a7d) at Theorem 17.9, proof, printed p.354: it says every maximal-flag stabilizer in `G` is solvable, for a possibly non-faithful representation; it should note `ker r ⊆ Stab(L) = B`, which makes it solvable; affects the proof.
