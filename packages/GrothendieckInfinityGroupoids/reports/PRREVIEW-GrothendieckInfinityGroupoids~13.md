# Review of GrothendieckInfinityGroupoids (pull request #1060 at 9c5e3aa)

**Verdict:** accepted

:robot: Independent AI review. Incremental re-review of 9 changed lines since fd717d7. No findings. The change adds one paragraph to README §3.1, recording as a non-target Ara's theorem that strict ∞-groupoids embed fully faithfully into `∞-Gpd_C` for every coherator `C`, and the matching reference entry. Every claim of the paragraph was read at its locator in the cited text; the gate, the dependency check, the build and the direct elaboration pass. This folder is ready for a human's final approval.

## Previous findings

The previous report (r12) raised no finding of its own and carried one historical item:

- R01 — repaired: TauCetiRoadmap/GrothendieckInfinityGroupoids/Suggested.lean:1–4 and 37 keep the module header (`module`, `public import Mathlib`, `public import TauCeti.Topology.Homotopy.HomotopyGroup.Map`, `@[expose] public section`); the file is byte-identical to the one r12 read, and the targeted build and the direct elaboration succeed with only the three expected sorry warnings.

## Verified sound

**Scope of this re-review.** `git diff --stat fd717d7..HEAD -- TauCetiRoadmap/GrothendieckInfinityGroupoids` is 9 insertions in README.md and nothing else: the paragraph at lines 360–365 (§3.1, after the Checks) and the reference entry at lines 704–705. `Suggested.lean` is unchanged. `git diff --stat origin/main...HEAD` outside the folder is empty; `lake-manifest.json` and `lean-toolchain` are main's. The worktree is clean and nothing in it was edited.

**The new paragraph, read against Ara, « Strict ∞-groupoids are Grothendieck ∞-groupoids » (arXiv:1212.3085v2, fetched through the sources service; cited as `ara2013strict line N`).**

- "the globular extension `Θ̃` of free strict ∞-groupoids on globular sums": §3.2 defines `Θ̃` with the tables of dimensions as objects and the strict-∞-groupoid morphisms between the free strict ∞-groupoids `L(G_T)` as morphisms, a globular extension and globular theory under `Θ₀` (ara2013strict lines 422–435); Proposition 3.3 identifies its models with strict ∞-groupoids (line 436).
- "is contractible (Theorem 6.4, from Theorem 6.1)": Theorem 6.1 says `L(G_T)` is weakly contractible for every table `T` (lines 782–783); Theorem 6.4 says `Θ̃` is canonically contractible, with a proof from 6.1's cofibrant weakly contractible functor and Proposition 5.12 of Ara's earlier paper (lines 806–810). The README states the weaker "contractible", which 6.4 implies; the canonicity it needs later is cited to Theorem 8.1 (next item), which proves it from the "canonically" of 6.4 (line 926).
- "`C` has a globular functor to `Θ̃` (Proposition 2.12)": 2.12(1) gives a globular functor from any free globular extension to any contractible one; 2.12(2) gives uniqueness when the target is a canonically contractible globular theory (lines 388–392). A coherator is free and `Θ̃` is contractible, so the clause is 2.12(1); the "canonical" of the next clause is 2.12(2).
- "restriction along it is a canonical fully faithful functor from strict ∞-groupoids to `∞-Gpd_C` (Theorem 8.1)": Theorem 8.1 states exactly this for every coherator `C`, and its proof is restriction (inverse image) along the unique globular functor `C → Θ̃` composed with `∞-Gpd^str ≃ Mod(Θ̃)`, fully faithful by Corollary 7.6 (lines 923–931). The morphisms on the Grothendieck side are the strict ones (lines 16–17), which are the morphisms of the roadmap's `∞-Gpd_C` (a full subcategory of presheaves, §3.1).
- The theorem applies to the roadmap's coherators: Ara's admissible pairs in this paper (§2.8: globularly parallel, target a globular sum of dimension `≤ n + 1`, lines 362–367) are the roadmap's `AdmissiblePair` (Suggested.lean:321–331, `dim_le : T.dim ≤ n + 1`, `parallel`), and Remark 2.10 (lines 374–379) says the dimension condition is precisely what makes the functor canonical, so the roadmap's convention is the one the theorem needs.
- "Strict ∞-groupoids do not realise every homotopy type (Simpson 1998)": Simpson, arXiv:math/9810059v1, Corollary 6.1 (simpson1998 lines 844–846): for any realization functor satisfying his axioms 3.1 with `n = ∞`, no strict ∞-groupoid realizes `S²`. The README's Research context paragraph (lines 615–619) already states this with its locators; the new line is a one-clause pointer to it.
- The reference entry (README 704–705): the arXiv abstract page gives J. Pure Appl. Algebra 217 (2013), no. 12, 2298–2312, doi 10.1016/j.jpaa.2013.03.008; the README's volume, issue and pages agree. The listed locators (Proposition 2.12, Theorems 6.1, 6.4, 8.1) are the four used in the paragraph.
- Consistency with the scope: "Not in this roadmap: strict ∞-groupoids" (README 50) and the new "Not a target" paragraph agree; the paragraph plans nothing, names no Lean declaration and adds no `*Needs:*` item, so no supplier edge, target or Check changed. §3.1's Needs line, Checks and the layer's Dependencies are as r11 read them.

**Ownership.** `roadmaps grep` over main and the 466 open heads for "strict ∞-groupoids are Grothendieck", for "∞-groupoids of type `C` for every coherator" and for "strict ∞-groupoid" finds only this folder; no roadmap on main or in an open pull request owns the strict-to-Grothendieck comparison, and this roadmap does not own it either (it is a non-target, cited). overlaps.md lists no other pull request changing this roadmap and no dropped id; the closest open roadmaps, HomotopyTheoryOfCategories (#1521, which consumes only `Globe`, as r11 resolved) and HigherToposTheory (#1901), are not among the brief's checkouts, so ownership against #1901's files was not checked beyond the grep above, which finds no mention of strict ∞-groupoids there.

**Gate, dependencies, elaboration.** The worker's gate at this head passes every check including the build. My rerun of the plain gate passes every text scanner and reports only `depcheck: NOT IN ORDER: GrothendieckInfinityGroupoids (insert it after its last supplier)`, which the brief exempts. The required candidate-order check exits 0 with exactly:

    depcheck: 240 roadmaps, 2364 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. `lake build TauCetiRoadmap.GrothendieckInfinityGroupoids.Suggested` completes (18244 jobs); `lake env lean` on Suggested.lean exits 0 with only the sorry warnings at lines 276, 456 and 493. The 53 elaborated signatures of the worker's file are those r12 compared with the README (the Lean file did not change); the three "dropped binder" leads (`CoglobularObject.face`, `faceTo`, `Compatible`) carry `[Category K]` in their elaborated types, as r11 and r12 found. No Lean process is left running.

**Citations.** The 19 "Lean names found nowhere" leads of citations.md are all this roadmap's own declarations, present in Suggested.lean, unchanged since r12. No cross-roadmap citation is unresolved.

**Headlines and padding.** The headline set is unchanged (Ara 8.7, 8.9–8.11, 8.13, 5.5/8.8; the docstring at lines 30–34 names 8.7 and 5.5/8.8 as not statable and why). No sorried theorem changed, so the one-tactic probe of r10/r11 stands. The new paragraph is a non-target and adds nothing to the Lean file.

**Adversarial table.** The first block carries the rows of [r12] (itself carrying [r11]) for the statements the diff leaves untouched; the second block has the computed values for the changed passage.

[r11]: packages/GrothendieckInfinityGroupoids/reports/PRREVIEW-GrothendieckInfinityGroupoids~11.md
[r12]: packages/GrothendieckInfinityGroupoids/reports/PRREVIEW-GrothendieckInfinityGroupoids~12.md

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| every declaration, module header | `#check @` on 53 names; `#print axioms` on 12 | 53/53 resolve; 9 definitions `[propext, Classical.choice, Quot.sound]`; 3 sorried theorems add `sorryAx` | public and sound at the pins | carried from [r12]; file unchanged, rebuilt here |
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
| `PseudoCoherator.idLift`, `isLifting_idLift`, `identityMap`, `iteratedIdentity`, `IsWeakEquivalence` over the choice of `idLift` | as tabulated in [r12] (`n = 0` in `Θ₀` and `TopCat`; the inverse lifting `Ω` and a one-sided map as wrong models; the two face identities proved sorry-free) | as tabulated there | true | carried from [r12] |
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
| §3.1 "`Θ̃` is contractible" (Theorem 6.4) | the unit pair `(1, 1) : D_0 → D_0` in `Θ̃`; the same pair in `Θ₀` | in `Θ̃`: `Hom(D_0, D_0) = Hom_{∞-Gpd^str}(L(G_0), L(G_0))`, the free strict ∞-groupoid on a point; the unique strict map `L(G_1) → L(G_0)` restricts to the identity on both ends, so the pair has a lifting (and exactly one: canonically, ara2013strict 806). In `Θ₀`: 0 maps `D_1 → D_0` (README 2.2 Checks) | `Θ̃` contractible, `Θ₀` not; the paragraph's first claim holds and is not vacuous | new passage checked |
| §3.1 "`C` has a globular functor to `Θ̃`" (Proposition 2.12) | `C = Θ₀` (free, the constant tower); `C` the canonical coherator | `Θ₀ → Θ̃` is the structure functor (ara2013strict 429), the unique one under `Θ₀`; for a coherator, each stage's liftings are sent to the unique liftings in `Θ̃` (2.12(2), lines 391–392, 400–404) | a globular functor exists, and is unique because `Θ̃` is canonically contractible | new passage checked |
| §3.1 "restriction along it is fully faithful" (Theorem 8.1) | `C = Θ₀` (not a coherator): restriction `Mod(Θ̃) → Mod(Θ₀)` is the underlying globular set, faithful but not full (a globular map of strict ∞-groupoids need not respect composition); `C` a coherator: 8.1 | 8.1's hypothesis "coherator" is exactly what makes the functor `C → Θ̃` respect the precategorical structures (Prop. 7.5, lines 898–915), which the `Θ₀` instance lacks | the paragraph quantifies over coherators `C` only; the hypothesis is present | new passage checked |
| §3.1 admissible pairs match Ara's | the pair `(0, (2))` and the pair `(1, (2))` | README/Lean: `dim (2) = 2 ≤ 0 + 1` false, `2 ≤ 1 + 1` true; Ara §2.8: "dimension ≤ n + 1" (line 367), the same two verdicts | the roadmap's coherators are Ara's, so 8.1 applies to `∞-Gpd_C` as defined here | new passage checked |
| §3.1 "do not realise every homotopy type" (Simpson 1998) | `S²`; the point and `K(π, 1)` | `S²` is not realised by any strict ∞-groupoid (simpson1998 844–846); the point and `K(π, 1)` are (a one-object strict 1-groupoid), so the claim is "not every", not "none" | the wording "not every homotopy type" is the correct strength | new passage checked |
| reference entry 704–705 | journal volume, issue, pages, arXiv id, listed locators | arXiv abstract page: JPAA 217 (2013) no. 12, 2298–2312; the four locators are the four used | correct | new passage checked |

## Not verifiable

- The published journal pagination of the strict-groupoid paper was checked against the arXiv abstract page's journal reference, not against the journal copy; the arXiv v2 text was read, and the theorem numbers cited (2.12, 6.1, 6.4, 8.1) are its numbers.
- The unchanged source qualifications of r10–r12 (the 1975 letter, the Maltsiniotis texts, the openai/math comparison, the journal pagination of Ara's first 2013 paper) were not reopened; nothing in this diff cites them.
- The sources service recorded `ara2013strict` in a new `sources.toml` of the board package when it fetched the text; since a review edits no manifest, that file was removed again after reading, leaving the package as it was (reports only).

## Source issues

- none
