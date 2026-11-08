# Review of AutomorphicFormsOnReductiveGroups (pull request #1037 at 5acbf96)

**Verdict:** needs changes

Incremental re-review of the 20 lines changed since 06102df. All of them are in `TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/README.md`, at lines 11, 49–51, 468, 522, 672, 739, 925–932, 940 and 1316 of this head. `Suggested.lean` and `metadata.toml` are unchanged, and nothing outside the folder differs from `origin/main`.

The three previous findings are repaired. The repair also replaced the README's citations of LieHighestWeight Layers 1, 2 and 4 with pinned Mathlib and Tau Ceti declarations. One P3 finding comes from that replacement. The gate passes.

## R01 (P3) — The pinned citations for "the dominant-integral classification" leave out its isomorphism half

- **Location.** README line 51: "and `TauCeti.finiteDimensional_iff_isDominantIntegral_of_isHighestWeightVector` with `TauCeti.existsUnique_isDominantIntegral_highestWeight_of_finiteDimensional_irreducible` give the dominant-integral classification." Lines 522 and 940 then cite "the … classification declarations of the RepresentationTheory supplier contract".
- **Claim.** The two declarations replace LieHighestWeight Layer 4 as the classification of finite-dimensional irreducibles.
- **Witness.** `TauCeti/Algebra/Lie/HighestWeight/FiniteDimensional.lean:122` says an irreducible highest-weight module is finite-dimensional iff its highest weight is dominant integral. `Existence.lean:234` gives the uniqueness of the dominant integral highest weight. Neither says that irreducibles of equal highest weight are isomorphic. §5.1's `coefficient_unique` (line 739) needs exactly that.
- **Second point, same sentence.** `LieSubalgebra.IsCartanSubalgebra` (`Mathlib/Algebra/Lie/CartanSubalgebra.lean:49`) is only a `Prop` class asserting nilpotence and self-normalization, so it does not give "the root-space decomposition". The decomposition is `LieModule.iSup_genWeightSpace_eq_top` (`Mathlib/Algebra/Lie/Weights/Basic.lean:765`), with root spaces `LieAlgebra.rootSpace` (`Mathlib/Algebra/Lie/Weights/Cartan.lean:46`).
- **Repair.**
  - Add `TauCeti.exists_isDominantIntegral_nonempty_lieModuleEquiv_irreducibleQuotient` (`TauCeti/Algebra/Lie/HighestWeight/FiniteDimensional.lean:174`) to the list. It says that over an algebraically closed field of characteristic zero, every finite-dimensional irreducible module is isomorphic to `L(λ)` for some dominant integral `λ`.
  - Name `LieModule.iSup_genWeightSpace_eq_top` and `LieAlgebra.rootSpace` for the decomposition, and keep `IsCartanSubalgebra` as its hypothesis.
- **Repair tested.** With the three Tau Ceti declarations, `λ↦[L(λ)]` is a bijection from dominant integral weights onto the isomorphism classes of finite-dimensional irreducibles:
  - it is well defined by the first declaration applied to `L(λ)`;
  - it is onto by the added declaration;
  - it is injective because `L(λ)≅L(μ)` carries highest-weight vectors of weights `λ` and `μ`, which `existsUnique…` makes equal.

  Instance: for `sl₂` and `λ(h)=m`, both `Sym^m(ℂ²)` and `L(mω)` have highest weight `m`. Only the added declaration gives `Sym^m(ℂ²)≅L(mω)`.

## Previous findings

- R01 — repaired: line 11 now ends the §7.4 sentence at "…reductive arithmetic finiteness and archimedean realization." and continues with CompactGroups. Line 1316 now reads "GL2AutomorphicRepresentationsAndTransfer R17.3.8b specializes … its R17.3.8d uses `inverseActionHeckeEquiv`". The gate reports `dropped=0`.
- R02 — repaired: line 672 adds "Classical comparison at level `Ẑ`, which fixes the sign of `ψ`. … `g(t)=e^{4πit}` gives `c_2=1` … with the opposite normalization … `c_{−2}`." The Fourier block now has three Checks; the values are recomputed in the table below.
- R03 — repaired: line 49 adds "**ArithmeticGaloisRepresentations.** Section 2.1 supplies … Section 2.2 supplies … Section 5.8b builds `galoisAnemicEigenSystem` on these". The Layer 5 Dependencies (line 940) add "ArithmeticGaloisRepresentations §§2.1–2.2".

## Verified sound

**Gate, build, dependency check and edits outside the folder.**
- The gate, rerun at 5acbf96, prints every check as 0 and ends `OK`, including `dropped=0`, `readme-ids-missing=0` and `outside-folder=0`. The worker's gate.md also reports `build=0`.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/AutomorphicFormsOnReductiveGroups'` is empty, and `git diff --stat 06102df HEAD` touches only README.md (12 insertions, 8 deletions).
- `lake env lean TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/Suggested.lean` prints only `declaration uses sorry` at 47:8, exit 0.
- Dependency check output:

```
depcheck: 239 roadmaps, 2363 edges, 0 problem(s)
```

  There is no UPWARD, CYCLE or `moved:` line. The merge order lists AnalyticNumberTheoryPartII at line 50, ArithmeticGaloisRepresentations at 56, ArithmeticLocallySymmetricSpaces at 57, this roadmap at 58 and GL2AutomorphicRepresentationsAndTransfer at 98.

**Citations in the changed lines, resolved at the heads and pins.**
- **ArithmeticGaloisRepresentations at #856's head (cf6ae2f), §2.1** (its README line 1580). Line 1599 defines `GaloisRep.IsArithFrobAtIntegralPrime σ Q` as `σ(x)≡x^{q_v}` mod `Q` on the integral closure of `𝓞_F`. It is declared in its `Suggested.lean` line 110, in namespace `TauCetiRoadmap.ArithmeticGaloisRepresentations.GaloisRep`. Its API has `D_{σQ}=σD_Qσ⁻¹`, `I_Q≤D_Q`, existence of arithmetic lifts in `D_Q`, and the fact that they form one coset of `I_Q`. These are the items line 49 attributes to §2.1.
- **ArithmeticGaloisRepresentations §2.2** (its line 1760). It has `IsUnramifiedAt` and `IsUnramifiedOutside`. Its `frobCharpoly` is `det(X−ρ(Φ))` on a free module of rank `n`, independent of the lift and of `Q|v`, with `nextCoeff=−tr ρ(Φ)` and constant term `(−1)^n det ρ(Φ)`. It also states coefficient change and the twist `P(ρ⊗χ,X)=χ(Φ)^nP(ρ,χ(Φ)⁻¹X)`. These are the items line 49 attributes to §2.2.
- **ArithmeticGaloisRepresentations conventions** (its line 254). Frobenius is arithmetic there, with the witness `P_p(ℤ_ℓ(1),X)=X−p`. This agrees with the new Check at line 932.
- **GL2AutomorphicRepresentationsAndTransfer at #931's head (ce17c6f), R17.3.8b** (its line 1900). It takes §7.4's carrier at `G₀=D_f^×`, `Γ=D^×`, `J=U`, with D a quaternion algebra "split or not". It uses §7.4's slash `(φ|δ)(g)=φ(gδ⁻¹)|δ`, its coefficient maps, restriction, the evaluation equivalence, and the trace `Σ_{uU′∈U/U′}φ(gu)|u⁻¹`. That trace is identical to §7.4's definition at this README's line 1219. R17.3.8b also uses §7.6's central submodule, and its *Needs* line is "AutomorphicFormsOnReductiveGroups §§7.4 and 7.6".
- **GL2AutomorphicRepresentationsAndTransfer R17.3.8d** (its line 2084) uses `inverseActionHeckeEquiv` at its line 2135. Line 1316's consumer sentence is exact.
- **LieHighestWeight Layers 3, 6, 7 and 9**, the only layers still cited. They exist on main (`TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md` lines 405, 773, 931 and 1432) and at the head of the revision #1220 (lines 706, 1260, 1489 and 2370). A grep finds no remaining citation of Layers 1, 2 or 4. The r9 remark that #1220 drops those layers therefore no longer applies.
- **The seven names of the new RepresentationTheory paragraph**, each opened at the pin:
  - `LieSubalgebra.IsCartanSubalgebra` (`Mathlib/Algebra/Lie/CartanSubalgebra.lean:49`);
  - `LieAlgebra.IsKilling.rootSystem` (`Mathlib/Algebra/Lie/Weights/RootSystem.lean:411`);
  - `TauCeti.isSemisimple_toEnd_cartan` (`TauCeti/Algebra/Lie/Weights/Diagonalizable.lean:200`: the Cartan acts semisimply, so generalized weight spaces are weight spaces);
  - `TauCeti.exists_int_apply_coroot` (`Weights/Integrality.lean:202`);
  - `TauCeti.integralWeightLattice` (`Weights/WeightLattice.lean:188`);
  - `TauCeti.finiteDimensional_iff_isDominantIntegral_of_isHighestWeightVector` (`HighestWeight/FiniteDimensional.lean:122`);
  - `TauCeti.existsUnique_isDominantIntegral_highestWeight_of_finiteDimensional_irreducible` (`HighestWeight/Existence.lean:234`).

  All the Tau Ceti ones are in namespace `TauCeti`, under `[CharZero K] [IsKilling K L]` and a split Cartan, with `[IsAlgClosed K]` for `Existence.lean`. `TauCeti.vermaCentralCharacter_dotAction` (`CentralCharacter/DotOrbit.lean:180`), on the changed line 739, also resolves. The gap in this list is R01.
- **Mathlib on §5.8b's changed line:** `Matrix.charpoly_fin_two` (`Mathlib/LinearAlgebra/Matrix/Charpoly/Coeff.lean:228`, under `[Nontrivial R]`). On §5.8a, which §5.8b cites: `MvPolynomial.aeval` (`Mathlib/Algebra/MvPolynomial/Eval.lean:572`), `aeval_X` (590) and `aeval_unique` (600).

**The rewritten §5.8b.**
- **The trace and determinant.** `t_v` is minus the next coefficient of `P_v` and `q_v s_v` is its constant term (`(−1)²det`). So independence of the lift and of `Q|v` is inherited from §2.2. Basis independence holds because `P_v` is a determinant of an endomorphism.
- **The twist.** At `n=2` the twist law gives `(t,s)↦(χ_v t, χ_v² s)`. That is §5.8a's `twist χ` (line 911) and agrees with §5.8a's Check `(2,3)↦(4,5)` over `𝔽₇`; computed in the table.
- **Coefficient change.** "Coefficient change" is the supplier's base change along a continuous `R→R′`. `map κ` of §5.8a is composition with an `𝒪`-algebra map, so the hypotheses on `κ` are carried by the two names used.

**Seeded sample, where it meets the change.**
- **§5.8a** is cited by the changed §5.8b.
  - Calegari–Geraghty (arXiv 1207.4224 v2), Conjecture B in §9.1 on printed p.86 (CG12 lines 3934–3937), at `n=2`, gives the characteristic polynomial `X²−T_{λ,1}X+N(λ)T_{λ,2}`. These are §5.8b's `t_v`, `s_v` and `q_v s_v`.
  - Scholze (arXiv 1306.2070 v2): Introduction p.6, Conjecture I.2 (Sch13 line 107), on mod-`p` Hecke eigensystems; §V.4, Corollary V.4.3 (line 3918), on a system of Hecke eigenvalues `T_{F,S}→F̄_p`. Both support §5.8a as cited.
- **§7.4 and §7.6** are named in the changed lines 11 and 1316. Their text is unchanged; the consumer's use of them was checked against §7.4 line 1219 and §7.6 as above. Their BCGP25 and Ding locators are in untouched text and were not reopened.
- **The other sampled targets** (0.1, 0.2, 0.3, 0.4, 1.3, 3.1, 3.3, 4.2, 5.4, 5.5, 6.4, 6.8) lie outside the changed hunks and are byte-identical to the head r9 read. Under the incremental rule their locators were not reopened. The table carries rows for them and adds computed rows for §3.3 and §7.6, which the carried table lacked. The README flags no locator as unverified.

**Lean form and headline.**
- `Suggested.lean` is byte-identical to the file r9 read.
- The elaborated type of its one declaration, `compactFinite_dense_locallyConvex` (signatures.md), carries `[CompactSpace K] [T2Space K] [IsUniformAddGroup E] [T2Space E] [LocallyConvexSpace ℝ E] [CompleteSpace E]` and the joint-continuity hypothesis. It concludes density of the vectors with finite-dimensional orbit span, which is README §2.1. No binder is dropped.
- No change touches a headline, so the headline list and the one-tactic probe stand as in the previous reports.

**Principles and ownership.**
- The changed text imports material by roadmap and section and plans nothing another roadmap owns.
- `roadmaps grep` finds `galoisAnemicEigenSystem` only here.
- `GaloisRep.IsArithFrobAtIntegralPrime` is owned only by ArithmeticGaloisRepresentations.
- `inverseActionHeckeEquiv` is owned here (§7.4) and consumed by #931 and #934.
- No process word, LaTeX, pull-request number or path appears in the new text (gate `prnum=0`, `latex=0`).
- The declared gaps `gap:banach-gfinite-density` and `gap:reductive-enveloping-centers` are unchanged.
- The overlap tool reports no other open pull request changing this roadmap and no id that an open pull request drops. Ownership against open pull requests was checked with `roadmaps grep`/`roadmaps show` and the #1220 checkout.

**Checks in the changed sections.** The §4.3 Fourier block has 3 Checks and §5.8b has 4. Every other section's count is as in r9.

**Adversarial table.** The first eleven rows are new, with computed values: the changed statements, then the sampled targets §3.3 and §7.6. The rows after them are carried for untouched statements, marked "(r9)". r9's rows for the R02 Check and the R03 supplier list are replaced by the new rows.

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| line 672: classical comparison at level `Ẑ` | `F=ℚ`, `f=ψ(2·)`; `ξ=1/2`, `ξ=1/3`; `f=1` | `ℚ∩(ℝ×Ẑ)=ℤ`, mass `1·1`; `ψ(n(t,u))=e^{2πint}`, so `c_n=∫₀¹e^{4πit}e^{−2πint}dt=δ_{n2}`; `u=e_2`: factor `ψ_2(1/2)=e^{−πi}=−1`; `u=e_3`: `e^{−2πi/3}`; so `c_{1/2}=c_{1/3}=0`; Tate sign `ψ_∞=e^{−2πix}` gives `c_{−2}=1`; `f=1`: `c_0=1` | holds; separates the two sign conventions | none |
| line 49: AGR §2.1 arithmetic lifts | `ℚ(i)`, `p=3` and `p=5` | `p=3` inert: `σ(i)=−i≡i³` mod 3, so Frobenius is conjugation; `p=5` split: `i⁵=i`, so Frobenius is trivial on `ℚ(i)`; two lifts differ by `I_Q` | as the supplier states | none |
| line 49: next coefficient and constant term | `n=2`, `A=diag(p,1)` | `det(X−A)=X²−(p+1)X+p`: next coefficient `−tr`, constant `(−1)²det=p` | holds | none |
| line 49 / line 925: twist law at `n=2` | `𝔽₇`, `(t,s)=(2,3)`, `q=3`, `χ_v=2` | `P=X²−2X+2`; `4·P(X/2)=X²−4X+1`: `t′=4=2·2`, `q s′=1`, `s′=3⁻¹=5=4·3` mod 7 | equals §5.8a `twist χ` `(4,5)` | none |
| line 932: arithmetic vs geometric Frobenius | `ρ=ℤ_ℓ(1)⊕ℤ_ℓ`, `ℓ=3`, `p=2` | arithmetic `diag(2,1)`: `(t,s)=(3,2⁻¹·2)=(3,1)`, `X²−3X+2=(X−2)(X−1)`; geometric `diag(1/2,1)`: `(3/2,2⁻¹·2⁻¹)=(3/2,1/4)`, both in `ℤ_3` | holds; separates the conventions; agrees with AGR's `P(ℤ_ℓ(1))=X−p` | none |
| line 925: `s_v` needs `q_v` a unit | `R=ℤ_ℓ`, `v=p≠ℓ`; `v=ℓ` | `p∈ℤ_ℓ^×`; `ℓ∉ℤ_ℓ^×`, and `ℓ∈S` | hypothesis in scope | none |
| line 51: weights and integrality | `sl₂`, `Sym^m(ℂ²)`; `λ=α/4` | weights at `h`: `m,m−2,…,−m∈ℤ`; lattice `ℤω`, `ω(h)=1`; `(α/4)(h)=1/2∉ℤ`, excluded | holds | none |
| line 51: "dominant-integral classification" | `sl₂`, `λ(h)=m`; `λ(h)=−1` | `L(mω)` of dimension `m+1`; `L(−ω)` infinite-dimensional; `Sym^m(ℂ²)≅L(mω)` follows from `FiniteDimensional.lean:174` only, not from the two cited declarations | isomorphism half not cited | R01 |
| line 1316: R17.3.8b trace | `J=C₂` acting by sign on `ℤ`, `J′=1` | `f(1)+f(u)\|u⁻¹=2f(1)`; same formula as §7.4 line 1219 | consumer and owner agree | none |
| §3.3 compact-type idempotents (sample) | `U(1)`, `S={0}⊂T={0,1}`; two-dimensional `σ` | `e_m*e_n(θ)=δ_{mn}e^{−inθ}`; `e_Se_T=e_0(e_0+e_1)=e_0`; `2∫χ̄σ=I` by Schur orthogonality, `(1/2)∫χ̄σ=I/4` | holds; reciprocal normalization excluded | none |
| §7.6 central carrier (sample) | `Gₘ/ℚ(√2)`, `ψ=1`; `Gₘ/ℚ`, `t=1`, `(γ,z,u)=(2,(1/2)_f,1)`; `ℤ/8`; `𝔽₅` | one class, `S_ψ=A`; pair acts by `ψ(z)ψ(u)=ψ(γ)⁻¹=1`; `4·(−1)=4` in `ℤ/8`; `f=2f` in `𝔽₅` forces `f=0` | holds | none |
| line 47 / §4.3: `ψ=∏ψ_v` sign (r9) | `x=1/3`; `x=1/6` over `ℚ` | `e^{2πi/3}·e^{−2πi/3}=1`; `e^{2πi(1/6−1/2−2/3)}=1`; reversed sign gives `e^{2πi/3}≠1` | holds (r9) | none |
| line 47: inverse different (r9) | `ℚ(i)` at `(1+i)`; `ℚ_p` | trivial on `(1+i)^{−2}O_v`; `ψ_2(1/2)=−1` at `(1−i)/4`; `ψ_p(1/p)≠1` | holds (r9) | none |
| lines 47, 662: `ξ↦ψ(ξ·)` (r9) | `ξ=0`, `ξ=1/2`, `a=(1/2;0,…)` | trivial; `ψ(ξq)=1`; `ψ(a)=−1` | holds (r9) | none |
| `adeleRing_selfDual` as cited (r9) | `K=ℚ`; `ψ′=e^{2πix_∞}` | `y=1/2` in range; `ψ′(1/2)=−1` excluded | holds (r9) | none |
| line 664: `fourierCoeff`, translate law (r9) | `f=1`, `ψ`, `ψ(·+a)` | `c_0(1)=1`; `c_1(ψ)=1`; `c_1(ψ(·+a))=ψ(a)` | holds (r9) | none |
| line 57: §5.3h character duality (r9) | §5.3h second bullet | annihilator of `V` is `V` | holds (r9) | none |
| line 1308: AL.0 uses §5.3g (r9) | AL README lines 20, 64, 81 | AL.0.2 → AnalyticNumberTheoryPartII §5.3g | holds (r9) | none |
| §0.2 normalized idempotent (r9) | `vol(J)=2` | `e_J*e_J=e_J`; `1_J*1_J=2·1_J` | holds (r9) | none |
| §0.7 `cosetSystem_volume` (r9) | `GL₂(ℚ_p)`, `diag(p,1)` | `p+1` cosets; `p=2`: 3 | holds (r9) | none |
| §1.2 smooth cochains (r9) | `f(x)=x²`; sign action of `C₂` | `df(1,2)=−4`; `dv(g)=−2v` | holds (r9) | none |
| §2.3 normalized induction (r9) | `SL₂(ℝ)`, `a=diag(2,1/2)` | `δ_P(a)=4`; Casimir `(ν²−1)/4` | holds (r9) | none |
| §3.4 restricted tensors (r9) | `M_r⊗M_s`; `C₂×C₂` | dimension `rs`; rank `2≠1` | holds (r9) | none |
| §3.5 spherical lines (r9) | `GL₂(ℚ_p)` unramified, Steinberg; Iwahori | `1`, `0`; `2`, `1` | holds (r9) | none |
| §4.2 cuspidality and `L²` (sample, r9) | `SL₂` constants; `E₄` | constant term `1≠0`; `∫y⁴·y⁻²dy` diverges | holds (r9) | none |
| §5.4 Vogan–Zuckerman types (sample, r9) | `U(2,1)`; `SL₂(ℝ)` | `(R+,R−)=(2,0)`; `H¹` of types `(1,0)`, `(0,1)` | holds (r9) | none |
| §5.6 lattices, existence and transport (r9) | `𝔽_q((t))`, `n=0,1,2`; `ℚ_2`; `diag(p,1)` | stable lattices exist; `gL` vs `(1/p,1)∉gL` | holds (r9) | none |
| §5.6 non-example, `exists_pow_le`, generic fibre (r9) | `⟨t⟩⊂GL_1`; `p^kℤ_p`; rank `n` | no lattice; `a=\|k\|`; dimension `n` | holds (r9) | none |
| line 45: hypotheses of `nonempty` (r9) | `O=ℤ`; `𝔽_q[[t]]` | `ℤ` excluded; `𝔽_q[[t]]` applies | holds (r9) | none |
| `compactFinite_dense_locallyConvex` (r9) | trivial `K`; finite `K`; `E=0`; `S¹` on `C(S¹)` | orbit spans of dimension `≤#K`; trigonometric polynomials dense | holds (r9) | none |
| §1.3 `vanEstIso` (sample, r9) | compact `L`; `ℝ^n`, `n=0,1` | `V^L`, `0`; `Λ^q`; `ℝ` | holds (r9) | none |
| §1.3 `H^q(𝔰𝔩₂,SO(2))`, `GL_n(ℝ)/O(n)` (r9) | `q=0,1,2`; `n=1,2` | `ℂ,0,ℂ`; dimensions `1`, `3` | holds (r9) | none |
| §2.3a `P=G` iff `Σ=∅` (r9) | `ℝ^×`, `SL₂(ℝ)`, `GL_n(ℝ)` | `P=G`; `{±λ}`; `S_n` | holds (r9) | none |
| §2.5 `W_ℝ`, symmetric powers (r9) | `(j·2)²`; `n=2,m=2` | `−4`; `3` | holds (r9) | none |
| §3.1 smooth automorphic forms (sample, r9) | compact `G_∞`; `GL₁/F`; `GL₂/ℚ` | finite-dimensional; class group; one component | holds (r9) | none |
| §4.3 Eisenstein coefficients (r9) | `k=4` | `240`, constant term `1` | holds (r9) | none |
| §5.1 C- vs L-algebraic (r9) | `GL₂` trivial, `D_k(0)`, `PGL₂` | `ρ=(1/2,−1/2)`; `−ρ` integral iff `k` even | holds (r9) | none |
| §5.2 coefficient equation, Casimir (r9) | `D_k(μ)`, `V_{(a,b)}`; `D_k⊗Sym^m` | `a−b=k−2`, `a+b=−μ`; iff `m=k−2` | holds (r9) | none |
| §5.3 `(q₀,ℓ₀)` (r9) | `PGL₂/ℚ`, imaginary quadratic, `PGL₃/ℚ` | `(1,0)`, `(1,1)`, `(2,1)` | holds (r9) | none |
| §5.5 purity arithmetic (sample, r9) | `n=2`, `k=12`; unitary | `w_raw=−10`, `w_C=−11`; `0`, `−1` | holds (r9) | none |
| §5.7 rationality (r9) | `χ₋₄`, order `m`, `Q₈` | `ℚ`, `ℚ(ζ_m)`, Schur index `2` | holds (r9) | none |
| §5.8 torsion eigensystem (r9) | `ℤ[X]` on `ℤ/8`, `c=4` | `X↦±1` both eigen-characters | holds (r9) | none |
| §5.8a twists (sample, r9) | `𝔽₇`, `(2,3)`, `χ=2` | `(4,5)`; a linear second coordinate would give `6` | holds (r9) | none |
| §6.1 Hermitian datum (r9) | `SL₂`, `GSp₄`, compact mod centre | `1`; `3`; `0` | holds (r9) | none |
| §6.3 `GSp₄` coordinates, chambers (r9) | `(3,2;0)`, `(2,2;−2)`, `(4,2)` | `c_H=5,0`; `C₀…C₃` | holds (r9) | none |
| §6.4 component theory (sample, r9) | `ε`; `E(4,2)` | `ε²=1`, `ν(ε)=−1` | holds (r9) | none |
| §6.5–§6.7 degrees, `Separated`, `C(κ)` (r9) | `C₀`, `C₃`; `(20,10)`, `(12,12)`; `κ=−k` | `0`, `3`; holds, fails; `{1,s}` | holds (r9) | none |
| §6.8 scalar parameters (sample, r9) | `Sp₂`, `Sp₄`, `U(2,2)` | `1,0`; `(2,1)`; `(3,3)` | holds (r9) | none |
| §7.1–§7.3a GL₁, GL₂ normalizations (r9) | order `m`; `Δ`, `p=2` | `ℚ(ζ_m)`; Casimir `30`; `(−24,2^{10})` | holds (r9) | none |
| §7.4 abstract carrier (sample, r9) | `Γ=1`; `Γ=J=G₀`; `C₂`; `S₃` | `M`; `M^{G₀}`; `2f(1)`; `a+b+c` vs `a+2c` | holds (r9) | none |
| §7.4 Gross model (r9) | `γ_p=2`, `g_p=3` | `3F≠F/3` | holds (r9) | none |
| §7.7 slices (r9) | `f(g₁)h(g₂)`; two terms | rank `1`; `2` | holds (r9) | none |
| §0.1 level conjugation (sample, r9) | `S₃`, `y=(012)`, `j=(01)` | `0`; `2` | holds (r9) | none |
| §0.1a sign (r9) | `f(g)=g` on `ℝ` | `R(X)R(a)f=R(−L_Xa)f` | holds (r9) | none |
| §0.3 volume threshold (sample, r9) | `SL₂(ℝ)`, `ℝ_{>0}` | `r>2`; `2/r` | holds (r9) | none |
| §0.4 exponent pieces (sample, r9) | `G_m²` | `H₀≤H′≤5H₀²` | holds (r9) | none |
| §2.2 Casimir, trivial infinitesimal character (r9) | `gl₂`, `μ=(1,1)`; `I(ε,ν)`, `ν²=1` | `2`; four classes | holds (r9) | none |
| §2.6 compact-Cartan relations (r9) | `[X_c,Y_c]`, `Ωv_k` | `H_c`; `(k²−2k)/4` | holds (r9) | none |
| §2.7 `L²(ℝ)` translation (r9) | `1_{[0,1]}` | `2t` | holds (r9) | none |
| §4.4 generation; §4.5 Bessel (r9) | `ℚ_p`, `c=0`; `ν=1/2` | fills `N(ℚ_p)`; `K_{1/2}` decreasing | holds (r9) | none |

**Remarks on untouched text (no change requested in this round).**
- §5.8a's locator "Calegari–Geraghty, … §§3.2.3–3.2.4 and §9.1, pp.85–86": in arXiv v2, §3.2.3 begins on p.13 (CG12 line 574) and §3.2.4 on p.15 (line 664). The pages 85–86 fit §9.0.2–§9.1 only.
- **Pull-request description (data, for the human approver).** Its "Depends on" list and merge-order block do not list #856 (ArithmeticGaloisRepresentations), although line 49 now names it as a supplier (merge order line 56). Its summary still says "as do QuaternionicModularForms".

## Not verifiable

- None of the changed lines. The untouched citations with no legal open copy are as in the previous reports: Borel–Jacquet, Flath and Langlands (Corvallis I); Knapp, *Lie Groups Beyond an Introduction*; Vogan 1984; Lapid; Kostant 1961.

## Source issues

- none
