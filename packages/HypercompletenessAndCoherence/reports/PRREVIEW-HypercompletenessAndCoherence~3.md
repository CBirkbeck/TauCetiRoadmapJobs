# Review of HypercompletenessAndCoherence (pull request #2270 at a6d7928)
Folder: `TauCetiRoadmap/InfinityCategoryTheory/HypercompletenessAndCoherence/`
**Verdict:** needs changes

Previous review (at 7e04598), finding by finding: its R01 not repaired (R01 here: lines 228–240 unchanged, pin unchanged); R02 not repaired (R02); R03 not repaired, a Johnstone locator was added at line 1800 (R03); R04 repaired (Layer 12 is §3.7, the Boolean sheaves are §3.6, the pretopos section is cut, Joh82 and MM92 added); R05 repaired (`NOTES.md` deleted); R06 repaired (line 1004: "Part CartesianFibrations §5.4.1"); R07 repaired (Part InfinityTopoi now has "**6.2.2.** … (HTT, Prop. 6.2.1.5, p. 594)"); R08 repaired (§10.2.1); R09 repaired (no "geometric morphism `f^*`" remains); R10 partly (R06); R11 repaired (line 2776: "the deduction from HTT, Counterexample 6.5.4.2"); R12 partly (R07).

## R01 (P2) — Six Tau Ceti declarations of the supplier contracts are still not at the pin

**Location:** `README.md` lines 228–240 (`### From Tau Ceti`): "`SSet.catInfty` … `SSet.slice.IsLimit`, `SSet.coslice.IsColimit` … `SSet.IsTerminalVertex` … `TauCeti.MarkedSSet.markedAnodyneExtensions` … `SSet.RightFibration`", and the 16 later lines that use them (101, 1004, 1008, 1098, 1148, 1243–1244, 1971, 2070, 2218, 2235–2236, 2284, 2342–2343, 2760, 2814, 2834).
**Claim:** The contracts cite these six names, with file paths, as Tau Ceti's. `lake-manifest.json` at this head and on main pins Tau Ceti 2fd255d, where none of the six exists.
**Witness:** At the pin `TauCeti/AlgebraicTopology/Quasicategory/` holds only `Cartesian.lean`, `Core.lean`, `FullSubcategory.lean`, `LocallySmall.lean`, `RightMappingSpace.lean`; a search of the pinned `TauCeti/` for the six names returns nothing.
**Repair:** Either rebase onto a main whose `lake-manifest.json` pins a commit containing the six and recheck lines 228–240 there, or cite at each use the Part that states the notion in place of the Tau Ceti name (marked anodyne maps: Part CartesianFibrations §5.2, already at line 267) and delete the six bullets. `SSet.CartesianFibration` (`Cartesian.lean:110`) and `SSet.rlp_monomorphisms_iff` (`TrivialFibration.lean:171`) are at the pin and stay.

## R02 (P2) — The hypercompletion of sheaves of spaces has an owner on main that the README does not name

**Location:** `README.md` lines 70–84 (`## Scope and ownership`, "Other roadmaps own the following, or it is outside this family"), which name no roadmap for hypercompletion or Postnikov convergence; §1.1.1, §1.2.5, §2.5.2, §3.4.1.
**Claim:** These sections state for an ∞-topos what `EnhancedDerivedSheaves` §E2.7, on main, states for sheaves of spaces on a small site. A roadmap on main is cited by an open one; this README never names it.
**Witness:** `TauCetiRoadmap/EnhancedDerivedSheaves/README.md` (main) lines 2375–2379: "### E2.7 Sheaves of spaces … Provide `spaceSheaves`, `hypercompleteSpaceSheaves`, `spacePostnikovTower` and `spacePostnikov_convergence`"; a search of this README for "EnhancedDerivedSheaves" returns nothing.
**Repair:** Add under "Other roadmaps own the following": "EnhancedDerivedSheaves §E2.7 states the hypercomplete sheaves of spaces on a small site (*hypercompleteSpaceSheaves*) and the convergence of their Postnikov towers (*spacePostnikov_convergence*). §1.1, §1.2, §2.5 and §3.4 here are the statements for an arbitrary ∞-topos X, with the universal property of X^∧; the case X = Shv(C) is that section's." Cite §E2.7 at §1.1.1.

## R03 (P2) — Stone duality for spectral spaces is also owned by AnalyticStacks §2.10

**Location:** `README.md` lines 1800–1801: "2. **Lattices.** `Spec` induces an equivalence `Latᵒᵖ ≃ Top_coh` (SAG, Prop. A.1.5.10, p. 1749; Johnstone, *Stone Spaces*, Cor. II.3.3 …)", with lines 1806–1820 and the headline of lines 33–34.
**Claim:** The equivalence of bounded distributive lattices with spectral spaces and spectral maps is a target of AnalyticStacks, a new roadmap earlier in the merge order (line 359 against 442), so citable. It is stated here again with no citation; a second source does not settle ownership.
**Witness:** AnalyticStacks (open, new roadmap), `TauCetiRoadmap/AnalyticStacks/README.md` line 693: "Prove Stone duality for spectral spaces, `spectralStoneDuality`: `compactOpensFunctor` is an equivalence of categories"; line 15: "is not stated by Mathlib or by another roadmap and is a target of 2.10".
**Repair:** In `## Scope and ownership` add: "The equivalence of spectral spaces with bounded distributive lattices by compact opens is AnalyticStacks §2.10 (*spectralStoneDuality*); Layer 7 keeps the prime-ideal spectrum `Spec(Λ)`, its explicit quasi-inverse, the semilattice level and the Boolean level." Restate §7.4.1 (2) as: "Prove that `Λ ↦ Spec(Λ)` is quasi-inverse to the compact-opens functor of AnalyticStacks §2.10, through the isomorphism of Λ with the compact opens of `Spec(Λ)` (Prop. A.1.2.5 (5))", and add "AnalyticStacks §2.10" to the `*Needs:*` of (2). The `LatticeSpectrum` declarations stand.

## R04 (P2) — §9.4.1, §10.2.3, §11.4.2 and §11.4.3 have no size hypothesis on `C`

**Location:** `README.md` lines 2260–2262: "Assume `C` and `S` satisfy the hypotheses of Prop. A.3.2.1 … a functor `F : Cᵒᵖ → D` is a D-valued sheaf"; lines 2420–2421: "for every ∞-category `C` with a Grothendieck topology there is a surjective geometric morphism from `Shv(D)` to `Shv(C)`"; lines 2762–2763; lines 2779–2781.
**Claim:** The supplier defines sheaves and D-valued sheaves for (essentially) small `C` only, and §1.1.1 defines hypercomplete objects in an ∞-topos. For a large `C` these four statements use notions no cited target defines. §9.3.3 and §10.3.1 do say "small".
**Witness:** Part InfinityTopoi §8.2.1: "for a small ∞-category C"; §8.2.2: "for an essentially small ∞-category T". For `C = S` with the trivial topology, `Shv(C) = Fun(Sᵒᵖ, S)` is not presentable, so "a hypercomplete object of `Shv(C)`" (line 2763) is undefined.
**Repair:** Line 2260: "Assume `C` is essentially small and `C` and `S` satisfy …". Line 2421: "for every small ∞-category `C` with a Grothendieck topology". Line 2762: "Call a functor `F : Cᵒᵖ → D`, for `C` essentially small with a Grothendieck topology, a **hypercomplete D-valued sheaf** when …". Line 2779: "Let `C` be essentially small, let `C` and `S` satisfy …". The instance `C = S` is then excluded; add it as a Check of §11.4.2.

## R05 (P3) — This head renumbers targets that an open roadmap cites, with no old → new numbering

**Location:** `README.md` line 397 ("**1.2.1.** Prove that, for a Cartesian fibration p : C → D …"), line 711 ("**2.4.1.** Prove that a simplicial object … is n-coskeletal exactly when …"), line 2740 ("### 11.4 The hypercomplete sheaf criterion").
**Claim:** Before this head §1.2.1 was HTT, Prop. 6.5.2.8 (now §1.2.5), §2.4.1 was HTT, Lemma 6.5.3.11 (now §2.4.4) and the sheaf criterion was §11.5.1–§11.5.3 (now §11.4.1–§11.4.3). QuasicoherentSheavesOnPrestacks cites the former numbers; two of them now name other statements.
**Witness:** QuasicoherentSheavesOnPrestacks (open, new roadmap) `README.md` line 44: "HypercompletenessAndCoherence §§1.1.1, 1.2.1, 2.4.1, 2.5.1, 2.5.2, 6.1.1 (… the hypercompletion, … the realizations of hypercoverings) … §§11.5.1–11.5.3"; line 457: "a left exact localization of fpqc sheaves (HypercompletenessAndCoherence §1.2.1)".
**Repair:** Add to the Conventions a table with header "Former numbering | Numbering" and the rows §1.2.1 | §1.2.5; §2.4.1 | §2.4.4; §11.5.1 | §11.4.1; §11.5.2 | §11.4.2; §11.5.3 | §11.4.3. Better for the two reused labels: number HTT, Prop. 6.5.2.8 as §1.2.1 and HTT, Lemma 6.5.3.11 as §2.4.1 again, with their lemmas after them, so that the cited ids keep their statements.

## R06 (P3) — `X` still denotes the ∞-topos in six places of Layers 8–9, where `X` also names an object

**Location:** `README.md` line 1984: "In a coherent `X` the final object is coherent"; line 2021: "objects of `X⁰`"; line 2026: "with `X⁰` the point"; line 2134: "target `X`"; line 2316: "since `X` is presentable"; line 2317: "For coherent `X`".
**Claim:** The statements of these sections now write 𝒳 for the ∞-topos and `X` for an object; in these six places `X` is the ∞-topos, and `X⁰` is the subcategory the statement calls `𝒳⁰`.
**Witness:** Line 2012: "a full subcategory `𝒳⁰ ⊆ 𝒳`" against line 2021 "`X⁰`"; line 2288: "for an ∞-topos 𝒳" against line 2316 "since `X` is presentable"; line 2025 uses `X` for an object of `S` in the same Check as line 2026.
**Repair:** Line 1984: "In a coherent 𝒳 the final object is coherent"; lines 2021 and 2026: `𝒳⁰`; line 2134: "target 𝒳"; line 2316: "since 𝒳 is presentable"; line 2317: "For coherent 𝒳".

## R07 (P3) — In §7.4.1 a sentence of `Suggested.lean` names still stands between "Prove …" and its list

**Location:** `README.md` lines 1791–1793: "**7.4.1.** Prove that `Spec` is a duality at three levels. The `Suggested.lean` declarations are `spectralSpace`, `isOpen_and_isCompact_iff`, `basicOpen_subset_basicOpen_iff`, `isSpectralMap_iff_existsUnique_boundedLatticeHom` and `exists_homeomorph`."
**Claim:** The sentence repeats, without their namespace, five names that the Level 2 list below gives with it, and separates the statement from its three levels. The other two inserted sentences of the previous review's R12 were removed; this one was not.
**Witness:** Lines 1810–1820 already have `LatticeSpectrum.spectralSpace`, `LatticeSpectrum.isOpen_and_isCompact_iff`, `LatticeSpectrum.basicOpen_subset_basicOpen_iff`, `LatticeSpectrum.exists_homeomorph` and `LatticeSpectrum.isSpectralMap_iff_existsUnique_boundedLatticeHom`; `Suggested.lean` lines 86–113 declare them inside `namespace LatticeSpectrum`.
**Repair:** Line 1791 becomes "**7.4.1.** Prove that `Spec` is a duality at three levels." Delete the rest of lines 1791–1793.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §1.4.1, §1.4.2 (HTT, Prop. 6.5.2.16, Def. 6.5.2.17, pp. 689–690) | identity; Δ[0] ⊆ X nontrivial; X^∧ ⊆ X | identity: (1), (2) hold; Δ[0]: inverts ∅ → 1, a monomorphism that is not ∞-connective, (1) and (2) both fail; X^∧: inverts exactly ∞-connective maps | holds | none |
| §2.2.1 (HTT, Def. 6.5.3.2, p. 693) | n = 0, 1; constant object on S¹ in S | cosk₋₁ = 1, so U₀ → 1; n = 2 target is the free loop space, π₀ = ℤ, image one component; colimit S¹ ≠ pt, consistent | holds | none |
| §2.5.1, §2.5.2 (HTT, Thm. 6.5.3.12, Cor. 6.5.3.13, p. 698) | X = S; constant hypercovering on ∞-connective f | S: hypercovering of pt has contractible colimit; f ∈ S as its own constant hypercovering, so S-local ⇒ hypercomplete; S ⊆ ∞-connective by §2.4.4 | both inclusions hold | none |
| §3.1.1 (HTT, Def. 7.2.1.1, p. 735; Rem. 7.2.1.5, p. 736) | S; Fun(Bℤ, S); Δ[0]; n = −1 in S | S: nonempty Kan complex has a vertex, ≤ 0; ℤ free: homotopy fixed points ∅, not ≤ 0; Δ[0]: ≤ −1; S: ∅ has no section, not ≤ −1 | holds | none |
| §3.4.1 (HTT, Prop. 7.2.1.10, p. 738) | P(C); Δ[0] | P(C): slices over representables ≃ P(C/c), dimension ≤ 0, towers converge objectwise; source: "≤ n for some integer n" = README | holds | none |
| §3.7.1 (SAG, Rem. A.7.2.3, p. 1829) | S; Δ[0]; Shv(Q) | S, Δ[0]: X ≃ lim τ≤n X; Shv(Q) not hypercomplete, so not Postnikov complete; source asserts the converse fails, README proves none | holds | none |
| §5.1.1 (SAG, Not. 1.3.2.3, Ex. 1.3.2.4, p. 118) | ΣHℤ on S; n via π₂ | π₁(ΣHℤ) = π₀(Hℤ) = ℤ; convention π₀ ∘ Σⁿ would give 0; π₂(Ω^(∞−2)(F[−n])) = π₀(F[−n]) = πₙ F, as source line 4231 | holds | none |
| §5.3.1 (SAG, Prop. 1.3.2.7, pp. 119–120) | 𝒳 = S; P(Bℤ) with Hℤ trivial; Hℤ[1] | heart Ab; sections Hℤ ⊕ Hℤ[−1], π₋₁ = ℤ, in the heart yet not sectionwise connective; Ω^∞(Hℤ[1]) = S¹ not discrete, so not ≤ 0 | holds | none |
| §6.2.1 (SAG, Prop. 1.3.3.3, Def. 1.3.3.4, Rem. 1.3.3.5, pp. 121–122) | 𝒳 hypercomplete; F both ∞-connective and hypercomplete; 𝒳 = Δ[0] | f^* = id, (1)–(4) all hold; (3) at G = F makes id_F null, F ≃ 0; Δ[0]: only F = 0; U = Ω^∞((τ≥0 F)[2]) has Ω²U ≃ Ω^∞ F | holds | none |
| §7.2.1, §7.2.2 (SAG, Def. A.1.1.3, p. 1739; Prop. A.1.4.4, p. 1746) | M₃; {⊥ < ⊤}; {⊥} → Λ′ | M₃: a ≤ b ∨ c, joins of {⊥, b} with {⊥, c} are ⊥, b, c, ⊤, never a; {⊥ < ⊤}: 1 distributor, 2 without (iii); {⊥} → Λ′: 1 | holds | none |
| §7.3.2, §7.3.3 (SAG, Prop. A.1.2.5, pp. 1740–1741; Props. A.1.5.2, A.1.6.5) | {⊥}; {⊥ < ⊤}; chain of 3; 4-element Boolean; finite subsets of ℕ | ideals/opens 1/1, 2/2, 3/3, 4/4; Spec = ∅, point, Sierpiński, 2 discrete points; primes of Fin(ℕ) = subsets of ℕ − {n}, Spec = ℕ discrete, not quasi-compact, no ⊤ | holds | none |
| §8.1.1 (SAG, Def. A.2.0.12, p. 1751; Lemma A.3.4.4, p. 1771) | ℤ discrete in S; BZ/2; trivial ∞-topos | ℤ: points cover, no finite subcover; BZ/2 connected, quasi-compact, mod 2 homology nonzero in all degrees so not compact; trivial: empty family covers | holds | none |
| §8.4.1 (SAG, Lemma A.2.2.1, p. 1755; Prop. A.2.2.2, p. 1756) | S × S; S | L = id, (1)–(3) trivial; lemma hypothesis "n = 0 or locally (n−1)-coherent" equals source line 63925; coherent spaces: finite π₀ and all πₖ | holds | none |
| §10.1.1 (SAG, Prop. A.4.2.1, p. 1778; Def. A.4.2.2, Ex. A.4.2.4, p. 1779) | identity; empty family; L : 𝒳 → 𝒳^∧ | identity: all four; empty: (2) makes ∅ → 1 an effective epimorphism, only Δ[0]; L surjective, not conservative on Shv(Q) | holds | none |
| §11.2.1, §11.2.2 (SAG, Prop. A.5.3.4, p. 1791; Cor. A.5.3.5, Lemma A.5.3.6, p. 1792) | X = ∅; one vertex, no edge; Y = Δ[0] | ∅: Kan, underlies ∅; one vertex: Λ[1,0] unfilled, not Kan, underlies no simplicial set; Y = Δ[0] turns A.5.3.4 into A.5.3.5 | holds | none |
| §11.2.3, §11.3.1, §11.3.2 (SAG, Lemma A.5.3.7, p. 1795; Lemma A.5.3.8, p. 1796; Thm. A.5.3.1, p. 1791) | X′ = nondegenerate part of Δ[1], V₀ = V₁ = 2 points, E = V₀ × V₁ | trivial Kan fibration; \|X•\| = K₂,₂, 4 vertices, 4 edges, a circle; \|X′•\| an interval; X′ fails Kan at vertex 1, f has no degeneracies | holds with (i) or (ii) | none |
| §9.1.1 Checks | C two points; C = (a → c ← b), constant Δ[0] | (A, B): final preserved iff A ⊔ B ≃ pt, products force A × B = ∅; pushout pt ← 4 points → pt = wedge of 3 circles ≠ S¹ × S¹ | holds | none |
| §10.4.1, §10.4.2 (SAG, Thm. A.4.0.5, p. 1774) | S; Shv(Λ), Λ atomless; Shv(Q) | S: identity point; atomless Λ: no frame map to {⊥ < ⊤}, no points, hypercomplete, so not locally coherent; Shv(Q): stalks jointly surjective, not conservative | holds | none |
| `LatticeSpectrum.exists_orderIso_opens`, `spectralSpace`, `isOpen_and_isCompact_iff`, `basicOpen_subset_basicOpen_iff` | Λ trivial; {⊥ < ⊤}; chain of 3 | trivial: Spec = ∅, both basic opens ∅ and ⊥ ≤ ⊥; chain: basic opens ∅ ⊂ {⊥} ⊂ all, 3 compact opens = 3 elements | true on each | none |
| `isSpectralMap_iff_existsUnique_boundedLatticeHom`, `continuous_iff_existsUnique_boundedLatticeHom` | Λ trivial; ℕ ∪ {∞} → Sierpiński | Spec Λ = ∅: f empty, unique g into the one-element lattice; preimage of the open point is ℕ, not compact, and g(a) would contain every {n} | holds | none |
| `t2Space_iff_complementedLattice`, `exists_homeomorph`, `exists_homeomorph_latticeSpectrum_of_isTopologicalBasis_isClopen` | Λ trivial; chain of 3; X = ∅ | ∅ is T2, one-element lattice complemented; Sierpiński not T2, a has no complement; ∅ ≃ Spec of the trivial Boolean algebra | holds | none |
| `SemisimplicialKan`, `SemisimplicialKanFibration`, `fibration_iff_…`, `exists_fibration_of_…`, `exists_sSet_of_semisimplicialKan` | n + 1 = 1, i = 0; Y = Δ[0] | horn data = the one f with image {0}, filler an edge from it; Δ[0] ↪ Δ[1]: 1 edge against 2, not a fibration on either side | holds | none |
| Supplier contracts, Tau Ceti (lines 226–240) | pin 2fd255d | 2 of 8 names found, 6 absent | drift | R01 |
| §1.1.1 against EnhancedDerivedSheaves §E2.7 | X = Shv(C) | both: local objects for ∞-connective maps, Postnikov convergence | two owners | R02 |
| §7.4.1 (2) against AnalyticStacks §2.10 | Sierpiński; ∅ | both: three-element chain; one-element lattice | two owners | R03 |
| §9.4.1, §10.2.3, §11.4.2, §11.4.3 | C = S, trivial topology | Fun(Sᵒᵖ, S) not presentable; supplier §8.2.1 and §8.2.2 require (essentially) small | hypothesis missing | R04 |
| Ids cited by QuasicoherentSheavesOnPrestacks | §1.2.1, §2.4.1, §11.5.1–§11.5.3 | here: Cartesian-fibration lemma; coskeletal lemma; no §11.5 | cited ids moved | R05 |

- Source locators checked against the text: HTT 22 statements (lines 31139–31787, 33310–33522), SAG 47 read in full and 24 more by page (lines 4184–4369, 56703–56998, 63295–66732); every theorem number, page and hypothesis checked agrees with the README.
- Library declarations opened at the pins: Mathlib 10 (`Order.Ideal.IsPrime`, `Order/PrimeIdeal.lean:81`; `DistribLattice.prime_ideal_of_disjoint_filter_ideal`, `Order/PrimeSeparator.lean:46`; `SpectralSpace`, `Topology/Spectral/Basic.lean:38`; `IsSpectralMap`, `Topology/Spectral/Hom.lean:42`; `PrespectralSpace.opensEquiv`, `Topology/Spectral/Prespectral.lean:111`; `SemiSimplexCategory.homEquiv` and `toSimplexCategory`, lines 54 and 74; `SSet.rlp_monomorphisms`, `CategoryWithFibrations.lean:129`; `zorn_le_nonempty`, `Order/Zorn.lean:108`; `Set.ofPred`, `Data/Set/Defs.lean:50`); Tau Ceti 2 found, 6 absent (R01). No lattice spectrum, Stone duality or semisimplicial Kan condition at either pin.
- Cross-roadmap citations resolved: 543 citations of sibling Parts (239 distinct targets), all found at this head; 352 paired source locators, each inside the cited target; 12 targets of ModelCategoryTheory at its open head; AdicEtaleGeometry §A1.15 and AlgebraicKTheory §4.3 on main.
- Gate at a6d7928: every check passes, build included. Dependency check: `depcheck: 261 roadmaps, 2595 edges, 0 problem(s)`, no UPWARD or CYCLE line. The pull request changes nothing outside the family folder.
- Elaboration: `lake env lean` on `Suggested.lean`, 12 `sorry` warnings, no error. The 17 elaborated types were compared with the README; only `LatticeSpectrum.exists_homeomorph` lacks the section binders, correctly, Λ being existential there. Nothing changed.
- One-tactic probe on a scratch copy (`rfl`, `infer_instance`, `simp`, `simpa` on each direction, `exact ⟨_, rfl⟩`): none of the 12 theorems closes; no padding. Every headline not stated is named in the module docstring with its missing carrier.
- Pull request text against this folder: the word count (30.2k), the account of §7.4.1 (2) and the list of overlaps (E2.7) agree with the head; no sentence about this folder is contradicted.
- Every definition has at least three Checks; every layer ends with Examples and Dependencies. The deduction of §1.1, third Check, holds: a section of the sheaf over Q × {0} would extend to a neighbourhood, which the source excludes.

Overlap check: read KanQuillen, QuasicoherentSheavesOnPrestacks, SimplicialCategories, EnrichedLocalization, AnalyticStacks, EnhancedDerivedSheaves, StableHomotopyKTheory, DiamondsAndVStacks; Stone duality for spectral spaces: owner AnalyticStacks §2.10 (R03); hypercomplete sheaves of spaces and their Postnikov towers: owner EnhancedDerivedSheaves §E2.7 (R02); QuasicoherentSheavesOnPrestacks consumes this roadmap (R05) and owns nothing of it; the others share nothing with this folder.

Source independence: 17 passages compared with 2 sources, none copied (longest shared run 10 words, the conclusion of HTT, Prop. 6.5.2.19); largest share HTT, about 530 of 690 locators; contents compared with HTT and with SAG: independent since the reorganisation. Layers 3, 8, 9 and 10 each draw on several sections (Layer 3 on HTT §7.2.1 with SAG §A.4.1 and §A.7.2), and the order 1 → 2, 1 → 3, 4 → 5 → 6, 3 and 7 → 10, 8 → 9 → 10 → 11 is forced by the `### Dependencies` lines.

Research link: the headline targets are the hypercompleteness, coherence and Deligne completeness theorems of Lurie's *Higher Topos Theory* (2009) and *Spectral Algebraic Geometry* (2018), after Jardine (1987), Dugger–Hollander–Isaksen (2004) and Rourke–Sanderson (1971); the open roadmap QuasicoherentSheavesOnPrestacks uses them for fpqc hyperdescent. Rests on the README's References and that roadmap's line 44.

## Not verifiable

- HA: not opened; cited only through Part StableInfinityCategories and not in the sample.
- Kerodon, Theorem 3.2.7.1 (§1.1, §3.4): not opened; not in the sample.
- Joh82 (Cor. II.3.3, Thm. II.3.4) and MM92 (§IX.11): no legal copy read; the two locators are cited beside SAG locators that were checked.
- Jar87, RS71, SGA4, DHI04, TV02: not opened; cited for attribution, without a statement resting on them.
- The six declarations of R01 on a newer Tau Ceti commit: no commit other than the pin is in the worktree.

## Source issues

- **Misprint** in HTT at Proposition 6.5.2.16 (2), p. 689: the source says the functor f is ∞-connective; it should be the morphism u is ∞-connective; affects nothing.
- **Misprint** in SAG at Definition A.2.0.12, p. 1751: the source says the finite subfamily's map is the coproduct over the whole index set I; it should be the coproduct over the finite subset I₀; affects nothing.
- **Error** in SAG at Remark A.1.6.10, p. 1751: the source says an open subset of a Hausdorff space is quasi-compact exactly when it is closed; it should be quasi-compact open subsets are closed, the converse needing compactness of the space; affects nothing.
- **Misprint** in SAG at Proposition A.1.5.2, proof, p. 1747: the source says the union of the quasi-compact opens is their greatest lower bound; it should be the intersection; affects nothing.
- **Misprint** in SAG at Lemma A.5.3.6, p. 1792: the source says a k-simplex belongs to X• when it is an isomorphism or not surjective; it should be belongs to K•; affects nothing.
- **Misprint** in SAG at Notation 1.3.2.3, p. 118: the source says the composite describing πₙ starts from module objects of spectra on the ∞-topos; it should be sheaves of spectra on it; affects nothing.
- **Gap** in SAG at Propositions A.3.3.1 (p. 1766), A.4.3.1 (p. 1780) and A.5.7.2 (p. 1806): the source says C is an ∞-category with no size condition; it should be essentially small, as its Definition 1.3.1.1 requires for sheaves; affects a stated result.

## For the human reviewers

- **Scope.** SAG, the only source of the statements of Layers 4–11 and of §3.6–§3.7, is an author's manuscript (version of 3 February 2018, `README.md` line 2856), not a published book; HTT is published (Annals of Mathematics Studies 170).
- **Licence.** HTT and SAG were read from the author's page (math.ias.edu/~lurie), classed `author-page`; the sources service recorded both in the package's `sources.toml`.
- **Ownership.** The description asks the maintainers to choose the owner of the material shared with EnhancedDerivedSheaves, and declines a dependency on AnalyticStacks §2.10 because it is not on main; R02 and R03 apply the stated ownership rules for the third round. A decision the other way removes them.
- **Pin.** The description says the build needs a Tau Ceti pin bump to 8b9f13d; this folder's `Suggested.lean` builds at the pin 2fd255d, but its README cites six declarations of the newer commit (R01, third round).
