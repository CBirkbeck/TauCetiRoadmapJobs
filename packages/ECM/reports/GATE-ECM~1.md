# GATE-ECM~1: answers to human review on TauCetiRoadmap/ECM

Commit `655a340` (on `6c5fb15`, not pushed).

## H01 (CBirkbeck) — answered

The doubling formula, the coefficient conversion and the discriminant agree. Recomputed: `x(2P) = C(V + A24·C)/(UV)` with `C = 4XZ`, `UV = (X²−Z²)²` gives `(x²−1)²/(4x(x²+Ax+1))`. For `(0,AB,0,B²,0)`, `b₂=4AB`, `b₄=2B²`, `b₆=0`, `b₈=−B⁴`, so `Δ = 16A²B⁶ − 64B⁶ = 16B⁶(A²−4)`. That identity is now a proved `example` in `TauCetiRoadmap/ECM/Suggested.lean` (`simp only [...]; ring`), so it is no longer `sorry`. A brute-force recheck over p = 3, 5, 7, 11, 13, every nonsingular A and B ∈ {1,2} (9,000 cases) found no mismatch: xDBL never returns `(0,0)` on a point and represents `2P`, and xADD represents `P+Q` off its exceptional locus.

## H02 (CBirkbeck) — applied differently

At the current pin (Tau Ceti `a91d3aa`, the same in this branch's and the content repository's `lake-manifest.json`), `TauCeti/AlgebraicGeometry/EllipticCurve/PointCount.lean` exists. It has `WeierstrassCurve.pointCount` (line 73) and `WeierstrassCurve.pointCount_eq_card_point` (line 86), and the latter assumes `[Finite {p : F × F // W.toAffine.Equation p.1 p.2}]` and `[W.IsElliptic]`. So no pin change is needed. The README now names that theorem and its two hypotheses (README "Foundations and boundaries"). Old: "its comparison with `Nat.card` of the point group". New: `pointCount_eq_card_point` under finiteness of the solution set and `W.IsElliptic`, with finiteness automatic over `ZMod p`.

## H03 (kim-em) — answered

Confirmed: the pin `a91d3aa` now on the branch contains `PointCount.lean` with both declarations (see H02). The PR diff is confined to `TauCetiRoadmap/ECM/`.

## H04 (roed-math) — answered

`TauCetiRoadmap/ECM/metadata.toml` exists with `topic = "math.NT"` (commit `239c600`), and the gate's metadata check reports 0.

## H05 (kim-em) — answered

The milestone 4 exceptional-locus claim from `5ace914` holds. On a nonsingular curve in odd characteristic, with `R = P − Q`, xADD gives `(0,0)` exactly when `R = O` or `R = (0,0)`. Algebraically, `a−b = 2(Z_P X_Q − X_P Z_Q)` and `a+b = 2(X_P X_Q − Z_P Z_Q)`. If `Z_R = 0` then `P = Q` and `a = b`. If `X_R = 0` then `x_P x_Q = 1`, the translation by `(0,0)`. If `a+b = a−b = 0` then `x_P = x_Q = ±1`, so `P = ±Q` and `R ∈ {O, 2P = (0,0)}`. The brute-force check in H01 agrees in every case. The order-two example is also right: `xADD(T,O,T) = (4r², 4r) ~ (r:1)` for `r ≠ 0`. The `w`/`D` split from `6c5fb15` is consistent: `w` occurs only in milestone 10, and `D` only in the scaled doubling and Suyama `D = 4d`.

## Other change (gate conformance, not from a comment)

`TauCetiRoadmap/ECM/Suggested.lean` now has a single `import Mathlib` line. It previously had three `Mathlib.*` submodule imports, which the gate refuses. Two `sorry`'d examples are deleted. One was a gcd triviality: `1 < gcd ∧ gcd < n ∧ gcd ∣ n` from `p ∣ n`, `p ∣ t`, `gcd < n`. The other was `addOrderOf P ∣ M → M • P = 0`, which is Mathlib's `addOrderOf_dvd_iff_nsmul_eq_zero`. Both stay in the README as prose (milestones 8, 9). The module docstring now says what the file states and that the correctness theorems are README targets. The bodies of `model`, `Pair` and `double` are unchanged, and the file has no `variable` block, so no binder can drop. Their types are as in the earlier elaborated signatures: `model : {R} → [CommRing R] → R → R → WeierstrassCurve R`, `Pair : Type u → Type u`, `double : {R} → [CommRing R] → R → R → Pair R → Pair R`. A separate `#check` file was not run, because the brief allows only the build command. The file still states no headline correctness theorem. That gap, and the README's non-standard shape (milestones rather than layers), are outside this review's scope and were not changed.

## Adversarial pass (statements touched or answered)

| statement | instances | values | result |
|---|---|---|---|
| `Δ(model A B) = 16B⁶(A²−4)` | general ring; A=±2 | b-invariants above; Δ=0 at A=±2 (singular) | proved in Lean |
| xDBL ≠ (0,0) on a point | U=0 (X=−Z): C=−V, DV+NC=V(D−N)=0 iff A=2; V=0: NC=0 iff A=−2 | both are excluded by A²≠4 | holds; brute force p≤13 agrees |
| xADD zero locus = {R=O, R=(0,0)} | P=Q; P=Q+T₀; x=±1 (order 4); Q=O, P=T₀ | (0,0) in each listed case, nonzero otherwise | holds; 0 mismatches in 9,000 cases |
| `xADD(T,O,T) ~ T`, T=(r,0), r≠0 | r=1 over F₇ | (4,4) ~ (1:1) | holds |
| `pointCount_eq_card_point` hypotheses | at pin a91d3aa | `[Finite …] [W.IsElliptic]` | README updated |

Ownership against open pull requests was not rechecked: no ownership statement changed.

## Build and gate

- `lake build TauCetiRoadmap.ECM.Suggested`: `Build completed successfully (8976 jobs).` No `sorry` warnings.
- Gate: `gate ECM: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck: `depcheck: 148 roadmaps, 999 edges, 0 problem(s)`. No UPWARD or CYCLE line. ECM is not in the merge order yet, which is not a defect at this stage.
