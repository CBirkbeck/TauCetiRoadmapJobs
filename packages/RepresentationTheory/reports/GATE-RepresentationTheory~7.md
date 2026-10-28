# GATE-RepresentationTheory~7: answers to human review

Every comment concerns `TauCetiRoadmap/RepresentationTheory/LieGroups/README.md` and
`TauCetiRoadmap/RepresentationTheory/LieGroups/Suggested.lean`, the only roadmap files this pull request
changes, so those two files were edited. A family-index `TauCetiRoadmap/RepresentationTheory/Suggested.lean`
(module docstring and empty namespace only, declaring nothing: every headline is stated in a sub-roadmap's own
`Suggested.lean`) was added so the gate's required file exists.
Repair commits: `660c7ddb` and `fec59901` on top of `a56c637`, not pushed.

## H01 (roed-math) — answered

B1 (BWB construction and dependency chain) is resolved at head, in Layer 8 of `LieGroups/README.md`. The associated algebraic and analytic line, its coherent section sheaf and the H⁰ identification with `f(gb)=χ(b)⁻¹f(g)` and `(a·f)(g)=f(a⁻¹g)` are at lines 1751–1770. Native `Sheaf.H` cohomology, the all-degree `G_ℂ` actions and equivariant GAGA are at lines 1771–1795. The relative P¹ images, `pα*Lμ≃R¹pα*L_(sα·μ)` with `sα·μ=μ−(m+1)α`, the SchemeAndStackFoundations §2.2 Leray input and the shift `H^q(Lμ)≃H^(q+1)(L_(sα·μ))` are at lines 1889–1905. `K_X≃L_(−2ρ)`, dominant vanishing and the iteration along Weyl length are at lines 1906–1931. Recomputed: `⟨sα·μ,α∨⟩=m−2(m+1)=−m−2≤−2`, which matches the H¹ row of the P¹ table.

## H02 (roed-math) — answered

N1 is resolved at head. `weyl_conjugation_pushforward` (`LieGroups/Suggested.lean`, about line 516) states the weighted pushforward identity, and the docstring of `weyl_integration_formula` drops the bounded-density argument. README lines 836–842 carry the SU(2) example as a Check. Recomputed: Haar on SU(2) in the class angle is `(2/π)sin²θ dθ`, so `∫_G 1/sin²θ = 2`, while `∫ dθ/(2π sin²θ)` diverges on the torus. With `D=4sin²θ`, `f·D=4` is integrable, and `f=1` gives `(1/2)(1/2π)∫₀^{2π}4sin²θ dθ = 1`.

## H03 (roed-math) — answered

N2 is resolved at head. README lines 2232–2239 (Ordering) now list the early RG7 Levi/Bruhat contracts and the RG8/RG9 full-root-datum and pinned-Chevalley contracts that FCO F4.3 uses for root-generation connectedness. These come before the LG7 compact-form specialization.

## H04 (roed-math) — answered

N3 is resolved at head. README lines 116 and 281–288 restrict `unitsLieAlgebraEquiv` and `lieExp_eq_expUnit` to `[FiniteDimensional ℝ R]`, and keep the general complete-normed `expUnit` identities with their own hypotheses. This matches the pinned `TauCeti/Geometry/Lie/Exponential/Units/Compatibility.lean`: line 45 has the `CompleteSpace` section, and line 93 has the `FiniteDimensional ℝ R` section that holds `unitsLieAlgebraEquiv` (line 99) and `lieExp_eq_expUnit` (line 125).

## H05 (kim-em) — answered

The four claims in this status comment (B1, N1, N2, N3 addressed) were checked against head `a56c637` and hold; see H01–H04 for the lines. The comment's mention of affine-centre and exceptional-symmetric material raises no review point.

## H06 (roed-math) — applied

R1 is correct. The private `IsTitsSystem` record has no field forcing `B ∩ N_G(T) = T`. For `GL₂(𝔽₃)×C₂` with `T=(diagonal)×{1}`: `|N(T)|=16`, `|N(T)/T|=4`, `|B∩N(T)|=8`, and there are only 2 double cosets. So the record is weaker than a BN-pair over `N(T)/T`.

Change in `LieGroups/Suggested.lean`:
- Old (lines 1150–1194): `IsTitsSystem` and `bruhat_decomposition`, deleted. Abstract existence and uniqueness are proved at the pinned Tau Ceti as `TauCeti.TitsSystem.existsUnique_mem_bruhatCell` (`TauCeti/GroupTheory/TitsSystem/Bruhat/Uniqueness.lean:111`), whose Weyl group is `N ⧸ (B ∩ N)`.
- New (Layer 8 section docstring, lines 1141–1150): says this, and says the reductive application (a `TauCeti.TitsSystem` with `subgroupN = N(T)` and `B ∩ N(T) = T`) cannot be stated at the pins, which have no complex reductive group carrier.

Change in `LieGroups/README.md`:
- Old (line 1668): the Bruhat bullet cited RG7 only.
- New (line 1674): the bullet uses native `TauCeti.TitsSystem` and requires `𝐁(ℂ) ∩ N(𝐓(ℂ)) = 𝐓(ℂ)` and the isomorphism of Weyl quotients with `weylGroup T` (Humphreys §29.1). It adds three Checks:
  - `GL₂(ℂ)`: two cells;
  - the reviewer's `GL₂(𝔽₃)×C₂` negative control;
  - `B = T`: the double cosets give only the monomial matrices.
- The Tau Ceti `TitsSystem` declarations are added to the supplier list (lines 193–198), and Humphreys is added to the References. RG7 remains the owner of the generic Bruhat theorem.

## Build

- `lake build TauCetiRoadmap.RepresentationTheory.Suggested`: `Build completed successfully (8976 jobs).` The file is the family index: `import Mathlib`, the module docstring, and `namespace TauCetiRoadmap.RepresentationTheory` with no declarations, since the family page owns no theorem of its own and restating a sub-roadmap headline would plan it twice.
- `lake build TauCetiRoadmap.RepresentationTheory.LieGroups.Suggested`: `Build completed successfully (9171 jobs)`, exit 0, no errors apart from `sorry` warnings.
- No `#check` scratch file was elaborated: the repair adds no declaration, and the only changed signature is the deletion of two. The Tau Ceti names now cited in the README (`TauCeti.TitsSystem`, `TauCeti.TitsSystem.WeylGroup`, `existsUnique_mem_bruhatCell`, `bruhatCell_injective`, `disjoint_bruhatCell_iff`) were found by grep in the pinned `TauCeti/GroupTheory/TitsSystem/`. `roadmaps resolve` reports nothing unresolved in `LieGroups/README.md`.

## Gate

`gate RepresentationTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

Depcheck of the top-level `README.md` (`--movable`): `depcheck: 162 roadmaps, 1176 edges, 0 problem(s)`.

## Depcheck (`LieGroups/README.md`, `--movable`)

```
not movable: RepresentationTheory consumes NoncompactQuantumSymmetry (#197) and is consumed by ClassicalAdicEtaleCohomologyPartII (#185), which comes first: moving RepresentationTheory after NoncompactQuantumSymmetry would put a supplier after a consumer, a cycle through RepresentationTheory
UPWARD: RepresentationTheory (#180) -> NoncompactQuantumSymmetry (#197) at README lines [989]
CYCLE among: HilbertModules, NoncompactQuantumSymmetry, OperatorAlgebraDynamics, RepresentationTheory, VonNeumannAlgebras
depcheck: 162 roadmaps, 1177 edges, 2 problem(s)
```

The same output (line 983) is produced on head `a56c637` before this repair, so it predates this round. The top-level `RepresentationTheory/README.md` gives `0 problem(s)`.

The flagged line 989 is a false positive. It reads "This Lie-algebra supplier uses no NoncompactQuantumSymmetry theorem; that roadmap consumes it", which is a negation.

There is, however, a real upward citation that the tool did not flag. Line 2047 (Layer 9) consumes "the pre-polar part of NoncompactQuantumSymmetry M0", and cites it by a pull-request URL. NoncompactQuantumSymmetry comes after RepresentationTheory in the merge order. The repair is to move that pre-polar construction into Layer 9 here: the compatible compact real form, the positive Cartan involution, the adjoint-image comparison and the finite-cover construction. The reviewer accepted this ordering and no comment raises it, so it was not changed in this round. It is flagged here for the worker.

## Adversarial pass on changed statements

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| `B∩N(T)=T` for reductive `G` (README 8, Bruhat) | `GL₂(ℂ)`, upper triangular `B` | `N(T)` = monomial matrices; upper-triangular monomial = diagonal = `T` | holds | Check added |
| same, reductive hypothesis needed | `GL₂(𝔽₃)×C₂`, `B=B₀×C₂`, `T=T₀×1` | `|B∩N|=8≠4=|T|`; `|N/T|=4`; 2 double cosets | fails without it | negative-control Check added |
| Cells indexed by `weylGroup T` | `GL₂(ℂ)` | `|W|=2`; cells `B` and `{c≠0}` | holds | Check added |
| Borel needed, not just `B⊇T` | `B=T` in `GL₂(ℂ)` | `⋃ TnT = N(T)` ≠ `GL₂(ℂ)` (e.g. `[[1,1],[0,1]]∉N(T)`) | union is proper | Check added |
| Native `TitsSystem.WeylGroup = N⧸(B∩N)` | Tau Ceti `Basic.lean:107` | `abbrev WeylGroup := T.subgroupN ⧸ T.intersection` | matches | cited |
| BWB shift degree (H01, unchanged) | `μ` with `m=⟨μ,α∨⟩≥0` | `⟨sα·μ,α∨⟩=−m−2` | consistent with P¹ table | none |
| Weyl formula, `f=1` (H02, unchanged) | SU(2) | `(1/2)·(1/2π)·4π=1` | holds | none |

## Ownership and sources

- The abstract BN-pair is owned by Tau Ceti (`TauCeti.TitsSystem`). The generic Bruhat theorem for reductive groups is owned by ReductiveGroups Layer 7, on main (line 627 onwards).
- No new definition was introduced, so there was no ownership question against open pull requests.
- The new citation (Humphreys, *Linear Algebraic Groups*, §29.1) is a standard textbook cited by its locator. It was not fetched and is `uncertified`. The roadmap has no `sources.toml` within this job's edit scope.
- No suspicious instructions were found in the review text.
