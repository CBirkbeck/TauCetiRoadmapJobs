# FIX-PKG-HyperbolicDynamicsAndThermodynamicFormalism~6

One review (REV-PKG-HyperbolicDynamicsAndThermodynamicFormalism~5) raised four findings. All are P3,
all are in proof routes, and all were verified and applied in
`packages/HyperbolicDynamicsAndThermodynamicFormalism/README.md`. No statement, Check or Lean
declaration changed. `Suggested.lean`, `metadata.toml`, `sources.toml` and `design/plan.json` are
unchanged.

## F01 (P3) — applied

§8.5 route. Old: "L ≥ 1 bound the Lipschitz constants of the maps g^s … (g is C¹ and M
compact)". New: take ρ₀, with Kr₀ + ρ₀ < 1, so that the (Kr₀ + ρ₀)-neighbourhood N of Λ has
compact closure. Let L₀ bound ‖Dg^s‖ there and put L = max(L₀, 1/ρ₀), proved for strong stable
plaques.

Verification. Line 624 says M is compact only where stated, and §8.5 does not state it.

- **Witness.** Take the flow θ' = 1, u' = u, v' = −v + u² on ℝ/ℤ × ℝ² (§8.3, fifth Check). Its
  derivative has the entry ∂v(s)/∂u = (2u/3)(e^(2s) − e^(−s)), which is 0.2110·u at s = 0.1. This
  is 21.1 at u = 100 and 211 at u = 1000, so no Lipschitz constant on M exists at small scales.
- **The repair on the witness.** On |u| ≤ 1 with |s| ≤ 0.1 the Frobenius bound gives L₀ ≤ 1.867.
  With ρ₀ = 1/2 this gives L = 2.
- **The two cases.** If ρ(a, b) < ρ₀ ≤ 1, then paths of length below ρ₀ stay within ρ₀ of a, so
  within Kr₀ + ρ₀ of Λ. The map g^s stretches them by at most L₀, so
  d(g^s a, g^s b) ≤ L₀ρ(a, b) = L₀d(a, b). Otherwise d(a, b) ≥ ρ₀, and
  d(g^s a, g^s b) ≤ 1 ≤ d(a, b)/ρ₀.

The review's text asked only for "a compact neighbourhood N containing the plaques". The path
argument needs the bound on a ρ₀-neighbourhood of the plaques, so N is taken with the radius
Kr₀ + ρ₀. The condition Kr₀ + ρ₀ < 1 makes d = ρ on the plaques.

Same pattern elsewhere, checked and left unchanged:
- §8.6(b) uses an L for the g^v with |v| ≤ r₀, but there M is compact (an Anosov flow), so the same
  argument applies with N = M.
- §8.7 takes "a common Lipschitz constant of f and f⁻¹ on a neighbourhood of Λ". That is a local
  constant, which exists on a compact neighbourhood by the same argument.
- No other "M compact" occurs in the README.

## F02 (P3) — applied

§10.1, sixth API item. Old: "y ∈ W^s_(g^v z)(ε) for r small by §8.3's contraction". New:
r ≤ ε/(KL). For t + v ≥ 0 the distance is ≤ Kr, since 𝒲^s_r(z) ⊆ W^s_(Kr)(z). At backward
times t + v ∈ [v, 0) it is ≤ LKr, with L from §8.5's proof. *Needs:* names that constant.

Verification. Take the flow θ' = 1, r' = −sin(2πr)/(2π) on the flat torus (§10.1, second Check),
with K = 1.

- **The old bound fails.** For y' = (θ, 0.05) and v = −0.1, integrating (RK4) gives
  r(−0.1) = 0.05516. This exceeds Kr = 0.05 at t = 0, a backward time for y'.
- **The new bound holds.** |∂(−sin 2πr/2π)/∂r| = |cos 2πr| ≤ 1, so L₀ = e^(r₀). The bound is
  LKr = 0.05·e^(0.1) = 0.05526 ≥ 0.05516.

This uses the bound Kr in place of the review's C'Kr. It is valid because the plaque inclusion holds
at every time t ≥ 0, and it gives the same choice r ≤ ε/(KL) as §8.5.

Same pattern elsewhere, checked and left unchanged:
- §6.5's third API item (round 4) and §8.5 (round 5) already treat the backward times.
- §6.7 uses the bracket's own W^s_δ(g^v x).
- §8.6(b) applies g^v to pairs at forward times t ≥ 0.
- §8.3 defines W^cs as a union of g^v W^s.

## F03 (P3) — applied

§7.6 route. After "with E^s and E^u declared orthogonal", the new text says: for a flow, ℝX(x) is
declared orthogonal to both and keeps its original norm |X(x)|, which is continuous on Λ because X
is. The form is then an inner product on T_xM = E^s_x ⊕ ℝX(x) ⊕ E^u_x, and the statement constrains
only E^s and E^u.

Verification on the witness, the constant-roof suspension of diag(2, 1/2) at the orbit of [0, 0]:

- **Metric.** It is ds² + 4^s du² + 4^(−s) dv², which is invariant under [s, w] = [s − 1, Aw]. Here
  X = ∂_s with |X| = 1, κ = log 2 and C = 1.
- **Rate.** With κ' = (log 2)/2 we get |a∂_v|'² = a²4^(−s)/(2(κ − κ')) = 1.4427a²4^(−s). Then
  |Dg^t a∂_v|'² = 4^(−t)|a∂_v|'² ≤ e^(−2κ't)|a∂_v|'².
- **Gram matrix.** At s = 0 in the basis (∂_s, ∂_u, ∂_v) it is diag(1, 1.4427, 1.4427), with
  determinant 2.081 > 0. Without the new clause the form has rank 2 on the 3-dimensional T_xM.
- **Consistency with §8.3.** §8.3's chart inner product gives X(x) length 1 and agrees with §7.6 on
  E^s and E^u, so it is consistent with this choice.
- **§7.6 Checks.** The Sasaki Check has |X| = 1, with X orthogonal to E^s and E^u, so it agrees with
  the recipe. The other two Checks are diffeomorphisms and are unaffected.

No other route builds an inner product for flows without the flow direction.

## F04 (P3) — applied

§8.6(a). Old: "whose diameters are at most 2C'λ'^(pk)r₀ → 0". New: "at most 2C'Kλ'^(pk)r₀ → 0 (each
plaque lies in W^s_(Kr₀)(y), §8.2, so it has diameter at most 2Kr₀ before the contraction acts)".

Verification. The witness is B = (1/2 1; 0 1/2) at 0 (§8.2, second Check), with the adapted inner
product ⟨Dv, Dw⟩, D = diag(1/8, 1) (§7.6, third Check).

- **Adapted operator norm.** It is 0.5664 ≤ λ' = 3/4.
- **Euclidean contraction constant.** C' = sup_n |B^n|(4/3)^n = 1.8827, attained at n = 2.
- **K is needed.** The adapted disc of radius r₀ contains ±8r₀e₁, so its Euclidean diameter is
  16r₀, while the old bound at k = 0 is 2C'r₀ = 3.77r₀. With K = 8 (since |v| ≤ 8|v|'), the bound
  is 2C'Kr₀ = 30.1r₀ ≥ 16r₀.
- **The conclusion still holds.** The bound still tends to 0, so the conclusion "at most m points"
  is unchanged. §8.6(b) already carries the K.

## Checks

- **Elaboration.** `lake env lean packages/HyperbolicDynamicsAndThermodynamicFormalism/Suggested.lean`
  was run from the content checkout and exited with code 0. There were no errors and 15 warnings,
  all `declaration uses sorry`, at lines 194, 211, 223, 286, 302, 406, 464, 475, 539, 557, 591, 601,
  617, 668 and 686. The file is unchanged this round.
- **Signatures.** A scratch copy with `#check @name` for all 50 declarations was elaborated once,
  with exit 0 and no errors. All 50 elaborated types are identical, modulo whitespace and namespace
  prefix, to those in the job's signature listing. Nothing changed.
  - The 9 dropped-binder leads are defs whose bodies do not use the instance: `[MeasurableSpace X]`
    on seven defs, and `[FiniteDimensional]` on `hadamardPerronGraph` and `flowUnstableSubspace`.
  - Every theorem keeps the binders the README states.
- **Dependency direction.** The output was `depcheck: 242 roadmaps, 2264 edges, 0 problem(s)`, with
  no UPWARD, CYCLE or `moved:` line.
- **Citations.** `roadmaps resolve` on the README reported no citation and no Lean name found
  nowhere.

## Adversarial pass (changed statements)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §8.5 route, L (old) | θ'=1, u'=u, v'=−v+u² on ℝ/ℤ×ℝ², s = 0.1 | ∂v(s)/∂u = 0.2110u: 21.1 at u = 100, 211 at u = 1000 | no global L on non-compact M | replaced |
| §8.5 route, L (new) | same flow, \|u\| ≤ 1, ρ₀ = 1/2; ρ(a,b) < ρ₀; ρ(a,b) ≥ ρ₀ | L₀ ≤ √(1 + 2·1.1052² + 0.2110²) = 1.867, L = 2; short case L₀ρ = L₀d; long case 1 ≤ d/ρ₀ (d = 0.6: 1 ≤ 1.2) | holds | new |
| §8.5 route, backward times (with new L) | v < 0, y ∈ 𝒲^s_r(x), Kr ≤ δ/L | t + v ≥ 0: ≤ δ/L; t + v ∈ [v, 0): ≤ L·δ/L = δ | holds | none |
| §10.1 route (old) | torus flow r' = −sin(2πr)/2π, r' = 0.05, v = −0.1, K = 1 | r(−0.1) = 0.05516 > Kr = 0.05 at t = 0 | gap | replaced |
| §10.1 route (new) | same; v ≥ 0 | L₀ = e^(r₀) since \|cos 2πr\| ≤ 1; LKr = 0.05526 ≥ 0.05516; v ≥ 0: only forward times, ≤ Kr | holds | new |
| §10.1 second Check (recomputed) | ε < 1/4 | W^s_(θ,0)(ε) = {\|r\| ≤ ε}: \|r(t)\| decreases for \|r\| < 1/2, consistent with K = 1 | correct | none |
| §7.6 route, flow (old) | suspension of diag(2, 1/2), metric ds² + 4^s du² + 4^(−s) dv² | form on E^s ⊕ E^u only: rank 2 on dim 3, det 0 | no inner product | clause added |
| §7.6 route, flow (new) | same, κ' = (log 2)/2 | \|v\|'² = 1.4427\|v\|² on the axes; Gram diag(1, 1.4427, 1.4427), det 2.081; rate 4^(−t) ≤ 2^(−t) | holds | new |
| §7.6 E^s integral (recomputed) | general t ≥ 0 | \|Dg^t v\|'² = e^(−2κ't)∫_t^∞ e^(2κ'u)\|Dg^u v\|² du ≤ e^(−2κ't)\|v\|'²; integrand ≤ C²e^(−2(κ−κ')s)\|v\|² | holds | none |
| §8.6(a) diameter (old) | B = (1/2 1; 0 1/2), adapted D = diag(1/8, 1), λ' = 3/4 | C' = 1.8827; plaque diameter 16r₀ > 2C'r₀ = 3.77r₀ at k = 0 | bound false | replaced |
| §8.6(a) diameter (new) | same; K = 8 | 2C'Kr₀ = 30.1r₀ ≥ 16r₀; adapted norm 0.5664 ≤ 3/4; bound → 0 | holds | new |
| §8.6(b) L (pattern) | compact M | path argument with N = M | holds | none |

## Ownership and overlaps

No new object or construction was introduced, so no ownership question arises. No sources were
added, and no text was missing (`needs-references.toml` was not written).

`scratch/overlaps.md` lists no open pull request that changes this roadmap and no dropped id. Its
lead "GeneralizedCohomology §G4.0b only in an open revision" is refuted again: G4.0b is defined on
main, in `TauCetiRoadmap/GeneralizedCohomology/README.md` at line 1082. The citation stays as it is.

## Maintainer notes

- No Lean name changed, and no id that other roadmaps cite changed.
- The review's note to the human reviewers is unchanged. `design/plan.json` still lists the unused
  gap `sphere-bundle-embedding`, and nothing was changed because of that note.
