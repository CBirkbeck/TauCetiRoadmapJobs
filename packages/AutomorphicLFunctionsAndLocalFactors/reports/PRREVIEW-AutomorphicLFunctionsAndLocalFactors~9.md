# Review of AutomorphicLFunctionsAndLocalFactors (pull request #924 at 79329a0)

**Verdict:** needs changes

This is a full review of the folder at 79329a0, which differs from 330bb72, the head the previous review read, by 942 lines. Line numbers refer to `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md` unless marked `Suggested.lean`. There is one blocking finding (R01, P2) and six P3 findings. Eight of the previous review's nine findings are repaired. Its R09 is partly repaired and carried as R06; its R06 is not repaired and is carried as R07.

## R01 (P2) — Positive-characteristic Fourier inversion is stated only on S(F), but two headline functional equations need it on S(Fⁿ) and S(Mat_n(F))

**Location:**
- AL.0.3.1 at `:479`: "For the pairing `(x,y)↦ψ(xy)` prove that the annihilator of `P^m` is `P^(−ν−m)` … `f̂̂(x)=f(−x)` on `S(F)`". The positive-characteristic API bullet at `:488` has the same scope.
- AL.2.1.5 *Needs:* (`:1225`) and AL.3.3.2 *Needs:* (`:1558`) cite "AL.0.3.1 in positive characteristic" for the local Fourier transform and its inversion.

**Claim:** The matrix functional equation (AL.2.1.5, `AL2.godementJacquetLocal`) uses the Fourier transform on `S(Mat_n(F))` for the trace pairing. The equal-rank Rankin–Selberg functional equation (AL.3.3.2, `AL3.rankinSelbergLocalEqualRank`) uses it on `S(Fⁿ)` for the dot pairing. Both are stated over every nonarchimedean local field. In positive characteristic their proof routes cite AL.0.3.1, which states lattice duality, the self-dual measure and inversion only for `V=F`. No target, supplier section or pinned declaration supplies the case `dim V>1`. AnalyticNumberTheoryPartII §5.3g is cited only at completions of number fields (`:11`).

**Witness:** `Suggested.lean:320` (`fourierIntegral ψ μ (tracePairing F (n+1))`) and `:685` (`dotProductBilin F F`) sit under `[IsNonarchimedeanLocalField F]`, which allows `𝔽_q((t))`. The open ExoticMonoidalStructuresAndAbstractAutomorphicity README, section "From TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors", declares `gap:equal-characteristic-fourier` against this roadmap for exactly this statement.

**Repair:** In AL.0.3.1's positive-characteristic paragraph and API, replace `V=F` by a finite-dimensional F-vector space V with a nondegenerate F-bilinear pairing B. For every O-lattice L ⊂ V:

- the annihilator of L for `ψ∘B` is `L^∨={w : B(L,w)⊆P^(−ν)}`, and `L^∨∨=L`;
- there is a unique Haar measure `dv_ψ` with `vol(L)vol(L^∨)=1`;
- `f̂̂(v)=f(−v)` on `S(V)`.

The proof is the same: SR.1.1's coset decomposition with AL.0.1.8, AL.0.1.9 and AL.0.1.13. Name the two instances, `Fⁿ` with `dotProductBilin` and `Mat_n(F)` with `(X,Y)↦tr(XY)`, and point AL.2.1.5 and AL.3.3.2 at them.

**Tested:** take `F=𝔽₃((t))`, `ψ(t·)`, so `ν=1`, and `V=Mat₂(F)`. Since `tr(XY)=Σ X_ij Y_ji`, the annihilator of `Mat₂(O)` is `Mat₂(P^(−1))`. The self-dual volume is `vol(Mat₂(O))=3^(−2)`, and the product `3^(−2)·3^(4)·3^(−2)=1`. At `n=1` the formula `vol(Mat_n(O))=q^(−n²ν/2)` gives AL.0.3.1's `vol(O)=3^(−1/2)`.

## R02 (P3) — `AL3.upperUnitriangular` restates a pinned Tau Ceti subgroup that the supplier already uses

**Location:**
- `Suggested.lean:441–479`, `def upperUnitriangular`.
- `:104`: "The definitions `AL3.upperUnitriangular`, … ; Mathlib has no unitriangular subgroup of `GLₙ`."
- `:1475`: "`AL3.upperUnitriangular` is the subgroup `N_m`".

**Claim:** The subgroup exists at the pinned Tau Ceti with the same carrier, so the roadmap restates a library object.

**Witness:**
- `TauCeti.upperUnitriangularGroup` is at `TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/UpperUnitriangular/Basic.lean:108`. Its carrier is `IsUpperUnitriangular`, defined at `TauCeti/LinearAlgebra/Matrix/Triangular.lean:90` as `IsUpperTriangular ∧ ∀ i, M i i = 1`.
- The supplier SmoothRepresentationsOfLocalGroups imports it (`Suggested.lean:9`) and uses it for its Whittaker subgroup (`:109`).

**Repair:**
- Add `import TauCeti.LinearAlgebra.Matrix.GeneralLinearGroup.UpperUnitriangular.Basic`.
- Delete `AL3.upperUnitriangular`, and replace its six uses `upperUnitriangular F (m+1)` by `TauCeti.upperUnitriangularGroup (Fin (m+1)) F`.
- In the README, remove the backticked name at `:104` and `:1475`. Replace the Mathlib sentence with a Tau Ceti supplier-contract entry naming the declaration and its file.
- Optionally note that `longWeyl`'s body is `TauCeti.permutationGL Fin.revPerm` (`…/Diagonal/Normalizer.lean:71`, `(Matrix.permMatrixHom).toHomUnits`).

**Tested:** a scratch copy with exactly these edits elaborates with exit 0 and 14 `declaration uses sorry` warnings, the same as the original.

## R03 (P3) — The finite-place Rankin–Selberg theorems drop unitarity, but their cited sources assume it

**Location:**
- `Suggested.lean:542–545`: "(Cogdell, Fields lectures, Lecture 6, Proposition 6.2, Theorem 6.1, …, pp.47–49)".
- `Suggested.lean:628–629`: "(Cogdell, Columbia lectures, §1.3, facts 1–4, pp.7–8)".
- The same locators at `:1530` and `:1556`.

**Claim:** `AL3.rankinSelbergLocal` and `AL3.rankinSelbergLocalEqualRank` cover every irreducible smooth admissible generic `π, π′`. The statements are true in that generality. The only non-archimedean sources cited, however, prove them for unitary representations.

**Witness:** `CogdellFields` line 2216 (Lecture 6, printed p.45) fixes the standing hypothesis "irreducible admissible smooth unitary generic". Line 2340 attributes Proposition 6.2(i), convergence on `Re(s)≥1`, to unitarity. Instance: `π=π₀⊗|det|^(−5)` on `GL₂` with `π₀` unramified tempered, and `π′=1`. Then `Ψ₀(s)=L(s−5,π₀)` converges only for `Re(s)>5`. The Lean statement holds with `c=5`; Proposition 6.2(i) does not apply.

**Repair:** In both docstrings and at AL.3.2.3 and AL.3.3.2, cite a source for the generic, not necessarily unitary, case. An example is Jacquet–Piatetski-Shapiro–Shalika, *Rankin–Selberg convolutions*, Amer. J. Math. 105 (1983), 367–464, §2, which Cogdell lists as [3] at `CogdellFields` line 2553. Record it as uncertified by its locator if it is paywalled. Add one clause saying that Cogdell's lectures assume unitarity. Do not add unitarity to the Lean statements.

## R04 (P3) — A stale layer reference to curve additive analysis

**Location:** AL.3.14.1, `:2195`: "Use AL.3’s curve additive character". `:2199`: "*Needs:* …; AL.3 curve additive analysis."

**Claim:** Curve additive analysis is now AL.0.6.1, not part of AL.3.

**Witness:** `:567` is "#### AL.0.6.1 Curve additive analysis", and the moved-id line at `:40` reads "AL.3.10.1 → AL.0.6.1".

**Repair:** Write "the residue character of Curve additive analysis (AL.0.6.1)" at `:2195`, and "Curve additive analysis (AL.0.6.1)" at `:2199`.

## R05 (P3) — The representation-prerequisites layer has no Examples or Dependencies

**Location:** `:581–621`, "## Representation prerequisites", AL.R.1–AL.R.4.

**Claim:** The build table (`:242`) and the build order (`:249`, "AL.0, AL.R, AL.1, …") treat AL.R as a layer. Every layer must end with `### Examples` and `### Dependencies`, and this one has neither.

**Witness:** the heading after AL.R.4 is "## Layer AL.1" at `:623`.

**Repair:** Add `### Examples` and `### Dependencies` at the end of the section.

- Examples: for instance, a `GL₁` tensor recovers an idele-class character, and the trivial real line gives `Γ_ℝ(s)`.
- Dependencies: AutomorphicFormsOnReductiveGroups §§2.3–2.7 and 3.4–3.5; ALS.F.6; GlobalNumberFields layers 5–6; SR.1–SR.4; AdelicAlgebraicGroups §§0.1–0.4 and 2.2–2.3; ArithmeticGaloisDuality §R02.3.2; IntegralHeckeAndGaloisDeterminants §3a.1; RG2.5; AL.0.

## R06 (P3) — Run-together text that remains

**Location:** eight places.

- `:1028` "weightκ"
- `:1122` "has−s"
- `:1370` "is`(1−a(p)…`"
- `:1488` "`one, W=2,W′=3,Φ=5, |det|=2`"
- `:1544` "formulas(2.4)–(2.6)"
- `:2442` "by`χ(p)=χ^(−1)(p)=0`"
- `:2455` "`k=j=0,χ=1,ε(p)=1 gives(1−1/α)²`"
- `:2456` "prefactor`α^(−1)`"

The References list also mixes bulleted and unbulleted entries, for example `:2489` and `:2491` against `:2493`.

**Claim:** The previous review's R09 is only partly repaired. Its listed items at `:697`, `:908`, `:2329`, `:2467` and `:2519` are fixed; these eight are not.

**Repair:** Insert the missing spaces. Move "one," and "gives" out of the code spans: `:1488` becomes "For one point mass, `W=2, W′=3, Φ=5, |det|=2`", and `:2455` becomes "`k=j=0, χ=1, ε(p)=1` gives `(1−1/α)²`". Make every reference a bullet.

## R07 (P3) — The pull-request description still contradicts the README (carried from the previous review's R06, not repaired)

**Location:** the pull-request description.

- "Why Tau Ceti wants it": the consumers "take rank-one Hecke continuation and the global standard L-function from here".
- "Approach": "Continuation for arbitrary unitary Hecke characters is the n = 1 case of the Godement–Jacquet matrix integral, not a separate rank-one argument".
- The body: "The common adelic Tate/Fourier prefix … consumed from ArithmeticGaloisRepresentations §2.7".
- The body says the LFunctions and ZerosOfLFunctions pull requests "must merge first".

**Claim:** The description misstates ownership and dependencies.

**Witness:**
- `:2485` reads "their rank-one Hecke continuation is AnalyticNumberTheoryPartI §2.3a".
- `:11` assigns the Fourier prefix to AnalyticNumberTheoryPartII §§5.3g–5.3j.
- LFunctions and ZerosOfLFunctions are on main.

**Repair:** Change the description only; the folder needs no edit.

- Replace the first sentence with "…take the global standard L-function from here; their rank-one Hecke continuation is AnalyticNumberTheoryPartI §2.3a."
- Replace the second with "The global Godement–Jacquet continuation is proved for every n ≥ 1 and identified at n = 1 with AnalyticNumberTheoryPartI §2.3a."
- Replace the Fourier-prefix sentence with "The local and adelic Fourier analysis and local zeta integrals are AnalyticNumberTheoryPartII §§5.3g–5.3j; the rank-one scalar comparison uses ArithmeticGaloisRepresentations §2.7."
- Delete the sentence about LFunctions and ZerosOfLFunctions.

## Previous findings

- **R01 (the finite-place local Rankin–Selberg theorem was absent):** repaired. `AL3.rankinSelbergLocal` (`Suggested.lean:558`) covers `GL_{m+k+2}×GL_{m+1}` for every j, with the functional equation. `AL3.rankinSelbergLocalEqualRank` (`:639`) covers equal ranks. Both are cited at `:1532` and `:1554`. The source scope is R03 above.
- **R02 (29 forward targets and layer cycles):** repaired. 129 targets have no forward *Needs:*/Prerequisites edge. `:249` states the order "AL.0, AL.R, AL.1, …", and every layer's Dependencies list only earlier layers. Moved ids have the map at `:31–41`; I checked that none of the new numbers was in use at 330bb72.
- **R03 (two Lean names with no mapping):** repaired. The ClassicalArithmeticCompletion names are mapped at `:17`, and TwoLegShtuka at `:1964`.
- **R04 (the CuspForm bound):** repaired at `:83`. The text now gives `(k+1)/2` and `k/2+1`, matching `TauCeti/NumberTheory/ModularForms/LFunction/Basic.lean:145` and `:177`.
- **R05 (the stabilization Check):** repaired at `:2412`: "`a_α(3)=a(3)−β·a(1)=−3≠α`".
- **R06 (the pull-request description):** not repaired; carried as R07.
- **R07 (Lean title, "deferred" and labels):** repaired at `Suggested.lean:4`, `:41`, `:115` and `:154`.
- **R08 (References and consumers):** repaired. All eight works are at `:2559–2573`, and `## Downstream consumers` is at `:2483`.
- **R09 (spacing):** partly repaired; the rest is R06.

## Verified sound

**Gate and dependency check.** I ran the gate on this head. Every count is 0 and the result is OK; the worker's run also reports `build=0`. The dependency check prints:

```text
depcheck: 239 roadmaps, 2370 edges, 0 problem(s)
```

There are no UPWARD, CYCLE or `moved:` lines. Nothing outside the folder changes. The folder holds only `README.md`, `Suggested.lean` and `metadata.toml`.

**Elaboration.** `lake env lean` on `Suggested.lean` exits 0 in 12.9 s. It gives exactly 14 `declaration uses sorry` warnings, at lines 67, 72, 83, 117, 130, 156, 214, 291, 365, 381, 427, 558, 639 and 715, and nothing else. The file has a single `import Mathlib`, no `set_option` and no `lemma`.

**`#check @` audit.** I checked all 35 declarations in one scratch file.

- The two "dropped" leads are `hbesselK`, which appears as an anonymous hypothesis in both Bessel types.
- AL3 has no section variables. Both new theorems carry every binder in their own signatures: smoothness and admissibility of `π` and `π′`, nonzero `ell ∈ whittakerFunctionals … ψ` and `ell′ ∈ … ψ⁻¹`, an `SMulInvariantMeasure` that is `IsFiniteMeasureOnCompacts` with `μ ≠ 0`, the Haar measures `μx j`, and `hmod`.

**The new integrands.**

- `rsEmbedding(uh,x)=diag(u,I)·rsEmbedding(h,x)` for `u∈N`, and the opposite characters cancel. So `rsIntegrand` does not depend on the representative `Quotient.out`.
- The dual function is `g↦W(w_n·ᵗ(g·w_{n,m})⁻¹)=(R(w_{n,m})W̃)(g)`. This matches `CogdellFields` lines 2046–2051 and Theorem 6.2 (line 2436, `Ψ̃=Ψ_{n−m−1}` by line 2242). `rsWeyl` is `diag(I_{m+1},w_{k+1})`.

**One-tactic probe.** In a scratch copy, each of the 14 `sorry`s was replaced by `first | rfl | simp | infer_instance | decide | norm_num | exact le_rfl | aesop | trivial`, each closing the goal or failing. All 14 fail, so none is padding.

**Headline theorems.** Fourteen are stated:

- the finite jet (AL.0.3.6);
- the two Bessel identities (AL.0.5.2–AL.0.5.3);
- archimedean and finite eigenline uniqueness (AL.1.2.5);
- the nonarchimedean and archimedean rank-one functional equations (AL.1.3.2);
- the local Godement–Jacquet theorem (AL.2.1.4–AL.2.1.5);
- Casselman's existence and dimension theorems (AL.2.2.2, AL.2.2.4);
- Whittaker uniqueness (AL.3.1.1);
- the unequal-rank and equal-rank local Rankin–Selberg theorems (AL.3.2.3, AL.3.3.2);
- the generic newform line (AL.3.3.5).

The docstring at `Suggested.lean:26–43` names the rest as not statable, each with its missing carrier: the global Godement–Jacquet and Rankin–Selberg theorems; multiplicity one; the converse theorems; rational periods; the Maass functional equation and norm; the arithmetic ε identification; the archimedean Godement–Jacquet and Rankin–Selberg theorems; the curve and shtuka statements; and AL.4–AL.5. I found no statable headline that is absent.

**Seeded sample: the Check for the theta–Mellin formula** (`:1691–1693`, AL.3.5.1; Cogdell, Columbia lectures, §1.1.3, pp.4–5).

- `CogdellColumbia` lines 256–267 (p.4) give `E(g,s;Φ,η)=|det g|^s∫_{k×\A×}Θ′_Φ(a,g)|a|^{ns}η(a)d×a` for `Re s>1`, with η a unitary idele-class character and `ξ=0` removed.
- Lines 273–277 (p.5) give the poles at `iσ, 1+iσ` and `E(ᵗg⁻¹,1−s;Φ̂,η⁻¹)`.
- Lines 279–289 give the `(n−1,1)` section and the sum over `P′(k)\GLₙ(k)`.

The theorem, the page, the hypotheses and the README statement all agree. The README flags no locator as unverified.

**Other locators read.**

- `CogdellFields`: Proposition 6.2 (line 2334, printed p.47); Theorem 6.1 (2369, p.47); `I_j=I_{j+1}` (2359–2361); Proposition 6.3 and Corollary 6.3.1 (2386, 2392, p.48); Theorem 6.2 (2434, p.48); Proposition 6.5 (2463, p.49).
- `CogdellColumbia` §1.3, facts 1–4 (lines 380–427, pp.7–8). The equal-rank equation carries the sign `ω_{π′}(−1)^{n−1}`, matching `Suggested.lean:637–638`.

**Library declarations opened at the pins.**

- Tau Ceti:
  - `TauCeti.upperUnitriangularGroup` (`…/UpperUnitriangular/Basic.lean:108`) and `Matrix.IsUpperUnitriangular` (`…/Matrix/Triangular.lean:90`)
  - `TauCeti.permutationGL` (`…/Diagonal/Normalizer.lean:71`)
  - `CuspForm.abscissaOfAbsConv_qExpansion_coeff_le` and `CuspForm.LSeries_qExpansion_coeff_eq` (`…/LFunction/Basic.lean:145`, `:177`)
- Mathlib:
  - `Matrix.GeneralLinearGroup.transposeMulEquiv` (`LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean:237`)
  - `Matrix.permMatrixHom` (`LinearAlgebra/Matrix/Permutation.lean:90`)
  - `dotProductBilin` (`LinearAlgebra/Matrix/ToLin.lean:144`)
  - `QuotientGroup.measurableSpace` (`MeasureTheory/MeasurableSpace/Constructions.lean:138`)
  - `Matrix.GeneralLinearGroup.upperRightHom` (`…/FinTwo.lean:194`)
  - `Algebra.traceForm` (`RingTheory/Trace/Defs.lean:170`). It is `tr_F(L_{XY})=n·tr(XY)` on `Mat_n(F)`, so `AL2.tracePairing` does not duplicate it.
- Mathlib has no unitriangular subgroup or exponential integral. Tau Ceti has no Ei; SpecialFunctionsEiLiErfIncompleteGamma (its README lines 155–158) records `AL0.negativeEi` as this roadmap's adapter and proves the identification with `−E₁` itself, so there is a single owner.

**Consumers and ownership.**

- Across main and the 467 open heads, 72 distinct AL ids are cited by other roadmaps. All of them resolve here, as a heading or through the maps at `:17–41`; this includes AL.3.10.1, AL.R.5, AL.2.1.1 and AL.2.6.4.
- The Lean names cited elsewhere are `AL0.StandardAdditiveCharacter.*` (mapped at `:17`), `TateZeta.epsilonFactor*` (mapped at `:897`) and `AL0.negativeEi` (declared).
- No other `Suggested.lean` uses this namespace.
- The overlap index reports no dropped or renamed ids.
- Among the closest roadmaps, AutomorphicLFunctionsAndLocalFactorsPartII defers to AL.0–AL.4. AutomorphicSpectralTheory §3.6a consumes AL.3.9.4. Neither restates the local Godement–Jacquet, Rankin–Selberg or Tate theory.

**Adversarial calculations.**

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| AL.3.5.1 theta–Mellin Check (sampled), `:1691` | point mass, `n=2`, `\|det g\|=3`, `θ₀=5`, `\|a\|=2`, `η=1`, `s=1` | `3·5·2^(2·1)=60`; dropping n gives `3·5·2=30`; the source has `\|a\|^{ns}` (line 267) | Pass |
| AL.3.5.1 `E(zg)=η(z)⁻¹E(g)`, `:1683` | substitute `a↦az⁻¹` | `\|z\|^{ns}·\|z\|^{−ns}·η(z)⁻¹`; the section lies in `Ind(δ^{s−½}η⁻¹)` (line 284) | Pass |
| AL.3.5.2 poles and zero modes, `:1701–1705` | `η=\|·\|^{−inσ}`; `n=2`, `g=1` | poles at `iσ, 1+iσ` (lines 274–275); `∫₀¹t^{2s}dt/t=1/(2s)`, so the residues are `−κΦ(0)/2` and `κΦ̂(0)/2` | Pass |
| `BesselHalfOrderDerivative` | `c=1, 2, 0.3`, by quadrature of `∫t·sinh(t/2)e^{−c cosh t}dt` | LHS `0.1665972450, 0.0247486375, 1.4034805167`; `√(π/2)e^c c^{−½}E₁(2c)` gives the same | Pass |
| `BesselLaplaceMellin` | `(m,t,s)=(1,½,2)` and `(2,¼,1.5)` | LHS `4.66274247e−3, 3.07725439e−3`; RHS `4.66274247e−3, 3.07725303e−3` | Pass |
| `hbesselK` against ANT-I §2.1a | `ν=½`, `c=1` | `K_{½}(1)=0.4610685044=√(π/2)/e` | Pass |
| `pointSupported_finiteJet` | `δ₀`; `δ₀′`; `T=0` | `N=0`; `f=xe^{−x²}` has `f(0)=0` and `δ₀′f≠0`, so `N=1`; `T=0` holds for any N | Pass |
| `archimedeanEigenSpace.finrank` | `ℝ`, `χ=1` | `δ₀(f(a⁻¹·))=f(0)`; `∫f(a⁻¹x)dx=\|a\|∫f` lies in the `\|·\|` line; each line has dimension one | Pass |
| `localZetaIntegral_functionalEquation` | `𝔽₃((t))`, `χ=1`, `f=1_O`, `ν=0` | `Z=(1−q^{−s})^{−1}`, `Zhat(1−s)=(1−q^{s−1})^{−1}`, `γ=(1−q^{−s})/(1−q^{s−1})`; strips `Re s>0` and `Re s>0` in Zhat's variable | Pass |
| `archimedeanLocalFunctionalEquation` | `ℝ`, `e^{−πx²}`; `ℂ`, `e^{−2π\|z\|²}` | `Z=Γ_ℝ(s)`, `γ=Γ_ℝ(1−s)/Γ_ℝ(s)`; `(2π)^{1−s}Γ(s)=πΓ_ℂ(s)` | Pass |
| `finiteEigenSpace_finrank` | `χ=1` | `r′(ϖ)λ₀=λ₀−δ₀`, from `∫(1_{P⁻¹}−1_O)d×y=1`; the invariants are `ℂδ₀` | Pass |
| `godementJacquetLocal` | trivial `GL₂`, `Φ=1_{M₂(O)}` | `Σ_k(1+…+q^k)q^{−k(s+½)}=(1−q^{−s−½})^{−1}(1−q^{½−s})^{−1}`; converges iff `Re s>½` | Pass |
| `newvectorLevelExists`, `casselmanNewvector` | unramified PS; Steinberg; `n=c−1` | dimensions `n+1` and `n`; `ℕ`: `c−c=0` | Pass |
| `whittakerUniqueness` | `n=0`; trivial `GL₂` | rank 1, since N is trivial; `ψ(x)≠1` forces 0 | Pass |
| `rankinSelbergLocal`, `GL₂×GL₁` | unramified, roots `α₁,α₂`; `χ(ϖ)=β` | `W(diag(ϖ^k,1))=q^{−k/2}h_k`; `Ψ₀=Σh_k(βq^{−s})^k=∏(1−α_iβq^{−s})^{−1}`; `P=(1−α₁βT)(1−α₂βT)` | Pass |
| `rankinSelbergLocal`, `GL₃×GL₁`, `j=0` | unramified | `W°(diag(ϖ^k,1,1))=q^{−k}h_k(α)`, exponent `s−1`, so `Ψ₀=∏_{i≤3}(1−α_iβq^{−s})^{−1}` | Pass |
| `rankinSelbergLocalEqualRank`, `m=0` | unramified `χ₁,χ₂`, `Φ=1_O`; ramified quadratic `χ` over `ℚ₃` | `(1−χ₁χ₂(ϖ)q^{−s})^{−1}`; `L(s,χ×χ)=(1−3^{−s})^{−1}=3/2` at `s=1` | Pass |
| Source scope of the Rankin–Selberg theorems (R03) | `π=π₀⊗\|det\|^{−5}`, `π′=1` | `Ψ₀=L(s−5,π₀)` converges only for `Re s>5`; the Lean c is 5; Cogdell's `Re s≥1` fails | Locator (R03) |
| `AL3.upperUnitriangular` (R02) | `n=2` | both carriers are `{[[1,b],[0,1]]}`; the repaired file elaborates with 14 warnings | Duplicate (R02) |
| AL.0.3.1 in positive characteristic, `dim V>1` (R01) | `𝔽₃((t))`, `ν=1`, `V=Mat₂(F)` | annihilator `Mat₂(P^{−1})`; `vol(Mat₂(O))=3^{−2}`; product `1`; not stated in the README | Missing (R01) |
| AL.0.3.1 Checks | `r(ϖ)1_O`; Gaussian with `a=2`; `𝔽₃((t))` | `1_{P^{−1}}`; `½e^{−πy²/4}`; `3^{−½}·3^{½}=1`; `ν(ψ_b)=ν+ord b` | Pass |
| `genericNewform` | `n=0` | `newformLocalK1 F 0 m` is `1+P^m` (`m≥1`) or `O^×`; invariants nonzero iff `m≥c(χ)` | Pass |
| AL.1.3.1 ℚ₃ Check, `:906`, `:929` | quadratic ω, `ψ₀(3·)` | `𝔤=3·(−i√3)·3^{−3/2}=−i`; `ε=−i·3^{1−2s}`, which is `−3i` at `s=0`; at `ν=0`, `−i·3^{½−s}` | Pass |
| AL.1.6.1 `χ₋₄` Check | `e^{−2πia/4}` | `−i−i=−2i`, normalized `−i`; times `ε_∞=i` gives 1 | Pass |
| AL.1.4.4 table | `(k,t)`, `k=2` | central character `sgn^k\|·\|^{2t}`; `ε=i²=−1`; shift ½ | Pass |
| AL.2.1.8 | factorization | both sides `q(α²+β²)−(q²+1)αβ`; trivial at `q=2`: `9=1·9` | Pass |
| AL.2.2.4 central character, `:1309` | `g∈K₀(p^c)` | `g·diag(1,d⁻¹)` has last row `(g₂₁,1)` | Pass |
| AL.2.4.1 Check, `:1354` | `ω=\|·\|^{it}` | poles at `−it` and `1−it` | Pass |
| AL.3.2.1 and AL.3.2.3 Checks | point masses; roots `(2,3)`, `β=5` | `2·3·4^{½}=12` against 24; `(1−10T)(1−15T)` | Pass |
| AL.3.6.1 Check, `:1731` | `π₂=\|·\|^{2i}` | poles at `−2i` and `1−2i`; `σ=−2` | Pass |
| AL.3.9.2 Checks | `exp(±s²)` | `\|exp(s²)\|=e^{σ²−t²}` is bounded on strips; `exp(−s²)` on `iℝ` is `e^{t²}` | Pass |
| AL.3.9.4 dual polynomial | `h=½` | roots `q^h/α, q^h/β`, giving `1−a/(√q s)T+s⁻¹T²` | Pass |
| AL.3.10.15, AL.3.12.2–3 | constant line; `P=1−az+qz²` | `1−z`, `1−qz`; `h¹=2d+(2g−2)n²`; `qz²P(1/(qz))=P` | Pass |
| AL.3.16.1 | `r=0.7` | `Γ_ℝ(1)Γ_ℝ(1±2ir)=1/cosh(πr)=0.2191` | Pass |
| AL.4.1.1, AL.5.1.1, AL.5.4.1 | `a=2,b=3`; `E=(1−p^{−s})²`; `p=3,k=0,j=1` | `1−6T` against `1−5T+6T²`; `E″(0)=2(log p)²`; `(1−3)(1−⅓)=−4/3` | Pass |
| AL.5.2.2 (repaired) | `y²=x³−x`, `(α,β)=(1,3)` | `a_α(3)=−3`, `a_β(3)=−1` | Pass |

## Not verifiable

- **Jacquet–Piatetski-Shapiro–Shalika, *Rankin–Selberg convolutions* (1983):** paywalled, not read. It is suggested in R03 only as the generic-case owner and must be cited by locator.
- **Godement–Jacquet, LNM 260, Theorems 3.3 and 8.7:** paywalled, not read.
- **Other sources outside the sample were not re-read this round:** Lafforgue, Humphries, Humphries–Nordentoft, Leslie, Yu, Zhang, Raghuram and Rodrigues Jacinto–Williams. Their formulas were computed where the table shows them.
- **Ownership against open pull requests** was checked by grep over the 467 heads for the objects of the new Lean declarations (Whittaker functionals, the unitriangular subgroup, the Rankin–Selberg and Godement–Jacquet integrals, Ei) and over the closest-vocabulary roadmaps. It is not a full read of every open roadmap.

## Source issues

- **Misprint** in CogdellFields at Lecture 6 §2, printed p.47: the source says the h-equivariance of the j-th integral returns a function named Φ_j; it should be Ψ_j; affects nothing.
- **Misprint** in CogdellFields at Lecture 6 §3, before Proposition 6.5, printed p.49: the source says the first epsilon factor is for π×π; it should be π×π′; affects nothing.
