# Review of VonNeumannAlgebras (pull request #1041 at 8b1713a)

**Verdict:** needs changes

This is a full review of the same head the previous review read: the folder has no changed lines since `8b1713a`. There are three findings, all P3; none is blocking. The gate, the dependency check and the elaboration pass.

## Previous findings

- **R01 — not repaired.** `lake-manifest.json` still pins Tau Ceti `a91d3aaf` and Mathlib `6b7abb3c`; main pins `2fd255d9` and `1b1ccf4b`. `git merge-tree --write-tree origin/main HEAD` still reports "CONFLICT (add/add)" for `TauCetiRoadmap/VonNeumannAlgebras/README.md` and `Suggested.lean`. It is carried below as R01, with one count corrected: 15 Tau Ceti files are absent at the branch pin, not 16, because `TauCeti/Analysis/Semigroups/Group/Stone/Unbounded.lean` is present at `a91d3aaf`.
- **R02, R03 and R04 of the review before that** were repaired at this head, as the previous review recorded. I re-read the passages and they stand:
  - `README.md:4349–4354` (Tomiyama scope);
  - `:1549`, `:3849`, `:3861` (FactorRigidity Layer 6 §6.2 and Layer 7 §7.1);
  - `:3350` (the faithful `ℓ∞(ℕ)` weight `Σ(n+1)x_n`).

## R01 (P3) — The branch is still at the old pins and conflicts with the roadmap on main

**Location:**
- `TauCetiRoadmap/VonNeumannAlgebras/README.md:231–330`, the "From Tau Ceti" contract, which ends "Each is used as stated at the pin."
- `lake-manifest.json`, which this head leaves unchanged.

**Claim:** Main already carries this roadmap, merged from #889 together with `PROGRESS.md` and `STATUS.md`. This branch adds the same folder from merge base `350e970`, so it cannot merge as it stands. The supplier contract is true only at main's Tau Ceti pin.

**Witness:**
- Of the 30 Tau Ceti files the README names, 15 are absent at `a91d3aaf`. Examples are `TauCeti/LinearAlgebra/Matrix/Trace/Duality.lean`, `Analysis/CStarAlgebra/GNS.lean` and `Analysis/CStarAlgebra/Action/KMS/Basic.lean`.
- The declarations in those files are absent too: `LinearMap.existsUnique_trace_mul_eq`, `PositiveLinearMap.toGNS`, `TauCeti.CStarAction.isKMSFunction_apply_mul_entireExtension_iff` and 22 more.
- All of them exist at `2fd255d9`.

**Repair:**
1. Rebase onto main, or merge main.
2. Resolve the two add/add conflicts in favour of this head's `README.md` and `Suggested.lean`.
3. Keep main's `PROGRESS.md`, `STATUS.md`, `metadata.toml` (identical on both sides) and `lake-manifest.json`.
4. Re-run the gate and `lake env lean` at main's pins. Every carrier `Suggested.lean` uses exists in main's Mathlib: `VonNeumannAlgebra`, `WStarAlgebra`, `CompletelyPositiveMap`, `ErgodicSMul`, `ContinuousLinearMap.toPointwiseConvergenceCLM` and `StrongDual` all grep at `1b1ccf4b`. Even so, only the build at that pin decides whether it elaborates.
5. Update the description. It still calls this branch "its historical staged snapshot" and sends review to #889, which is merged. In fact this branch revises the roadmap on main.

## R02 (P3) — `## Downstream consumers` omits eight roadmaps on main that consume this one

**Location:** `README.md:4935–4947`. The section lists only SelfAdjointSpectralTheory, OperatorAlgebraDynamics, TypeAHeckeAlgebras and CStarAlgebras.

**Claim:** The README itself names further consumers. FactorRigidity appears at `:1549`, `:3849` and `:3861`, Subfactors at `:2318` and NoncommutativeIntegration I4 at `:3607`. Yet the consumer list leaves them out, so it cannot be used to judge the impact of renumbering a V-target.

**Witness:** These roadmaps on main (`3090489`) cite this roadmap as a supplier:
- FactorRigidity line 39: "VonNeumannAlgebras §§V2–V13b".
- Subfactors line 182: "From TauCetiRoadmap.VonNeumannAlgebras".
- NoncommutativeIntegration line 150, the same heading; it cites V2, V7.Index, V8, V10.TracialLp and Layer 11.
- FreeProbability line 58: V0–V4.
- HilbertModules lines 56 and 570: V0 and V4.Core.
- NoncommutativeGeometry line 60: V0, V4, V6, V10.
- QuantumGroups line 40: V0–V4, V10–V11.
- PseudodifferentialOperators lines 1757 and 1885: V2.

**Repair:** Add one bullet per roadmap, each naming the layers it consumes, as listed above. Every V-id those eight roadmaps cite resolves in this head's README; I checked all 33 distinct ids.

## R03 (P3) — Two library declarations are cited under names that do not exist at the pin

**Location:**
- `README.md:874` and `:876`: "`Measure.measurePreserving_piFinTwo`" (V2.RectangularL2).
- `README.md:3727`: "Tau Ceti … `PontryaginDual.continuous_coe_eval_const`" (V11.DoubleDualEmbedding *Needs:*).

**Witness:**
- Mathlib `MeasureTheory/Constructions/Pi.lean:849` declares `measurePreserving_piFinTwo` inside `namespace MeasureTheory`, which opens at `:67`, after `end Measure` at `:657`. Its name is therefore `MeasureTheory.measurePreserving_piFinTwo`.
- Tau Ceti `TauCeti/Analysis/Fourier/Pontryagin/DualEval.lean:29` declares it under `namespace TauCeti.PontryaginDual` at `:23`. Its name is therefore `TauCeti.PontryaginDual.continuous_coe_eval_const`.
- Neither name as written resolves, even under `open MeasureTheory`.

**Repair:** Write `MeasureTheory.measurePreserving_piFinTwo` at `:874` and `:876`, and `TauCeti.PontryaginDual.continuous_coe_eval_const` at `:3727`. The second matches how the README writes the file's other `TauCeti.`-namespaced names, such as `TauCeti.primeCount`.

## Verified sound

**Gate, dependencies, scope**
- I ran `tauceti-roadmap gate … VonNeumannAlgebras --base origin/main` on this head. Every check reports 0, then `OK`, exit 0.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/VonNeumannAlgebras'` is empty, so nothing outside the folder changes.
- The dependency check exits 0 with no UPWARD, CYCLE or `moved:` line:

  ```text
  depcheck: 235 roadmaps, 2262 edges, 0 problem(s)
  ```

- Every supplier is on main: OperatorTheory (PolarDecomposition, OperatorIdeals), BanachSpaceTheory, BanachAlgebras, AmenableGroups, OptimalTransport, RepresentationTheory (CompactGroups, SemisimpleAlgebras, LieHighestWeight), and from `Completed/` OneParameterSemigroups, GlobalNumberFields and Chebotarev.
- There are no cycles:
  - BanachAlgebras line 2043 lists this roadmap as a downstream consumer, not a supplier.
  - BanachSpaceTheory line 96 only mentions compatibility with V1.
  - CStarAlgebras consumes V0–V4, V12.J and V13a/b.
- All 16 relative links resolve on main.
- The anchors `#72-…`, `#73-…`, `#75-…` and `#31-…` of BanachAlgebras and `#layer-5-…` and `#layer-7-…` of AmenableGroups match headings at lines 1555, 1611, 1735, 756, 289 and 415.
- `roadmaps resolve`: none found nowhere.

**Overlaps**
- `roadmaps overlaps VonNeumannAlgebras` lists #1854's drop of three BanachSpaceTheory heading anchors. Those anchors are cited only by main's README; this head cites B1, B2 and B4 without anchors.
- At #1854's head the headings keep the labels: "Layer 1: duality and weak topologies (B1)", "(B2)", "(B4)". James (line 11), the Schmidt series (line 672) and the nuclear/trace-class comparison (line 350) are still there. So the citations hold at both main and #1854.
- FactorRigidity §6.2 (line 594) and §7.1 (line 636) resolve. So do Chebotarev Layers 13–14 (lines 593 and 612), GlobalNumberFields Layer 4 (line 418) and OptimalTransport Layer 2's analytic-set bridge (lines 458–461) with Layer 8 item 2 Jankov–von Neumann (line 1004).
- PD-A36 (line 211), PD-B23 (line 371), OI-B29 (line 349), SA-B85 (line 255) and TypeAHeckeAlgebras H3 (line 193) all resolve.

**Ownership against open pull requests**
- I read the closest open roadmaps. QuantumFoundations (#1771) imports V0–V5 and V12.J by name (lines 23, 49–51, 424–430). OperatorAlgebraDynamics (#1137) imports V8, V10.KMS, V11 and V4.0 (lines 125–170). CategoricalOperatorAlgebras (#888) imports V4–V6 and V11–V13. NoncompactQuantumSymmetry (#1015) imports V2 and V4. None of them restates an object owned here.
- No other open `Suggested.lean` uses the namespace `TauCetiRoadmap.VonNeumannAlgebras`.
- One cross-roadmap remark, not a finding against this folder. SelfAdjointSpectralTheory on main (lines 128–140) also lists as its own the bounded Borel calculus, the multiplication models (SA-B85) and the Cayley transform and unbounded spectral measure. This README's scope (`:28–44`) owns V2.BorelCalculus, V4.0.Multiplication and V10.ClosedOperators, giving the reason that SA-B85 consumes V4.0.Fields. That bullet is unchanged from main and stated correctly. The remaining double statement is SelfAdjointSpectralTheory's to resolve by citing these targets.

**Lean, at the branch pins**
- `lake env lean …/Suggested.lean` exits 0 in 45 s, with exactly 24 "declaration uses `sorry`" warnings and nothing else.
- On a scratch copy I added `#check @name` for all 41 declarations. Every `def` and `theorem` keeps `[NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]`, and `dye` and the uniqueness theorems also keep the K binders and `[SeparableSpace H]`/`[SeparableSpace K]`. Every elaborated type matches its README statement, and no binder is lost.
- The same copy replaced each `sorry` with `first | rfl | (simp; done) | infer_instance | trivial | decide | sorry`. All 24 warnings remain, so there is no one-tactic padding.

**Headline coverage**
- The README's summary names these end theorems. Each is either stated in `Suggested.lean` or named in its docstring as not statable, together with the missing carrier:
  - the bicommutant and Kaplansky theorems: stated, in WOT and SOT form;
  - existence and uniqueness of the II₁ trace: stated;
  - Tomita–Takesaki: no `S`, `Δ` or `J` carrier; the KMS existence-and-uniqueness form is stated;
  - Connes `S(M)`: no modular group of a weight;
  - Dye: stated;
  - injective ⇔ hyperfinite and the injective II₁ and II∞ uniqueness: stated;
  - IIIλ, III₀ and III₁: no flow of weights or `S`/`T`.
- The ultraweak forms, `M⊗̄N`, the index, group algebras and the Layer 12 ultraproducts are likewise named with what each lacks.

**Library declarations checked at the pins**
- All 46 Mathlib names in the contracts grep at both `6b7abb3c` and `1b1ccf4b`. Among them are `PhragmenLindelof.eqOn_horizontal_strip`, `Rat.HeightOneSpectrum.primesEquiv`, `IsStarNormal.commute_star_right` (`Analysis/CStarAlgebra/Fuglede.lean:177`), `MeasureTheory.Lp.instContinuousSMulDomMulAct` and `LinearEquiv.image_closure_of_convex`.
- I resolved 54 Tau Ceti names to their fully qualified declarations at `2fd255d9`, with two exceptions. One is R03. The other, `AEFinStronglyMeasurable.aestronglyMeasurable_smul`, is the usual `MeasureTheory.`-omitted form.
- `TauCeti.CStarAction.IsKMSFunction` is at `KMS/Basic.lean:83`, with `F t = φ(a·α_t b)` and `F(t+βi) = φ(α_t b·a)`. This confirms the README's β=−1 crosswalk.
- `LinearMap.existsUnique_trace_mul_eq` is at `Trace/Duality.lean:31`, with `f x = (ρ*x).trace`.

**Seeded sample, read at its locators**
- **13.1:**
  - hiai-lectures line 2666, p. 55: Theorem 6.5 asserts (ii) bimodularity (line 2596) and (v) complete positivity (line 2602) for a norm-one projection of a C*-algebra onto a C*-subalgebra. The proof runs to line 2695, p. 56.
  - peterson-notes line 3948, p. 98: Theorem 6.2.1, the unital case giving a conditional expectation, that is, unital CP (line 3945).
  - anantharaman-popa line 13607, printed p. 314 (PDF 320): §A.4 credits Tomiyama with "norm-one projection is a conditional expectation".
  - anantharaman-popa lines 7191–7205, printed p. 161: Definition 10.2.1 and Proposition 10.2.2 (i)⇔(ii)⇔(iii), with the conditional expectation in every containing `B(H)`.
- **13.2:**
  - anantharaman-popa line 8294, p. 186: Theorem 11.2.2, whose (3) uses the "same unit" and `(∪Q_n)''=M`.
  - Lines 8371–8376, p. 188: the AFD definition before Corollary 11.2.4.
  - Line 7685, p. 173: Definitions 11.1.1–11.1.2.
  - Line 8358, p. 188: Remark 11.2.3, that infinite-dimensional subfactors of R are R.
  - Line 8410, p. 189: the Notes say "the converse being immediate".
  - Lines 7269, 7325, 7333, 7413 and 7532: Proposition 10.2.5 (p. 163), Theorems 10.2.8–10.2.9 (p. 164, with the `sup_(‖x‖≤1)|Tr(xT²)−τ(x)|≤ε` form), Theorem 10.3.1 (p. 166) and Theorem 10.3.4 (p. 168).
  - hiai-lectures lines 327–334, p. 9: §1.8, the sequential AFD definition on a separable Hilbert space and Connes's AFD⇔injective.
  - peterson-notes line 4146, p. 103: Theorem 6.3.8.
- **Other locators checked this round:**
  - Every AP printed page cited in Layers 2–8. PDF minus 6 gives 2.6.6 p. 48, 2.5.1 p. 40, 2.5.5/2.5.7 pp. 42–43, 3.1.4/3.2.1 pp. 52–53, 6.2.8 p. 88, 6.3.4–6.3.5 pp. 91–92, 6.4.1–6.4.4 pp. 93–95, 7.1.1 p. 99, 8.1.1 p. 122, 8.2.2 p. 124, 8.3.1–8.3.8 pp. 124–127, 8.4.2 p. 128, 8.5.4 p. 133, and 8.5.5/8.6.1/8.6.2 p. 134.
  - Peterson 2.5.5–2.6.4, 2.7.4, 2.8.5, 2.8.8, 3.3.1–3.3.9, 4.1.4–4.1.7, 4.2.2, 4.3.3–4.3.4, 4.4.6, 4.7.9–4.9.5, 5.1.3–5.1.6 and 6.2.2.
  - Jones 3.2.1–3.2.3 (p. 12), 4.4.1–4.4.5 (pp. 28–29), 5.2.1–5.2.2 (pp. 32–33), 8.1.15 (p. 53), 11.2.17/11.2.21 (p. 73) and 16.3.1 (p. 108).
  - Houdayer 3.1 (p. 12) and 3.16 (p. 17).
  - Hiai 2.2 (p. 11), 2.13–2.14 (p. 18), 3.12–3.13 (pp. 26–27), 9.3 (p. 83), 9.4 (p. 84) and 9.7 (p. 87, stated for f.s.n. weights only, as the README says).
  - Bunce–Wright: Theorems A and B and Lemma 1.1, with conditions (a)–(b) and `‖β‖≤4 sup|β(p)|`, all on p. 289.
  - Hamhalter pp. 2–3 and Theorem 4.3, p. 14.
  - Haagerup 1989 Theorem 6.1, p. 303 (hypothesis `σ^φ_(t₀)=id`).
  - Haagerup 2016 Theorems 1.1–1.2, p. 2.
  - Connes–Feldman–Weiss Definitions 5–6, Proposition 7, Lemmas 8–9 and Theorem 10.
  - Pinzari Corollary 4.9.

**Adversarial table**

Every value below was computed this round.

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `tomiyama` (13.1) | `E(x)=x₁₁e₁₁+x₂₂e₂₂` on M₂; `a=diag(2,3)`, `b=diag(5,7)`, `x=[[1,2],[3,4]]`; `P(x)=e₁₁xe₁₁`; A=0 | `axb=[[10,28],[45,84]]`, `E(axb)=diag(10,84)=aE(x)b`; P has norm 1 with `P(1)=e₁₁≠1`; on A=0 every P has norm 0, so the statement is vacuous; S=ran P=ker(1−P) is closed | holds; nonunital S allowed | none |
| 13.1 Check, `x↦x₁₁e₁₁+x₂₂e₂₂+x₁₂e₂₁` | `y=Q(x)`; `x=[[1,1],[1,1]]` | `Q(y)=x₁₁e₁₁+x₂₂e₂₂≠y` when `x₁₂≠0`; `Q(x)=[[1,0],[1,1]]` is not self-adjoint | neither a projection nor positive, as stated | none |
| Arveson Checks | transpose on M₂; `ρ=[[1/2,c],[c̄,1/2]]` | `Σe_ij⊗e_ij ↦ flip`, eigenvalue −1; `det ρ=1/4−|c|²≥0 ⇔ |c|≤1/2` | not CP; extensions not unique | none |
| `IsInjective` | B(H); `ℓ∞⊂B(ℓ²)`; H=0 | identity norm 1; diagonal expectation norm 1, normal; H=0: P=0 with `‖P‖=0≤1` | matches AP 10.2.1/10.2.2(iii) | none |
| `IsHyperfinite` | R; B(ℓ²); `L(ℤ)`; H=0 | `M_(2ⁿ)`; `A_n={P_nxP_n+λ(1−P_n)}` contains 1 (x=P_n, λ=1) and is nested; `(∪A_n)'=ℂ`; dyadic `ℓ∞(2ⁿ)`; `⊥=B(0)` | AP 11.2.2(3) form | none |
| `isInjective_iff_isHyperfinite` | H=0; `L∞[0,1]`; B(ℓ²); `L(F₂)` | yes/yes; yes/yes; yes/yes; no hypertrace (`m(W(a))+m(W(a⁻¹))=1=m(W(b))+m(W(b⁻¹))`, total 2>1)/no | both sides agree | none |
| 13.2 Følner Checks on ℂ², `τ(a,b)=(a+2b)/3` | rank-one P onto `(α,β)`; P=1; `T=diag(3^(−1/2),(2/3)^(1/2))` | `‖uP−Pu‖²=8|α|²|β|²≤1/100 ⇒ |α|²<0.00126` or `>0.99874`, and `|·−1/3|>1/10`; P=1 gives 1/2, off by 1/6; `‖T‖²=1/3+2/3=1`, `Tr(xT²)=a/3+2b/3=τ(x)` | projection form needs II₁; operator form holds | none |
| Semidiscreteness Checks | `ℓ∞` truncations; dyadic `E_n` on `1_[0,1/3]` | `‖x−x_N‖=1` for x=1; the interval value is `frac(2ⁿ/3)∈{1/3,2/3}`, so `‖E_nf−f‖_∞≥1/3` and `‖E_nf−f‖₁≤2^(−n)` | point-ultraweak, not norm | none |
| V13b.SpatialNorm Checks | `u=e₁₂⊗e₁₂+e₂₁⊗e₂₁`; `1⊗1`; `(0,ℂ,id)`; `C(X)`: `f⊗1−1⊗f` | `u(e₂⊗e₂)=e₁⊗e₁`, `u(e₁⊗e₂)=0`, so `u*u` is rank 2 and `‖u‖=1` against sum 2; `‖1⊗1‖=1` against HS 2; slice 0 against `‖ψ‖=1`; `sup|f(x)−f(y)|=1` | hold | none |
| II₁/II∞ uniqueness | `M_n`; R; B(ℓ²); `R⊗̄B(ℓ²)` | `M_n` and B(ℓ²) have minimal rank-one projections, so are excluded; R is finite, so excluded from II∞; `1⊗e₀₀` is finite in the infinite `R⊗̄B(ℓ²)`; AP 11.2.4's proof uses only amenability | hypotheses select R and `R⊗̄B(ℓ²)` | none |
| `double_commutant_iff_isClosed_image_ofCLM` | `{e₁₂}` on ℂ²; `ℂI` | `{e₁₂}'={aI+be₁₂}`, `{e₁₂}''` has dim 2; the star algebra generates M₂; `(ℂI)''=ℂI` | holds | none |
| `closure_unitBall_eq_unitBall_double_centralizer` | finite rank plus scalars on ℓ²; q = even projection | `q−c` has eigenvalues `1−c` and `−c` with infinite multiplicity, so `‖q−(c+F)‖≥max(|1−c|,|c|)≥1/2`; `qP_n→q` strongly | SOT, not norm | none |
| `closure_isStarProjection_eq_positive_contractions` | H=ℂ; block `[[C,√(C(1−C))],[√,1−C]]` | `{0,1}` misses 1/2; squaring gives `(1,1)=C²+C(1−C)=C` and `(2,2)=C(1−C)+(1−C)²=1−C` | infinite dimension needed; idempotent | none |
| `exists_faithful_nondegenerate_representation`, `…_lp` | A=0; A=ℂ; A=M₂ | K=0 with span 0 dense in 0; `π(z)=z·1` on ℓ²; `ℂ²⊗ℓ²≅ℓ²`; A=0 on ℓ²≠0 is degenerate, hence `[Nontrivial A]` | hold | none |
| `IsNormalFunctional`, `isNormalFunctional_iff_exists_tsum_inner` | ultrafilter limit; `ξ_n=2^(−(n+1)/2)e_n` | `φ(1_{0..N})=0` against `φ(1)=1`, so not normal; `Σ‖ξ_n‖²=1`, `Σ⟨ξ_n,xξ_n⟩=Σ2^(−n−1)x_n`, `1−2^(−N−1)↑1` | both directions | none |
| `isCyclic_iff_isSeparating_commutant` | M₂ on ℂ²; diagonal; H=0 | `e₁₂e₁=0`; `(1,1)` is both, `(1,0)` neither; on H=0 the vector 0 is both | holds | none |
| `equivalent_of_subequivalent` | M₂, `v=e₁₁`; shift S on ℓ² | `e₁₁≼1`, `e₁₁≁1`; `S*S=1`, `SS*=1−e₀e₀*` | equivalence, not equality | none |
| `tracialState_unique` | `x↦x₁₁`; `ℂ⊕ℂ` | `τ(e₁₂e₂₁)=1` against `τ(e₂₁e₁₂)=0`; the family `t·pr₁+(1−t)·pr₂` | factor hypothesis needed | none |
| `exists_faithful_tracialState`, `isSimpleRing_of_isTypeIIOne` | ideal ∋ x≠0; B(ℓ²) | `ε=‖x*x‖/2`, `f_ε(x*x)x*x=1_[ε,∞)(x*x)≠0`, and `1=Σv_i*pv_i` with `n≥1/τ(p)`; finite-rank operators form a proper ideal of the non-II₁ B(ℓ²) | holds | none |
| `exists_isNormalSemifiniteTrace_of_isFactor` | B(ℓ²); τ'=0; the ∞ map | `Tr(p)=rank p`; τ'=0 gives c=0 (the null ideal of a normal trace on a factor is 0 or M); the ∞ map has no nonzero y with τ(y)<∞, so it is not semifinite | holds | none |
| `exists_conj_commutant_eq_of_isCyclic` | M₂ on ℂ²; L∞ on L²[0,1] with Ω=1; H=0 | `⟨e₁,e₁₂e₂₁e₁⟩=1` against `⟨e₁,e₂₁e₁₂e₁⟩=0`, so not tracial; `Jf=f̄`, `JMJ=M=M′`; J=0 | holds | none |
| `existsUnique_typeDecomposition` | `M₂⊕R`; weak type-I clause | `(1⊕0,0⊕1,0,0)`; `(1,0,0,0)` would also pass a single-abelian clause; cross products `z_i z′_j` (i≠j) vanish clause by clause | unique | none |
| `ergodicSMul_dense_subgroup` | ℤ⊂ℝ; ℚ⊂ℝ; `G=⋃γU` | `1_(⋃[n,n+1/2))` is ℤ-invariant and nonconstant; Γ dense gives `G=⋃_γ γK`, which is σ-compact | density needed | none |
| `existsUnique_isKMS_flow` | M₂, `h=diag(2/3,1/3)`, `x=e₁₂`, `y=e₂₁` | `F(z)=(2/3)2^(iz)`, `F(t+i)=(1/3)2^(it)=φ(yσ_t x)`; for `r=3`, `(2/3)3^(it)/3=(2/9)3^(it)≠(1/3)3^(it)`; `(2/3)/r=1/3 ⇔ r=2`; Gibbs at β=−1 is `Tr(h·)`, at β=1 `diag(1/3,2/3)` | exists and unique; β=−1 crosswalk | none |
| `HasTypeITwoSummand` | M₂; M₃; M₄; abelian | `e₁₁+e₂₂=1`; `2·rank e=3` is impossible; `eM₄e≅M₂` is noncommutative; `v*v=vv*` forces `e=f`, so `ef=0` gives `e=0` | as stated | none |
| `exists_unique_extension_of_finitelyAdditive` | M₂ sgn frame; M₃ `diag(1,−1,0)` | fitting `(a+⟨b,n⟩)/2` at the axes gives `1/2+n₃/4`, which is 0.677 at `(1/√2,0,1/√2)` against f=0.75; C=1 against norm `Tr|D|=2≤4C` | I₂ exclusion needed; 4C bound | none |
| `dye` | transpose on M₃; Bloch map | `(e₁₂e₂₁)ᵀ=e₁₁` against `e₂₁e₁₂=e₂₂`; `(1/√2,0,±1/√2)↦(1,0,±2)/√5` with inner product −3/5 | Jordan, not star; I₂ needed | none |
| V2.RectangularL2 (touched by R03) | counting ℕ; Lebesgue; `∞·Leb` diagonal | `e_i⊗e_j↦e_(i,j)`; diagonal κ-null; a finite-cost rectangle has a null factor, so the diagonal ⊆ ⋃ null `A_n∩B_n` is impossible and the cost is ∞, against native `∫ν({x})dμ=0` | conventions differ off σ-finite | none |
| V11.DoubleDualEmbedding (touched by R03) | G=ℤ, K=𝕋, ε<2; G=ℝ, `ξ=1_[0,1]` | n≠0: `z=e^(iπ/n)` gives `|zⁿ−1|=2≥ε`, so the neighbourhood is `{0}`; `⟨ξ,λ_gξ⟩=max(1−|g|,0)`, density `(sin(t/2)/(t/2))²/2π` of mass 1 | holds | none |
| Downstream ids (R02) | 33 V-ids cited by 14 roadmaps on main | every id greps in the head README | none dropped | none |
| V10.ModularTheory Checks | M₂, `h=diag(2/3,1/3)`, `x=e₁₂`; all-ones x | `he₂₁h^(−1/2)=(1/3)(3/2)^(1/2)e₂₁=6^(−1/2)e₂₁` against `x*Ω=(2/3)^(1/2)e₂₁`; `h^(1/2)x=[[√(2/3),√(2/3)],[√(1/3),√(1/3)]]` is not self-adjoint | Δ and cone exponent 1/4 pinned | none |
| V10.FiniteComplexPowers Check | `h=[[1/2,1/6],[1/6,1/2]]` | det 2/9, `h⁻¹=[[9/4,−3/4],[−3/4,9/4]]`, `β₁(e₁₁)=[[9/8,−3/8],[3/8,−1/8]]`, with adjoint `[[9/8,3/8],[−3/8,−1/8]]=β₋₁(e₁₁)` | holds | none |
| V11 Pedersen–Takesaki Checks | `k=diag(2/3,1/3)`, `h=diag(3/2,0)`; `v=(1,1)/√2` | `Tr(kh^(1/2)xh^(1/2))=(2/3)(3/2)x₁₁=x₁₁`; `ψ_v(σ_t e₁₂)=2^(it)/2=−1/2` at `t=π/log 2` | nonfaithful case needs singular h | none |
| V12 Checks | `R⊕ℂ`, `τ=(1/4)τ_R+(3/4)c`; `ℓ∞` weight | `(1/4)(1+|λ|²)+(3/4)|z|²≥1/4`; `|τ(v,z)|≥3/4−1/4=1/2`; `Σ_(n≤N)(n+1)=(N+1)(N+2)/2`, giving 1, 3, 6 | hold | none |
| V9 Checks | S₃, `Γ={e,(12)}`, `f=1_{(13)}`; PSL₂ | right sums 1,1 against left sums 1,0, since `(12)(13)(12)=(23)`; `(n−1)/(4π)·π/3=(n−1)/12`, and at n=2, c=2: `1/(8π)·2π/3=1/12` | hold | none |
| V8 Checks | `f=δ₋₁+iδ₀+δ₁`; `h_ε*1_[0,1]`; affine group | `|2cosθ+i|≤√5<3`; four ramps of `ε/12` give ε/3, and at ε=1 the error is `1/4+1/12+1/12=5/12`; `c(α,β)=α` from the Jacobian α | hold | none |
| V4.0.Multiplication Check | `μ₁=δ`, `μ₂=2δ`, `w=1/2` | `μ=(3/2)δ`, `r=(2/3,4/3)`, `(2/3|f₁|²+4/3|f₂|²)·3/2=|f₁|²+2|f₂|²` | unitary scaling | none |

## Not verifiable

- **tomiyama-1957:**
  - The cached text (sha `9abeb0fc…`) is a five-line Incapsula "Request unsuccessful" page, yet the board manifest records it as `certified`. It should be refetched.
  - The J-STAGE copy (`pjab1945/33/10/33_10_608/_pdf`) is a CCITT image scan with no text layer, and this worker has no OCR.
  - The README cites it only for positivity and bimodularity in the unital case. Hiai 6.5 and AP §A.4, both read above, carry that attribution.
- **wassermann-1988:** the GDZ scan is image-only and there is no OCR. The theorem of the Introduction (p. 309) and Theorem 1 (p. 311) cited in V8.CompactErgodicActions are unchecked.
- **Uncertified and settled, cited by locator:** Arveson 1969 Theorem 1.2.3; Haagerup 1985; Haagerup 1987; Connes–Størmer 1978.
- **Not in the cache:**
  - Takesaki I–III, including I IV.4.9, II IX.4.2, III XV.3 and XVI.1.9/1.22–1.23;
  - Sakai Theorem 4.1.6;
  - Reed–Simon I and Rudin;
  - Runde;
  - Goodman–de la Harpe–Jones §3.3;
  - Gleason 1957;
  - Bost–Connes, Laca–Raeburn and Neshveyev;
  - Connes 1973, 1975 and *Periodic automorphisms*;
  - Araki–Woods, Connes–Woods and Connes–Takesaki.

## Source issues

- **Misprint** in anantharaman-popa at Appendix A.4, printed p. 314: the source spells the author of [Tom57] "Tomyiama" in the sentence crediting him; it should be "Tomiyama"; affects nothing.
- **Gap** in hiai-lectures at Theorem 6.5, pp. 55–56: the theorem is stated for an arbitrary C*-algebra and C*-subalgebra, but the proof treats only a von Neumann algebra with a unital von Neumann subalgebra; it should add the bidual reduction for the general and nonunital case; affects the proof.
