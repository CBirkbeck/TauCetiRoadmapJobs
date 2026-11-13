# Review of InfinityTopoi (pull request #2270 at 04df60e)
Folder: `TauCetiRoadmap/InfinityCategoryTheory/InfinityTopoi/`
**Verdict:** needs changes

## R01 (P1) — `Suggested.lean` does not build at the pinned Tau Ceti

**Location** `TauCetiRoadmap/InfinityCategoryTheory/InfinityTopoi/Suggested.lean` lines 9–11: "public import TauCeti.AlgebraicTopology.Quasicategory.InitialVertex", "…Quasicategory.Limit", "…Quasicategory.TerminalVertex".
**Claim** The file is stated "against the pinned Mathlib and Tau Ceti" (docstring, lines 18–19).
**Witness** Gate: `imports=3`, `build=7`, "bad import" for all three modules. The pin (`lake-manifest.json`, Tau Ceti `2fd255d`) has only `Cartesian`, `Core`, `FullSubcategory`, `LocallySmall`, `RightMappingSpace` under `Quasicategory/`.
**Repair** Either merge the base once it pins a Tau Ceti that has the three modules, or delete lines 9–11 and every declaration that needs them (`IsColimitDiagram` … `IsPullbackSquare`, `HasDisjointCoproducts`, the two §1.2.1 theorems, `IsLeftExactAt`, the §4.1.1 theorem) and name `SSet.slice.IsLimit`, `SSet.coslice.IsColimit`, `SSet.IsInitialVertex`, `SSet.IsTerminalVertex` in the docstring as the missing carriers.

## R02 (P1) — the Tau Ceti supplier contract cites declarations absent at the pin

**Location** `README.md` lines 208–219: "`SSet.slice.IsLimit`, `SSet.coslice.IsColimit` (`AlgebraicTopology/Quasicategory/Limit.lean`), `SSet.IsTerminalVertex`, `SSet.IsInitialVertex` … `SSet.catInfty` (`Quasicategory/CatInfty.lean`) … `SSet.ihomOver` (`AlgebraicTopology/SimplicialSet/InternalHom.lean`)".
**Claim** Tau Ceti supplies these six declarations in these five files.
**Witness** None of the six names and none of the files `Limit.lean`, `TerminalVertex.lean`, `InitialVertex.lean`, `CatInfty.lean`, `InternalHom.lean` occurs in the pinned Tau Ceti (`2fd255d`); the other Tau Ceti names of the contract do.
**Repair** Until the pin has them, replace the six by their owners in this family: Part InfinityCategoryFoundations §1.2 (limits, colimits, final and initial objects, already listed under "Definitions, by owner Part"), Part Straightening for `Cat∞`, and a README target with its signature for the section simplicial set of §11.3; change Conventions 1 and 7 and the *Needs:* lines of §1.2.1, §10.3.1, §11.3.1, §11.3.2, §17.3.1, §20.1.1 to match.

## R03 (P2) — a stand-in is stated for the headline "locales are the 0-topoi"

**Location** `Suggested.lean` lines 276–286, `isUniversalColimit_iff_inf_sSup_eq`: "The order-theoretic core of HTT, Prop. 6.4.2.5 … The proposition itself, for presentable 0-categories, is not statable at the pins."
**Claim** A weakened form of a headline that is not statable may be stated in its place.
**Witness** `README.md` line 37 lists Prop. 6.4.2.5 as a headline; the docstring (lines 57–58) lists it as not statable and then states its lattice-level core. The statement itself is true (table below).
**Repair** Delete `isUniversalColimit_iff_inf_sSup_eq` and the bullet at lines 33–34 of the docstring; §18.2.1 of the README keeps the order-theoretic statement as a route step.

## R04 (P2) — sheaves of spaces on a site have a second owner on main

**Location** `README.md` §8.2.1, line 1482: "Define, for a small ∞-category C with a Grothendieck topology, a presheaf F to be a **sheaf** when it is S-local"; Scope and ownership (lines 43–70) names no roadmap for it.
**Claim** This Part is the only owner of `Shv(C)`.
**Witness** On main, `TauCetiRoadmap/EnhancedDerivedSheaves/README.md` line 2377 (§E2.7, `spaceSheaves`): sheaves of spaces on a small site are the accessible localization of presheaves of spaces at the covering-sieve inclusions.
**Repair** Add to Scope and ownership: "Sheaves of spaces on a small site are `spaceSheaves` of EnhancedDerivedSheaves §E2.7; §8.2.1 is the same localization for a topology on a small ∞-category, and on the nerve of a small site it is that object. This Part adds what §E2.7 does not state: left exactness, the topological-localization property (§8.3), the classification of §8.4 and the universal property of §9.1." Add EnhancedDerivedSheaves §E2.7 to the *Needs:* of §8.2.1.

## R05 (P2) — the covering topology of a frame is also defined by GrothendieckTopoi

**Location** `README.md` §18.3.1, line 3124: "The **covering topology** on N(U), for a locale U, is the Grothendieck topology on the category U … a sieve S on u … covers u when ⋁S = u"; Scope, line 64: "defined in §18.3 for this Part's own use".
**Claim** The topology is this Part's to define, and the 1-categorical theory is left to unnamed "other roadmaps".
**Witness** Pull request #1520, `TauCetiRoadmap/GrothendieckTopoi/README.md` §7.1, line 1194: "Define `Frame.grothendieckTopology L` … a sieve `S` on `U` covers when `U` is the supremum of the `V ≤ U`…", with the comparison to `Opens.grothendieckTopology`.
**Repair** In §18.3.1 cite GrothendieckTopoi §7.1 for the topology on the category U and keep only its transport to N(U) through §8.1.1; drop the Checks that repeat §7.1's. In Scope, name GrothendieckTopoi (Layers 1, 4 and 7) as the roadmap the classical Giraud theorem, subtopoi and localic 1-topoi are left to.

## R06 (P3) — four declarations of `Suggested.lean` are not headlines

**Location** `Suggested.lean` lines 234–241, 250–258, 268–272: `isLeftExact_iff_forall_isLeftExactAt`, `isEffectiveEquivalenceRelation_of_isEquivalenceRelation`, `effectiveEpi_iff_surjective`, `exists_equivalence_grp_grp_commGrp`.
**Claim** These are headline theorems of the roadmap.
**Witness** None is in the headline list (`README.md` lines 21–39). The last three mention only Mathlib carriers (`Type u`, `Grp`, `CommGrp`); the two on `Type u` mirror the first Check of §7.3. The first, after unfolding `IsLeftExactAt`, is Part LimitsAndKanExtensions §6.5.3 (HTT, Cor. 4.4.2.5) dualized.
**Repair** Delete them from `Suggested.lean`; §4.1.1, §7.7.1 and §13.3.1 of the README keep the statements.

## R07 (P3) — seventeen Lean names do not appear in the README

**Location** `Suggested.lean`, all declarations except `HasDisjointCoproducts`, `IsLeftExactAt` and `IsLeftExact`.
**Claim** README and Lean agree name by name.
**Witness** `grep -c` on `README.md` gives 0 for `IsPullbackSquare`, `IsPushoutSquare`, `IsLimitDiagram`, `IsColimitDiagram`, `coneShape`, `coconeShape`, the four `…Coord` maps, `isCartesian_evalAt_iff_isPullbackSquare`, `cartesianFibration_evalAt_iff` and the five theorems of R03 and R06.
**Repair** For each declaration that survives R01, R03 and R06, add "`Suggested.lean` declaration `<name>`" at its target: the two theorems at §1.2.1, the repeated definitions at Conventions 1 or §1.1.2.

## R08 (P3) — wrong target for homotopy pullback squares

**Location** `README.md` §3.2.1 *Needs:*, line 673: "ModelCategoryTheory, Part ModelCategories §3.5.1 (HTT, §A.2.4: homotopy pullback squares)".
**Claim** Part ModelCategories §3.5.1 defines homotopy pullback squares.
**Witness** At the head of pull request #2269, Part ModelCategories §3.5.1 defines homotopy pushout squares; "Define homotopy pullback squares dually" is §3.5.3 (its `README.md` line 656).
**Repair** Replace "§3.5.1" by "§3.5.3" on line 673.

## R09 (P3) — a reference cited for a passage that does not cite it

**Location** `README.md` References, line 3516: "Cited: Prop. 1.4.3.9 (Downstream consumers)."
**Claim** The Downstream consumers section cites HA, Prop. 1.4.3.9.
**Witness** `README.md` lines 3490–3492: the section is one sentence with no citation; "HA" occurs nowhere else in the file.
**Repair** Delete the HA entry from References.

## R10 (P3) — `K(A, n)` in spaces is not tied to its owner

**Location** `README.md` §15.2.1 Checks, line 2833: "For 𝒳 = S and n ≥ 1, K(A, n) is the Eilenberg–MacLane space of §13.6".
**Claim** For 𝒳 = S the objects K(A, n) and `EM_n(S)` need no comparison with an earlier owner.
**Witness** Pull request #2269, Part KanQuillen §5.4.1 defines the complex `K(A, n)` and §5.5.2 proves that a Kan complex is equivalent to it exactly when it is n-connective and n-truncated; this README cites neither.
**Repair** Add to §13.6.1: "A pointed Kan complex lies in `EM_n(S)` exactly when it is homotopy equivalent to the complex K(G, n) of ModelCategoryTheory, Part KanQuillen §5.4.1 (Part KanQuillen §5.5.2)", with both in its *Needs:*, and cite it in the Check.

## Verified sound

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| §1.6.1 (HTT, Lemma 6.1.3.6) | Set; Ab with `ℤ → 0` | Set: only ∅ maps to ∅. Ab: ℤ maps to 0, not initial; colimits not universal there | holds; hypothesis needed | none |
| §1.6.2 (Lemma 6.1.5.1) | Set, `Z = ∗ ⊔ ∗`; [1] | i ≠ j: pullback ∅, W initial. i = j: pullback `Zᵢ`. [1]: `1 ×₁ 1 = 1 ≠ 0`, not disjoint | holds | none |
| §2.2.1 (Lemma 6.1.3.5) | S = equivalences; K = ∅ | (3): ᾱ(∞) between two colimits of equivalent diagrams, an equivalence; K = ∅: fiber over ∅ is a point | agrees with HTT line 25457 | none |
| §2.3.1 (Lemma 6.1.3.7, Def. 6.1.3.8) | empty class; all maps of Set | empty class: fiber over ∅ empty ≠ point. Set: equalizer of slices is sets with automorphism ≠ Set | both non-local, as the Checks say | none |
| §4.4.1 Giraud (Thm. 6.1.0.6) | Δ[0], ∅, N(Set), N(Ab) | Δ[0]: (L) via `P(∅)`, (T), (D). ∅: not presentable, no `P(C)` empty. Set: `ℤ/2` groupoid has colimit ∗. Ab: `ℤ → 0` | three predicates agree on all four | none |
| §5.3.1 Rezk (Thm. 6.1.6.8) | S; N(Set) | S: classifier is the core of κ-compact spaces. Set: all maps not local (§2.3 Check), so no classifiers for large κ | holds | none |
| §7.2.1 semitopos (Def. 6.2.3.1) | ∅, N(Set), N(Ab) | ∅ not presentable; Set: Čech groupoids are equivalence relations, effective; Ab fails universality | separates semitopos from ∞-topos | none |
| §8.2.1, §8.2.2 (Def. 6.2.2.6; SAG, Def. 1.3.1.1) | Δ[0] with ∅ covering; 𝒞 = N{0 < 1} | `F(∗)` = empty limit = point; in {0 < 1} empty limit is 1 | agrees with HTT line 27072, SAG line 4136 | none |
| §8.3.1, §8.4.1 (Props. 6.2.2.7, 6.2.2.17) | C = Δ[0] | 2 topologies; topological localizations of S: generated by nothing (S) or by `∅ → ∗` (Δ[0]): 2 | bijection 2 ↔ 2 | none |
| §9.1.1 (Prop. 6.2.3.20) | C = Δ[0], trivial topology | left exact `Δ[0] → 𝒳` = final objects, contractible; equals `Fun^*(S, 𝒳)` of §10.5 | holds; finite limits only for the image, as HTT line 27765 | none |
| §10.5.1 (Prop. 6.3.4.1) | X = Δ[0], X = S × S | `Fun_*(Δ[0], S)`: final objects of S; `Fun^*(S, S × S)`: the diagonal only | contractible both | none |
| §10.7.1 (Ex. 7.3.4.7) | N(Set) at n = 1 | filtered colimits of sets commute with finite limits | holds; HTT line 35717 covers 0 ≤ n ≤ ∞ | none |
| §11.1.1 (Prop. 6.3.2.3) | empty product; X × Y | empty limit Δ[0]: `Fun^*(X, Δ[0])` a point, so final in `LTop`, matching Δ[0] initial in `RTop` (§10.3) | consistent | none |
| §13.1.1 (Cor. 7.2.2.5) | `K ↦ K ⊔ K` on S | sends Δ[0] to ∂Δ[1]; `U₀` not final | product hypothesis needed | none |
| §13.6.1 (Def. 7.2.2.1) | S¹, ℤ, S², ∗ ⊔ ∗, Δ[0] | S¹ ∈ EM₁ only; ℤ ∈ EM₀ only; S²: π₃ = ℤ, in none; ∗ ⊔ ∗ ∈ EM₀ ∖ EM₁; final object in every EMₙ | matches the homotopy-group description | none |
| §14.1.1 (Prop. 7.2.1.14) | `∗ → S¹`, `∅ → ∗` in S | τ≤0: identity of a point (surjective); `∅ → ∗` not surjective | both sides agree | none |
| §14.7.1 (Ex. 5.2.8.16) | n = −2, −1; shifted indices | n = −2: all maps / equivalences. Shifted: `∂Δ[1] → Δ[0]` against itself has no lift | indices right | none |
| §15.1.1 (Lemma 7.2.2.11) | S¹ at n = 1; `Δ[0] → ∂Δ[1]` | S¹ ↦ ℤ ∈ Grp(EM₀); non-connected: Čech nerve trivial, same as for Δ[0] | connectedness needed; truncatedness via diagonal recomputed: pullback of Δ along `g × id` is g | none |
| §15.2.1 (Prop. 7.2.2.12) | n = 0, 1, 2; S₃; 𝒳 = Δ[0] | n = 1: BS₃ has non-abelian π₁; Δ[0]: every EMₙ a point, one group object | pointed / group / commutative group as stated | none |
| §17.2.1 (Thm. 6.4.4.5) | n = 0, n = ∞ | n = 0: class of equivalences, local, (1)–(5) all hold; n = ∞: Thm. 6.1.3.9 | agrees with HTT line 30332 | none |
| §17.3.1 (Prop. 6.4.4.7) | k = n − 1, k = n, k = −1 | needs (k − 1)-truncated ⊇ (n − 2)-truncated: true for k ≥ n − 1; k = −1 forces n = 0 | index k right; HTT states k = n only | none |
| §18.3.2 (Thm. 6.4.2.1), §18.2.1 | {0 < 1}; subspaces of ℝ² | chain: `P≤−1(Δ[0])`, frame. Lines a, b, c: `a ∧ (b ∨ c) = a`, `(a ∧ b) ∨ (a ∧ c) = 0` | (3) ⇔ (4) on both | none |
| `isUniversalColimit_iff_inf_sSup_eq` | J = ∅; J discrete on s; M₃ | J = ∅: `c′.pt ≤ ⊥`. Discrete: `a′ = a ⊓ sSup s` gives `a′ = ⨆ (b ⊓ a)`. M₃ fails both sides | true, both directions | R03 |
| §19.1.1 (Prop. 6.4.3.4) | n = 0; constant groupoid on S¹ | n = 0: diagonal of V an equivalence iff V subterminal. S¹: diagonal fibers ℤ, 2-efficient not 1-efficient | holds with finite limits | none |
| §19.3.1 (Prop. 6.4.1.6) | n = 1, X = N(Set); n = 0, X = Δ[1] | Set: left exact localizations are Set and ∗, both topological. Δ[1]: Δ[1] and ∗, generated by nothing and by `∅ → ∗` | holds; n = ∞ excluded as in HTT line 29853 | none |
| §19.4.1 (Thm. 6.4.1.5) | n = 0; N(Set) at n = 1 | n = 0: (4)–(6) reduce to universal colimits. Set: equivalence relations = 1-efficient groupoids, effective | six conditions agree | none |
| §20.2.1, §20.3.1 (Prop. 6.4.5.7, Def. 6.4.5.8) | (m, n) = (0, ∞) at Y = Δ[1]; S/S¹ | X = S, τ≤−1 S = Δ[1]. S/S¹: points form S¹, locale a point | S is 0-localic, S/S¹ is not | none |
| `HasDisjointCoproducts` | Δ[0], N[1] | Δ[0]: every square is a pullback. [1]: square 0, 1, 1, 1 is a pushout, not a pullback | matches §1.1.2 | R01 |
| `IsLeftExactAt`, §4.1.1 | `X ↦ X ⊔ ∗` on S; π₀ at S¹ | `(A ⊔ ∗) ×_{Z ⊔ ∗} (B ⊔ ∗) = (A ×_Z B) ⊔ ∗`; ∗ ↦ two points. π₀: ℤ against a point | final-object clause needed | R06 |
| §3.4.1 `Δ_∞` | [1] → [0]; [0] → ∅ | 3 maps: (0, 0), (0, ∞), (∞, ∞); 1 map; `Δ₊` has 1 and 0 | counts right | none |

- Source locators checked against the text: 45 in HTT (statement, page and hypotheses; all pages agree), 2 in SAG (lines 4136, 5966; pp. 116, 165).
- Library declarations opened at the pins: 26 Mathlib names of the contract found (among them `isRegularEpi_iff_effectiveEpi`, `Limits/Shapes/RegularMono.lean:519`; `QCat.bicategory`, `Quasicategory/StrictBicategory.lean:66`; `Opens.grothendieckTopology`, `Sites/Spaces.lean:47`); 8 Tau Ceti names found, 6 absent (R02).
- Absence claims checked at the pins: no fat join in Tau Ceti; `nerve Cᵒᵖ ≅ (nerve C).op` is a TODO at `AlgebraicTopology/SimplicialSet/Op.lean:24`; no Cartesian monoidal instance on `CommGrp`; no homotopy pullback squares; no effectiveness of equivalence relations in `Type u`.
- Cross-roadmap citations resolved: 172 section and target citations of the twelve sibling Parts, and 28 of ModelCategoryTheory (Parts ModelCategories, KanQuillen, SimplicialCategories) at the head of #2269; one wrong target (R08).
- Dependency check: `depcheck: 223 roadmaps, 1972 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the family folder.
- Gate: FAIL (`imports=3`, `build=7`); every other check 0. The file cannot be elaborated at the pin, so `#check` was run only on the Mathlib-only statements (§7.7.1, §13.3.1, §18.2.1): their elaborated types equal the README statements, nothing changed.
- One-tactic probe on the four Mathlib-only theorems (`infer_instance`, `exact?`, `simp`): none closes.
- Overlap check: read KanQuillen, SimplicialCategories, ModelCategories, EnrichedLocalization, GrothendieckTopoi, EnhancedDerivedSheaves, BordismFormalGroups; sheaves of spaces on a site: EnhancedDerivedSheaves §E2.7 (R04); the covering topology of a frame: GrothendieckTopoi §7.1 (R05); `K(A, n)` for Kan complexes: KanQuillen §5.4 (R10); nothing else shared.
- Source independence: 24 passages compared with 2 sources, none shared (longest common run 8 words, the definition of enough points, HTT line 31888); largest share HTT, 977 of 990 locators; contents compared with HTT §6.1–§6.5.1, §7.2: independent (20 layers against 24 subsections, one-to-one only for Layers 5, 6, 18, 20; Layer 7 precedes Layer 8 against §6.2.3 after §6.2.2; Layers 12–15 precede the n-topoi of §6.4, forced by §17.3.1 needing §14.8.1).

## Not verifiable

- The full `Suggested.lean` (Layers 1 and 4): its three Tau Ceti imports do not exist at the pin, so no elaboration and no probe.
- The description's statement that the file elaborates against Tau Ceti `8b9f13d993`: that commit is not the pin.
- Kerodon locators (Thm. 3.2.6.1, Thm. 3.2.7.1, Cor. 3.5.2.7, Def. 3.5.7.20, Def. 6.2.1.1): outside the sample, not opened.
- SGA 4, exposé IV, 1.2 (Scope only): not read.

## Source issues

- **Gap** in HTT at Prop. 6.5.1.12 and Prop. 6.5.1.20, pp. 679–683, with Lemma 7.2.1.13 and Prop. 7.2.1.14, pp. 740–741: the source says 6.5.1.12 and 6.5.1.20 follow from 7.2.1.14, which rests on 7.2.1.13, which uses 6.5.1.20; it should be an independent proof of 7.2.1.14 or of the subobject statement; affects the proof.
- **Gap** in HTT at Lemma 7.2.2.11, proof, step (b), p. 746: the source says vanishing of the homotopy sheaves above degree n makes the object n-truncated; it should be an argument through the diagonal, since vanishing implies truncatedness only for hypercomplete objects; affects the proof.
- **Gap** in HTT at Prop. 6.4.4.9, proof, pp. 670–671: the source says disjointness follows by invoking Thm. 6.4.4.5; it should be Lemma 6.1.3.7, since Thm. 6.4.4.5 assumes disjoint coproducts; affects the proof.
- **Gap** in HTT at Lemma 7.2.2.10, p. 744: the source says the statement holds for an arbitrary ∞-category; it should be an ∞-category with finite products, which the proof uses; affects a stated result.
- **Misprint** in HTT at Prop. 6.4.4.7, p. 670, and the proof of Prop. 6.4.1.6, pp. 658–659: the source says `τ≤n Y` and `P≤n(C)`; it should be `τ≤n−1 Y` and `P≤n−1(C)`, as Thm. 6.4.1.5 (2) and Def. 6.4.1.1 require; affects the proof.
- **Misprint** in HTT at Lemma 6.1.3.6, p. 565, and the proof of Lemma 6.1.3.7, p. 565: the source says "presentable category" and "sums and coproducts"; it should be presentable ∞-category and pushouts and coproducts; affects nothing.

## For the human reviewers

- **Scope.** The description asks the maintainers to choose the owner of the generic ∞-categorical material against BordismFormalGroups §F6.5, EnhancedDerivedSheaves (§E2.7 for this Part) and pull request #1807; R04 assumes main's owner until that is decided.
- **Licence.** HTT and SAG were read from the author's page (`math.ias.edu/~lurie/papers`), classed by hand as author-page copies; 977 of the README's 990 locators point into HTT.
