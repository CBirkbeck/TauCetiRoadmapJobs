# Review of AutomorphicLFunctionsAndLocalFactors (pull request #924 at 7605f3a)

**Verdict:** needs changes

This is a full review of the folder at 7605f3a, which differs from 79329a0, the head the previous review read, by 236 lines. Line numbers refer to `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md` unless marked `Suggested.lean`. There is no blocking finding; there are three P3 findings. Six of the previous review's seven findings are repaired. Its R07 (the pull-request description) is not repaired and is carried as R03.

## R01 (P3) — `AL2.tracePairing` restates Tau Ceti's `TauCeti.traceBilinForm`

**Location:**
- `Suggested.lean:264–272`: `def tracePairing … := LinearMap.mk₂ F (fun X Y => (X * Y).trace)`, used at `:326` and `:329` in `AL2.godementJacquetLocal`.
- `:1229`: "against the trace pairing `AL2.tracePairing`, `(X,Y)↦tr(XY)`".
- AL.0.3.1 *Needs:* (`:506`): "Mathlib `Matrix.trace`".

**Claim:** The pinned Tau Ceti already has this bilinear form, on the same carrier and with the same values. It also has the symmetry and nondegeneracy that AL.0.3.1's `Mat_n(F)` instance uses. The roadmap restates a library object.

**Witness:** `TauCeti.traceBilinForm R n : LinearMap.BilinForm R (Matrix n n R)` is at `TauCeti/Algebra/Lie/GeneralLinear/TraceForm.lean:116`. Its lemmas are `traceBilinForm_apply` (`:138`, `X Y ↦ (X * Y).trace`), `traceBilinForm_isSymm` (`:126`) and `traceBilinForm_nondegenerate` (`:131`). On `E₁₂, E₂₁` both forms give 1.

**Repair:**
- In `Suggested.lean`, add `import TauCeti.Algebra.Lie.GeneralLinear.TraceForm` and delete `AL2.tracePairing`.
- At `:326`, replace `(tracePairing F (n+1)) Φ (-g.val)` by `(TauCeti.traceBilinForm F (Fin (n+1)))`, then a line break, then `Φ (-g.val)`.
- At `:329`, write `(fun X => VectorFourier.fourierIntegral ψ μ`, then a line break, then `(TauCeti.traceBilinForm F (Fin (n+1))) Φ (-X)) s) ∧`. With these breaks every line stays within 100 characters.
- In the README:
  - At `:1229`, write "against Tau Ceti's trace form `TauCeti.traceBilinForm`, `(X,Y)↦tr(XY)`".
  - Add a supplier-table entry naming `TauCeti.traceBilinForm`, its file, `TauCeti.traceBilinForm_isSymm` and `TauCeti.traceBilinForm_nondegenerate`.
  - In AL.0.3.1's *Needs:*, replace "Mathlib `Matrix.trace`" by these three Tau Ceti names.

**Tested:** a scratch copy with exactly these Lean edits elaborates with exit 0. It gives 14 `declaration uses sorry` warnings, the same as the original, and has no line longer than 100 characters.

## R02 (P3) — AL.3.10.3 constructs the local pair factors a second time at function-field completions, and AL.3.3.6 cites it for equal characteristic

**Location:**
- AL.3.10.3, `:1926`: "construct the generic smooth complex local `GLₙ` factors at every completion, including ramified inputs, using Whittaker uniqueness, the principal ideal of pair integrals and the local functional equation in Lafforgue Appendix B §1."
- The next sentence asks for the unramified Satake comparison and normalized-induction multiplicativity again.
- Its *Needs:* line (`:1932`) cites no target of AL.3.1–AL.3.4.
- AL.3.3.6, `:1598`: "spherical/essential Whittaker functions supplied by the generic finite-place newform target (by the function-field local-factor prefix in equal characteristic)".

**Claim:** The completions of `𝔽_q(X)` are nonarchimedean local fields of positive characteristic. Five earlier targets already cover every nonarchimedean local field, including these:

- Local Whittaker uniqueness (AL.3.1.1);
- The Rankin–Selberg local L-factor (AL.3.2.3);
- Nonarchimedean factors under normalized induction (AL.3.3.1);
- The local Rankin–Selberg functional equation (AL.3.3.2);
- Generic finite-place newforms (AL.3.3.5), with The unramified Rankin–Selberg test (AL.3.3.6).

The scope is fixed by the Conventions (`:49`, "every local field F … of either characteristic"), by `:1487` ("Local field F") and `:1554` ("Let F be nonarchimedean"). The Lean theorems state it under `[IsNonarchimedeanLocalField F]`.

AL.3.10.3 nevertheless builds the equal-characteristic local pair theory again from a different source, without citing those targets. So two targets own one object. AL.3.3.6 then sends the equal-characteristic case forward to AL.3.10.3, a later target, for an input that AL.3.3.5 already supplies in every characteristic. A mechanical scan of the README finds this parenthetical as the only prose dependency on a later target; the others are consumer-direction remarks.

**Witness:** take `F=𝔽₃((t))`, the completion of `𝔽₃(t)` at `t`. `Suggested.lean:528–531` and `:611–612` state `AL3.rankinSelbergLocal` and `AL3.rankinSelbergLocalEqualRank` for every `[IsNonarchimedeanLocalField F]`, so this F is covered. AL.3.10.3 constructs the same factors at this completion again.

**Repair:**
- **AL.3.10.3, first sentence.** Replace it by: "For `K=𝔽_q(X)` and `ℓ≠char(𝔽_q)`, use at every completion the generic local pair factors of Local Whittaker uniqueness (AL.3.1.1), The Rankin–Selberg local L-factor (AL.3.2.3), Nonarchimedean factors under normalized induction (AL.3.3.1), The local Rankin–Selberg functional equation (AL.3.3.2) and The unramified Rankin–Selberg test (AL.3.3.6), which hold in equal characteristic; Lafforgue Appendix B §1 records the same theory."
- **AL.3.10.3, second sentence.** Delete "Compare unramified Satake factors and prove normalized-induction multiplicativity."
- **AL.3.10.3, *Needs:*.** Add those five targets. Also add The GL(n) cuspidal Fourier expansion (AL.3.4.1): its function-field branch is the "Fourier reconstruction in the function-field automorphic carrier" that AL.3.10.3 uses.
- **AL.3.3.6.** Delete "(by the function-field local-factor prefix in equal characteristic)".

**Tested:** on `F=𝔽₃((t))`, every local pair statement then has one owner, AL.3.2.3 or AL.3.3.2. Every target added to AL.3.10.3's *Needs:* precedes it, so no forward edge appears.

## R03 (P3) — The pull-request description still contradicts the README (carried from the previous review's R07, not repaired)

**Location:** the pull-request description.

- "take rank-one Hecke continuation and the global standard L-function from here".
- "Continuation for arbitrary unitary Hecke characters is the n = 1 case of the Godement–Jacquet matrix integral, not a separate rank-one argument".
- "The common adelic Tate/Fourier prefix and the rank-one scalar comparison are consumed from ArithmeticGaloisRepresentations §2.7".
- LFunctions and ZerosOfLFunctions "both must merge first"; ReductiveGroupsPartII is listed among "open pull requests of ours".

**Claim:** The description misstates ownership and dependencies, and the reviewer approving the pull request reads it.

**Witness:**
- `:2499` reads "their rank-one Hecke continuation is AnalyticNumberTheoryPartI §2.3a".
- `:11` assigns the Fourier prefix to AnalyticNumberTheoryPartII §§5.3g–5.3h.
- LFunctions, ZerosOfLFunctions and ReductiveGroupsPartII are on main.

**Repair:** Change the description only; the folder needs no edit.

- Replace the first sentence by "…take the global standard L-function from here; their rank-one Hecke continuation is AnalyticNumberTheoryPartI §2.3a."
- Replace the second by "The global Godement–Jacquet continuation is proved for every n ≥ 1 and identified at n = 1 with AnalyticNumberTheoryPartI §2.3a."
- Replace the third by "The local and adelic Fourier analysis and local zeta integrals are AnalyticNumberTheoryPartII §§5.3g–5.3j; the rank-one scalar comparison uses ArithmeticGaloisRepresentations §2.7."
- Delete the sentence about LFunctions and ZerosOfLFunctions, and drop ReductiveGroupsPartII from the list of open pull requests.

## Previous findings

- **R01 (positive-characteristic Fourier inversion only on S(F)):** repaired. AL.0.3.1 (`:481`, `:490–491`) now treats every finite-dimensional V with a nondegenerate F-bilinear B. It defines τ by `B(τx,y)=B(y,x)` and `L^∨={y : B(L,y)⊆P^(−ν)}`, gives the unique measure with `vol(L)vol(L^∨)=1` and proves `f̂̂(x)=f(−τx)`. It names the instances `Fⁿ`/`dotProductBilin` and `Mat_n(F)`/trace. AL.2.1.5 (`:1239`) and AL.3.3.2 (`:1572`) cite these instances. The proof is checked in the table below.
- **R02 (`AL3.upperUnitriangular`):** repaired. `Suggested.lean:3` imports `TauCeti.LinearAlgebra.Matrix.GeneralLinearGroup.UpperUnitriangular.Basic`. All uses are `TauCeti.upperUnitriangularGroup (Fin (m+1)) F`, and `AL3.longWeyl` is `TauCeti.permutationGL Fin.revPerm` (`:469`). The supplier row at `:86` names both with their files.
- **R03 (unitarity in the cited sources):** repaired. `:1544` and `:1570` and the docstrings at `Suggested.lean:510–514` and `:599–601` say that Cogdell's lectures assume unitary inputs. They cite Cogdell–Piatetski-Shapiro, *Derivatives and L-functions for GLn*, §2.1, for every generic pair. The locator is verified below, and the work is in References (`:2531`) and in the manifest as `CogdellPiatetskiShapiroDerivatives`, certified.
- **R04 (stale "AL.3 curve additive analysis"):** repaired at `:2209` and `:2213`. No "AL.3 curve" or "AL.3's curve" remains.
- **R05 (AL.R without Examples and Dependencies):** repaired at `:629–635`.
- **R06 (run-together text):** repaired. All eight places now read "weight κ", "has `−s`", "is `(1−a(p)…`", "mass, `W=2, W′=3, Φ=5,`", "formulas (2.4)–(2.6)", "by `χ(p)=…`", "`k=j=0, χ=1, ε(p)=1` gives `(1−1/α)²`" and "prefactor `α^(−1)`". Every reference is now a bullet.
- **R07 (pull-request description):** not repaired; carried as R03.

## Verified sound

**Gate and dependency check.** I ran the gate on this head. Every count is 0 and the result is OK; the worker's run also reports `build=0`. The dependency check prints:

```text
depcheck: 239 roadmaps, 2370 edges, 0 problem(s)
```

There are no UPWARD, CYCLE or `moved:` lines. `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds only `README.md`, `Suggested.lean` and `metadata.toml`.

**Elaboration.** `lake env lean` on a copy of `Suggested.lean` exits 0. It gives exactly 14 `declaration uses sorry` warnings, at lines 73, 78, 89, 123, 136, 162, 220, 297, 371, 387, 433, 528, 611 and 687, and nothing else. The file has a single `import Mathlib` and two Tau Ceti modules, both used. There is no `set_option`, `lemma` or sorry'd data.

**`#check @` audit.** I checked all 34 declarations and the two Tau Ceti ones in one scratch file.

- The two "dropped binder" leads are `hbesselK`, which is present as the anonymous premise of both Bessel theorems.
- In `GL2Blueprint`, the section instance `[IsNonarchimedeanLocalField F]` is kept by `newvectorLevelExists` and `casselmanNewvector`, through `localK1`.
- The AL2 and AL3 theorems carry every binder in their own signatures.

**One-tactic probe.** In a scratch copy, each of the 14 `sorry`s was replaced by `first | rfl | (simp; done) | infer_instance | decide | (norm_num; done) | trivial | exact le_rfl | aesop`. All 14 fail, so none is padding.

**Headline theorems.** Fourteen are stated:

- the finite jet (AL.0.3.6);
- the two Bessel identities (AL.0.5.2–3);
- archimedean and finite eigenline uniqueness (AL.1.2.5);
- the nonarchimedean and archimedean rank-one functional equations (AL.1.3.2);
- the local Godement–Jacquet theorem (AL.2.1.4–5);
- Casselman's existence and dimension theorems (AL.2.2.2, AL.2.2.4);
- Whittaker uniqueness (AL.3.1.1);
- the unequal-rank and equal-rank Rankin–Selberg theorems (AL.3.2.3, AL.3.3.2);
- the generic newform line (AL.3.3.5).

The module docstring (`Suggested.lean:28–49`) names the global, archimedean, curve, shtuka, AL.4 and AL.5 headlines as not statable, each with its missing carrier. I found no statable headline that is absent.

**Seeded sample: Check for the theta–Mellin formula** (`:1705–1707`, AL.3.5.1; Cogdell, Columbia lectures, §1.1.3, pp.4–5).

- `CogdellColumbia` lines 256–267 (printed p.4) define `E(g,s;Φ,η)=|det g|^s∫_{k×\A×}Θ′_Φ(a,g)|a|^{ns}η(a)d×a` for `Re s>1`. Here η is a unitary idele-class character and `ξ=0` is removed.
- Lines 273–277 (p.5) give the poles at `iσ, 1+iσ` when `η=|·|^(−inσ)`, and the functional equation.
- Lines 278–289 give the section for `P′` of type `(n−1,1)` and the sum over `P′(k)\GLₙ(k)`.

There is no theorem number; the locator is the subsection. Theorem, page, hypotheses and statement agree with `:1689–1697` and `:1715`. The README flags no locator as unverified.

**New locator read: `CogdellPiatetskiShapiroDerivatives`.**

- §2.1 is at lines 869–935, printed pp.16–17. Lines 830–837 define "Whittaker type" as `Ind(Δ₁⊗…⊗Δ_t)` with quasi-square-integrable `Δ_i`, which includes every irreducible generic representation.
- Theorem (i)–(ii), lines 912–918: absolute convergence for `Re s` large, the fractional ideal generated by `L=P(q^(−s))^(−1)` with `P(0)=1`, independent of j.
- Theorem (iii), lines 921–935: the monomial ε, the sign `ω_σ(−1)^(n−1)`, and `I_{n−m−j−1}(1−s,…)` against `I_j(s)`.

This matches `:1544`, `:1570` and both docstrings. Its printed `w_{n,m}` is a misprint (see Source issues). The roadmap's `AL3.rsWeyl=diag(I_{m+1},w_{k+1})` agrees with Jacquet (`JacquetArchimedeanRS` lines 289–294, `w_{n,n′}=diag(1_{n′},w_{n−n′})`) and with the Fields lectures (`CogdellFields` lines 2046–2049).

**Other locators re-read.**

- `CogdellFields` line 2216 (Lecture 6, printed p.45): the unitary standing hypothesis.
- `CogdellFields` lines 2434–2445: Theorem 6.2 and the ε normalization.
- `CogdellColumbia` lines 372–392: the §1.3 facts, for local components of unitary cuspidal representations.

**Library declarations opened at the pins.**

- Tau Ceti:
  - `TauCeti.traceBilinForm` and its `_apply`, `_isSymm` and `_nondegenerate` lemmas (`Algebra/Lie/GeneralLinear/TraceForm.lean:116, 138, 126, 131`)
  - `TauCeti.permutationGL` and `permutationGL_coe` (`LinearAlgebra/Matrix/GeneralLinearGroup/Diagonal/Normalizer.lean:71, 77`; the matrix of `σ⁻¹`, as `:86` says)
  - `TauCeti.upperUnitriangularGroup` (`…/UpperUnitriangular/Basic.lean:108`; `[Fintype m] [LinearOrder m]`, any `Ring R`)
  - `Matrix.IsUpperUnitriangular` (`LinearAlgebra/Matrix/Triangular.lean:90`)
- Mathlib:
  - `Matrix.BlockTriangular` and `Matrix.IsUpperTriangular` (`LinearAlgebra/Matrix/Block.lean:62, 66`; `j<i → M i j = 0`)
  - `ContinuousLinearEquiv.smulLeft` (`Topology/Algebra/Module/Equiv/Basic.lean:573`). `TateZeta.inverseScalar` is built from Mathlib's `LinearEquiv.smulOfUnit`, a specialization, not a restated object.
- No Tau Ceti or Mathlib declaration gives a mirabolic or last-row subgroup, Whittaker functionals, `Representation.IsSmooth` or admissibility.

**Cross-roadmap citations resolved.**

- AnalyticNumberTheoryPartII, at the head of its open pull request: §5.3g (line 682) is stated for number fields, for any finite-dimensional V with nondegenerate B and the same τ. AL.0.3.1's positive-characteristic statement therefore extends it rather than restating it. §5.3h is at line 699 and §5.3j at line 720.
- SmoothRepresentationsOfLocalGroups, at its head: SR.1.1 (line 1045), SR.2.3 *whittaker-functionals* (line 2251) and SR.5.3 *highest-derivative-adapter* (line 4910, characteristic zero). AL.3.3.5 uses SR.5.3 only for the Atobe–Kondo–Yasuda comparison. Its `Suggested.lean:10, 110` uses `TauCeti.upperUnitriangularGroup`.
- On main:
  - EtaleCohomologyFoundations §0.11, `ClassicalAlgebraic.smoothTrace` and `curveDuality` (README:1157–1169);
  - ClassFieldTheory `characterConductorExp` and `unitFiltration_characterConductorExp_le_ker` (`Suggested.lean:2155, 2159`);
  - Completed GlobalNumberFields, RestrictedProducts and ArithmeticDirichletSeries.
- At open heads:
  - `Conductor.artinConductorNat` (ArithmeticGaloisRepresentations README:2752);
  - `VanishingCycles.etaleTraceFormula` (InverseGaloisAndArithmeticFundamentalGroups README:360).

**Ownership and overlap.**

- The overlap index reports no dropped or renamed ids and no other pull request changing this roadmap. No heading was renamed in this change.
- No other open `Suggested.lean` declares Godement–Jacquet, Rankin–Selberg, Whittaker-uniqueness, newform, local-zeta or long-Weyl objects. HilbertModularForms has an unrelated `tracePairing` in its own namespace.
- AutomorphicLFunctionsAndLocalFactorsPartII is in characteristic zero (its README:23) and defers to AL.0–AL.4.
- ExoticMonoidalStructuresAndAbstractAutomorphicity declares `gap:equal-characteristic-fourier` against this roadmap, so it consumes from here rather than owning.
- No open roadmap states positive-characteristic vector-space Fourier inversion.

**Adversarial calculations.**

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| AL.3.5.1 theta–Mellin Check (sampled), `:1705` | point mass, `n=2`, `\|det g\|=3`, `θ₀=5`, `\|a\|=2`, `η=1`, `s=1` | `3·5·2^(2·1)=60`; dropping n gives `3·5·2=30`; the source has `\|a\|^{ns}` (line 267) | Pass |
| AL.3.5.1 central law, `:1697` | substitute `a↦az⁻¹` | `\|z\|^{ns}·\|z\|^{−ns}·η(z)^{−1}`; the source puts the section in `Ind(δ^{s−½}η^{−1})` (line 284) | Pass |
| AL.3.5.2 zero modes, `:1715` | `η=1`; `n=2`, `g=1` | `∫₀¹t^{ns}dt/t=1/(ns)`, `∫₀¹t^{n(s−1)}dt/t=1/(n(s−1))`; residues `−κΦ(0)/2` and `κΦ̂(0)/2` | Pass |
| AL.0.3.1 lattice dual (repaired R01) | `L=⊕Oe_i`, `B(e_i,f_j)=δ_ij` | `B(e_i,Σc_jf_j)=c_i`, so `L^∨=⊕ϖ^(−ν)Of_j`, and its first-variable dual is L | Pass |
| AL.0.3.1 volume product | `L⊆L′` | `[L′:L]=[L^∨:L′^∨]` gives `vol(L′)vol(L′^∨)=vol(L)vol(L^∨)`; scaling by c multiplies it by `c²` | Pass |
| AL.0.3.1 inversion with τ | `f=1_{a+L}` | `f̂(y)=ψ(B(a,y))vol(L)1_{L^∨}`; `f̂̂(z)=1_L(a+τz)=f(−τz)`, using `B(y,z)=B(τz,y)` | Pass |
| AL.0.3.1 alternating Check, `:501` | `𝔽₃((t))`, `ν=0`, `B=x₁y₂−x₂y₁`, `a=(t^{−1},0)` | `τ=−1`; `f̂̂(a)=1_L(0)=1`; `f(−a)=1_L(2a)=0`, since `2t^{−1}∉O` | Pass |
| AL.0.3.1, non-symmetric B | `M=[[1,1],[0,1]]` | `τ=[[1,1],[−1,0]]`; `B(τe₁,y)=y₁=B(y,e₁)`; `B(τe₂,y)=y₁+y₂=B(y,e₂)`; `τ²≠1` | Pass (general τ needed) |
| AL.0.3.1 `Mat₂` Check, `:500` | `𝔽₃((t))`, `ψ(t·)` | `ν(ψ_t)=0+1=1`; dual `Mat₂(P^{−1})` of index `3⁴`; `3^{−2}·3⁴·3^{−2}=1`; scalar volume gives `3^{−½}·3⁴·3^{−½}=27` | Pass |
| AL.0.3.1 `Fⁿ` instance | `n=2`, `ν=1`, `q=3` | `(O²)^∨=(P^{−1})²` of index 9; `vol(O²)=3^{−1}=q^{−nν/2}` | Pass |
| AL.0.3.1 zero-pairing Check | `B=0` on `F²` | `L^∨=F²`, not compact; no finite product | Pass |
| AL.0.3.1 conductor law | `ψ_b(x)=ψ(bx)` | `ψ_b` is trivial on `P^m` iff `m+ord b≥−ν`, so `ν(ψ_b)=ν+ord b` | Pass |
| `AL2.tracePairing` (R01) | `E₁₂,E₂₁`; `E₁₂,E₁₂` | `tr(E₁₁)=1` for both forms; 0 and 0; the repaired file elaborates with 14 warnings | Duplicate (R01) |
| `godementJacquetLocal` | trivial `GL₂`, `Φ=1_{M₂(O)}` | `Σ_k(1+…+q^k)q^{−k(s+½)}=(1−q^{−s−½})^{−1}(1−q^{½−s})^{−1}`, convergent iff `Re s>½` | Pass |
| `godementJacquetLocal`, `n=0` | rank one | the exponent is `s+0/2=s`, which is `localZetaIntegral` | Pass |
| `localZetaIntegral_functionalEquation` | `𝔽₃((t))`, `χ=1`, `f=1_O`, `ν=0`, `μ(O)=1` | `Z=(1−3^{−s})^{−1}`, `f̂=1_O`, `Zhat(1−s)=(1−3^{s−1})^{−1}`, `γ=(1−3^{−s})/(1−3^{s−1})` | Pass |
| `archimedeanLocalFunctionalEquation` | `ℝ`, `e^{−πx²}` | `Z=Γ_ℝ(s)`, `f̂=f`, `γ=Γ_ℝ(1−s)/Γ_ℝ(s)` | Pass |
| `finiteEigenSpace_finrank` | `χ=1` | `r′(ϖ)λ₀=λ₀−δ₀`, so the invariants are `ℂδ₀`, of dimension 1 | Pass |
| `archimedeanEigenSpace.finrank` | `ℝ`, `χ(a)=a^{−1}` | `δ₀′(f(a^{−1}·))=a^{−1}δ₀′(f)`; resonant line `ℂDδ₀` | Pass |
| `BesselHalfOrderDerivative` | DLMF 10.38.7 | `∂_νK_ν(x)\|_{½}=√(π/2x)e^xE₁(2x)`, and `−√(π/2)e^cc^{−½}Ei(−2c)` equals it since `Ei(−r)=−E₁(r)` | Pass |
| `casselmanNewvector` | unramified PS; Steinberg; `c=2`, `n=1` | `n+1`; `n` (`n+1−1`); `1+1−2=0` in ℕ | Pass |
| AL.2.2.3 Check | `χ` of conductor `a=2` | `c(St⊗χ)=4≠3`; at `a=1`, `2=2` | Pass |
| `whittakerUniqueness` | `n=0`; trivial `GL₂` | rank 1, since N is trivial; `ψ(u₀₁)≠1` forces `ℓ=0`, rank 0 | Pass |
| `whittakerFunctionals` with Tau Ceti N | `n=1` | the carrier `{[[1,b],[0,1]]}` gives character `ψ(b)` | Pass |
| `longWeyl` | `ℚ`, `n=3` | `permutationGL Fin.revPerm=[[0,0,1],[0,1,0],[1,0,0]]`; a scratch `example` elaborates | Pass |
| `rsWeyl` against `w_{n,m}`, n=3, m=1 | `y=[[1,0,a],[0,1,b],[0,0,1]]` | `diag(1,w₂)` turns `ι(y)` into `[[1,0,0],[−a,1,−b],[0,0,1]]`, so the dual is multiplied by `ψ(b)`, matching `Ψ₀`; `diag(I₂,w₁)=I₃` leaves the row `(−a,−b,1)` unabsorbed | Pass (source misprint) |
| `rankinSelbergLocal`, `GL₂×GL₁` | unramified, roots `α₁,α₂`; `χ(ϖ)=β` | `W(diag(ϖ^k,1))=q^{−k/2}h_k`, so `Ψ₀=Σh_k(βq^{−s})^k=∏(1−α_iβq^{−s})^{−1}` | Pass |
| `rankinSelbergLocal`, non-unitary | `π=π₀⊗\|det\|^{−5}`, `π′=1` | `Ψ₀=L(s−5,π₀)`, so `c=5`; Derivatives Theorem (i) covers it (line 912) | Pass |
| `rankinSelbergLocalEqualRank`, `m=0` | unramified `χ₁,χ₂`, `Φ=1_O` | `longWeyl F 1=1`; `(1−χ₁χ₂(ϖ)q^{−s})^{−1}` | Pass |
| `genericNewform`, `n=0` | `GL₁` | `newformLocalK1 F 0 m` is `1+P^m` (m≥1) or `O^×`; nonzero invariants iff `m≥c(χ)`; dimension 1 | Pass |
| AL.3.10.3 / AL.3.3.6 (R02) | `F=𝔽₃((t))`, the completion of `𝔽₃(t)` at t | covered by AL.3.2.3 and AL.3.3.2 (`:1487`, Lean under `IsNonarchimedeanLocalField`) and built again in AL.3.10.3 (`:1926`) | Two owners (R02) |
| AL.R Examples, `:631` | trivial and `sgn` at ℝ; `n=2`, values a, b | `Γ_ℝ(s)` and `Γ_ℝ(s+1)`; `(1−aT)(1−bT)=1−(a+b)T+abT²` | Pass |
| AL.0 Examples, `:581` | `ℤ/4`, `1_{1}`, frequency 1; `ℤ/2` | `ψ(−1)=e^{−2πi/4}=−i`; `Σ_wψ(−w(v+x))=2·1_{v=−x}` | Pass |
| AL.1.3.1 ℚ₃ Check | `ψ₀(3·)`, quadratic ω | `ν(ψ₀(3·))=1`; `3^{½−s}·(−i·3^{½−s})=−i·3^{1−2s}`, which is `−3i` at `s=0` | Pass |
| AL.5.4.1 Checks | `p=3,k=0,j=1`, unit data; `X²+3` | `(1−3)(1−⅓)=−4/3`; truncated `k−j` gives `(1−3)(1−1)=0`; roots `±i√3` | Pass |
| AL.5 Examples | `E=(1−p^{−s})²` at 0 | `E″(0)=2(log p)²+2·0·g″=2(log p)²` | Pass |

## Not verifiable

- **Lafforgue, Appendix B §1** (cited at `:1926`): I did not open the text. R02 relies only on the roadmap's own statements of AL.3.1.1–AL.3.3.6.
- **Godement–Jacquet, LNM 260; Jacquet–Piatetski-Shapiro–Shalika (1983); Bernstein–Zelevinsky (1976):** paywalled, not read; they are cited by locator.
- **Other sources outside the sample were not re-read this round:** Humphries, Yu, Zhang, Gross–Zagier, Leslie, Raghuram and Rodrigues Jacinto–Williams. Their formulas were computed where the table shows them.
- **Ownership against open pull requests** was checked by `roadmaps grep` over all open heads and main, for the objects of the Lean declarations and for positive-characteristic vector-space Fourier analysis, and by reading the closest-vocabulary roadmaps. It is not a full read of every open roadmap.

## Source issues

- **Misprint** in CogdellPiatetskiShapiroDerivatives at §2.1, Theorem (iii), printed p.17: the source defines `w_{n,m}` with blocks `I_{n−m}` then `w_m` (lines 930–934); it should be `diag(I_m, w_{n−m})`, as in Jacquet (2.1) and Cogdell's Fields lectures; affects nothing.
