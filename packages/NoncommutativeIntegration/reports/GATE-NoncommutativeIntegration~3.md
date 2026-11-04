# GATE-NoncommutativeIntegration~3: answers to human review

Commit `f45fa7b3` on top of `5272f8e`. Files changed: `TauCetiRoadmap/NoncommutativeIntegration/README.md` and `TauCetiRoadmap/NoncommutativeIntegration/Suggested.lean`.

## H01 (roed-math) — applied differently

The gap is real. For `U : ℓ₂ⁿ → ℓ∞ⁿ`, `U eᵢ = eᵢ`, every Rademacher sum has norm 1 while `π₂(U) ≥ √n`, so Pietsch plus little Grothendieck cannot give the random-sum bound unless the codomain has cotype 2. Pisier, *Grothendieck's theorem, past and present* (arXiv:1101.4195v3, lines 1419–1421) also confirms that the LPP factorization proof goes through the cotype-2 property of `M_*`. The repair takes the reviewer's second option. In I6 (README lines 444–491), the factorization paragraph (little Grothendieck from C6, 2-summing factorization, Pietsch from B6) is replaced by the cotype-free Haagerup–Musat route (Pisier §9, Lemma 9.2 and the proof of Theorem 9.1). Every step is now an I6 target with its inputs named:

1. sign-cube duality `K₁(a)=sup{|∑⟨x_k,a_k⟩| : [x]≤1}` in `ℓ¹(Ω_n;M_*)`, together with the p=1 row/column duality already owned by I6;
2. the orthogonality inequalities `∑y_k*y_k≤E(Φ*Φ)` and `∑y_ky_k*≤E(ΦΦ*)`, which also give the upper estimate;
3. the fourth-moment bound `‖E(S⁴)‖≤3‖∑x_k²‖²` for self-adjoint families, proved from the pairing expansion and operator Cauchy–Schwarz;
4. reduction to self-adjoint families by the 2×2 trick, then truncation at `c₀=√3/2` and geometric iteration, giving `c=3^(−1/2)`.

No step uses cotype, Pietsch or I7. The now-unused B6 and C6 rows are removed from the prerequisites: "B1–B2 … and B6 …" becomes "B1–B2", and "C3–C6 … noncommutative Grothendieck" becomes "C3–C5". The LPP entry in References now says that its proof uses cotype 2 and is not the route used in I6, and Pisier's survey and Haagerup–Musat (2007, 2008) are added. Adding a cotype-2 theorem for `M_*` instead would bring in two more external results that this roadmap cannot read or own cleanly: Haagerup 1985 for the cotype, and the Gaussian–Rademacher comparison in finite cotype. The L⁴ route needs neither.

## H02 (mycaule) — applied

I1 now has a matrix Check after the integrated concave inequality (README lines 121–131). On `M_d(ℂ)` with the unnormalized trace, `μ_t(x)=s_⌊t⌋(x)`: with zero-indexed singular values, `d_x(λ)=#{j : s_j>λ}≤t` exactly when `λ≥s_⌊t⌋`. So with g the identity and t=k, the integrated estimate is Ky Fan's `∑_(j<k) s_j(x+y)≤∑_(j<k) s_j(x)+∑_(j<k) s_j(y)`. The Check also gives the witness x=e₁₁, y=e₂₂ (1≤2 at k=1, 2≤2 at k=2), shows that the pointwise bound `s₁(x+y)≤s₁(x)+s₁(y)` fails (1>0), and records that a normalized trace gives `μ_t=s_⌊dt⌋` instead. Fan 1951 (PNAS 37, 760–766) is cited by page range in References. Its attribution is checked against Moslehian, *Ky Fan inequalities*, arXiv:1108.1467v2, §3, `Moslehian2012KyFan line 98–99`. The PNAS text itself is on PMC (PMC1063464) but could not be fetched through the sources service, so no theorem number is claimed.

## H03 (mycaule) — applied differently

The facts check out at our pin, Mathlib `6b7abb3` (not `715a03a`):

- `LinearMap.singularValues` exists in `Mathlib/Analysis/InnerProductSpace/SingularValues.lean:94`, for finite-dimensional inner product spaces over `RCLike 𝕜`, zero-indexed (docstring lines 85–92). That matches `μ_t=s_⌊t⌋`.
- Neither Mathlib nor Tau Ceti at the pins has an additive Ky Fan inequality for it.

The H02 Check therefore names `LinearMap.singularValues` as its finite-dimensional carrier. The external CC0 repository is not cited and not made a supplier: a roadmap consumes only Mathlib, Tau Ceti and roadmaps, and a Check states the mathematics without naming Lean code. An implementer is free to adapt that proof. Upstreaming through OperatorIdeals is that roadmap's decision and not a prerequisite here.

## Further repairs made in the same pass

- **Imports.** `Suggested.lean` imported six `Mathlib.*` submodules and failed the gate. It now has the single line `import Mathlib`.
- **PR numbers.** README lines 643 and 645 linked Mathlib PR #44525 and #41477, which failed the gate. The sentence now refers to Mathlib's trace, modulus, p-gauge and Hilbert–Schmidt conventions without PR numbers.
- **False library claim.** The README said that Tau Ceti's `MeasureTheory/Integral/RieszThorin` provides `TauCeti.eLpNorm_le_rpow_mul_rpow_mul_eLpNorm`. Neither that module nor any Riesz–Thorin file exists in the pinned Tau Ceti or Mathlib (searched for `RieszThorin` and `Riesz–Thorin`). The README now says that neither pin contains Riesz–Thorin and that it comes from PDE, which owns it (PDE README lines 197 and 274 on main).
- **Dropped binders.** `#check @name` for all 15 declarations, run through a temporary appendix to the build and then removed, showed that `CompatibleCouple`, `sumCarrier` and `kFunctional` had lost `[T2Space Z] [IsTopologicalAddGroup Z] [ContinuousSMul ℂ Z]`. The structure now carries them in its own signature, and the re-elaborated types of all three include them. The other 12 types are unchanged and match the README.
- **Not changed (out of scope).** The rest of `Suggested.lean` is still not in the acceptance-test form the brief describes. It uses `namespace NoncommutativeIntegration`, has padding lemmas (`kFunctional_nonneg`, `matrixLpGauge_two`, `differenceSequenceProjection_previous_mean`) and has a non-standard module docstring. No reviewer raised these and they were left alone.

## Adversarial pass on changed statements

| statement | instances | values | result |
|---|---|---|---|
| `‖E S⁴‖≤3‖∑x_k²‖²` | n=1; scalars x₁=x₂=1; Pauli σ_x, σ_z; scalars x_k=1, n→∞ | x₁⁴ vs 3x₁⁴; 8 = A+B+C−2D = 4+4+4−4; S²=2 so E S⁴=4 = 4+4+0−4; (3n²−2n)/n²→3 | holds; constant 3 is sharp; the Pauli case shows C must be kept (commutative formula gives 8≠4) |
| truncation `(|t|−c₀)²≤t⁴/(16c₀²)` | t=c₀, t=2c₀, t=3c₀ with c₀=√3/2 | 0≤c₀²/16; c₀²=c₀²; 4c₀²≤81c₀²/16 | holds (equality at 2c₀) |
| iteration constant | geometric series c₀(1+1/2+…) | 2c₀=√3, so c=3^(−1/2) | agrees with Pisier line 1517 and Haagerup–Musat |
| 2×2 reduction | x₁=e₁₂ in M₂ | ∑z²=diag(e₁₁,e₂₂), norm 1 = max(‖x x*‖,‖x*x‖) | holds |
| orthogonality ⇒ upper estimate | n=1, a₁ = y ∈ M_* | K₁=‖y‖ ≤ min(C₁,R₁)=‖y‖ | equality, consistent |
| `μ_t=s_⌊t⌋` (unnormalized) | diag(3,1) in M₂, t∈(0,1), [1,2), ≥2 | 3, 1, 0 | holds; normalized trace gives s_⌊2t⌋ |
| Ky Fan check | e₁₁, e₂₂; k=1,2 | 1≤2, 2≤2; pointwise s₁: 1>0 | integrated form holds, pointwise fails as stated |
| `CompatibleCouple` binders | elaborated `#check` | T2/TVS instances present in all 5 couple declarations | fixed |

## Sources

- **Read.** `Pisier2012Grothendieck` (arXiv:1101.4195v3), lines 1361–1530 and 1591–1605. `Moslehian2012KyFan` (arXiv:1108.1467v2), lines 84–104 and 586–587.
- **Not readable through the service.** Lust-Piquard–Pisier 1991 (Project Euclid's PDF is behind a bot wall, Springer is paywalled) and Haagerup 1985 (paywalled). Neither is relied on for a new locator: the LPP entry keeps only "Appendix IV" and the cotype remark, which Pisier lines 1419–1421 confirm. Fan 1951: PMC copy blocked by a captcha; cited by page range.
- This roadmap has no `sources.toml`, and this job may edit only the README and `Suggested.lean`, so no manifest entries were written. No `needs-references.toml` is left: every citation added is either read or settled through an open survey.

## Ownership and citations

- **Ownership.** The new I6 targets (sign-cube duality, fourth-moment lemma, truncation) are specific to the p=1 Khintchine proof. `roadmaps grep` was not run for them separately; CStarAlgebras C6, BanachSpaceTheory B6 and this roadmap's I7 are the only nearby owners named, and none of them states the L⁴ lemma.
- **Suppliers.** VonNeumannAlgebras and CStarAlgebras are open roadmap pull requests, not on main. The depcheck below reports no problem.

## Build and gate

- `lake build TauCetiRoadmap.NoncommutativeIntegration.Suggested`: Build completed successfully (8976 jobs). The only warnings are 5 `declaration uses 'sorry'`, at lines 45, 50, 89, 94 and 100.
- gate: `gate NoncommutativeIntegration: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK`
- depcheck `--movable`: `depcheck: 155 roadmaps, 1060 edges, 0 problem(s)` (no UPWARD or CYCLE line).
