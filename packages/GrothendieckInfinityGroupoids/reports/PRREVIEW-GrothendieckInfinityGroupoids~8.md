# Review of GrothendieckInfinityGroupoids (pull request #1060 at 1230532)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since 9281341, the head the previous review read. The head is a merge of main into the branch: it changes nothing in `TauCetiRoadmap/GrothendieckInfinityGroupoids/` and moves the two pins of `lake-manifest.json` to main's (Mathlib `6b7abb3c` → `f6090c70`, Tau Ceti `a91d3aaf` → `358314d4`). The mathematics, the sources and the cross-roadmap citations are therefore the previous report's, re-resolved below at the new pins and heads. One finding, from the worker's gate: its targeted build at this head counts lake's module-system advisory as a failed build, and the brief admits no acceptance while the gate fails. Elaboration at the new pins is clean.

## R01 (P1) — the gate's build fails on lake's `module` advisory at the new pins

**Location.** `TauCetiRoadmap/GrothendieckInfinityGroupoids/Suggested.lean` line 1, `import Mathlib`.

**Claim.** The worker's gate at 1230532 reports `build=1 FAIL`; its single build line is lake's advisory that the file imports `Mathlib` from a package designed for the module system and should start with `module`. The advisory appears on the fresh compile forced by the moved pins (the previous head's build, at the old pins, was clean), and the gate counts it as a failed build, so the roadmap cannot be accepted at this head whatever the compile status.

**Witness.** The worker's gate output at this head: every text check 0, `depcheck=0`, `outside-folder=0`, `build=1`, the one line quoted above. The compile itself is clean: `lake env lean` on a verbatim scratch copy of the file at the new pins exits 0 with exactly three `declaration uses sorry` warnings (the three sorried theorems, copy lines 272, 446, 483) and no error.

**Repair, tested.** Prepend the single line `module` before `import Mathlib` (lines 1–2 then read `module`, `import Mathlib`); nothing else changes. Tested: a scratch copy of the file with that line prepended, elaborated with `lake env lean` from the worktree at the new pins, exits 0 with the same three sorry warnings (copy lines 273, 447, 484) and no advisory. On main at `fa41b374`, `TauCetiRoadmap/TypeAHeckeAlgebras/Suggested.lean` is the one `Suggested.lean` with that header form. If the operators prefer, the alternative is to make the gate ignore the advisory; the roadmap text needs no change either way.

## Previous findings

- The previous report (at 9281341) raised no findings. Its two carried items (the sorry-free hemisphere lemmas and `stdDisks`, and the Breen letter as a bare pointer) stay repaired: the folder is byte-identical to that head, and the `#print axioms` probe below confirms the first at the new pins.

## Verified sound

**The change.** `git diff --stat 9281341e..HEAD` touches `lake-manifest.json` only (two `rev` lines) besides the merged main content; `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/GrothendieckInfinityGroupoids'` is empty, so the pull request changes nothing outside the folder. The worktree's packages are checked out at the new pins (`.lake/packages/mathlib` at `f6090c70`, `.lake/packages/TauCeti` at `358314d4`), and the worker's build of the module at 15:40 produced `Suggested.olean` there.

**Gate and tooling.** Worker's gate at 1230532: every text check 0 (`set_option`, `latex`, `prnum`, `sorry-data`, `imports`, `readme-ids-missing`, `stray-files`, `outside-folder`, …), `depcheck=0`, `build=1` (R01). My own rerun of the plain gate on the head: every text check 0 and the one differing line `depcheck: NOT IN ORDER: GrothendieckInfinityGroupoids (insert it after its last supplier)`, the pre-intake artifact (the roadmap is not on main's order yet). The brief's dependency check with the candidate order and `--movable`, run by me on this head: `depcheck: 205 roadmaps, 1419 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line; the roadmap is line 13 of the candidate order, directly after StableHomotopyKTheory (line 12), its only roadmap supplier. No `design/plan.json`, no declared gaps. Working tree clean.

**Elaboration and axioms at the new pins (Mathlib `f6090c70`, Tau Ceti `358314d4`).** A scratch copy of `Suggested.lean` followed by `#check @` on all 53 declarations and `#print axioms` on `stdDisks`, `hemisphere`, `hemisphere_hemisphere`, `norm_hemiPoint`, `continuous_hemiPoint`, `hemiPoint_eq_of_norm_eq_one`, `hemiPoint_hemiPoint`, `piPresheaf`, `weTop` and the three sorried theorems, elaborated with `lake env lean` from the worktree: exit 0, the only warnings `declaration uses sorry` at the three sorried theorems. Axioms: each definition and each proved lemma lists `[propext, Classical.choice, Quot.sound]`; `GlobularSums.nonempty_of_hasPushouts`, `PseudoCoherator.isWeakEquivalence_iff` and `piPresheaf_isWeakEquivalence_iff` add `sorryAx` from their own `sorry` only. No sorry'd data. Elaborated types, compared with the previous report's: identical for every declaration, in particular `piPresheaf_isWeakEquivalence_iff : ∀ (C : PseudoCoherator) (R : C.Obj ⥤ TopCat), IsGlobularFunctor C.toGlobularExtension stdDisks R → ∀ {X Y : TopCat} (f : X ⟶ Y), C.IsWeakEquivalence ((piPresheaf C R).map f) ↔ weTop f` (README 5.4, lines 483–485), `norm_hemiPoint : ∀ (n : ℕ) (ε : Bool) {x : EuclideanSpace ℝ (Fin n)}, ‖x‖ ≤ 1 → ‖hemiPoint n ε x‖ = 1`, `continuous_hemiPoint : ∀ (n : ℕ) (ε : Bool), Continuous (hemiPoint n ε)`, `hemiPoint_eq_of_norm_eq_one : ∀ (m : ℕ) (ε ε' : Bool) {y : EuclideanSpace ℝ (Fin m)}, ‖y‖ = 1 → hemiPoint m ε y = hemiPoint m ε' y`, `hemiPoint_hemiPoint : ∀ (n : ℕ) (δ ε ε' : Bool) {x : EuclideanSpace ℝ (Fin n)}, ‖x‖ ≤ 1 → hemiPoint (n + 1) ε (hemiPoint n δ x) = hemiPoint (n + 1) ε' (hemiPoint n δ x)`, `hemisphere_hemisphere : ∀ (n : ℕ) (δ ε ε' : Bool), hemisphere n δ ≫ hemisphere (n + 1) ε = hemisphere n δ ≫ hemisphere (n + 1) ε'`, `stdDisks : CoglobularObject TopCat` (README 1.1, lines 208–217). The worker's `signatures.md` flags the same three declarations as every previous round (`CoglobularObject.face`, `faceTo`, `Compatible`, a `[Category.{v} K]` that "looks dropped"): still false positives, each elaborated type carries `[inst : Category.{u_2, u_1} K]`.

**Library declarations at the new pins.** `TauCeti.Topology.Homotopy.HomotopyGroup.Map` exists at `358314d4` (`Map.lean`, namespace `HomotopyGroup` at line 105, `map_apply` line 40, `map_comp` line 72), so the import and `HomotopyGroup.map` (README 5.3, Conventions) resolve; `TopCat.disk` is `Mathlib/Topology/Category/TopCat/Sphere.lean` line 28 at `f6090c70` (`diskBoundary` line 32, `diskBoundaryInclusion` line 58), the carrier of `hemisphere` and `stdDisks`; no hemisphere inclusion `D^n ⟶ D^{n+1}` exists there, so ownership of `stdDisks` stays here (previous report).

**Cross-roadmap citations, resolved at the current heads.** StableHomotopyKTheory §2.1 (README lines 55, 109, 144–150, 487, 508, 544, 581) at the head of its open pull request (`85481d5`): `### 2.1 Weak homotopy equivalences of spaces` with the bullets `IsWeakHomotopyEquivalence.comp` and `ContinuousMap.HomotopyEquiv.isWeakHomotopyEquivalence`, and `def IsWeakHomotopyEquivalence` at its `Suggested.lean` line 68; the three names of the README's supplier table are there. HomotopyTheoryOfCategories Layer 8.6 (README lines 53, 58, 172, 587) at the head of its open pull request (`792c2cf`): its supplier table names GrothendieckInfinityGroupoids Layer 0.1 for `𝔾`, "consumed in 8.6, which proves it direct; globular sets stay there", and item 8.6 "The globe category" cites Layer 0.1 here. The worker's `citations.md` lists no cross-roadmap citation found nowhere; its 18 Lean-name leads are this roadmap's own declarations (gate `readme-ids-missing=0`), the openai/math companion's name quoted as data, and StableHomotopyKTheory's, as in the previous report.

**Seeded sample.** The fifteen sampled items (0.1, 1.1, 1.2, 1.3, 2.1–2.5, 3.2, 4.1, 5.1, 5.3, 6.1, 7.2) are textually unchanged since the heads at which they were verified against ara2013 (cache id `e9372f61`) at the locators the previous two reports list (Ara 1.1, 1.3, 1.4, 1.5.1–1.5.4, 1.9.1, 1.11–1.12, 2.2, 2.9–2.12, 4.2–4.17, 5.2–5.6, 5.10, 5.14, 8.4, 8.7–8.13); no locator was re-read this round because no line changed.

**Adversarial pass.** One new row for the re-elaboration at the new pins; the rest carried from the previous report ("r7", itself carrying "r4").

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| every declaration, pins moved | `#check @` on 53 names; `#print axioms` on 12 | 53 types identical to r7's; 9 definitions and lemmas `[propext, Classical.choice, Quot.sound]`; 3 sorried theorems add `sorryAx` only | sound at Mathlib `f6090c70`, Tau Ceti `358314d4` | none |
| `hemiPoint`, `n = 0` | r7: `hemiPoint 0 false 0`, `hemiPoint 0 true 0` | `1 · √(1 − 0) = 1`; `−1 · 1 = −1` in `ℝ¹` | r7: Check 1.1 (first) | none |
| `norm_hemiPoint` | r7: `x = 0`; `‖x‖ = 1`; `n = 0` | `0 + 1`; `1 + 0`; point `±1`, norm `1` | r7: `‖x‖² + (1 − ‖x‖²) = 1` | none |
| `hemiPoint`, junk value | r7: `‖x‖ > 1` | `√(1 − ‖x‖²) = 0`, point `(x, 0)`, norm `‖x‖ > 1` | r7: excluded by `hx` and the ball subtype | none |
| `continuous_hemiPoint` | r7: `‖x‖ → 1⁻`, across `‖x‖ = 1` | `√(1 − ‖x‖²) → 0`; `Real.sqrt` continuous on `ℝ` | r7: true on all of `EuclideanSpace ℝ (Fin n)` | none |
| `hemiPoint_eq_of_norm_eq_one` | r7: `m = 1`, `y = 1`, four sign pairs; `m = 0` | both sides `(1, 0)`; `m = 0` vacuous (`‖y‖ = 0`) | r7: true | none |
| `hemiPoint_hemiPoint`, `hemisphere_hemisphere` | r7: all 8 sign triples; `n = 0` | inner norm `1`, outer last coordinate `±√0 = 0`; `σ_1 σ_0 = τ_1 σ_0 = (1, 0)` | r7: true | none |
| `stdDisks` | r7: `σ_σ`, `τ_σ` sign triples | `(false, false, true)`, `(true, false, true)` are the two coglobular identities | r7: Ara 1.1 | none |
| `Globe.Hom.comp`, globular identities | r4 | `Hom m n` has 2, 1, 0 elements for `m <, =, > n` | r4: true | none |
| `GlobularSet.src_src`, `tgt_src`; `face`, `faceTo` | r4 | `s(u) = s(v)`, `t(u) = t(v)`; the face `D_0 → D_2` fixed by its first step | r4: true | none |
| images of `σ_n`, `τ_n` | r4, `n = 1` | semicircles, union the circle, intersection `{(±1, 0)}` | r4: Check 1.1 (second) | none |
| `Table`, `Table.dim`; `Compatible`; `GlobularSums` at `globe n` | r4 | `(1, 1, 1)` rejected; `s(u) = t(v)` for `(1, 0, 1)`; `sum = disk n`, `incl = eqToHom` | r4: Ara 1.3, 3.2; Check 1.2 | none |
| `nonempty_of_hasPushouts`; `Parallel`; `AdmissiblePair.dim_le`; `IsContractible` control | r4 | width 0 sum is `disk n`; `n = 0` gives `True`; `(0, (2))` rejected; `Θ₀` not contractible | r4: true | none |
| `IsGlobularFunctor` wrong models; `IsGlobularPresheaf` | r4 | constant `R` excluded by `obj_disk 1`; terminal, empty, constant presheaves | r4: determines Ara's functors | none |
| `identityMap`, `iteratedIdentity`; `CellJoined`; `BijectiveOnLoops` on `Π_∞^R X` | r4 | constant maps; path relation with `σ_0 = 1`, `τ_0 = −1`; `π_{n+1}(Π_∞^R X, x) = π_{n+1}(X, x)` | r4: true | none |
| `piPresheaf_isWeakEquivalence_iff` instances | r4 | `[0, 1] → *` both true; `{0, 1} → [0, 1]` both false (`π₀`: 2 vs 1); `∅ → *` both false; constant `R` refutes it without `hR` | r4: `hR` necessary, statement holds | none |
| `weTop`; `isWeakEquivalence_iff`; 4.1 Checks; 6.1; 7.1; 7.2; HomotopyTheoryOfCategories 8.6 | r4 | as tabulated there | r4: true | none |

**Padding and headlines.** Unchanged file: the three sorried theorems were probed in earlier rounds (`isWeakEquivalence_iff` is (1) ⇒ (2) of Ara 4.13 in content, `nonempty_of_hasPushouts` has no one-tactic proof, `piPresheaf_isWeakEquivalence_iff` is the end theorem); the proved lemmas feed the definitions `hemisphere` and `stdDisks`. The headlines not statable (Ara 8.7, 5.5, 8.8) are named in the module docstring (lines 28–32). Nothing to delete, nothing absent.

**Principles.** No route-specific shortcut, no re-planned roadmap, no upward or cyclic supply (depcheck 0 with the candidate order), no copied passage, no algorithm, no sorry'd data (`#print axioms` at the new pins), no `set_option` (gate 0), nothing changed outside the folder.

## Not verifiable

- The 1975 letter to Breen (Montpellier fonds, folder 134-2), *Pursuing Stacks* (SMF 2022) and Maltsiniotis, Astérisque 301: cited without a content claim, nothing depends on them (as in the previous reports).
- The unchanged passages (Research context, the openai/math companion directory claim, cisinski2006, maltsiniotis2010, henrylanari2023): not re-read this round; the previous reports' items stand.
- Ownership against open pull requests outside the index of 2026-10-31: not searched; the head adds no object.

## Source issues

- none new this round. (The two misprints in ara2013 recorded earlier, 8.1 "fibrant" for "cofibrant" at printed page 52 and the self-citation in the proof of Proposition 5.5 at printed page 36, stand.)
