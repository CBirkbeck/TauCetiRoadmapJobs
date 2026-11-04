# GATE-GeometricQuantization~1: answers to human review

Points numbered in order of appearance: H01–H03 from the review of 2026-10-19 (Q5 global bridge, CI import, page references), H04 from the review of 2026-10-20 (Poisson versus Lie subalgebra). The second review's confirmation that H01 is closed is a status remark about H01, not a separate point.

## H01 (roed-math) — applied

The global bridge is in the README as separate targets: §6.6 (README lines 1315–1451) constructs the complexified torus action and its lift, the moment-dependent semistable set `Mss_ξ` with its analytic complement, the identification `Mss_ξ = T_C·Z_ξ` at regular levels, the quotient as the full-isotropy reduced orbifold, and the local descent `H⁰(Mss_ξ,E)^T ≃ H⁰_orb(R_ξ,L_(n,λ,ξ))` (Sjamaar, Prop. 2.2, Thm 2.8, Prop. 2.11). §6.7 (lines 1453–1541) proves the shifted Kostant bound `‖s(x)‖ ≤ sup_(z∈Z_ξ)‖s(z)‖` via the negative-gradient flow of `‖μ−ξ‖²`, applies ComplexKahlerGeometry K3's locally bounded extension, and constructs `H⁰(M,L^n)_λ ≃ H⁰(M,E)^T ≃ H⁰(Mss_ξ,E)^T ≃ H⁰_orb(R_ξ,L_(n,λ,ξ))` (Sjamaar, Thm 2.15), with the empty-level case handled by a maximum argument instead of extension. The ℂP¹ Check in §6.7 recomputed: at r=1/4 the invariant section `xy` has norm² `r/(1+r)² = 4/25`, `η = 1/2 − r/(1+r) = 3/10`, derivative `4·2·(3/10)²·(4/25) = 72/625`; the maximum on the level r=1 is `1/4 ≥ 4/25`, so the bound runs in the stated direction.

## H02 (roed-math) — applied

`TauCetiRoadmap/GeometricQuantization/Suggested.lean` imports only `import Mathlib`. The import of `TauCetiRoadmap.SymplecticGeometry.Suggested` was removed, and the second review records a green CI run at the later head. SymplecticGeometry stays a written supplier in the README contracts (`### From TauCetiRoadmap.SymplecticGeometry`); it is not a Lean import.

## H03 (roed-math) — applied differently

§6.11 cited "Knutson, *Lie Groups notes, Semester 2*, physical pp. 106 and 119 of 131". No legal copy of that text could be found (the sources service reports no legal source), so its page numbers cannot be checked. The examples do not depend on it, because every count in §6.11 is computed directly. The citation and its References entry are removed. §6.11 (line 1739) now derives the counts from the degree-n monomial basis of `H⁰(CP²,O(n))` (ComplexKahlerGeometry K7.2), and "source exponent-count density/weights" is now "exponent-count density/weights". The earlier transcription-discrepancy text was already gone. Recomputed: both closed-form `C_n(j)` formulas agree with direct monomial enumeration for every n=0..40 and every j in `[−3n−3, 3n+3]`. For `a=(0,1,−2)`, degree 2 gives `{−4,−2,−1,0,1,2}` once each, and degree 3 gives 0 twice and `−6,−4,−3,−2,−1,1,2,3` once. At n=400, `C_n(n)/n = 0.5025` (density `min(1,1)/2 = 0.5`) for the first action and `C_n(0)/n = 0.335` (density `2/6`) for the second.

## H04 (roed-math) — applied

§4.2 (README lines 804–848) is no longer "form a Poisson subalgebra". It now constructs the native `LieSubalgebra ℝ` of the HamiltonianSystems function Lie algebra, closed under addition, real scalars and Poisson brackets and containing the constants. It says explicitly that these Hamiltonians need not be closed under pointwise multiplication and that the operators need not be closed under composition, and it keeps the `p` versus `p²` regression as Checks. Recomputed with `ι_(X_f)ω = df`, `ω = dq∧dp`: `X_f = f_p ∂q − f_q ∂p`, so `X_p = ∂q` and `[∂q,∂p] = 0`, while `X_(p²) = 2p∂q` and `[2p∂q,∂p] = −2∂q ∉ span{∂p}`. The A_P-module claim also holds: for `a ∈ A_P`, `[aX_f + fX_a, Y] = a[X_f,Y] + f[X_a,Y] − (Yf)X_a ∈ P` because `Ya = 0`, `X_a ∈ P` and P is involutive. Example: `a=q`, `f=p` gives `qp`, which is affine in p.

## Adversarial pass (statements changed or re-verified this round)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §6.11 `C_n(j)` for `a=(0,1,2)`: count of c with `max(0,j−n)≤c≤floor(j/2)` | n=0..40, all j in `[−3n−3,3n+3]`; n=0 | matches enumeration everywhere; n=0: one monomial, weight 0 | holds | citation removed only |
| §6.11 `C_n(j)` for `a=(0,1,−2)`: `max(0,ceil(−j/2))≤c≤floor((n−j)/3)` | same range; negative-length interval | matches; a negative interval gives 0, not a negative count | holds | none |
| §6.11 degree-2/3 weight lists | n=2, n=3 | `{−4,−2,−1,0,1,2}`; 0×2 plus 8 singletons, total 10 = C(5,2) | holds | none |
| §6.11 densities, mass 1/2 | n=400 at x=1 (first), x=0 (second) | 0.5025 vs 0.5; 0.335 vs 0.3333; areas 1/4+1/4, 1/3+1/6 | holds | none |
| §4.2 Lie-subalgebra and product failure | f=p, f=p², rank-zero point | `[X_p,∂p]=0`; `[X_(p²),∂p]=−2∂q`; on a point A_P=ℝ | holds | none (already applied) |
| §4.2 A_P-module | a=q, f=p | `X_(qp) = q∂q − p∂p`; bracket with ∂p is `∂p ∈ P` | holds | none |
| §6.7 shifted Kostant bound | ℂP¹, n=2, λ=−1, r=1/4 and r=1 | 72/625 derivative; 4/25 ≤ 1/4 | holds | none (already applied) |

Lean scratch `#check` comparison: not applicable. `Suggested.lean` declares no named declaration (empty namespace; the headlines are listed as not statable), and this round left it unchanged.

Ownership: this round added no construction. The only new citation is ComplexKahlerGeometry K7.2, checked on main: its §7.2 identifies `H⁰(O(k))` with homogeneous polynomials and proves dimension `binomial(n+k,n)`.

Out of scope, noted: the folder also contains `HomogeneousCharacterTargets.lean`, which imports `Mathlib.*` submodules. This job may not edit that file, and the gate reports `stray-files=0` and `mathlib-subimports=0`.

## Build and gate

- `lake build TauCetiRoadmap.GeometricQuantization.Suggested`: `Build completed successfully (8976 jobs).`
- Gate (after commit `b7f61a54`): `gate GeometricQuantization: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=1 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 FAIL`. The only failure is `depcheck: NOT IN ORDER: GeometricQuantization (insert it after its last supplier)`.
- Depcheck output:

```text
NOT IN ORDER: GeometricQuantization (insert it after its last supplier)
depcheck: 204 roadmaps, 1544 edges, 1 problem(s)
```

There is no UPWARD or CYCLE line. "Not in order" is the design-stage placement, which the brief does not count as a defect.
