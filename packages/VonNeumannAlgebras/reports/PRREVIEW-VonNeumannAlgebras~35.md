# Review of VonNeumannAlgebras (pull request #1041 at 9c3f832)

**Verdict:** needs changes

The head is the one the previous review read; the folder has no changed lines. The one previous finding (the branch pin) is not repaired and is carried as R01. This full pass found two new P3 defects. R02: Hiai's Theorem 9.4 is cited for the Pedersen–Takesaki theorem, but the theorem is Hiai's Theorem 9.7, and that covers only faithful weights. R03: a References note says the Hilbert–Schmidt norm is a V4.Core target, which contradicts the Scope and V4.Core. No finding is blocking. The gate passes and the dependency check is clean. `Suggested.lean` elaborates with exactly its 24 `sorry` warnings, all 41 elaborated signatures keep their binders, and the one-tactic probe closes none of the 24 sites. Every seeded-sample locator in 13.1–13.2 that the cached sources can check was confirmed.

## Previous findings (review of 9c3f832)

- **R01 (branch at the old pins; Tau Ceti contract cites modules absent at its own pin): not repaired.**
  - The folder is unchanged.
  - `lake-manifest.json` still pins Tau Ceti `a91d3aaf` and Mathlib `6b7abb3c`; main pins `2fd255d9` and `1b1ccf4b`.
  - `git merge-tree --write-tree origin/main HEAD` still prints `CONFLICT (add/add)` for `README.md` and `Suggested.lean`.
  - `Suggested.lean:17–18` still reads "written out so that the file imports only Mathlib".
  - Carried below as R01.

## R01 (P3) — The branch is still at the old pins and conflicts with the roadmap now on main

**Location:**
- `TauCetiRoadmap/VonNeumannAlgebras/README.md:226–321` (the "From Tau Ceti" contract), ending "Each is used as stated at the pin."
- `TauCetiRoadmap/VonNeumannAlgebras/Suggested.lean:17–18`.

**Claim:** At the branch's own Tau Ceti pin, most of the contract does not exist, so "at the pin" holds only at main's pin. The branch also still conflicts with main's copy of this roadmap. That copy has been on main since 2026-11-05 and now carries generated `PROGRESS.md` and `STATUS.md` files.

**Witness:**
- `git grep` at `a91d3aaf` finds no declaration of, among others, `PositiveLinearMap.denseRange_gnsStarAlgHom_gnsVector`, `TauCeti.CStarAction.IsKMSFunction`, `Matrix.gibbsState`, `LinearMap.existsUnique_trace_mul_eq`, `Submodule.quotientDualEquivAnnihilator` or `TauCeti.NuclearOperator`. All of them are declared at `2fd255d9`.
- `git merge-tree`: add/add conflicts in both files.

**Repair:**
- Rebase onto main, or merge main, resolving both conflicts in favour of this head's `README.md` and `Suggested.lean`. Keep main's `PROGRESS.md` and `STATUS.md`. This is the worker's step at submission and does not change the folder's mathematics.
- Then state the Layer 0 nondegeneracy clause as `π.IsNondegenerate`, add `import TauCeti.Analysis.CStarAlgebra.Representation.Nondegenerate`, and delete `Suggested.lean:17–18`.
- Control: the previous round elaborated both the unchanged file and this variant at main's pins, each with exactly 24 `sorry` warnings. The file has not changed, so the control was not re-run.

## R02 (P3) — Hiai's Theorem 9.4 is cited for the Pedersen–Takesaki theorem, which is Theorem 9.7 and covers only faithful weights

**Location:**
- `README.md:3545–3549`: "prove the Pedersen–Takesaki theorem (Hiai, Theorem 9.4): a normal semifinite ψ invariant under σ^φ is uniquely φ_h for a positive operator h affiliated with the weight centralizer … including supports and nonfaithful ψ."
- `README.md:4955`: "Theorem 9.4 (Pedersen–Takesaki)".

**Claim:** The cited theorem does not state the representation of ψ. The source that does state it assumes ψ faithful, while the README extends the statement to nonfaithful ψ with no locator for the extension.

**Witness:**
- hiai-lectures line 4223, Theorem 9.4 (p. 84): for a given nonsingular A, σ^(φ_A) = A^(it)σ^φ(·)A^(−it) and (Dφ_A:Dφ)_t = A^(it).
- hiai-lectures line 4416, Theorem 9.7 (p. 87), "Pedersen and Takesaki": for φ, ψ ∈ P(M) (faithful weights, line 3535), ψ is σ^φ-invariant iff ψ = φ_A with A nonsingular.

**Repair:**
- At `:3545`, cite "Hiai, Theorem 9.7, p. 87" for the representation of a faithful σ^φ-invariant ψ, and keep "Theorem 9.4, p. 84" for `(Dφ_h:Dφ)_t=h^(it)` at `:3550`.
- State the nonfaithful case as derived here: s(ψ) is σ^φ-invariant, so it lies in the centralizer; apply CentralizerCornerRestriction on s(ψ)Ms(ψ) and Theorem 9.7 there, and extend h by 0. Alternatively, cite a source that covers the nonfaithful case.
- At `:4955`, write "Theorems 9.4 and 9.7 (Pedersen–Takesaki)".
- Tested on the M₂ instance in the adversarial table: with ψ = Tr(e₁₁·), h = e₁₁ is singular, so Theorem 9.7(vi) does not apply but the support reduction does.

## R03 (P3) — A References note contradicts the Scope on who owns the Hilbert–Schmidt norm

**Location:**
- `README.md:5027–5030`: "The pinned Mathlib has no density-matrix or finite Hilbert–Schmidt declarations; the density-matrix correspondence is a V10 target, and the Hilbert–Schmidt norm is the V4.Core target."
- `README.md:5055`, and the link at `:865`.

**Claim:** This ownership statement sits outside the Scope and contradicts it. The Scope (`:28–31`), the OperatorTheory contract (`:345–349`) and V4.Core itself (`:1133–1135`) all consume the Hilbert–Schmidt norm from OperatorIdeals OI-B32–B41. V10.KMS (`:2956–2957`) consumes the density correspondence from Tau Ceti's `LinearMap.existsUnique_trace_mul_eq`.

**Witness:**
- `TauCetiRoadmap/OperatorTheory/OperatorIdeals/README.md:363` on main: "OI-B36 — Hilbert–Schmidt norm."
- This README's `:1134–1135`: "the Hilbert–Schmidt class S₂(H,K) and norm ‖·‖₂ of OI-B32–B41."

**Repair:**
- Delete the bullets at `:5024–5030`, which are not references. If the trace-density convention is wanted, move it to Conventions as "positive functionals on finite-dimensional algebras are `x↦Tr(hx)` (Tau Ceti's trace duality); positivity and faithfulness of h are V10's".
- Delete `:5055`: it holds Zulip design-discussion links and a process instruction ("Supply the required missing results here…").
- Drop the Zulip "finite-product design" link at `:865`; the Mathlib file it describes is already named there.
- Ownership statements belong in Scope and ownership only, which already states the correct owners.

## Verified sound

**Gate and dependency check.**
- My gate run at 9c3f832 printed: `gate VonNeumannAlgebras: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, exit 0. The worker's run adds `build=0`.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/VonNeumannAlgebras'` is empty.
- The dependency check printed, exit 0:

```text
depcheck: 236 roadmaps, 2281 edges, 0 problem(s)
```

- There is no UPWARD, CYCLE or `moved:` line. VonNeumannAlgebras is at line 5 of the merge order.

**Lean, at the branch pins.**
- `lake env lean` on `Suggested.lean` exits 0 in 33 s with exactly 24 `declaration uses 'sorry'` warnings, at lines 101, 112, 123, 132, 143, 172, 181, 208, 225, 245, 276, 286, 293, 322, 338, 365, 383, 402, 430, 446, 464, 499, 506 and 516.
- **`#check @name` on all 41 declarations** (24 theorems and 17 definitions) in a scratch copy: exit 0 in 31 s. Every H-declaration keeps `[NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]`.
  - `isInjective_iff_isHyperfinite` and both uniqueness theorems keep `[SeparableSpace H]` (and `[SeparableSpace K]`).
  - `tomiyama` keeps `[PartialOrder A] [StarOrderedRing A]`.
  - `ergodicSMul_dense_subgroup` keeps `[T2Space G] [LocallyCompactSpace G] [BorelSpace G] [μ.IsHaarMeasure] [μ.Regular] [Countable Γ]`.
  - `exists_injective_nondegenerate_representation_lp` keeps `[SeparableSpace A] [Nontrivial A]`.
  - Each type matches its README statement; nothing changed.
- **One-tactic probe:** each `sorry` was replaced by `first | (simp; done) | (aesop; done) | rfl | infer_instance | trivial | exact?`. The run exits 1 in 103 s with 24 errors, all "`exact?` could not close the goal" and one per site. No declaration is padding.
- **Headline coverage.** The Summary's end theorems are the bicommutant theorem, existence and uniqueness of the II₁ trace, Dye, injective ⟺ hyperfinite, and II₁ and II∞ uniqueness; all are stated. Tomita–Takesaki is stated in its KMS existence-and-uniqueness form. The docstring names what is not statable: the ultraweak forms, `⊗̄`, the modular operator, `S(M)` and `T(M)`, III_λ, III₀ and III₁ uniqueness, and the ultraproduct. Mathlib at the pin has no Hilbert–Schmidt, ultraweak or modular-operator declarations (grep).

**Library declarations opened.**
- Mathlib `6b7abb3c`: `MeasureTheory.Measure.map_right_mul_eq_modularCharacterFun_smul` (`MeasureTheory/Group/ModularCharacter.lean:93`: `map (· * g) μ = modularCharacterFun g • μ`), `modularCharacterFun` (`:45`) and `modularCharacter` (`:130`). These are the `c(g)` with `∫f(xg)dμ = c(g)∫f dμ` that `README.md:368–369` and the affine-group Check use.
- Tau Ceti, `a91d3aaf` and `2fd255d9`: `MeasureTheory.FiniteMeasure.ext_of_forall_pontryaginMeasureTransform_eq_of_innerRegular` (`Analysis/Fourier/Pontryagin/Uniqueness.lean:263`, both pins).
- Tau Ceti, `2fd255d9`: `PontryaginDual.continuous_coe_eval_const` (`DualEval.lean:29`), `VonNeumannAlgebra.adjoin` (`Analysis/VonNeumannAlgebra/Adjoin.lean:38`) and `StarSubalgebra.exists_forall_norm_sub_apply_lt_of_mem_centralizer_centralizer` (`Density.lean:128`).
- A declaration grep over 40 of the contract's Tau Ceti names finds 25 declared at `2fd255d9` but not at `a91d3aaf` (R01). The other 15 are at both pins; `ext_of_forall_pontryaginMeasureTransform_eq_of_innerRegular` was confirmed by a direct grep (`Uniqueness.lean:263`).
- The bicommutant file named in main's `STATUS.md` (`Analysis/VonNeumannAlgebra/Bicommutant.lean`) is at neither pin, so none of this file's headlines is already proved at the pins.

**Cross-roadmap citations and ownership.**
- Main now holds this roadmap; this head revises it. All 52 headings are unchanged.
- Four ids moved: V2.AbelianClassification, V2.AbelianLocalizable and V2.AbelianRepresentationMultiplicity became V4.*, and V7.GroupApplications became V8.GroupApplications. This removes main's upward Layer 2 → Layer 4 and Layer 7 → Layer 8 uses.
- No roadmap on main or at an open head cites the old ids: `roadmaps grep` and a scan of the 13 roadmap READMEs on main plus all open heads that cite VonNeumannAlgebras. Every id those roadmaps cite exists at this head (V4.0.Fields, V4.Core, V7.Index, V10.TracialLp, V13b.SpatialNorm, V10.AffineAP and others; 21 distinct ids).
- All 22 relative links and their 6 section anchors resolve on main (`dba22e3`).
- Supplier ids opened on main:
  - OperatorIdeals OI-B29–B41 (`README.md:349–375`).
  - PolarDecomposition PD-A36, PD-A45, PD-B23, PD-B24 and PD-B36 (`:211, 227, 371, 373, 397`).
  - BanachAlgebras A7.IntegratedRepresentations, A7.RegularL2 and A7.CharactersAndUniqueness (`:1615, 1633, 1739`).
  - Chebotarev Layers 13–14 (`:593, 612`).
  - LieHighestWeight Clebsch–Gordan (`:348`).
  - SemisimpleAlgebras double centralizer (`:28`).
- AnalyticNumberTheoryPartII (#1167) consumes V10.Hecke, V10.AffineHecke, V10.AffineAP, V10.AffineType, V8 and V11 as a consumer; it owns none of them. OperatorAlgebraDynamics (#1137), QuantumFoundations (#1771), CategoricalOperatorAlgebras (#888) and NoncompactQuantumSymmetry (#1015) are consumers.
- `roadmaps overlaps` lists no other pull request changing this roadmap and no dropped id.

**Sources: the seeded sample (13.1, 13.2) and other locators re-read.** anantharaman-popa printed page = pdf page − 6.
- **13.1 (Tomiyama, injectivity):**
  - hiai-lectures line 2666: Theorem 6.5, pp. 55–56 (norm-one projection ⇒ (ii) bimodular, (v) CP).
  - peterson-notes line 3948: Theorem 6.2.1, p. 98.
  - anantharaman-popa lines 7191 and 7198: Definition 10.2.1 and Proposition 10.2.2 (i)–(iii), p. 161.
- **13.2 (semidiscreteness, approximation, classification):**
  - anantharaman-popa lines 7269 (Proposition 10.2.5, p. 163); 7325 and 7333–7344 (Theorems 10.2.8–10.2.9, p. 164, sup over ‖x‖≤1 of |Tr(xT²)−τ(x)|≤ε); 7413 (Theorem 10.3.1, p. 166, strict `<ε‖P‖`, so P≠0); 7532 (Theorem 10.3.4, p. 168).
  - anantharaman-popa lines 7685, 7697 and 7702 (Definitions 11.1.1–11.1.2 and Theorem 11.1.3, p. 173); 8294–8302 (Theorem 11.2.2 (1)–(5), p. 186); 8358–8377 (Remark 11.2.3, AFD definition, Corollary 11.2.4, p. 188); 8397–8410 (Notes, p. 189, "the converse being immediate").
  - peterson-notes line 4146: Theorem 6.3.8, p. 103.
  - hiai-lectures lines 327–337: §1.8, p. 9.
  - haagerup-1989 lines 23–37 (p. 265) and 1177–1180 (Theorem 6.1, p. 303).
  - haagerup-2016 lines 49 and 52 (Theorems 1.1–1.2, p. 2), and 222, 284, 313, 635, 669, 868 and 1109 onwards (Theorems 2.4, 2.8, 3.1, 4.2, 5.1, Lemmas 4.4 and 5.4–5.6).
  - connes-feldman-weiss lines 265, 281, 336, 382, 480 and 520 (Definitions 5–6, Proposition 7, Lemmas 8–9, Theorem 10).
- **Elsewhere:**
  - anantharaman-popa Propositions 8.2.2, 8.3.6, 8.3.8, 8.4.2, 8.5.5, 8.6.1, 8.6.2, Definitions 8.3.1, 8.3.2, 8.5.4, Corollary 8.3.5, Theorems 2.5.5, 3.1.4, 3.2.1, 6.2.8, 6.3.4, 6.3.5, 7.1.1, 8.1.1, Remarks 2.5.7, 3.1.5, 8.1.2, Definitions 2.5.1, 2.6.6, Corollary 2.4.11, Propositions 2.4.13 and 4.1.6: all at the README's pages.
  - peterson-notes Theorems 2.5.6, 2.6.4, 2.7.4, 2.8.5, 3.3.1, 3.3.9, 4.3.3, 4.4.6, 4.9.4, Lemmas 2.5.5, 2.8.8, Corollaries 3.3.2, 4.1.7, Propositions 4.2.2, 4.7.12, 4.9.5: all at the README's pages. Theorem 4.9.4 (line 3080) is exactly the headline `exists_isNormalSemifiniteTrace_of_isFactor`, and Theorem 3.3.1 (line 1893) the type decomposition.
  - jones-vna Theorems 3.2.1–3.2.2, Corollary 3.2.3 (p. 12), Example 3.3.4 (p. 13), EP10 (p. 23), Theorems 4.4.1–4.4.2, 4.5 (pp. 28–29), Theorem 5.2.1, Corollary 5.2.2 (pp. 32–33), Theorem 8.1.15 (p. 53), §10.1 (p. 61), §11.2 and Examples 11.2.17 and 11.2.21 (pp. 73–74), §§16.1–16.2 and Theorem 16.3.1 (pp. 107–108).
  - houdayer Theorems 3.1 (p. 12) and 3.16 (p. 17).
  - hiai-lectures Theorems 2.2, 2.14, 3.12, 3.13, 6.6, 7.6, 10.7, 13.17, Lemma 2.13 (Gaussian means in its proof, p. 18), Propositions 3.8, 13.6, 13.14, 13.16, Remark 13.18; Theorems 9.4 and 9.7 (R02).
  - bunce-wright-1992 lines 36–39 (conditions (a)–(b), p. 288), 53–59 (Theorems A–B, p. 289) and 85–86 (the `4 sup` estimate in Lemma 1.1). The arXiv pages 1–2 are the printed pp. 288–289.
  - hamhalter-2014 lines 85–91 (Dye recalled, pp. 2–3) and 627 (Theorem 4.3, p. 14).

**Adversarial pass.** Every value below was computed this round.

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| `tomiyama` (13.1) | diagonal E on M₂, a=diag(2,3), b=diag(5,7), x=[[1,2],[3,4]]; F(x)=E(x)+x₁₂e₂₁; P=e₁₁·e₁₁; A=0 | axb=[[10,28],[45,84]], E(axb)=diag(10,84)=aE(x)b; F(F(x))≠F(x), not a projection; ‖P‖=1, P(1)=e₁₁≠1; on A=0 ‖P‖=0≠1 (vacuous) | holds, nonunital form needed |
| Arveson Checks (13.1) | transpose⊗id on Σe_ij⊗e_ij; ρ=[[1/2,c],[c̄,1/2]] | image is the flip, eigenvalue −1 on e₁⊗e₂−e₂⊗e₁; det ρ=1/4−\|c\|²≥0 iff \|c\|≤1/2; Tr(ρ·diag(a,b))=(a+b)/2 | holds; existence only |
| `IsInjective`, `IsHyperfinite`, `isInjective_iff_isHyperfinite` | H=0; B(ℓ²); ℓ∞; L(F₂) | H=0: P=0, ‖P‖=0≤1; A_n={0}, double commutant {0}. B(ℓ²): A_n≅M_n⊕ℂ increasing, SOT-dense union, identity projection. ℓ∞: diagonal expectation of norm 1. L(F₂): a hypertrace gives m(W(a))+m(W(a⁻¹))=1=m(W(b))+m(W(b⁻¹)), total 2 on disjoint sets of total mass ≤1 | both sides agree |
| Følner operator and projection forms (13.2) | ℂ², τ=(a+2b)/3, u=(1,−1), x=(1,0), ε=1/10 | basis √3δ₁, √(3/2)δ₂; rank-one P onto (α,β): ‖uP−Pu‖²=8\|α\|²\|β\|²≤1/100 ⇒ \|α\|²≤0.00125 or ≥0.99875; Tr(xP)/TrP=\|α\|²; P=1 gives 1/2; τ(x)=1/3 is off by >1/10 in all cases; T=diag(3^(−1/2),(2/3)^(1/2)): TrT²=1, Tr(xT²)=a/3+2b/3 | projection form needs a II₁ factor; operator form holds |
| Semidiscreteness Checks | ℓ∞ truncations; E_n1_[0,1/3] on L∞[0,1] | ‖(1,1,…)−(1,…,1,0,…)‖=1; 2ⁿ mod 3∈{1,2}, so the value is c∈{1/3,2/3}; ‖E_nf−f‖_∞=max(c,1−c)=2/3≥1/3; ‖E_nf−f‖₁=2c(1−c)2^(−n)=(4/9)2^(−n)≤2^(−n) | point-ultraweak, not norm |
| V13b.SpatialNorm Checks | u=e₁₂⊗e₁₂+e₂₁⊗e₂₁; f⊗1−1⊗f on C(X) | u: e₂⊗e₂↦e₁⊗e₁, e₁⊗e₁↦e₂⊗e₂, kills the mixed vectors, ‖u‖=1 vs Σ‖·‖=2; ‖f⊗1−1⊗f‖=sup\|f(x)−f(y)\|=1 for f onto [0,1] | holds |
| Bicentralizer Checks (13.2) | τ tracial; φ=Tr(h·), h=diag(2/3,1/3) on M₂ | (xτ)(y)=τ(yx)=(τx)(y); (xφ−φx)(y)=Tr((xh−hx)y); B(M,φ)=D (constant diagonal sequences give B⊆D′∩M=D, and off-diagonal parts →0); (e₁₂φ)(e₂₁)=φ(e₂₂)=1/3, (φe₁₂)(e₂₁)=φ(e₁₁)=2/3 | holds |
| CFW Checks | n atoms, full relation; finite classes | class average P(f)(x)=\|[x]\|⁻¹Σf(x,y) is unital, positive, invariant; regular algebra M_n | holds |
| II₁ and II∞ uniqueness (13.2) | M₂; R; B(ℓ²); R⊗̄B(ℓ²) | M₂: rank-one projections are minimal, so `IsTypeIIOne` fails; B(ℓ²): minimal projections, so `IsTypeIIInfinity` fails; R: `IsFinite`, so not II∞; R⊗̄B(ℓ²): 1⊗e₀₀ finite, 1 infinite, no minimal projections | hypotheses select exactly the intended factors |
| `exists_faithful_nondegenerate_representation` | A=0; A=ℂ; c₀ | A=0: K=0, π=0 injective, span{0} dense in 0; A=ℂ: π(z)=z on ℂ; c₀: diag on ℓ², span of ranges contains every e_n | holds |
| `exists_injective_nondegenerate_representation_lp` | A=ℂ; A=0 | ℂ: π(z)=z·1 on ℓ² (GNS ℂ amplified ℵ₀ times); A=0: span{0} not dense in ℓ², so `[Nontrivial A]` is needed | holds |
| `double_commutant_iff_isClosed_image_ofCLM` | ℂ1 on ℂ²; finite rank + scalars on ℓ² | (ℂ1)′=M₂, (ℂ1)″=ℂ1, WOT closed; second: A″=B(ℓ²)≠A and A not WOT closed (both sides false) | iff holds both ways |
| `closure_unitBall_eq_unitBall_double_centralizer` | A=ℂI; finite rank + scalars, q = even-coordinate projection | equality for ℂI; qP_n→q strongly in A's positive ball, while ‖q−(c1+F)‖≥max(\|1−c\|,\|c\|)≥1/2 | SOT, not norm, density |
| `closure_isStarProjection_eq_positive_contractions` | H=ℂ; C=1/2 on F⊕F′ | {0,1} closed, 1/2 excluded (finite dimension refutes the statement, so the hypothesis is needed); block [[1/2,1/2],[1/2,1/2]] is idempotent with compression 1/2 | holds |
| `exists_predual`, Sakai | B(ℂⁿ); H=0; M=ℂ | X = conjugate of (M_n,‖·‖₁), dimension n²; X=0; X=ℂ, z↦z̄ | holds |
| `IsNormalFunctional`, `isNormalFunctional_iff_exists_tsum_inner` | ℓ∞, φ_w=Σ2^(−n−1)x_n; ultrafilter state | φ_w(1_{≤N})=1−2^(−N−1)→1; ξ_n=2^(−(n+1)/2)e_n, Σ‖ξ_n‖²=1; the ultrafilter state has φ(1_{≤N})=0↛1, and a tsum form would force Σφ(δ_k)=1 against φ(δ_k)=0 | both directions |
| `isCyclic_iff_isSeparating_commutant` | M₂ on ℂ²; diagonal D on ℂ²; H=0 | M₂: every ξ≠0 cyclic, separating for ℂI; D: (1,1) cyclic and separating for D′=D, (1,0) neither (diag(0,1)(1,0)=0); H=0: both hold | holds |
| `equivalent_of_subequivalent` | B(ℓ²) shift; M₂ | S*S=1, SS*=1−e₀e₀*, so 1∼1−e₀e₀* while unequal; e₁₁≼1 but 1⋠e₁₁ (rank) | equivalence, not equality |
| `tracialState_unique` | M₂ x↦x₁₁; ℂ⊕ℂ; B(ℓ²) | e₁₂e₂₁=e₁₁ (value 1) vs e₂₁e₁₂=e₂₂ (value 0): not tracial; t·pr₁+(1−t)pr₂ tracial for every t (factor needed); 1=p+q, p∼q∼1, τ(1)=2τ(1) contradicts τ(1)=1 | holds |
| `exists_faithful_tracialState`, `isSimpleRing_of_isTypeIIOne` | R; B(ℓ²) | R: product trace, τ(x*x)=0⇒x=0; B(ℓ²) (not II₁) has the proper algebraic ideal of finite-rank operators | holds; the hypothesis is used |
| `exists_isNormalSemifiniteTrace_of_isFactor` | B(ℓ²); τ′=0; τ′=2Tr; the ∞-map | Tr(e₀₀)=1, Tr(1)=∞, finite ⟺ finite rank; τ′=0 is semifinite with c=0; c=2; the ∞-map fails semifiniteness | holds |
| `exists_conj_commutant_eq_of_isCyclic` | L∞[0,1], Ω=1; M₂ on ℂ²⊗ℂ², Ω=(e₁⊗e₁+e₂⊗e₂)/√2; M₂ on ℂ² | J f=f̄, JMJ=M=M′; second: ⟨Ω,(x⊗1)Ω⟩=tr(x)/2, tracial, JMJ=1⊗M₂=M′; on ℂ² vector states are pure, so the hypothesis cannot hold | holds |
| `existsUnique_typeDecomposition` | M₂⊕R; rival (1,0,0,0); H=0 | (1⊕0, 0⊕1, 0, 0); the rival fails the type-I clause on q=0⊕1 (an abelian e≤0⊕1 makes eRe commutative, so e=0); H=0: all four are 0=1 | unique |
| `ergodicSMul_dense_subgroup` | ℚ⊂ℝ; ℤ⊂ℝ | ⋃[n,n+1/2) is ℤ-invariant with measure neither 0 nor full; ℚ dense, ergodic | density needed |
| `existsUnique_isKMS_flow` | M₂, h=diag(2/3,1/3), x=e₁₂, y=e₂₁; Ad(diag(r^(it),1)) | σ_t(e₁₂)=2^(it)e₁₂, F(z)=(2/3)2^(iz), F(t+i)=(1/3)2^(it)=φ(yσ_t(x)); r=3 gives (2/9)3^(it)≠(1/3)3^(it); only r=2 passes | exists, unique |
| `HasTypeITwoSummand`, `exists_unique_extension_of_finitelyAdditive` | M₂; M₃; M₄; abelian; M₃ with μ=Tr(diag(1,−1,0)·) | M₂: e₁₁+e₂₂ works; M₃: 2·rank e=3 impossible; M₄: eM₄e≅M₂ not commutative; abelian: e∼f forces e=f, so e=0; C=1, ‖φ‖=2≤4; M₂ sgn frame function: affine fit 1/2+n₃/4 gives 0.677 at (1/√2,0,1/√2) vs 3/4 | holds; I₂ exclusion needed |
| `dye` | ℂ² swap; M₃ transpose; M₂ Bloch map | (a,b)↦(b,a); (e₁₂e₂₁)ᵀ=e₁₁ vs e₂₁e₁₂=e₂₂ (Jordan only); images (1,0,±2)/√5 have inner product −3/5, so no orthogonal map, no extension | holds |
| R02: Pedersen–Takesaki | M₂: φ=Tr, ψ=Tr(h·) with h=diag(2/3,1/3); ψ′=Tr(e₁₁·) | σ^Tr=id, so ψ is invariant, ψ=Tr_h and (Dψ:DTr)_t=h^(it) (Theorem 9.4(2)); ψ′ is invariant with s(ψ′)=e₁₁, h=e₁₁ singular, so outside Theorem 9.7(vi) but obtained by reduction to e₁₁Me₁₁=ℂ | statement true; locator and source scope wrong |
| R03: Hilbert–Schmidt ownership | diag(1/n) on ℓ² | ‖·‖₂²=Σ1/n²=π²/6, the OI-B36 norm consumed at `:1134–1135`; `:5030` names V4.Core | the roadmap disagrees with itself |
| Affine-group involution (V8.RegularL2 Check) | (a,b)(α,β)=(aα,aβ+b), da db/a² | right translation Jacobian α, so ∫f(xg)dμ=α∫f dμ, c(α,β)=α; inversion turns da db/a² into a′·dμ, giving λ(f)*=λ(f*) with f*(s)=c(s)·conj f(s⁻¹) | matches Mathlib's `modularCharacter` |
| V8.RegularL2 Checks | f=δ₋₁+iδ₀+δ₁ on ℤ; h_ε * 1_[0,1] on ℝ | \|2cosθ+i\|²≤5, so ‖λ(f)‖=√5<3; four ramps of ε/12 each give ε/3; at ε=1: 1/4+1/12+1/12=5/12 | holds |
| V10.Hecke and V10.AffineHecke counts | g=(m/n,b) | g(1,k)g⁻¹=(1,(m/n)k), ℤ∩(m/n)ℤ=mℤ, so L=m, R=n; Δv_g=(n/m)v_g=α⁻¹ | holds |
| V10.FiniteComplexPowers Check | h=[[1/2,1/6],[1/6,1/2]] | h⁻¹=[[9/4,−3/4],[−3/4,9/4]]; β₁(e₁₁)=[[9/8,−3/8],[3/8,−1/8]]; β₋₁(e₁₁)=[[9/8,3/8],[−3/8,−1/8]]=β₁(e₁₁)* | holds |
| V9 Check (formal degree) | PSL₂(ℝ), weight n, μ′=2μ | ((n−1)/4π)(π/3)=(n−1)/12; at n=2: (1/(8π))(2π/3)=1/12 | rescaling invariant |
| V11 Checks (core, Bochner, Plancherel) | M=ℂ core; ξ=1_[0,1] on ℝ | Tr(θ_sf)=∫f(σ+s)e^(−σ)dσ=e^s Tr f; (1/2π)∫(sin(t/2)/(t/2))²dt=1; ⟨ξ,λ_gξ⟩=max(1−\|g\|,0) | conventions pinned |
| V12 Checks | R⊕ℂ, τ=(1/4)τ_R+(3/4)c; product shift on ⊗_ℤM₂ | ‖(u_n,0)−(λ,z)‖₂²=(1/4)(1+\|λ\|²)+(3/4)\|z\|²≥1/4; \|τ(v,z)\|≥3/4−1/4=1/2; ‖u_(n+1)−u_n‖₂²=2 | holds |
| V7 Checks | N=M₂ with tr/2; N⊗̄M₂ | dim L²(M₂)=2/2=1, dim ℂ²=1/2; [N⊗̄M₂:N]=4; dim_(N⊗̄M₂)(L²N⊗ℂ²)=1/2 and dim_N=2=4·(1/2) | holds |

## Not verifiable

- **Wassermann III (wassermann-1988):** an image-only scan, and this worker has no OCR. "The theorem of the Introduction, p. 309" and "Theorem 1, p. 311" (`README.md:2479`, `:4975`) are unread here.
- **Høegh-Krohn–Landstad–Størmer 1981:** not in the manifest. It is cited through Pinzari's restatement; that restatement was verified in earlier rounds and was not reopened this round.
- **Uncertified, settled:** Arveson 1969, Theorem 1.2.3; Haagerup 1985; Haagerup 1987; Connes–Størmer 1978.
- **Tomiyama 1957, Theorem 1:** the cached text is a bot-block page. Hiai's Theorem 6.5 and Peterson's Theorem 6.2.1 cover 13.1's statement.
- **Not in the manifest or the cache:** Takesaki I–III (including the 13.2 locators XV.3, XVI.1.9, XVI.1.22–1.23, XVII.3.12, XVIII.1.1 and XVIII.2.1–2.9), Runde, Sakai, Reed–Simon I, Rudin (both books), Folland, Goodman–de la Harpe–Jones, Bost–Connes, Laca–Raeburn, Neshveyev, Connes 1973, 1975 and 1985, Connes's *Periodic automorphisms*, Connes–Takesaki, Araki–Woods, Connes–Woods, Gleason 1957 and Haagerup 1979.
- **Ownership against open pull requests:** checked through `roadmaps grep`, `roadmaps overlaps` and the sibling checkouts in the brief. Other open pull requests were checked only through those tools.

## Source issues

- **Gap** in hiai-lectures at Theorem 6.5, pp. 55–56: the source states Tomiyama's theorem for a C*-algebra and a C*-subalgebra but proves only the case of a unital von Neumann subalgebra; it should supply the bidual reduction for the general case; affects the proof.
- **Misprint** in anantharaman-popa at Remark 6.4.3 and Theorem 6.4.4(ii), p. 95: the source writes "center-valued conditional expectation" and points to Definition 9.1.5; it should read "center-valued trace", the term Definition 9.1.5 defines; affects a stated result.
- **Error** in jones-vna at Example 3.3.4, p. 13: the source says every positive contraction is a weak limit of projections; it should assume the Hilbert space infinite-dimensional, since on ℂ the scalar 1/2 is not such a limit; affects nothing.
- **Misprint** in jones-vna at Example 11.2.21, p. 73: a stray word appears in the sentence on generalising to countable dense subgroups of locally compact groups; it should be deleted; affects nothing.
- **Misprint** in hiai-lectures at the proof of Lemma 2.13, p. 18: the source says the Gaussian mean's extension satisfies x_n(s)=α_s(x); it should read α_s(x_n); affects the proof.
