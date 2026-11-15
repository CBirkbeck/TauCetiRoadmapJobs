# Review of ClassifyingSpaces (pull request #1807 at 683a4d5)

**Verdict:** needs changes

Incremental re-review of the 63 lines changed since `89357f3` (README only; `Suggested.lean` is unchanged).

## R01 (P2) — 2.3 states naturality in `A` and a connecting map on `X` without the morphism of local systems they need

**Location.** `TauCetiRoadmap/ClassifyingSpaces/README.md:1121–1137`: "The homology isomorphisms are natural in `A` and carry the connecting map of a short exact sequence of representations to `groupHomology.δ` … maps of twisted chain and cochain complexes that commute with the maps of these short exact sequences".

**Claim.** On `X` the clause has no maps: 2.3 builds a morphism `L_A → L_{A'}` only for an isomorphism of representations (lines 1080–1090), so `L_{A₁} → L_{A₂} → L_{A₃}`, its exactness and its `twistedHomologyδ` are not defined, and neither is the map for naturality in `A` (homology or cohomology).

**Witness.** `X` the circle, `A = A' = ℤ` trivial, `f` multiplication by `2`: not an isomorphism, so the transport bullet gives no `L_f`. Pin: `ofRepresentation` has no map in `ρ` (`TauCeti/AlgebraicTopology/LocalCoefficient/Representation.lean` 80–135); `TauCeti.Groupoid.natTransOfEnd` (`TauCeti/CategoryTheory/Groupoid/ConnectedFunctor.lean` 80) is not cited.

**Repair.** Add to 2.3, after the transport bullet: "**Functoriality in the representation.** For representations `ρ` on `V`, `ρ'` on `V'` of `π₁(X, x)` over `k` and a `k`-linear map `u : V → V'` with `u ∘ ρ(γ) = ρ'(γ) ∘ u` for every `γ`, there is exactly one morphism of local systems `ofRepresentation x ρ → ofRepresentation x ρ'` with component `u` at `x` (`TauCeti.Groupoid.natTransOfEnd`, `TauCeti.Groupoid.eq_natTransOfEnd`); every component is `u`; it respects identities and composition and is the transport above when `u` is invertible. For `f : A → A'` write `L_f : L_A → L_{A'}` for it. A short exact sequence of representations gives a short exact sequence `L_{A₁} → L_{A₂} → L_{A₃}` of local systems, exactness being fibrewise and every fibre sequence the given one." Then state the clause on these maps: naturality in `A` is for `twistedHomologyCoefficientMap L_f` and `twistedCohomologyCoefficientMap L_f`, and the connecting map is `CategoryTheory.ShortComplex.ShortExact.twistedHomologyδ` (`TauCeti/AlgebraicTopology/Singular/Twisted/Coefficients.lean` 151) of that sequence; in the route, add that the identification of step 3 commutes with `L_f` and the pullback of `TauCeti.classifyingSpaceLocalSystemMap k f` (both have component `f` at `x` under step 2, so uniqueness applies). Add the three pinned names to the *Needs:* line and to *From Tau Ceti*. On the witness: `u = 2` commutes with the trivial action, `natTransOfEnd` gives multiplication by `2` at every point, and `H₁(S¹; ℤ) → H₁(S¹; ℤ)` is multiplication by `2`, as is `H₁(ℤ, ℤ) → H₁(ℤ, ℤ)`; add this as a Check.

## Previous findings

- R01 — repaired: "The cohomology isomorphisms are natural in `A` and in `N` … When the module of `A` is projective over `k` … carry the Bockstein … No connecting map in cohomology is claimed for a short exact sequence in `A`". The repair's route sentence leads to this report's R01.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 2.3 Bockstein clause (changed) | pin `LocalCoefficients.lean` 331; `Bockstein.lean` 86; fibres of `L_A` | pin has `[Module.Projective k A]`, `S : ShortComplex (ModuleCat k)`, `n + 1 = m`, target `groupCohomology.δ` of `Rep.shortExact_map_ihom`; `ofRepresentation_obj`: fibre is `V` by `rfl` | matches README | none |
| 2.3 naturality in `A`, `N` (changed) | pin lines 174, 281, 301; `f = 2 : ℤ → ℤ` on the circle | on `BG` the maps are `classifyingSpaceLocalSystemMap f` and `linearYonedaObjMap`; on `X` no `L_f` for non-invertible `f` | `N` sound; `A` lacks its map | R01 |
| 2.3 homology connecting map (changed) | pin line 247; `Coefficients.lean` 151 | `twistedHomologyδ` needs `S.ShortExact` for `S` a short complex of local systems on one space; on `X` no such `S` is built | undefined on `X` | R01 |
| 2.3 route, `δ_naturality` (changed) | `Mathlib/Algebra/Homology/HomologySequenceLemmas.lean` 56 | `hS₁.δ i j ≫ homologyMap φ.τ₁ = homologyMap φ.τ₃ ≫ hS₂.δ i j` for `φ : S₁ ⟶ S₂` of short exact sequences of complexes; applies in `N` (one `A`, postcomposition) | sound for the Bockstein | none |
| 2.3 negative control, sequence in `A` (new Check) | `k = ℤ`, `G = 1`, `X` a point, `N = ℤ`, `0 → ℤ →(2) ℤ → ℤ/2 → 0` | point: cochains `Hom(A, ℤ)` in every degree, differentials `0, id, 0, …`, so `H⁰ = Hom(A, ℤ)`, `H^{>0} = 0`; `0 → 0 → ℤ →(2) ℤ`, cokernel `ℤ/2`, `H¹ = 0` | Check correct | none |
| 2.3 negative control, projectivity (new Check) | `A = ℤ/2`, values `ℤ →(2) ℤ → ℤ/2` | `Hom(ℤ/2, ℤ) = 0`, `Hom(ℤ/2, ℤ/2) = ℤ/2`, next term `H¹(X; L_A, ℤ) = 0`: kernel `ℤ/2`, image `0`; `0 → 0 → 0 → ℤ/2` not short exact, so `groupCohomology.δ` has no input | Check correct | none |
| Headlines `nonempty_twisted(Co)homology_iso_group(Co)homology` (cited by the changed text) | elaborated signatures at this head | `Rep.{u,u,u} k G`, `ofRepresentation x (A.ρ.comp Ψ)`, `ihom A` of `Rep.trivial k G N`; no naturality clause in Lean, so R01 does not touch them | match 2.3 | none |

The rows for untouched statements stand as in the previous review, of `89357f3`.

- Library declarations opened at the pins: 9 (`ClassifyingSpace/LocalCoefficients.lean` 174, 247, 281, 301, 331; `Cohomology/Twisted/Bockstein.lean` 86; `Singular/Twisted/Coefficients.lean` 151; `LocalCoefficient/Representation.lean` 80–111; Mathlib `HomologySequenceLemmas.lean` 56); every name the diff adds exists there with the stated file and hypotheses.
- Source locators: the diff adds none; the sampled 2.3 locator (Hatcher, Section 3.H, p. 328) re-read at `hatcher-at` line 14349: agrees. Sample targets 1.1–2.2 are untouched.
- Gate at `683a4d5` (worker's run): every check passes. Dependency check: `depcheck: 239 roadmaps, 2247 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration: `Suggested.lean` exits with four `sorry` warnings only (lines 84, 102, 123, 138); the file is byte-identical to the one probed at `89357f3`, so the one-tactic probe and the binder comparison stand.
- No change outside the pull request's declared folders. Overlaps: no cited id dropped or defined only by an open revision; the dropped Stage 2 heading is mapped (README line 108, 127); #1808 is ordered after this pull request in the merge-order block.
- Pull request text for this folder (summary clause; "drops 26 named declarations, adds three headlines"; "Stages 1–4 become Layers 1–2, with an item map"): agrees with the head; the 63 changed lines alter nothing it describes.

Overlap check: read AlgebraicTopology (this pull request's head), FinitenessAndDualityOfGroups, UniversalCovers, StableHomotopyKTheory; the nerve model and its comparison are AlgebraicTopology's (8.8a, 8.8b), the pointed classification of maps into an aspherical space is this roadmap's (1.1, 1.2), covering-space theory is UniversalCovers'; nothing has two owners.

Source independence: changed passages only; 4 passages compared with 1 source (`hatcher-at`, Section 3.H), none shared; largest share `hatcher-at`, 10 of 14 locators; the diff adds, removes or reorders no layer, so the contents were not compared again (independent at `89357f3`).

## Not verifiable

- Brown, Chapter III, Section 1; Milnor 1956; Schwamberger–Vogt 2009, §2: settled as uncertified, cited by locator only.
- Ownership against open pull requests: checked through the worker's index only.

## Source issues

- none

## For the human reviewers

- none
