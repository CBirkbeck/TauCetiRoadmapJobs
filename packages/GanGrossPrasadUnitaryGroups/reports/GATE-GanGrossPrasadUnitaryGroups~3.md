## H01 (roed-math) — applied

BPLZZ Proposition 4.8 had no owner: AutomorphicSpectralTheoryPartII at its head disclaims it (its README line 17) and gives it to the relative comparison. It is now target §6.3a of `TauCetiRoadmap/GanGrossPrasadUnitaryGroups/README.md:1359`, which proves the local equivalence of matching orbital integrals and matching relative characters (bplzz Lemma 4.9), the preservation of smooth transfer by multipliers with μ_h=bc_h(μ′) (Proposition 4.8) and the choice of base-change-compatible multipliers with value 1 at χ (Lemma 4.12). gap:spectral-isolation (`README.md:129`) is narrowed from "preserving transfer and the exact local support conditions" to the T-multiplier algebra with its scalar action, isolation of occurring cuspidal components (bplzz Theorem 3.19), GL_n cuspidal-support isolation (Theorem 1.3) and the symbol-restriction clause that §6.3a needs. These are what AutomorphicSpectralTheoryPartII §§4.3, 5.3 and 5.6 plan. §6.4 (`README.md:1382`) now cites §6.3a. The README does not name AutomorphicSpectralTheoryPartII as a supplier, for the merge-order reason given under H05.

## H02 (roed-math) — applied differently

The six "requested Part II local … extension of Layers 0–2" section contracts are gone. The three that serve only this roadmap's relative theory are now targets here: distribution-gk becomes §2.1a (generalized Harish-Chandra descent, null-cone homogeneity and the Gelfand–Kazhdan criterion, `README.md:408`), local-fourier-extension becomes §3.2a (`README.md:647`) and local-schwartz-germs becomes §3.3a (`README.md:697`). No roadmap on main or in an open pull request mentions Gelfand–Kazhdan, Jacquet–Rallis or Waldspurger–Beuzart-Plessis quasi-character coefficients. The three general group statements stay with general owners, but now cite sections that exist: local-tempered-bounds goes to AutomorphicSpectralTheory §0.48 and §§2.1–2.2, which is also where QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups (its README line 153) sends the same Ξ bound. local-plancherel, now nonarchimedean only, goes to AutomorphicSpectralTheory §§2.1–2.2, where the Harish-Chandra μ-function gives the Plancherel density. local-smoothing-trace goes to AutomorphicSpectralTheory §0.9 and §§0.48–0.49, the sections that EndoscopicTransferAndUnitaryTraceComparison §2.3 already uses for the trace-class property (`README.md:121`–`:125`).

## H03 (roed-math) — applied

Real Plancherel now has the owner that AutomorphicSpectralTheoryPartII names, under the same id and section contract: "What AutomorphicFormsOnReductiveGroups must provide (gap:real-plancherel-decomposition) … The section contract is §§2.4, 2.7" (`README.md:107`; compare AutomorphicSpectralTheoryPartII README lines 109–111). §§3.3, 3.5 and 6.3a cite it for the archimedean case and gap:local-plancherel for the nonarchimedean case.

## H04 (roed-math) — applied

The canonical Rankin–Selberg period of Eisenstein series and the Flicker–Rallis periods are now target §6.1a (`README.md:1242`), from bpcz Theorems 7.1.3.1 and 7.1.4.1, Theorem 6.2.6.1, Corollary 6.2.7.1 and §4.1.5. The Jacquet–Rallis distribution with its cuspidal parts I_χ is target §6.2a (`README.md:1303`), from bpcz Theorem 3.2.4.1. Neither AutomorphicSpectralTheory (its scope leaves relative trace formulas to consumers) nor AutomorphicSpectralTheoryPartII plans them, and this roadmap is their earliest consumer. gap:automorphic-spectrum (`README.md:127`) is narrowed to general Schwartz-test spectral analysis: χ-decompositions, Schwartz kernels and their majorization, Lapid's Langlands decomposition, truncation, and relative-character convergence (bpcz Proposition 2.8.4.1). §§6.2 and 6.3 now cite §§6.1a and 6.2a instead of "the supplied canonical periods".

## H05 (roed-math) — disputed

AutomorphicSpectralTheoryPartII §3.1 cannot be cited here. In the merge order it is #288, after this roadmap (#230) and after two consumers of this roadmap, TwistedAutomorphicDescents (#233) and QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups (#279). Moving this roadmap after it would put it after those consumers, so the citation is an UPWARD edge, not a `moved:` one. BPCZ Proposition 2.8.4.1 therefore stays in gap:automorphic-spectrum, now stated in full at `README.md:127`. All of AutomorphicSpectralTheoryPartII's suppliers stand at or before #223, and it names this roadmap only as an owner of relative applications. So placing it before #230 creates no cycle, and after that both §3.1 and §§4.3, 5.3, 5.6 can be cited by name. That is a merge-order decision, not a README edit.

## Pattern search

The five `EndoscopicTransferAndUnitaryTraceComparison` relative contracts (relative-geometric-comparison, relative-finite-transfer, relative-archimedean-transfer, relative-fundamental-lemma, relative-character-comparison) also use a "Part II relative comparison continuation" label. They stay addressed to EndoscopicTransferAndUnitaryTraceComparison (#138). The board package EndoscopicTransferAndUnitaryTraceComparisonPartII (#141) requests the same local Jacquet–Rallis comparison from that roadmap (its gap:jr-local-comparison), so making these targets here (#230) would put a supplier after a consumer. relative-character-comparison now also lists the two local Jacquet–Rallis trace formulas and the Plancherel density identity of bp-plancherel §5.6 and Theorem 5.5.3 that §6.3a uses (`README.md:155`). The "Needed by" lists of the affected contracts and the Dependencies of Layers 2, 3 and 6 were updated.

## Validation

Committed as `7df8ca8` — `GanGrossPrasadUnitaryGroups: review repairs (transfer-preserving multipliers and relative periods owned here; local gaps re-addressed)`. Only `TauCetiRoadmap/GanGrossPrasadUnitaryGroups/README.md` changed; `Suggested.lean` is unchanged. Not pushed.

Build, exit 0:

```text
✔ [8976/8976] Built TauCetiRoadmap.GanGrossPrasadUnitaryGroups.Suggested (26s)
Build completed successfully (8976 jobs).
```

Gate after the commit, exit 0:

```text
gate GanGrossPrasadUnitaryGroups: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

Dependency-direction check with `--movable`, complete output (no UPWARD, CYCLE or moved line):

```text
depcheck: 239 roadmaps, 2350 edges, 0 problem(s)
```

`roadmaps resolve` on the README reports no cross-roadmap citation and no Lean name found nowhere. The new Mathlib names were checked at the pin: `SchwartzMap` (`Mathlib/Analysis/Distribution/SchwartzSpace/Basic.lean:75`), `VectorFourier.fourierIntegral` (`Mathlib/Analysis/Fourier/FourierTransform.lean:81`, namespace at line 70) and `Real.fourierChar` (`Mathlib/Analysis/Complex/Circle.lean:221`, namespace `Real` at line 216). The supplier sections cited by the new targets were each read at the open heads: EndoscopicTransferAndUnitaryTraceComparison §§2.3, 2.6, 2.16; AutomorphicFormsOnReductiveGroups §§0.1a, 0.3, 2.4, 2.7; AutomorphicSpectralTheory §§0.9, 0.48, 0.49, 2.1, 2.2, 2.4, 2.14, 3.1–3.2, 6.4–6.5; and AutomorphicLFunctionsAndLocalFactors AL.0.3.1.

`Suggested.lean` declares nothing, so the `#check @name` audit has no entries. None of the six new targets is a headline statable at the pins: each needs distributions on p-adic or Nash manifolds, quasi-characters or automorphic quotient spaces. The module docstring therefore stays as it is.

Ownership: searched by object (Gelfand–Kazhdan, Harish-Chandra descent, quasi-character, Plancherel, Ξ, trace class, Jacquet–Rallis, Flicker–Rallis, BPLZZ, transfer preservation) with `roadmaps grep` over main and the 466 indexed open heads, in the board packages, and in the sibling checkouts of AutomorphicSpectralTheoryPartII, QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups and TwistedAutomorphicDescents. No declaration name of another roadmap is reused, and no id cited elsewhere was dropped: the gap ids distribution-gk, local-schwartz-germs and local-fourier-extension are cited by no other roadmap. Sources: every new locator is in a work the manifest already records (bplzz, bpcz, bp-plancherel, bp-arch, ag-descent, agrs, sun-zhu), read in the cached extraction. No new source was needed and no `needs-references.toml` was written.

## Adversarial mathematics pass

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §2.1a descent (ag-descent Thm 3.1.1) | F× on F by scaling, χ trivial; trivial group on F | Only 0 is semisimple for F×, with normal space F and stabilizer F×, so the hypothesis is the conclusion; for the trivial group the normal spaces are F, the hypothesis fails and D(F)≠0 | Implication consistent in both | New target |
| §2.1a homogeneity, odd dim | V=F, B=xy | Null cone {0}; F_B(δ₀)=constant with support F; only ξ=0 qualifies | Agrees with "ξ=0 for odd dim V" | Check added |
| §2.1a homogeneity, dim 2 | Hyperbolic plane, ξ=Haar measure on x₂=0 | F_B(ξ)=Haar measure on the same line; scaling \|t\|¹=\|t\|^(2/2); δ_B=γ(H)/γ(tH)=1 | Exponent dim V/2, not dim V (\|t\|²) | Check added |
| §2.1a Gelfand–Kazhdan criterion | N=M; M=GL₂, N=1, τ=transpose | N=M: Hom≠0 only for trivial π, product 1·1=1; N=1: δ_g↦δ_(gᵀ)≠δ_g, Hom=algebraic dual, infinite | Hypothesis necessary; bound sharp | Checks added |
| §3.2a cocharacter convention | GL₂, H=N, a(t)=diag(t,1) vs diag(1,t) | n(tx), δ_H=\|t\|, factor \|t\|⁻¹\|t\|=1; diag(1,t) gives n(t⁻¹x) | Second violates λ(aha⁻¹)=tλ | Check added |
| §3.2a averaging identity | f\|_N=min(1,\|x\|⁻¹), φ=1_(O×), conductor-zero ψ | LHS (1−q⁻¹)T(f); RHS 1−q⁻¹(2−q⁻¹)=(1−q⁻¹)²; T(f)=1−q⁻¹=1/2 at q=2; truncations I_k=1−q⁻¹ (k≥1); ∫\|f\| over the same balls 1+k(1−q⁻¹)→∞ | Identity consistent with truncations; absolute integral diverges | Check added |
| §3.2a weight hypothesis | λ=0 | (1+\|0\|)^(−δ)=1 forces ∫w<∞; min(1,\|x\|⁻¹) violates it | Oscillation needed | Check added |
| §3.3a value at regular points | Trivial character of GL₂ | c_θ(x)=1 at regular x; c_θ(1)=½·lim D^(1/2)·1=0 | Not the limit of θ (1) | Check added |
| §3.3a limit formula (bp-arch Prop 4.5.1(ii)) | GL₂ at x=1: principal series, trivial, Steinberg | D^(1/2)θ_Ind→2, c=½·2=1; trivial 0; Steinberg 1−0=1; without ½: 2 | Matches the Whittaker count 1 (bp-arch line 4300) | Check added |
| §3.3a empty regular set | Compact U(2) at 1 | Nilpotents of u(2)(ℝ)={0}, not regular in rank 2; c=0; G₁ not quasi-split | Agrees with Prop 4.5.1(i) and §3.4 Check | Check added |
| §6.1a H′-genericity | n=1, Π₁=χ, degree-2 datum (χ⁻¹,χ′) | L(s,χ×χ⁻¹)=ζ_E(s), pole at 1 | Not generic; replacing χ⁻¹ by χ″ with χχ″, χχ′ nontrivial of finite order gives entire L | Check added |
| §6.1a Flicker–Rallis coefficient | k=1, 2 constituents; (1,1) over both degrees | 2^(−1)=1/2, 2^(−2)=1/4; product 1/4=2^(−r_total) | Consistent with §6.3 coefficient 1/4 | Check added |
| §6.1a central point | Z_RS(s) unramified factor L(s+1/2) | s=0↦L(1/2), s=1/2↦L(1) | s=0 is central | Check added |
| §6.2a constant term | 5+Te^T, 5+T | Purely polynomial parts 5 and 5+T | Limit definition fails on first; second excluded by constancy | Check added |
| §6.2a character | n=1 | η(det g₁)²η(det g₂)=η(det g₂) | Agrees with §6.1 bullet | Check added |
| §6.2a after isolation | Kernels zero for χ≠χ₀ | I(f)=Σ I_χ(f)=I_(χ₀)(f) | Used by §6.4 | Check added |
| §6.3a(ii) scalar action | μ′(BC σ)=3 with μ_h(σ)=3, then 2 | 3κJ=3I holds; 2κJ=3I fails when I≠0 | Compatibility needed | Check added |
| §6.3a(iii) compatible choice | One form; values (2,3) at ψ, (1,1) at χ | μ̃′(ψ′)=4·9=36=μ̃_h(ψ_h); value 1·1=1 at χ; μ̃_h=μ_h·(bc(μ′)²μ_h) | Values at χ fixed, multiples of the old ones | Check added |
| §6.3a support | Zero multiplier; inert place outside S | (0,0) matches; T contains every inert place, so units stay | §6.4 support kept | Check added |
| §6.3a(i) scope | Inert finite place in □ | Not asserted; T ⊇ nonsplit places, so (ii) never uses it | No overreach | Check added |
| spectral-isolation symbol clause | E=ℂ, n=1: Res(GL₁×GL₂) vs U(1)×U(2) | Complexified Cartan duals of dimension 2·(1+2)=6 and 1+2=3; restriction along injective 3→6 map | Clause well posed | Contract narrowed |
| automorphic-spectrum (BPCZ Prop 2.8.4.1) | One-dimensional K-type, operator a·id, Petersson B | Unit vector gives a; vector 2v gives 4a | Orthonormal basis required | Contract narrowed |
| local-plancherel (nonarchimedean) | GL₁(ℚ_p), f=1_(O×)/vol(O×), vol(O)=1 | tr χ(f)=1 on unramified χ, else 0; f(1)=1/(1−1/p) ⇒ unramified component mass 1/(1−1/p)=2 at p=2 | Density depends on Haar, as stated | Re-addressed |
| real-plancherel-decomposition | SO(2), probability Haar | f(1)=Σ_k tr π_k(f), formal degrees 1 | Consistent | New contract (same owner as #1761) |
| local-tempered-bounds | Trivial rep of SL₂(ℝ) | Coefficient 1, while Ξ(g)(1+σ(g))^d→0 | Bound excludes non-tempered | Re-addressed |
| local-smoothing-trace | p-adic σ, f=e_K | σ(e_K)= projector of rank dim σ^K <∞ | Finite rank at finite places | Re-addressed |
