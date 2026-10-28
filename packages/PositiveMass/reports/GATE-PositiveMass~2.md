# GATE-PositiveMass~2: answers to human review

The review was written against `126a454`. The later commits `eae3089` and `68063cc` had already
repaired every point it raises, and this round re-verified each repair at `68063cc`. This round made
no edits to `TauCetiRoadmap/PositiveMass/README.md` or `TauCetiRoadmap/PositiveMass/Suggested.lean`
and created no commit.

## H01 (roed-math) — applied
P1a now limits the Sobolev elliptic estimates and Fredholm theorems to `1<p<∞` and says explicitly that they are not asserted at p=1 or p=∞ (`TauCetiRoadmap/PositiveMass/README.md` lines 125–131). The counterexample is correct: for `u=χ(r)x₁x₂ log r` we get `Δ₀u=(n+2)x₁x₂/r²` near 0, which is bounded, while `∂₁∂₂u=log r+O(1)`. So `W^(2,∞)_δ→L^∞_(δ−2)` has an infinite-dimensional cokernel.

## H02 (roed-math) — applied
The displayed maps now carry integer `k≥2` for the scalar operator and `k≥1` for the Dirac operator (lines 126–129). Lines 134–147 state the order-k coefficient hypotheses: `g−δ∈C^(k,α)_(−s)`, the extra connection in `C^(k−1,α)_(−1−s)`, and the potential in `C^(k−2,α)_(−2−s)`. They also prove the basic finite-p `W^(2,p)` scalar and `W^(1,p)` Dirac estimates for the headline O₂ metric separately, and state that smoothness plus O₂ does not give higher weighted bounds.

## H03 (roed-math) — applied
The ranges are now separated:
- **Space definitions:** all `1≤p≤∞` (lines 100–106).
- **Smooth compact-support density:** `1≤p<∞` only; the endpoint uses a compact-support closure that is defined separately (lines 110–114).
- **Duality:** `(Lp_δ)*≃Lp′_(−n−δ)` for `1≤p<∞`, with only a predual pairing at p=∞ (lines 118–121).
- **Hölder realization:** a separate weighted Hölder realization at `0<α<1` with its own Schauder estimates (lines 132–134, 274–275).

The duality exponent was recomputed: the pairing `∫uv dV` forces `−εp′−n=p′δ+np′/p`, so `ε=−n−δ`.

## H04 (roed-math) — applied
P0.3 (lines 78–81) states that `O_k(r^(−t))` lies in finite-p `W^(k,p)_δ` only for `δ>−t`, because the tail is `∫r^(−p(t+δ)−1)dr`, which diverges logarithmically at `δ=−t`. P2.1 (lines 313–317) fixes `(n−2)/2<q<min(t,n−2)` and `p>n`, uses the strict loss `q<t` to enter the finite-p class, and gives the approximation topology: `W^(2,p)_(−q)` on end coefficient differences plus C² on compact sets. It also proves mass convergence at every end separately (lines 319–322). The interval for q is nonempty for every n≥3; for n=3 it is `(1/2, min(t,1))`.

## H05 (roed-math) — answered
The V1–V5 contract exists. VariationalMethods is a new-roadmap folder in an open roadmap pull request (`TauCetiRoadmap/VariationalMethods/README.md`, with §V2 "V2.3 — Complex coercive adapter" and §V5 "V5.1 — Actual domain and operator"). The remaining form-to-operator construction has an owner: UnboundedOperators §"UO-D06 — Closed forms and the Friedrichs extension" (`TauCetiRoadmap/OperatorTheory/UnboundedOperators/README.md`, also a new-roadmap folder in an open pull request). The supplier row at line 36 and the chain VM V2.3 → UO-D06 → VM V5.1 → CKG K5a → Yamabe Y1.2/Y3.1 → P3a at lines 45–58 now cite both. Both roadmaps state that same order themselves.

## H06 (roed-math) — applied
README lines 50–55 adopt the requested specification as UO-D06's construction:
- A dense continuous injective `j:V→H` and a bounded Hermitian form with coercive shift give `Dom A={j u : ∃h, ∀v, a(u,v)=⟨h,j v⟩}` and `A(j u)=h`.
- No second realization engine is built.

UO-D06 itself owns:
- the `RCLike 𝕜` `closedFormOperator`;
- self-adjointness through surjectivity of `A+αI`;
- both adjoint inclusions;
- the shifted resolvent.

VM V5.1 owns identifying the shifted inverse with the V2 form solution operator, and its compactness when the inclusion is compact.

## H07 (roed-math) — applied
The complex case is assigned to VM V2.3 (line 36): realification, tests against `v` and `Complex.I • v`, and the complex-linear forcing map. VM V2.3 is that roadmap's "Complex coercive adapter".

## H08 (roed-math) — applied
P4 now defines the signed raw term with the inward normal, `G_r(u)=∫_(S_r) Re⟨u,c(ν)Du+∇_νu⟩ dS_g`. It gives `lim G_r(u)=−(n−1)|S^(n−1)|m_ADM|v_∞|²/2`, makes the mass side `−G_r` (lines 490–497), and Sources lines 644–646 record the comparison. This matches CecchiniZeidler2021 line 317 (inward ν) and lines 395–419 (proof of Proposition 2.5, line 361), whose mass normalization `1/(2(n−1)ω_(n−1))` (line 225) is P0's. The two-term witness is the Schwarzschild flux: `(1+c r^(2−n))^(4/(n−2))δ` gives integrand `4c(n−1)r^(1−n)`, so mass `4c(n−1)|S|/(2(n−1)|S|)=2c`, matching the claim at line 30.

## H09 (roed-math) — applied
Sources lines 653–658 cite Bartnik, *The mass of an asymptotically flat manifold* (1986):
- §1 for the weight convention, and Theorem 1.7 for the Fredholm theory with `1<p<∞` and the coefficient hypotheses that precede it;
- §§2–4 for the Laplacian isomorphism on `2−n<δ<0`, harmonic coordinates and chart invariance.

The weight convention `ρ^(−δp−n)` in line 102 agrees with CecchiniZeidler2021 lines 267–275. The Bartnik text is behind a publisher paywall. The course-page copy the review links is not a legal source under our rules, so the Bartnik locators come from the review and are not certified from the text.

## H10 (roed-math) — applied
The supplier row at line 37 cites RiemannianGeometry R8.1 (finite harmonic polynomials) and R8.2 (spectral completeness), and P1b consumes them (lines 166–170). Both subsections exist in `TauCetiRoadmap/RiemannianGeometry/README.md` on main, in §R8.

## H11 (roed-math) — answered
The spinor indicial decomposition stays an explicit P1 construction (P1c, lines 187–262). It uses:
- the round Spin restriction comparison;
- the monogenic Fischer decomposition `P_k=M_k⊕X P_(k−1)`;
- eigenvalues `±(k+m/2)` with multiplicity `2^floor(m/2)·binomial(k+m−1,k)`.

It does not depend on R8. Check at m=2: multiplicity `2(k+1)` for `±(k+1)` on S², the standard round spectrum.

## Adversarial pass (statements bearing on the review points)

| Statement | Instance | Computed | Result | Change |
|---|---|---|---|---|
| Scalar indicial factor `j(j+n−2)−δ(δ+n−2)=−(δ−j)(δ+j+n−2)` | expand RHS | `−(δ²+(n−2)δ−j²−(n−2)j)`, equal to LHS | holds | none |
| Exceptional roots distinct for n≥3 | n=3, j=0 | roots 0, −1 | holds | none |
| Harmonic multiplicity formula | n=3, j=1,2 | 3−0=3; 6−1=5 | holds | none |
| Exterior domain not Fredholm | 2−n<δ<0, all j | `2−n−j<δ` for every j≥0, so infinitely many modes | holds | none |
| Dirac exceptional set | λ=∓(k+m/2) | δ=k; δ=−m−k=1−n−k | holds | none |
| Dirac weight `−(n−2)/2∈(1−n,0)` | n=3 | −1/2 in (−2,0) | holds | none |
| Spinor multiplicity | m=2 | 2(k+1) | matches S² | none |
| Tail threshold P0.3 | `|v|~r^(−t)` | integrand `r^(−p(t+δ)−1)`, finite iff δ>−t | holds | none |
| P2.1 q-interval | n=3 | (1/2, min(t,1)), nonempty since t>1/2 | holds | none |
| Weighted Hölder product | exponents p/r, q/r w.r.t. `ρ^(−n)dV` | weights add: δ+ε | holds | none |
| Weighted duality | pairing ∫uv | ε=−n−δ | holds | none |
| Endpoint counterexample (review) | `x₁x₂ log r` | `Δ=(n+2)x₁x₂/r²`, `∂₁∂₂u=log r+O(1)` | review correct; README excludes p=∞ | none |
| Mass normalization | `(1+c r^(2−n))^(4/(n−2))δ` | 2c | holds | none |
| Capped conformal mass | `U=1+b r^(2−n)` | m+2b | holds | none |
| P4 Green sign | CecchiniZeidler2021 lines 406–419 | inward term tends to `−(n−1)ω m|u|²/2` | holds | none |

## Ownership, citations, signatures

- **Ownership:** this round added no construction. VariationalMethods V2.3/V5.1 and UnboundedOperators UO-D06 were checked against their open-pull-request heads, and RiemannianGeometry R8 against main.
- **Signatures:** `Suggested.lean` is unchanged, so the elaborated signatures in the scratch `signatures.md` still apply. No `#check` rerun was needed. None of the 9 declarations had lost a binder.
- **Outside this review:** `Suggested.lean` uses the namespace `PositiveMass` instead of `TauCetiRoadmap.PositiveMass`. It also keeps two padding-type theorems: `euclideanCoordinateFlux_eq_zero`, a degenerate-case lemma, and `conformalFluxNormalization`, which is algebra on free scalars. The review did not raise these, so they were left alone.

## Build and gate

- `lake build TauCetiRoadmap.PositiveMass.Suggested`: `Build completed successfully (8976 jobs).` The one warning is the `sorry` in `conformalEuclidean_mass` (line 60).
- Gate summary line: `gate PositiveMass: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=1 metadata=0 dirty=0 outside-folder=0 source-material=0 FAIL`
  - The only failure is `depcheck: NOT IN ORDER: PositiveMass (insert it after its last supplier)`. That is the design-stage case, not a defect.
- Depcheck (`--movable`) output:

```
NOT IN ORDER: PositiveMass (insert it after its last supplier)
depcheck: 153 roadmaps, 1037 edges, 1 problem(s)
```

  There are no UPWARD or CYCLE lines.
