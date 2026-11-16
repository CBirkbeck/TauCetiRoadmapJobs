# Review of MordellLawrenceVenkatesh (pull request #1231 at 4bf88fa)

**Verdict:** accepted

Incremental re-review of 55 changed lines since 9bbc6cb. No finding.

## Previous findings

- R01 — repaired: `Suggested.lean` line 59 reads `simp only [Algebra.algebraMap_eq_smul_one, LinearMap.smul_apply, one_apply_eq_self]`; elaboration gives the three `sorry` warnings only, and the description's validation sentence now says three.
- R02 — repaired: README lines 89, 198, 238 and `Suggested.lean` lines 18–19 name Mathlib `1b1ccf4` and Tau Ceti `2fd255d`, the revisions of `lake-manifest.json` at this head.
- R03 — repaired: "From Tau Ceti" cites `TauCeti.IsJordanCurve.exists_homeomorph_image_sphere` and `Homeomorph.sphereCone` with files; §5.2's sketch composes them; `schoenflies_extension`, its Layer 5 header and docstring mention are gone; the ConformalMapping contract line is removed.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| `semilinearCentralizer`, `algebraMap_mem'` (§0.3; sample target §0.4 uses it) | Head file elaborated at the pins | Warnings: `sorry` at 65:8, 80:8, 94:8; no deprecation, no error. Elaborated type unchanged: `Subalgebra F (Module.End E V)` with `hσ` explicit | Holds | none |
| §5.2 sketch, extension | `x ∈ C₁`, `u = e₁⁻¹x ∈ S¹` | `σu = e₂⁻¹f(e₁u) ∈ S¹` since `f(e₁u) ∈ C₂ = e₂(S¹)`; `F x = e₂(cone σ (u)) = e₂(σu) = f x` by `sphereCone_apply_coe` | Restricts to `f` | none |
| §5.2 sketch, closed disk | pinned conclusion `e '' ball = filledHull C \ C`, `e '' closedBall = filledHull C` | `e(ball)` open, connected, bounded; `ℂ ∖ e(closedBall)` connected, unbounded; closure of `e(ball)` is `e(closedBall) = filledHull C` | "`Cᵢ` and its bounded component" is right | none |
| §5.2, carriers | `TauCeti.IsJordanCurve C := Nonempty (C ≃ₜ Circle)`; `sphereCone (σ : sphere 0 1 ≃ₜ sphere 0 1) : E ≃ₜ F` | A simple closed curve in `ℂ` is a Jordan curve by definition; with `E = F = ℂ` the cone is `ℂ ≃ₜ ℂ` as the contract says | Types match | none |
| Scope item 6: "its twist `T_c` is the inverse of the twist of 5.11" | Torus, `î(a,b) = a·b = 1`, basis `(a,b)`, columns the images | GeometricTopology 1.7.2 `x ↦ x + (c·x)c`: `T_a = [[1,1],[0,1]]`, `T_b = [[1,0],[−1,1]]`. Here §5.12 `x ↦ x + î(x,b)b`: `T_a = [[1,−1],[0,1]]`, `T_b = [[1,0],[1,1]]` | Mutually inverse; equals 1.7.2's left-turning Check | none |
| §1.1, Nakayama step with the renamed lemma | `N' = M`, `N` the span of the lifts, `I = pℤ_p` | `Submodule.le_of_le_smul_of_le_jacobson`: `N'.FG`, `I ≤ Ring.jacobson R`, `N' ≤ N ⊔ I • N'` give `N' ≤ N`; `M ≤ N + pM` is the sketch's spanning mod `p` | Fits; `_bot` form is deprecated at the pin | none |

The rows for all other statements stand as in the previous review, of `9bbc6cb`.

- Library declarations opened at the pins (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`): 7 — `TauCeti.IsJordanCurve.exists_homeomorph_image_sphere` (`Analysis/Complex/Conformal/Jordan/Schoenflies.lean` line 122), `Homeomorph.sphereCone` and `Homeomorph.sphereCone_apply_coe` (`Analysis/Normed/Module/Ball/Radial/Cone.lean` lines 173, 213), `TauCeti.IsJordanCurve` (`Topology/JordanCurve/Basic.lean` line 107), `TauCeti.filledHull` (`Topology/FilledHull.lean` line 99), `Submodule.le_of_le_smul_of_le_jacobson` (`RingTheory/Nakayama.lean` line 152), `one_apply_eq_self` (target of the deprecation at `Algebra/Module/LinearMap/End.lean` line 60).
- Cross-roadmap citation resolved on main: GeometricTopology Layer 1.7.2 (README lines 1212–1280: compact smooth surfaces, diffeomorphisms, the twist formula and the left-turning Check; lines 165–170 name this roadmap's punctured surfaces and marked points as its own).
- Gate at this head: every scanner 0 and `build=0`, `OK`. Dependency check: `depcheck: 239 roadmaps, 2273 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `TauCetiRoadmap/MordellLawrenceVenkatesh/Suggested.lean`: three `declaration uses sorry` (65, 80, 94), nothing else. Four declarations; elaborated signatures compared with §§0.3, 0.4, 6.10, 11.6, no binder lost. One `import Mathlib`, one `TauCeti` module, no `set_option`, no sorry'd data.
- Leftovers of the repairs searched in both files: no `schoenflies_extension`, `ConformalMapping`, `6b7abb3`, `a91d3aa`, `Module.End.one_apply` or `_jacobson_bot` remains. Changes outside the folder: none.
- Pull request text against the head: three `sorry` declarations, the four declarations named, §5.2 as a README target and the mapping-class-group ownership sentence all agree with the head; nothing contradicted, nothing unstated.
- Sources: no locator was added or changed (§5.2 keeps GX13, Appendix E, Theorem E.1, p. 160, without the Thomassen cross-reference); the seeded sample meets the diff only at §0.4's supporting definition, whose mathematics is unchanged.
- Remark (untouched text): §§5.9–5.12 also cover closed compact surfaces, through homeomorphisms; GeometricTopology lines 168–169 describe a comparison with its diffeomorphism classes through its Layer 11.2.1, which no *Needs:* line here uses or requires.

Overlap check: read GaloisSectionsPadicPeriodMaps, MappingClassGroupsAndCanonicalRepresentations, TeichmullerGeometry, GeometricTopology; mapping class groups and Dehn twists of compact smooth surfaces: GeometricTopology Layer 1.7.2; those of topological surfaces with punctures and marked points: this roadmap (both texts now say so, with the same sign relation); the plane Schoenflies theorem: Tau Ceti at the pin; other shared objects and owners as in the review of `9bbc6cb`.

Source independence: changed passages only; 3 passages (scope item 6, the Tau Ceti contract bullet, the §5.2 sketch) compared with 2 texts (GeometricTopology Layer 1.7.2 on main, the two pinned Tau Ceti module docstrings), none shared beyond declaration names; largest share LV20; contents not compared again (no layer added, removed or reordered).

## Not verifiable

- "that repository … contains no `p`-adic Galois representations, `p`-adic Hodge theory, period maps, surface topology, mapping class groups, Hurwitz spaces or `S`-unit theorem": only directory names were read in the earlier round; carried, not rechecked.
- BO78, Corollary 7.4 (§2.11): no legal readable text found by the earlier search; carried.
- Fal83, §6, proof of Satz 5, pp. 362–363: paywalled, cited by locator alone (uncertified); carried.
- GX13: the legal author copy read earlier is dated 2025, not 2013; Appendix E numbering matched, edition identity uncertified; carried.

## Source issues

- none (no source was reopened this round; the entries of the earlier reviews stand).

## For the human reviewers

- Licence: `TauCetiRoadmap/MordellLawrenceVenkatesh/README.md` lines 3088–3105 record AxiomMath/Mordell (Apache-2.0, commit `82a30cb`) as prior art for the statement of §11.6. `mordell_finite` here differs from it in name, binders and conclusion form; no declaration looks adapted.
