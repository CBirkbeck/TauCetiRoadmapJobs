# Review of HypercompletenessAndCoherence (pull request #2270 at 04df60e)
Folder: `TauCetiRoadmap/InfinityCategoryTheory/HypercompletenessAndCoherence/`
**Verdict:** needs changes

## R01 (P2) — Six Tau Ceti declarations of the supplier contracts are not at the pin

**Location:** `README.md` lines 223–235 (`### From Tau Ceti`): "`SSet.catInfty` (`TauCeti/AlgebraicTopology/Quasicategory/CatInfty.lean`) … `SSet.slice.IsLimit`, `SSet.coslice.IsColimit` … `SSet.IsTerminalVertex` … `TauCeti.MarkedSSet.markedAnodyneExtensions` … `SSet.RightFibration`", and the `*Needs:*` lines that use them (§3.5, §4.1, §8.2.2, §9.3, §9.4, §11.1, §11.5).
**Claim:** The contracts cite these six declarations, with file paths, as Tau Ceti's. None exists at the pinned Tau Ceti (2fd255d); the cited files `Quasicategory/CatInfty.lean`, `Quasicategory/Limit.lean`, `Quasicategory/TerminalVertex.lean`, `SimplicialSet/Marked/Anodyne.lean` and the folder `SimplicialSet/AnodyneExtensions/LeftRight/` are absent.
**Witness:** At the pin, `TauCeti/AlgebraicTopology/Quasicategory/` holds only `Cartesian.lean`, `Core.lean`, `FullSubcategory.lean`, `LocallySmall.lean`, `RightMappingSpace.lean`; `SimplicialSet/Marked/` holds `Basic.lean`, `Limits.lean`, `MappingSpace.lean`. A search of the pinned sources for the six names returns nothing.
**Repair:** Rebase onto a main whose `lake-manifest.json` pins a Tau Ceti commit that has the six declarations, then recheck each name and path of lines 223–235 at that pin. `SSet.CartesianFibration` (`Cartesian.lean:110`) and `SSet.rlp_monomorphisms_iff` (`TrivialFibration.lean:171`) are at the pin and need no change.

## R02 (P2) — The hypercompletion of sheaves of spaces has an owner on main that the README does not name

**Location:** `README.md` lines 47–84 (`## Scope and ownership`), which name no roadmap for hypercompletion, hyperdescent or Postnikov convergence; §1.1.1, §1.2.1, §2.5.1, §2.5.2, §3.4.1.
**Claim:** These sections state, for an ∞-topos, what `EnhancedDerivedSheaves` §E2.7 on main states for the sheaves of spaces on a small site, from the same results (HTT, Prop. 6.5.2.8, Thm. 6.5.3.12, Cor. 6.5.3.13, Prop. 7.2.1.10). Two roadmaps own the object and neither cites the other.
**Witness:** `TauCetiRoadmap/EnhancedDerivedSheaves/README.md` (main) lines 2377–2379: "Provide `spaceSheaves`, `hypercompleteSpaceSheaves`, `spacePostnikovTower` and `spacePostnikov_convergence`", with the four HTT locators above.
**Repair:** Add to `## Scope and ownership`, under "Other roadmaps own the following": "EnhancedDerivedSheaves §E2.7 states the hypercomplete sheaves of spaces on a small site (*hypercompleteSpaceSheaves*) and the convergence of their Postnikov towers (*spacePostnikov_convergence*). §1.1, §1.2, §2.5 and §3.4 here are the statements for an arbitrary ∞-topos X, with the universal property of X^∧; the case X = Shv(C) is that section's." Cite §E2.7 at §1.1.1.

## R03 (P2) — Stone duality for spectral spaces is also owned by AnalyticStacks §2.10

**Location:** `README.md` line 1653: "2. **Lattices.** `Spec` induces an equivalence `Latᵒᵖ ≃ Top_coh` (SAG, Prop. A.1.5.10, p. 1749)", with lines 1668–1672 and the headline of lines 33–34.
**Claim:** The equivalence between bounded distributive lattices and spectral spaces with spectral maps is a target of AnalyticStacks, which is earlier in the merge order. It is stated here again with no citation.
**Witness:** AnalyticStacks (open pull request, `TauCetiRoadmap/AnalyticStacks/README.md` line 693): "Prove Stone duality for spectral spaces, `spectralStoneDuality`: `compactOpensFunctor` is an equivalence of categories"; `Suggested.lean` lines 225–230 state `compactOpensFunctor.IsEquivalence` for `SpectralSpaceCat ⥤ BddDistLatᵒᵖ`.
**Repair:** In `## Scope and ownership` add: "The equivalence of spectral spaces with bounded distributive lattices by compact opens is AnalyticStacks §2.10 (*spectralStoneDuality*); Layer 7 keeps the prime-ideal spectrum `Spec(Λ)`, its explicit quasi-inverse, the semilattice level and the Boolean level." Restate §7.4.1 (2) as: "Prove that `Λ ↦ Spec(Λ)` is quasi-inverse to the compact-opens functor of AnalyticStacks §2.10, through the isomorphism of Λ with the compact opens of `Spec(Λ)` (Prop. A.1.2.5 (5))", and add "AnalyticStacks §2.10" to the `*Needs:*` of (2). The `Suggested.lean` declarations about `LatticeSpectrum` stand.

## R04 (P2) — §10.3.1 defines `Sub(X)` again; Part InfinityTopoi §6.1.1 defines it

**Location:** `README.md` lines 2262–2265: "**10.3.1.** Use the following notation for **subobject posets** in an ∞-category `C` … `Sub(X)` is the poset of equivalence classes of subobjects under `⊆`."
**Claim:** The same object, with the same Check in `S`, is a target of the sibling Part, and §10.3.1 does not cite it (its third Check cites only §18.4, where `Sub(X)` means `Sub(1)` of an ∞-topos X).
**Witness:** `TauCetiRoadmap/InfinityCategoryTheory/InfinityTopoi/README.md` line 1122: "**6.1.1.** For an object X of an ∞-category 𝒳, `Sub(X)` is the collection of equivalence classes of monomorphisms into X … ordered by factorization"; its first Check is the power set of `π₀ X`.
**Repair:** Delete the definition and the first and third Checks of §10.3.1. Keep one sentence: "Subobject posets `Sub(X)` are those of Part InfinityTopoi §6.1.1 (SAG, Not. A.6.3.1, p. 1812); for an ∞-topos, `Sub(1)` is the underlying locale of Part InfinityTopoi §18.4." In the `*Needs:*` of §10.3.2 replace "§10.3.1 (subobject posets)" by "Part InfinityTopoi §6.1.1".

## R05 (P2) — Each layer is one section of HTT or SAG, in the books' order

**Location:** `README.md` lines 346–358 (`## How to read the build`) and lines 2852–2855: "Appendix A, pp. 1735–1829: Stone duality §A.1, coherent ∞-topoi §A.2, sheaves on finitary sites §A.3, Deligne completeness §A.4, semisimplicial objects and hypercoverings §A.5, ∞-pretopoi §A.6, Postnikov completeness §A.7.2".
**Claim:** The twelve layers map one to one onto source sections, and within Layers 1–3, 5, 6 and 8 the subsections follow the statement order of the section. The dependency lines force the order 1 → 2, 1 → 3, 4 → 5 → 6, 8 → 9 → 10 → 11 and 7 → 10 (§2.3.1, §3.5.1, §5.1.1, §6.1.3, §9.3.3, §10.4.1, §10.5.2, §11.4.2); they do not force the scope of a layer.
**Witness:** Layers 1, 2, 3 ↔ HTT §6.5.2, §6.5.3, §7.2.1. Layers 4, 5, 6 ↔ SAG §1.3.1, §1.3.2, §1.3.3. Layers 7, 8, 9, 10, 11, 12 ↔ SAG §A.1, §A.2, §A.3 (with §20.4), §A.4, §A.5 (with §A.6.1–2), §A.7.2.
**Repair:** Give each layer the scope its consumers need. (a) Merge Layer 12 into Layer 3: its content is one definition and §3.4. (b) Move §10.2, a computation of homotopy dimension, to Layer 3. (c) In Layer 7, §7.2.1, §7.2.4 and §7.4.1 (1) have no consumer in Layers 8–12 (§10.4 needs only Thm. A.1.6.11): order the layer by what §10.4 uses, with level (2) cited as in R03. (d) §11.1 is consumed only by the definition §11.2.3 and no theorem here is stated for a pretopos: state §11.2.3 for ∞-topoi and cut §11.1, or add the pretopos theorems as targets. Add second sources for the main results: Johnstone, *Stone Spaces*, §II.3–§II.4 (Layer 7); Mac Lane–Moerdijk, *Sheaves in Geometry and Logic*, §IX.9–§IX.11 (§10.3–§10.5); SGA 4, Exp. VI, Prop. 9.0 (§10.5.2).

## R06 (P3) — HTT Counterexample 6.5.4.2 does not state that sheaves on the Hilbert cube are not hypercomplete

**Location:** `README.md` lines 380–381: "the ∞-topos of sheaves on the Hilbert cube is not (HTT, Counterexample 6.5.4.2, p. 700, a topological example this family does not plan)"; repeated at lines 2720–2721, 2800–2802 and 2817–2818.
**Claim:** The locator is cited as the statement. The source there builds a sheaf on Q × [0, 1] to refute proper base change for hypercompletions; non-hypercompleteness of Shv(Q) follows only by a further step.
**Witness:** HTT line 31766: the counterexample is announced as one to base change "if we work with hypercomplete ∞-topoi"; HTT lines 31772 and 31782–31787: the sheaf lives on X = Q × [0, 1] and is ∞-connective along Q × {0}.
**Repair:** Line 380: "…while the ∞-topos of sheaves on the Hilbert cube Q is not: the sheaf of HTT, Counterexample 6.5.4.2, p. 700, on Q × [0, 1] is ∞-connective along Q × {0} and has no section near it, so its restriction to Q × {0} ≅ Q is an ∞-connective sheaf that is not final (a deduction from that example, which the source does not state)." Use "by §1.1, Checks" at the three later places.

## R07 (P3) — One datum, two namings, chosen by source

**Location:** `README.md` lines 106–107: "Layers 1–6 name it by f_*, as HTT does. Layers 8–12 name the same datum by its pullback, as SAG does".
**Claim:** A geometric morphism is written `f_* : Y → X` in Layers 1–6 and `f^* : X → Y` in Layers 8–12, so "a geometric morphism X → Y" changes direction between §3.2.1 and §10.1.1. The supplier, Part InfinityTopoi §10.1.1, fixes the first.
**Witness:** Line 808: "a geometric morphism `f_* : X → Y`" (from X to Y); line 2198: "a family of geometric morphisms `fα^* : X → Xα`" (from Xα to X).
**Repair:** Keep the convention of Part InfinityTopoi §10.1.1 throughout and delete the two sentences of lines 106–107. In Layers 8–12 write "the pullback `f^* : X → Y` of a geometric morphism from Y to X"; for example line 2198: "Define a family of geometric morphisms from ∞-topoi Xα to X, with pullbacks `fα^* : X → Xα`, to be **jointly surjective** when …".

## R08 (P3) — `X` denotes the ∞-topos and its object in the same formula

**Location:** `README.md` lines 1721–1722: "Call an object `X` quasi-compact when the slice ∞-topos `X_{/X}` is quasi-compact"; line 1895: "`X ∈ X` is coherent exactly when `LX` is coherent"; line 1998: "`C ×_X X_{/X} ≃ C_{/q}`".
**Claim:** In Layers 8–11 the ∞-topos and an object of it carry the same letter, so `X_{/X}` and `X ∈ X` cannot be read without the source at hand.
**Witness:** Line 1998: in `C ×_X X_{/X}` the first two `X` are the ∞-topos and the third is the limit of `f ∘ q`. Layers 4–6 already write 𝒳 for the ∞-topos (line 1348: "an ∞-topos 𝒳, an object X").
**Repair:** Write 𝒳 for the ∞-topos in Layers 8–11: `𝒳_{/X}`, `X ∈ 𝒳`, `C ×_𝒳 𝒳_{/X}`, `L : 𝒳 → 𝒳^∧`.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §1.3.1 (HTT, Prop. 6.5.2.13) | Y = X = S; Y = Δ[0] | S^∧ = S, both sides Fun_*(S, S); Y = Δ[0]: final objects of X^∧ and of X, the same, a final object being hypercomplete | holds | none |
| §1.4.1, §1.4.2 | f^* constant X → Δ[0]; L : X → X^∧; identity | constant: inverts the monomorphism ∅ → 1, which is not ∞-connective, so (1) and (2) both fail; L and identity: both hold | equivalent on each | none |
| §1.5.1 | X″ = X^∧; X″ = Δ[0]; X″ = X | X^∧: S is the equivalences, X′ = X; Δ[0]: S contains ∅ → U, X′ = Δ[0]; X: X′ = X″ = X | holds | none |
| §4.1.1, §4.1.2 | 𝒳 = Δ[0]; 𝒳 = S; 𝒳 = S × S | final objects of 𝒞; F(∂Δ[1]) = F(Δ[0])², covariant variant gives 4 points against 1; Sp × Sp on both sides | holds | none |
| §6.1.1–§6.1.3 | 𝒳 = S; F = Hℤ[−1]; F = 0 | f^* = id, only ∞-connective sheaf is 0; π₋₁(Hℤ[−1]) = ℤ, so "n ≥ 0 only" is weaker | holds | none |
| §6.3.1 (SAG, Prop. 1.3.3.6) | empty family; U = 1; S × S with two summands | empty: ∅ → 1 is no effective epimorphism unless 𝒳 is trivial, hypothesis excludes it; U = 1: tautology | holds | none |
| §7.3.2, §7.3.3 | Λ = {⊥}; {⊥ < a < ⊤}; four-element Boolean; finite subsets of ℕ | ∅, 1 ideal = 1 open; Sierpiński, 3 ideals = 3 opens; two points, 4 = 4; ℕ discrete, Hausdorff, not compact, Λ has no ⊤ | holds | none |
| §8.2.1–§8.2.3 | S¹, BG, ℤ in S; ∏_ℕ S | Δ[0] ×_{S¹} Δ[0] ≃ ℤ not quasi-compact, S¹ not 1-coherent; BG coherent iff G finite; final object of ∏_ℕ S not quasi-compact | agrees with SAG, Ex. A.2.1.7 | none |
| §8.3.1 (SAG, Prop. A.2.1.3, Cor. A.2.1.4) | n = 1: Δ[0] → S¹; Δ[0] → Bℤ/2 | fibre ℤ: not relatively 0-coherent, and S¹ is not 1-coherent; fibre ℤ/2: hypotheses hold, Bℤ/2 is 1-coherent | holds | none |
| §9.3.1, §9.3.2 | S = equivalences; empty family; opens of ℝ | covers are the finite coproduct decompositions; empty family covers C iff ∅ → C lies in S; ℝ by bounded intervals has no finite subcover | holds | none |
| §9.4.1 (SAG, Prop. A.3.3.1) | C = finite sets, S = surjections; S = equivalences | F(n) = F(1)ⁿ and Čech nerves split, so (2) is automatic; equivalences: Čech nerve constant, sheaf iff product-preserving | holds | none |
| §10.1.1 (SAG, Prop. A.4.2.1) | empty family; identity; L : X → X^∧ | empty: (1), (2), (4) each hold iff X is trivial; L: detects ∞-connective morphisms, not equivalences | four conditions agree | none |
| §10.4.1 (SAG, Lemma A.4.4.3) | Λ = {⊥ < ⊤}; Λ atomless | Spec = point, Shv(Λ) = S, f^* = id; atomless: Shv(Λ) has no point, Spec(Λ) has ultrafilters, f^* not an equivalence | holds | none |
| §11.1.1, §11.1.2 | N(FinSet); finite spaces; ∅ → Δ[0] | ℤ/2 on a point: quotient a point, ℤ/2 → pt × pt not invertible, (d) fails; ΩS² infinite, (a) fails; Čech nerve of ∅ → Δ[0] realizes to ∅ | holds | none |
| §11.5.1–§11.5.3 (SAG, Prop. A.5.7.2) | n = 0, 1; C = finite sets, S = surjections | M₀ = X₋₁, M₁ = X₀ ×_{X₋₁} X₀; Shv = S is hypercomplete, both conditions reduce to F(n) = F(1)ⁿ | holds | none |
| §2.5.1 hyperdescent | X = S, constant object on S¹ | n = 2: S¹ → free loop space, π₀ = ℤ, not surjective; not a hypercovering, so colimit S¹ ≠ Δ[0] is no contradiction | holds | none |
| §3.4.1, §3.5.1 | P(Bℤ); Δ[0] | slice over the representable is S, local dimension ≤ 0; free ℤ-set has no homotopy fixed point, global dimension not ≤ 0; P(Bℤ) hypercomplete objectwise | holds | none |
| §5.3.1, §5.4.1 | 𝒳 = S; P(Bℤ), Hℤ with trivial action | heart of Sp; sections Hℤ ⊕ Hℤ[−1], π₋₁ = ℤ: in the heart but not sectionwise connective, pushforward not right t-exact | holds | none |
| §6.2.1 (SAG, Prop. 1.3.3.3) | 𝒳 hypercomplete; F ∞-connective and hypercomplete | f_* = id, all F hypercomplete; (3) on id_F gives F ≃ 0 | holds | none |
| §9.5.1, §10.5.2 | S as Shv(finite sets)^∧; Shv(Λ), Λ atomless | S: the identity point detects equivalences; Shv(Λ): hypercomplete with no point, hence not locally coherent, as §10.5.2 requires | holds | none |
| `LatticeSpectrum.*` (nine theorems) | Λ trivial; Λ = {⊥ < ⊤}; f : ∅ → Spec Λ′ | trivial: Spec = ∅, T2 and complemented both true; f from ∅: spectral, and exactly one bounded homomorphism Λ′ → 1 | true on each | none |
| `isSpectralMap_iff_existsUnique_boundedLatticeHom` | ℕ ∪ {∞} → Sierpiński, ℕ ↦ open point | left: preimage ℕ not compact, false; right: g(a) would be a finite set containing every n, none exists, false | holds | none |
| `SemisimplicialKan`, `exists_sSet_of_semisimplicialKan` | X = ∅; one vertex, no edge | ∅: no horn, Kan, Y = ∅; one vertex: horn Λ[1,0] unfilled, not Kan, and not underlying a simplicial set | holds | none |
| `fibration_iff_semisimplicialKanFibration` | Δ[0] → Δ[1] at vertex 0 | n = 0, i = 0: horn is the vertex 0, z the edge 01, no lift; not a fibration on either side | holds | none |
| §7.4.1 (2) against AnalyticStacks §2.10 | Sierpiński; ∅ | both: three-element chain and one-element lattice | one theorem, two owners | R03 |
| §10.3.1 against Part InfinityTopoi §6.1.1 | S¹ and ∅ in S | both: 2 elements, 1 element | one object, two owners | R04 |
| §1.1.1 against EnhancedDerivedSheaves §E2.7 | X = Shv(C) | both: local objects for ∞-connective maps, by HTT, Prop. 6.5.2.8 and Cor. 6.5.3.13 | one object, two owners | R02 |
| §1.1 Check, Hilbert cube | HTT, Counterexample 6.5.4.2 | source: sheaf on Q × [0, 1], base change statement; README: Shv(Q) not hypercomplete | true, not at the locator | R06 |

- Source locators checked against the text: HTT, 31 statements at their pages, 13 read in full; SAG, 114 at their pages, about 70 read in full; all pages agree with the README.
- Library declarations opened at the pins: Mathlib 14 found (among them `SSet.rlp_monomorphisms`, `CategoryWithFibrations.lean:129`; `DistribLattice.prime_ideal_of_disjoint_filter_ideal`, `Order/PrimeSeparator.lean:46`; `PrespectralSpace.opensEquiv`, `Prespectral.lean:111`; `SemiSimplexCategory.homEquiv`, `SemiSimplexCategory.lean:54`); Tau Ceti 2 found, 6 absent (R01).
- No lattice spectrum, Stone duality for lattices, semisimplicial Kan condition or ∞-topos at either pin; the docstring's "not statable" list holds.
- Cross-roadmap citations resolved: 645 occurrences of sibling sections (313 with a paired locator found in the cited item); 7 items of ModelCategoryTheory at its open head; AdicEtaleGeometry §A1.15 and AlgebraicKTheory §4.3 on main.
- Gate at 04df60e: every check passes. Dependency check: `depcheck: 223 roadmaps, 1972 edges, 0 problem(s)`, no UPWARD or CYCLE line. No change outside the family folder.
- Elaboration: `lake env lean` on `Suggested.lean`, 12 `sorry` warnings, no error. The 17 elaborated types were compared with the README; only `LatticeSpectrum.exists_homeomorph` lacks the section binders, correctly, Λ being existential. Nothing changed.
- One-tactic probe on a scratch copy: none of the 12 theorems closes by `rfl`, `infer_instance` or `simp`; no padding. Every headline not stated is named in the docstring with its missing carrier.
- Every definition has at least three Checks; every layer ends with Examples and Dependencies.

Overlap check: read AnalyticStacks, KanQuillen, SimplicialCategories, EnrichedLocalization, ModelCategories, EnhancedDerivedSheaves; Stone duality for spectral spaces: owner AnalyticStacks §2.10 (R03); hypercomplete sheaves of spaces and their Postnikov towers: owner EnhancedDerivedSheaves §E2.7 (R02); the ModelCategoryTheory Parts share nothing.

Source independence: 22 passages compared with 2 sources, none copied (longest shared run 15 words, the statement of HTT, Prop. 6.5.2.19); largest share HTT, 507 of 662 explicit locators; contents compared with HTT and with SAG: the layers follow their sections (R05).

## Not verifiable

- HA: not fetched; cited only through Part StableInfinityCategories and not in the sample.
- Kerodon, Theorem 3.2.7.1 (§1.1, §3.4): not opened; not in the sample.
- Jar87 and RS71: paywalled; cited for attribution only, without a locator.
- DHI04 and TV02: not opened; cited for attribution only.
- The pull request's statement that the six declarations of R01 exist at Tau Ceti 8b9f13d993: that commit is not in the worktree.
- Johnstone, Mac Lane–Moerdijk and SGA 4 (repair of R05): cited from memory at section level; the author checks the locators.

## Source issues

- **Misprint** in HTT at Prop. 6.5.2.16 (2), PDF p. 689: the source says the conclusion is that f is ∞-connective; it should be that the morphism u is ∞-connective; affects nothing.
- **Error** in SAG at Rem. A.1.6.10, p. 1751: the source says an open set of a Hausdorff space is quasi-compact exactly when it is closed; it should be that quasi-compact opens are closed, the converse needing compactness (ℕ discrete); affects nothing.
- **Misprint** in SAG at Def. A.2.0.12, p. 1751: the source says the map from the coproduct over I is again an effective epimorphism; it should be the coproduct over the finite subset I₀; affects nothing.
- **Misprint** in SAG at the proof of Prop. 1.3.3.6, p. 122: the source says one reduces to α = 0 and writes the last map from Z × U to Y × U; it should be n = 0 and Y × U → Z × U; affects nothing.
- **Misprint** in SAG at the proof of Lemma A.4.4.3, p. 1784: the source says h^* has source X; it should be Shv(C); affects nothing.
- **Misprint** in SAG at §A.5.7, p. 1805, and at the proof of Thm. A.3.4.1, p. 1770: the source says "Theorem ??" and "Remark ??"; it should be Theorem A.5.3.1 and a remark on the final object of a coherent ∞-topos; affects nothing.

## For the human reviewers

- **Scope.** SAG, the only source of the statements of Layers 4–12, is an unpublished manuscript headed "Under Construction!" (version of 3 February 2018); HTT is published (Annals of Mathematics Studies 170).
- **Scope.** Layer 7 (`README.md` line 1397) is order theory and point-set topology with no ∞-categories, inside a family the pull request describes as ∞-category theory with no applications.
- **Licence.** HTT and SAG were read from the author's page (math.ias.edu/~lurie); the host is in no licence class of the sources service and was classed `author-page` for this review.
- **Ownership.** The description asks the maintainers to choose the owner of the material shared with EnhancedDerivedSheaves and BordismFormalGroups; R02 applies the rule that a roadmap on main is cited. A decision the other way changes R02's repair.
- **Pin.** The description says 11 of 13 `Suggested.lean` files need Tau Ceti 8b9f13d993; this folder's file builds at the pin, but its README cites declarations of the newer commit (R01).
