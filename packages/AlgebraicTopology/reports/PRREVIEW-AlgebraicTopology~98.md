# Review of AlgebraicTopology (pull request #1663 at 8b51fe6)

**Verdict:** needs changes

This is an incremental re-review of the 21 lines changed since `2dc8cf2`:
- `README.md`: the Inventory opening (lines 225–228) now declares Tau Ceti `2fd255d9…` and Mathlib `1b1ccf4b…`; Stage 8.4 (lines 2111–2113) adds the Lean hypotheses of relative Hurewicz.
- `Suggested.lean`: the relative Hurewicz paragraph of the module docstring (lines 59–67).

Nothing changed outside the folder.

The README half of the previous R01 is repaired. Every one of the 220 dotted names in the Inventory resolves at the declared revisions. The acceptance test still has the problem. `Suggested.lean` is still elaborated at Tau Ceti `358314d4`, and its docstring now concedes that relative Hurewicz is statable but unstated, with a deferral clause. R02 is unchanged.

## R01 (P2) — `Suggested.lean` is elaborated at a Tau Ceti that the README no longer cites, and the statable relative Hurewicz headline is deferred

**Location.** `Suggested.lean` lines 59–60 and 65–67: "Relative Hurewicz … is the one headline statable on the pinned Tau Ceti that this file does not state … Its module … is absent from the Tau Ceti revision this file is elaborated against". It also covers lines 39–57 ("Not stated, because Tau Ceti proves them at the pin: …") and `lake-manifest.json` at this head.

**Claim.** The previous R01, partly repaired. The README now cites its Tau Ceti and Mathlib names at `2fd255d9`/`1b1ccf4b` (lines 225–228), and they all resolve there. But the acceptance test is still elaborated at `358314d4`/`f6090c70`, so two problems remain:
- The headline that the docstring itself calls statable on the pinned Tau Ceti is absent. That is a statable headline left out, which the rules for `Suggested.lean` make P2.
- The docstring's "proves them at the pin" list names 10 declarations that do not exist at the revision the file is elaborated against.

**Witness.** At the manifest's Tau Ceti `358314d4`, `RelHomotopyGroup` is in 0 files and 10 of the 14 names in lines 39–57 are absent. At `2fd255d9`, `Relative/Basic.lean:302` and `Relative/Hurewicz.lean:324` define both carriers. Merging `origin/main` gives 3 conflicts.

**Repair.** Unchanged from the previous review, because only a merge moves the pin: a repair job may not touch `lake-manifest.json`. The worker or a human merges `origin/main` into the branch, or rebases it onto #1854 (see R02). In the plain merge:
1. Keep this head's `Suggested.lean`.
2. Keep the deletion of `GeneralModelOrientation.lean` and `TopologicalGroupFundamentalGroup.lean`.
3. Add `public import TauCeti.AlgebraicTopology.Homotopy.Relative.Hurewicz`.
4. Replace docstring lines 59–67 with this theorem, written in the native indexing, where `RelHomotopyGroup (Fin k)` is `π_{k+1}` (README degree `n + 2`):

```lean
/-- Stage 8.4 (Hatcher, Theorem 4.37, p. 371): for path-connected `Y`, simply connected `B ⊆ Y`
and `π_i(Y, B, b)` trivial for `1 ≤ i ≤ n + 1`, the relative Hurewicz map
`π_{n+2}(Y, B, b) → H_{n+2}(Y, B; ℤ)` is bijective. -/
theorem relativeHurewicz_bijective_of_simplyConnected {Y : TopCat.{0}} (B : Set Y) (b : B)
    [PathConnectedSpace Y] [SimplyConnectedSpace B] (n : ℕ)
    (hrel : ∀ k ≤ n, Subsingleton (TauCeti.RelHomotopyGroup (Fin k) ⟨TopPair.ofSubset B, b⟩)) :
    Function.Bijective fun a : TauCeti.RelHomotopyGroup (Fin (n + 1)) ⟨TopPair.ofSubset B, b⟩ ↦
      (TauCeti.RelHomotopyGroup.hurewicz (ModuleCat.of ℤ ℤ) (n + 1) a).hom 1 := by
  sorry
```

Then name the theorem in README 8.4 and rerun the gate. The statement has the same shape as #1854's `relHurewicz_bijective_of_simplyConnected_subspace` (its `Suggested.lean` line 528), except that it uses `SimplyConnectedSpace B`.

Tested on these instances:
- `(D³, S²)`, `n = 1`: hypotheses hold (`π₁ = π₂ = 0`), and the map `ℤ → ℤ` is bijective. The native `bijective_hurewicz_of_subsingleton_homotopyGroup` does not cover this case, because `π₂(S²) ≠ 0`.
- The cone on `S¹ ∨ S¹`, `n = 0`: the map `F₂ → ℤ²` is not injective, and `SimplyConnectedSpace B` excludes it.
- `pt ⊔ S²` with `B = pt`, `n = 0`: the map `0 → ℤ` is not onto, and `PathConnectedSpace Y` excludes it.

After the merge, lines 39–57 hold at the build pin with no edit.

## R02 (P3) — No order is stated against the conflicting open revisions of this folder

**Location.** The pull request description is unchanged:
- It says "both new companions build", but this branch deletes both companion files.
- It says "Previous roadmap content and dependency pins are preserved".

`README.md` lines 1480, 1489, 2231, 2913 and 2916 consume CharacteristicClasses C1.2a S0–S4.

**Claim.** The previous R02, not repaired. Other open pull requests change this roadmap with conflicting heads, and no order is stated.

**Witness.** #1187, #1652, #1797, #1807, #1808 and #1854 all conflict and are open (heads 66ed0d4, 287181d, 657389a, 92defa2, 55323ac, 59d8c40). At #1854's head, `README.md` lines 162–167 reverse the C1.2a direction, and `Suggested.lean` line 528 states relative Hurewicz.

**Repair.**
- State in the description which of these pull requests this branch follows, and rebase onto it before either merges. Following #1854 also settles R01: #1854 is at `2fd255d9` and already states the theorem.
- If #1854 merges first, replace the C1.2a S0–S4 consumption at the five lines with #1854's ownership.
- Delete the companion-file and "pins are preserved" sentences.

## R03 (P3) — The repair wording defers a headline, points to a README section that does not exist, and ties the README to a moving manifest

**Location.**
- `Suggested.lean` lines 66–67: "the README's supplier contracts name the later revision that carries it, and the headline is stated once this file elaborates there."
- `README.md` lines 225–226: "read at the revisions the content repository's manifest records".

**Claim.** A new problem introduced by this repair.
- "is stated once this file elaborates there" is a promise about a future state, which breaks the timeless rule and the rule against process comments in `Suggested.lean`.
- The README has no supplier-contracts section; the revision is named in `## Inventory`.
- The README's manifest clause is false in this tree, whose manifest records `358314d4`. It will be false again at the next pin bump, while the hashes it names stay fixed.

**Witness.** `grep -n -i 'supplier contract' README.md` finds no match. `lake-manifest.json` at this head pins TauCeti `358314d4…`. #1187, which bumps Tau Ceti to `ab00ba392`, is open.

**Repair.** R01's repair deletes lines 59–67. In README 225–226, write "read at Tau Ceti `2fd255d9…` and Mathlib `1b1ccf4b…`" without the manifest clause. If the merge waits, delete "and the headline is stated once this file elaborates there" and replace "supplier contracts" with "Inventory".

## Previous findings

- R01 — partly repaired: README 225–228 now declares "Tau Ceti `2fd255d…` and Mathlib `1b1ccf4b…`", where all Inventory names resolve. `Suggested.lean` 59–67 is still elaborated at `358314d4` and leaves the statable relative Hurewicz headline unstated. Carried as R01.
- R02 — not repaired: the description still says "both new companions build" and "dependency pins are preserved"; six conflicting pull requests are open with no stated order. Carried as R02.

## Verified sound

**The changed passages.**
- README 225–228, the declared revisions. I swept the 220 dotted backticked names of the Inventory (lines 223–516), as declarations or module paths, at both revisions:
  - At Tau Ceti `2fd255d9` with Mathlib `1b1ccf4b`, 0 are missing.
  - At `358314d4` with `f6090c70`, 94 are missing. Examples: `TauCeti.RelHomotopyGroup`, `TauCeti.CWType`, `TauCeti.lsCategoryCount`, `IsCoveringMap.singularTransfer`, `TopCat.singularHomologyKunneth`.
  - Main (`0b2b0ef`) records `2fd255d9`/`1b1ccf4b` in its `lake-manifest.json`.
  - The two leads in `citations.md` are module paths that exist at `2fd255d9`, at `AlgebraicTopology/Singular/BrouwerFixedPoint.lean` and `Homotopy/Relative/CellDimension.lean`. They are absent at `358314d4`, so neither is a defect under the declared revision.
- README 2111–2113, the new hypotheses. They agree with the native carriers at `2fd255d9`:
  - `RelHomotopyGroup (N) X` is `π_{|N|+1}` (`Relative/Basic.lean:300–303`).
  - `hurewicz R n : RelHomotopyGroup (Fin n) X → (R ⟶ H_{n+1}(X, A; R))` (`Relative/Hurewicz.lean:324`).
  - So source `Fin (n − 1)` is `π_n`. `k ≤ n − 2` covers `π_i` for `1 ≤ i ≤ n − 1`. With `n ≥ 2` there is no natural-number subtraction junk.
- `Suggested.lean` 59–64 restates the same statement consistently.
- At `2fd255d9` the "Not statable at the pins" carriers are still absent, so the claim "the one headline" holds: no twisted cap or twisted cross product, no Cartan–Leray or Künneth spectral sequence, no obstruction or difference cochain, and only `IsEilenbergMacLaneSpaceOne`.

**Gate.** The worker's gate at `8b51fe6` passes (`build=0`). My rerun agrees:

```
gate AlgebraicTopology: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

**Dependency check.**

```
depcheck: 238 roadmaps, 2321 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/AlgebraicTopology'` is empty.

**Elaboration.** `lake env lean` on `Suggested.lean` at the worktree pin exits 0 in 24 s with 13 `declaration uses sorry` warnings and nothing else:
- The warnings are at lines 175, 189, 271, 321, 350, 365, 389, 402, 431, 457, 480, 495 and 514. These are the previous 13 lines, each moved down 4 by the longer docstring.
- The 10 `#check` outputs print.
- A scratch copy with `#check @` for all 35 declarations elaborates with exit 0.
- No declaration changed (the diff touches docstring lines only), so the previous binder comparison and the one-tactic probe still hold: none of the 13 theorems closes in one tactic.

**Overlaps.** I rechecked the six items of `overlaps.md`. No cited id is dropped by an open pull request, none is defined only by an open revision, and this head drops nothing that others cite. The conflicting heads are R02. I read #1854 (59d8c40) and #1797 (657389a) with `roadmaps show`: both state `relHurewicz_bijective_of_simplyConnected_subspace` and reverse the C1.2a direction.

**Sources.** The seeded sample falls in the changed passages at one target, Hatcher Theorem 4.37. It is at `hatcher` line 16124 (page marker at 16122, printed p. 371). It covers an `(n − 1)`-connected pair of path-connected spaces with `n ≥ 2` and `A ≠ ∅`, with `π′_n` the quotient by the `π₁(A)` action, so `π′_n = π_n` when `A` is simply connected. That agrees with 8.4 and the docstring. The other 14 sampled targets are untouched and were verified in earlier reviews. The README flags no locator as unverified.

**Adversarial table.** Rows for changed statements have computed values. Rows for untouched statements are carried from the previous report, as marked.

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| README 225–228: names cited at `2fd255d9`/`1b1ccf4b` (changed) | 220 Inventory names; this tree's manifest | 0 missing at the declared revisions, 94 at `358314d4`; the manifest records `358314d4` | names resolve; the manifest clause is R03 |
| README 2111–2113: hypotheses of 8.4 (changed) | `n = 2` on `(S², pt)`; `n = 3` on `(D³, S²)`; `(X, X)`; cone on `S¹∨S¹`; `pt ⊔ S²` | `π₁ = 0`, so `ℤ → ℤ` bijective; `π₁ = π₂ = 0`, so `ℤ → ℤ` bijective; `0 → 0`; `F₂ → ℤ²` excluded by `SimplyConnectedSpace`; `0 → ℤ` excluded by `PathConnectedSpace` | holds; indices match `Fin k = π_{k+1}` |
| `Suggested.lean` 59–67: "statable on the pinned Tau Ceti … absent from the revision this file is elaborated against" (changed) | `358314d4`; `2fd255d9` | `RelHomotopyGroup` in 0 files vs 19; `Relative/Hurewicz.lean` absent vs present | both halves are true, but they describe a statable headline left unstated: R01, R03 |
| 8.4 relative Hurewicz in Hatcher's generality (r86) | `(D³,S²)` degree 3; cone on `S¹∨S¹` degree 2; `pt ⊔ S²` degree 2 | `ℤ → ℤ` bijective; `F₂ → ℤ²` not injective; `0 → ℤ` not onto | holds |
| relative and absolute vanishing in 8.3 (r86) | `(D³,S²)`, `m = 0,1,2`; `S¹`, `n = 1` | `H̃_(m−1)(S²) = 0`; vacuous at `n = 1` | holds |
| `compactSupportTopClass_existsUnique` (r86) | `K = ∅`; `m = 0`; `S²`; `RP²` | `c = 0`; pointwise; `[S²]`; only `0` | holds |
| `ordinaryPairQuotientComparison`, `homotopyInversePairExtension_left`, `poincareDuality_of_fundamentalClass`, `FundamentalClassDatum` (r86) | `B = ∅`, `(D¹,S⁰)`; `A = ∅`; `RP²`/`𝔽₂`; `S¹` with `μ = 2[S¹]` | `ℤ → ℤ`; constant homotopy; units; `±2` spans `2ℤ` | holds |
| `lsCupLength_add_one_le_categoryCount`, `productBallImages_intersect`, `compactManifoldFiniteCWType`, `homologicalWhitehead`, `groupClassifyingSpace_isEMOne`, `properStrongDeformationRetract_of_inverse`, `finiteSourceMappingCWType`, `exists_transverse_circle_classifying_map`, `elementaryAbelianPair_sphere_action_has_stabilizer` (r86) | point/`T²`; `p = q = 0`; `ℝ`; Poincaré sphere; `S₃`; `[0,∞) ⊃ {0}`; `LS¹`; `z²` on `S¹`; `p = 3, n = 2` | `0+1 ≤ 1`, `2+1 ≤ 3`; IVT; excluded by `CompactSpace`; `π₁` of order 120 excluded; `π₁ = S₃`; `hg` fails; `S¹ × ℤ`; `f⁻¹(1) = {±1}`; `dim H³ = 4 > 1` | holds |

**Remark on untouched text** (not a finding). `Suggested.lean` lines 33–37 state three headlines on the defining conditions of `TauCeti.LSCategoricalCover`, `ContinuousMap.HasProperHomotopyInverse` and `TauCeti.CWType`. All three carriers exist at `2fd255d9` (absent at `358314d4`), so after R01's merge they can be stated on the native carriers.

## Not verifiable

- **Elaboration at main's pin** (Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`, Lean v4.36.0-rc2), both for the file and for R01's proposed statement. This review may run Lean only at the worktree's pin. The native signatures were read in their source files at that revision, and #1854 states the same shape.
- **The heads of #1652, #1807, #1808 and #1187.** They are not among this worker's revision checkouts, so R02 relies on `overlaps.md` and `roadmaps list`.
- **Sources recorded `uncertified`** (Lee, Thom, Milnor 1963, Weibel) and `may1967` (an image-only scan): none is cited by the changed passages.

## Source issues

- none
