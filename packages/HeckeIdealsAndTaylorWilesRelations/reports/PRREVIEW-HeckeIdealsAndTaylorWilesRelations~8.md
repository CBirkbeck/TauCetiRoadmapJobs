# Review of HeckeIdealsAndTaylorWilesRelations (pull request #2893 at 57d7134)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/HeckeIdealsAndTaylorWilesRelations/`
**Verdict:** accepted

**Summary.** Accepted: this incremental re-review of the 117 lines changed since `210cbc9` finds no finding. The new level-module statement (L) of 4.2a, its derivation of the patching data, and the new statements 9.9 (d₀) and (d₀′) agree with the declarations of the formal proof they cite, which were opened. There are four small corrections and no format note, none blocking: 9.9 (d₀′) should say outright that it assumes hypothesis (ii), the descent form quoted in the supplier contracts has no locator, the family index and this README name different commits of the formal proof, and the description does not mention the new statements. The human reviewers still decide on the targets whose only source is the unpublished formal proof, on its licence (the public repository says it has none), and on the review policy the family index now states.

## C01 — 9.9 (d₀′) needs hypothesis (ii), and its wording leaves open whether it is assumed

A reader of "Let `ρ` be as in (d₀), with the flags and hypothesis (i)" (line 509) can take (i) to be the only one of (i)–(iii) assumed, since (d₀) already assumes all three. The first conclusion then fails to follow: a cocycle whose class is in `H¹_f` is, on inertia at a place of `S` prime to `p`, a coboundary `g ↦ ρ(g)Xρ(g)⁻¹ − X`, and this vanishes at every such element for every such cocycle only if `ρ` is trivial there (the coboundary of an `X` not commuting with `ρ(g)` has class `0` and does not vanish at `g`). The formal derivation gets that triviality from irreducibility: in `Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/AdLOf.lean`, the step `adL_triv` uses the field `irr` of `AutomorphicPointLocallyGeneric`, as the route of 3.13a does at line 220 ("nondegenerate, so … trivial on the inertia elements killed by all `χ̄_i`").

The sentence after (d₀′) does list hypothesis (ii) among those of both statements, so the intended reading is probably the right one. Writing "with the flags and hypotheses (i) and (ii)" in line 509 removes the doubt; (iii) is indeed not used there.

## C02 — The descent form attributed to the formal proof in the supplier contracts has no locator

The bullet for PotentialAutomorphyInfrastructurePartII §3.5 (1) now says what the formal proof has (lines 790–794) without a file or declaration, unlike every other statement attributed to it, so the form cannot be looked up. The statement is `UpperTheory.V.Z.Desc.DescWeak` in `Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/CuspidalDescent/DescWeak.lean`, proved as `descWeak` in `Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/TraceFormula/SplitRigidity/HasOfSplit.lean`; it agrees with the bullet (CM field unramified at every finite place, `2 ≤ n ≤ 4`, a finite set of split places containing those above the prime, unramified at the non-split places, Satake parameters at almost all split places). Add the locator.

## C03 — The family index and this README send the reader to different commits of the formal proof

The family index now says that the files the roadmaps name "are to be looked up at that first commit, under its directory `src/`", the commit `40e56bab…` (family `README.md`, lines 12–19). The reference of this README says "the file paths and declaration names cited here are those of commit e50d09817ad8…" (line 889). The repository's own notice says its source has changed since the first commit (files deleted, proofs shortened), so the two commits are not interchangeable. The locators of this README were checked at `e50d098`, where they all resolve. Either state in the index that a roadmap's reference may name a later commit, or check the paths at the first commit and name it in the reference.

## C04 — The description does not mention the statements this change adds

The description says "The existence of the level modules and comparison maps of 4.2a, and 9.9 (d), rest on it alone; the README says where their routes are not written out." At this head 4.2a states the level modules as (L) and derives the patching data from it, and 9.9 states (d₀) and (d₀′) and derives (d) from them; what rests on the formal proof alone is now (L), the operators and the two maps at Iwahori level, and (d₀). A sentence would do: "4.2a states the level modules as (L) and derives the patching data from them; 9.9 (d) is derived from (d₀) and (d₀′); (L), the two maps at Iwahori level and (d₀) rest on the formal proof alone."

## Questions for the author

- 3.13a still says that (1), (a)–(e) and (g) are statements of the formal proof "in the form given here", that is without `μ_l ⊄ L` (line 124). The bundles that assert the existence of `J` with these properties (`UpperTheory.V.W.HidaUAlt`, and `ModUAlt` in `PointTheoremBaseObject.lean`) assume that `L` has no primitive `l`-th root of unity. Is the same true of (b)–(e) and (g) through the declarations cited at lines 124–154? I did not trace each of them. (Carried over; the change does not touch it.)
- `UpperTheory.V.Hi.level_of_is_j_unitary_hecke_data` takes the bundle `UpperTheory.V.Af.HypothesesH'` as its first argument, and one of its fields is the descent statement of C02, which the formal proof proves elsewhere. Are all its fields discharged in the formal proof, so that "(L) is a theorem of [FormalProof]" (line 360) holds without residual hypotheses? I read the statement only.

## Previous findings

The previous report, of `210cbc9`, had no finding, no small correction and no format note; its seven earlier points (R01, C01–C03, N01–N03) were repaired there and the change does not reopen them:

- R01 — repaired: "attached to a regular algebraic cuspidal polarized pair `(Π, χ)` of `GL_n(𝔸_F)`" stands; the Check on polarization now cites "the consumer of 9.9 (c) … (Downstream consumers)" instead of a later roadmap's section.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 4.2a (L), against the formal statement | `LevMod`, `LevPtAlt`, `LevelAlt` (`Classical.lean`, `PaLevel.lean`) | Formal: `∃ b, ∀ V h q v w`, `v` injective, outside `S`, split; ring `R` with pair, `β : R → B`; `fin`, `proj`, `eM`; `ClassicalAlt`. README (i)–(iv) the same | matches |
| (L): the subgroup `Iw′` | `UIw1 = iwC … (ellC l _)`, `ellC` = elements of order prime to `l` | Formal: Iwahori with diagonal residues in the prime-to-`l` subgroup; README: "diagonal entries reduce to elements of order prime to `l`" | matches |
| (L) (iv), Weil–Deligne clause | `WOT`, `WDT` (`GalUnitaryT.lean`) | Formal: `∃ x, IsWDOf ι r x ∧ (Gd y → x = y)`; README: has a Weil–Deligne representation, equal to `rec^T(π_j)` under a condition | shape matches |
| (L) is a theorem | `level_of_is_j_unitary_hecke_data` (`TLevelU.lean`) | `HypothesesH' → … 1 ≤ n → V.S' = s.S → IsJ B K J → LevelAlt B J`; no root-of-unity hypothesis; 4.2a assumes more | holds, with the bundle |
| (L) ⇒ patching data | `has_automorphy_of_statement : HasAutOfAlt` (`THasAutOf.lean`) | `LocPAlt` (fields `bz`, `gl`, `tame`) `→ … LevelAlt B J → HasAut B J`; proof: arbitrary lifts `ut`, exponent `n.factorial` | matches |
| `Iw/Iw′` and `a_{N,j}` | `k_w^×` cyclic of order `Nw − 1`; `Nw ≡ 1 mod l^N` | Quotient by prime-to-`l` part: `ℤ/l^{v_l(Nw−1)}` per diagonal entry, `n` entries per place; `v_l(Nw − 1) ≥ N`; formal `a = padicValNat l (qj w j − 1)`, `le_a` | holds |
| Trace onto, kernel `Σ y·P^{Iw′}` | `Δ = ℤ/l`, module `Λ[Δ]`; non-projective `Λ` with trivial action | Free: invariants `= N_Δ·Λ[Δ]`, `ker N = I_Δ`; trivial `Λ`: norm `= l`, not onto, so projectivity (ii) is used; formal `tr_surj`, `tr_ker` in `opOf_alt` | holds |
| Freeness of `M_N` | `Λ[[x]]/((1+x)^{l^a} − 1) = Λ[Δ]` | Local ring (`Λ` local, `Δ` an `l`-group); summand of a finite projective module is projective, hence free | holds |
| Transport to the Taylor–Wiles groups | `TWPl.e`, `e_inj`; `Glob.Hom.surj` | `e N` surjective by `Hom`, injective by `e_inj`: an isomorphism; `Γ` the group over `L⁺`, `G₀ = ker η` | matches "isomorphisms" |
| 9.9 (d₀) | `DenseThresholdMainCase`, `OrdZero`, `OrdCoc`, `OrdAt` | `μ_l ⊄ L`, `Large`, `2 ≤ n ≤ 4`, `V0ok`, `AutomorphicPointLocallyGeneric`; cocycle zero on `Iu ⊓ ⨅ ker χ̄_i`; upper triangular minus coboundary, zero diagonal on inertia; conclusion coboundary | matches |
| 9.9 (d₀′) | proof of `adjointLiftingTheorem_of_locPrints_of_core`; `bkOrd`; coboundary of `X` with `ρ(g)X ≠ Xρ(g)` | Second condition uses `flag`, `free`, `Par` (`StrictAnti m`); first uses `irr` via `adL_triv`; without triviality on inertia a coboundary is a counterexample | holds with (ii): C01 |
| (d) from (d₀), (d₀′) | `LocalPublishedTheorems → DenseThresholdMainCase → AdjointLiftingTheorem` | Applies the core to the cocycle after checking both `OrdCoc` fields from `IsBK`; README says the same | matches |
| Descent form in the supplier contract | `DescWeak`, `descWeak` | `2 ≤ n ≤ 4`, `S` finite, split, containing the places above `p`; `π` regular algebraic, `DualIsConj`; unramified at non-split places; Satake parameters at cofinitely many split places | matches; no locator: C02 |
| Route of 3.13a (d), added clause | BaseChangeAndGaloisRepresentationsForUnitaryGroups §16.1 at its open head | §16.1 records "The weak base change that [FormalProof] uses, and proves … standard Hermitian form over a CM field unramified …" | citation resolves |

The rows for the untouched statements stand as in the previous review, of `210cbc9`.

- Formal proof (the operator's copy of `src/` at commit `e50d098`): the fourteen locators added resolve, each declaration in the file cited; statements read: `LevMod`, `LevPtAlt`, `LevelAlt`, `LocPAlt`, `HasAutOfAlt`, `has_automorphy_of_statement` (with its proof), `level_of_is_j_unitary_hecke_data`, `opOf_alt`, `twoOf_alt`, `opToTW`, `DenseThresholdMainCase`, `AutomorphicPointLocallyGeneric`, `OrdZero`, `adjointLiftingTheorem_of_locPrints_of_core` (with its proof), `bkOrd`, `DescWeak`.
- Other source locators: none added by the change; the seeded sample fell in the changed passages at 4.2a ((L)), 9.9 ((d₀), (d₀′)) and 3.13a (route of (d)); 10.1 is unchanged.
- Cross-roadmap citations in the changed passages: BaseChangeAndGaloisRepresentationsForUnitaryGroups §16.1 (open head), PotentialAutomorphyInfrastructurePartII §§3.4, 3.5 (1), 4.2 (main), EndoscopicTransferAndUnitaryTraceComparison §6.29; all resolve. The citation of UniformWildKernelBounds §4.3 in the Check of 9.9 is gone.
- Dependency check: `depcheck: 133 roadmaps, 1486 edges, 0 problem(s)`; no UPWARD or CYCLE line. Outside the folder the pull request changes only the family index.
- Family index: the public repository's notice was read; it says the proof belongs to its author, was published without a licence, is mirrored for verification, and has changed since commit `40e56bab`, as the index reports.
- Automatic checks: all passed at this head. `lake env lean` on `Suggested.lean`: exit 0, no output; the file is unchanged and declares nothing (single `import Mathlib`, no `set_option`, no `sorry`), so the `#check @name` comparison and the one-tactic probe had nothing to act on. The four headlines remain not statable, as its docstring says.
- Overlap check: read UniformWildKernelBounds, BernoulliBoundsForClassGroupEigenspaces, BaseChangeAndGaloisRepresentationsForUnitaryGroups, ModularityAndLanglandsExtensionsPartII, CongruenceModulesOfThetaLifts, PotentialAutomorphyInfrastructurePartII, PotentialAutomorphyInfrastructure, GlobalGaloisDeformations (scope as in the previous review; §16.1 and §§3.4–3.5, 4.2 reopened); the change adds (L), (d₀), (d₀′), which are parts of 4.2a and 9.9, owned here; nothing shared.
- Source independence: changed passages only; 6 passages compared with 1 source (FormalProof, Lean statements against prose), none shared; largest share FormalProof, 45 of 57 in-text source citations; arrangement not compared again, since the diff adds, removes or reorders no layer.
- Research link: 9.9 (a)–(c) apply Newton and Thorne's vanishing of adjoint Bloch–Kato Selmer groups (NT23, 2023); 3.13a uses Chenevier's determinants (Che14, 2014) for Hida families at Eisenstein ideals; 3.13a, 4.2a and 9.9 (d) are statements of Alpöge's formal proof (announced 2026). Rests on the README, NT23, Che14 and the Announcement.

## Not verifiable

- That each formal statement compared is proved without residual hypotheses: statements were read, and two proofs. `level_of_is_j_unitary_hecke_data` takes `HypothesesH'`, `has_automorphy_of_statement` takes `LocPAlt`, and `adjointLiftingTheorem_of_locPrints_of_core` and `bkOrd` take `Loc.LocalPublishedTheorems`.
- The condition under which the Weil–Deligne representation in (L) (iv) must equal `rec^T(π_j)` ("a sum of characters with zero monodromy"): the predicate `Gd` behind it was not opened; the README says these definitions are not written out.
- Whether the cited paths exist at the first commit `40e56bab` of the public repository: only the copy at `e50d098` was read (C03).

## Source issues

- none

## For the human reviewers

- Scope: (L), the two maps at Iwahori level in 4.2a, and 9.9 (d₀) rest only on an unpublished, unrefereed Lean formalization; the announcement says a written account is still to come (Announcement lines 45–49). README lines 360–366, 384–390, 591–598.
- Licence: the family index now reports, and the public repository's notice confirms, that the formal proof was published without a licence and is mirrored for verification only (family `README.md`, lines 16–18). The README cites its file paths and declaration names only.
- Policy: the family index gains a section "When a roadmap is wrong" (family `README.md`, lines 45–75) telling reviewers of later contributions not to block one that corrects a roadmap in agreement with the formal proof.
- Not tested: nothing; the formal proof, which has the largest share of the citations (45 of 57), was read at the declarations the change cites.
