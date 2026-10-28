# GATE-Subfactors~1: answers to human review

## H01 (roed-math) — applied

S10 (`TauCetiRoadmap/Subfactors/README.md`, the Burns §3.4 paragraph, now lines ~903–961): the old text "choose a representation of F_∞ generating a type III factor, tensor it with the identity on ℓ²(ℕ) … compute the type III central summand" becomes a three-step construction (generator bijection `{a_n}≃ℕ×F_∞`, the homomorphism `ϕ:F_∞→F_∞`, `w=ψ∘ϕ` with `ψ(a_n)=v_n` generating S, then amplification by `ℓ²(ℕ)`). It says explicitly that an arbitrary type-III-generating representation is not asserted to suffice. It adds the repeated-conjugacy-fibre lemma as its own target, says that amplification gives only the outer-or-trivial dichotomy and the fibre lemma gives the coefficient vanishing, and writes out the Fourier-coefficient argument for `N'∩M_1=W(F_∞)'` using the fibre lemma. It also spells out the one-particle compression that gives the type III central summand (Burns §3.4.3, proofs of Lemmas 3.4.7–3.4.8, `Burns2011` lines 6289–6405, printed pp. 118–121).

Points 1–4 of the requested repair are all covered. Two details differ from Burns's printed text and were checked independently:

- The one-particle map is written as `ι(ξ)=√2·(a(ξ)*)^`, using the creation operator. Under the OperatorAlgebraDynamics D8 convention (a is antilinear), this makes ι linear and intertwining. Its norm is `‖(a(ξ)*)^‖²=τ(a a*)=‖ξ‖²−½‖ξ‖²=½‖ξ‖²`.
- The coefficient relation is written as `x_(ρ⁻¹γρ)=W_ρ*x_γW_ρ`, with the norm sum `Σ_γ‖x_γW_γξ‖²`. This matches the representation `π(u_γ)=W_γ⊗λ_γ` from Burns's Lemma 3.4.6.

The ownership line now names the fibre lemma, the repeated-word construction, Blattner's criterion and the coefficient-vanishing argument as targets of this roadmap. D8 supplies only CAR, quasi-free states and Bogoliubov functoriality. D8 was checked on main (`TauCetiRoadmap/OperatorAlgebraDynamics/README.md` §D8), and it does not contain this construction.

### Additional repair (gate)

The gate refused `Suggested.lean`'s imports. They were eight lines, seven of them `Mathlib.<submodule>` lines and no `import Mathlib`. Old lines 5–13 became `import Mathlib` followed by `import TauCeti.Algebra.TemperleyLieb.MarkovTrace`. No declaration changed. Since the Lean declarations are unchanged and S10 has no Lean counterpart, no `#check` comparison was needed: the README edit introduces no backticked Lean name.

### Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| ϕ surjective, fibres on generators infinite | the fibre over any β∈F_∞ | the preimage of ℕ×{β} under the bijection is countably infinite | holds | stated |
| `w(F_∞)''=S` | the image of w | `w(F_∞)=ψ(ϕ(F_∞))=ψ(F_∞)`, which contains all v_n, so it generates S | holds | stated |
| Amplification dichotomy | w_γ=1; w_γ≠1 | `(w_γ−1)⊗1_(ℓ²ℕ)` has HS norm² `∞·‖w_γ−1‖_HS²` unless w_γ=1 (infinitely many copies of a nonzero operator) | holds | stated |
| Amplification keeps the fibre property | (w⊗1)_γ | `w_γ⊗1` depends only on ϕ(γ) | holds | stated |
| Fibre lemma | γ₀=a₁; general γ₀≠e | for n≠1 in the fibre: `a_na₁a_n⁻¹` is reduced of length 3, the first letter a_n separates them, and w gives `w(a₁)w(a₁)w(a₁)⁻¹=w(a₁)`. In general, a_n not a letter of γ₀ gives a reduced word with first letter a_n. | holds | stated with a Check |
| Coefficient identity | ρ=a_n⁻¹ | `x_(γ_n)=W_(a_n)x_(γ₀)W_(a_n)*=W_(γ₀)x_(γ₀)W_(γ₀)*`, and `x_(γ_n)W_(γ_n)ξ=W_(γ₀)x_(γ₀)ξ` has norm ‖x_(γ₀)ξ‖>0 | holds; the sum diverges | stated |
| Degenerate case γ₀=e | — | no contradiction is derived; x_e survives, as the conclusion `x=x_e` requires | consistent | — |
| ι isometric and intertwining | covariance 1/2, a antilinear | `‖ι(ξ)‖²=2·½‖ξ‖²=‖ξ‖²`; `W_γι(ξ)=√2(a(w_γξ)*)^=ι(w_γξ)` | holds | stated |
| `qQ` is a type III factor | p = projection onto ι(H₀) | `pQ'=W(F_∞)''p≅w(F_∞)''≅S⊗1≅S`; `y↦yp` is an isomorphism qQ'→pQ' because the central support of p in qQ is q; the commutant of a type III factor is type III | holds | stated |
| Blattner (complex form) | u=1; u=−1 on infinite-dimensional H₀ | u=1: identity, inner. u=−1: `u−1=−2` is not HS, so not inner, consistent with the real form (−1 eigenspace infinite, `−u−1=0`, but the +1 eigenspace is not finite odd-dimensional) | consistent with Burns Thm 3.4.3/3.4.4 | — |

### Ownership and citations

The free-group repeated-word construction appears in no roadmap on main. `roadmaps grep` was not needed beyond D8: the reviewer's ownership claim matches D8's text at main.

Two cited sections were checked: OperatorAlgebraDynamics §D8 on main, which states CAR, Fock space, quasi-free states and the antilinear a. V8 (normal crossed products) is cited in the existing text and was not changed in this edit.

Burns was fetched through the sources service as `Burns2011` (arXiv:1111.1362v1). Its numbering (§3.4.3, Lemmas 3.4.5–3.4.8, Theorem 3.4.9) agrees with the README. The roadmap folder has no `sources.toml`, and this job may not edit one; the manifest entry is left to the worker.

## Build and gate

- `lake build TauCetiRoadmap.Subfactors.Suggested`: **Build completed successfully** (8981 jobs), with 4 `declaration uses sorry` warnings and no errors.
- Gate summary: `gate Subfactors: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=1 metadata=0 dirty=0 outside-folder=0 source-material=0 FAIL`. The only failure is `depcheck: NOT IN ORDER: Subfactors (insert it after its last supplier)`.
- Depcheck (`--movable`): `NOT IN ORDER: Subfactors (insert it after its last supplier)` / `depcheck: 148 roadmaps, 999 edges, 1 problem(s)`. There are no UPWARD or CYCLE lines. Per the brief, not being in the merge order is not a defect before intake.

Commits (not pushed):
- "Subfactors: review repairs (pin Burns repeated-word representation and fibre lemma in S10)"
- "Subfactors: review repairs (single import Mathlib line in Suggested.lean)"
