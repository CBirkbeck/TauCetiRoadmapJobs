# Review of AutomorphicFormsOnReductiveGroups (pull request #1037 at 4a03177)

**Verdict:** accepted

This is an incremental re-review of the 5 lines changed since 5acbf96. All of them are in `TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/README.md`: line 51 (the RepresentationTheory supplier contract), line 739 (§5.1) and the new §5.1 Check at line 751. `Suggested.lean` and `metadata.toml` are unchanged, and nothing outside the folder differs from `origin/main`. The previous report's only finding is repaired, the repair introduces no new defect, and the gate passes. This report has no findings.

## Previous findings

- R01 — repaired: line 51 now lists `TauCeti.nonempty_lieModuleEquiv_iff_eq_of_isHighestWeightVector` and `TauCeti.exists_isDominantIntegral_nonempty_lieModuleEquiv_irreducibleQuotient`. It derives "a bijection from dominant integral weights onto isomorphism classes …", and it names `LieAlgebra.rootSpace`, `LieModule.iSup_genWeightSpace_eq_top`, `LieModule.iSupIndep_genWeightSpace` and `LieAlgebra.rootSpace_zero_eq`, with `IsCartanSubalgebra` plus `IsTriangularizable` as the hypotheses.

## Verified sound

**Gate, build, dependency check and edits outside the folder.**
- The gate, rerun at 4a03177 with `--base origin/main`, prints every check as 0 and ends `OK`, including `dropped=0`, `readme-ids-missing=0`, `statement-hygiene=0` and `outside-folder=0`. The worker's gate.md also reports `build=0`.
- `git diff --stat 5acbf96 HEAD` touches only README.md (3 insertions, 2 deletions). `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/AutomorphicFormsOnReductiveGroups'` is empty.
- `lake env lean TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/Suggested.lean` prints only `declaration uses sorry` at 47:8, exit 0.
- Dependency check output:

```
depcheck: 239 roadmaps, 2363 edges, 0 problem(s)
```

  There is no UPWARD, CYCLE or `moved:` line. The merge order lists ArithmeticGaloisRepresentations at line 56, ArithmeticLocallySymmetricSpaces at 57 and this roadmap at 58.

**The 15 declarations named in the changed lines, checked at the pins.** I elaborated a `#check @name` for each in a scratch file (exit 0) and opened each one in the source.
- Mathlib:
  - `LieSubalgebra.IsCartanSubalgebra` (`Mathlib/Algebra/Lie/CartanSubalgebra.lean:49`) has exactly two fields, `nilpotent` and `self_normalizing`. Its docstring says a splitting Cartan is obtained by adding `IsTriangularizable`, which is what line 51 now says.
  - `LieModule.IsTriangularizable` (`Mathlib/Algebra/Lie/Weights/Basic.lean:701`).
  - `LieAlgebra.rootSpace` (`Weights/Cartan.lean:46`) is an `abbrev` for `genWeightSpace L χ` of `L` as an `H`-module, so it is a generalized weight space, as stated.
  - `LieModule.iSup_genWeightSpace_eq_top` (`Weights/Basic.lean:765`) needs a field, `[FiniteDimensional K M]`, `[IsTriangularizable K L M]` and a nilpotent `L`.
  - `LieModule.iSupIndep_genWeightSpace` (`Weights/Basic.lean:668`) needs `[IsDomain R]` and `[Module.IsTorsionFree R M]`.
  - `LieAlgebra.rootSpace_zero_eq` (`Weights/Cartan.lean:257`) needs `[H.IsCartanSubalgebra]` and `[IsNoetherian R L]`, which finite dimension gives.
  - `LieAlgebra.IsKilling.rootSystem` (`Weights/RootSystem.lean:411`) needs `[CharZero K] [IsKilling K L] [FiniteDimensional K L]`, a Cartan subalgebra and `IsTriangularizable`. That is the "characteristic zero with non-degenerate Killing form" setting of line 51.
- Tau Ceti, all in namespace `TauCeti`, under `[CharZero K] [IsKilling K L] [FiniteDimensional K L]` and a split Cartan:
  - `finiteDimensional_iff_isDominantIntegral_of_isHighestWeightVector` (`TauCeti/Algebra/Lie/HighestWeight/FiniteDimensional.lean:122`, with `[IsIrreducible K L M]` in its `variable` block).
  - `finiteDimensional_irreducibleQuotient_of_isDominantIntegral` (`FiniteDimensional.lean:136`).
  - `irreducibleQuotient` (`Verma.lean:525`), the quotient of the Verma module by the maximal submodule, in `Type (max u v)`.
  - `isIrreducible_irreducibleQuotient` (`Verma.lean:583`), irreducible for every `λ`.
  - `nonempty_lieModuleEquiv_iff_eq_of_isHighestWeightVector` (`Irreducible.lean:296`). Its hypotheses are `[IsIrreducible]` on both modules and highest-weight vectors of weights `lam` and `mu`. It has no `FiniteDimensional` on the modules and no `IsAlgClosed`, so the clauses "neither being assumed finite-dimensional" (line 51) and "no algebraic closure assumed" (line 739) are exact.
  - `existsUnique_isDominantIntegral_highestWeight_of_finiteDimensional_irreducible` (`Existence.lean:234`, under `[IsAlgClosed K]`).
  - `exists_isDominantIntegral_nonempty_lieModuleEquiv_irreducibleQuotient` (`FiniteDimensional.lean:174`, with `[IsAlgClosed K] [FiniteDimensional K M]`).
- **The bijection argument of line 51.**
  - It is well defined by `…_irreducibleQuotient_of_isDominantIntegral` and `isIrreducible_irreducibleQuotient`.
  - It is onto by the last declaration, which is why the paragraph places that step over an algebraically closed field.
  - It is injective by the isomorphism criterion applied to the canonical generators. The generator lemma `TauCeti.isHighestWeightVector_irreducibleQuotientGenerator` (`Verma.lean:594`) exists at the pin and is part of `irreducibleQuotient`'s API.
  - Both `L(λ)` and `L(μ)` live in the same universe, so the criterion applies to them as stated.

**The changed §5.1 (line 739) and its new Check (line 751).**
- **The parenthetical citing the isomorphism criterion.** The criterion applies with `K=E`, `L` the derived Lie algebra over `E` and `H` the Cartan subalgebra of the derived torus of `T`.
  - The derived Lie algebra is semisimple in characteristic zero, hence `IsKilling`.
  - `T` is split over `E`, so `H` is triangularizable.
  - The `λ`, `μ` of the parenthetical are highest weights of that Cartan.
  - The new Check states that `coefficient_unique` uses the whole weight in `X*(T)`, so it separates that full-weight statement from the Lie-algebra criterion.
- **The criterion and the full weight.** The criterion is "the Lie-algebra half": `X*(T)→X*(T^der)⊕X*(Z⁰)` is injective, since `T^der×Z⁰→T` is an isogeny, and in characteristic zero a character of `T^der` is fixed by its derivative. So the full weight is recovered from the derived weight and the central character, which is how the Check separates the two.
- **Agreement with the other §5.1 Checks.**
  - The new Check agrees with the Check "`V_(a,b)` has dimension `a−b+1`, central weight `a+b` and dual highest weight `(−b,−a)`": by that rule `V_(0,−1)` is the dual of `V_(1,0)`.
  - It agrees with the `GL₁` Check "`λ=(n_σ)_σ` gives `x↦∏_σσ(x)^{n_σ}`", where the derived algebra is zero and only the central character distinguishes the coefficients.
- **Use elsewhere.** Line 522 (Layer 2 Dependencies) and line 941 (Layer 5 Dependencies) cite "the … classification declarations of the RepresentationTheory supplier contract". They now cover the isomorphism criterion as well, and need no edit.
- **Check count.** §5.1 now has 14 Checks.

**Seeded sample, where it meets the change.**
- None of the sampled targets falls in the changed lines: §§0.1a, 0.6, 1.2, 1.3, 2.2, 3.1, 3.4, 4.3, 5.4, 5.7, 5.8a, 6.7, 7.1, 7.2a and 7.4.
- None of them cites line 51's new declarations or `coefficient_unique`. I read §2.2 and §5.4 to confirm this: §2.2 consumes LieHighestWeight Layers 7 and 9 and the `gap:reductive-enveloping-centers` contract, and §5.4 cites Vogan–Zuckerman and Vogan.
- So, under the incremental rule, their locators were not reopened. The README flags no locator as unverified (`grep -c unverified` gives 0).
- The changed lines add no source locator, only library declarations, which are checked above.

**Ownership and principles.**
- `roadmaps grep --fixed coefficient_unique` finds it only in this README, at lines 739 and 751.
- `TauCeti.nonempty_lieModuleEquiv_iff_eq_of_isHighestWeightVector` is cited by LieHighestWeight's `Suggested.lean` on main (line 448) and in its revision #1797. Both cite the pinned declaration; neither plans it as a target. The change replaces nothing another roadmap owns.
- The overlap tool reports no other open pull request changing this roadmap, no dropped id and no id that only an open revision defines. Ownership against open pull requests was checked with `roadmaps grep`.
- No process word, LaTeX or pull-request number appears in the new text (gate `latex=0`, `prnum=0`, `round-labels=0`).

**Lean form and headline.** `Suggested.lean` is byte-identical to the file r10 read. Its one declaration, `compactFinite_dense_locallyConvex`, still carries `[CompactSpace K] [T2Space K] [IsUniformAddGroup E] [T2Space E] [LocallyConvexSpace ℝ E] [CompleteSpace E]` and the joint-continuity hypothesis (signatures.md). No change touches a headline, so the headline list and the one-tactic probe stand as in the previous reports.

**Adversarial table.** The first five rows are new, with computed values for the changed statements. The rows after them are carried for untouched statements, marked "(r10)" or "(r9)" by the report that computed them. r10's row "line 51: dominant-integral classification" is replaced by the new rows.

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| line 51: root-space decomposition from `rootSpace`, `iSup_genWeightSpace_eq_top`, `iSupIndep_genWeightSpace`, `rootSpace_zero_eq` | `sl₂(ℚ)`, `H=ℚh`; `so(3,ℝ)`, `H=ℝL_z`; `𝔤=0` | `sl₂`: `𝔤_0=ℚh`, `𝔤_α=ℚe` (`α(h)=2`), `𝔤_{−α}=ℚf`, dimensions `1+1+1=3=dim sl₂`; `so(3)`: `ad L_z` has eigenvalues `±i`, so over `ℝ` the generalized weight spaces sum to `H`, of dimension `1≠3`, and this case is excluded by `IsTriangularizable`; `𝔤=0`: `H=0`, a single zero root space | holds; the splitting hypothesis is needed and stated | none |
| line 51: `IsCartanSubalgebra` is only nilpotent and self-normalizing | `sl₂`: `ℚh`, `ℚe`; `so(3)`, `ℝL_z` | `ℚh`: normalizer `ℚh`, Cartan; `ℚe`: nilpotent, but its normalizer is `ℚe+ℚh≠ℚe`, so not Cartan; `ℝL_z`: Cartan but not splitting | as stated; the pairing with `IsTriangularizable` is needed | none |
| line 51: `λ↦[L(λ)]` bijection | `sl₂(ℚ)`, `λ(h)=m`; `λ(h)=−1`; `L(ω)` vs `L(2ω)`; `𝔤=0` | `dim L(mω)=m+1`, with `L(0)` of dimension `1` (`finrank_irreducibleQuotient_zero`); `M(−ω)` irreducible, so `L(−ω)` is infinite-dimensional and `−ω` is not dominant; dimensions `2≠3`, and the criterion gives `1≠2`; `𝔤=0`: one weight `0`, one class `[K]` | well defined, injective and onto as argued, with onto over an algebraically closed field | none |
| line 739: criterion on the derived algebra over `E` | `GL₂/ℚ`, `E=ℚ`; `GL₁/F` | derived algebra `sl₂`, Killing form `B(h,h)=tr(ad h)²=4+0+4=8≠0`, so `IsKilling`; `T` diagonal, so the Cartan is split; no `IsAlgClosed` in `Irreducible.lean:296`; `GL₁`: derived algebra `0`, the criterion holds trivially, and the characters `t^n` are told apart by the central character only | holds; consistent with the `GL₁` Check | none |
| line 751: new Check, `V_(1,0)` vs `V_(0,−1)` | `GL₂`, `h=diag(1,−1)`, centre `tI` | `V_(1,0)=Std`: dimension `1−0+1=2`, `h`-weight `1`, centre `t^1`; `V_(0,−1)=Std⊗det^{−1}`: dimension `0+1+1=2`, `h`-weight `0−(−1)=1`, centre `t·t^{−2}=t^{−1}`; `T`-weights `{(1,0),(0,1)}` vs `{(0,−1),(−1,0)}`; dual rule `(−b,−a)` takes `(1,0)` to `(0,−1)` | the restrictions to `sl₂` are isomorphic and the `GL₂` coefficients are not; this excludes a Lie-algebra-only uniqueness | none |
| line 672: classical comparison at level `Ẑ` (r10) | `F=ℚ`, `f=ψ(2·)`; `ξ=1/2`, `1/3`; `f=1` | `c_n=δ_{n2}`; `ψ_2(1/2)=−1`; `c_{1/2}=c_{1/3}=0`; Tate sign gives `c_{−2}=1`; `c_0(1)=1` | holds (r10) | none |
| line 49: AGR §2.1 arithmetic lifts (r10) | `ℚ(i)`, `p=3`, `p=5` | Frobenius is conjugation, resp. trivial | holds (r10) | none |
| line 49: next coefficient, constant term (r10) | `n=2`, `diag(p,1)` | `X²−(p+1)X+p` | holds (r10) | none |
| line 49 / line 925: twist law at `n=2` (r10) | `𝔽₇`, `(2,3)`, `q=3`, `χ_v=2` | `(4,5)` | holds (r10) | none |
| line 932: arithmetic vs geometric Frobenius (r10) | `ℤ_3(1)⊕ℤ_3`, `p=2` | `(3,1)` vs `(3/2,1/4)` | holds (r10) | none |
| line 925: `s_v` needs `q_v` a unit (r10) | `ℤ_ℓ`, `v=p≠ℓ`; `v=ℓ` | `p` a unit; `ℓ∈S` | holds (r10) | none |
| line 51: weights and integrality (r10) | `sl₂`, `Sym^m`; `α/4` | weights `m,…,−m∈ℤ`; `1/2∉ℤ` | holds (r10) | none |
| line 1316: R17.3.8b trace (r10) | `J=C₂` sign on `ℤ` | `2f(1)` | holds (r10) | none |
| §3.3 compact-type idempotents (r10) | `U(1)`, `S={0}⊂T={0,1}` | `e_Se_T=e_0`; `I` vs `I/4` | holds (r10) | none |
| §7.6 central carrier (r10) | `Gₘ/ℚ(√2)`; `ℤ/8`; `𝔽₅` | `S_ψ=A`; `4·(−1)=4`; `f=0` | holds (r10) | none |
| line 47 / §4.3: `ψ=∏ψ_v` sign (r9) | `x=1/3`, `1/6` over `ℚ` | products `1`; reversed sign `≠1` | holds (r9) | none |
| line 47: inverse different (r9) | `ℚ(i)` at `(1+i)`; `ℚ_p` | `ψ_2(1/2)=−1`; `ψ_p(1/p)≠1` | holds (r9) | none |
| lines 47, 662: `ξ↦ψ(ξ·)` (r9) | `ξ=0`, `1/2` | trivial; `ψ(a)=−1` | holds (r9) | none |
| `adeleRing_selfDual` as cited (r9) | `K=ℚ` | `ψ′(1/2)=−1` excluded | holds (r9) | none |
| line 664: `fourierCoeff`, translate law (r9) | `f=1`, `ψ(·+a)` | `c_0=1`; `c_1=ψ(a)` | holds (r9) | none |
| line 57: §5.3h character duality (r9) | second bullet | annihilator of `V` is `V` | holds (r9) | none |
| line 1308: AL.0 uses §5.3g (r9) | AL README lines 20, 64, 81 | AL.0.2 → §5.3g | holds (r9) | none |
| §0.2 normalized idempotent (r9) | `vol(J)=2` | `e_J*e_J=e_J`; `1_J*1_J=2·1_J` | holds (r9) | none |
| §0.7 `cosetSystem_volume` (r9) | `GL₂(ℚ_2)`, `diag(2,1)` | 3 cosets | holds (r9) | none |
| §1.2 smooth cochains (r9) | `x²`; sign action of `C₂` | `df(1,2)=−4`; `dv(g)=−2v` | holds (r9) | none |
| §2.3 normalized induction (r9) | `SL₂(ℝ)`, `diag(2,1/2)` | `δ_P=4`; Casimir `(ν²−1)/4` | holds (r9) | none |
| §3.4 restricted tensors (r9) | `M_r⊗M_s`; `C₂×C₂` | dimension `rs`; rank `2≠1` | holds (r9) | none |
| §3.5 spherical lines (r9) | unramified, Steinberg; Iwahori | `1`, `0`; `2`, `1` | holds (r9) | none |
| §4.2 cuspidality and `L²` (r9) | `SL₂` constants; `E₄` | constant term `1`; `∫y²dy` diverges | holds (r9) | none |
| §5.4 Vogan–Zuckerman types (r9) | `U(2,1)`; `SL₂(ℝ)` | `(2,0)`; types `(1,0)`, `(0,1)` | holds (r9) | none |
| §5.6 lattices (r9) | `𝔽_q((t))`, `n=0,1,2`; `diag(p,1)` | lattices exist; `(1/p,1)∉gL` | holds (r9) | none |
| §5.6 non-example, generic fibre (r9) | `⟨t⟩⊂GL_1`; rank `n` | no lattice; dimension `n` | holds (r9) | none |
| line 45: hypotheses of `nonempty` (r9) | `ℤ`; `𝔽_q[[t]]` | excluded; applies | holds (r9) | none |
| `compactFinite_dense_locallyConvex` (r9) | trivial `K`; `E=0`; `S¹` on `C(S¹)` | spans of dimension `≤#K`; trigonometric polynomials dense | holds (r9) | none |
| §1.3 `vanEstIso` (r9) | compact `L`; `ℝ^n`, `n=0,1` | `V^L`; `Λ^q`; `ℝ` | holds (r9) | none |
| §1.3 `H^q(𝔰𝔩₂,SO(2))` (r9) | `q=0,1,2` | `ℂ,0,ℂ` | holds (r9) | none |
| §2.3a `P=G` iff `Σ=∅` (r9) | `ℝ^×`, `SL₂(ℝ)` | `P=G`; `{±λ}` | holds (r9) | none |
| §2.5 `W_ℝ`, symmetric powers (r9) | `(j·2)²`; `n=m=2` | `−4`; `3` | holds (r9) | none |
| §3.1 smooth automorphic forms (r9) | compact `G_∞`; `GL₁/F` | finite-dimensional; class group | holds (r9) | none |
| §4.3 Eisenstein coefficients (r9) | `k=4` | `240`, constant term `1` | holds (r9) | none |
| §5.1 C- vs L-algebraic (r9) | `GL₂` trivial, `D_k(0)`, `PGL₂` | `ρ=(1/2,−1/2)`; `−ρ` integral iff `k` even | holds (r9) | none |
| §5.2 coefficient equation (r9) | `D_k(μ)`, `V_{(a,b)}` | `a−b=k−2`, `a+b=−μ` | holds (r9) | none |
| §5.3 `(q₀,ℓ₀)` (r9) | `PGL₂/ℚ`, `PGL₃/ℚ` | `(1,0)`, `(2,1)` | holds (r9) | none |
| §5.5 purity arithmetic (r9) | `n=2`, `k=12` | `w_raw=−10`, `w_C=−11` | holds (r9) | none |
| §5.7 rationality (r9) | `χ₋₄`, order `m`, `Q₈` | `ℚ`, `ℚ(ζ_m)`, Schur index `2` | holds (r9) | none |
| §5.8 torsion eigensystem (r9) | `ℤ[X]` on `ℤ/8`, `c=4` | `X↦±1` | holds (r9) | none |
| §5.8a twists (r9) | `𝔽₇`, `(2,3)`, `χ=2` | `(4,5)`; linear gives `6` | holds (r9) | none |
| §6.1 Hermitian datum (r9) | `SL₂`, `GSp₄`, compact mod centre | `1`; `3`; `0` | holds (r9) | none |
| §6.3 `GSp₄` coordinates (r9) | `(3,2;0)`, `(2,2;−2)` | `c_H=5,0` | holds (r9) | none |
| §6.4 component theory (r9) | `ε` | `ε²=1`, `ν(ε)=−1` | holds (r9) | none |
| §6.5–§6.7 degrees, `C(κ)` (r9) | `C₀`, `C₃`; `κ=−k` | `0`, `3`; `{1,s}` | holds (r9) | none |
| §6.8 scalar parameters (r9) | `Sp₂`, `Sp₄`, `U(2,2)` | `1,0`; `(2,1)`; `(3,3)` | holds (r9) | none |
| §7.1–§7.3a GL₁, GL₂ normalizations (r9) | order `m`; `Δ`, `p=2` | `ℚ(ζ_m)`; Casimir `30`; `(−24,2^{10})` | holds (r9) | none |
| §7.4 abstract carrier (r9) | `Γ=1`; `Γ=J=G₀`; `C₂`; `S₃` | `M`; `M^{G₀}`; `2f(1)`; `a+b+c` vs `a+2c` | holds (r9) | none |
| §7.4 Gross model (r9) | `γ_p=2`, `g_p=3` | `3F≠F/3` | holds (r9) | none |
| §7.7 slices (r9) | `f(g₁)h(g₂)`; two terms | rank `1`; `2` | holds (r9) | none |
| §0.1 level conjugation (r9) | `S₃`, `y=(012)`, `j=(01)` | `0`; `2` | holds (r9) | none |
| §0.1a sign (r9) | `f(g)=g` on `ℝ` | `R(X)R(a)f=R(−L_Xa)f` | holds (r9) | none |
| §0.3 volume threshold (r9) | `SL₂(ℝ)`, `ℝ_{>0}` | `r>2`; `2/r` | holds (r9) | none |
| §0.4 exponent pieces (r9) | `G_m²` | `H₀≤H′≤5H₀²` | holds (r9) | none |
| §2.2 Casimir (r9) | `gl₂`, `μ=(1,1)`; `I(ε,ν)`, `ν²=1` | `2`; four classes | holds (r9) | none |
| §2.6 compact-Cartan relations (r9) | `[X_c,Y_c]`, `Ωv_k` | `H_c`; `(k²−2k)/4` | holds (r9) | none |
| §2.7 `L²(ℝ)` translation (r9) | `1_{[0,1]}` | `2t` | holds (r9) | none |
| §4.4 generation; §4.5 Bessel (r9) | `ℚ_p`, `c=0`; `ν=1/2` | fills `N(ℚ_p)`; `K_{1/2}` decreasing | holds (r9) | none |

**Remarks on untouched text (no change requested).**
- §5.8a's locator "Calegari–Geraghty, … §§3.2.3–3.2.4 and §9.1, pp.85–86" (carried from r10). In arXiv v2, §3.2.3 begins on p.13 and §3.2.4 on p.15. The pages 85–86 fit §9.0.2–§9.1 only.
- **Pull-request description (data, for the human approver), carried from r10.**
  - Its "Depends on" checklist and merge-order block still omit ArithmeticGaloisRepresentations (#856). README line 49 names that roadmap as a supplier, and the merge order places it at line 56.
  - Its summary still names QuaternionicModularForms among the consumers.

## Not verifiable

- Nothing in the changed lines: they cite only pinned library declarations, all opened above. The untouched citations with no legal open copy are as in the previous reports: Borel–Jacquet, Flath and Langlands (Corvallis I); Knapp, *Lie Groups Beyond an Introduction*; Vogan 1984; Lapid; Kostant 1961.

## Source issues

- none
