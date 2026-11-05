# GATE-QuantumFoundations~1: answers to human review

One comment (bjbraams, 2026-11-05T16:18:38Z), three points. Head before repairs `944ed3c`; repairs in commit `e33847c` (not pushed).

## H01 (bjbraams) — applied

The two roadmaps planned the same theorem, so the duplicate here is deleted and this roadmap consumes SpecialFunctionsParabolicCylinder instead. `Suggested.lean` no longer declares `regularizedHGFun_kummer_equation`; its docstring (lines 27–30) records Kummer's equation for `ℳ` as owned by SpecialFunctionsParabolicCylinder Milestone 1.3. In `TauCetiRoadmap/QuantumFoundations/README.md`, §9.4 (line 993) changes from "Prove `regularizedHGFun_kummer_equation` …" to "Kummer's equation … is SpecialFunctionsParabolicCylinder Milestone 1.3 (DLMF 13.2.1)". The deferral is recorded in Scope (lines 18 and 26), in the supplier table (line 71), in the §9.4 *Needs:* line (999) and in the Layer 9 Dependencies (1094).

Why this direction and not the reverse: Milestone 1 of SpecialFunctionsParabolicCylinder is the general theory of the regularized Kummer function (derivative, equation, transformation, parameter analyticity, polynomial cases), and it does not depend on this roadmap. This roadmap sits late in the supply chain (after VonNeumannAlgebras, NoncompactQuantumSymmetry and the operator-theory roadmaps). If the special-function roadmap consumed it instead, it would sit after all of those.

## H02 (bjbraams) — applied

§9.4 now gets the unregularized terminating identity from SpecialFunctionsParabolicCylinder Milestone 1.6, the regularized sum `ℳ(−n,b,z) = Σ_(k≤n)(−n)_kz^k/(k!Γ(b+k))`, which holds for every `b`: multiply by `Γ(b)` and use `Γ(b+k) = (b)_kΓ(b)` for `b ∉ {0,−1,…}` (README line 993). What stays here is only what differs: the `Γ(b)` normalization, the exact degree `n` with leading coefficient `(−1)^n/(b)_n`, and the Laguerre comparison. Checks at README lines 1006–1007 compute `n = 1` at `b = 2` and `b = 0`, and `n = 2` at `α = 0`.

Rechecking the Laguerre comparison turned up a missing hypothesis, now added (line 993). `L_n^(α)(x) = ((α+1)_n/n!)M(−n,α+1,x)` needs `α+1` outside the nonpositive integers. LaguerreJacobi A1–A2 defines `L_n^(α)` for every α, with `L_1^(α) = α+1−X`, while `M(−1,0,·) = Γ(0)ℳ = 0`. So at `α = −1` the left side is `−x` and the right side is `0`; at `α = −2` they are `−1−x` and `0`.

## H03 (bjbraams) — answered

The pending Tau Ceti pin update does not affect this roadmap. It cites only Mathlib's `Complex.regularizedHGFun`, `regularizedHGFunCoeff`, `regularizedHGFunCoeff_eq_zero_right` and `radius_regularizedHGFunSeries_eq_top` (`Mathlib/Analysis/SpecialFunctions/RegularizedHypergeometric.lean`, lines 67, 81, 172, 229 at the pin). The pinned Tau Ceti has no `TauCeti/Analysis/SpecialFunctions/RegularizedHypergeometric.lean` and no `regularizedHGFun` anywhere, and nothing here uses `Complex.hasSum_regularizedHGFun`. The new citation of SpecialFunctionsParabolicCylinder Milestones 1.3 and 1.6 is by roadmap and milestone, so it needs no Tau Ceti declaration and no import.

## Build

`lake build TauCetiRoadmap.QuantumFoundations.Suggested`: `Build completed successfully (8954 jobs)`. There are 6 `declaration uses sorry` warnings (lines 55, 64, 76, 88, 109, 126), one for each remaining theorem, and no errors.

Elaborated signatures: one scratch file with `#check @` for all nine remaining declarations, plus `Complex.regularizedHGFunCoeff_eq_zero_right`, `Complex.radius_regularizedHGFunSeries_eq_top`, `Complex.Gamma_neg_nat_eq_zero` and `Complex.regularizedHGFunCoeff`, elaborated once. All nine types are unchanged from `signatures.md` and agree with the README. No section binder was dropped. The only change to the file is the deletion of `regularizedHGFun_kummer_equation`, which is no longer named anywhere in the README.

## Gate

At `e33847c`:

`gate QuantumFoundations: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=1 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 FAIL`

`depcheck: NOT IN ORDER: QuantumFoundations (insert it after its last supplier)`

The only failing check is `NOT IN ORDER`. It was there before this change too: the roadmap is at the design stage, so this is not a defect.

Dependency check (`--movable`) on the edited README:

```
NOT IN ORDER: QuantumFoundations (insert it after its last supplier)
depcheck: 223 roadmaps, 2099 edges, 1 problem(s)
```

There is no UPWARD and no CYCLE line. The edge count is the same as before the edit, because the tool has no node for SpecialFunctionsParabolicCylinder: it is an open pull request adding a new folder, by another author, and not yet in the merge order. I checked the direction by hand. That roadmap's README never cites QuantumFoundations or RelativisticQuantumFieldTheory; its *Needs:* lines name only its own milestones, Mathlib, Tau Ceti, ZerosOfLFunctions §1.3 and ContourIntegration. So the new edge creates no cycle, and the intake should place this roadmap after it.

## Ownership and citations

- **Kummer's equation and the regularized polynomial cases.** Searched by object (`regularizedHGFun`, confluent hypergeometric, `₁F₁`, Tricomi, DLMF 13.x) over main and the 440 open heads with `roadmaps grep`. The only owner of either object is SpecialFunctionsParabolicCylinder Milestones 1.3 and 1.6 (read with `roadmaps show`: README lines 340–360, `Suggested.lean` lines 53–57). That file's fully qualified name lives in `TauCetiRoadmap.SpecialFunctionsParabolicCylinder`; no declaration of this roadmap's `Suggested.lean` now shares a name with it.
- **Related object, no change made.** AutomorphicSpectralTheory §§0.26–0.28 (open, earlier in the merge order) builds Whittaker's `M` and `W` for real `y > 0` from Euler integrals, with their ODE and asymptotics. Its `W` is a rescaling of Tricomi's `U` on the positive axis. This roadmap's `U` is the complex-argument function on the logarithmic cover, entire in `a,b`, which §9.5 needs at complex arguments (`−2iρ`, `2βr` with complex `β`). That is a different object, not a duplicate statement, so no change was made. I'm recording it because a common special-functions owner for both would be cleaner.
- **Citation leads from `citations.md`.** All four resolve. `M4.SpatialLocalization` and `M5.AffineG5` are NoncompactQuantumSymmetry target labels at its open head (README lines 2348 and 5889). `V2.BorelCalculus` and `V2.NonmodularProjectionLattice` are VonNeumannAlgebras target labels on main (README lines 35 and 871). After the edit, `roadmaps resolve` on the README reports no unresolved cross-roadmap citations and no unresolved Lean names.
- **Library facts relied on, checked at the pins.** `regularizedHGFunCoeff_add_one` carries the hypothesis `∀ k ∈ b, k ≠ −n` (line 92), so it does not give the cleared recurrence when `b + k = 0`. The README no longer calls it "the" recurrence: §9.4 now derives the coefficient recurrence of holomorphic solutions from the ODE itself. The vanishing of `ℳ(a,−N,·)`'s first `N+1` coefficients is Mathlib's `regularizedHGFunCoeff_eq_zero_right a {−N} k (N−k)`, now cited in the supplier contract (line 41) and in §9.4.
- **Sources.** No new source. DLMF 13.2.4 is at `DLMF_13.2` line 250. The polynomial case after 13.2.5 is at `DLMF_13.2` line 315, and 13.2.5 itself at line 286. 13.6.19 is at `DLMF_13.6` line 813. `sources.toml` is unchanged.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §9.4 recurrence for holomorphic solutions `(k+1)(b+k)c_(k+1) = (a+k)c_k` | general power series | `zf″ = Σ(k+1)kc_(k+1)z^k`, `bf′ = Σb(k+1)c_(k+1)z^k`, `−zf′ − af = −Σ(k+a)c_kz^k`; coefficient of `z^k` is `(k+1)(k+b)c_(k+1) − (k+a)c_k` | holds for every `k`, with no hypothesis on `b` | stated in place of the claim about `regularizedHGFunCoeff_add_one` |
| Singular-parameter data, `b = −N` | `N = 1`, `a = 1` | `c₀ = 1/Γ(−1) = 0`, `c₁ = 1/Γ(0) = 0`, `c₂ = 1/Γ(1) = 1`, `c₃ = 1`, `c₄ = 1/2`, so `ℳ(1,−1,z) = z²e^z`; `z(2+4z+z²) + (−1−z)(2z+z²) − z² = 0` | consistent with the existing Check | "c₀ = 0" sharpened to `c₀ = ⋯ = c_N = 0` |
| Same, the descent | `a ∉ {0,…,−N}` | `k = N`: `(a+N)c_N = 0`; `k = j < N`: `(j+1)(j−N)c_(j+1) = (a+j)c_j` with `c_(j+1) = 0`, so `c_j = 0`; at `k = 0`: `−Nc₁ = ac₀` | `c₀ = ⋯ = c_N = 0`, and `c_(N+1)` is free since `(N+1)(b+N) = 0` | wording |
| `regularizedHGFunCoeff_eq_zero_right` for `b = {−N}`, `k ≤ N` | `n = k`, `m = N−k` | `−k − (N−k) = −N ∈ {−N}` | applies (elaborated type `autoParam (−↑n − ↑m ∈ b) → regularizedHGFunCoeff a b n = 0`) | cited |
| Terminating identity, unregularized | `n = 1`, `b = 2` | `ℳ(−1,2,z) = 1/Γ(2) − z/Γ(3) = 1 − z/2`; `M = Γ(2)ℳ = 1 − z/2`; sum `1 + (−1)_1z/((2)_1·1!) = 1 − z/2` | holds | Check added (line 1006) |
| Same, at `b = 0` | `n = 1` | `ℳ(−1,0,z) = 1/Γ(0) − z/Γ(1) = −z`; Kummer: `z·0 + (0−z)(−1) − (−1)(−z) = 0`; `M(−1,0,·) = Γ(0)ℳ = 0`; unregularized sum divides by `(0)_1 = 0` | the hypothesis `b ∉ {0,−1,…}` is needed for the unregularized form, not for the regularized one | negative control in the same Check |
| Exact degree and leading coefficient | `n = 2`, `b = 1` | `M(−2,1,z) = 1 − 2z + z²/2`; leading `(−2)_2/((1)_2·2!) = 2/4 = 1/2 = (−1)²/(1)_2` | holds | Check (line 1007) |
| Laguerre comparison | `n = 1`, general α | `(α+1)(1 − x/(α+1)) = α+1−x = L_1^(α)(x)` | holds for `α+1 ∉ {0,−1,…}` | hypothesis added |
| Same | `α = −1`, `n = 1` | left `L_1^(−1) = −x`; right `(0)_1·M(−1,0,x) = 0` | **false without the hypothesis** | hypothesis plus negative-control Check |
| Same | `α = −2`, `n = 1` | left `−1−x`; right `(−1)·Γ(−1)ℳ = 0` | false without the hypothesis | same Check |
| Same | `α = −2`, `n = 2` | left `L_2^(−2) = x²/2` (coefficients `(−1)_2/2 = 0`, `−(0)_1 = 0`, `1/2`); right `(−1)_2/2·0 = 0` | false without the hypothesis | covered by the hypothesis |
| Same, `n = 2`, `α = 0` | — | `((1)_2/2!)M(−2,1,z) = 1 − 2z + z²/2 = L_2^(0)(z)` | holds | Check |
| `a = b` Check | `a = b ∉ {0,−1,…}`; `a = b = 0`; `a = b = −n` | `M(a,a,z) = Σ(a)_kz^k/((a)_kk!) = e^z`; `M(0,0,·) = Γ(0)·ℳ = 0 ≠ e^z`; `ℳ(−n,−n,z) = 0` since `(−n)_k = 0` for `k > n` and `1/Γ(k−n) = 0` for `k ≤ n` | the existing Check was false at `a = b ∈ {0,−1,…}` | hypothesis added, negative case recorded (line 1004) |
| `M = Γ(b)ℳ` satisfies Kummer's equation | `b = −1`, `a = 1` | `M ≡ 0`, which satisfies it trivially; `b = 2`, `a = −1`: `M = 1 − z/2`, `z·0 + (2−z)(−1/2) + (1 − z/2) = 0` | holds | none (scaling of SpecialFunctionsParabolicCylinder 1.3) |
| Supplier row, SpecialFunctionsParabolicCylinder 1.3/1.6 | its README lines 340–360, `Suggested.lean` lines 53–57 | statement `z * deriv (deriv ℳ) z + (b − z) * deriv ℳ z − a * ℳ z = 0` for all `a b z`; 1.6 for every `b`, nonpositive integers included | matches the row (line 71) | row added |
| `Suggested.lean` after the deletion | `#check @` of all nine declarations | types identical to `signatures.md` | no dropped binder | — |

## Suspicious text

None. The comment contains no instruction directed at the worker.
