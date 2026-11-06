# Review of GrothendieckInfinityGroupoids (pull request #1060 at fd717d7)

**Verdict:** accepted

:robot: Independent AI review. Incremental re-review of 23 changed lines since 9344ece. No findings. The change makes the identity lifting `idLift` a datum of `PseudoCoherator`, with the proof field `isLifting_idLift`, and defines `identityMap` from it instead of by `Classical.choose`; README §3.2 says so. The gate, the dependency check and the build pass; the changed signatures were elaborated and the two face identities the data must satisfy were proved on a scratch copy. This folder is ready for a human's final approval.

## Previous findings

The previous report (r11) raised no finding of its own and carried one historical item:

- R01 — repaired: TauCetiRoadmap/GrothendieckInfinityGroupoids/Suggested.lean:1–4 and 37 keep the module header (`module`, `public import Mathlib`, `public import TauCeti.Topology.Homotopy.HomotopyGroup.Map`, `@[expose] public section`); the targeted build and direct elaboration succeed with only the three expected sorry warnings.

## Verified sound

**Scope of this re-review.** The diff since 9344ece is 9 lines in TauCetiRoadmap/GrothendieckInfinityGroupoids/README.md (§3.2, lines 362–367) and 14 lines in TauCetiRoadmap/GrothendieckInfinityGroupoids/Suggested.lean (the two new fields of `PseudoCoherator` at lines 372–377 and the body of `identityMap` at lines 437–440). `git diff --stat origin/main...HEAD` outside the folder is empty; `lake-manifest.json` and `lean-toolchain` are identical to main's (Mathlib `f6090c70`, Tau Ceti `358314d4`). The long list of outside-folder files in the change summary is the content of the merge commit 3620700a bringing main into the branch, not changes of the pull request. The worktree is clean and nothing in it was edited.

**The changed statements, read against Ara 2013 (arXiv:1206.2941v2, fetched through the sources service; cited as `ara2013 line N`).**

- `PseudoCoherator.idLift n : D_{(idPair n).n + 1} ⟶ ofTable (idPair n).T` with `isLifting_idLift n : IsLifting (idPair n) (idLift n)`, that is `σ_n ≫ idLift n = eqToHom` and `τ_n ≫ idLift n = eqToHom` into the sum of the one-disk table `(n)`. This is Ara's unit lifting `κ_i : D_{i+1} → D_i` of the admissible pair `(1_{D_i}, 1_{D_i})` with `κ_i σ_{i+1} = 1 = κ_i τ_{i+1}` (ara2013 lines 629–634, §3.5, p. 14; the roadmap's `σ_n : D_n → D_{n+1}` is Ara's `σ_{n+1}`, as the Conventions say). Carrying it as data rather than choosing it in a definition is Ara's own move: a pregroupoidal structure, which includes the `κ_i` with exactly these two equations, is chosen "once and for all" (ara2013 lines 1137–1161, §3.11, pp. 22–23, and line 1208, §4.1, p. 23). The field exists for every contractible extension by `contractible` applied to `idPair n`, so the new structure admits exactly the extensions the old one did, with a choice recorded.
- `identityMap n := idLift n ≫ eqToHom (ofTable_globe n) : D_{n+1} ⟶ D_n` is now a plain `def` with no `Classical.choose`. On a scratch copy importing the built module I proved, with no `sorry`, `σ_n ≫ identityMap n = 𝟙` and `τ_n ≫ identityMap n = 𝟙`, and for every presheaf `X` and `n`-cell `x`, `cellSrc (X.map (identityMap n).op x) = x` and the same for `cellTgt` (axioms `propext`, `Classical.choice`, `Quot.sound` only). So the identity cell `1_x` has source and target `x`, the first Check of §3.2 and Ara's `k_i(u) : u → u` (ara2013 lines 635–638).
- `iteratedIdentity` is unchanged in text and type (`(n : ℕ) → C.Cell X 0 → C.Cell X n`); it uses `identityMap` and so `1^n_x` is Ara's `k⁰_n(x)` entering `π_n(G, x) = π_n(k⁰_{n−1}(x))` (ara2013 line 1410, §4.11, p. 27). `IsWeakEquivalence`, `isWeakEquivalence_iff` and `piPresheaf_isWeakEquivalence_iff` are quantified over every `PseudoCoherator`, so over every choice of `idLift`; Ara 4.17–4.18 and 8.9–8.11 hold for any chosen pregroupoidal structure (ara2013 lines 1208–1211), so the extra data narrows nothing and weakens nothing.
- README §3.2 (lines 362–367) describes exactly this: `1_x` built from `idLift`, carried as data with `isLifting_idLift`; the citations "Ara 2013, §3, and the pregroupoidal structures of 3.11" and the second Check "`v ∗ u : x → z` (Ara 2013, 3.2)" are at ara2013 lines 538–552 and 1137–1161. The README's other mention of `Classical.choose` (line 656) describes the openai/math development's homotopy groups, not this file, and stays correct.

**Gate, dependencies, elaboration.** The worker's gate at this head passes every check including the build. My rerun of the plain gate passes every text scanner and reports only `depcheck: NOT IN ORDER: GrothendieckInfinityGroupoids (insert it after its last supplier)`, which the brief exempts (the roadmap is not in the pre-intake order). The required candidate-order check exits 0 with exactly:

    depcheck: 240 roadmaps, 2352 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. `lake build TauCetiRoadmap.GrothendieckInfinityGroupoids.Suggested` completes (18244 jobs); `lake env lean` on Suggested.lean exits 0 with only the sorry warnings at lines 276, 456 and 493. A scratch `#check @` probe of `PseudoCoherator.idLift`, `isLifting_idLift`, `identityMap`, `iteratedIdentity`, `mk`, `contractible`, `IsWeakEquivalence`, `isWeakEquivalence_iff` and `piPresheaf_isWeakEquivalence_iff` printed the expected types; `mk` now takes the contractibility proof, the family `idLift` and its lifting proof. The 53 declarations of the worker's signature file are unchanged apart from `identityMap`; the three flagged "dropped binder" leads (`CoglobularObject.face`, `faceTo`, `Compatible`) still carry `[Category K]` in their elaborated types, as r11 found. No Lean process is left running.

**Citations and ownership.** The 19 "Lean names found nowhere" leads of citations.md are all this roadmap's own declarations, present in Suggested.lean (the two new ones at lines 374 and 376, `identityMap` at 439). overlaps.md lists no other pull request changing this roadmap and no dropped id; the closest open roadmap, HomotopyTheoryOfCategories (#1521), consumes only `Globe` (its 8.6), as r11 resolved, and does not construct a `PseudoCoherator`. A `roadmaps grep` for `PseudoCoherator` over main and the 459 open heads finds it only in this folder, so no consumer builds the structure and the new constructor arguments break nothing. No supplier edge changed.

**Headlines and padding.** The headline set is unchanged (Ara 8.7, 8.9–8.11, 8.13, 5.5/8.8; the docstring at lines 30–34 still names 8.7 and 5.5/8.8 as not statable and why). No sorried theorem changed, so the one-tactic probe of r10/r11 stands; the two new fields are data of a structure, not declarations that could be padding.

**Note, not a finding.** `idLift`'s type is written through `(idPair n).n + 1` and `ofTable (idPair n).T`, which are `n + 1` and `ofTable (Table.globe n)` only after unfolding `idPair`; `rw` and `simp` at instance transparency do not see this (my probe needed term-mode `Category.assoc` and `eqToHom_trans`). Writing the field as `disks.disk (n + 1) ⟶ ofTable (Table.globe n)` elaborates equally and would spare consumers the unfolding. The statement is correct as it stands.

**Adversarial table.** The first block carries the rows of [r11] for the statements the diff leaves untouched; the second block has the computed values for the changed statements.

[r11]: packages/GrothendieckInfinityGroupoids/reports/PRREVIEW-GrothendieckInfinityGroupoids~11.md

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| every declaration, module header | `#check @` on 53 names; `#print axioms` on 12 | 53/53 resolve; 9 definitions `[propext, Classical.choice, Quot.sound]`; 3 sorried theorems add `sorryAx` | public and sound at the pins | carried from [r11]; re-elaborated here |
| `hemiPoint`, `n = 0` | `hemiPoint 0 false 0`, `hemiPoint 0 true 0` | `1 · √(1 − 0) = 1`; `−1 · 1 = −1` in `ℝ¹` | Check 1.1 (first) | carried from [r11] |
| `norm_hemiPoint` | `x = 0`; `‖x‖ = 1`; `n = 0` | `0 + 1`; `1 + 0`; point `±1`, norm `1` | `‖x‖² + (1 − ‖x‖²) = 1` | carried from [r11] |
| `hemiPoint`, junk value | `‖x‖ > 1` | `√(1 − ‖x‖²) = 0`, point `(x, 0)`, norm `‖x‖ > 1` | excluded by `hx` and the ball subtype | carried from [r11] |
| `continuous_hemiPoint` | `‖x‖ → 1⁻`, across `‖x‖ = 1` | `√(1 − ‖x‖²) → 0`; `Real.sqrt` continuous | true on all of `EuclideanSpace ℝ (Fin n)` | carried from [r11] |
| `hemiPoint_eq_of_norm_eq_one` | `m = 1`, `y = 1`, four sign pairs; `m = 0` | both sides `(1, 0)`; `m = 0` vacuous | true | carried from [r11] |
| `hemiPoint_hemiPoint`, `hemisphere_hemisphere` | 8 sign triples; `n = 0` | inner norm `1`, outer last coordinate `±√0 = 0`; `σ_1 σ_0 = τ_1 σ_0 = (1, 0)` | true | carried from [r11] |
| `stdDisks` | `σ_σ`, `τ_σ` sign triples | `(false, false, true)`, `(true, false, true)` are the two coglobular identities | Ara 1.1 | carried from [r11] |
| `Globe.Hom.comp`, globular identities | degrees `m <, =, > n` | `Hom m n` has 2, 1, 0 elements | true | carried from [r11] |
| `GlobularSet.src_src`, `tgt_src`; `face`, `faceTo` | `D_0 → D_2` | `s(u) = s(v)`, `t(u) = t(v)`; the face fixed by its first step | true | carried from [r11] |
| images of `σ_n`, `τ_n` | `n = 1` | semicircles, union the circle, intersection `{(±1, 0)}` | Check 1.1 (second) | carried from [r11] |
| `Table`, `Table.dim`; `Compatible`; `GlobularSums` at `globe n` | `(1, 1, 1)`, `(1, 0, 1)` | `(1, 1, 1)` rejected; `s(u) = t(v)`; `sum = disk n`, `incl = eqToHom` | Ara 1.3, 3.2; Check 1.2 | carried from [r11] |
| `nonempty_of_hasPushouts`; `Parallel`; `AdmissiblePair.dim_le`; `IsContractible` | width 0; `n = 0`; `(0, (2))`; `Θ₀` | sum is `disk n`; `True`; rejected; `Θ₀` not contractible | true | carried from [r11] |
| `IsGlobularFunctor`, `IsGlobularPresheaf` wrong models | constant `R`; terminal, empty, constant presheaves | constant `R` excluded by `obj_disk 1` | determines Ara's functors | carried from [r11] |
| `CellJoined`; `BijectiveOnLoops` on `Π_∞^R X` | constant maps; `σ_0 = 1`, `τ_0 = −1` | `π_{n+1}(Π_∞^R X, x) = π_{n+1}(X, x)` | true | carried from [r11] |
| `piPresheaf_isWeakEquivalence_iff` | `[0, 1] → *`; `{0, 1} → [0, 1]`; `∅ → *`; constant `R` | both true; both false (`π₀`: 2 vs 1); both false; constant `R` refutes it without `hR` | `hR` necessary, statement holds | carried from [r11] |
| `weTop`; `isWeakEquivalence_iff`; 4.1 Checks; 6.1; 7.1; 7.2; HomotopyTheoryOfCategories 8.6 | as tabulated in [r11] | as tabulated there | true | carried from [r11] |
| §0.2 joined cells, §4.1 π₀ | two isolated 0-cells; terminal model | 2 components; 1 component | distinguishes disconnection | carried from [r11] |
| §1.3 Θ₀, §§1.2 and 2.1 sums | one-disk tables (0), (1) | representable cardinalities (1,0,0), (2,1,0) | correct colimit control | carried from [r11] |
| §2.3 free extension; §2.5 extension functors | empty family | 0 new generators; `C[∅] ≃ C` | original functor determines extension | carried from [r11] |
| §2.4 coherators | constant tower `Θ₀` | reversed pair `(τ₀, σ₀)` has 0 fillers `D₁ → D₁` | freeness alone fails contractibility | carried from [r11] |
| §3.1 models | terminal presheaf, two-disk sum | value on sum 1 element; pullback of `1 → 1 ← 1` has 1 element | preservation holds | carried from [r11] |
| §4.3, `weTop`, criteria | point identity; `∅ → point` | `1 → 1`, `0 → 0` both true; `0 → 1` both false | agrees with inherited controls | carried from [r11] |
| §5.3 comparison | point | `π₀` singleton both sides; positive `π_n` trivial both sides | boundary control | carried from [r11] |
| §6.1 cellular models | zero attachments | colimit initial model; all cell sets empty | zero-stage convention | carried from [r11] |
| §7.1 localization | identity of point | image identity = identity; inverse = identity | direction consistent | carried from [r11] |
| §7.2 change of `R` | `R = R′`, point | singleton values; groups 0 and 0, unique isomorphism | diagonal control | carried from [r11] |
| Research context (README 616–624) and references 690–693 | folk model structure, polygraphs, weakly globular models | as tabulated in [r11] (six rows) | correct | carried from [r11] |

| Statement | Instances | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `PseudoCoherator.idLift`, `isLifting_idLift`, `n = 0` | `idPair 0`: `T = (0)`, `dim 0 ≤ 1`, `Parallel 0 = True` | required: `idLift 0 : D_1 ⟶ ofTable (0) = D_0` with `σ_0 ≫ idLift 0 = eqToHom = τ_0 ≫ idLift 0`. In `Θ₀`: 0 maps `D_1 → D_0`, so no structure; agrees with 2.2's second Check. In `TopCat`: the constant map `D^1 → D^0` satisfies both, `σ_0 ≫ const = const = 𝟙_{D^0}` | field is nonempty exactly when the pair lifts; `contractible` supplies it | new field checked |
| `idLift`, wrong models | the inverse lifting `Ω` of `(τ_n, σ_n)` (Ara 3.5); a map with `σ_n ≫ h = eqToHom` only | `Ω`: `σ_n ≫ Ω = τ_n ≠ eqToHom` for `n ≥ 1` (two distinct maps `D_{n-1} → D_n` in `Θ₀`), first conjunct fails; one-sided `h`: second conjunct `τ_n ≫ h = eqToHom` fails | both excluded by `isLifting_idLift` | new field checked |
| `identityMap n`, faces | all `n`, scratch proof | `σ_n ≫ (idLift n ≫ eqToHom) = eqToHom.symm ≫ eqToHom = 𝟙`; same with `τ_n`; proved sorry-free | Ara's `κ_i σ_{i+1} = 1 = κ_i τ_{i+1}` (ara2013 line 634) | new body checked |
| identity cell `1_x`, §3.2 first Check | every presheaf `X`, `n`-cell `x`, scratch proof | `cellSrc (X.map (identityMap n).op x) = X.map (σ_n ≫ identityMap n).op x = X.map 𝟙 x = x`; same for `cellTgt` | source and target `x` (ara2013 line 638) | new body checked |
| `iteratedIdentity` | `n = 0`; `n = 1` | `x`; `X.map (identityMap 0).op x`, a 1-cell `x → x` by the row above | `1^0_x = x`, `1^1_x = 1_x`; Ara's `k⁰_n(x)` (line 1410) | unchanged type, re-derived |
| `IsWeakEquivalence` over the choice of `idLift` | two structures on the same extension differing in `idLift` | `π_{n+1}(X, 1^n_x)` computed with either choice; Ara Corollary 4.15 (independence of the pregroupoidal structure, README 4.2) gives isomorphic groups; the theorems quantify over every structure | no narrowing by the added data | new context checked |
| README §3.2 locators | §3, 3.2, 3.11 | ara2013 lines 538–552 (compositions, `v ∗ u : x → z`), 629–638 (units), 1137–1161 (pregroupoidal structure with `κ_i`), 1208 (chosen once and for all) | locators support the passage | changed passage checked |

## Not verifiable

- The published journal pagination of Ara 2013 (J. Pure Appl. Algebra 217) was not compared; the arXiv v2 text was read, whose section and paragraph numbers (2.3–2.5, 3.1–3.2, 3.5, 3.11, 4.1, 4.11) are the ones the README cites, and those match.
- The unchanged source qualifications of r10 and r11 (the 1975 letter, the Maltsiniotis texts, the openai/math comparison) were not reopened; nothing in this diff cites them.
- The sources service recorded `ara2013` in a new `sources.toml` of the board package when it fetched the text; since a review edits no manifest, that file was removed again after reading, leaving the package as it was (reports only).

## Source issues

- none
