# Review of RootSystems (pull request #1196 at 16d2d99)
Folder: `TauCetiRoadmap/RepresentationTheory/RootSystems/`

**Verdict:** accepted

Incremental re-review of the 131 lines changed since `265d185`, the head the previous review read: the Summary, Scope, From Tau Ceti contract, How to read the build, §3.1, §3.2, the Downstream table and bullets, the References, and in `Suggested.lean` the module-system header, the removed `rational_classification`, the renamed type A headline and the `[Finite ι]` binder of the metric headline. Nothing changed outside the folder (`git diff --stat origin/main...HEAD` excluding the folder and the family index is empty). Every finding of the previous review is accounted for below; none remains, and the gate passes with the build. Pins: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9` (main's).

## Previous findings

- R01 — repaired: `rational_classification` is gone from `Suggested.lean`; the docstring (lines 22–26) lists "the rational classification up to isomorphism" among the pinned theorems not stated; the From Tau Ceti contract (`README.md:326–333`) cites `RootPairing.existsUnique_nonempty_equiv_rationalRootSystem` and `RootPairing.Base.nonempty_equiv_rationalRootSystem_iff` with the pinned hypotheses; §3.1 (`README.md:698–707`) consumes them and "states no target"; the Summary and Scope no longer list the rational classification among the owned results.
- R02 — repaired: the single owner the finding asked for exists on main. RootSystems on main at `03a683f6` (the merged revision) owns the general geometric sign, faithfulness and integral comparison theorems in its §1 and states the EnriquesSurfaces boundary in the same words as this head's `README.md:63–68`. RootSystems is on main and precedes every open pull request, so the object has one owner earlier in the merge order. EnriquesSurfaces (#1286, still at `a85be7e`, `README.md:9, 525–561`) still writes that its §5.2 owns the general theorem: that text conflicts with main, not with anything this pull request adds, and its correction is a finding for that pull request's review, not a change to this folder. Recorded under Verified sound so that the human approver sees it.
- R03 — repaired: `nonempty_weylGroup_mulEquiv_perm_of_typeA` at `Suggested.lean:108` and `README.md:731`; the gate's `statement-hygiene` counter is 0.
- R04 — repaired: `module`, `public import Mathlib`, six `public import TauCeti.*` lines, `@[expose] public section`, closing `end` (`Suggested.lean:1–9, 35, 172`); the targeted build passes (`build=0`) and `lake env lean` emits the ten `sorry` warnings and nothing else.
- R05 — repaired: `README.md:46–49` cites LieHighestWeight by content ("its weight-lattice conventions and the native dominant-integral classification") and its Layer 6; `README.md:1141` cites "its weight conventions, Layer 6 and Layer 10". Layer 6 and Layer 10 exist on main (`RepresentationTheory/LieHighestWeight/README.md:773, 1623`) and at the open head of #1220 (`README.md:1260, 2624`); the conventions and the dominant-integral theorem are at #1220's `README.md:26, 93–143`. No layer id that the revision drops is cited any more.
- R06 — repaired: the course-page link is gone; the Humphreys 1990 entry carries the series, publisher and DOI with "Page numbers are those of the printed edition" (`README.md:1176–1182`); Humphreys 1972 and Kac 1990 carry DOIs and source ids. The board manifest `packages/RootSystems/sources.toml` now records `humphreys72`, `humphreys90` and `kac90` as `uncertified` (seven `[[source]]` tables in all).

## Verified sound

### Head, gate, dependency check, elaboration

Head `16d2d99a766ef84c896ca39296068caa4d6070f2`; worktree clean. Gate rerun with `--build` (the targeted build of `TauCetiRoadmap.RepresentationTheory.RootSystems.Suggested`):

```text
gate RootSystems: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

Dependency check in the brief's `--movable` form:

```text
depcheck: 239 roadmaps, 2429 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The README still has no `From TauCetiRoadmap.<X>` section and no `*Needs:*` line names another roadmap; RootSystemsPartII (merge-order line 204) and EnriquesSurfaces are named as consumers and in the Scope deferrals only.

`lake env lean` on `Suggested.lean`: exit 0, exactly ten `declaration uses sorry` warnings (lines 55, 64, 73, 80, 95, 108, 120, 140, 149, 163), no module-system advisory, nothing else. The worker's `signatures.md` (12 declarations, 0 lost binders) was compared with the README for the three touched declarations: `nonempty_weylGroup_mulEquiv_perm_of_typeA` keeps finite, characteristic-zero domain, crystallographic, reduced and `HasCartanType P b (.A n)` with no spanning and no `1 ≤ n`, as §3.2 says (`TauCeti.HasCartanType` at `DynkinType.lean:418` is a relabelling of Cartan matrices with no validity clause, so `n = 0` is a genuine instance); `invariantMetric_unique_scale` now carries `[Finite ι]`, matching §6.2's "finite irreducible spanning real root pairing" (`README.md:1064`); `basedAut` is unchanged. The dropped import `TauCeti.LinearAlgebra.RootSystem.SimplyConnectedRootDatum.Rational` was used only by the deleted theorem; the file builds without it.

A scratch file with `#check @name` for the seven names the diff introduces or relies on (`RootPairing.existsUnique_nonempty_equiv_rationalRootSystem`, `RootPairing.Base.nonempty_equiv_rationalRootSystem_iff`, `TauCeti.classifiedDynkinType`, `TauCeti.DynkinType.rationalRootSystem`, `RootPairing.weylGroup_equiv_perm_of_typeA`, `TauCeti.nonempty_weylGroup_mulEquiv_of_hasCartanType`, `TauCeti.HasCartanType`) and six `rfl`/`decide` examples (below) elaborated against the pin with zero errors.

### The new supplier contract, read at the pin

| Declaration (file at Tau Ceti `2fd255d9`) | Confirmed against the README sentence (`README.md:326–333`, `698–707`) |
|---|---|
| `RootPairing.existsUnique_nonempty_equiv_rationalRootSystem` (`FiniteType/RationalClassification.lean:70`) | `[Finite ι] [Nonempty ι] [P.IsRootSystem] [P.IsCrystallographic] [P.IsReduced] [P.IsIrreducible]` over ℚ, concluding `∃! t, ∃ ht : t.Valid, Nonempty (P.Equiv (t.rationalRootSystem ht))`: "finite nonempty reduced irreducible crystallographic root system over ℚ, with spanning, exactly one valid type" |
| `RootPairing.Base.nonempty_equiv_rationalRootSystem_iff` (`RationalClassification.lean:56`) | same variables, `(b : P.Base) (ht : t.Valid)`, `Nonempty (P.Equiv …) ↔ t = classifiedDynkinType b`: "equivalent precisely when the type is `TauCeti.classifiedDynkinType` of a given base" |
| `TauCeti.DynkinType.rationalRootSystem` (`SimplyConnectedRootDatum/Rational.lean:80`) | type `RootPairing (Fin t.numRoots) ℚ (Fin t.rank → ℚ) (Fin t.rank → ℚ)`: "root-index set of size the number of roots and both coordinate spaces of dimension the rank"; `numRoots_A n = n (n+1)` and `rank_A n = n` are `rfl` (`NumberOfRoots.lean:55`, `DynkinType.lean:140`) |
| `TauCeti.DynkinType.Valid` | `¬ (C 2).Valid`, `(B 2).Valid`, `¬ (A 0).Valid` by `decide`: the §3.1 Checks on B₂ = C₂ and on the empty system |
| `RootPairing.weylGroup_equiv_perm_of_typeA` (`Weyl/TypeA/Basic.lean:256–266`) | over ℚ with `[P.IsRootSystem]` and `1 ≤ n`, so §3.2's extension (characteristic-zero domain, no spanning, every `n`) is still new at the pin |

### The adversarial table

Rows for statements the diff leaves untouched carry forward from the previous report (its table, rows cited by name); the three rows the diff touches were recomputed. Conventions as in the previous report: `Cᵢⱼ = ⟨αᵢ, αⱼ∨⟩`, geometric form `−cos(π/mᵢⱼ)`, `−1` at an infinite entry.

| Statement | Instances tried | Values computed on the two sides | Result |
|---|---|---|---|
| §3.1 consumed classification (`existsUnique_nonempty_equiv_rationalRootSystem`) | A₁ with bases {α}, {−α}; A₂; B₂ in both orientations; the empty system; the non-spanning rational A₁ (ℚ², roots ±(1,0), coroots ±(2,0)) | A₁: both bases have Cartan matrix [2], `classifiedDynkinType` the one valid type A 1, model `Fin 2` roots in `Fin 1 → ℚ` (`numRoots = 1·2 = 2`, `rank = 1`); A₂: six roots, rank 2, model `Fin 6` in `Fin 2 → ℚ`; B₂: `!![2,-2;-1,2]` and its transpose are one relabelling, `(C 2).Valid` is false and `(B 2).Valid` true, so the unique valid type is B 2; empty: `Nonempty ι` fails and `(A 0).Valid` is false; non-spanning A₁: `IsRootSystem` fails (root span is the first axis), and no `P.Equiv` with the model exists since `V = ℚ²` and the model's `Fin 1 → ℚ` have different dimension, so "with spanning" in the contract is needed and is kept | Pass; the contract states exactly the pinned hypotheses |
| §3.1 `_iff` form | A₁ base {−α}; B₂ base in C-orientation | `classifiedDynkinType` of {−α} is A 1 (Cartan matrix [2] again), so the model of A 1 is equivalent and the model of no other valid type is; the C-oriented base has type B 2 after relabelling, so `t = B 2` on the right and the model of B 2 on the left | Pass |
| §3.2 `nonempty_weylGroup_mulEquiv_perm_of_typeA` (renamed, statement unchanged) | A₀..A₃; ℚ² non-spanning; ℤ[1/2] | orders 1, 2, 6, 24 = (n+1)!; non-spanning A₁ has W of order 2; over ℤ[1/2] the submodule 3R is reflection-stable with 1 ∉ 3R | Pass (previous report, row §3.2) |
| §6.2 `invariantMetric_unique_scale` with `[Finite ι]` | A₁ B = xy, C = 3xy; A₁³ diag(1,2,5); zero space | c = 3 (c = 2 fails at (1,1), c = 0 fails positivity); three squared lengths, three scales for a reducible system; zero space excluded by `Nontrivial` in `IsIrreducible` | Pass; `Finite ι` is the README's hypothesis, unused by the route as before (a note, not a finding) |
| Conventions B₂, A₂ action, inversions, coweights; supplied conventions | as in the previous report | (1,2) vs (1,1); αⱼ and −αᵢ−αⱼ; {α₂, α₁+α₂}; e₁↦e₃; validity false,true,false,true,false,false | Pass (previous report, rows 1–5) |
| §1.1 `GeometricPositive`; §1.2 `rankTwo_nonnegative`, `geometric_sign_criterion`; §1.3 `geometric_faithfulness`, reindexing; §1.4 `integral_geometric_realization`; Layer 1 Example m = 5 | as in the previous report | (1,1) of norm 0 not a root; m = 3 values (1,0),(1,1),(0,1),(0,−1); ℓ(wsᵢ) = 3 vs 1; (2n+1,2n) orbit with det B = 0; [1] violates `Aᵢᵢ = 2`; 2cos(π/5) irrational | Pass (previous report, rows §1.1–§1.4, Layer 1 Example) |
| §2.1 `presentation_length_eq_inversions`; §2.2 longest element and Poincaré | rank 0, A₁, A₂ words; A₁, A₂, G₂ | inversion counts 0, 1, 0–3, [i,i] ↦ 0; lengths 1, 3, 6; 1+q, 1+2q+2q²+q³ | Pass (previous report, rows §2.1–§2.2) |
| §4.1 coefficient reflection; §4.2 `eq_highestRoot_of_forall_root_add_notMem`, unit ascent; §4.3 counts | B₂; A₂, B₂, G₂, D₄, F₄, A₁², empty; E₆–E₈, A₇, C₄, C₉, C₁₃ | s₂(1,0) = (1,2); greatest (1,1), (1,2), (3,2), (1,2,1,1), (2,3,4,2); 36/63/120, heights 11/17/29; Cₙ 16/81/169 | Pass (previous report, rows §4.1–§4.3) |
| §5.1 `basedAut`, `weyl_based_complement`; §5.2 `existsUnique_basedAut_of_cartanMatrix`; §5.3 full data | A₁, A₂, empty, root-free rank one; A₁, A₂, B₂, D₄, E₆; rank 0–2, GL₂, simply connected A₁ | stabilizers 1, 2, 1, 2; Cartan-preserving permutations 1, 2, 1, 6, 2; Aut = 1, {±1}, GL₂(ℤ); root 2 spans 2ℤ ⊊ ℤ | Pass (previous report, rows §5.1–§5.3) |
| §6.1 components; §6.2 r per type | A₂, A₁², empty; B₂, G₂, F₄ | 1, 2, 0 blocks; squared lengths 2,1 and 1,3; long nodes B₂:0, G₂:1, F₄:0,1 | Pass (previous report, rows §6.1, §6.2 r) |

### Ownership and duplication

The diff removes the one duplicate the previous review found (the pinned rational classification) and adds no object. The geometric faithfulness and root-sign theory of Layer 1: RootSystems on main at `03a683f6` (`RepresentationTheory/RootSystems/README.md:32–37`, `Suggested.lean:36–66`) owns it and names EnriquesSurfaces §5.2 as the consumer of the lattice application; this head keeps the same boundary (`README.md:63–68`). EnriquesSurfaces #1286 at `a85be7e` still claims its §5.2 owns the general theorem (`README.md:9`, `525–561`) and cites RootSystems only for exchange and Matsumoto (`README.md:41`): that pull request, later than main, is the one to be brought into line; nothing in this folder changes for it. The open-pull-request index lists only #1196 on `RootSystems`; the overlaps report lists no id this README cites that an open pull request drops, none that only an open revision defines, and none this pull request drops that other roadmaps cite. RootSystemsPartII (#1731, `799ac1d`) cites §5.1 and §6.1 by numbers this head keeps. Ownership against open pull requests was checked through the brief's index and checkouts.

### Shape, policy, sources

The changed passages keep the house shape: §3.1 is prose with five Checks and, having no target, no `*Needs:*` line (its dependencies are in Layer 3's Dependencies paragraph, `README.md:797–800`); §3.2 keeps its locators (Humphreys §2.10 p.41, §1.7 p.14; Milne C.16 and C.25) and `*Needs:*` line; the Downstream table maps the old Layer 5 label to the native and pinned declarations. No process word, pull-request number, LaTeX or local path was added (grepped the diff for `washington`, `Fintype`, `rational_classification`, `Layers 1–2`: none remain in the README). "source id humphreys90" in a References entry follows the existing `milne17` and `sga3iii` entries. Every backticked name of the roadmap's own in the README is declared in `Suggested.lean` (gate `readme-ids-missing=0`).

Seeded sample where it falls in the diff: 3.1 (the consumed contract, verified above at `RationalClassification.lean:56, 70`; Humphreys §1.4 p.10 and §2.9 p.39 cited by locator under `humphreys90`, uncertified); 3.2 (rename only; milne17 lines 25053 and 25116 as in the previous report); 6.2 (`[Finite ι]`; milne17 line 25421 as before). The remaining sampled targets (1.1–1.4, 2.1, 2.2, 4.1–4.3, 5.1–5.3, 6.1) are untouched by the diff and carry the previous report's verification. No README locator is flagged unverified. No manifest or file was edited; the worktree is unchanged.

## Not verifiable

- **humphreys90, humphreys72, kac90, bourbaki46, bjornerbrenti05**: settled as uncertified in the manifest; cited by locator only (§§1.4, 1.7, 1.9, 2.9, 2.10, 5.1, 5.3–5.5; §§9–11; Ch. 4; VI §1 and §4; §2.2, Thm 3.3.1). The §3.1 mathematics was verified against the pinned theorems instead.
- The ten admitted theorems were elaborated and audited by instance, not proved.

## Source issues

- none
