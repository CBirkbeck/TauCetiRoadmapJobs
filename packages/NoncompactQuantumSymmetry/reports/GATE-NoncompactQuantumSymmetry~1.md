# GATE-NoncompactQuantumSymmetry~1: answers to human review

The review by roed-math, reviewed head `f42b4ff`, is split into seven points. The repairs are in commits `091a89a3` (review points) and `f7a5488d` (gate repairs, see "Gate repairs" below) on the PR branch, neither pushed. Line numbers in H01–H07 refer to `TauCetiRoadmap/NoncompactQuantumSymmetry/README.md` after `091a89a3`; `f7a5488d` changes no line before line 910 and turns 13 display blocks into fenced blocks, which shifts later lines by up to 6 (line numbers in "Gate repairs" are as committed).

## H01 (roed-math) — applied differently

The finding is correct: no roadmap named Quantum Foundations exists on main or in any of the 356 open roadmap pull requests (`roadmaps list` and `roadmaps grep 'QuantumFoundations|Quantum Foundations'` return only consumers that mention it). The review offered two repairs, and only one is open to this roadmap. Publishing a QF roadmap is outside this folder. So every interface the README took from QF0–QF1, QF4, QF5, QF5.P and QF6a is now owned here, in a new Layer P (lines 75–428, placed before M0a). All 53 QF mentions are rewritten to name the exact P item, for example line 822 "Consume QuantumFoundations QF0–QF1 and QF5 …" → "Consume Layer P.1 … and Layer P.3 …". The supplier bullet at old line 18 is replaced by the Layer P summary plus the two real external suppliers (lines 18–19). The downstream "QF6b consumes …" and "QF's existing probability/model comparisons" claims are removed. No QF reference remains (`grep -E 'QF[0-9]|Quantum ?Foundations'` finds nothing).

## H02 (roed-math) — applied

Layer P.3 (lines 211–297) now gives the contract the review asked for:
- the normalized locally continuous multipliers for a grading ε. These satisfy the twisted cocycle identity forced by `U_gU_h=ω(g,h)U_(gh)` with antiunitary odd `U_g`, and the conjugation-continuity condition of M1, written exactly as Neeb2004's `f_g`;
- the allowed coboundaries δb, with b continuous near 1;
- the theorem that `H²_lc(G,𝕋_ε)` classifies topological extensions that are locally trivial 𝕋-bundles (Neeb2004 Proposition II.6, read with continuous in place of smooth; WagemannWockel2015 Remark I.3 for connected G);
- the countable patching of a local section into a Borel section, which M1 line 833 consumes.

M1's Borel-to-locally-continuous comparison (lines 1084–1124) is the input this item is compatible with.

## H03 (roed-math) — applied

Layer P.4 (lines 298–359) states four results:
- **Smoothing:** `H²_ss≅H²_lc` for finite-dimensional Lie groups with coefficients `𝕋_ε`. The route is WagemannWockel2015 Proposition I.7 (checked at WagemannWockel2015 lines 253–258), with the conjugation condition carried across by LieGroups Layer 2's automatic smoothness.
- **Lie extension and differentiation:** `Dω(x,y)=d²ω(1,1)(x,y)−d²ω(1,1)(y,x)` (Neeb2004 Proposition II.6 and Lemma II.7, Neeb2004 lines 408–417 and 486–491).
- **Integration:** an isomorphism for simply connected G (Neeb2004 Theorem VII.2, lines 1521–1530, with `π₂(G)=0`), plus the exact sequence through `Hom(π₁(G),𝕋)` used for the SO(3) and SO₀(3,1) spin classes.
- **Whitehead lemmas:** the owner is AffineLieAlgebras §A1 on main, which proves `H¹=H²=0` for finite-dimensional complex semisimple g and finite-dimensional modules. The real case that M3 and M4 consume is owned here by complexifying the Chevalley–Eilenberg complex.

M3 (lines 1583–1584, 1622–1625) and M4 (line 2031) now cite these items.

## H04 (roed-math) — applied

Layer P.1 (lines 88–136) owns:
- `U(H)`, `UA(H)` with its grade, `PU(H)` and `PUA(H)`;
- Wigner's theorem (Freed2012Wigner Theorem 8);
- the faithful-ray comparison under `dim H ≥ 2`. A Check shows this hypothesis is needed: for H=ℂ, `PUA(ℂ)≅ℤ/2` acts trivially on the single ray.

Layer P.2 (lines 137–210) owns:
- the strong-operator Polish groups `U(H)`, `UA(H)≅U(H)⋊C₂`, `PU(H)` and `PUA(H)`, for H separable;
- the coefficient-generated Borel structures, proved equal to the Borel σ-algebras by Mathlib `Measurable.measurableEmbedding`;
- the quotient Borel structures, by Mathlib `QuotientGroup.borelSpace` (`MeasureTheory/Constructions/Polish/Basic.lean:648`);
- the explicit local section `s_ξ([U])=(conj⟨ξ,Uξ⟩/|⟨ξ,Uξ⟩|)U`;
- Pettis's theorem (Kechris1995 Theorem 9.10). Mathlib's `AddMonoidHom.continuous_of_measurable` (`MeasureTheory/Measure/Haar/NormedSpace.lean:79`) covers only normed targets;
- the connected ray-component corollary that M4 uses at line 2179.

## H05 (roed-math) — applied

Layer P ends with `### Dependencies` (line 421): P.1 → P.2 → P.3 → P.4; P.5 and P.6 depend only on their named suppliers; no P item consumes an M-layer. Each P item has a `*Needs:*` line naming Mathlib, Tau Ceti, LieGroups, AffineLieAlgebras §A1, SelfAdjointSpectralTheory or VonNeumannAlgebras. The consumer map at line 22 lists M1 (P.1–P.3), M2 (P.2), M3 (P.3–P.5), M4 (P.1–P.4), M5.Coding (P.2) and M6 (P.6).

## H06 (roed-math) — applied

- **QF6a:** replaced by Layer P.5 (lines 360–388). It defines position by multiplication and momentum as the Stone generator of `T_a=exp(−ia·P/ℏ)`, with the transform `F_ℏ` and its conjugation formulas, the Schwartz core and `[X_j,P_k]=iℏδ_jk`, for general ℏ. It replaces the earlier "QF6a's displayed units have ℏ=1".
- **QF4:** replaced by Layer P.6 (lines 389–412). It gives the permutation unitaries `U_σ(⊗v_i)=⊗v_(σ⁻¹i)`, which complete Tau Ceti's `PiTensorProduct.reindexRepresentation`, the projectors `P₊`, `P₋` and the flip Σ. M6 keeps every further tensor decomposition, as the review noted.

## H07 (roed-math) — applied

Layer P.3 (lines 225–244) now builds on Tau Ceti's factor-set API:
- the algebraic group of `E_ω` is `TauCeti.FactorSet.Extension`. Its law `⟨a·g•b·α(g,h),gh⟩` was checked to equal M1's `(z(g·w)ω(g,h),gh)`, and `canonicalSection_mul` is M1's convention `U_gU_h=ω(g,h)U_(gh)`;
- the Borel multiplier carries a forgetful adapter to `TauCeti.FactorSet G Circle` with the trivial action, and a graded variant with the action through ε;
- cohomologous multipliers transport via `rescaleEquiv` and `nonempty_groupExtensionEquiv`, coefficients via `FactorSet.map`, and the ungraded linear case compares with `isProjectiveRepEquivExtensionHom`.

The convention check: Mathlib's `IsMulCocycle₂` with trivial action is `BorelMultiplier.cocycle`, and FactorSet's single normalization implies both of BorelMultiplier's normalizations (`map_one_fst`, `map_one_snd`). In `Suggested.lean` only the `BorelMultiplier` docstring records this. No adapter definition is added, because the file's rules allow a definition only where a headline theorem needs one, and no headline uses `BorelMultiplier`.

## Ownership, citations and sources

- **Ownership.** I searched main and the open roadmap PRs for Wigner's theorem, Pettis, `PU(H)`/projective unitary group, locally continuous cohomology/`H²_lc`, antiunitary groups and Mackey–Weil. The only hits are unrelated (Bloch–Wigner, Milman–Pettis, Dunford–Pettis) or are consumers of these objects. So Layer P is owned here.
- **Whitehead lemmas.** These are owned by AffineLieAlgebras §A1 on main (checked at `origin/main` `d2e0f0d`).
- **Tau Ceti and Mathlib names.** Every Tau Ceti and Mathlib name cited in Layer P was checked at the pins: `TauCeti.FactorSet` and its API, `isProjectiveRepEquivExtensionHom`, `PiTensorProduct.reindexRepresentation`, `PointwiseConvergenceCLM`, `QuotientGroup.borelSpace`, `Measurable.measurableEmbedding`, `AddMonoidHom.continuous_of_measurable`, `LieModule.Cohomology.twoCocycle`/`d₁₂`/`d₂₃`, `SchwartzMap`, `VectorFourier.fourierIntegral`, `Projectivization`.
- **Sources read** (fetched through the sources service, all arXiv):
  - WagemannWockel2015 = arXiv:1110.3304v3: Proposition I.7, Remarks I.3, I.4, V.14;
  - Neeb2004 = arXiv:math/0402303v1: Proposition II.6, Lemma II.7, Theorem VII.2;
  - Freed2012Wigner = arXiv:1112.2133: Theorem 8, sequence (7), Example 10.
- **Uncertified source.** Kechris1995 (*Classical Descriptive Set Theory*, GTM 156), cited for Theorem 9.10 and §9.B, is paywalled and is cited by locator only (`uncertified`).
- **Manifest.** This roadmap folder has no `sources.toml`, and this job may edit only the README and `Suggested.lean`, so these four entries still need recording by whoever maintains the manifest.
- **Missing texts.** No `needs-references.toml` was written: no text is missing.
- **Suspicious text.** None found in the review text.

## Adversarial pass on the added and changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| P.1 faithful-ray comparison | H=ℂ; H=ℂ² | ℂ: `PUA≅ℤ/2`, `Aut(point)=1`, kernel is all of UA; ℂ²: kernel 𝕋 (λ₁=λ₂ from the ray of e₁+e₂; antiunitary sends [e₁+ie₂] to [e₁−ie₂]) | false for dim 1 | `dim H ≥ 2` stated, dim-1 Check added |
| P.1 grade well defined | H=0, H≠0 | on H=0 every map is both linear and antilinear | needs H≠0 | "nonzero" in the definition |
| P.1 action on Bloch sphere | C, J on ℂ² | C: `(x,y,z)↦(x,−y,z)`, det −1; J: `(x,y,z)↦(−x,−y,−z)`, `J²=−Id`, `C²=+Id` | consistent with Freed Example 10 | Checks |
| P.2 local section | U=diag(i,−1), ξ=e₁,e₂; swap matrix | `s_{e₁}=diag(1,i)`, `s_{e₂}=diag(−i,1)=−i·diag(1,i)`; swap has ⟨e₁,Ue₁⟩=0 | well defined, not global (`π₁(U(2))=ℤ` ≠ `ℤ×ℤ/2`) | Checks |
| P.2 PU coefficients separate classes | u=cv test | from a nonzero entry, `c=conj v_kl/conj u_kl`, `|c|=1` | separates | stated with the factor |
| P.2 Pettis | Hamel character of ℝ | discontinuous, not Borel | hypothesis needed | Check (I first drafted a wrong discrete-identity example and replaced it before committing) |
| P.3 graded H² of ℤ/2 | odd and even grading | odd: `ω(t,t)=±1`, `δb(t,t)=1` ⇒ ℤ/2; even: `δb(t,t)=b(t)²` ⇒ 0 | agrees with M4 `H²(ℤ/2,𝕋_conj)≅ℤ/2` | Check |
| P.3 ℝ² multiplier | `ω_θ` | commutator `exp(iθ(ab′−a′b))` | nontrivial for θ≠0 on a simply connected group | Check |
| P.3 Klein four | σ_x, σ_z | anticommute | nontrivial class | Check |
| P.3 patching | V, g₀=1 | piece 0 = V, so σ agrees on V; projection of `ĝ_nσ(g_n⁻¹g)` is g | correct | added |
| P.3 FactorSet convention | Tau Ceti law and `canonicalSection_mul` | `⟨a·g•b·α(g,h),gh⟩`; `σgσh=inl(α(g,h))σ(gh)` | same as M1 | adapter stated |
| P.4 Dτ for Galilei | τ of M3 | mixed derivative of `(t₂/2)|v₁|²` at v₁=0 is 0; `Dτ=v·a′−v′·a`; `[K_i,T_j]=δ_ij M`; opposite law gives −δ_ij M | agrees with M3 brackets | Check (replaced a draft claim about `t₁` that I could not verify) |
| P.4 integration needs π₁=0 | SO(3), SL(2,ℝ), ℝⁿ | SO(3): `Hom(ℤ/2,𝕋)=ℤ/2`, `H²(so3)=0` ⇒ ℤ/2; SL(2,ℝ): `H¹(SL̃₂,𝕋)=0`, `Hom(ℤ,𝕋)=𝕋` ⇒ 𝕋; ℝⁿ: `Λ²(ℝⁿ)*` | consistent with Neeb VII.2 sequence | Checks |
| P.4 Whitehead | ℝ² abelian | `H²=ℝ≠0` | semisimplicity needed | Check |
| P.5 Fourier signs | `T_a`, Gaussian ℏ=1 | `F(T_aψ)=e^(−ip·a/ℏ)Fψ`; `F(−iℏ∂ψ)=pFψ`; `F(xψ)=iℏ∂_pFψ`; `F_1ψ=ψ`; `[X,P]ψ=iψ` | consistent with M3 `Π(T_a)=exp(−ia·P/ℏ)` | Checks |
| P.5 domain | `(1+|x|²)^(−1)` in L²(ℝ³) | `∫r²/(1+r²)²dr<∞`, `∫r⁴cos²/(1+r²)²dr=∞` | maximal domain proper | Check |
| P.6 projectors | n=0,1,2; d=1; S₃ | `P₊=P₋=Id` for n≤1; `dim Sym²=d(d+1)/2`, `Λ²=d(d−1)/2`; left action gives `U_σU_τ=U_(στ)`, right action gives `U_(τσ)` | correct | Checks |

**Lean signatures.** Across both commits the diff to `Suggested.lean` changes:
- the import block: the thirteen `Mathlib.*` lines → `import Mathlib`, and the import of another roadmap's module (`TauCetiRoadmap.OperatorTheory.SelfAdjointSpectralTheory.Suggested`) removed;
- the `BorelMultiplier` docstring;
- the structure `CovariantPVM`, deleted. It was the only consumer of that import (its `projections` field was the other roadmap's `ProjValMeasure`), and no theorem in the file mentions it, so the rule allowing a definition only where a headline needs it does not cover it.

The module docstring now says that Mackey's imprimitivity theorem is not stated, because neither pin has a projection-valued measure carrier. A grep of the pinned Mathlib and Tau Ceti for `projection.valued`, `ProjectionValued` and `SpectralMeasure` finds nothing. README line 910 (unchanged position) no longer backticks `CovariantPVM`; it describes the covariant system in prose and names OperatorTheory/SelfAdjointSpectralTheory for the projection-valued measure. No surviving declaration's type changed, and all of them elaborate in the build below. I did not run the separate `#check @name` scratch elaboration, because the brief permits only the `lake build` and gate commands.

## Gate repairs

Commit `f7a5488d` repairs the gate failures the worker reported:
- **`imports=1`:** the roadmap-module import and `CovariantPVM` were removed, as described above.
- **`blob=21`:** every `[Name §x](https://github.com/…/blob/<sha>/…)` link → plain `Name §x` (README lines 11, 14, 15, 17, 29–30, 33–37, 39, 491, 939, 1033, 2052, 5409 as committed). The cited roadmaps (AutomorphicFormsOnReductiveGroups, CStarAlgebras, HilbertModules, LaguerreJacobi, LieGroupoidsPoisson, UnboundedOperators, PseudodifferentialOperators, VonNeumannAlgebras) are not on main, so a relative link would not resolve. Line 939's bare "D3/H3" now reads "OperatorAlgebraDynamics D3 and HilbertModules H3".
- **`latex=13` and `tex=57`:** the 13 `\[ … \]` displays in M1.MeasuredTensor, M2.MeasuredRefinement, M5.AffineG5 and M6.MeasuredPair → fenced Unicode blocks with the same formulas, for example `\operatorname{Res}_L^G\operatorname{Ind}_H^Gσ\simeq\int_Q^{\oplus}…` → `Res_L^G Ind_H^G σ ≃ ∫_Q^⊕ Ind_(L_q)^L σ_q dν(q)`. Also `(\mathbf a,0)` → `(𝐚,0)`, and the remaining `^{…}`/`_{…}` in prose → parentheses (lines 2081, 5218, 5594, 8145, 8259–8260, 8291). Recomputed while converting: the inverse `M(Λ,a,b,σ)⁻¹=M(Λ⁻¹,−Λ⁻¹a+Λ⁻¹bσ,−Λ⁻¹b,−σ)` satisfies the stated composition law, since `a′+Λ′a+b′σ = −Λ⁻¹a+Λ⁻¹bσ+Λ⁻¹a−Λ⁻¹bσ = 0`.
- **`residue=5`:** "Mellin packet(s)" → "Mellin wave profile(s)" (lines 4100, 4107, 5206, 5213, 5224 as committed). In References, "The Dooley packet is `<local file name>`, SHA-256 …" → "Dooley, *Mathematical Foundations of Quantum Mechanics*: …", Grundling's SHA-256 is dropped, and "the Dooley packet" → "the Dooley notes".
- **`round-labels=6`:** in the M5 DNC basis table and its proof (lines 5036–5141 as committed), the threshold called "gate" → "threshold", for example "gate1/(p+1)" → "threshold 1/(p+1)". The mathematics is unchanged.

## Build

`lake build TauCetiRoadmap.NoncompactQuantumSymmetry.Suggested`: **Build completed successfully (9024 jobs)**, with only `declaration uses 'sorry'` warnings in this module.

## Dependency check

```
depcheck: 148 roadmaps, 1002 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line.

## Gate

```
gate NoncompactQuantumSymmetry: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=1 metadata=0 dirty=0 outside-folder=0 source-material=0 FAIL
  depcheck: NOT IN ORDER: NoncompactQuantumSymmetry (insert it after its last supplier)
```

The only remaining item is `depcheck=1`, the design-stage "not in order" placement, which is not a defect.

Compared with the head (`prnum=1 mathlib-subimports=13 no-import-mathlib=1`), the PR-number citation (LaguerreJacobi "PR #117") and the Mathlib sub-imports are also gone.

The README still mentions the RelativisticQuantumFieldTheory roadmap (RQFT), which does not exist yet. Those mentions are downstream-consumer and ownership remarks, not supplier claims, and were not changed.
