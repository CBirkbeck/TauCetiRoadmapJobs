# GATE-MappingClassGroupsAndCanonicalRepresentations~1: answers to human review

Review answered: kim-em, 2026-11-19T00:53:05Z, on pull request head d940044 (seven numbered
requests). Repairs are in commit b09679c on the pull request branch (not pushed). Line numbers
below are at b09679c, in `TauCetiRoadmap/MappingClassGroupsAndCanonicalRepresentations/README.md`
unless `Suggested.lean` is named.

## H01 (kim-em) — applied

§2.1 now states as an API bullet (lines 619–622) that `ρ` is MCG-finite exactly when the conjugacy class of `ρ` has finite orbit under the outer action of `PMod(g, n)`. Proof: forgetting `x` maps `PMod(g, n + 1)` onto `PMod(g, n)` for every `(g, n)` (MordellLawrenceVenkatesh §5.9 states `Forget` surjective with no Euler-characteristic hypothesis), and the based action of a class represents the outer class of its image. The old prose clause in the definition paragraph is gone.

## H02 (kim-em) — applied differently

The `Mod(g, n)` form is now an API bullet (lines 623–629), but the action does not come from SurfaceGroupCharacterVarieties. It is MordellLawrenceVenkatesh §5.9's action of `Mod(S)` on conjugacy classes through `Out(π₁)`, computed through the based action of the marked group `Mod(Σ_{g,n}*)`, a supplier already listed. `PMod(g, n + 1)` is the kernel of the permutation action of `Mod(Σ_{g,n}*)` on the `n` punctures, so its image has index at most `n!`, and the finite-index bullet applies. The definition paragraph (lines 599–607) now cites Landesman–Litt, Definition 1.1.1, p. 2 (LL24 line 45), as the `Mod(g, n)` condition these bullets reach.

## H03 (kim-em) — disputed

SurfaceGroupCharacterVarieties cannot go on §2.1's *Needs:* line. It comes after this roadmap in the merge order (`ORDER.txt` line 316, against 314 for this roadmap), and at its head 9210ba3 its §§3.3, 3.5, 4.1 and 7.2 list this roadmap's §§0.1–0.2, 1.4 and 2.1 as *Needs*. A supplier edge back to it would be a roadmap-level cycle even though no section-level cycle exists. The reviewer's fallback, stating the `Mod(g, n)` comparison in SurfaceGroupCharacterVarieties, is already there: its §3.5 deduces "MCG-finite in the sense of §2.1 iff the `Mod_{g,n}`-orbit is finite". H02 makes the statement here as well, using an earlier supplier.

## H04 (kim-em) — applied

The bullet about automorphisms normalizing `H` is now a transport bullet (lines 615–617): for `θ : G ≃ G'` and `H' = θHθ⁻¹`, `ρ` has the property for `H` exactly when `ρ ∘ θ⁻¹` has it for `H'`. A new bullet (lines 630–638) proves independence of the base point and of the model. The reviewer's `fundamentalGroupMulEquivOfPath` exists at the pinned Mathlib (`Mathlib/AlgebraicTopology/FundamentalGroupoid/FundamentalGroup.lean:48`). It is conjugation in the groupoid, `γ ↦ δ⁻¹ ≫ γ ≫ δ`, which is the map induced by the end map `h` of an isotopy lifting `δ` along MordellLawrenceVenkatesh §5.17's evaluation bundle. Conjugation by `h`, and likewise by a homeomorphism `F` of models, carries one marked pure group onto the other.

## H05 (kim-em) — applied

The reviewer's first option is taken. No other roadmap owns Dehn–Nielsen–Baer for punctured surfaces: TeichmullerGeometry §5.4 is closed-only, and SurfaceGroupCharacterVarieties lists it as "not owned and not planned". §0.2 (lines 196–222) therefore replaces "only the containment is used" with a target: for every `(g, n)`, the image of `PMod(g, n + 1)` has index at most two in `pureMappingClassAut g n`, being all of it for `n ≥ 1` and of index two for `n = 0`, `g ≥ 1`. The route goes through TeichmullerGeometry §5.4's `dehn_nielsen_baer` after gluing one-holed tori to the boundary circles, and the three small cases are direct. A new §2.1 bullet (lines 639–643) states MCG-finite ⟺ `HasFiniteConjugacyOrbitUnder (pureMappingClassAut g n) (ρ ∘ θ)`. The `Suggested.lean` header (lines 15–20) and the `pureMappingClassAut` docstring (lines 97–102) now say "equivalent" instead of "implied by". The same one-way wording is corrected to "equivalent" in §6.1 (line 1726), §6.5 (line 1878), §6.6 (line 1914), §6.7 (line 1935), §9.3 (line 2285) and §12.6 (line 2787).

## H06 (kim-em) — disputed

`TauCeti.SurfaceGroup.Orientable` (`TauCeti/GroupTheory/SurfaceGroup/`) and `TauCeti/Geometry/Diffeomorphism/MappingClassGroup.lean` are not in the pinned Tau Ceti. The pin is 2fd255d (2026-11-04), identical on origin/main and on this branch. A search of the pinned Tau Ceti and Mathlib for surface groups and mapping class groups returns nothing. Those files reached Tau Ceti main on 2026-11-14 to 2026-11-17 (#37570 and later), and the reviewer's Mathlib `048fffa1` is not the pin `1b1ccf4b`. `Suggested.lean` may import only modules that exist at the pin, so `surfaceGroup` stays a local `PresentedGroup`. The Scope sentence now gives both reasons (line 2957): no roadmap import, and no presented surface group in the pinned Tau Ceti.

## H07 (kim-em) — applied differently

The names do appear in the merged roadmap: on main, `TauCetiRoadmap/FreeGroupsAndLimitGroups/Suggested.lean` declares `OrientableSurfaceGroup` (line 1022, with the docstring "the README's `SurfaceGroup.orientable`") and `isFreeGroup_orientable` (line 1053). Because that README calls the group `SurfaceGroup.orientable`, this README now gives both names: in *Conventions* (line 77), §0.1 (line 125), Scope (line 2951) and the supplier contract (line 3146).

## H08 (kim-em) — applied

Scope (lines 3034–3040) now says that the general representation scheme, the affine quotient and the outer action of the extended mapping class group are SurfaceGroupCharacterVarieties §§3.3, 4.1 and 7.2. That roadmap consumes this one and proves the comparisons: §1.4's `R_r(Γ)` and `M_r(Γ)` (its §§4.1, 7.2), §0.2's outer action (its §3.3) and §2.1's MCG-finiteness (its §3.5), all checked at its head 9210ba3. §§0.2 and 1.4 here are unchanged. This roadmap names it in Scope only, never on a *Needs* line, so the dependency check shows no edge to it.

## H09 (kim-em) — applied differently

The `<source id> line N` locators stay. They are the repository's citation form for the legal texts the sources manifest records with their hashes, and 19 READMEs on main use them. Most already sit beside a theorem, lemma, section or page; the reviewer's example `LL22 line 2048` (line 143) already reads "proof of Lemma 7.5.1". The three that stood alone now carry readable locators: `SS22 line 413` → "Sabbah–Schnell, §24, p. 10" (line 1307), `Sch19 line 520` → "Schnell, §9, p. 11" (line 1329), and `Dri12 line 41` → "Drinfeld 2012, §1.2" (line 1525).

## H10 (kim-em) — applied

The Check at line 648 used to read "finitely many homomorphisms into its image, and finitely many conjugacy classes of embeddings". It now reads: each `ρ ∘ φ` takes values in the finite group `ρ(G)`, and a finitely generated `G` has finitely many homomorphisms to it, so `S` can be those, with no conjugation.

## Build and gate

- `lake build TauCetiRoadmap.MappingClassGroupsAndCanonicalRepresentations.Suggested` at b09679c:
  `Build completed successfully (18239 jobs).` The only warnings are the six `declaration uses
  'sorry'` warnings (lines 202, 219, 234, 250, 259, 272) and the module-system note on `import
  Mathlib`.
- Gate summary line:
  `gate MappingClassGroupsAndCanonicalRepresentations: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Dependency check (`gate --depcheck … --movable --pr 2266`), before and after the edits:
  `depcheck: 199 roadmaps, 2188 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- `roadmaps resolve` on the edited README found no cross-roadmap citations and no Lean names that
  resolve nowhere.

## Elaborated signatures

The `Suggested.lean` diff touches docstrings only (module header, `pureMappingClassAut`,
`HasFiniteConjugacyOrbitUnder`). No declaration's binders, type or body changed, so the 16
elaborated types in the worker's signature list, from its `#check @name` file at d940044, are
still the types at b09679c. I did not elaborate a second scratch file, because the only Lean command
this job may run is the module build. I compared each type with its README statement and found no
dropped binders:
- `mcgFinite_finite_image` and `rankTwo_mcgFinite_finite_image` take
  `HasFiniteConjugacyOrbitUnder (pureMappingClassAut g n) ρ`. The new §2.1 bullet makes this
  equivalent to MCG-finiteness through `θ`.
- The three Prym theorems quantify over `Γ' ≤ prymStabilizer ϕ` with `relIndex ≠ 0`. §6.1 now
  states that the topological `Γ` has index at most two in `prymStabilizer`.

The worker's transcript also reports two elaboration errors in its own scratch harness (line 276:
`#check` after `end`; line 280: `…group`). They are artefacts of how `#check` lines were appended,
not of `Suggested.lean`.

## Ownership

The only object added here is the Dehn–Nielsen–Baer index statement for punctured surfaces (§0.2).
Searching `roadmaps grep` for Dehn–Nielsen–Baer, peripheral-structure realization, Zieschang and
`Out*` across main and the open heads finds:
- TeichmullerGeometry (#1169, head 417bd27) owns only the closed case, §5.4 `dehn_nielsen_baer`
  for genus `≥ 1`, which is cited as an input.
- SurfaceGroupCharacterVarieties (#2430, head 9210ba3) says in its Scope that Dehn–Nielsen–Baer for
  punctured surfaces is "not owned and not planned here".

No other roadmap states it, so this roadmap owns it. Its suppliers are TeichmullerGeometry §§0.0d
and 5.4, FreeGroupsAndLimitGroups §§4.7 and 6.3 (on main) and MordellLawrenceVenkatesh §§5.9, 5.16
and 5.19, all earlier in the merge order. No notion moved down from a later roadmap.

## Adversarial pass on the added and changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §0.2 DNB: `[pureMappingClassAut g n : im PMod(g,n+1)] ≤ 2`, `= 1` for `n ≥ 1` | `(0,0)` | trivial group; both sides trivial; index 1 | holds | none |
| same | `(0,1)` | `⟨c₁ ∣ c₁⟩ = 1`; index 1 | holds | none |
| same | `(0,2)` | `⟨c₁,c₂ ∣ c₁c₂⟩ ≅ ℤ`; `Aut = {±1}`; `c₁ ↦ c₁⁻¹` is not pure; `pureMappingClassAut 0 2 = 1`; index 1 | holds | none |
| same | `(0,3)` | an element of `pureMappingClassAut` fixes `[c₁], [c₂]` in `H₁ = ℤ²`, so it is IA, so it is inner (Nielsen, `IA(F₂) = Inn F₂`); image of `PMod(0,4) ≅ F₂` is `Inn`; index 1 | holds | none |
| same | `(1,0)` | `pureMappingClassAut 1 0 = GL₂(ℤ)`, image `SL₂(ℤ)`; index 2 (`det = −1` swap `a↔b` outside) | holds; matches the existing Check | none |
| same | `(1,1)` | `F₂`, `c₁ = [a,b]⁻¹`; pure ⟺ outer class in `SL₂(ℤ)`; image of `PMod(1,2)` maps onto `Mod(1,1) ≅ SL₂(ℤ)` and contains `Inn`; index 1 | holds | none |
| same, wrong model "orientation-preserving part also for `n ≥ 1`" | `n ≥ 1` | an orientation-reversing class sends `cⱼ` to a conjugate of `cⱼ⁻¹`, which the non-inversion bullet excludes from `pureMappingClassAut`, so no index-two subgroup arises | wrong model excluded | none |
| handle route: each `cⱼ` essential in `S` | `(0,3)`, `(1,1)`, `(0,n≥3)`, `g≥1,n≥1` | handle side has genus 1; other side has genus `g + n − 1 ≥ 1` iff `g + n ≥ 2`, true in the hyperbolic range with `n ≥ 1` | holds, so TeichmullerGeometry §0.0d applies | none |
| handle route: amalgam step | `(1,1)` | `S⁺(1,1) ∗_ℤ S⁺(1,1) = S⁺(2,0)`: FreeGroupsAndLimitGroups §6.3(1) with `g₁ = g₂ = 1`, `m₁ = m₂ = 0` | holds | none |
| handle route: extension of `φ` | any `φ(cⱼ) = hⱼcⱼhⱼ⁻¹` | on the edge group, both sides send `cⱼ ↦ hⱼcⱼhⱼ⁻¹`; inverse built from `φ⁻¹` with `kⱼ = φ⁻¹(hⱼ)⁻¹`, and the handle composite is `w ↦ w` | holds | none |
| handle route: normalizer | vertex group `π₁(Σ_{g,n,0})`, rank `2g+n−1 ≥ 2` | `u` normalizing `G_v` makes `G_v` fix `v` and `u·v`, hence an edge, hence lie in a cyclic edge group unless `u·v = v`, that is `u ∈ G_v` | holds (needs non-cyclic, true for rank ≥ 2) | none |
| §2.1 transport bullet | `G = G' = ℤ`, `H = 1`, `θ = −1`, `ρ(1) = 2` | `ρ∘θ⁻¹(1) = 1/2`; both orbits are singletons | holds | none |
| same, ψ case | `G = F₂`, `H = Inn`, any `ψ` | `ψ Inn ψ⁻¹ = Inn`; every `ρ` has a one-class orbit on both sides | holds | none |
| PMod(g,n) outer-action bullet | `(1,0)` | `PMod(1,1) → PMod(1,0)` is `SL₂(ℤ) ≅ SL₂(ℤ)`; based = outer | holds | none |
| same | `(0,3)` | `PMod(0,4) = F₂ ↠ PMod(0,3) = 1`; every `ρ` MCG-finite (one class under `Inn`); outer orbit is a point | holds | none |
| Mod(g,n) bullet | `(0,3)` | image of `Mod(Σ_{0,3}*)` contains `Inn` with index `≤ 3! = 6`; `Mod(0,3) ≅ S₃` finite, so every `ρ` has finite orbit, matching the previous row | holds | none |
| same | `(1,0)` | `n! = 1`; `Mod(1,0) = PMod(1,0)` | holds | none |
| base-point bullet: `h_* = c_δ` | Mathlib definition at pin | `((isoEquivHom ..).symm ⟦p⟧).conj`: `γ ↦ p⁻¹ ≫ γ ≫ p`, the path `δ̄·γ·δ`; `h∘γ ≃ δ̄·γ·δ` rel endpoints via `H(s,t) = h_t(γ(s))` | holds | none |
| same | `(1,0)`, two paths `δ, δ'` | `c_δ = c_δ'` since `π₁` is abelian | holds | none |
| θ bullet (Lean form) | `(1,0)` | `θ⁻¹ H_x θ = SL₂(ℤ)` has index 2 in `GL₂(ℤ)`; orbit finite under one iff the other | holds | none |
| Check: finite image ⇒ finite orbit | `G = ℤ`, `ρ(1) = −1`, `H = Aut ℤ` | `Hom(ℤ, {±1})` has 2 elements; `S` = these | holds | none |
| same, without finite generation | `G = ⊕_ℕ ℤ/2`, `ρ` = first coordinate in `{±1}`, `H = Aut G` | `ρ∘φ` runs over all nonzero functionals, which are pairwise non-conjugate in abelian `GL₁`; orbit infinite | finite generation needed, as stated | none |
| §6.1 index `≤ 2` in `prymStabilizer` | trivial quotient `H = 1` | `prymStabilizer = pureMappingClassAut`, image of `Γ` = image of `PMod`; index `≤ 2` | holds; matches existing §6.1 Check | none |
| same, general | `A = pureMappingClassAut`, `B` = image | `[A∩Stab : B∩Stab] ≤ [A : B] ≤ 2` | holds | none |
| §§6.5–6.7, 9.3, 12.6 "equivalent" | both directions | Lean ⇒ README: image of a finite-index `Γ'' ⊂ Γ` has finite index in `prymStabilizer`. README ⇒ Lean: preimage in `Γ` of `Γ' ∩ im Γ` has finite index | holds | wording changed |
| Scope sentence on SurfaceGroupCharacterVarieties | its head 9210ba3 | §3.3 "restriction of `Ψ_x` is §0.2's outer action"; §3.5 MCG-finite iff `Mod_{g,n}`-orbit finite; §4.1 `Hom(Γ, GL_r) = R_r(Γ)`; §7.2 `Hom(Γ, GL_r)//GL_r = M_r(Γ)` | all present | none |
| FreeGroupsAndLimitGroups §6.3 contract text | main README line 1525 | gluing with inverse orientation; both boundary maps injective; neither piece a disc | matches | none |
| TeichmullerGeometry §5.4 contract text | #1169 `Suggested.lean` line 593 | hypotheses: compact connected T2, empty boundary, orientable, genus `≥ 1`; `MappingClassGroupFull S ≃* OuterAut (π₁ S x₀)` | matches | none |

## Notes

- One suspicious-text check: the review contains no instruction to run commands or change tooling.
  It was treated as data.
- No source was fetched. The new locators (SS22 §24 p. 10, Sch19 §9 p. 11, Dri12 §1.2) were read
  from the cached extractions at the cited lines. LL24 Definition 1.1.1 is at LL24 line 45, p. 2.
  FM12 stays cited as `uncertified` by its existing locator §8.2.
- Ownership against the open pull requests was checked with the 191 checkouts and
  `roadmaps grep`/`show`.
