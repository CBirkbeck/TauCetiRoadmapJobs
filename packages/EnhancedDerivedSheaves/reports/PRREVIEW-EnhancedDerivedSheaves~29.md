# Review of EnhancedDerivedSheaves (pull request #1330 at 856fe7a)

**Verdict:** needs changes

**Summary.** Changes are needed: the revision deletes from E1.6 the statement of Serre's criterion (Stacks 00OC) that the README on main records, replacing it by a pointer to a section of PurityOfBranchLocus that main no longer has, and `Suggested.lean` does not build because it imports a module that is absent at this head and that it does not use. There are four small corrections (the description is written for a state of main that has passed, the conflict with the other open revision of this roadmap has no stated order, the retained all-module bound is in Tau Ceti at main's pin, one section locator into *Higher Algebra* is off) and two format notes. One question of ordering between the two open revisions is left to the human reviewers.

## R01 (P1) — E1.6 no longer states Serre's criterion, which the README on main records as an item of this roadmap

The README at the merge base states, in the item "Global dimension of regular rings" of E1.6 (line 693 there), under the name `isRegularLocalRing_of_projectiveDimension_residueField`, that a Noetherian local ring whose residue field has finite projective dimension is a regular local ring, of dimension equal to that projective dimension. At this head (line 697) the name is dropped from the item and the statement is replaced by "The local residue-field criterion and dimension equality come from PurityOfBranchLocus §0.3's `isRegularLocalRing_of_projectiveDimension_residueField` and `isRegularLocalRing_tfae`, rather than being separate E1.6 targets." A reader of E1.6 can no longer read what the criterion says, and the roadmap's record of it is gone; the project keeps an item of a roadmap on main in its place with its statement, whoever proves it. DeformationAndDerivedPatchingAlgebra on main cites the item by this name as supplied by §E1.6 (`TauCetiRoadmap/DeformationAndDerivedPatchingAlgebra/README.md`, line 1942), and that citation would then point at nothing.

The pointer also no longer leads to a statement. PurityOfBranchLocus on main has a single layer, numbered 2; its "Scope and ownership" lists §0.3 as a former section and resolves the two names to `TauCeti.IsRegularLocalRing.of_hasProjectiveDimensionLE` and `TauCeti.isRegularLocalRing_tfae` (`TauCeti/RingTheory/RegularLocalRing/ProjectiveDimension.lean`, lines 336 and 392 at the Tau Ceti pin of main, `2fd255d`). So the owner at the pins is the library, not that roadmap, and the new supplier row (line 157) and the sentence above it ("the contracts below name specification targets, not declarations already available at the library pins") describe it wrongly.

Smallest change: restore the sentence "Conversely, a Noetherian local ring whose residue field has finite projective dimension is a regular local ring, of dimension equal to that projective dimension" and the name in the item's heading, and follow it with a line `*In Tau Ceti:*` naming `TauCeti.IsRegularLocalRing.of_hasProjectiveDimensionLE`, `TauCeti.isRegularLocalRing_tfae` and, for the dimension clause, `TauCeti.IsRegularLocalRing.projectiveDimension_quotient_maximalIdeal_eq_ringKrullDim` (same file, line 207). In the proof route and *Needs:* line of the converse of Kunz's theorem (lines 812 and 814) cite the Tau Ceti declaration; move the supplier row from "From other roadmaps" to "From Tau Ceti". This needs the branch to carry main's pins (R02). Removing the `sorry` restatement from `Suggested.lean` is then right and stays.

## R02 (P1) — `Suggested.lean` does not build: it imports a module that is not in the tree at this head and that nothing in the file uses

Line 3 of `TauCetiRoadmap/EnhancedDerivedSheaves/Suggested.lean` is `import TauCetiRoadmap.PurityOfBranchLocus.Suggested`. The branch's merge base (`c4d2242`) predates that folder, so the targeted build stops with "bad import" and direct elaboration with "object file … of module TauCetiRoadmap.PurityOfBranchLocus.Suggested does not exist". The import carries nothing: with that one line removed, a copy of the file elaborates at this head's pins with no error and 24 `sorry` warnings, and all 33 declarations print their signatures. On main the imported file no longer declares `isRegularLocalRing_of_projectiveDimension_residueField` at all (it is the library's, R01), so the import would stay unused after a merge; an acceptance file also imports no other roadmap's module.

Smallest change: delete line 3, and in the README (lines 142–145) the clause naming that import; merge main into the branch, which merges without conflict and brings the Tau Ceti pin `2fd255d` that R01's declarations need (this head pins `a91d3aa`, which has no `RingTheory/RegularLocalRing/ProjectiveDimension.lean`).

## C01 — The description describes a main that no longer exists

"Current roadmap `main` has no PurityOfBranchLocus directory, so this import cannot build until #1103 merges" and "PurityOfBranchLocus §0.3 owns the ordinary local-algebra chain": main (`592bdb1`) has the PurityOfBranchLocus roadmap, and in it §0.3 is a former section whose targets are Tau Ceti declarations. The text that would be right: this revises a roadmap on main in E1.6 only (21 lines), removes one `Suggested.lean` declaration (`isRegularLocalRing_of_projectiveDimension_residueField`) because the pinned Tau Ceti proves it, and adds no roadmap supplier.

## C02 — The other open revision of this roadmap already changes the same E1.6 targets, and no order between the two is stated

Pull request #1630 changes the same two files and conflicts with this one. At its head the scope section says that the Tau Ceti library owns the global-dimension chain, that E1.6 "imports nothing from `TauCetiRoadmap.PurityOfBranchLocus`", and a table resolves `isRegularLocalRing_of_projectiveDimension_residueField` to `TauCeti.IsRegularLocalRing.of_hasProjectiveDimensionLE` and `isRegularRing_projectiveDimension_le` to `TauCeti.IsRegularRing.hasProjectiveDimensionLE` (README of #1630, lines 2942 and 2966–2967). The description of this pull request does not mention it. Since #1630 covers what this one sets out to do, the natural order is #1630 first and this one rebased on it, keeping only what #1630 lacks, or closed in its favour; say which in the description.

## C03 — The all-module bound that the revision keeps as a target is proved in Tau Ceti at main's pin

The description says E1.6 "retains the genuinely additional all-module bound for finite-dimensional regular rings (00OE)". At the Tau Ceti pin of main, `TauCeti.IsRegularRing.hasProjectiveDimensionLE` (`TauCeti/RingTheory/RegularLocalRing/ProjectiveDimension.lean`, line 239) states it: for `[IsRegularRing R]`, `ringKrullDim R ≤ n` and any `M : ModuleCat R`, `HasProjectiveDimensionLE M n`. This head's pin does not have it, so nothing is wrong at this head; once main is merged (R02), the item "Global dimension of regular rings" would name that declaration on an `*In Tau Ceti:*` line and `isRegularRing_projectiveDimension_le` would leave `Suggested.lean`, the statement staying in the README.

## C04 — *Higher Algebra* §4.1.3 is not about derived tensor products

In §0.3 (line 461) the derived tensor product and internal Hom cite "Lurie, *Higher Algebra*, §4.1.3 and §7.1.2". §4.1.3 is the section on planar ∞-operads and A∞-algebras (HA line 17801, p. 465); the passage from a monoidal model category, such as complexes with their tensor product, to a monoidal ∞-category is §4.1.7 (HA line 18542, p. 485). The statement itself is carried by the Stacks locators of the same sentence, which were checked. Replace §4.1.3 by §4.1.7.

## N01 — A `letI` inside a theorem's signature

`perfectPresentation_torDimension_le` (`Suggested.lean`, line 154) installs the `R`-algebra structure on the perfect closure with `letI` in its statement; an instance binder or a named instance in the signature states the same hypothesis without it. This is text of main, not of this revision.

## N02 — The other roadmap import

`Suggested.lean` also imports `TauCetiRoadmap.SchemeAndStackFoundations.Suggested` (line 2), as it does on main, for `IsReplete`; the usual form is `import Mathlib` and individual `TauCeti.*` modules only.

## Previous findings

- The previous review of this folder read the other open revision (#1630 at `0514180`). Its one finding, R01, concerned that pull request's description (the move of elementary tower theory to AlgebraicTopology Stage 6) and was repaired there; it has no counterpart in this pull request, whose description and diff do not touch §0.3's tower suppliers. Nothing to repair here.

## Verified sound

| Statement | Instances | One side | Other side | Result; change |
| --- | --- | --- | --- | --- |
| §0.1 enhanced category `D(Mod(C,R))`, HA Def. 1.3.5.8, Props 1.3.5.9, 1.3.5.21 | point site, R = k a field; A in degree 0 | every complex K-injective; H⁰(A[0]) = A, Hⁱ = 0 otherwise; A[1] has H⁻¹ = A | HA: dg nerve of fibrant complexes, stable, presentable, t-structure compatible with filtered colimits | agrees; no change |
| §0.2 K-injective and K-flat replacements, Stacks 19.12.6, 21.17.11 | ℤ/4 with all differentials 2; bounded flat complex | termwise free, acyclic; tensor with ℤ/2 has zero differentials, H = ℤ/2 in each degree, so not K-flat | definition by acyclic tensor excludes "termwise flat"; 19.12.6 functorial, 21.17.11 flat terms | agrees; no change |
| §0.3 derived tensor Check | n = 1, 2; degrees i = j = 1 | n = 2: Tor₀ = ℤ/2, Tor₁ = ℤ/2 in degree −1; n = 1: both zero | Check says "for n > 1"; sign (−1)^(1·1) = −1 | agrees; C04 on the HA locator |
| §0.3 Milnor sequence, Stacks 15.88.10 | Kᵢ = [ℤ → ℤ/ℓ^(i+1)] | H⁰(Kᵢ) = ℓ^(i+1)ℤ, images strictly decrease: not ML; H¹(Kᵢ) = 0 | Rlim = [ℤ → ℤ_ℓ], H¹ = ℤ_ℓ/ℤ = lim¹ H⁰ ≠ 0 | agrees; no change |
| §0.3 completion, Stacks 15.93.10, 15.93.18, 15.95.2 | K = ℤ, ℤ/ℓ, ℤ[1/ℓ] | ℤ^ = ℤ_ℓ; RHom(ℤ[1/ℓ], ℤ/ℓ) = 0; ℤ[1/ℓ] ⊗ᴸ ℤ/ℓ = 0, RHom(ℤ[1/ℓ], ℤ[1/ℓ]) ≠ 0 | 15.95.2: naive = derived iff f-power torsion bounded; zero for ℤ | agrees; no change |
| §0.4 exchange map | identity square; composite of two squares | identity: both sides K, map the identity | direction `g*Rf*K → Rf′*g′*K` from unit and counit, composes | agrees; no change |
| E1.6 all-module bound (`isRegularRing_projectiveDimension_le`), Stacks 00OE, 065T | field, ℤ, k[ε]/(ε²), zero ring | pd ≤ 0; pd(ℤ/p) = 1; pd(κ) = ∞ with dim 0; zero ring: all modules zero | elaborated: `[IsRegularRing R]`, `ringKrullDim R ≤ d`, `M : ModuleCat R` | true; C03 |
| E1.6 Serre's criterion (removed at head), Stacks 00OC | k[ε]/(ε²); regular local of dimension d | pd(κ) = ∞, not regular; pd(κ) = d = dim | 00OC (1)⇔(3), with gl.dim = dim = dim 𝔪/𝔪² | statement true; R01 restores it |
| E1.6 "Noetherian of global dimension d iff regular of dimension d" (head, line 697) | ℤ × ℚ; zero ring | gl.dim 1, regular of dimension 1 | 00OE (1)⇔(2); zero ring has no d ∈ ℕ on either side | true; no change |
| E1.6 Kunz, both directions | 𝔽_p[t]; 𝔽_p[ε]/(ε²) | free of rank p over itself | Frobenius kills ε: pushforward is (R/ε)², not flat; ring not regular | agrees; no change |

- Source locators checked against the text: 25 (HA lines 4739, 4743, 4874, 17801, 18542, 46284; StacksInjectives line 883; Cohomology on Sites lines 1342 and contents 24–26, 42; Derived Categories line 5253; StacksMoreOnAlgebra lines 10638, 10814, 10946, 12163, 12293, 12344, 12520; StacksAlgebra lines 12449, 12478, 12552, 12581; BS-proet lines 692, 964, 1139, 1571).
- Library declarations opened: 5, at the Tau Ceti pin of main (`RingTheory/RegularLocalRing/ProjectiveDimension.lean` lines 207, 239, 336, 392; `RingTheory/GlobalDimension.lean` line 90); the same files are absent at this head's pin.
- Cross-roadmap citations resolved: PurityOfBranchLocus §0.3 (a former section on main, mapped to Tau Ceti in its "Scope and ownership"); DeformationAndDerivedPatchingAlgebra (main, README line 1942) cites `isRegularLocalRing_of_projectiveDimension_residueField` as an E1.6 item, which this head removes (R01).
- Record comparison: 7 layers at the merge base, 7 at the head, none retitled; one item statement removed (R01); one `Suggested.lean` declaration removed.
- Lean: with the PurityOfBranchLocus import the elaboration fails at line 1; without it, 0 errors, 24 `sorry` warnings, 33 `#check @name` signatures printed, the E1.6 ones equal to their README statements. One-tactic padding probes were not rerun on the declarations this revision leaves unchanged.
- Dependency check: `depcheck: 1 roadmaps, 1 edges, 0 problem(s)`.
- Changes outside the folder: none.
- Automatic checks: the import, the `letI` and the build were each looked at (R02, N01, N02).

Overlap check: read QuasicoherentSheavesOnPrestacks, DerivedInfinityCategories, AnalyticStacks, SolidAnalyticRings, DiamondEtaleCohomology, PrismaticCohomology. The first, third, fourth, fifth and sixth consume this roadmap by section and own nothing it owns. DerivedInfinityCategories (open) owns the derived ∞-category of a general Grothendieck abelian category and leaves sheaves of modules to others; the ringed-site case of §0.1 is this roadmap's, on main. The regular-local chain of E1.6 is owned by the Tau Ceti library (R01).

Source independence: 9 passages compared with 5 sources (HA, Stacks Injectives, Cohomology on Sites, More on Algebra, Commutative Algebra), none shared beyond formulas and standard names; largest share the Stacks project, about 58 of some 250 source mentions, spread over nine chapters; contents compared with Cohomology on Sites and with BS-proet (55 mentions): independent, the layers E0, 0, E1, E3, E2, E4, E5 follow no run of either's sections.

Research link: §0 and E2 enhance the replete-topos and derived-completion theory of Bhatt–Scholze (2015); E1.6 and E2.8 are the perfect-algebra and h-descent results of Bhatt–Scholze (2017); the enhancement is Lurie's *Higher Algebra* §1.3. Rests on the README's citations and the cached texts read.

## Not verifiable

- Whether the branch, once main is merged and line 3 removed, builds at main's pins: not run, since no file of the pull request may be changed; the merge itself was computed and has no conflict.
- Locators outside the sampled sections §§0.1–0.4 and E1.6 were not reopened in this round.

## Source issues

- none

## For the human reviewers

- Pull requests #1330 and #1630 both revise E1.6 and conflict; #1630 already resolves the regular-local chain to Tau Ceti declarations (its README lines 2942, 2966–2967). Which one proceeds, and whether #1330 is closed, is yours to decide.
