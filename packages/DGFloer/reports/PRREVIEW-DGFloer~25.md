# Review of DGFloer (pull request #1798 at 1004825)

**Verdict:** needs changes

This is an incremental re-review of the 11 lines of `TauCetiRoadmap/DGFloer/README.md` that changed since 8019db8, all in the third Check of 9.3. `Suggested.lean` is unchanged, nothing outside the folder changed, and the gate passes.

The changed passage is correct and repairs the previous R03. Two findings remain, both carried from the previous report and both repaired in the pull-request description alone; the roadmap folder needs no further edit.

- **R01 (P2).** The previous R01, not repaired: Layer 1 items 2–4 are handed to AlgebraicTopology stages that only open revisions define, with no stated order.
- **R02 (P3).** The previous R02, not repaired: the order with the conflicting open revision #963 is unstated.

## R01 (P2) — Layer 1 items 2–4 are handed to AlgebraicTopology stages that only open revisions define, with no stated order (previous R01, not repaired)

**Location.**
- `TauCetiRoadmap/DGFloer/README.md:159–175`: "targets of Layer 1 items 2–4 are AlgebraicTopology's, and a citation of one of them resolves there", mapped to Stages 4.8, 5.0, 5.5, 8.8c and 8.8d; 9.3's *Needs:* line (`:3788`) cites "AlgebraicTopology Stage 4.8".
- The pull-request description: its merge-order paragraph still ends "#987 (AnalyticStableMaps) → **this pull request**", and its body still says "Layer 1 items 1–6 are unchanged".

**Claim.** The README consumes, and no longer owns, CW approximation (Stage 4.8), the filtered-complex convergence theorems (5.0), the fibration exact sequence and Serre spectral sequences (5.5), `K(A, n)` (8.8c) and Hurewicz modulo a Serre class (8.8d).

**Witness.**
- **Main, AlgebraicTopology README (3090489).** `:915` reads "Consume DGFloer Layer 1 item 2's homotopy LES and …"; `:102` reads "DGFloer Layer 1 item 4 owns the single functorial …".
- **The open #1652 (now at db70d31).** `:2005` reads "Consume DGFloer Layer 1 item 2's homotopy LES and its Serre spectral …"; `:2014` cites "DGFloer Layer 1 item 3's filtered-complex API".
- **The stages exist only in open revisions** (#1797, #1807, #1808, #1854): for example #1807 and #1808 name "Stage 8.8c" and "Stage 8.8d" at `:125–129`. The description names #1807 only for Stage 8.3, and its merge-order paragraph names none of the four.

**Repair** (description only).
1. In the merge-order paragraph, place the AlgebraicTopology revision that carries Stages 4.8, 5.0, 5.5, 8.8c and 8.8d before this pull request: #1807, which the description already names, or whichever of the four is to merge first.
2. Replace "Layer 1 items 1–6 are unchanged" with "Layer 1 items 2–4 consume AlgebraicTopology Stages 4.8, 5.0, 5.5, 8.8c and 8.8d as <that revision> defines them".
3. Add: "#1652 (AlgebraicTopology) consumes DGFloer Layer 1 items 2–4 and is rebased on <that revision> before it merges."

**Test.** At each point of the stated order, the homological Serre spectral sequence has exactly one owner, and no README on main cites it back to the other.

## R02 (P3) — The order with the conflicting open revision #963 is not stated (previous R02, not repaired)

**Location.** The pull-request description: neither its body nor its merge-order paragraph mentions #963.

**Witness.**
- The overlap check reports that #963 and #1798 conflict in `TauCetiRoadmap/DGFloer/README.md` and `TauCetiRoadmap/DGFloer/Suggested.lean`.
- At #963's head (62109eb, unchanged), `README.md:556` reads "Own `arbitraryCWSerreSpectralSequence` for every path-connected CW base", and `:223` reads "AlgebraicTopology Stage 5.5 and GeneralizedCohomology consume these targets".
- This head (`:166–169`) hands the same targets to AlgebraicTopology Stage 5.5.

**Repair** (description only). Add: "#963 (DGFloer) changes the same Layer 1 targets in the opposite direction and is rebased on this pull request, dropping its Layer 1 item 2 ownership, before it merges." If the intended order is the reverse, state that instead.

## Previous findings

- R01 — not repaired: the merge-order paragraph still ends "#987 (AnalyticStableMaps) → **this pull request**"; the body still says "Layer 1 items 1–6 are unchanged". Written again as R01.
- R02 — not repaired: the description still does not mention #963, whose head 62109eb still owns `arbitraryCWSerreSpectralSequence`. Written again as R02.
- R03 — repaired: `:3815` "The good truncation `τ_{≥m}𝓕 = ⊕_{k ≤ −m} ℤ[k]` is `ℤ` in each degree `≥ m`"; `:3809–3810` pins `ℤ[k]` to degree `−k`. The repair introduced no new problem.

## Verified sound

### Gate, dependency check and elaboration (this head)

```text
gate DGFloer: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
depcheck: 235 roadmaps, 2262 edges, 0 problem(s)
```

- The worker's gate on this head also passed the targeted build (`build=0`). The dependency check shows no UPWARD, CYCLE or `moved:` line.
- `lake env lean TauCetiRoadmap/DGFloer/Suggested.lean` gives 7 `sorry` warnings (lines 83, 109, 142, 165, 195, 218, 244) and nothing else.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/DGFloer'` is empty.
- `Suggested.lean` is byte-identical to the head the previous review read, so its signature check (`#check @name` on all 7 declarations), headline list (5.4, 8.6, 9.3, 10.1–10.2, 10.5, 11.3), padding probe (none closes in one tactic) and library-name resolution carry over.

### The changed passage (9.3, third Check, `:3806–3820`)

Recomputed in full against 9.1's convention `C[n]_j = C_{j+n}` (`:3707`), which the Check now quotes ("item 1" is 9.1, the first item of the same layer):

- `ℤ[k]_j = ℤ_{j+k}` is nonzero only for `j = −k`, so `ℤ[k]` is `ℤ` in degree `−k`, as stated. This agrees with `:3706`, where `η₀[n]` is supported in degree `−n`.
- Degrees `≥ m` of `𝓕 = ⊕_k ℤ[k]` are the summands with `−k ≥ m`, that is `k ≤ −m`. The differential of `𝓕` is zero, so `Z_m = 𝓕_m` and the good truncation of `:3773–3775` is exactly `⊕_{k ≤ −m} ℤ[k]`.
- With the action through the augmentation, both sides in degree `n` are `⊕_{q ≥ m} H_{n−q}(𝓛S³; ℤ)`; putting `p = n − q` gives `0 ≤ p ≤ n − m`, empty for `n < m`. As `m → −∞` these increase to `⊕_{p ≥ 0} H_p(𝓛S³; ℤ)`, the value stated four lines earlier for `𝓕` itself.
- `⊕_{k ≥ m} ℤ[k]` occupies degrees `−k ≤ −m`: bounded above, unbounded below, so the bounded-below theorem does not cover it. This agrees with the next Check ("The truncation has to be from below").
- The other use of `⊕_{k ∈ ℤ} ℤ[k]` in the README, the 8.7 Check at `:3676`, uses only that the homology is unbounded in both directions and is unaffected by the direction of the shift.

No Lean statement, section number, supplier or locator is touched by the diff. Of the seeded sample, only 9.3 falls in the changed text; the other sampled targets are untouched and were passed by earlier reviews.

### Adversarial table

New rows were computed this round; rows marked (r24) are carried from the previous report with its values.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 9.3 Check: degree of `ℤ[k]` | `k = 1`, `k = −2` | `ℤ[1]_j = ℤ_{j+1}`: degree `−1`; `ℤ[−2]`: degree `2` | holds |
| 9.3 Check: `τ_{≥m}𝓕 = ⊕_{k ≤ −m} ℤ[k]` | `m = 0`; `m = −1` | degrees `0, 1, 2, …`; degrees `−1, 0, 1, …`; union over `m → −∞` is `𝓕` | holds |
| 9.3 Check: both sides for `τ_{≥m}𝓕` | `m = 0`: `n = −1, 0, 1, 2, 3` | `0`; `H₀ = ℤ`; `H₀ ⊕ H₁ = ℤ`; `ℤ²`; `ℤ³` (using `H_p(𝓛S³) = ℤ` for `p = 0, p ≥ 2`, `H₁ = 0`) | holds |
| 9.3 Check: `⊕_{k ≥ m} ℤ[k]` | `m = 0` | degrees `0, −1, −2, …`; homology bounded above, not below | holds |
| 9.3 `τ_{≥k}𝓕` is a sub-DG module (r24) | `C_*(ΩS³)`, `k = 0` | `d(z·c) = 0` for `c` of degree 0; a degree-2 `c` sends `Z_0` to degree 2 | holds |
| 9.3 Theorem K for every `𝓕` (r24) | `Q = pt` | both sides are `H_*(𝓕)` | holds |
| 9.3 truncation from above (r24) | `C_*(ΩS³)`, `k ∈ {0, 1}` | `1·c = c` of degree `2 > k` | holds |
| 9.4 transfer for every `𝓕` (r24) | `G = Π^*(𝓕 ⊗ η₀)` | `η₀^{⊗2}` and `i_Q^*η₀ ⊗ |Q|` trivial | holds |
| 9.4 Checks (r24) | `ℝP²` | `SH^{=0}_2 = H₂(ℝP²; o) = ℤ` against `H₂(ℝP²; ℤ) = 0` | holds |
| 10.2 Proposition 6.7 route (r24) | `T^r` | `i_{Q*}α = 0 ⇒ i_{(D*Q)*}π_!α = 0` by injectivity of `Ψ̃`; `Ω²T^r ≃ *` | holds |
| 10.3 for every `𝓕` (r24) | `S³` | `ker i_{Q*} ⊇ H₁(Ω²S³) = ℤ` for `𝓕 = C_*(Ω𝓛₀S³)` | holds |
| 10.4 (r24) | `S²`; `S³`, `d = 2`; `ℤ/4` | `π₀Ω²S² = ℤ`; `ℤ` not `2^m`-torsion; `ℤ/4` is `2²`-torsion | holds |
| 10.1 Theorem L (r24) | `D²ⁿ` | `i_{W*}[W,∂W] = 0`, `j_{U!}[W,∂W] ≠ 0` | holds |
| Mod-2 vanishing, 1.4 (Lean) (r24) | `M(ℤ/3,2)`; `K(ℚ,2)`; `S³` | `2·2 ≡ 1 mod 3`; `ℚ` uniquely 2-divisible; `H₃(S³; 𝔽₂) ≠ 0` | holds |
| 1.3 regrading (r24) | homological, cohomological | `(p−r, q+r−1) ↦ (a+r+1, b−r)` | holds |
| 1.4 Serre-class Checks (r24) | `ℤ/4`; `ℤ ⊂ ℚ` | extension of `ℤ/2` by `ℤ/2`; `ℚ ⊗ ℤ/2 = 0`, `ℤ ⊗ ℤ/2 = ℤ/2` | hold |
| 5.5 (r24) | Hopf; `ℝP²` | `i_![S³] = [S¹]`; `H₂(ℝP²; ℤ) = 0` | holds |
| 7.5 (r24) | `H = a|z|²` | orbits at `a ∈ πℤ` | holds |
| 8.7 (r24) | `⊕_k ℤ[k]` | (A) and (B) fail; Künneth gives `0` | holds |
| 5.10 (Lean) (r24) | `π₃ = ℤ/3`, `d = ±2`; `T³` | `a^{(−2)^m} ≠ 1 ⇔ a^{2^m} ≠ 1`; all disjuncts false on `T³` | holds |
| A (Lean) (r24) | `S²`, `d = ±1, 3`; `T² ⊔ T²` | `π₂ = ℤ` not torsion; excluded by `ConnectedSpace` | holds |
| 5.15 / C (Lean) (r24) | `ℝP²`; `π₂ = ℤ/3` | doubling on `ℤ` not onto; 5.15 accepts `ℤ/3`, C does not | holds |
| Torus criterion (Lean) (r24) | `T^r`; `SO(3)`; `r = 0` | `π₃(SO(3)) = ℤ`; trivial group | holds |
| 11.1 / 11.2 (r24) | `U(n)`; `𝔰𝔲(2)`; `SU(3)` | `B(iI, iI) = 0`; `−2`; `−3` | hold |

The remaining rows of the previous report (1.1, 1.2, 2.3, 5.2, 5.6, 6.2, 6.4/6.5, 7.1, 8.2) concern untouched statements and stand as recorded there.

### Cross-roadmap citations resolved this round

- Main, AlgebraicTopology (3090489): `:102`, `:915` (R01).
- #1652 AlgebraicTopology (db70d31, moved since the previous review): `:1851`, `:2005`, `:2014` still cite DGFloer Layer 1 items 2–3 (R01).
- #1807 and #1808 AlgebraicTopology: Stages 8.8c and 8.8d at `:109–129` (R01).
- #963 DGFloer (62109eb): `:223`, `:556` (R02).
- Overlap facts: no id this README cites is dropped by an open pull request, none is defined only by an open revision beyond R01's stages, and this pull request drops no id other roadmaps cite.

## Not verifiable

- Nothing in the changed passage: it cites no source.
- For untouched text the previous reports' list stands: Serre 1951 and 1953 and Weibel 5.5.1/5.5.10 (no legal copy in the cache); Hofer–Zehnder, Struwe, Palais, Bröcker–tom Dieck, Massey and Whitehead (uncertified); the 6.0 and 7.C references (not in the manifest).

## Source issues

- none
