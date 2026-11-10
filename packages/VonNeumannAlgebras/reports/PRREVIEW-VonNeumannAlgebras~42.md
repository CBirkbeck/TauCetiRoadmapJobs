# Review of VonNeumannAlgebras (pull request #1041 at 0621c4c)

**Verdict:** needs changes

One P3 finding, a locator. The previous review's two blocking findings and its residue finding are repaired; the gate passes; no statement was found false.

## R01 (P3) — The property Γ locator points at a different formulation

**Location:**
- `TauCetiRoadmap/VonNeumannAlgebras/README.md:4127–4129`: "`HasPropertyGamma` asks for a tracial state τ and unitaries u_n of M with `τ(u_n)=0` and `‖u_ny−yu_n‖₂→0` for every y∈M … (Jones, Definition 16.1.1, p. 107)".
- `TauCetiRoadmap/VonNeumannAlgebras/Suggested.lean:597–600` (docstring of `HasPropertyGamma`), same locator.

**Claim:** Jones's Definition 16.1.1 defines property Γ by a central sequence that is not trivial (`‖x_n−tr(x_n)‖₂` not tending to 0). It has no unitaries and no trace-zero condition. The trace-zero unitary sequence that the predicate uses is condition (iv) of Anantharaman–Popa, Theorem 15.2.3, which also proves it equivalent to property Γ for separable II₁ factors. That theorem is not cited at the definition, and the docstring cites Definition 15.2.1 and Remark 15.2.2 instead.

**Witness:**
- jones-vna line 3364 (p. 107): central sequences, trivial central sequences, Γ by a central sequence.
- anantharaman-popa line 11529 (PDF 268 = p. 262): Theorem 15.2.3, (i) Property Gamma ⇔ (iv) a central sequence of unitaries `v_n` with `τ(v_n)=0`, for separable M.

**Repair:**
1. README `:4128–4129`: replace "(Jones, Definition 16.1.1, p. 107)" by "(the form of Anantharaman–Popa, Theorem 15.2.3(iv), p. 262; Jones, Definition 16.1.1, p. 107, defines Γ by a nontrivial central sequence)".
2. README `:4129–4131`: cite the equivalence as "Anantharaman–Popa, Theorem 15.2.3, p. 262, with Remark 15.2.2, p. 262, for the finite-set and sequential forms".
3. `Suggested.lean:597–600`: the same two locators in the docstring. No statement changes.

Checked on the instance: `M=R`, `u_n=diag(1,−1)` at site n has `τ(u_n)=0` and commutes with the first `n−1` sites, which is 15.2.3(iv) and not literally a statement of Jones 16.1.1.

## Previous findings

- **R01 (tensor commutation statable) — repaired.** `Suggested.lean:561–565` states `commutant_spatialTensor`: `(spatialTensor ↑M ↑N).commutant = spatialTensor ↑M.commutant ↑N.commutant`, on the new `rTensorCompletion`, `lTensorCompletion`, `spatialTensor` (`:162–185`). The Layer 2 "not statable" bullet is gone. The two items the finding asked to re-examine are stated: the II∞ amplification (`:452`) and Halmos's two-projection theorem on `WithLp 2 (L × L)` (`:578`). README `:883–900`, `:934–975`, `:2062–2069`, `:3514–3516`, `:4092–4097` name them.
- **R02 (modularity ⇔ finiteness) — repaired.** `Suggested.lean:375–384` states `isFiniteProjection_iff_modular` in the corner form, joins and meets on ranges; README `:1945–1950` names it and says that `e=1` gives the theorem for M.
- **R03 (branch at the old pins, add/add conflict with main) — unchanged, settled, not re-raised.** The repair replies answer it as outside the two files of the folder: the fix is the merge of main, which changes `lake-manifest.json`. That reason is correct. What I checked instead is under "Pins" below.
- **R04 (residue, "UO", wrong layer) — repaired.** No "Retain …" imperative is left; the six remaining matches of "retain/removed" (`:869`, `:1356`, `:2589`, `:4847`, `:4961`, `:4990`) are mathematical. "UO" is gone. `:4193` reads "precede V13's automorphism and flow classification".

## Verified sound

**Gate, dependencies, build**
- `tauceti-roadmap gate … VonNeumannAlgebras --base origin/main`: every counter 0, `OK`, exit 0.
- Dependency check output, with no UPWARD, CYCLE or `moved:` line:

  ```text
  depcheck: 235 roadmaps, 2268 edges, 0 problem(s)
  ```

- `lake env lean` on `Suggested.lean` at the branch pins: exit 0, 32 "declaration uses `sorry`" warnings, nothing else.
- `git diff --stat origin/main...HEAD` outside the folder is empty.

**Pins**
- The branch pins Tau Ceti `a91d3aaf` and Mathlib `6b7abb3c`; main pins `2fd255d9` and `1b1ccf4b`.
- `Suggested.lean` imports only Mathlib. I elaborated the same file from a checkout of main at main's pins: 32 `sorry` warnings and nothing else. So resolving the merge in favour of this head's two files leaves the acceptance test green.
- Every Mathlib declaration the new statements use exists at both pins, at the same place up to one line: `TensorProduct.instInnerProductSpace` (`InnerProductSpace/TensorProduct.lean:145`/`:146`), `ContinuousLinearMap.rTensor` (`:470`/`:471`), `lTensor` (`:536`/`:537`), `ContinuousLinearMap.completion` (`Topology/Algebra/LinearMapCompletion.lean:44`), `Submodule.orthogonalProjectionOnto` and `starProjection` (`Projection/Basic.lean:120`, `:131`), `ContinuousLinearMap.holderL` (`MeasureTheory/Function/Holder.lean:132`), `MeasureTheory.Lp.compMeasurePreservingₗᵢ` (`LpSpace/Basic.lean:666`).
- `VonNeumannAlgebra.adjoin` (`TauCeti/Analysis/VonNeumannAlgebra/Adjoin.lean`) and `NonUnitalStarAlgHom.IsNondegenerate` (`TauCeti/Analysis/CStarAlgebra/Representation/Nondegenerate.lean:29`) exist at main's Tau Ceti pin, which the README's permalinks (`:2583`) name. The Lean file writes their bodies out, so it does not depend on them.

**Lean form**
- `#check @name` for all 56 declarations in one scratch file: no error. Every type keeps `[CompleteSpace H]`; `commutant_spatialTensor` keeps `[CompleteSpace K]`; the amplification and the three classification theorems keep `SeparableSpace`; `exists_starAlgEquiv_multiplicationAlgebra` keeps `[Nontrivial H]`. Each matches its README sentence. Nothing in the roadmap was changed.
- One-tactic probe (`first | rfl | trivial | simp | infer_instance | decide | exact?`) on a scratch copy: all 32 theorems fail to close. No padding.
- No `set_option`, one `import Mathlib`, no sorried data: the 8 new definitions have real bodies (`(x.rTensor F).completion`, double centralizers with `centralizer_centralizer' := by simp`).
- Headlines of the Summary: bicommutant, trace on a II₁ factor (existence, uniqueness), Dye, injective ⇔ hyperfinite, uniqueness of the injective II₁ and II∞ factors are stated. Tomita–Takesaki, the classification by `S(M)` and the IIIλ/III₀/III₁ uniqueness are named in the docstring with the missing carrier (no closed antilinear `S`, no modular group, no `S`, `T` or flow of weights). I found no statable headline that is absent.

**Shape of the new README text**
- Each new definition has API bullets and at least three Checks: the amplifications (3 and 3), `spatialTensor` (2 and 3), `multiplicationAlgebra` (2 and 4), `leftRegular`/`groupVonNeumannAlgebra` (2 and 3), `HasPropertyGamma` (2, and 5 in the Checks list at `:4166–4184`), the modularity theorem (3 Checks).
- Every backticked name of the roadmap's own is declared in `Suggested.lean` (gate `readme-ids-missing=0`).

**Ownership and overlaps**
- `roadmaps grep --lean-only` for the 9 definition names and 4 new theorem names: declared only in this folder.
- Neither pin has a unitary left regular representation on `L²`, a group von Neumann algebra, property Γ, a spatial tensor product or a two-projection theorem (`Mathlib/Analysis/VonNeumannAlgebra` is `Basic.lean` alone; Tau Ceti adds `Adjoin.lean` and `Density.lean`). The three "same-name" leads (`WStarAlgebra.exists_predual`, the group-theoretic `IsCyclic`, the algebraic `leftRegular`) are other objects.
- Overlap report: no open pull request changes this folder, no cited id is dropped, no id is defined only by an open revision. This head renames no V-id.
- FactorRigidity, Subfactors and NoncommutativeIntegration on main mention group von Neumann algebras as consumers of V8; none defines them.

**Seeded sample, 13.1 and 13.2 (read in the cache this round; printed page = PDF page − 6 for Anantharaman–Popa)**
- hiai-lectures line 2666, Theorem 6.5, p. 55: C*-algebra and C*-subalgebra, norm-one projection, conclusions (ii) and (v) of Theorem 6.4 (lines 2596, 2602). As restated.
- peterson-notes line 3948, Theorem 6.2.1, p. 98: unital A ⊇ B, `E|B=id`, `‖E‖≤1`. Line 4146, Theorem 6.3.8, p. 103: hypertrace ⇔ conditional expectation.
- anantharaman-popa: Definition 10.2.1 and Proposition 10.2.2 (line 7191, p. 161); Proposition 10.2.5 (line 7269, p. 163); Theorems 10.2.8 and 10.2.9 (lines 7325, 7333, p. 164; condition (2) is a positive finite-rank T with `‖T‖_(2,Tr)=1`); Theorem 10.3.1 (line 7413, p. 166; a projection, no trace clause); Theorem 10.3.4 (line 7532, p. 168); Definitions 11.1.1–11.1.2 and Theorem 11.1.3 (lines 7685–7702, p. 173); Theorem 11.2.2 (line 8294, p. 186; (3) is the sequential unital form of `IsHyperfinite`); the AFD definition and Corollary 11.2.4 (lines 8371–8376, p. 188); Notes (line 8409, p. 189).
- The one sentence added to 13.2: jones-vna line 3380, §16.2, pp. 107–108, the tensor model `⊗M₂(ℂ)` with x in the n-th slot.

**New locators read**
- jones-vna: Exercises 7.3.2 (line 1448, p. 46; its four lattice conditions are the four zero intersections of the Lean hypotheses) and 7.3.8 (line 1470, p. 47; the block form); Definition 9.1.7 and Proposition 9.1.8 (lines 1790–1792, p. 57; maximal family, remainder `q≼p`, matrix units); Theorem 16.3.1 (line 3395, p. 108, constant 14) and the free-group partition with Theorem 16.3.2 (lines 3464–3467, p. 109, "the same works for more than two generators"); EP10 and the remark after it (lines 713–726, p. 23).
- anantharaman-popa: §5.1 footnote 1 (line 2977, p. 66), `(M₁⊗M₂)′=M₁′⊗M₂′`; §15.2 runs pp. 261–266.
- peterson-notes: §3.2 (line 1698, pp. 44–45); Theorem 5.1.3 (line 3221, p. 83); Theorem 5.1.6 (line 3271, p. 84), any discrete Γ.

**Adversarial table**

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `rTensorCompletion`, `lTensorCompletion` | `e₁₂` on `ℂ²⊗ℂ²`; F=0 | `(e₁₂⊗1)(e₂⊗e₁)=e₁⊗e₁`, `(e₁₂⊗1)(e₁⊗e₂)=0`; `(1⊗e₁₂)(e₁⊗e₂)=e₁⊗e₁`, `(1⊗e₁₂)(e₂⊗e₁)=0`; F=0 gives `1⊗1=0`, norm 0≠1 | sides pinned | none |
| `spatialTensor` | `(B(ℂ²),ℂ1)`; `({S},∅)` on `ℓ²⊗̂ℂ`; `(∅,∅)` | `M₂⊗1`, dim 4 of 16; `W*(S)=B(ℓ²)` (adjoint adjoined: `S*S=1≠SS*`); `B(H)′=ℂ1` | holds | none |
| `commutant_spatialTensor` | `M=B(ℂ²)`, `N=ℂ1`; `M=N=B`; H=0 | LHS `(M₂⊗1)′=1⊗M₂` (dim 4), RHS `spatialTensor(ℂ1,B(ℂ²))=1⊗M₂`; scalars on both sides; 0=0 | holds | none |
| `isFiniteProjection_iff_modular` | `M₂`, e=1; `B(ℓ²)`, e=1 with `A=ℓ²⊕0`, `B=graph D`, `C=ℓ²⊕ℂy`, `y∉ran D`; e=0; rank-one e | finite, `dim(a∨b)+dim(a∧b)=dim a+dim b`: T/T; `B∩C=0` so `A∨(B∧C)=A`, `cl(A+B)=H` so `(A∨B)∧C=C≠A`, and the shift has `S*S=1≠SS*`: F/F; e=0: T/T; `[0,e]={0,e}`: T/T | holds | none |
| `exists_starAlgEquiv_multiplicationAlgebra` | `ℂ1` on ℂ; diagonal `ℂ²`; `ℓ∞(I)`, I uncountable; H=0 | Dirac measure, L²=ℂ; count/2 on two points; uncountably many orthogonal minimal projections against countably many atoms (separability needed); `1≠0` on the right, 0 on the left (Nontrivial needed) | holds | none |
| `nonempty_starAlgEquiv_spatialTensor_of_isTypeIIInfinity` | `R⊗̄B(ℓ²)`, `p=1⊗e₀₀`; E=0; `M₂⊗̄B(ℓ²)` | `pMp=R`, `Tr(p)=1`, countably many copies of p sum to 1; right side 0 for E=0 (hence `E≠⊥`); minimal projections, so `IsTypeIIInfinity` fails | holds | none |
| `leftRegular`, `groupVonNeumannAlgebra` | `ℤ/2`; point masses | `(λ_gδ_h)(k)=δ_h(g⁻¹k)`, so `λ_gδ_h=δ_(gh)`; swap matrix; `L(ℤ/2)=[[a,b],[b,a]]`, `τ=a` | holds | none |
| `isFactor_groupVonNeumannAlgebra_iff` | trivial group; `ℤ/2`; `F₂`; `S₃` | `ℂ` on ℂ, RHS vacuous: T/T; class `{g}` finite, centre `ℂ²`: F/F; `bⁿab⁻ⁿ` distinct: T/T; class of (12) has 3 elements, centre of `ℂ[S₃]` has dim 3: F/F | holds | none |
| `exists_linearIsometryEquiv_withLp_of_generalPosition` | `ℂ²`, `p=diag(1,0)`, q the line through `(cos θ, sin θ)`; θ=0; H=ℂ; H=0 | `b=cos²θ`, `√(b(1−b))=cos θ sin θ`, `q=[[cos²,cs],[cs,sin²]]`; θ=0 gives `ran p∩ran q≠0`, excluded; on ℂ, `p=1` forces `ran q=0=ker q`, impossible, and ℂ is not `L⊕L`; L=0 | holds | none |
| `HasPropertyGamma` | `M₂`, `tr/2`; R; `R⊕ℂ`, `τ=(1/4)τ_R+(3/4)c` | limit of `u_n` is central, a scalar λ with `|λ|=1`, trace `λ≠0`: fails; `diag(1,−1)` at site n: holds; any unitary has `|τ|≥3/4−1/4=1/2`, so the trace-zero form fails although `(u_n,0)` is central with distance² `≥1/4` | as the scope says | R01 (locator only) |
| `not_hasPropertyGamma_groupVonNeumannAlgebra_freeGroup` | Δ = words ending in `g^k`, k≠0; w ending in another letter; `x=u_a` | `g⁻¹wg` ends in g, so `w∈gΔg⁻¹`; `hΔh⁻¹` ends in `h⁻¹`, `h⁻¹Δh` in h, disjoint from Δ; `1≤2y+2ε`, `1≥3y−4ε` give `ε≥1/14`; `‖u_a−0‖₂=1≤14√2`; a trace-zero unitary has left side 1, so no central sequence, any rank | holds | none |
| `hasPropertyGamma_of_isHyperfinite` | `R=⊗M₂`, `A_n=M_(2ⁿ)`; a non-factor `A_n` with central `z_j` | `u_n=diag(1,−1)` at site n+1, `τ=0`; `e_j≤z_j` with `τ(e_j)=τ(z_j)/2` in the diffuse relative commutant, `τ(Σe_j)=1/2`; `‖[u_n,y]‖₂≤2‖y−a‖₂` for `a∈A_m`, `n≥m` | holds | none |
| `tomiyama` (13.1) | diagonal compression of `M₂`, `a=diag(2,3)`, `b=diag(5,7)`, `x=[[1,2],[3,4]]`; `x↦x₁₁e₁₁+x₂₂e₂₂+x₁₂e₂₁`; A=0 | `E(axb)=diag(10,84)=aE(x)b`; `[[1,1],[1,1]]↦[[1,0],[1,1]]`, not self-adjoint, and not a projection onto a subalgebra; norm 0, hypothesis fails | holds | none |
| `IsInjective`, `IsHyperfinite`, `isInjective_iff_isHyperfinite` (13.2) | `B(ℓ²)`; zero algebra; `L(F₂)` | P=id, and `A_n=M_n⊕ℂ` with `1−P_n=e_(n+1)e_(n+1)*+(1−P_(n+1))`, so increasing: T/T; P=0, `A_n=⊤`: T/T; no Γ, so not hyperfinite, and no hypertrace: F/F | holds | none |
| 13.2 Checks | `u=e₁₂⊗e₁₂+e₂₁⊗e₂₁`; `E_n1_[0,1/3]` | `u` swaps `e₁⊗e₁`, `e₂⊗e₂`, norm 1 against 2; value `2ⁿ/3−⌊2ⁿ/3⌋∈{1/3,2/3}`, so `‖E_nf−f‖_∞≥1/3`, `‖·‖₁≤2^(−n)` | holds | none |
| Uniqueness of injective II₁, II∞ (13.2) | R and `L(S_∞)`; `R⊗̄B(ℓ²)` | both injective II₁, both R; unique AFD II∞ by Corollary 11.2.4 | holds | none |
| `tracialState_unique`, `exists_faithful_tracialState` | `M₂`; `ℂ⊕ℂ`; `B(ℓ²)` | only `tr/2`; `t·pr₁+(1−t)pr₂` for every t, not a factor; `1=p+q` with `p∼q∼1` gives `τ(1)=2τ(1)`, so `τ(1)=0≠1`, no tracial state | holds | none |
| `double_commutant_iff_isClosed_image_ofCLM` | `ℂ1` on `ℂ²`; finite rank + scalars on ℓ² | `A″=A`, closed: T/T; `A″=B(ℓ²)≠A`, WOT dense: F/F | holds | none |
| `dye`, `exists_unique_extension_of_finitelyAdditive` | `M₂` (excluded); `M₃` | `HasTypeITwoSummand M₂` with `e=e₁₁`, `f=e₂₂`; in `M₃`, `e+f` central forces `2·rank e=3`, impossible | holds | none |

## Not verifiable

- **Uncertified and settled, cited by locator:** Arveson 1969, Haagerup 1985, Haagerup 1987, Connes–Størmer 1978.
- **Not in the cache, cited outside the sample and the changed passages, not read:** Takesaki I–III (including IV.4.9, XV.3 and XVI.1.9 of 13.2), Sakai, Reed–Simon, Rudin, Folland, Runde, Goodman–de la Harpe–Jones, Gleason 1957, Bost–Connes, Laca–Raeburn, Neshveyev, Connes 1973/1975/1976/1985, Araki–Woods, Connes–Woods, Connes–Takesaki, Haagerup 1979, Høegh-Krohn–Landstad–Størmer.
- **Jones Definition 16.1.1:** the cached extraction breaks off after "there is a central" (jones-vna lines 3364–3366). The definitions of central and trivial sequences before it are complete, which is enough for R01.
- **The pull-request description** still calls the branch a "historical staged snapshot" and points to a merged pull request. It is not folder text; the repair replies carry the replacement wording.

## Source issues

- **Misprint** in jones-vna at Theorem 16.3.2, p. 109: the source says the free group factors on n generators lack Γ "for n≥" with the bound missing; it should be n≥2; affects nothing.
- **Gap** in jones-vna at Theorem 16.2.1, p. 108: the source states that the central sequence algebra of R is a II₁ factor and leaves the proof as a note to finish it; it should be a proof; affects the proof.
