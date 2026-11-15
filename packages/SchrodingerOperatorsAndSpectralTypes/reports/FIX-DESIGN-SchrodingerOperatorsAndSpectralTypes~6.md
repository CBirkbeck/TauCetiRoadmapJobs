# FIX-DESIGN-SchrodingerOperatorsAndSpectralTypes~6

Repair of the design (`packages/SchrodingerOperatorsAndSpectralTypes/design/README.md`, `design/plan.json`,
`sources.toml`) against the eight findings of REV-DESIGN-SchrodingerOperatorsAndSpectralTypes~5. Every
finding was checked against the cited text before it was applied; all eight hold. The review's
"For the human reviewers" item (licence of `teschl`) lists no finding, and nothing was changed for it.

## F01 (P2) — applied differently

Scope: new RiemannianGeometry R5c bullet; the VariationalMethods bullet is gone. 3.8 now proves `Δ_X` = complexification of R5c's `L_D` (q = 0), so `λ_k(X) = μ_{k+1}(Δ⁺)`. R5c's spectral statements are cited, and the dimension-0 and empty cases are owned here. In 3.9, smooth `V` is cited from R5c. Index comparison added in 3.7. Needs, contract, Layer 3 dependencies, plan and Hide–Magee example updated.

Why "differently". (1) The review's other phrasing ("`L²(X; ℂ)` regarded as real is R5c's operator for the trivial rank-two bundle") is a true identity of operators, but every multiplicity doubles. On the circle the rank-two `μ₂` is `0`, so `λ_k = μ_{k+1}` would be false in that reading. I used the complexification of the scalar operator and added that circle as a 3.8 Check. (2) In 3.9 the smoothness clause stays true in dimension `0`, where every function is smooth, so the clause is not narrowed to `dim X ≥ 1`. (3) After the repair no target uses VariationalMethods directly, so I removed it from the Scope bullet, the contract, the Layer 3 dependencies and the plan's suppliers. The R5c bullet names it as R5c's input.

Evidence: main `TauCetiRoadmap/RiemannianGeometry/README.md`, §R5c (now at line 3715; the review's line numbers are older). Its standing assumptions are `m ≥ 1` and a real bundle `E`. Closed case: "replace M by D", so `M` compact and possibly disconnected, with `L_D` = K5a's `H²` realisation minus `c`. It lists `μ₁ ≤ μ₂ ≤ …`, `μ_k → +∞`, smooth eigensections, Courant–Fischer from VariationalMethods 3.1 and 4.1–4.4, and item 4, `λ₁(Δ⁺) = μ₂(Δ⁺)` on a connected `M`.

## F02 (P3) — applied

Layer 3 Examples. "torsion-free congruence subgroup (Γ(N), N ≥ 3)" became "image in `PSL₂(ℤ)` torsion-free (Γ(N), N ≥ 2, or Γ₀(4); −I acts trivially)". Added the Γ(2) instance: area `2π`, three cusps, `ker = ℂ·1`, `[1/4, ∞) ⊆ σ_ess`. "Groups with torsion are orbifolds" became "elliptic elements" (Γ₀(2), with the point `(1+i)/2`). CongruenceSpectralGap §0.2 now reads "Γ(N′), invariants of the finite quotient", and AutomorphicSpectralTheory §1.16a "orbifold charts".

Checked at the open heads: AutomorphicSpectralTheory §1.16a works "including the finite-stabilizer orbifold charts" and passes to no cover. CongruenceSpectralGap §0.2 takes `N′ = 3N` and the invariants under `Γ/Γ(N′)`.

## F03 (P3) — applied

1.6: the counting identity is now cited as "a consequence of the min–max theorem, teschl line 5044–5052", with line 5063–5069 kept for Theorem 4.12(i), the lower bound only. 1.7: the definition is cited at line 10585–10587, (12.3), p. 247. Each bullet now has its own locator (Lemma 12.1 at line 10600–10601, (12.6) at 10609, Theorem 12.2 at 10617–10620). The chain rule cites rs3 §XI.3 and is proved by unitarity. The same Conventions locator was fixed too, along with plan 1.6b, 1.7a, 1.7b and the teschl and rs3 entries in `sources.toml`.

The rs3 section number cannot be checked (uncertified, from memory), so no proposition number is given. The README carries a one-line proof, so the rule does not depend on that locator.

## F04 (P3) — applied

Layer 2 Dependencies: "Layer 1 (for σ, P_A and 1.3); …" became "SelfAdjointSpectralTheory Parts C, D, E; UnboundedOperators UO-C01, UO-D06; Tau Ceti Kato–Rellich. Independent of Layer 1." "How to read the build" now says that Layer 2 rests on the two operator-theory roadmaps alone, so Layers 1 and 2 are independent. UO-C01 is added because the new 2.1 route (F06) uses it.

## F05 (P3) — applied

3.10: after the definition, a sentence says `(w, a)` belongs to the chosen isometry. Composing with `(x, y) ↦ (cx, cy)` gives `(cw, ca)`, and only `w/a` is an invariant. The Truncation and Isometry-invariance bullets now say "for the restricted or transported isometry". A new Check uses `y > 1` in `⟨z ↦ z + 1⟩\ℍ`: `(1, 1)` versus `(2, 2)`. Plan 3.10a (statement, API, test) is updated to match.

## F06 (P3) — applied differently

2.1: the three-way equivalence is no longer a target. It is cited as the cycle SA-D22 (form bound ⇒ spectrum), SA-E08 (spectrum ⇒ projection), SA-E11 (projection ⇒ form bound). The section owns `λ₀` and its variational formula, now with a route of its own. Plan 2.1b is renamed `spectrumBottom_eq_inf_rayleigh`. 2.3 and 4.4 cite the cycle, and the SA Scope bullet names it.

Why "differently": the review would keep the clause `σ(A) ⊆ [γ, ∞)` as owned here. That clause is SA-D22's conclusion and SA-E08's hypothesis on main (README lines 1113–1116 and 1217–1218), so nothing of the equivalence remains to own. No dependency on the open revision is created.

## F07 (P3) — applied

Scope: "the complete `L²` theory … on noncompact Riemannian manifolds" became "the `L²` realisation of the scalar Laplace–Beltrami operator on Riemannian manifolds". In parentheses it lists what is proved on every manifold (initial, minimal and maximal operators, energy form, Friedrichs Laplacian) and what only on complete ones (essential self-adjointness, the domains, kernel, `λ₀`, ordered eigenvalues, bounded potentials, cusp threshold). The clause for every manifold reflects 3.2–3.4, which assume no completeness.

## F08 (P3) — applied

The transfer to a bare normalized PVM is now a stated last item of 1.1, citing teschl line 3983–3992 (Theorem 3.7, the uniqueness clause). Its *Needs* line adds UO-A01–UO-A02 with gap:spectral-integral-resolvent. A Check shows that normalisation is needed (`1_B(2)·Q` on `ℂ²`). The Conventions bullet is cut down to a pointer that keeps both witnesses. Plan: 1.1 lists the gap, and `gaps[1].neededBy = ["1.1"]`.

## Adversarial pass (changed statements only)

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 1.1 bare PVM item | `δ₂` on `ℂ`; `1_B(2)Q` on `ℂ²`; `1_B(2)Q + 1_B(5)(1−Q)` | `(i−2)⁻¹` inverts `i−2`; `P(ℝ) = Q ≠ 1`, so no self-adjoint operator has it as spectral measure; `(i − diag(2,5))·diag((i−2)⁻¹,(i−5)⁻¹) = 1` | holds; normalisation is needed (new Check). Pinned `ProjValMeasure` has field `proj_univ` (Basic.lean, structure at line 91) |
| 2.1 cited cycle | `A = 2` on `ℂ`, `γ = 1, 2, 3`; `ℋ = 0`; `M_x` | `γ ≤ 2` in all three clauses; all true; all false | equivalence correct, owned by SA |
| 2.1 `λ₀` formula | `H₀ + c` on core `𝒮`; `A = 2`; Dirichlet `(0,1)` | Gaussians `e^{−πx²/n²}`: `‖u'‖² = π/(n√2)`, `‖u‖² = n/√2`, quotient `c + π/n²`; `2`; `sin πx` gives `π²` on `H¹₀`, while `1 ∈ H¹` would give `0` | correct; infimum not always attained; the form domain must be `A`'s |
| 2.1 route (≤) | `λ₀ ∈ σ` | `P((λ₀−ε, λ₀+ε)) ≠ 0` and `P((λ₀−ε, λ₀)) ≤ P((−∞, λ₀)) = 0`, so `P([λ₀, λ₀+ε)) ≠ 0` | correct |
| 1.6 counting clause | `diag(1,3,5)`, `λ = 4, 1`; `H₀`, `λ < 0` | `2 = #{1,3}`; `0 = 0`; `0 = 0` | correct; locator repaired |
| 1.7 chain rule | `H₁=H₂=H₃`; `H₁=H₂=0`, `H₃=c≠0` on `ℂ` | `Ω = 1`; `D(H₃,H₂) = 0` forces `ψ = 0`, and `D(H₃,H₁) = 0` | correct (unitarity proof) |
| 1.7 intertwining | teschl (12.6) with `H₀ ↦ H₁`, `H ↦ H₂` | `Ω e^{−isH₁} = e^{−isH₂} Ω` | sign agrees |
| 3.7 index comparison | circle `2π`; `S²`; two circles | `λ₀,λ₁,λ₂ = 0,1,1` vs `μ₁,μ₂,μ₃ = 0,1,1`; `λ₁..λ₃ = 2 = μ₂..μ₄`; `λ₀ = λ₁ = 0 = μ₁ = μ₂` | `λ_k = μ_{k+1}` |
| 3.8 complexification | circle, rank one vs rank two | real eigenspace of `1`: dim 2; complex: dim 2; rank-two real: dim 4, rank-two `μ₂ = 0` | scalar complexification is right; rank-two reading wrong (new Check) |
| 3.8 uniqueness route | compact `X` | `C^∞ ⊆ H² = dom`; both operators self-adjoint and ⊇ `Δ₀`; `Δ₀` essentially self-adjoint, so each equals `Δ_X` | correct |
| 3.8 degenerate | `X = ∅`; `N` points | `L² = 0`, `σ = ∅`, `λ_k = +∞`, mult(0) = 0 = #components; `ℂ^N`, `Δ = 0`, `λ_k = 0` for `k < N`, `+∞` beyond, resolvent finite rank | correct, owned here |
| 3.8 sign | `Δ⁺ = −laplaceBeltrami` (R5c) vs 3.1 `Δ = −laplaceBeltrami` on Re, Im | same operator on smooth functions | consistent |
| 3.9 smooth `V` | circle, `V = 1`; `V = 1_{[0,π)}`; dim 0 | R5c list `1,2,2,5,5`, the same as ours; not smooth, not R5c; every function smooth | correct |
| 3.9 domains | R5c `L_D` for `q = V` | K5a `H²` realisation of `Δ⁺+V+c` minus `c`, domain `H²` = `dom Δ_X` | agree |
| 3.10a scaling | `(x,y) ↦ (2x,2y)` on `(ℝ/ℤ)×(1,∞)` | `(4dx²+4dy²)/(4y²) = (dx²+dy²)/y²`; image `(ℝ/2ℤ)×(2,∞)`; `w/a = 1` both | `(w,a)` not invariant; area is |
| Layer 3 Examples | `Γ(2)`, `Γ₀(4)`, `Γ₀(2)`, `Γ(N≥3)` | `−I` in the first three; elliptic points `0, 0, 1`; `Γ(2)`: index 6 in `PSL₂(ℤ)`, area `6·π/3 = 2π`, cusps `0,1,∞`; `y > 1` is precisely invariant (`Im γz ≤ 1/(c²y)`, `|c| ≥ 2`); matrix rows `(1,−1),(2,−1)`: det 1, trace 0, fixes `(1±i)/2` | correct |
| R5c contract | R5c text | `m ≥ 1`, real `E`, compact union of components, `c > k₀`, `W ⊂ V = W^{1,2}` | matches |

## Checks run

- Dependency check (prescribed command), output:

```
candidate: SchrodingerOperatorsAndSpectralTypes is not in the merge order yet; checked as if placed after QuantumFoundations (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2233 edges, 0 problem(s)
```

  No UPWARD or CYCLE line. RiemannianGeometry is on main and was already a supplier (R7.8).
- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere.
- `plan.json` parses as JSON and `sources.toml` as TOML.
- No `Suggested.lean` exists at the design stage, so no `#check` elaboration was run; no Lean command was run.
- There were no gate failures to repair.

## Sources

Nothing was fetched and `needs-references.toml` was not written. `sources.toml`: teschl's locator adds Theorem 3.7, Theorem 4.12(i), (12.3) and (12.6). rs3's locator adds "the chain rule" to §XI.3, with `cited_for` now `["1.7", "1.9"]`. Every new locator was read in the cached teschl text: line 3983–3992, 5044–5055, 5063–5069, 10585–10587, 10600–10620. kato57 and yafaev04 were searched for a chain rule, and neither states one.

## For the maintainer

- Ownership: closed-manifold spectral theory of `Δ⁺ + q` is RiemannianGeometry R5c's (on main), now cited. This roadmap keeps the complex `Δ_X` built from `C_c^∞`, its identification with R5c's operator, dimension 0, the empty manifold, bounded measurable `V` and the two-sided min–max bound. The congruence-quotient owners are unchanged (CongruenceSpectralGap §0.2 and §0.6, AutomorphicSpectralTheory §1.16a).
- VariationalMethods is no longer a direct supplier, because no target uses it except through R5c.
- Plan target 2.1b is renamed from `spectrum_subset_Ici_iff_formBound` to `spectrumBottom_eq_inf_rayleigh`. No roadmap on main or at an open head cites either name or this roadmap (`roadmaps grep`).
- Ownership against open pull requests: checked with `roadmaps grep` and `roadmaps show` for the objects touched (AutomorphicSpectralTheory, CongruenceSpectralGap, the open SelfAdjointSpectralTheory revision). No new owner was found.
- No text read in this round asked for any action outside the job.
