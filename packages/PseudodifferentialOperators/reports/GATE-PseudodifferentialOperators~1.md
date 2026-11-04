## H01 (roed-math) — disputed

The cited suppliers exist. UnboundedOperators is its own new-roadmap pull request (folder `TauCetiRoadmap/OperatorTheory/UnboundedOperators`), and its README states UO-D06 "Closed forms and the Friedrichs extension" (line 172 at its head). That section covers each item in the requested interface: closed Hermitian forms over `[RCLike 𝕜]` with a dense continuous injective `j`; `closedFormOperator`, with `j(u)∈dom A` iff some `h` satisfies `q(u,v)=⟨h,j(v)⟩` for every `v`, inner product conjugate-linear in the first slot; witness and shift independence; unitary, restriction and finite-sum transport; and the Friedrichs extension of a semibounded symmetric operator, uniquely specified by the form completion. VariationalMethods is also a new-roadmap pull request; its V5.1 (line 435) is `CompactFormPair.operator`, defined as the specialization of `closedFormOperator`. ComplexKahlerGeometry K5a on main already links both at pinned heads (`TauCetiRoadmap/ComplexKahlerGeometry/README.md` lines 572–573 and 1047–1065), and states there that the Laplace-type operator domain and the maximal weak domain are H².

Edits that make what is consumed explicit:
- P7a no longer cites VariationalMethods V5.1 directly. Old: "K5a already identifies the shifted H¹ form with VariationalMethods V5.1's represented operator … UO-D06 and V5.1 give the same operator". New: the P7a paragraph spells out the UO-D06 contract in prose (domain characterisation, self-adjointness, shift independence, Friedrichs extension as `closedFormOperator` of the form completion). It consumes K5a's identification of `L` with `closedFormOperator` of the H¹ energy form, together with K5a's H²-domain theorem. The Friedrichs identification then comes from P5 smooth density and the uniqueness clause.
- The narrower route proposed in the review is adopted for the transplantation itself. Old: "By UO-D06's unitary/restriction transport and the preceding H² comparison, prove the exact operator-domain identity". New: prove `Jᵢ(H²(Yᵢ))=dom Δ_X∩L²(X)^{Hᵢ}` and extend `Δ_X Jᵢ f=Jᵢ Δ_Yᵢ f` from smooth `f` to H², using continuity of both sides `H²(Yᵢ)→L²(X)`. The form identity `q_X(Jᵢf,Jᵢg)=q_Yᵢ(f,g)` with UO-D06 uniqueness is kept only for the Friedrichs transport.

## H02 (roed-math) — applied

P4: old "show independence of atlas, partition and local quantization modulo smoothing operators". New: independence holds for compatible full local symbols, related on overlaps by the complete coordinate/frame expansions modulo order −∞. Two quantizations of the same principal symbol differ by order m−1.

The review's example is added as acceptance, with the value recomputed. Take y=eˣ and principal symbol ξ²=(dy/dx)²η². Then `−(φ′)²∂_y² = −∂ₓ² + (φ″/φ′)∂ₓ = −∂ₓ² + ∂ₓ`, against `−∂ₓ²`, so the difference is `∂ₓ`, of order 1.

## H03 (roed-math) — applied

P1.0 Bochner paragraph: D* is now the formal adjoint for the canonical Riemannian density of g and the chosen fiber metrics. The metric-connection conclusion (now also stating that the zeroth-order remainder is fiberwise self-adjoint) assumes formal self-adjointness for that density and those metrics.

The negative control is added with recomputed values. On the circle with density `e^(sin x)dx`, `D=∂ₓ` has `D†=−∂ₓ−cos x` and `D†D=−∂ₓ²−cos(x)∂ₓ`. Matching against `−(∂+ω)² = −∂²−2ω∂−(ω′+ω²)` gives `ω=½cos x`, and `ω+ω≠0`, so the connection is not metric.

## H04 (roed-math) — applied

P7: old "Prove these are self-adjoint on H¹". New: "Prove D_P is self-adjoint on `H¹(X;E₀⊕E₁)` and D_Q on `H¹(Y;F₀⊕F₁)`, each on its own factor". A sentence was added saying that the amplified product terms do not have product H¹ as maximal domain, and that the product domain is the later intersection-domain statement.

## H05 (roed-math) — applied

P7 product index: old "Fredholm openness gives equal index for small ε". New: the modifications are blockwise, so D_ε is odd. Openness and local constancy are applied to the even-to-odd blocks `D_ε⁺→D⁺ : H¹(E₀⊠F₀⊕E₁⊠F₁)→L²(E₁⊠F₀⊕E₀⊠F₁)`, and the text notes that the full graded self-adjoint D has index 0. The later comparison with A_χ also now names the even-to-odd block of its quantization.

## H06 (roed-math) — disputed

Neither Mathlib pull request is cited. At the pinned Mathlib, `Mathlib/Analysis/Calculus/VectorField.lean` has no `lieBracket_apply_fun`, so neither change is a supplier. The roadmap's writing rules require timeless text with no pull-request references, and a reference to an open Mathlib pull request would go stale when it merges or closes. P1.0 keeps its implementation assignment, which the review also asks for. The design-context paragraph already says that Mathlib's interfaces are adopted when they land.

## Other repairs (pattern and gate)

`Suggested.lean` failed the gate before any review repair, with 8 sorry'd data definitions and 7 `Mathlib.<submodule>` imports. Changes:
- Imports are now `import Mathlib` plus `TauCeti.Geometry.Manifold.DerivationBundle`.
- Each sorry'd equivalence or operator is restated as a sorry'd existence theorem whose specification pins the object:
  - `exists_smoothCotangentEquiv`, with the `toCotangent ↦ mvfderiv` equation;
  - `exists_derivationEquivSmoothVectorField`, with pointwise agreement with `derivationVectorField`;
  - `exists_inversePrincipalSymbol`, a two-sided inverse at ξ≠0;
  - `exists_quantizeSobolev` and `exists_quantizeUniformOrderZero`, whose action on Schwartz input is the quantization integral `quantizeSchwartzValue`.
- Removed declarations:
  - `symbolSubmodule` and `quantizeSchwartz`, whose only content was closure and linearity;
  - the complexified derivation equivalence and its scalar scaffolding, because the `δ(u+iv)` specification has no carrier at the pins (no Re/Im on `C^∞⟮I,M;𝓘(ℝ,ℂ),ℂ⟯`).
- The module docstring now lists the headline theorems that cannot be stated at the pins and the carrier each lacks.

No README name pointed to a removed declaration (`readme-ids-missing=0`). The README does not yet name the Lean declarations in API bullets; this is a known gap that was left as it was.

Signature check: every declaration was put under `#check @name` (temporarily appended to the module and elaborated once, then removed). Every elaborated type keeps its standing binders `[FiniteDimensional ℝ E] [IsManifold I ∞ M] [T2Space M] [BoundarylessManifold I M]` and the two `[FiniteDimensional ℂ _]` binders. Nothing changed as a result.

Ownership: UO-D06 is owned by UnboundedOperators and K5a's realization by ComplexKahlerGeometry. This roadmap keeps only the smooth-core/Friedrichs comparison and its finite-cover transport. Ownership against open pull requests was checked only for these suppliers, against the sibling checkouts.

## Adversarial pass (changed statements)

| Statement | Instances | Values | Result |
|---|---|---|---|
| P4 independence needs full symbols | interval, y=eˣ, symbol ξ² | `−∂ₓ²+∂ₓ` vs `−∂ₓ²`, difference `∂ₓ` (order 1 ≠ −∞) | qualified; example added |
| P1.0 Bochner metric ⇐ formal s.a. | S¹, density `e^(sin x)dx`; Riemannian density | ω=½cos x, ω+ω=cos x≠0; with dx: D†D=−∂², ω=0 | density hypothesis added |
| P7 chiral index | graded self-adjoint D | ind D = dim ker D − dim ker D* = 0; D⁺ carries the index | blocks named |
| P7a H² extension of intertwining | dim X=1 circle, Q=ℤ/2 rotation by π | J f=2^(−1/2)π*f; ‖Jf‖²=‖f‖² since ∫_X|π*f|²=2∫_Y|f|² | consistent |
| P7a Friedrichs = L−1 | form q on C∞, lower bound 0 | completion norm (q+‖·‖²)^(1/2)=H¹ norm; closedFormOperator shift by 1 gives L−1 | consistent |
| `exists_smoothCotangentEquiv` | dim 0 (discrete M); ℝ | dim 0: f=f·1_{x}∈I_x², cotangent 0 = T_x*M; ℝ: I/I² ≅ ℝ via f′(x) | true |
| `exists_derivationEquivSmoothVectorField` | dim 0 | derivations vanish (D f = D(f·1_x) = 0 at x), sections of zero bundle 0 | true |
| `exists_inversePrincipalSymbol` | n=0; dim V≠dim W | n=0: ξ≠0 vacuous, b=0 works; dim mismatch: not elliptic for n≥1, so the hypothesis is vacuous; homogeneity (t^m a)⁻¹=t^(−m)a⁻¹ | true |
| `exists_quantizeSobolev` | m=0, a=Id constant cut off in x; n=0 | multiplication by a compactly supported smooth function, bounded on every H^s; n=0: a constant map | true |
| `exists_quantizeUniformOrderZero` | a(x,ξ)=e^{ix·0}·c, uniform | constant multiplier, norm ‖c‖ on L² | true |

## Build and gate

`lake build TauCetiRoadmap.PseudodifferentialOperators.Suggested`: Build completed successfully (8981 jobs), with 9 `declaration uses sorry` warnings.

Gate (commit 48066392): `gate PseudodifferentialOperators: … sorry-data=0 … imports=0 mathlib-subimports=0 no-import-mathlib=0 … readme-ids-missing=0 … depcheck=1 … dirty=0 … FAIL`. The only remaining problem is `depcheck: NOT IN ORDER: PseudodifferentialOperators (insert it after its last supplier)`, which means the roadmap is still at the design stage and is not yet in the merge order.

Depcheck (`--movable`):
```
NOT IN ORDER: PseudodifferentialOperators (insert it after its last supplier)
depcheck: 148 roadmaps, 1002 edges, 1 problem(s)
```
It shows no UPWARD or CYCLE line.

No new sources were cited, so `needs-references.toml` was not written.
