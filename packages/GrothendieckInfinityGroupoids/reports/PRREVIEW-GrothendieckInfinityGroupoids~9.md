# Review of GrothendieckInfinityGroupoids (pull request #1060 at 4516c23)

**Verdict:** accepted

Incremental re-review of 8 changed lines since 1230532, the head the previous review read. The change is the module-system header of `TauCetiRoadmap/GrothendieckInfinityGroupoids/Suggested.lean` only: `module`, `public import Mathlib`, `public import TauCeti.Topology.Homotopy.HomotopyGroup.Map`, and `@[expose] public section` before the namespace (lines 1–4 and 37). `README.md` and `metadata.toml` are byte-identical to the previous head, and nothing outside the folder changes. The one finding of the previous report (the gate's build failing on lake's `module` advisory) is repaired; the repair introduced no new problem: every one of the 53 declarations is public in the built module, with the same elaborated type as before, and the compile is clean. No findings.

## Previous findings

- R01 — repaired: lines 1–4 now read `module`, `public import Mathlib`, `public import TauCeti.Topology.Homotopy.HomotopyGroup.Map`; the worker's gate at this head reports `build=0` and every other check 0.

## Verified sound

**The change.** `git diff --stat 1230532..HEAD -- TauCetiRoadmap/GrothendieckInfinityGroupoids/`: `Suggested.lean` only, 6 insertions and 2 deletions, the four header lines above; `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/GrothendieckInfinityGroupoids'` is empty. The folder holds `README.md`, `Suggested.lean`, `metadata.toml` (no stray file). The worktree is clean at `4516c23`; its packages are at the manifest's pins (Mathlib `f6090c70`, Tau Ceti `358314d4`).

**The repair does not hide declarations.** The previous report's repair proposed a bare `module` line; the author's form adds `public import` and `@[expose] public section`, which is what the module system needs for the declarations to be visible to an importer (a `module` file's declarations are private to it unless placed in a `public section`, and `@[expose]` lets the definition bodies, for instance `stdDisks` and `weTop`, be unfolded by consumers). Checked: a scratch file `import TauCetiRoadmap.GrothendieckInfinityGroupoids.Suggested` (the worker's build of the module at this head, `Suggested.olean` in the worktree) followed by `#check @` on all 53 declarations and `#print axioms` on 12, elaborated with `lake env lean` from the worktree: exit 0, no warning, no error; every name resolves, so none went private. Elaborated types identical to the previous report's, in particular `piPresheaf_isWeakEquivalence_iff : ∀ (C : PseudoCoherator) (R : C.Obj ⥤ TopCat), IsGlobularFunctor C.toGlobularExtension stdDisks R → ∀ {X Y : TopCat} (f : X ⟶ Y), C.IsWeakEquivalence ((piPresheaf C R).map f) ↔ weTop f`, `GlobularSums.nonempty_of_hasPushouts : ∀ {K} [Category K] [HasPushouts K] (D : CoglobularObject K), Nonempty (GlobularSums D)`, `isWeakEquivalence_iff` with its two `IsGlobularPresheaf` hypotheses, `stdDisks : CoglobularObject TopCat`, `hemisphere : (n : ℕ) → Bool → (TopCat.disk n ⟶ TopCat.disk (n + 1))`. Axioms: `stdDisks`, `hemisphere`, `hemisphere_hemisphere`, `norm_hemiPoint`, `continuous_hemiPoint`, `hemiPoint_eq_of_norm_eq_one`, `hemiPoint_hemiPoint`, `piPresheaf`, `weTop` each `[propext, Classical.choice, Quot.sound]`; the three sorried theorems add `sorryAx` only. No sorry'd data, no `set_option`.

**Elaboration of the file itself.** A verbatim scratch copy elaborated with `lake env lean` from the worktree at the pins: exit 0, exactly three `declaration uses sorry` warnings (copy lines 276, 450, 487: the three sorried theorems, shifted by the four added header lines from 272, 446, 483), no lake advisory, no error.

**Gate and tooling.** Worker's gate at 4516c23: every check 0 including `set_option=0`, `sorry-data=0`, `imports=0`, `readme-ids-missing=0`, `stray-files=0`, `outside-folder=0`, `depcheck=0`, `build=0`, OK. My rerun of the plain gate on the head: every text check 0 and the one differing line `depcheck: NOT IN ORDER: GrothendieckInfinityGroupoids (insert it after its last supplier)`, the pre-intake artifact (the roadmap is not on main's order yet; not a finding). The brief's dependency check with the candidate order and `--movable`, run on this head:

    depcheck: 205 roadmaps, 1419 edges, 0 problem(s)

no UPWARD, CYCLE or `moved:` line; the roadmap is line 13 of the candidate order, directly after StableHomotopyKTheory (line 12), its only roadmap supplier. No `design/plan.json`, no declared gaps.

**Precedent for the header.** On main, `TauCetiRoadmap/TypeAHeckeAlgebras/Suggested.lean` is the one `Suggested.lean` in module form (`module`, `public import …`, a `public section`); this file's form is the same with `@[expose]` added, and the gate's import check accepts `public import Mathlib` (`imports=0`, `no-import-mathlib=0`).

**Signatures.** The worker's `signatures.md` again flags `CoglobularObject.face`, `CoglobularObject.faceTo` and `CoglobularObject.Compatible` as having lost `[Category.{v} K]`: false positives, as in every previous round; each elaborated type above carries `[inst : CategoryTheory.Category.{u_2, u_1} K]`.

**Unchanged passages.** The README did not change, so the seeded sample (0.1, 0.2, 1.2, 1.3, 2.1, 2.4, 2.5, 3.2, 4.1, 5.1, 5.3, 5.4, 6.1, 7.1, 7.2), the cross-roadmap citations (StableHomotopyKTheory §2.1, HomotopyTheoryOfCategories Layer 8.6) and the library declarations (`TauCeti.Topology.Homotopy.HomotopyGroup.Map`, `TopCat.disk`) stand as the previous report resolved them at these same pins and heads; no locator was re-read because no README line changed. The citation leads in the worker's `citations.md` are this roadmap's own declarations (all 53 resolve above, gate `readme-ids-missing=0`), the openai/math companion's name quoted as data, and StableHomotopyKTheory's `isWeakHomotopyEquivalence`, as before.

**Headlines and padding.** The declarations are the same 53 as before: the three sorried theorems (probed in earlier rounds, none closes in one tactic), the proved hemisphere lemmas that feed `hemisphere` and `stdDisks`, and the definitions the headline needs. The headlines not statable (Ara 8.7, 5.5, 8.8) are named in the module docstring (lines 30–34). Nothing to delete, nothing absent.

**Adversarial pass.** One new row for the header change; the rest carried from the previous report (r8, itself carrying r7 and r4).

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| every declaration, module header | `#check @` on 53 names through `import` of the built module; `#print axioms` on 12; verbatim copy compile | 53 of 53 resolve, types identical to r8's; 9 definitions and lemmas `[propext, Classical.choice, Quot.sound]`; 3 sorried theorems add `sorryAx` only; copy: 3 sorry warnings, 0 errors, 0 advisories | public and sound at Mathlib `f6090c70`, Tau Ceti `358314d4` | none |
| every declaration, pins moved | r8: `#check @` on 53; `#print axioms` on 12 | r8: as above | r8: sound | none |
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

**Principles.** No route-specific shortcut, no re-planned roadmap, no upward or cyclic supply (depcheck 0 with the candidate order), no copied passage, no algorithm, no sorry'd data (`#print axioms` above), no `set_option` (gate 0), nothing changed outside the folder.

## Not verifiable

- The 1975 letter to Breen (Montpellier fonds, folder 134-2), *Pursuing Stacks* (SMF 2022) and Maltsiniotis, Astérisque 301: cited without a content claim, nothing depends on them (as in the previous reports).
- The unchanged README passages (Research context, the openai/math companion directory claim, cisinski2006, maltsiniotis2010, henrylanari2023) and the seeded sample's locators in ara2013: not re-read this round, since no README line changed; the previous reports' items stand.
- Ownership against open pull requests outside the index of 2026-10-31: not searched; the head adds no object.

## Source issues

- none new this round. (The two misprints in ara2013 recorded earlier, 8.1 "fibrant" for "cofibrant" at printed page 52 and the self-citation in the proof of Proposition 5.5 at printed page 36, stand.)
