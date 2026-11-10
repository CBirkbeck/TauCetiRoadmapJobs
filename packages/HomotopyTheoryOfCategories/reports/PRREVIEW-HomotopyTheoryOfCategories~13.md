# Review of HomotopyTheoryOfCategories (pull request #1521 at 361db84)

**Verdict:** needs changes

Incremental re-review of the 18 lines changed since 013a1e4, all in `TauCetiRoadmap/HomotopyTheoryOfCategories/README.md`: the HigherToposTheory F1.8 row of the supplier table (line 58), the **From HigherToposTheory** contract (lines 200–204) and the F1.8 sentences of 7.2 (lines 924–928). `Suggested.lean` and `metadata.toml` are byte-identical to 013a1e4. The README repair is complete and correct. One finding remains, P3, carried from the previous report: the hand-written part of the pull-request description.

## R01 (P3) — the description's supplier list still disagrees with the supplier contracts

**Location.** The pull-request description, under "Ownership and suppliers": "StableHomotopyKTheory §§2.30, 2.31, 2.34 (homology spectral sequence of a functor, Quillen's Theorems A and B)". The list has no HigherToposTheory bullet.

**Claim.** The list is what the roadmap consumes.

**Witness.** At the head:

- `README.md` lines 193–198 consume StableHomotopyKTheory §§1.21, 2.26, 2.29, 2.30 and 2.34. Lines 77–79 say of §2.31 that it is "compared with 2.4 and none is an input to it". So §2.31 and Theorem A are not consumed, and §§1.21, 2.26, 2.29 are consumed and not listed.
- Lines 58, 200–204, 936 and 1003 name HigherToposTheory F1.8 as a supplier of 7.2. The generated `depends-on` block now lists HigherToposTheory; the hand-written list above it does not.

**Repair.** In the description, replace the StableHomotopyKTheory bullet by "StableHomotopyKTheory §§1.21, 2.26, 2.29, 2.30, 2.34 (`π₁(BC)`, homotopy colimits and Thomason's comparison, the homology spectral sequence of a functor, Quillen's Theorem B)" and add the bullet "HigherToposTheory F1.8 (the characterization of Reedy structures), for 7.2". No file in the folder changes.

## Previous findings

- R01 — repaired: line 58 "no non-identity endomorphisms in either class"; lines 200–204 "for some `α` as in convention 15 … `≺₀` (`X ≺₀ Y` when `X ≠ Y` and …)"; lines 924–928 "With some `α` in place of `Ordinal.{u}` … The rank below gives `α = Ordinal.{u}`."
- R02 — partly repaired: the generated `depends-on` block now lists HigherToposTheory; the description's list still reads "StableHomotopyKTheory §§2.30, 2.31, 2.34 (… Quillen's Theorems A and B)" and has no HigherToposTheory F1.8 bullet. Written again as R01 above.

## Verified sound

**Gate and build.**

- The worker's gate at this head: every check 0, including `build=0` and `depcheck=0`, result `OK`.
- My re-run of the gate (`gate … HomotopyTheoryOfCategories --base origin/main`): every text scanner 0. The one non-zero check is `depcheck=1`, "NOT IN ORDER: HomotopyTheoryOfCategories (insert it after its last supplier)", read against the public merge order, which does not list this roadmap yet. By the brief that is not a finding.
- The dependency check against the candidate order prints `depcheck: 234 roadmaps, 2265 edges, 0 problem(s)`: no UPWARD, CYCLE or `moved:` line. The candidate order has StableHomotopyKTheory at line 16 and this roadmap at line 17. HigherToposTheory is another author's open pull request that adds a new roadmap folder, which the brief permits as a supplier.
- `lake env lean` on `TauCetiRoadmap/HomotopyTheoryOfCategories/Suggested.lean`, from the worktree: exit 0, 52 "declaration uses `sorry`" warnings, no other message.
- The Lean file is unchanged, so the `#check @name` signature comparison, the one-tactic padding probe and the reading of the 41 "lost binder" leads as universe renderings stand from PRREVIEW-HomotopyTheoryOfCategories~7 to ~12.
- Pins, from `lake-manifest.json`: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d`.
- Outside the folder: `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/HomotopyTheoryOfCategories'` is empty.

**The repaired passages, against their supplier and the pin.**

- HigherToposTheory F1.8 "Reedy categories", read at its open head: "J admits a `ReedyStructure W₁ W₂ α` for some well-ordered α exactly when every morphism factors uniquely as a `W₁`-map followed by a `W₂`-map, no non-identity endomorphism lies in `W₁` or `W₂`, and `≺₀` has no infinite descending chains". Its proposed `r.Prec X Y` is "`X ≠ Y` together with a `W₂`-map `X ⟶ Y` or a `W₁`-map `Y ⟶ X`". Lines 200–204 here now say the same, with the same strict relation. Its "well-ordered α" abbreviates Mathlib's instance list, which is what "as in convention 15" refers to (`README.md` line 141).
- `HomotopicalAlgebra.ReedyStructure` (`Mathlib/AlgebraicTopology/Reedy/Basic.lean` line 44, 1 declaration opened): fields `deg`, `lt₁`, `lt₂` on morphisms with `¬ identities C f`, and `nonempty_unique`. I checked the characterization as now stated in both directions against these fields. Forward: `lt₁` or `lt₂` on a non-identity endomorphism gives `deg X < deg X`; a strict `≺₀` step raises `deg`, so chains are finite. Backward: `deg` is the rank of `≺₀` in `Ordinal`; a non-identity `W₁`- or `W₂`-morphism has distinct ends because non-identity endomorphisms are excluded, so it is a `≺₀` step.
- `Suggested.lean` lines 590–602: `isDirect_iff_nonempty_reedyStructure` with `Ordinal.{u}` and `IsDirect.of_reedyStructure` for any `α : Type w` with Mathlib's instance list, as 7.2 describes; unchanged.
- The other HigherToposTheory mentions (lines 78, 228, 513, 936, 1003) are untouched and agree with the reworded contract.

**Cross-roadmap citations resolved:** 1 (HigherToposTheory F1.8, at its open head). The six others of the previous report are in untouched lines.

**Seeded sample.** None of the fifteen sampled targets (0.3, 1.3, 2.1, 4.2, 4.4, 5.1, 5.2, 5.3, 8.4, 9.2, 10.1, 10.2, 12.3, 12.4, 12.7) contains or cites a changed line; they stand from the earlier reports. No locator is flagged unverified in the changed lines.

**Overlaps.** The overlap report lists no other pull request changing this roadmap, no cited id that an open pull request drops and no id only an open revision defines. Ownership is as in the previous report: this roadmap owns direct categories and their rank, HigherToposTheory the general Reedy characterization.

**Adversarial table.** Rows for statements the diff leaves untouched are carried forward: the 49 rows of PRREVIEW-HomotopyTheoryOfCategories~7 (0.1–13.3), the 1.4, 4.1, 4.6 and 12.6 rows of ~8, the 1.4 and 8.3 rows of ~9, the 8.3-remark and Out-of-scope rows of ~10, the six rows of ~11 and the 2.4, Comparisons and Downstream rows of ~12. The rows below cover the changed statements, recomputed on the text at this head.

| Statement | Instance | Computed on each side | Result |
| --- | --- | --- | --- |
| F1.8 contract (lines 200–204), "for some `α`" | `C = ω + 1`, `W₁ = identities`, `W₂ = ⊤` | Right: factorization `𝟙 ≫ f` unique; no non-identity endomorphism; `≺₀` is `<` on `ω + 1`, well-founded. Left: `α = ω + 1` or `Ordinal`, `deg = rank`, `deg ω = ω`. With `α = ℕ` no structure, which "for some" no longer asserts. | true (was false at 013a1e4) |
| F1.8 contract, `≺₀` strict | walking isomorphism `a ≅ b`, same classes | Right: unique factorization and no non-identity endomorphism hold; `a ≠ b` with maps both ways, so `a ≻₀ b ≻₀ a ⋯` is infinite: false. Left: `lt₂` on `a ⟶ b` and `b ⟶ a` gives `deg a < deg b < deg a`: false. | both sides false |
| F1.8 contract, both classes nontrivial | `Δ`, `W₁` epimorphisms, `W₂` monomorphisms | Right: epi–mono factorization unique; an epi or mono endomorphism of `[n]` is `𝟙`; each `≺₀` step lowers `len`. Left: `SimplexCategory.reedyStructure`, `α = ℕ`. | true |
| F1.8 contract, non-identity endomorphism in `W₂` | `SingleObj (ℤ/2)`, `W₁ = identities`, `W₂ = ⊤` | Right: factorization unique, `≺₀` is empty (one object, `X ≠ Y` never holds), but the non-identity endomorphism lies in `W₂`: false. Left: `lt₂` gives `deg ★ < deg ★`: false. The endomorphism clause is the one that excludes it. | both sides false |
| F1.8 contract, empty and discrete cases | empty category; discrete category on 2 objects, `W₁ = W₂ = identities` | Empty: all conditions vacuous; empty `deg`. Discrete: factorization `𝟙 ≫ 𝟙` unique, no non-identity morphism, `≺₀` empty; constant `deg = ⊥`. | true |
| Line 58, "no non-identity endomorphisms in either class" | any `C`, `𝟙 X` | `𝟙 X` lies in both classes and is not excluded. | true (was false at 013a1e4) |
| 7.2, "`≺₀` is `DirectRel`" in the case `W₁ = identities`, `W₂ = ⊤` | `ℤ`; `[1]`; `SingleObj (ℤ/2)` | `≺₀ X Y`: `X ≠ Y` and a morphism `X ⟶ Y`. `DirectRel X Y`: a non-identity `X ⟶ Y`. `ℤ`, `[1]`: equal (`<`). `ℤ/2`: `DirectRel ★ ★` holds, `≺₀` empty; they differ only on non-identity endomorphisms, which the sentence's preceding clause (7.1) excludes on both sides. | agree where the sentence uses them |
| 7.2, "With some `α` … The rank below gives `α = Ordinal.{u}`" | `C = ω + 1`; `C = [1]` | `ω + 1`: F1.8 gives some `α`; `rank n = n`, `rank ω = ω` gives the `Ordinal.{u}`-valued structure of the Lean statement. `[1]`: `rank 0 = 0`, `rank 1 = 1`; also `α = ℕ` with `0 ↦ 5`, `1 ↦ 7`, as the Check says. | true |
| `isDirect_iff_nonempty_reedyStructure` (unchanged Lean, changed prose) | `ℤ`; empty category | `ℤ`: not direct; a structure would give `⋯ < deg(−1) < deg 0` in `Ordinal`: none. Empty: direct; empty `deg`. | both directions hold |

**Remarks on untouched text** (no change requested): in 7.2, lines 928–929 the sentence "A direct factorization of `f` is unique: the identity followed by `f`." repeats the clause two lines above it.

## Not verifiable

- Brown–Heath–Kamps 1983, Brown–Spencer 1976 and Joyal–Street 1993 are `uncertified` in the manifest and cited by locator. No changed line cites them.
- Hirschhorn 2003 (8.3) remains verified through secondary sources only, as in the earlier reports. No changed line cites it.

## Source issues

- none
