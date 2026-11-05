# FIX-RT-AnalyticToricGeometryPartII~1

This round answers two red-team reviews of head 7e4f54f. Pass a (codex) accepted the package and raised no finding, so there is nothing of it to settle. Its "Source issues" concern FS94 and SCH12, which the package does not copy. Pass b (claude) raised five findings, F01–F05. All five are settled below; every one was verified against the cited texts at the stated heads and pins before any edit.

## F01 (P2) — applied

Old gap:toric-field-fibres asked ShimuraCompactifications for normal geometrically integral fibres, distinct ray divisors **and** regular-fan smoothness. New gap (README and `design/plan.json` gaps[0], same words): for every field k and **nonempty** finite fan, normality, geometric integrality, and prime ray divisors with distinct generic points. Smoothness is now derived from C0.10 plus Mathlib.

Verification. At ShimuraCompactifications head 63e3f03, C0.10 (`regularCoordinateIso`) gives R[P_σ]≅R[x₁,…,x_r,y^(±1)] for every ring R. C0.9 and C0.16 give the open chart cover. At the Mathlib pin, `AlgebraicGeometry.Smooth` (`Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean` line 59) is a `HasRingHomProperty`, so it is local on the source. In `Mathlib/RingTheory/Smooth/Basic.lean`, `Algebra.instFormallySmoothMvPolynomial` (line 111), `Algebra.Smooth.of_isLocalization_Away` (line 558) and `Algebra.Smooth.comp` (line 567) make the polynomial–Laurent chart smooth. So the smoothness clause was not a gap. C0 states nothing about normality, geometric integrality or ray divisors (grep of C0.1–C0.21 at 63e3f03), so those stay in the gap.

Edits:
- The C0 contract paragraph gains the C0.10 sentence and the smoothness conclusion.
- "From Mathlib" names the five smoothness declarations.
- The §4.1 *Needs* line now cites C0.10 with `AlgebraicGeometry.Smooth` for smoothness and C0.17 for properness, in place of the gap.
- Layer 4 Dependencies add C0.10.

Where this differs from the suggested text:
- "Nonempty" is added. The empty fan gives the empty scheme, which is not integral, so the suggested "every finite rational fan" is false there.
- "Compatibly with field extension" replaces "coefficient change". The gap now concerns only field fibres.
- The "closures … are codimension-one points" wording is corrected to "prime divisors with pairwise distinct codimension-one generic points".

Pattern repair. Every consumer of the changed gap was rechecked:
- §0.1 keeps the gap; it uses normality and the ray divisors.
- §4.1 used the gap only for smoothness; it now cites C0.10.
- §1.2 cited the gap but uses only properness (C0.17) and the good-reduction locus. Its *Needs* line now cites C0.17 instead.
- §6.3 and §6.4 take smoothness as a hypothesis, so they are unchanged.

## F02 (P3) — applied

Old: "C0.6–C0.7 supply face projections and off-face ideals for closed strata". New: "C0.1 and C0.4–C0.5 supply the face projections, off-face ideals and stratum quotient algebras of closed strata, and C0.6–C0.7 their coefficient change". The same correction is made in the §0.1 route, the §0.1 *Needs* line (C0.1, C0.4–C0.7) and the Layer 0 Dependencies.

Verification at head 63e3f03:
- C0.1 is the integral face projection.
- C0.4 is `ker_faceProjection`, the off-face ideal.
- C0.5 is `faceQuotientEquiv`.
- C0.6 is `faceProjection_coefficient_change`.
- C0.7 is `offFaceIdeal_map`.

Pattern: all four occurrences of "C0.6–C0.7" in the README were corrected, and none remain.

## F03 (P3) — applied differently

Edits:
- A Scope paragraph and a new contract, "From TauCetiRoadmap.PerfectoidTowers", record that P8.19 (`PerfectoidSpace.goodTower_frobenius_P1`) and P8.15 (`PerfectoidSpace.projectiveLine_perfectoid_charts`) state the ℙ¹ instance over ℂ_p.
- A new §3.2 Check compares the tower and charts, with identity transitions as the negative control.
- Layer 3 Dependencies cite P8.15 and P8.19.
- No API bullet or *Needs* entry was added.

Verification at PerfectoidTowers head 537fec2:
- `goodTower_frobenius_P1` is an "auxiliary computation" Check of P8.19, stated over ℂ_p only.
- `projectiveLine_perfectoid_charts` sits inside the P8.15 Check `isAnalyticallySeparated_projective_tower`.
- Both are marked "Lean: README only".

So the fact in the finding holds. PerfectoidTowers is earlier in the merge order. Why the repair differs: §§2.1 and 3.2 construct the tower for every finite fan and every perfectoid K. Making them *Need* a ℂ_p-only Check of the good-tower and analytic-separation layer would block the general construction behind a layer it does not use, which the *Needs* rule forbids. Agreement with another roadmap's object on one instance is a Check by definition (agreement with the library notion), so it is stated as one.

## F04 (P3) — applied

Removed "and degree-zero piece K" from gap:homogeneous-cone-approximation (README and plan gaps[2], same words).

Other edits:
- §2.4 statement. Old: "When Σ is complete R_D has degree-zero part K and satisfies the exact hypotheses…". New: "For every Σ, R_D with this grading satisfies the hypotheses…; when Σ is complete its degree-zero part is K."
- The §2.4 route now names the linear j-grading as the contract's input.
- §5.2 route: "its tilt with degree-zero K" → "its tilt K♭⟨Q_D⟩, with the grading by j".

Verification:
- In the proof of Lemma 6.5 (SCH12 line 1763 to line 1837), the grading is used only to keep h, r_i and s_i homogeneous of degree d−di, together with Lemma 6.4. The degree-zero piece is never used.
- Corollary 6.7(i) (SCH12 line 1838) is the ungraded estimate for every perfectoid affinoid algebra, which is the zero-grading case.
- The P2.1 "K° in degree 0" clause on main (`TauCetiRoadmap/PerfectoidSpaces/README.md` line 6110) describes the polydisc, not a hypothesis of its proof.

Kept unchanged, because they are true facts about complete fans rather than hypotheses:
- The §2.4 API bullet "for complete Σ the degree-zero piece is exactly K".
- The §2.4 Check and the Examples line.

## F05 (P3) — applied

Old: `nonempty_iso_sheaf_of_linearlyEquivalent` "transports linear equivalence…", with no extra hypothesis stated. New: "…; besides the hypotheses of `sheaf` it requires `IsNoetherian X` (quasi-compact and locally noetherian), the hypothesis under which `ofScheme` defines linear equivalence. Every finite-fan field fibre satisfies it, being covered by finitely many spectra of the finitely generated k[P_σ]."

Verification at Tau Ceti a91d3aa:
- In `TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/Sheaf.lean`, `section Mul` (line 563) opens `variable [IsNoetherian X]` (line 565), and the theorem is at line 642.
- `WeilDivisor.OrderSystem.ofScheme` (`Principal.lean` line 126) takes `[IsIntegral X] [IsNoetherian X]`.
- Mathlib's `IsNoetherian` extends `IsLocallyNoetherian` and `CompactSpace`.

Pattern: the other two Weil-divisor citations, `ofScheme` and `sheaf`, already state their full binders.

## Checks

- **Elaboration.** `lake env lean packages/AnalyticToricGeometryPartII/Suggested.lean`, run from the content checkout, exited 0 with no output. Suggested.lean is unchanged and declares nothing.
- **`#check` sweep.** Suggested.lean has no declarations, so the sweep over its declarations is vacuous. To pin the library names newly cited in the README, one scratch file of `#check`s was elaborated once under `import Mathlib`. All six exist at the pin with the expected types:
  - `AlgebraicGeometry.Smooth : (X ⟶ Y) → Prop`
  - `Algebra.Smooth R A`
  - `Algebra.instFormallySmoothMvPolynomial : FormallySmooth R (MvPolynomial σ R)`
  - `Algebra.Smooth.of_isLocalization_Away (r : R) [IsLocalization.Away r A] : Smooth R A`
  - `Algebra.Smooth.comp`
  - `Algebra.FormallySmooth.of_isLocalization`
- **Dependency check** (after all edits):

      depcheck: 52 roadmaps, 593 edges, 0 problem(s)

  There is no UPWARD, CYCLE or moved line. The edge count rose from 592 by the new PerfectoidTowers citation; PerfectoidTowers is earlier in the merge order.
- **Citation resolver** on the edited README: no cross-roadmap citations found nowhere, and no Lean names found nowhere. The resolver did not check Lean names outside the roadmaps on this host; the `#check` file covers the new ones. The earlier `Chow.gysin` lead resolves to SchemeAndStackFoundations §5.5 on main, which defines `Chow.gysin i f`.
- **Gap consistency.** The seven slugs agree between the README and plan.json. The README text and plan `needs` were compared for the two changed gaps and are identical.
- **Gate failures:** none were listed for this round.

## Adversarial pass on changed statements

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| gap:toric-field-fibres (new text) | rank-0 fan over 𝔽_p; empty fan; cone (1,0),(1,2) over k; ℙ¹ over 𝔽_p(t) | Spec 𝔽_p is normal and geometrically integral, with no rays. The empty fan gives ∅, which is not integral. Hilbert basis (0,1),(1,0),(2,−1) gives k[a,b,c]/(b²−ac): normal but singular. ℙ¹: D_± are {0} and {∞}, with distinct generic points of codimension 1. | False for the empty fan without a hypothesis | Added "nonempty" |
| Regular Σ ⇒ XΣ,R smooth over R | R=ℤ/4 positive ray; R=0; rank-1 zero cone; cone (1,0),(1,2) | (ℤ/4)[x] is formally smooth and finitely presented. R=0 gives ∅, smooth vacuously. R[y^(±1)] is a localisation away from y, so smooth. The singular cone has Jacobian (−c,2b,−a)=0 at the origin, so it is not smooth; C0.10 needs regularity. | Holds exactly for regular fans | New contract sentence |
| §4.1 inputs | ℙ¹ over O_C; single ray | O_C[t] and O_C[t⁻¹] are smooth, and the complete fan is proper by C0.17. A¹ is not proper (C0.17 Check); §4.1 assumes completeness. | Needs C0.10 and C0.17, not the gap | *Needs* updated |
| §1.2 inputs | positive ray; ℙ¹; WC.6 fan | t=ϖ⁻¹ is outside the unit model. ℙ¹ charts \|t\|≤1 and \|t⁻¹\|≤1 cover. The WC.6 fan is proper but nonprojective. No normality or ray-divisor step occurs in the route. | Gap citation spurious | *Needs*: C0.17 |
| C0.1/C0.4–C0.5 orbit ideal (§0.1) | R=k, P=ℕ, F={0}; ℤ/4→ℤ/2 | e₁↦0 and the quotient is k, matching the §0.1 Check. The coefficient 2↦0 on both paths (C0.6 Check). | Consistent | Locators corrected |
| gap:homogeneous-cone-approximation without the degree-zero hypothesis | polydisc with total degree; positive ray D=0 graded by the z-exponent; rank-0 cone, p=2, K=ℂ₂ | Polydisc: recovers P2.1. Positive ray: f=(1+t)z, g=(1+t)z over K♭, f−g♯ ∈ ϖK°⟨…⟩, so \|f−g♯\| ≤ \|ϖ\| ≤ \|ϖ\|^(1/2) at c=0, ε=1/2, although the degree-0 piece K⟨t^(1/p^∞)⟩≠K. Rank 0: f=2, g=0 gives \|2\| ≤ \|ϖ\|² < \|ϖ\|^(1/2). | Estimate holds without the hypothesis | Hypothesis dropped |
| §2.4 "for every Σ … hypotheses; complete ⇒ degree-0 is K" | ℙ¹ D=D₋; positive ray D=0; complete D=0 | ℙ¹: (u,j)↦(u,j−u) gives the perfected quadrant with total degree, degree 0 = K. Positive ray: Q=ℤ[1/p]≥0×ℤ[1/p], degree 0 = K⟨t^(1/p^∞)⟩, matching the §2.3 Check. Complete: K⟨z^(±1/p^∞)⟩ with degree 0 = K. | Consistent with the §§2.3–2.4 Checks | Restated |
| §5.2 route (grading by j) | ℙ¹, g₀=a+b t^(1/p) | Degree one; the pth power aᵖ+bᵖt lies in O(pD₋). No degree-0 input is used. | Unchanged truth | Phrase edited |
| §3.2 ℙ¹ agreement Check | K=ℂ_p, ℙ¹ fan; identity transitions | pr_(n+1)*(φ*t)=t^(p/p^(n+1))=t^(1/pⁿ)=pr_n*t. Charts: ray +1 gives P=ℤ≥0, so K⟨t^(1/p^∞)⟩; ray −1 gives K⟨t^(−1/p^∞)⟩; the zero cone gives K⟨t^(±1/p^∞)⟩. On the overlap t^(1/pⁿ)·t^(−1/pⁿ)=1. Identity transitions give pr_n*t=t with no roots, the constant ℙ¹ tower, which P8.19 says is not good in mixed characteristic. | Matches P8.15/P8.19, and the wrong transition is excluded | New Check |
| F05 binder | ℙ¹_k; rank-0 Spec k | Two affine charts k[t], k[t⁻¹] give a quasi-compact, locally noetherian space; Spec k is noetherian. | Hypothesis met on all field fibres | Contract text |

## Ownership and citations

- **ShimuraCompactifications** (head 63e3f03) is the owner of the arbitrary-ring fan scheme. The narrowed gap asks it only for field-fibre normality, geometric integrality and ray divisors, which C0 does not state.
- **PerfectoidTowers** (head 537fec2) states only the ℙ¹ instance over ℂ_p, as Checks. This roadmap remains the owner of the general toric tower (SCH12 Theorem 8.5, every fan).
- I also checked that PerfectoidTowers' `not_goodTower_affine_line` is a negative control about projectivity. It is not the Theorem 1.5 comparison of §3.7, so nothing else needed citing.
- Ownership against open work used the `roadmaps grep` index over all 363 open heads and main, plus the sibling checkouts listed in the brief.

## For the maintainer

- **ShimuraCompactifications:** gap:toric-field-fibres is narrower. It no longer requests smoothness and now states nonemptiness.
- **PerfectoidSpaces:** gap:homogeneous-cone-approximation now asks for the estimate on every linearly graded perfected cone algebra, with no degree-zero hypothesis. That is still within what the Lemma 6.5 proof gives.
- **New citation:** PerfectoidTowers P8.15/P8.19, with the README-only Check names `PerfectoidSpace.goodTower_frobenius_P1` and `PerfectoidSpace.projectiveLine_perfectoid_charts`. If PerfectoidTowers renames them, the §3.2 Check and the contract need updating.
- No Lean name of this roadmap changed, Suggested.lean is unchanged, and `sources.toml` and `metadata.toml` are unchanged (no new source was needed).
- No untrusted text contained instructions.
