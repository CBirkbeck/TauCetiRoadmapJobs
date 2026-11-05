# GATE-CategoricalOperatorAlgebras~1: answers to human review

Points H01–H05 are the first review (at f49e251). H06 is the author's reply. H07–H10 are the second review (at e9c4588). The points were checked against the PR head c8831bc. All the substantive repairs the reviews ask for are already in the head (commits e9c4588 and c8831bc). This round I recomputed each one; the values are in the table below. This round's commit, 84eff3a, changes one CA10 sentence about H09 and fixes the gate failures already present in the head (listed under "Build and gate").

## H01 (roed-math) — applied
CA1b now restricts the conjugation bi-involution to normal scalar-Hilbert correspondences. The general right C*-correspondence bicategory keeps only its dagger on 2-cells, and reversed C*-correspondences are built only on HilbertModules H3's imprimitivity subbicategory, using both inner products (`TauCetiRoadmap/CategoricalOperatorAlgebras/README.md`, CA1b, final paragraph). The C([0,1]) obstruction is correct: End(X) = C([0,1]) has no nontrivial projections, whereas π(B)′ is a von Neumann algebra. The README no longer claims what that example refutes.

## H02 (roed-math) — applied
At the start of CA3, the bicategory is required to be locally unitarily Cauchy complete in the finite sense defined in CA1a (finite orthogonal sums and unitary splittings of self-adjoint idempotents). This is kept separate from CA9's W*-Cauchy completeness. CA3 checks the hypothesis for the CA1b correspondence bicategories, splits the balanced projection inside the original Hom category, and proves that QSys(C) again satisfies the hypothesis. The Rep(ℤ/2) counterexample (rank-5 range `2·1 ⊕ 3·s` missing from the subcategory) is no longer covered by the stated hypotheses.

## H03 (roed-math) — applied
CA9 now uses the left-twisted model `_ρH₀` with `a·ξ=ρ(a)ξ`, t acting by left multiplication, and `ρ⊗_rev σ=σ∘ρ`. Recomputed: `t(ρ(a)ξ)=σ(a)tξ`, so t is a complex-linear map `_ρH₀→_σH₀`. On the fusion `b⊗η↦σ(b)η`, the action of t⊗s is `σ′(t)s = sσ(t)`, which matches the stated tensor intertwiner. The bridge to C^rev turns `X⊗_rev Y=Y⊗X` into Tomatsu's `ρ∘σ` and `tρ(s)`, with cocycle `c_(X,Y)=u_(Y,X)†`.

## H04 (roed-math) — applied
CA6 defines `Z†(C)` as the full subcategory of the native `Center` whose half-braiding components are unitary. It records that native `HalfBraiding` only requires isomorphisms, and that unitarity is preserved by dagger, tensor and duality by mates.

## H05 (roed-math) — applied
CA9 states approximate unitary equivalence by predual-norm convergence. It proves this equivalent to a single unitary u∈M^ω with `u ρ₁(ψ^ω) u*=ρ₂(ψ^ω)` for every ψ∈M_*, where `ρ_i(ψ^ω)=ψ^ω∘φ_(ρ_i)^ω` and `(ufu*)(x)=f(u*xu)`. It says explicitly that this is not pointwise conjugacy on M^ω.

## H06 (kim-em) — answered
Each claimed repair is present at the PR head: CA1b (H01), CA1a's finite local Cauchy completeness, the CA3 closure of QSys(C) and the CA4 input (H02), the CA9 left-twisted model and C^rev bridge (H03), the CA6 unitary center (H04), and the CA9 ultrapower criterion (H05). The checks are under H01–H05.

## H07 (roed-math) — applied
Head c8831bc pins `ρ̃(u_t)=d_ρ^(it)(D(φ∘φ_ρ):Dφ)_t u_t`, `ρ̃=θ_(+log d_ρ)∘ρ̌` and `mod(ρ)=θ_(log(d_ρ/r))` under VonNeumannAlgebras V11's positive convention `θ_s(u_t)=exp(ist)u_t`, `Tr∘θ_s=exp(s)Tr` (confirmed at V11's open head). It translates the negative-convention source formulas explicitly and adds the II∞ inner-amplification regression. Recomputed: `τ∘φ_ρ=n⁻¹τ`, so `ρ̌(u_t)=n^(-it)u_t` and `θ_(log n)(n^(-it)u_t)=u_t=ρ̃(u_t)`, giving module θ₀. This agrees with `log(d/r)=0`, so both signs are corrected, not just one.

## H08 (roed-math) — applied
Head c8831bc pins `p_s(e)e=e=ep_t(e)`, `⟨e,e⟩=p_t(e)`, left creation `L(e)ξ=e⊗ξ`, `a=(μ(s(ε'))/μ(t(ε')))^(1/4)` and `τ_μ(p_v)=μ(v)`, and adds the one-edge regression. Recomputed for x=p_vT_εp_w: `xΩ_w=a e`, so `E(x†x)=a²p_w`, and `x†Ω_v=a⁻¹f`, so `E(xx†)=a⁻²p_v`. Traciality forces `a⁴=μ(v)/μ(w)`. With μ=(16,1), a=2 gives 4 = 4 and a=1/2 gives 1/4 versus 64. Reversing the orientation sends a to a⁻¹ and leaves T_ε unchanged. a⁴ appears nowhere else in the README.

## H09 (roed-math) — applied
CA6 names `F=Forget∘Φ` separately from the central lift Φ and puts the connectedness characterization (`P[0]≅1_V`) on full faithfulness of F. CA10 states the same hypothesis on the composite. The Vec_(ℤ/2) example checks out: Φ=id is fully faithful, but the right adjoint of Forget sends 1_D to `(e,triv)⊕(e,sign)`. This round also rewrote the garbled CA10 sentence "prove Lemma 3.7 of … paper functor `M→Z_C(…)` fully faithful" as "prove the functor `M→Z_C(C⊠_(Z(C)^rev)M)` fully faithful (Henriques–Penneys–Tener, Lemma 3.7)".

## H10 (roed-math) — applied
CA2a now requires an equivalence of chosen dual functors to make unitary, and compatible with the evaluations and coevaluations, the canonical monoidal comparison those data determine. Uniqueness is asserted only for this duality-compatible comparison, not among arbitrary unitary monoidal automorphisms. Such automorphisms do exist: on Vec_(ℤ/2), the sign grading character gives a nontrivial unitary monoidal automorphism of the identity functor.

## Adversarial pass (recomputed statements)

| statement | instance | computed values | result | change |
|---|---|---|---|---|
| CA9 `ρ̃=θ_(+log d)∘ρ̌` | II∞, inner ρ with n=2,3 isometries | `ρ̌(u_t)=n^(-it)u_t`; `θ_(log n)` multiplies by `n^(it)`; `ρ̃(u_t)=u_t` | consistent | none |
| CA9 `mod=θ_(log(d/r))` | II∞, τ∘φ_ρ=r⁻¹τ, dimension d | `ρ̃(u_t)=(d/r)^(it)u_t=θ_(log(d/r))(u_t)` | consistent | none |
| CA9 rank-r definition | inner ρ, r=n | `(ψ∘φ_ρ)v_i = n⁻¹ v_iψ` exactly | rank n = d | none |
| CA7 a | μ(v)=16, μ(w)=1 | a=2: 4, 4; a=1/2: 1/4, 64 | consistent | none |
| CA7 orientation reversal | swap ε',ε'' | a'=a⁻¹; T_ε identical | consistent | none |
| CA9 End_rev fusion | `b⊗η↦σ(b)η` | left action σ∘ρ; t⊗s ↦ σ′(t)s=sσ(t) | consistent | none |
| CA9 Tomatsu bridge | reversal | σ⊗ρ=σ∘ρ, s⊗t=sσ(t), c=u_(Y,X)† | consistent | none |
| CA6 Φ vs F | D=Vec_(ℤ/2), Φ=id | right adjoint of Forget at 1_D = 2 simples ≠ 1_V | hypothesis on F needed, present | CA10 sentence reworded |
| `SymmetricSelfDuality.transport` | composite i≫s | unitary: i s s† i† = 1, s† i† i s = 1; symmetry: `(i⊗i)` pre-composed with the X′ equation | true; now proved in Lean | sorry removed |

## Build and gate

The head failed the gate on issues that were already there before this round. This round fixed them; none was raised by a reviewer:
- the eight `Mathlib.*`/TauCeti import lines became `import Mathlib` plus `TauCeti.CategoryTheory.Monoidal.Rigid.Basic`;
- the sorry'd def `SymmetricSelfDuality.transport` is now fully proved;
- the PR-number links to Mathlib in the References were removed;
- `ℝ_{>0}` became the positive reals `ℝ>0` in CA2a.

The scratch `#check @name` signature pass was not run: the only Lean command this job may use is the module build, and the module's declarations and binders are unchanged apart from the proof body.

`lake build TauCetiRoadmap.CategoricalOperatorAlgebras.Suggested`: Build completed successfully (8978 jobs); 4 `declaration uses sorry` warnings (balancedProjector_selfAdjoint, balancedProjector_idempotent, scaledAlgebraMorphism_unit, scaledAlgebraMorphism_mul).

Gate:
`gate CategoricalOperatorAlgebras: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=1 metadata=0 dirty=0 outside-folder=0 source-material=0 FAIL`
The only remaining failure is `depcheck: NOT IN ORDER: CategoricalOperatorAlgebras (insert it after its last supplier)`.

Depcheck (`--movable`):
```
NOT IN ORDER: CategoricalOperatorAlgebras (insert it after its last supplier)
depcheck: 148 roadmaps, 1000 edges, 1 problem(s)
```
There is no UPWARD or CYCLE line. The roadmap is not yet in the merge order, which the brief treats as not a defect at this stage. The README's analytic suppliers (VonNeumannAlgebras, Subfactors, HilbertModules, CStarAlgebras, TemperleyLiebOperatorAlgebras, OperatorKTheory) are not on main and not in ORDER.txt. They are open new-roadmap pull requests. Whether they all come from other authors (the brief's condition for depending on open PRs) was not checked this round; no review point concerned them. Ownership against open pull requests was not re-examined beyond the points raised. No sources were fetched; nothing was added to `needs-references.toml`.
