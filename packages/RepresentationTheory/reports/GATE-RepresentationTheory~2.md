# GATE-RepresentationTheory~2: answers to human review

The pull request edits only the RootSystems sub-roadmap (`TauCetiRoadmap/RepresentationTheory/RootSystems/README.md` §3G and `TauCetiRoadmap/RepresentationTheory/RootSystems/GeometricFaithfulnessTargets.lean`). The repairs are in those two files, inside the roadmap folder. The top-level `README.md` is untouched. A top-level `TauCetiRoadmap/RepresentationTheory/Suggested.lean` was added for the index page (see Build and gate). Commits `4f283367` and `48853534`.

## H01 (roed-math) — applied

Old §3G said to prove the sign/length criterion "using the actual native … rank-two formulas". At the pinned Tau Ceti (`358314d`), `TauCeti/GroupTheory/Coxeter/Geometric.lean` lines 213, 261, 282, 292, 377 and 392 (the rotation, shear and order lemmas) are all `private`. New §3G has a separate **Rank-two positivity** target: for `k < M i j` or `M i j = 0`, `cs.wordProd (alternatingWord i j k)` sends `αᵢ` to `a αᵢ + b αⱼ` with `a, b ≥ 0`. It is stated with the explicit sine-ratio and linear coefficients, to be derived from the public `geometricReflection_apply` and `geometricForm_single_single`. The `A₂`, `k = 3` negative control (`αᵢ ↦ −αⱼ`) is included, and the citation is Humphreys §5.4. A **Sign criterion** paragraph follows: non-right-descent implies a nonnegative image, by induction on length via a minimal coset representative for `parabolic {i, j}`. From it come right descent ⇔ negative image, the positive/negative dichotomy, and `sᵢ` permuting the other positive roots. **Faithfulness** is then stated as a consequence. No Lean signature was added for the lemma: it is an intermediate step, and the companion file states only the headline.

## H02 (roed-math) — applied

Old §3G said generic exchange/deletion "remain definite targets", "commissioned in RootSystems Layer3". The companion Lean docstring said the same. That is false at the pin. `CoxeterSystem.strongExchange`, `strongExchange_right`, `exchangeCondition`, `exchangeCondition_right` and `deletionCondition` are public in `TauCeti/GroupTheory/Coxeter/StrongExchange.lean` lines 413–463. §3G now cites them as existing, together with the following, and its new dependency sentence starts from them:

- from `Parabolic.lean`: `parabolic`, `exists_isMinimalCosetRep`, `isMinimalCosetRep_iff` and `length_mul_of_isMinimalCosetRep`;
- from `Dihedral.lean`: `wordProd_alternatingWord_eq_of_mem_parabolic_pair`.

The old dependency paragraph is deleted, and the Lean docstring is corrected to match. Two things are outside this PR's diff and were left as they are on main: Layer 3 of the base RootSystems README, and the introduction's claim that strong exchange and Matsumoto are "explicit TODOs". Both are stale against the same pin (`Matsumoto.lean` has `matsumoto`, line 138). A progress update to the base roadmap should fix them.

## H03 (roed-math) — applied

Old: "restriction to standard parabolics". New: for `J ⊆ B` and `M_J j j' = M j j'`, the map `Finsupp.lmapDomain ℝ ℝ Subtype.val : (J →₀ ℝ) →ₗ[ℝ] (B →₀ ℝ)` intertwines the geometric reflection of `M_J` at `j ∈ J` with `M.geometricReflection j`. This holds because `B(αⱼ, ext v) = Σ v_{j'} (−cos (π / M j j')) = B_J(αⱼ, v)`.

## Adversarial pass on the changed statements

| Statement | Instances | Values | Result |
|---|---|---|---|
| Rank-two positivity, finite `m` | `m = 2..7`, all `k ≤ m`, `alternatingWord` ending in `j` as in Mathlib `Basic.lean` line 396 | every `k < m` gives nonnegative coefficients; `k = m` gives `−αᵢ` (m even) or `−αⱼ` (m odd); `A₂`: k=1 `(1,1)`, k=2 `(0,1)`, k=3 `(0,−1)` | strict bound needed, as stated |
| Rank-two positivity, `m = 0` | `k = 0..11` | `(1,0),(1,2),(3,2),(3,4),(5,4),…` = `(k+1,k)` for k even and `(k,k+1)` for k odd | matches `S(n) = n` |
| Closed formula, finite `m` | `m = 3,4,5,6`, all `k < m` | for example `m=5,k=2`: `(1.618,1.618)` computed and predicted; `m=4,k=3`: `(1,0)` both | agrees on all instances |
| Degenerate `i = j` | `M i i = 1` | `k < 1` forces `k = 0`, image `αᵢ` | stated |
| Sign criterion route | `w = 1`; `w` with descent `j`; `k = M i j` | `w=1`: image `αᵢ ≥ 0`. If `v` has right descent `i`, then `ℓ(w sᵢ) ≤ ℓ(u)+ℓ(v sᵢ) < ℓ(w)`. If `k = m`, `wordProd_braidWord_eq` turns `v` into a word ending in `i` | each step valid |
| `±αᵢ` only multiples | `cαᵢ = w αⱼ` | `B(wαⱼ,wαⱼ)=1=c²` gives `c=±1` | stated |
| Parabolic intertwiner | `v = α_{j'}` with `j' ∈ J` | both sides `α_{j'} + 2cos(π/M j j') αⱼ` | holds |

The numerical checks were run on the reflection formula `v ↦ v − 2B(αᵢ,v)αᵢ` with Gram entries `−cos(π/m)`, and `−1` for `m = 0`. Ownership: §3G is RootSystems' own section, and no other roadmap on main or at the listed open heads states rank-two positivity. `roadmaps resolve` on the RootSystems README reports no unresolved citations or names. Every new Tau Ceti and Mathlib name was checked by hand at the pins. Sources: Humphreys is cited by locator only and was not fetched (a paywalled book). The page range pp. 111–113 given in the review was not checked, so the README cites only "§5.4, Theorem". The `#check @name` comparison was not run: the only declaration, `geometricRepresentation_injective`, is unchanged. The Lean edit is to the docstring only.

## Build and gate

- Index acceptance test: `TauCetiRoadmap/RepresentationTheory/Suggested.lean` did not exist (it is not in the folder on `origin/main` either), because this roadmap is split into sub-roadmaps. It is now added as `import Mathlib`, a module docstring and an empty `namespace TauCetiRoadmap.RepresentationTheory`. The docstring says that the index page owns no headline theorem of its own: each sub-roadmap states its headlines in its own Lean file. For example, faithfulness of the Coxeter geometric representation is stated in `RootSystems/GeometricFaithfulnessTargets.lean` (RootSystems §3G). Restating those headlines here would plan them twice. The file declares nothing, so no `#check @name` comparison applies, and no README name is affected.
- `lake build TauCetiRoadmap.RepresentationTheory.Suggested`: `Build completed successfully (8976 jobs).` The changed file `RootSystems/GeometricFaithfulnessTargets.lean` was not elaborated separately, because the brief gives no build command for it. Its change is docstring only.
- Gate: `gate RepresentationTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck (top-level README, `--movable`): `depcheck: 163 roadmaps, 1163 edges, 0 problem(s)`. There are no UPWARD or CYCLE lines.
