# Review of MordellLawrenceVenkatesh (pull request #1231 at 9bbc6cb)

**Verdict:** needs changes

Incremental re-review of 27 changed lines since 3756140. The added section is sound; the three findings come from the merge of main in this head, which moved both library pins (Mathlib `6b7abb3` → `1b1ccf4`, Tau Ceti `a91d3aa` → `2fd255d`, read from `lake-manifest.json`).

## R01 (P1) — The gate's build check fails: a deprecation warning in `semilinearCentralizer`

**Location:** `TauCetiRoadmap/MordellLawrenceVenkatesh/Suggested.lean` line 59: "`simp only [Algebra.algebraMap_eq_smul_one, LinearMap.smul_apply, Module.End.one_apply]`".

**Claim:** At the head's Mathlib pin `Module.End.one_apply` is deprecated, so the file no longer elaborates with `sorry` as its only warning and the gate reports `build=1 FAIL` (the module still compiles). The description's "the targeted Lake build succeeds with `sorry` as the only warning" is false at this head for the same reason.

**Witness:** Mathlib at `1b1ccf4`, `Mathlib/Algebra/Module/LinearMap/End.lean` line 60: `@[deprecated one_apply_eq_self +typeChanged (since := "2026-10-26")]`. Elaboration: warning at 59:69, then the four `sorry` warnings.

**Repair:** In line 59 replace `Module.End.one_apply` by `one_apply_eq_self`. Tested on a copy at this pin: the four `declaration uses sorry` warnings (lines 65, 78, 92, 106) and nothing else. The description's sentence then holds again unchanged.

## R02 (P3) — The README and the module docstring name pins the head no longer has

**Location:** `TauCetiRoadmap/MordellLawrenceVenkatesh/README.md` line 194 "### From Mathlib (pinned at `6b7abb3`)", line 234 "### From Tau Ceti (pinned at `a91d3aa`)", line 85 "(Tau Ceti at `a91d3aa`,"; `Suggested.lean` lines 18–19 "absent from Mathlib `6b7abb3` and Tau Ceti `a91d3aa`".

**Claim:** These four passages state the pins of the previous head; the merge of main changed both.

**Witness:** `lake-manifest.json` at `9bbc6cb`: `mathlib` rev `1b1ccf4b088b…`, `TauCeti` rev `2fd255d997f4…`; at `3756140` they were `6b7abb3c7686…` and `a91d3aafa8cd…`.

**Repair:** Write `1b1ccf4` for `6b7abb3` (README line 194, `Suggested.lean` line 18) and `2fd255d` for `a91d3aa` (README lines 85 and 234, `Suggested.lean` line 19). The other "absent at the pins" claims of the docstring were rechecked at the new pins and stand (see the table).

## R03 (P3) — §5.2 plans a proof of Schoenflies that the head's Tau Ceti pin already has

**Location:** `TauCetiRoadmap/MordellLawrenceVenkatesh/README.md` line 1733: "Thomassen's extension proof extends the boundary homeomorphism over these components … *Needs:* ConformalMapping L5, Jordan separation and filled-hull topology on `TauCeti.IsJordanCurve`"; lines 285–286; `Suggested.lean` lines 12 and 76–84.

**Claim:** At `2fd255d` Tau Ceti proves the plane Schoenflies theorem and has the cone of a circle homeomorphism; 5.2 is their composite, yet the supplier contract cites neither and `Suggested.lean` keeps it as a headline.

**Witness:** `TauCeti.IsJordanCurve.exists_homeomorph_image_sphere` (`TauCeti/Analysis/Complex/Conformal/Jordan/Schoenflies.lean` line 122) gives `eᵢ` with `eᵢ(S¹) = Cᵢ`; `Homeomorph.sphereCone` (`TauCeti/Analysis/Normed/Module/Ball/Radial/Cone.lean` line 173). `F = e₂ ∘ cone(e₂⁻¹ f e₁) ∘ e₁⁻¹` restricts to `f`.

**Repair:** Add both declarations, with their files, under "From Tau Ceti". Replace the proof sketch of 5.2 by: "*Proof sketch.* Choose plane homeomorphisms `e₁, e₂` carrying the unit circle onto the two curves (`TauCeti.IsJordanCurve.exists_homeomorph_image_sphere`); `σ = e₂⁻¹ ∘ f ∘ e₁` is a homeomorphism of the unit circle and `e₂ ∘ σ.sphereCone ∘ e₁⁻¹` extends `f` (`Homeomorph.sphereCone_apply_coe`). (GX13, Appendix `E`, Theorem `E`.1, p. 160.) *Needs:* Tau Ceti `TauCeti.IsJordanCurve.exists_homeomorph_image_sphere`, `Homeomorph.sphereCone`." Delete `schoenflies_extension` and its Layer 5 header from `Suggested.lean`, its mention in the docstring (line 12) and the backticked name and signature sentence in 5.2: a short corollary of two pinned declarations is not a headline; the README keeps the statement.

## Previous findings

- none: the previous report, of `3756140`, was an acceptance with no finding.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| `semilinearCentralizer`, `algebraMap_mem'` (R01) | Head file; copy with `one_apply_eq_self` | Head: 5 warnings (1 deprecation, 4 `sorry`). Copy: 4 `sorry` warnings, no error | Repair elaborates | R01 |
| §5.2 `schoenflies_extension` against the pin (R03) | `x ∈ C₁`, `u = e₁⁻¹x ∈ S¹` | `F x = e₂(σ u) = e₂ e₂⁻¹ f(e₁ u) = f x`; `σ u ∈ S¹` since `f(e₁u) ∈ C₂ = e₂(S¹)` | Corollary of two pinned declarations | R03 |
| New section: `Faltings.finite_setOf_comp_eq_id_of_two_le_genus` "states §11.6 on that repository's carriers" | External statement at commit `82a30cb` against `mordell_finite` | External: `[IsCurve k f] [IsProjectiveVariety k f] [Smooth f] [GeometricallyIntegral f]`, `2 ≤ genus f`, sections `σ ≫ f = 𝟙` finite. Here: smooth, proper, geometrically connected, dimension 1, `2 ≤ C.genus K`, `Finite` of `Over` morphisms | Same theorem, different name, binders and conclusion form | none |
| New section: "for smooth curves geometric integrality is geometric connectedness" | Two disjoint lines over `K`; a smooth geometrically connected curve | Two lines: smooth, not connected, not integral, so both sides fail. Smooth and connected over `K̄`: regular and connected, hence integral, so both sides hold | Holds as stated | none |
| New section: `Faltings.finite_setOf_place_isDegreeOne` | External statement at `82a30cb` | `[FunctionField K F]`, `2 ≤ genus K F`, `{v : Place K F \| v.IsDegreeOne}.Finite` | Matches "degree-one places of a function field of one variable" | none |
| Docstring "not statable at the pins" claims at the new pins (R02) | grep of Tau Ceti `2fd255d` and Mathlib `1b1ccf4` | No Mordell, Faltings-finiteness, S-unit-equation or semilinear-centralizer declaration; Schoenflies present (R03) | Stand, except 5.2 | R02, R03 |

The rows for all other statements stand as in the previous review, of `3756140`.

- External repository read at commit `82a30cb` (4 pages: root, `Mordell/`, `Mordell/BombieriVojta/`, the two theorem files): licence Apache-2.0, dependency on AxiomMath/Stacks, own toolchain, both theorem names, namespaces and hypotheses agree with the new section; `BombieriVojta/` has `Admissible`, `Taylor`, `SmallSection`, `Norm`, `DerivativeEstimate`, `Mumford`, `Conclusion` as the section says.
- Cross-roadmap citations of the new section resolved at the open head of HeightsRationalPointsAndObstructions: §5.10 (line 2509), §5.11 (2579), §5.12 (2590), §6.4 (2932), `mordell_finite` at `Suggested.lean` line 79.
- Library declarations opened at the head's pins: 4 (`Module.End.one_apply`, `TauCeti.IsJordanCurve.exists_homeomorph_image_sphere`, `Homeomorph.sphereCone`, `Homeomorph.sphereCone_apply_coe`).
- Gate at this head: every scanner 0 except `build=1`, `FAIL` (R01). Dependency check: `depcheck: 235 roadmaps, 2253 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `TauCetiRoadmap/MordellLawrenceVenkatesh/Suggested.lean`: one deprecation warning (59:69) and four `declaration uses sorry` (65, 78, 92, 106). Elaborated signatures of the 5 declarations unchanged from `3756140`; no binder lost.
- Changes outside the folder against the pull request's base: none (the files listed as changed since `3756140` are main's, brought in by the merge). No `set_option`, no sorry'd data, one `import Mathlib` and one `TauCeti` module.
- Pull request text: title and description read against the head; apart from the validation sentence (R01) nothing is contradicted. The seeded sample falls in the diff nowhere; §5.2 of the sample is touched by R03 through the pin, not through its source locator.
- Remark (untouched text): GeometricTopology on main names its Layer 1.7.2 the owner of mapping class groups of compact surfaces and Dehn twists; §§5.9–5.12 here define them and cite GeometricTopology Layer 1 only.

Overlap check: read GaloisSectionsPadicPeriodMaps, MappingClassGroupsAndCanonicalRepresentations, TeichmullerGeometry, GeometricTopology; the changed passage adds no object; shared objects and owners as in the review of `3756140` (the first two cite this roadmap as owner; mapping class groups and Dehn twists of compact surfaces: GeometricTopology Layer 1.7.2; §11.6's declaration: HeightsRationalPointsAndObstructions; §6.10's: DiophantineApproximationAndTranscendence §2.4).

Source independence: changed passages only; 1 passage compared with 1 source (the AxiomMath/Mordell README and two docstrings at `82a30cb`), none shared beyond theorem names; largest share LV20; contents not compared again (no layer added, removed or reordered).

## Not verifiable

- "that repository … contains no `p`-adic Galois representations, `p`-adic Hodge theory, period maps, surface topology, mapping class groups, Hurwitz spaces or `S`-unit theorem": only the 17 directory names under `Mordell/` were read (none suggests them; there is a `Roth` directory), not the roughly 430 modules.
- BO78, Corollary 7.4 (§2.11): no legal readable text found by the earlier search; carried, not rechecked.
- Fal83, §6, proof of Satz 5, pp. 362–363: paywalled, cited by locator alone (uncertified); carried.
- GX13: the legal author copy read earlier is dated 2025, not 2013; Appendix E numbering matched, edition identity uncertified; carried.

## Source issues

- none (no source was reopened this round; the eleven entries of the review before `3756140` stand).

## For the human reviewers

- Licence: `TauCetiRoadmap/MordellLawrenceVenkatesh/README.md` lines 3075–3100 now record AxiomMath/Mordell (Apache-2.0, commit `82a30cb`) as prior art for the statement of §11.6. `mordell_finite` here differs from it in name, binders and conclusion form; no declaration looks adapted.
