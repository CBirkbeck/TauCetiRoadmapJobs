# Review of JacobianChallengePartII (pull request #1225 at 2354d71)

**Verdict:** accepted

Incremental re-review of the 4 lines changed since 1e5949a (2 in the README, none in `Suggested.lean`, nothing outside the folder). Both findings of the previous report are repaired exactly as requested, the repairs introduce no new problem, and the gate passes. This report raises no finding.

## Previous findings

- R01 — repaired: README.md:85 now reads “`relativePicardFiberDegree_abelMap_app_of_mem` (for `f` proper and smooth of relative dimension one with geometrically connected fibres, a divisor of degree `d` has fibre degree `d` …)”, matching the pinned binders.
- R02 — repaired: README.md:372 now reads “for `d ≥ 0`, `[d]∘i_{O(x₀)}` sends `x` to the class that `abelJacobiMapOfDegree d` assigns to … `dΓ_x` …; for `d < 0` apply this to `−d` and invert in the Picard group, since `[d] = [−1]∘[−d]` …”. README.md:85 adds “for natural `d`”.

## Verified sound

:robot: Independent AI review. Incremental re-review of 4 changed lines since 1e5949a, at the pins the head's `lake-manifest.json` records (Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`). The outside-folder diff against `origin/main` is empty; the folder holds only `README.md`, `Suggested.lean` and `metadata.toml`. The worktree was left unchanged (`git status` clean); probe copies are in the job's scratch directory.

**Gate.** The worker's gate at this head passes with every check at 0, `build=0` included. My rerun of the gate also passes:

```text
gate JacobianChallengePartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

My rerun did not print a `build` field, so I elaborated the file separately (below).

**Elaboration and signatures.** `Suggested.lean` is byte-identical to 1e5949a (`git diff 1e5949a HEAD` on it is empty). I ran `lake env lean` on a scratch copy with `#check @name` added for all 14 declarations. It gives nine `declaration uses sorry` warnings (lines 79, 91, 110, 129, 140, 158, 178, 210, 226) and nothing else, and all 14 `#check` lines print. `signatures.md` agrees: no declaration lost a section binder. Nothing changed, so there is nothing new to compare with the README.

**Dependency check**, rerun as the brief prescribes:

```text
depcheck: 240 roadmaps, 2372 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. The merge order lists this roadmap at line 51, right after NeronModelsAndSemistableAbelianVarieties (line 50) and after AbelianSchemesAndArithmeticModuli (line 44). The diff adds no supplier and no *Needs:* edge. §2.3's *Needs:* line already names `abelJacobiMap` and `abelJacobiMapOfDegree`, and the inversion the new route uses is the group law of their codomain `relativePicardPresheaf`, which README.md:82 already contracts. No gap is declared.

**Pinned declarations opened** (Tau Ceti `2fd255d9`, namespace `TauCeti.AlgebraicGeometry`; elaborated with `#check @` in a scratch file importing `PicardFunctor.Abel.PicZero`, `.Abel.Degree` and `.Abel.Jacobi`, whose object files were present):

| Name | File and line | Elaborated hypotheses and type | README.md:85 at this head |
| --- | --- | --- | --- |
| `relativePicardFiberDegree_abelMap_app_of_mem` | `PicardFunctor/Abel/PicZero.lean:109` (`variable` at :63–64) | `[IsProper f] [SmoothOfRelativeDimension 1 f] [GeometricallyConnected f]`, `{d : ℕ}`, `D ∈ Div^d(T)` gives fibre degree `↑d` at every `ξ : Spec Ω ⟶ T` | agrees (R01 repaired) |
| `abelJacobiMapOfDegree` | `PicardFunctor/Abel/Degree.lean:110` (`variable` at :74) | `[IsProper f] [RelativeDimensionLE 1 f] [SmoothOfRelativeDimension 1 f]`, section `hx₀`, `(d : ℕ)`, `Div^d ⋙ uliftFunctor ⟶ relativePicardPresheaf f ⋙ forget` | agrees, “for natural `d`” |
| `abelJacobiMapOfDegree_app_mul` | `Abel/Degree.lean:137` | `{d e : ℕ}`; `(D·E) ↦` product of the two classes | agrees |
| `abelJacobiMapOfDegree_zero_app` | `Abel/Degree.lean:150` | degree-zero divisor `↦ 1` | covers `d = 0` in the `d ≥ 0` branch |
| `abelJacobiMap`, `abelJacobiMap_app_apply` | `Abel/Jacobi.lean:89, 101` | `[IsSeparated f] [SmoothOfRelativeDimension 1 f]`; `x ↦ abelMap(Γ_x) / abelMap(Γ_{x₀_T})` | agrees |
| `pow_mem_relativeEffectiveCartierDegreeSubfunctor_obj` | `EffectiveCartierDivisor/Degree/Sum.lean:289` | `D ∈ Div^d → D^n ∈ Div^{n·d}` | puts `dΓ_x` in `Div^d` for `d ≥ 0` (with `Γ_x ∈ Div¹` from `graphDivisorDegreeOne`) |

**Seeded sample in the changed passages.** The diff touches the Tau Ceti contract row and the §2.3 route. Three sampled targets fall in what cites or depends on them: §2.2 (§2.3 needs it), §2.4 (it needs §2.3) and §4.3 (its route applies §2.3 for every `d`). I opened each locator (`yuan` = arXiv 2108.05625v4, fetched through the sources service; Stacks tags read online).

| Target | Locator opened | Support |
| --- | --- | --- |
| 2.2 Degree-d Abel–Jacobi morphism | `yuan` lines 983–987 (§2.2.1, p. 29: `S` noetherian, smooth relative curve of genus `g > 0`, `α` of fibre degree `d`, `i_α : x ↦ dx − α` on functors of points) | Supports the definition `i_α(x) = [dΓ_x − α_T]` for every `d`. The source's “finite” lacks `d ≠ 0` (Source issues); the README already separates finiteness into §2.5 with `d ≠ 0`. |
| 2.3 (changed route) | `yuan` lines 1044–1056 (Prop. 2.6 proof, p. 31: `i_α^*` on `Pic⁰` is `[d]`, checked fibrewise, for `d > 0`) | The factorization is the functor-of-points identity that the route computes. Unchanged locator. |
| 2.4 Degree-one Abel immersion | `yuan` lines 3688–3691 (Theorem A.3, p. 109: over any field, for `α` of degree one, `i_α : x ↦ (x) − α` is the canonical embedding); Stacks Lemma 41.7.2 (tag 04XV: proper, unramified and universally injective is equivalent to a closed immersion); Lemma 35.23.21 (tag 02L6: being a closed immersion is fpqc local on the base) | All three as cited, with the hypotheses the README states. |
| 4.3 Relative curve autoduality | `yuan` lines 1053–1056 (p. 31) | For `d < 0`: `i_α^* = i^*∘[d]^*∘t_b^* = [d]∘u`, since `t_b^*` is trivial on `Pic⁰` and `[−1]^*L ≅ L⁻¹` there. This is consistent with §2.3 now covering negative `d`. |

The other sampled targets (0.0, 0.2, 0.3, 1.1, 1.3a, 3.6, 3.7, 4.5, 4.8, 5.1, 6.2, 7.1) are outside the diff and do not depend on it. The verification of the earlier reports stands for them.

**Computed adversarial pass.** Rows for every changed statement. The previous reports' rows carry forward for every statement the diff leaves untouched: all 14 Lean declarations and the README targets other than the two changed passages (report ~4's table, report ~3's table and the 61 rows of ~2). Notation: `E` is an elliptic curve with origin `e` over a field `k`, `x₀ = e`, `x ∈ E(T)`, `p ∈ E(k)` with `p ≠ e`.

| Statement | Instances tried | Values on each side / excluded model | Result; change |
| --- | --- | --- | --- |
| Row README.md:85, fibre-degree law | `f : E → Spec k`; `f` = a smooth proper curve with two geometric components (`X = C ⊔ C` over `k`) | `E`: all three binders hold. `Γ_x ∈ Div¹`, so the fibre degree is `1`. For `C ⊔ C`, `GeometricallyConnected` fails and the pinned lemma does not apply; the row now says so. | Row matches pin. None. |
| Row README.md:85, `abelJacobiMapOfDegree` | `d = 3`, `d = −1` | `d = 3`: `D ↦ [O(D − 3x₀_T)]` on `Div³`. `d = −1`: no such map, since the index is `ℕ`; the row now says “for natural `d`”. | Matches pin. None. |
| §2.3 route, `d = 0`, `α = O` | `E`, `x` | statement: `i_α(x) = [0 − 0] = 0`, `β = [0·e − 0] = 0`, `t_β∘[0]∘i(x) = 0`. Route: `Γ_x^0` is the empty divisor, `abelJacobiMapOfDegree_zero_app` gives `1` (the trivial class) `= [0]∘i(x)`. | Holds. None. |
| §2.3 route, `d = 0`, `α = O(p − e)` | `E`, `x` | `i_α(x) = [−(p − e)]` is constant; `β = [−(p − e)]`; `t_β(0) = [e − p]`. Equal. | Holds. None. |
| §2.3 route, `d = 2`, `α = O(2p)` | `E`, `x` | `d ≥ 0` branch: `abelJacobiMapOfDegree 2 (Γ_x²) = [2Γ_x − 2e] = 2·[Γ_x − e] = [2]i(x)` (by `_app_mul` with `1 + 1`). `β = [2e − 2p]`. `t_β`: `[2Γ_x − 2p] = i_α(x)`. | Holds. None. |
| §2.3 route, `d = −1`, `α = O(−e)` | `E`, `x` | `d < 0` branch: `−abelJacobiMapOfDegree 1 (Γ_x) = −[Γ_x − e] = [−Γ_x + e]`. `β = [−e + e] = 0`. `i_α(x) = [−Γ_x + e]`. Equal. | Holds (R02's refuting instance now covered). None. |
| §2.3 route, `d = −2`, `α = O(−2p)` | `E`, `x` | `−abelJacobiMapOfDegree 2 (Γ_x²) = [−2Γ_x + 2e]`. `β = [−2e + 2p]`. Sum: `[−2Γ_x + 2p] = i_α(x)`. | Holds with nonzero `β`. None. |
| §2.3 sign identity `−[(−d)Γ_x − (−d)x₀_T] = [dΓ_x − d·x₀_T]` | `d = −3` | left: `−[3Γ_x − 3x₀] = [−3Γ_x + 3x₀]`. Right: `[−3Γ_x − (−3)x₀] = [−3Γ_x + 3x₀]`. A wrong model that negates only the divisor term gives `[−3Γ_x − 3x₀]`, which differs by `6x₀` and fails. | Holds. None. |
| §2.3 `[d] = [−1]∘[−d]` | `J` commutative, `d = −2` | `[−1]([2]a) = −2a = [−2]a`. A non-commutative group is excluded: `J` is an abelian scheme (A0.1). | Holds. None. |
| §2.5 consumer, `d = −1` | `E` | closed immersion `i` (§2.4), then `[−1]` (finite locally free of rank 1), then `t_β`: finite. Matches §2.5's Check “closed immersion followed by inversion”. | Consistent. None. |

**One-tactic probes.** No Lean statement changed. Report ~4's probes of `triangularBaseChange` (`simp`; `exact ⟨rfl, rfl⟩`; `constructor <;> ext <;> simp`, all failing) and the earlier probes stand.

**Headlines.** Unchanged since report ~4. The module docstring still names, per layer, the carriers missing at the pins for the unstatable headlines.

**Ownership and overlaps.** I ran `roadmaps grep 'abelJacobiMapOfDegree|relativePicardFiberDegree_abelMap_app_of_mem'` over main and the 466 open roadmap pull requests. It finds hits only in this folder (README.md:26, 85, 331, 345, 372, 374) and in the parent JacobianChallenge's open revision (its README lines 500, 504), which consumes the same pinned natives. The natives are owned by the pin, and neither roadmap restates them. `overlaps.md` lists no dropped id, no revision-only id and no other pull request changing this roadmap. `citations.md` reports no unresolved cross-roadmap citation. Its 17 “Lean names found nowhere” are this file's 14 declarations plus three AbelianSchemesAndArithmeticModuli names that earlier reports resolved. The diff adds no name to that list.

**Changed text, policy.** The two new passages use Unicode with code spans and no LaTeX. They contain no process words, pull-request numbers or local paths, and no copied passage.

## Not verifiable

- Zhang, *Gross–Schoen cycles and dualising sheaves*, Lemmas 2.2.1–2.2.3 (§4.9): `uncertified` in an earlier round; outside the diff, not reopened.
- Serre, *Lectures on the Mordell–Weil Theorem*, §5.6 (§3.4): `uncertified`; outside the diff, not reopened.
- Mumford–Fogarty–Kirwan, *Geometric Invariant Theory*, §6.2 (§3.13): `uncertified`; outside the diff, not reopened.

No manifest or pull-request file was edited; nothing parks the review.

## Source issues

- **Error** in yuan at §2.2.1, p. 29: the source says `i_α : X → J`, `x ↦ dx − α`, is a finite S-morphism for a line bundle of any fibre degree `d`; it should assume `d ≠ 0`, since for `d = 0` the map is constant on positive-dimensional fibres; affects nothing (every use in the source has `d > 0`; the README states finiteness for `d ≠ 0` in §2.5).
- **Misprint** in yuan at §2.2.1, p. 29: the source says `J = Pic⁰_{X/S}` is the Jacobian scheme “over X over S”; it should read the Jacobian scheme of `X` over `S`; affects nothing.
