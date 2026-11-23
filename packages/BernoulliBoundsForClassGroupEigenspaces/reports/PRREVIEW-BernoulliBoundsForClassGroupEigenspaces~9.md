# Review of BernoulliBoundsForClassGroupEigenspaces (pull request #2896 at 0d7bb18)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/BernoulliBoundsForClassGroupEigenspaces/`
**Verdict:** accepted

**Summary.** Accepted: no findings. The new part of 10.1, the Euler system of Jacobi sums with its derivative classes (c1)–(c5) and the rewritten route of (a), agrees clause by clause with the formal proof's declarations, and its identities (the distribution relation, the Jacobi-sum exponents, the Bernoulli congruence, the unit `ε₀`) were recomputed. There is one small correction (the description omits the two suppliers and the section the last change added) and one format note, neither blocking. The scope and licence questions below remain for the human reviewers.

## C01 — The description's list of dependencies omits two suppliers that 10.1 (c) now uses, and does not mention 10.1 (c)

A reader of the description cannot tell that the roadmap now depends on two further roadmaps on main. The head's supplier contracts have "From TauCetiRoadmap.EulerSystemsAndKolyvaginSystems" (§3.1, the derivative operator and `(σ − 1)D_σ = n − N_Γ`, for (c3)) and "From TauCetiRoadmap.ClassicalArithmeticCompletion" (§1.55, Stickelberger's relation, for (c1)), and cite CyclotomicClassGroupsAndStickelberger §2.5 beside §3.1 (README lines 1018–1032); the description's list under "Dependencies" has neither roadmap and gives only §3.1 of the third. Its second paragraph also describes Layer 10 without the Euler system that the README's scope paragraph now owns (line 936).

Text that would be right: add to the list "from EulerSystemsAndKolyvaginSystems §3.1, the derivative operator of a cyclic group and its identity; from ClassicalArithmeticCompletion §1.55, Stickelberger's relation; from CyclotomicClassGroupsAndStickelberger §§2.5 and 3.1, a prime of degree one in every ideal class and generalized Bernoulli numbers", and a clause in the second paragraph such as "the Bernoulli bound is proved through the Euler system of Jacobi sums and its derivative classes, stated in 10.1 (c)".

## N01 — In 10.1 the credits write the formal proof's paths in full although the Conventions abbreviate them

The paragraph of credits after 10.1 (c5) (lines 553–605) writes `Development/AutomorphicArithmetic/AutomorphicVarieties/PrimitiveFrobeniusFixed/…` some forty times, while the Conventions introduce `AV/` for that directory and the first lines of the same paragraph use it. Using `AV/PrimitiveFrobeniusFixed/…` throughout, or naming the directory once, would shorten the paragraph by half.

## Questions for the author

- 10.1 (c) says the classes `κ_Q` "are the derivative classes of Kolyvagin's method for Euler systems, here for the system of Jacobi sums", and cites only the formal proof. Is there a published statement of this Euler system (of Gauss or Jacobi sums, with the norm relation (c2) (i) and the congruence (c2) (ii)) that could be cited with a locator beside it? No such text is among the roadmap's recorded sources, so none was read.

## Previous findings

The previous review (of `37ae632`) accepted the roadmap with no finding, no small correction and no format note; nothing was left to repair. The change since then is confined to Layer 10 (the clause (c) of 10.1, its credits and route, the Dependencies, the scope paragraph and four supplier contracts).

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 6.17 (b), real-place quotient | `ℓ = 2`, `e` even and odd | `H¹(ℝ, ℚ₂/ℤ₂(−e))`: `ℤ/2` for `e` even (trivial action), `0` for `e` odd (`W/2W`) | agrees | none |
| 6.17 (d), cyclotomic layer | degree `ℓ^m`, `κ = 1 + ℓ^c u` | `#H⁰(F′) = ℓ^{c+m+v(e)}`; norm `(κ^{−eℓ^m} − 1)/(κ^{−e} − 1)` has valuation `m`; image order `ℓ^{c+v(e)} = #H⁰(F)` | `Ĥ⁰ = 0` | none |
| 6.17 Checks | `F = ℚ`, `ℓ` odd | global and local `H⁰` both of order `ℓ^{1+v(e)}` if `(ℓ−1) ∣ e`, else trivial; so `length Ш¹ = length H²` | agrees | none |
| 6.18 (b) Check and route | `F = ℚ`, `ψ = 1`; `Frob_p − 1` | `V_ℓ(1, e; {ℓ}) = length Ш¹(ℚ, ℓ, e)` by definition; `p^{−e}ψ(p)⁻¹ = 1` impossible for `e ≥ 1` | agrees | none |
| 9.1 | `{b}`; `{(2,0),(0,2)}`; `{(1,1),(1,−1)}` | orders `b`, `4`, `2`; bounds `b`, `4`, `4` | holds, sharp | none |
| 9.2 Check | point, `G = ℤ/2`, `m = 0, 1` | `H₀` torsion `1 ≤ 2`; `#H₁ = 2 ≤ 3·2² = 12`; finite-group bound `2² = 4` | holds | none |
| 9.3 (f), Check | `L = ℚ`, `N = 2`; `dim V` | stabilizer `12 ≤ 3⁴ = 81`; `M_N(𝒪_L/3)` has `3^{nN²}` elements; `dim V = r₁N(N+1)/2 + r₂N² ≤ nN²` | holds | none |
| 9.4 and its Lean form | `(L, N, m) = (ℚ,1,0), (ℚ,1,1), (ℚ,2,1)` | torsion orders `1, 2, 4`; left sides `0` (junk `log 0`), `−0.37`, `0.33`; right sides `c₂log 2`, `2c₂log 2`, `32c₂log 4` | holds for `c₂ ≥ 1` | none |
| 9.4, second form | `nN(m+1) = 1` and `≥ 2` | `nN ≤ (2∣d_L∣)^{nN}`, exponent `c₂(m+1)(nN)³N(1+nN)`; at `1`: `log 1 = 0 ≤ 2` | follows | none |
| 9.5 | `B = ℤ/ℓ^ν`, `ρ_j ≥ 1` | bound `(ℓ^ν)^{ρ_j}t_jt_{j−1} ≥ ℓ^ν = #B` | empty, as stated | none |
| 9.6 (b1) | `H_{2E}(C_q × C_q; ℤ/q)` | differentials `0, q, 0, …` vanish mod `q`; Künneth: `2E + 1` summands `ℤ/q` | free of rank `2E+1` | none |
| 9.7 | `L = ℚ(i)`, `ℓ = 2`; step (2) | `H² = 0`; `[L′:ℚ] ≥ φ(ℓ^{c′}) ≥ ℓ^{c′}/2` | holds | none |
| 9.8 (a), sources | Soulé 1999 Thm 2; BFEH §3.1 | both cite Arlettaz Theorem 1.5 for the kernel of the Hurewicz map having only small-prime torsion | consistent | none |
| 10.1 (a), Check | `e = 11`, `ℓ = 691`, `N = 4` | `4·30030·(−691/2730) = −30404 = −44·691`, `v₆₉₁ = 1`; `K₂₂(ℤ){691}` of length `1` | sharp | none |
| 10.1 (b) | constant | `N·4^{e+2}·N^{e+1}·4(e+1)!/(2π)^{e+1} = 16(2/π)^{e+1}N^{e+2}(e+1)!`; formal `bnd N (e+1) = 16N^{e+2}(e+1)!` | agrees | none |
| 10.1 (c1), Jacobi exponents | `M′ ∈ {3,5,7,8,12}`, all `b < M′`, all `t` | `#{1 ≤ j < b : ⟨t⟩ + ⟨jt⟩ < M′} = (b−1) − ⌊⟨t⟩b/M′⌋` in every case; so `J̄/J` has exponent `θ(t)` | agrees | none |
| 10.1 (c1), distribution relation | `M′ ≤ 15`, primes `q ≤ 13`, `q ∤ M′`, `b < q` | `Σ_{t′↦t} θ_{qM′,b}(t′) = θ_{M′,b}(t) − θ_{M′,b}(q⁻¹t)` in every case; formal `thDist` same hypotheses | agrees | none |
| 10.1 (c2) | `x_d = P(X_d)^{2T₀d}` | `P(ζ)^{2T₀qd} = P(ζ^{2T₀qd}) = 1` as `ζ^{2T₀qd} ∈ μ_M`; exponent `s·2T₀qd/(2T₀d) = q·s`; formal `sysOfLax`: `q * s d q` | agrees | none |
| 10.1 (c3) | `M`-th power of the quotient | `g(P(y))/P(g(y)) = gδ(y)/δg(y) = 1` on `ℚ(μ_{Td})`; `(τ_q−1)D_q = (q−1) − N_q` is `derBasic` | well defined | none |
| 10.1 (c4) | second formula | `k₁(t) = θ(tv) − uθ(t)`, `k₂(t) = k₁(tv) − uk₁(t) = θ(tv²) − 2uθ(tv) + u²θ(t)`; formal `hasOrdP`: `k(t·d) − a·k(t)` | agrees | none |
| 10.1 (c5) (iii) | `ε₀` | `Σ_tθ(tv)α(σ_t)⁻¹ ≡ α(δ)z`; total `2T₀(α(δ)² − 2uα(δ) + u²)z = 2T₀(α(δ) − u)²z`; unit as `χ_ℓ(δ) ≡ u` | agrees | none |
| 10.1, route of (a), congruence | `ℓ ∈ {3,5,7}`, ten moduli `T`, trivial and quadratic `χ`, `e ≤ 8`, all `b` | `2(e+1)P_{e+2}(b^eχ(b)Σθ t^eχ(t) − 2(χ(b)b^{e+1}−1)B_{e+1,χ}/(e+1))`: valuation `≥ h` in 2032 of 2032 cases; formal `dk (e+1) = 2(e+1)·primorial(e+2)` | holds | none |
| 10.1, route of (a), exceptional case | `ψ = 1`, `(ℓ−1) ∣ (e+1)` | `α − χ_ℓ = χ_ℓ(χ_ℓ^{−e−1} − 1)` never a unit; `B_{e+1}/(e+1)` has `ℓ` in denominator while `v(z) ≥ 0` | route separates it, as written | none |
| 10.1, route of (a), admissibility of `q` | `q ≡ 1 mod T`, `q ≢ 1 mod Tℓ`, `r` an `M`-th power mod `q` | `v_ℓ(q−1) = h`, so `(q−1)/M` prime to `ℓ` and the order of `r` divides it | admissible | none |
| 11.1 Checks | `q ≡ 3 mod 8`, `q′ ≡ 7 mod 16` in `ℚ(μ_{2^∞})` | index of `⟨q⟩` in `ℤ₂^×`: `2`; of `⟨q′⟩`: `4`; `4r₀ + 4·2[M] + 2·8[M] = 4(r₀ + 6[M])`; other order `4·4 + 2·4 = 24` | agrees | none |
| 12.1 Check | `p = 7`, `n = 2`, `χ = ω⁴` | `χ(2) ≡ 2`, `1 − 2χ(2) ≡ 4`; `χ⁻¹(2) ≡ 4`, `1 − 2χ⁻¹(2) ≡ 0`; `ω = ω⁴` on `⟨2⟩` | agrees | none |
| 13.1 | element with eigenvalues in the centre | reduced characteristic polynomial splits, so not irreducible, so central: `χ_p(τ)^{a−b} = 1` on open inertia, false for `a ≠ b` | route sound | none |
| 14.1 Check | `k = 2e + 1`, `r = e` | `1 ≤ e ≤ 2e`; `e ≠ e + 1/2` | non-central | none |
| C01 | description against supplier contracts | head: contracts for EulerSystemsAndKolyvaginSystems §3.1, ClassicalArithmeticCompletion §1.55, Cyclotomic… §2.5; description: none of the three | description behind | C01 |

- Source locators checked against the text: 11 (Soule1999 lines 53–54, 88, 141, 175–182, 227–241, 260–272, 343–350; BFEH2014 lines 25–31, 43–49, 123, 137–150); all support the statements as written.
- Formal proof: all 94 cited file paths exist at the first commit `40e56bab`; 31 statements of the Layer 10 credits opened and compared (`xEx`, `xUniq`, `xMul`, `xJac`, `thDist`, `laxEx`, `sysOfLax`, `xNormDiv`, `xCong`, `derBasic`, `derInv`, `kolEx`, `kolHom`, `kolUnr`, `kolStep`, `kolInit`, `hasOrdP`, `nuSysEx`, `nuIs`, `zCong`, `zEval`, `vChar`, `step`, `shaToShT`, `exc`, `shtNu`, `pick`, `chebQ`, `count`, `PsiBound`, `PrimeBound`) with the definitions `th`, `IsX`, `AdmP`, `admitted`, `AdmL`, `Lax`, `Sys`, `HasOrd`, `IsTau`, `der1`, `der`, `opP`, `IsKol`, `nu`, `IsNu`, `NuSys`, `zVal`, `Dat`, `Rec`, `den`, `bnd`, `dk`.
- Library declarations at the pin: `Nat.exists_prime_gt_modEq_one` (`Mathlib/NumberTheory/PrimesCongruentOne.lean:28`), `jacobiSum` (`Mathlib/NumberTheory/JacobiSum/Basic.lean:48`), `DirichletCharacter.generalizedBernoulli` (`TauCeti/NumberTheory/DirichletCharacter/GeneralizedBernoulli.lean:81`).
- Cross-roadmap citations resolved: ClassicalArithmeticCompletion §1.55, CyclotomicClassGroupsAndStickelberger §§2.5, 3.1, 3.4, 4.1, EulerSystemsAndKolyvaginSystems §3.1, ProfiniteCohomology §§5.4, 5.5, 6.2, 6.3, 7.2, 9.6, KatoEulerSystems §§4.1, 7.9, Chebotarev Layer 10 (all on main), HeckeIdealsAndTaylorWilesRelations §10.1 (a)–(f) (at its open head).
- Dependency check: `depcheck: 133 roadmaps, 1490 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed at this head. Elaboration of `Suggested.lean`: `declaration uses sorry` at line 78, the only message. Signature pass with `#check @log_log_card_torsion_groupHomology_GL_le`: every binder (`L`, `Field`, `NumberField`, `N`, `m`, `1 ≤ N`) is in the declaration's own signature; nothing changed. One-tactic probe on a scratch copy: `simp` makes no progress, `rfl` and `infer_instance` fail.
- Headline theorems: the Bernoulli bound (10.1), the torsion bound (9.4), the étale and K-group bounds (9.7, 9.8), the vanishing with the splitting criterion (14.1, 13.1). 9.4 is stated in Lean; the module docstring names the other four with the carriers each lacks. No padding.
- Changes outside the folder: the family index only, which is the pull request's own.

Overlap check: read RowTowerAndRallisIdentities, ThetaChainsAndFrobeniusPrimeSums, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties, ArithmeticKTheoryPartII and ModularIwasawaMainConjecturesPartII (open), KatoEulerSystems, ArithmeticKTheory and EulerSystemsCyclotomicMainConjecture (main), and for the new clause EulerSystemsAndKolyvaginSystems and CyclotomicClassGroupsAndStickelberger (main). The Euler system of Jacobi sums with its norm relation and congruence: this roadmap (no other states it). The derivative operator `D_σ`: EulerSystemsAndKolyvaginSystems §3.1, cited. Stickelberger's relation and prime representatives of ideal classes: ClassicalArithmeticCompletion §1.55 and CyclotomicClassGroupsAndStickelberger §2.5, cited. `Ш¹(F, ℓ, e)` and its total: this roadmap; Sha kernels with lattice coefficients: HeckeIdealsAndTaylorWilesRelations §10.1, cited; `Sha²_{i,ℓ}` and wild kernels: ArithmeticKTheory §6.9, cited; Kato's finiteness: KatoEulerSystems §7.9, cited.

Source independence: 14 passages compared with 3 sources (seven of Soule1999, four of BFEH2014, and the clauses (c1)–(c5) with the route of (a) against the formal proof's Lean statements, which have no prose), none shared; largest share the formal proof, 94 file locators against about 15 theorem locators into published texts; contents compared with the formal proof's directory layout and with Soule1999 §§1–3: independent (Layers 6 and 9–14 correspond to no run of either; within Layer 9 the order 9.1, 9.2, 9.3, 9.4 is forced by the Needs lines of 9.2 and 9.4).

Research link: Layer 9 extends the torsion bounds of Soulé (1999) and Bayer-Fluckiger–Emery–Houriet (2014) to all primes; Layer 10 applies Kolyvagin's derivative classes to Jacobi sums; Layers 13–14 rest on Kato's finiteness theorem and Ribet–Momose; the roadmap supplies UniformWildKernelBounds in the family following Alpöge's formal proof (2026). Rests on the README, Soule1999, BFEH2014.

## Not verifiable

- Arlettaz 1991, Theorem 1.5 (9.8 (a)): recorded as uncertified; the text was not read. Soule1999 line 348 and BFEH2014 line 145 cite the same theorem for the same map.
- Soulé 2003: described in the README only through BFEH 2014; its own text was not read.
- The formal proof: statements were read, proofs were not checked or compiled.

## Source issues

- none

## For the human reviewers

- Scope: Layers 6 and 10 and sections 9.5–9.7 cite no refereed source; their only source is the formal Lean proof by L. Alpöge announced 2026-11-20 (README References, line 1056). 10.1 (c), new at this head, likewise.
- Licence: the repository `leanprover-community/riemann-hypothesis` is published without a licence, as the family index says. The README cites file paths and declaration names and copies no code; 10.1 (c) and 14.1 paraphrase its structures in prose.
- Licence: `Suggested.lean` uses the same carrier expression as the formal proof's `UpperTheory.V.K.TorsBound` (`GeneratorCountTuples/TorsBoundPow.lean`); the theorem's name, quantifiers and bound differ.
- Not tested: the wording comparison with the formal proof covered its Lean statements only; it has no prose to compare.
- Policy: the family index has a section "When a roadmap is wrong", telling reviewers of library contributions not to block one that departs from a roadmap where the formal proof shows the roadmap wrong; the description states it.
