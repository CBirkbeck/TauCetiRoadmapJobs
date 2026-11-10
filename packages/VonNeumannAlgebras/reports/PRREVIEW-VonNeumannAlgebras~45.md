# Review of VonNeumannAlgebras (pull request #1041 at 4fbdf84)

**Verdict:** needs changes

## Previous findings (review of d0aeb0c)

- **R01 (layers 2 and 7 needing layers 4 and 8): repaired.** The three abelian targets now close Layer 4: "**V4.AbelianClassification — separably acting abelian algebras.**" (`README.md:1639`), V4.AbelianLocalizable (`:1713`), V4.AbelianRepresentationMultiplicity (`:1750`), with their Checks, the Layer 4 example (`:1797–1798`) and the Dependencies bullets (`:1808–1815`). "**V8.GroupApplications — index computations for group factors.**" follows V8.SubgroupCosets (`:2503`, `:2507`), and Layer 7 now ends "This layer owns elementary dimension, index and bimodule theory; Subfactors owns its basic constructions…" (`:2430–2432`). "How to read the build" carries both moves (`:423–432`). In `Suggested.lean`, `multiplicationAlgebra` (`:278`) and `exists_starAlgEquiv_multiplicationAlgebra` (`:290`) sit under the Layer 4 comment (`:207`), and the docstring's Layer 4 entry carries the abelian classification (`:43–49`). `roadmaps grep 'V2\.Abelian|V7\.GroupApplications'` matches nothing on main or at the open heads.
- **R02 (bullets in References that are not references): repaired.** The Hilbert–Schmidt bullet, the two Mathlib-file bullets, the design-discussion bullet with its instruction, the `finite-product design` link and the "UO" clause are gone. `:909` now ends "It is part of V2's completed-tensor/L² theory." The two blank lines before Layer 13's Examples are removed.

## R01 (P2) — The spectral calculus has two owners: Tau Ceti already implements what V2.BorelCalculus and V10.ClosedOperators set out to build

**Location.**
- `TauCetiRoadmap/VonNeumannAlgebras/README.md:31–39`, Scope: "so nothing here is taken from it: the bounded Borel calculus and projection-valued measure … (V2.BorelCalculus); … and the resolvent, Cayley transform and spectral measure of a self-adjoint `LinearPMap` operator (V10.ClosedOperators) are owned here".
- `:779–786`, V2.BorelCalculus: "construct … the finite regular Borel measure μ_ξ … by polarization the complex measures μ_(ξ,η) … define π(f) as the operator of the bounded sesquilinear form".
- `:2818–2828`, V10.ClosedOperators.
- "From Tau Ceti" (`:243–338`) names none of the modules below.

**Claim.** The pinned Tau Ceti (2fd255d) already implements the projection-valued-measure, bounded Borel and self-adjoint Cayley/resolvent layer. These are the objects SelfAdjointSpectralTheory plans in its Parts B and D, the roadmap on main which the Scope sets aside to avoid a cycle. The README plans those objects again from `RealRMK.rieszMeasure` up and declares itself their owner. So each object has two owners, the pin and this roadmap. Consuming the library creates no roadmap edge, so the cycle the Scope guards against does not arise.

**Witness** (Tau Ceti 2fd255d):
- `StarAlgHom.representationDiagMeasure` (`TauCeti/Analysis/InnerProductSpace/ProjValMeasure/Representation/DiagonalMeasure.lean:94`)
- `StarAlgHom.representationPolarizedMeasure` (`…/Representation/PolarizedMeasure.lean:80`)
- `StarAlgHom.representationBorelOperator` (`…/Representation/BorelOperator.lean:112`)
- `TauCeti.ProjValMeasure` (`…/ProjValMeasure/Basic.lean:91`)
- `LinearPMap.cayley` (`TauCeti/Analysis/Normed/Operator/LinearPMap/Cayley.lean:64`)

What each part of the two targets restates:

| README sentence | Pinned declaration (file:line) |
| --- | --- |
| μ_ξ with `∫f dμ_ξ=⟨ξ,π(f)ξ⟩`, mass `‖ξ‖²`, `∫|f|²dμ_ξ=‖π(f)ξ‖²` (`:781–783`) | `StarAlgHom.representationDiagMeasure`, `integral_representationDiagMeasure`, `integral_norm_sq_representationDiagMeasure` (`…/Representation/DiagonalMeasure.lean:94, 120, 178`); for a normal operator `ContinuousLinearMap.diagMeasure` (`…/BorelCalculus/DiagonalMeasure.lean:66`) |
| μ_(ξ,η) by polarization, `⟨ξ,π(f)η⟩=∫f dμ_(ξ,η)`, bounded variation (`:783–784`) | `StarAlgHom.representationPolarizedMeasure`, `integral_representationPolarizedMeasure`, `variation_representationPolarizedMeasure_univ_le` (`…/Representation/PolarizedMeasure.lean:80, 122, 225`) |
| π(f) for bounded Borel f as the operator of the form (`:784–786`) | `StarAlgHom.representationBorelOperator`, `inner_representationBorelOperator`, `representationBorelOperator_ofContinuousMap` (`…/Representation/BorelOperator.lean:112, 127, 134`) |
| PVM laws, strong countable additivity (`:792–793`) | `TauCeti.ProjValMeasure` (`…/ProjValMeasure/Basic.lean:91`), `hasSum_proj_of_pairwise_disjoint` (`:524`) |
| vector identity, `π(f)ξ=0` iff `f=0` μ_ξ-a.e. (`:794–795`) | `TauCeti.ProjValMeasure.norm_sq_integral_apply`, `integral_apply_eq_zero_iff` (`…/ProjValMeasure/Integral.lean:305, 318`) |
| null filter, `π(f)=π(g)` iff `f=g` off a P-null set (`:796–797`) | `TauCeti.ProjValMeasure.ae`, `proj_eq_zero_iff_compl_mem_ae` (`…/Null.lean:42, 88`), `integral_eq_integral_iff` (`…/DominatedConvergence.lean:63`) |
| bounded convergence gives strong convergence (`:799–802`) | `TauCeti.ProjValMeasure.tendsto_integral_apply_filter_of_dominated_convergence` (`…/DominatedConvergence.lean:77`) |
| nonreal λ in the resolvent set, `‖(T−λ)⁻¹‖≤|Im λ|⁻¹` (`:2820–2823`) | `IsSelfAdjoint.mem_resolventSet_of_im_ne_zero`, `IsSelfAdjoint.norm_resolvent_le` (`TauCeti/Analysis/InnerProductSpace/LinearPMap/Resolvent.lean:70, 83`) |
| Cayley transform unitary, 1 not an eigenvalue, `range(1−U)` the domain with `T=i(1+U)(1−U)⁻¹` (`:2824–2826`) | `LinearPMap.cayley` (`…/Normed/Operator/LinearPMap/Cayley.lean:64`), `cayley_apply_eq_self_iff` (`:98`), `mem_graph_iff_exists_cayley` (`:80`); `IsSelfAdjoint.cayley_mem_unitary` (`…/InnerProductSpace/LinearPMap/Cayley.lean:79`) |
| the image of P_U under the inverse Cayley map (`:2843`) | `TauCeti.ProjValMeasure.map`, `integral_map` (`…/ProjValMeasure/Map.lean:40, 87`) |

The conventions agree, so consuming changes no Check:
- Tau Ceti's `cayley = 1 + 2i·R(−i)`, with `R(z)=(z−T)⁻¹`, is `(T−i)(T+i)⁻¹`. At T=0 both give −1 (`:2869`). For multiplication by t both give `(t−i)/(t+i)` (`:2861`).
- `representationPolarizedMeasure ψ ξ` takes the value `⟪ψ,P(B)ξ⟫`, conjugate-linear in ψ. On `a=diag(0,1)`, `ξ=e₁+ie₂`, `η=e₂` both conventions give `−iδ₁` and `∫z dμ=−i` (`:821–824`).

What the pin does not have stays here:
- multiplicativity of `f↦π(f)`, so that `P(B)=π(1_B)` is a `TauCeti.ProjValMeasure` with `π(f)=P.integral f`;
- `‖π(f)‖` as the P-essential supremum;
- the commutant law and membership in W*(a);
- the inverse Cayley correspondence;
- the spectral measure of T, the multiplier-form theorem and the unbounded polar decomposition.

**Repair.**
1. Scope (`:31–39`): say that the projection-valued-measure carrier with its integral, null filter, vector identity and dominated convergence; the Riesz and polarized measures and the Borel operator of a representation of `C(K)`; and the resolvent estimates and Cayley transform of a self-adjoint `LinearPMap` are implemented in Tau Ceti at the pin and are consumed from there. Then say that V2 and V10 own the remainder listed above. SelfAdjointSpectralTheory stays a consumer, since nothing is taken from it.
2. From Tau Ceti: add the declarations of the table, with their files.
3. V2.BorelCalculus (`:779–817`): replace "construct…/define…" by consumption of the first three rows. Own multiplicativity and the PVM `P` as a `TauCeti.ProjValMeasure` with `π(f)=P.integral f`. Then take the vector identity, the null filter and bounded convergence from rows 5–7. Keep the essential-supremum norm, the commutant law and the normal-operator case (through `ContinuousLinearMap.diagMeasure`). Rewrite its *Needs:* line to match.
4. V10.ClosedOperators (`:2818–2828`, `:2840–2844`): consume rows 8–10 and keep the inverse correspondence, the spectral measure, the multiplier form, the polar decomposition and the derivative examples. Update the *Needs:* lines at `:2852` and the Layer 10 Dependencies at `:3411`.

## R02 (P3) — Tau Ceti's GNS implementing group is restated, and its KMS separating theorem is not cited

**Location.**
- `README.md:1427–1428`, V4.Normality: "Prove state-preserving automorphisms are canonically unitarily implementable in GNS."
- `:2041–2042`, Layer 6: "if Ω is a cyclic vector for M⊆B(H) whose vector state is tracial, then Ω is separating".

**Claim.** The first sentence is a pinned theorem. The second step follows from two pinned theorems. Neither module appears in the supplier contract.

**Witness.**
- `TauCeti.CStarAction.gnsImplementingGroup` (`TauCeti/Analysis/CStarAlgebra/Action/Covariant/GNS.lean:85`): for a positive functional invariant under a point-norm continuous action, the strongly continuous unitary group `[b]↦[α_g b]` (`:103`, `:110`).
- `IsKMSState.eq_zero_of_apply_toPreGNS_one_eq_zero` (`…/Action/KMS/Separating.lean:114`).
- `isKMSState_zero_iff` (`…/KMS/Basic.lean:237`): the 0-KMS states are the tracial states.

**Repair.**
1. At `:1427–1428`, consume `TauCeti.CStarAction.gnsImplementingGroup` and `TauCeti.CStarAction.gnsCovariantRepresentation` (`:138`) for ℤ acting by the powers of the automorphism, with the discrete topology. Own only the von Neumann-algebra consequences.
2. At `:2041–2042`, obtain the separating property from the two KMS theorems at β=0, through V0's GNS uniqueness and Layer 1's C*-structure on M.
3. Add both modules to "From Tau Ceti".

Test case for item 1: on `M₂(ℂ)` with `φ=tr/2` and `α=Ad(diag(1,−1))`, φ∘α=φ. The implementing unitary is `[b]↦[ubu*]`, with `⟨[a],U[b]⟩=φ(a*ubu*)`, which is `inner_gnsImplementingGroup_apply_coe` (`:119`).

## R03 (P3) — A target heading renders inside a Check bullet, and a stray article

**Location.**
- `README.md:512–513`: "  the GNS dimension separates the two states." followed directly by "**V0.SeparableFaithful — separable carriers and the ℓ² refinement.** For a".
- `:1726`: "and the V2's given-finite-measure multiplication/MASA theorem".

**Witness.**
- Line 513 is a lazy continuation line. CommonMark (markdown-it 3.0.0) renders the whole V0.SeparableFaithful paragraph (`:513–528`) inside the fourth `<li>` of the Layer 0 Checks.
- The "the" at `:1726` came in with this pull request's relabelling ("the preceding" became "the V2's").

**Repair.** Insert a blank line before `:513`. At `:1726` write "and V2's given-finite-measure multiplication/MASA theorem".

## Verified sound

**Gate, dependencies, build (run this round).**
- `tauceti-roadmap gate … VonNeumannAlgebras --base origin/main`: every counter 0, `OK`. The worker's gate at this head adds `build=0`.
- Dependency check: no UPWARD, CYCLE or `moved:` line.

  ```text
  depcheck: 233 roadmaps, 2259 edges, 0 problem(s)
  ```

- `lake env lean TauCetiRoadmap/VonNeumannAlgebras/Suggested.lean`: exit 0, 32 "declaration uses `sorry`" warnings, nothing else.
- One-tactic probe on a scratch copy (`first | rfl | simp | aesop | decide | infer_instance | trivial` in place of each of the 32 `sorry`s): 32 errors at 32 distinct places and no remaining `sorry`, so none closes. No padding.
- 57 declarations, 741 lines, one module docstring, `theorem` only, no `set_option`, no sorry'd data. The worker's elaborated signatures report no lost binder. The separability and nontriviality hypotheses of `exists_starAlgEquiv_multiplicationAlgebra`, `isInjective_iff_isHyperfinite`, both uniqueness theorems and `nonempty_starAlgEquiv_spatialTensor_of_isTypeIIInfinity` are in each declaration's own signature.
- `git diff --stat origin/main...HEAD` outside the folder: empty. The pins are Tau Ceti `2fd255d9` and Mathlib `1b1ccf4b`, checked against `.lake/packages` with `git rev-parse`.

**Seeded sample, read at the locators.**
- 13.1, `tomiyama`:
  - hiai-lectures line 2666 (p. 55): Theorem 6.5, a norm-one projection E of a C*-algebra onto a C*-subalgebra satisfies (ii) bimodularity and (v) complete positivity of Theorem 6.4 (lines 2596, 2602). The proof ends on p. 56 (line 2695). Printed page equals PDF page.
  - peterson-notes line 3948 (p. 98): Theorem 6.2.1, unital A and B, `E|B=id`, `‖E‖≤1`, complete positivity included.
  - anantharaman-popa line 13597 (PDF 320 = p. 314): Appendix A.4, Theorem A.4 at line 13610.
- 13.1, `IsInjective`: anantharaman-popa line 7191 (PDF 167 = p. 161), Definition 10.2.1 (footnote at line 7218: "or equivalently a norm-one projection"). Line 7198, Proposition 10.2.2 (iii): every representation, hence representation independence.
- 13.2, Følner and hypertrace:
  - line 7269 (p. 163), Proposition 10.2.5, amenable iff hypertrace;
  - line 7325 (p. 164), Theorem 10.2.8, Powers–Størmer. With `a=x²`, `b=y²` it is the README's `‖a^(1/2)−b^(1/2)‖₂²≤‖a−b‖₁`;
  - line 7333 (pp. 164–165), Theorem 10.2.9 (2), positive finite-rank T with `‖T‖_(2,Tr)=1`, conditions (10.1) and (10.2), equal to `:4696–4699`;
  - line 7413 (p. 166), Theorem 10.3.1, projection form with no trace clause, since line 7405 says (10.2) is unnecessary for II₁ factors;
  - line 7532 (p. 168), Theorem 10.3.4.
- 13.2, hyperfiniteness and the uniqueness theorems:
  - lines 7685 and 7697 (p. 173), Definitions 11.1.1–11.1.2; line 7702, Theorem 11.1.3;
  - line 8294 (p. 186), Theorem 11.2.2, with (3) at line 8298 the increasing sequence with `(∪Qₙ)''=M` and the same unit, which is `IsHyperfinite`;
  - lines 8358 and 8376 (p. 188), Remark 11.2.3 and Corollary 11.2.4;
  - line 8397 (p. 189), the Notes crediting Connes ("the converse being immediate");
  - line 2276 (PDF 54 = p. 48), Definition 2.6.6.
- 13.2, other sources:
  - peterson-notes line 4146 (p. 103), Theorem 6.3.8;
  - hiai-lectures line 327 (p. 9), §1.8 with the sequential AFD definition;
  - jones-vna line 3380 (pp. 107–108), §16.2;
  - haagerup-1989 line 52 (p. 265) and line 1177 (p. 303), Theorem 6.1, with `σ^φ_(t₀)=id`;
  - haagerup-2016 lines 49 and 52 (p. 2), Theorems 1.1–1.2;
  - connes-feldman-weiss lines 265, 281, 336, 382, 480 and 520, Definitions 5–6, Proposition 7, Lemmas 8–9 and Theorem 10. Proposition 7 gives only the projection ⇒ mean direction, and the README owns the converse as a route;
  - anantharaman-popa line 9233 (PDF 214 = p. 208), §12.5.
- All agree with `README.md:4501–4557` and `:4558–4922` and with the Layer 13 docstrings of `Suggested.lean:664–741`.

**Other locators opened.**
- anantharaman-popa: Theorems 6.4.1 (line 4268, p. 93) and 6.4.4 (line 4341, p. 95); Theorem 2.5.5 and Remark 2.5.7 (lines 1983 and 2042, pp. 42–43); Definition 8.3.1 (line 5742, p. 124); Theorem 7.1.1 (line 4465, p. 99); Theorem 15.2.3 (iv) and Remarks 15.2.2 (lines 11529–11535 and 11513, p. 262).
- peterson-notes: Theorem 4.9.4 (line 3080, p. 78), 5.1.6 (line 3271, p. 84), 4.7.10 (line 2844, p. 72), Proposition 4.2.2 (line 2325, p. 60), Corollary 4.1.7 (line 2248, p. 58).
- jones-vna: EP10 and the remark after it (lines 713–726, p. 23); Theorem 8.1.15 (line 1672, p. 53); Definition 9.1.7 and Proposition 9.1.8 (lines 1790–1792, p. 57); Exercises 7.3.2 and 7.3.8 (pp. 46–47); Theorems 16.3.1–16.3.2 (lines 3395 and 3467, pp. 108–109).

**Library declarations opened at the pins.**
- Tau Ceti: the 26 declarations in R01's table and the 7 in R02, at the lines given there.
- The covariant-pair von Neumann algebra `TauCeti.CStarAction.CovariantRepresentation.vonNeumannAlgebra` (`…/Action/Covariant/VonNeumann.lean:51`). It is the C*-dynamics extension and duplicates no target here.
- `VonNeumannAlgebra.adjoin` (`TauCeti/Analysis/VonNeumannAlgebra/Adjoin.lean`), imported by `Suggested.lean`.
- Mathlib: `WStarAlgebra.exists_predual` (a class field about abstract algebras, not the concrete `exists_predual`); `ergodic_mul_left_of_denseRange_pow` (finite measure and a single generator, weaker than `ergodicSMul_dense_subgroup`); `IsCyclic` and `leftRegular` (unrelated namespaces).

**Cross-roadmap citations resolved.**
- BanachSpaceTheory on main: B1 (line 54), with the SOT/WOT facts at lines 93–107, B2 (135) and B4 (239).
- The open revision (`roadmaps show BanachSpaceTheory --pr 1854`) maps `#b1-…`, `#b2-…` and `#b4-…` to its Layers 1, 2 and 4 in its Scope (lines 31–37). So the three anchors listed in the overlaps file stay valid: no change and no dependency.
- BanachAlgebras on main: §3.1 (line 756, with augmentation and one-point compactification at its lines 31–42), §7.2 (1555), §7.3 with A7.IntegratedRepresentations and A7.RegularL2 (1615, 1633), and §7.5 with A7.CharactersAndUniqueness (1739). The README states the no-conjugation character convention as A7 does.
- AmenableGroups on main: Layers 5, 6 and 7 (lines 289, 391, 415); both link fragments resolve.
- SelfAdjointSpectralTheory on main: SA-B85 consumes V4.0.Fields (its line 255). That is why R01 sends the repair to Tau Ceti and not to SelfAdjointSpectralTheory.
- The OperatorTheory revision at its open head (UnboundedOperators, lines 173–181) consumes V2, V10.ClosedOperators and V10.Affiliation. R01 keeps those labels.
- Overlaps file: no open pull request changes this folder and no cited id of this roadmap is dropped. The closest roadmaps in vocabulary (OperatorAlgebraDynamics, QuantumFoundations, NoncompactQuantumSymmetry, OperatorTheory's UnboundedOperators) cite this roadmap and do not own its objects.

**Adversarial pass.**

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `tomiyama` (13.1) | diagonal compression E on `M₂`; a=diag(2,3), b=diag(5,7), x=[[1,2],[3,4]]; `P(x)=e₁₁xe₁₁`; `x↦x₁₁e₁₁+x₂₂e₂₂+x₁₂e₂₁`; A=0 | `E(axb)=diag(10,84)=aE(x)b`; P has norm 1, fixes `ℂe₁₁`, `P(1)=e₁₁≠1`; third map: image of [[1,1],[1,1]] is [[1,0],[1,1]], not self-adjoint, and `P(P(e₁₂))=0≠e₂₁`, so not a projection; on 0 every map has norm 0≠1 | holds | none |
| `IsInjective` (13.1) | `B(H)`; `ℓ∞⊂B(ℓ²)`; M=0 | identity, norm 1; `x↦diag(⟨eₙ,xeₙ⟩)`, norm 1; M=0 gives P=0, `‖P‖=0≤1` | holds | none |
| `IsHyperfinite` (13.2) | R; `B(ℓ²)`; zero algebra | `M_(2ⁿ)` increasing; `Aₙ≅Mₙ⊕ℂ` with weakly dense union; `Aₙ=⊥={0}`, double commutant `{0}=M` | holds | none |
| `isInjective_iff_isHyperfinite` (13.2) | `L(F₂)`; `ℂ1` on separable H; H=0 | `L(F₂)`: a hypertrace would give `m(W(a))+m(W(a⁻¹))=1=m(W(b))+m(W(b⁻¹))` on four disjoint sets of total mass ≤1, so not injective; not Γ, so not hyperfinite; both false. `ℂ1`: `x↦ω(x)1` has norm 1 and `Aₙ=ℂ1`; both true. H=0: both true | holds | none |
| uniqueness of injective II₁ and II∞ (13.2) | R vs `R⊗̄M₂`; `R⊗̄B(ℓ²)` | `M_(2ⁿ)⊗M₂=M_(2ⁿ⁺¹)`, both R; II∞: corner `(1⊗p)M(1⊗p)≅N⊗M_k` with N≅R, as in AP Cor. 11.2.4; both statements carry `[SeparableSpace]` on H and K | holds | none |
| Følner Checks (13.2) | ℂ², `τ(a,b)=(a+2b)/3`, u=(1,−1), x=(1,0), ε=1/10 | rank-one P: `‖uP−Pu‖²=8|α|²|β|²`; bound forces `|α|²≤0.00126` or `≥0.99874`; `Tr(xP)/Tr(P)∈{|α|²,1/2}`, never within 1/10 of `τ(x)=1/3`; `T=diag(3^(−1/2),(2/3)^(1/2))`: `1/3+2/3=1`, `Tr(xT²)=1/3` | holds | none |
| V13b.SpatialNorm Checks | `u=e₁₂⊗e₁₂+e₂₁⊗e₂₁`; `1⊗1`; `(A,B,ψ)=(0,ℂ,id)` | `u*u=e₁₁⊗e₁₁+e₂₂⊗e₂₂`, rank 2, `‖u‖=1` vs cross sum 2; `‖1⊗1‖_min=1` vs Hilbert–Schmidt 2; slice norm 0 vs `‖ψ‖=1` | holds | none |
| `exists_faithful_nondegenerate_representation` | A=ℂ; A=0; A=c₀ | ℂ on ℂ; 0 on the zero space (span 0 is dense in 0); diagonal on ℓ², `eₙ=π(δₙ)eₙ` | holds | none |
| `exists_injective_nondegenerate_representation_lp` | A=ℂ; A=0 | scalars on ℓ², range span = ℓ²; the zero representation of 0 on ℓ² has span {0}, not dense, which is why `[Nontrivial A]` is assumed | holds | none |
| `double_commutant_iff_isClosed_image_ofCLM` | `ℂ1`; `K(ℓ²)+ℂ1` | `ℂ1''=ℂ1`, closed; `(K+ℂ1)''=B(ℓ²)≠K+ℂ1`, not WOT closed; both sides false | holds | none |
| `closure_unitBall_eq_unitBall_double_centralizer` | A=ℂ1; finite-rank plus scalars | balls equal; even-coordinate projection q equals SOT-lim `qPₙ`, while `‖q−a‖≥1/2` for every a in A | holds | none |
| `closure_isStarProjection_eq_positive_contractions` | H=ℂ (excluded); H=ℓ², A=(1/2)·1 | {0,1} misses 1/2; block `[[C,√(C(1−C))],[…,1−C]]` with C=1/2 is `[[1/2,1/2],[1/2,1/2]]`, idempotent | holds | none |
| `multiplicationAlgebra`, `exists_starAlgEquiv_multiplicationAlgebra` | two-point counting; μ=0; `ℓ∞(I)`, I uncountable | diagonal ℂ², its own commutant; `L²(0)=0` gives the zero algebra, so `[Nontrivial H]` and probability; uncountably many minimal projections vs countably many atoms, so `[SeparableSpace H]` | holds | none |
| V4.Abelian* Checks (moved) | `a=diag(1,1/3,1/9)`; `f=1_(ℚ∩[0,1])`; `L²[0,1]` vs `L²[0,1]⊗ℂ²` | `Φ_a([1_{1/3}])=e₂₂`; `essSup f=0` vs sup 1; commutants `L∞` abelian vs `L∞⊗M₂` not abelian | holds | none |
| V2 generator Check | `0,1,δ_x,δ_y,δ_y,…` | weights 3⁻ⁿ: `1/3+1/9=4/9` vs `1/3+Σ_(n≥3)3⁻ⁿ=7/18`; weights 2⁻ⁿ: both `3/4` | holds | none |
| `isNormalFunctional_iff_exists_tsum_inner` | ultrafilter state on `ℓ∞`; `φ_w` with `w_n=2^(−n−1)` | `φ(1_{0..N})=0↛1`, no tsum form; `ξ_n=2^(−(n+1)/2)e_n`, `Σ‖ξ_n‖²=1`, normal | holds | none |
| `isCyclic_iff_isSeparating_commutant` | `M₂` on ℂ²; diagonal ℂ²; H=0 | every ξ≠0 cyclic for `M₂` and separating for `ℂ1`; (1,1) both, (1,0) neither; 0 both on the zero space | holds | none |
| `equivalent_of_subequivalent` | `M₂`; `B(ℓ²)` | `e₂₁` gives `e₁₁≼e₂₂` and `e₁₂` the reverse, so `e₁₁∼e₂₂`; shift S: `S*S=1`, `SS*=1−e₀e₀*`, so `1∼1−e₀e₀*≠1` | holds | none |
| `tracialState_unique` | `M₂`; `ℂ⊕ℂ`; `B(ℓ²)` | `tr/2` only; `t·pr₁+(1−t)pr₂`, not a factor; halving gives `τ(1)=2τ(1)`, so none | holds | none |
| `exists_faithful_tracialState` | R; `M₂` | product trace, `τ(x*x)=0⇒x=0`; `M₂` has the minimal `e₁₁`, so it is not `IsTypeIIOne` | holds | none |
| `isSimpleRing_of_isTypeIIOne` | ideal through p, `τ(p)=1/3`; `B(ℓ²)` | n=3, `qᵢ=vᵢ*pvᵢ` gives `1∈I`; `K(ℓ²)` is a proper ideal, but `B(ℓ²)` is not II₁ | holds | none |
| `isFiniteProjection_iff_modular` | `B(ℓ²⊕ℓ²)`, e=1; H=0 | `A∨(B∧C)=A` vs `(A∨B)∧C=C≠A`, and the shift makes 1 infinite: both false; e=0: both true | holds | none |
| `exists_isNormalSemifiniteTrace_of_isFactor` | `B(ℓ²)`; the map ∞ on `M₊∖0` | `Tr(p)=rank p<∞` iff finite rank; additive and normal but not semifinite, so excluded from τ' | holds | none |
| `exists_conj_commutant_eq_of_isCyclic` | `M₂⊗1` on ℂ⁴, `Ω=(e₁⊗e₁+e₂⊗e₂)/√2`; `M₂` on ℂ² | `⟨Ω,(x⊗1)Ω⟩=tr(x)/2`, J the flip-conjugation, `JMJ=1⊗M₂=M′`; no tracial vector on ℂ² | holds | none |
| `nonempty_starAlgEquiv_spatialTensor_of_isTypeIIInfinity` | `R⊗̄B(ℓ²)`, `p=1⊗e₀₀`; E=0 | `pMp≅R`, so `M≅R⊗̄B(ℓ²)`; E=0 gives right side 0, which `hE0` excludes | holds | none |
| `existsUnique_typeDecomposition` | `ℂ1`; R; `B(ℓ²)`; `M₂⊕R` | `ℂ1`: (1,0,0,0), and (0,1,0,0) fails the II₁ clause at e=1; R: (0,1,0,0), and (1,0,0,0) fails the type I clause; `B(ℓ²)`: (1,0,0,0), and (0,0,1,0) fails at a rank-one e; `M₂⊕R`: `(1⊕0,0⊕1,0,0)` | holds | none |
| `groupVonNeumannAlgebra`, `isFactor_groupVonNeumannAlgebra_iff` | ℤ/2; S₃; trivial; F₂ | circulants, centre dim 2, class {g} finite: both false; three classes: both false; ℂ: both true; `bⁿab⁻ⁿ` distinct: both true | holds | none |
| V8.GroupApplications | `R⊂R⊗̄L(F_I)`, I uncountable; index-2 kernel of `F₂→ℤ/2` | `dim_R=Σ'_(F_I)1=∞`; kernel free of rank 3, ICC, index 2 | holds | none |
| `ergodicSMul_dense_subgroup` | ℝ⊃ℚ; ℝ⊃ℤ; countable discrete G | ergodic; `⋃[n,n+1/2)` is invariant and not null or conull, and ℤ is not dense; Γ=G is transitive | holds | none |
| `existsUnique_isKMS_flow` | `M₂`, h=diag(2/3,1/3), x=e₁₂, y=e₂₁; `Ad(diag(3^(it),1))` | `F(z)=(2/3)2^(iz)`: `F(t)=(2/3)2^(it)`, `F(t+i)=(1/3)2^(it)`, `|F|≤2/3` on the strip; r=3 gives `(2/9)3^(it)≠(1/3)3^(it)` | holds | none |
| `commutant_spatialTensor` | `B(ℂ²)⊗̄ℂ1`; `M_m⊗̄M_n` | commutant `1⊗M₂=ℂ1⊗̄B(ℂ²)`, dim 4 each; scalars on both sides | holds | none |
| `exists_linearIsometryEquiv_withLp_of_generalPosition` | ℂ², p=diag(1,0), q onto (cos θ, sin θ); H=0 | L=ℂ, `b=cos²θ`, `√(b(1−b))=cos θ sin θ`; L=0 | holds | none |
| `HasPropertyGamma`, `hasPropertyGamma_of_isHyperfinite`, `not_hasPropertyGamma_…` | R; `M₂`; `L(F₂)`, x=u_a | `uₙ=diag(1,−1)` at site n, `τ(uₙ)=0`, commutator 0 on earlier sites; limit point a central unitary λ with λ≠0; `‖x−τ(x)‖₂=1`, `‖[u_a,u_b]‖₂=√2`, `1≤14√2` | holds | none |
| `HasTypeITwoSummand` | `M₂`; `M₃`; `M₄`; abelian | `e₁₁+e₂₂=1`; `2·rank e=3` impossible; `eM₄e≅M₂` not commutative; `e=f`, then `ef=0` forces e=0 | holds | none |
| `exists_unique_extension_of_finitelyAdditive` | `M₃`, `μ=Tr(diag(1,−1,0)·)`; `M₂` Bloch frame | values in [−1,1], extension norm 2≤4; `f(1/√2,0,1/√2)=3/4` vs affine `1/2+1/(4√2)≈0.677`, no extension | holds | none |
| `dye` | ℂ² swap; `M₃` transpose; `M₂` Bloch map | `(a,b)↦(b,a)`; `(e₁₂e₂₁)ᵀ=e₁₁` vs `e₂₁e₁₂=e₂₂`; images `(1,0,±2)/√5` have inner product `−3/5≠0` | holds | none |
| `exists_predual`, `exists_vonNeumannAlgebra_starAlgEquiv` | `B(H)`; `ℓ∞(I)`; M=ℂ | `S₁(H)*=B(H)`; `ℓ¹(I)*=ℓ∞(I)` for every I; ℂ on ℂ | holds | none |
| V2.BorelCalculus (R01) | `a=diag(0,1)`, `ξ=e₁+ie₂`, `η=e₂` | README and Tau Ceti: `μ_(ξ,η)=⟨ξ,P(·)η⟩=−iδ₁`, `∫z dμ=−i=⟨ξ,aη⟩`; `|μ|(K)=1≤‖ξ‖‖η‖=√2≤2√2` (Tau Ceti's bound) | holds; restates the pin | R01 |
| V10.ClosedOperators (R01) | T=0; T=t on `L²(ℝ)`; λ=i | `1+2i(−i)⁻¹=−1=(−i)/i`; `(t−i)/(t+i)` both ways; `sup 1/|t−i|=1=|Im λ|⁻¹`; `(t−i)/(t+i)=1` has no solution | holds; restates the pin | R01 |
| V4.Normality, GNS implementation (R02) | `M₂`, `φ=tr/2`, `u=diag(1,−1)` | `φ(uxu*)=φ(x)`; `U[b]=[ubu*]`, `⟨[a],U[b]⟩=φ(a*ubu*)` | holds; restates the pin | R02 |
| Layer 6 separating step (R02) | `M₂⊗1`, entangled Ω | 0-KMS = tracial (`isKMSState_zero_iff`); `(x⊗1)Ω=0⇒x=0` | holds; derivable from the pin | R02 |
| V0.SeparableFaithful (R03) | markdown-it render of `:498–516` | the target paragraph sits inside the fourth `<li>` | rendering defect | R03 |

## Not verifiable

- Tomiyama 1957: the cached `tomiyama-1957` file is the host's block page (line 5), so Theorem 1, pp. 608–609, was not read. The README cites it only for positivity and bimodularity in the unital case, as anantharaman-popa line 13597 (A.4) attributes it, which was read.
- Settled as uncertified and cited by locator: Arveson 1969 (Theorem 1.2.3), Haagerup 1985, Haagerup 1987, Connes–Størmer 1978.
- Takesaki I, Theorem IV.4.9; Takesaki III, XV.3 (Theorem 3.1, Definition 3.5), XVI.1.9 and XVI.1.22–1.23; Runde 6.4.14 and 6.4.24–6.4.25: cited in 13.2 and not in the cache. No fetch was made.

## Source issues

- **Misprint** in jones-vna at Definition 16.1.1, p. 107: the source says a II₁ factor has property Γ "if there is a central" and the sentence breaks off; it should say "…a central sequence that is not trivial"; affects nothing.
- **Misprint** in jones-vna at Theorem 16.3.2, p. 109: the source says vN(Fₙ) lacks Γ "for n≥" with the bound missing; it should say for n≥2; affects nothing.
- **Gap** in jones-vna at Theorem 16.2.1, p. 108: the source states that R_ω is a II₁ factor and gives a proof stub reading "finish proof!"; it should give a proof or a reference; affects nothing (the README does not cite it).
- **Error** in hiai-lectures at §1.8, p. 9: the source says acting on a separable Hilbert space is equivalent to having separable predual; it should say equivalent up to isomorphism, since ℂ1 on a nonseparable space has separable predual; affects nothing (README Conventions already says this).
- **Misprint** in anantharaman-popa at Definition 10.2.1, p. 161: the source says "a von Neumann M is amenable", omitting "algebra"; it should say "a von Neumann algebra M"; affects nothing.
- **Misprint** in hiai-lectures at the proof of Theorem 6.4, pp. 53–54: the source writes "for all y ∈ L¹(N,τ)" and later "E_α(x)"; it should write "for all b" and "E_τ(x)"; affects nothing.
