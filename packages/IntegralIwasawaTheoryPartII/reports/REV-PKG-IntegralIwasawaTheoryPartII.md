<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2419#issuecomment-6671414356 -->
Review (claude) of e83350b

Verdict: needs_changes

1. **F01** (P2) Declared gap and supplier contract cite OrdinaryAutomorphicFormsAndModularityLifting §3.14, which does not exist

   **Location.** `packages/IntegralIwasawaTheoryPartII/README.md` line 110 ("§3.14: Hida's Galois representation over the nearly ordinary Hecke algebra, stated there for `[F : ℚ]` even…"), line 112 (the gap sentence), the `*Needs:*` line of §4.1 (line 558) and the Layer 4 Dependencies (line 636); `design/plan.json`, `gaps[2].section = "§3.14"`.

   **Claim.** OrdinaryAutomorphicFormsAndModularityLifting §3.14 states Hida's family Galois representation for even degree, and the gap `hida-family-representations-all-degrees` is anchored there.

   **Witness.** At the supplier's open head (#1066) the headings of Layer 3 are §§3.36–3.39 and Layer 6 has §6.3 "The Galois representation of a Hida family over `ℚ`"; no heading §3.14 exists. The strings "§§3.11–3.14" in that README refer to AutomorphicGaloisRepresentations, whose §3.14 is "Determinant, total oddness and absolute irreducibility". OrdinaryAutomorphicFormsAndModularityLifting §6.3 itself names the even-degree owner: "ClassicalSerreModularity `I.1/nearly-ordinary-hecke-algebras` covers even-degree totally real `F` only", and that target (ClassicalSerreModularity at #1020, `I.1/nearly-ordinary-hecke-algebras`) states a pseudo-representation into `T^{n.o.}(U)_𝔪` and an actual representation only at residually absolutely irreducible maximal ideals, for odd `p` and even degree. Nothing at any cited head states DKV Theorem 4.1 (DKV18 lines 981–998).

   **Repair.** Re-resolve the gap by object and anchor it where the intake can announce it: set `gaps[2].section` in `design/plan.json` and the README contract to an existing section of the chosen supplier (OrdinaryAutomorphicFormsAndModularityLifting §6.3 or §2.12(b) if that roadmap is kept as supplier, or ClassicalSerreModularity `I.1/nearly-ordinary-hecke-algebras` as the roadmap that owns the even-degree statement), and rewrite line 110 to say what that section actually states (even degree, odd `p`, residually irreducible, pseudo-representation otherwise). State the gap's `needs` as DKV Theorem 4.1 does, over the field `L_H` with its Λ-adic topology (DKV18 lines 983–985), not over an algebraic closure (which carries no Λ-adic topology); the realization step of §4.1 ("complex conjugation has eigenvalues `±1`") then becomes unnecessary and can be dropped or kept as a Check. Update the same citation in §4.1 `*Needs:*` and in the Layer 4 Dependencies. Tested on the instance: with the gap pointed at a section that exists, `roadmaps resolve` has nothing to flag and the intake can post the contract.

2. **F02** (P1) The Eisenstein complement decomposition used by §§2.2 and 2.6 has no owner

   **Location.** `packages/IntegralIwasawaTheoryPartII/README.md` line 108 ("§2.12(a): classical Hilbert Eisenstein series `E_k(η, ψ)` of parallel weight `k`, spanning a complement of the cusp forms…"); §2.6 line 424 ("a form with vanishing standard constants is a cusp form plus a combination of the Eisenstein series `E_k(η, ψ)` with `ηψ = χω^{1−k}` (OrdinaryAutomorphicFormsAndModularityLifting §2.12(a))"); §2.2 `*Needs:*`.

   **Claim.** OrdinaryAutomorphicFormsAndModularityLifting §2.12(a) supplies the decomposition `M_k = S_k ⊕ ⟨E_k(η, ψ)⟩` at every classical weight `k ≥ 2`.

   **Witness.** At head #1066, §2.12(a) states the two-character series, their coefficients and constant terms, Chai's form and Wiles' vanishing, and then says in the following paragraph that "the decomposition of a form of nebentypus `ψ` into a cusp form and a combination of the series `E_n(φ₁, φ₂)` … belongs [to ClassicalSerreModularity `I.1/nearly-ordinary-hecke-algebras`] as well and is not stated here". The ClassicalSerreModularity target (#1020) does not state it either; NoncommutativeAndEquivariantIwasawa §F.5 and IntegralIwasawaTheory §9.3 state cusp spaces and families, not a complement. The statement is what DDP11 uses at line 1310–1312 ("`H_k` … is a linear combination of a cusp form and the Eisenstein series `E_k(η, ψ)`") and is the input of the Hecke-separation argument that makes `F` cuspidal.

   **Repair.** Either add a target to Layer 2 (a §2.2a) stating exactly: for `k ≥ 2`, every element of `M_k(𝔫p, χω^{1−k})` is a cusp form plus a linear combination of the `E_k(η, ψ)` over the admissible pairs with `ηψ = χω^{1−k}` of modulus dividing `𝔫p` (Shimura, Duke Math. J. 45 (1978), Proposition 3.4, the source OrdinaryAutomorphicFormsAndModularityLifting names for the series; DDP11 §2.2, pp. 457–459), with the `T_λ`-eigenvalue `η(λ) + ψ(λ)Nλ^{k−1}`, and cite §2.12(a) only for the series and their constant terms; or declare a gap on the owner (`gap:hilbert-eisenstein-complement`, supplier OrdinaryAutomorphicFormsAndModularityLifting §2.12, `needs` the sentence above) in both `design/plan.json` and the README. Correct line 108 accordingly. Tested on the instance: with the complement stated, the Hecke-separation step of §2.6 has every input owned.

3. **F03** (P2) §0.7 uses a cap product and a Hochschild–Serre edge isomorphism that no supplier or target provides

   **Location.** `packages/IntegralIwasawaTheoryPartII/README.md` §0.7, lines 234–244: "Express each integral as the cap product of the class of the measure cocycle in `H^{n−1}(U, C_c(F_p)^∨)` with the class `[L_k] ∈ H_{n−1}(U, C_c(F_p))`", "the Hochschild–Serre edge map … is an isomorphism", and the `*Needs:*` item "Mathlib group homology of the free abelian group `T` through `Tor` over `ℂ_p[T]`".

   **Claim.** Mathlib supplies the group homology, the cap product and the edge-map isomorphism for `U = E_+ × T`.

   **Witness.** Pinned Mathlib has the carrier `groupHomology` (`Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean`, line 228) with Shapiro and long exact sequences, but no Lyndon–Hochschild–Serre spectral sequence or edge map for group homology and no cap product pairing (no file under `RepresentationTheory/Homological` mentions either). CD14 proves the edge isomorphism (Theorem 5.1, lines 1469–1472) from the spectral sequence and uses the cap product in (81), line 1397; neither is a target here nor a cited supplier section.

   **Repair.** Add the two statements as sub-targets of §0.7 (or a §0.7a) with exact hypotheses: (i) for a discrete group `U` and a `ℂ_p[U]`-module `M`, the cap product `H^{n−1}(U, M^∨) × H_{n−1}(U, M) → ℂ_p` with its evaluation formula on `A ⊗ f`; (ii) for `U = E_+ × T` with `T` free abelian of rank `r` and `M` free over `ℂ_p[T]`, `H_q(T, M) = 0` for `q > 0` and `H_n(U, M) ≅ H_n(E_+, M/IM)` (Brown, *Cohomology of Groups*, Chapter V §3 and Chapter VII §6, or the Koszul resolution of `ℤ` over `ℤ[T]` with Künneth). Cite Mathlib `groupHomology` for the carrier only. Tested on the instance `r = 1`: with `T = ⟨π_1⟩` the Koszul complex `M → M`, `m ↦ (1 − π_1)m`, has zero kernel for `M` free, so `H_1(T, M) = 0` and `H_n(U, M) = H_n(E_+, M/(1 − π_1)M)`, which is what Theorem 5.2's step `1_𝒪 = (1 − π_1)1_{𝒪_{R′}}` needs.

4. **F04** (P3) §0.6 misdescribes the space `𝒬` of Sczech's test forms

   **Location.** `packages/IntegralIwasawaTheoryPartII/README.md` line 194: "the space `𝒬` of `n`-tuples of real linear forms".

   **Claim.** `𝒬` consists of `n`-tuples of real linear forms.

   **Witness.** CD14 lines 306–308 define `𝒬` as the set of `m`-tuples `Q = (Q_1, …, Q_m)` of linear forms on `ℝ^n`, each nonvanishing on `ℚ^n − {0}`, for any `m`; Theorem 4 (line 228) is stated for an `m`-tuple, and only the specialization (7) uses an `n`-tuple.

   **Repair.** Replace the phrase by "the set `𝒬` of finite tuples `Q = (Q_1, …, Q_m)` of real linear forms on `ℝ^n`, each nonvanishing on `ℚ^n ∖ {0}`"; keep "the `n`-tuple (7)" where the specialization is defined. Tested on the instance `n = 2`, `Q = (X_1 + √2 X_2)`: a single irrational form is admissible in CD14 but is not an `n`-tuple.

5. **F05** (P3) The cocycle property and nontriviality of `Ψ` are cited to a secondary statement

   **Location.** `packages/IntegralIwasawaTheoryPartII/README.md` line 194: "prove that it is a homogeneous `(n−1)`-cocycle representing a nonzero class in `H^{n−1}(Γ, M_ℚ)` (Charollois–Dasgupta Theorem 1.1, p. 9, after Sczech)".

   **Claim.** CD14 Theorem 1.1 supports the proof of this target.

   **Witness.** CD14 line 351: "This is [Sc, Theorem 4], restricted to `u = 0`"; the theorem is restated without proof. The target asks to prove it, so the primary source (R. Sczech, *Eisenstein group cocycles for GL_n and values of L-functions*, Invent. Math. 113 (1993), Theorem 4) is needed and is not in `sources.toml`.

   **Repair.** Add Sczech 1993 to the manifest (through the sources service; `uncertified` with its locator if only a paywalled copy exists) and cite it at the claim beside CD14 Theorem 1.1. Tested on the instance: the manifest then records every work the target's proof relies on.

6. **F06** (P3) §4.1 and §2.4 introduce objects without Checks

   **Location.** `packages/IntegralIwasawaTheoryPartII/README.md` §4.1 (line 556: `𝔪`, `A = T_(𝔪)`, `Â`, `K`, the product representation `ρ`) and §2.4 (line 396: `W`, `w`, `t`, the three cases).

   **Claim.** Each definition carries at least three discriminating Checks.

   **Witness.** Neither subsection has a `**Checks.**` list (the awk count over the README: §4.1 and §2.4 have zero Check bullets), although `K`, `ρ` and `W` are the objects that Layers 4 and 5 compute with.

   **Repair.** Add three Checks to §4.1 (the completion can split one `L_H` into several factors of `K`, so `K` is not "one field per eigenfamily"; `ρ(c)` has determinant `−1` and trace `0`, so its eigenvalues are `±1`; the residue of `T_𝔩` in `E` is `1 + χ(𝔩)`, so `𝔪` is the kernel of `T → W → E`) and three to §2.4 (interchanging `χ` and `χ⁻¹` inverts `W`; when `s = t`, `w = L^*_an(χ)/L^*_an(χ⁻¹)`; `w = −1` is Case 2, not Case 3). Tested on the instance `ℚ(i)`, `p = 5`: `R′ = ∅`, `χ = χ⁻¹`, so `W = 1`, `w = 1`, Case 2.

Independent review of `packages/IntegralIwasawaTheoryPartII/README.md`, `Suggested.lean`, `metadata.toml` and `sources.toml`. No earlier review of this package exists. The whole README (766 lines, 50 targets) was read; the fifteen seeded targets were checked against the cached source texts at their locators; every cross-roadmap citation was resolved on main or at the cited roadmap's open head; every backticked library name was opened at the pins; the adversarial pass below carries computed values. The sources manifest was not changed.

## Verified sound

**Principles.** No route-specific shortcut (every statement is for every totally real `F` and every prime, including `2`); no roadmap is re-planned (the Sczech–Eisenstein cocycle, Gross's regulator, the cyclotomic subspace and the three Artin algebras have no other owner: `roadmaps grep` over 457 open heads and main for Gross–Stark, Sczech, Eisenstein/Shintani cocycle, Gross's regulator and the cyclotomic subspace returns only bibliography entries in PadicFamilies, OrdinaryAutomorphicFormsAndModularityLifting and NoncommutativeAndEquivariantIwasawa); no copied passage; no algorithm; no sorry'd data and no `set_option` (the Lean file declares nothing).

**Elaboration.** `lake env lean` on `packages/IntegralIwasawaTheoryPartII/Suggested.lean` from the content checkout: exit 0, no output, hence no `sorry` warning and no error. The file has the single `import Mathlib`, one module docstring, the namespace `TauCetiRoadmap.IntegralIwasawaTheoryPartII` and no declaration. The `#check @name` comparison applies to nothing; the one-tactic padding probe applies to nothing.

**Headline theorems.** From the summary: the Gross–Stark leading-term theorem (§5.6) and its rank-zero case (§5.5); the all-prime lower bound (§0.7); the exact-order criterion and rank-one order theorem (§§5.7–5.8); the cohomological formula `L_alg = R_p` (§1.9); the three Hecke-image identifications (§§3.8–3.10). Each is named in the module docstring with its missing carrier. Checked at the pins: Mathlib has `NumberField.dedekindZeta` but no Hecke `L`-function of a finite-order character, no Deligne–Ribet `p`-adic `L`-function and no Iwasawa logarithm (grep over `Mathlib/` for `DeligneRibet`, `padicLFunction`, `IwasawaLog`, `HeckeLSeries`: no hit); Tau Ceti has finite-order Hecke characters (`TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/*.lean`) but no `L`-series, `p`-adic `L`-function, Iwasawa logarithm or Hilbert modular form (grep: no hit); Mathlib has `inertiaSubgroup` for valuations (`Mathlib/RingTheory/Valuation/RamificationGroup.lean`, line 49) but not the decomposition and inertia groups of `G_F` at a place used by §1.1. The docstring's "not statable" claims are therefore correct, and an empty file is the correct form. No padding, no stand-in.

**Dependency check.** Output of the gate run with `--movable`: `depcheck: 241 roadmaps, 2428 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line. In `board/merge-order/ORDER.txt` the roadmap is at position 195, after IntegralHeckeAndGaloisDeterminants (27), IntegralIwasawaTheory (28), NoncommutativeAndEquivariantIwasawa (29), ArithmeticGaloisDuality (48), DirichletPadicLFunctions (92), PadicFamilies (193) and OrdinaryAutomorphicFormsAndModularityLifting (194); ClassFieldTheory and LFunctions are on main, Chebotarev is under `Completed/`. PadicFamiliesPartII (244) and OrdinaryAutomorphicFormsAndModularityLiftingPartII (271) are not cited.

**Sampled locators (all fifteen verified against the cached texts).** DKV18 printed page = extraction page + 832.
- §0.2: DKV18 lines 96–110 (p. 835: `log_p(p) = 0`, `o_𝔓`, `ℓ_𝔓`, `U`, `X`, minus parts, `ℓ_p(u) = (−ℓ_𝔓(u))`), lines 116–123 (p. 836: `U_χ`, `X_χ` as `χ⁻¹`-eigenspaces), lines 1346–1358 (p. 865, §5.1). Supports the statement as written.
- §0.4: lines 124–126 (p. 836, `R_p(χ) = det(ℓ ∘ o⁻¹)`), 146–148 (footnote 1, the factor `(−1)^r ∏ f_𝔭`), 193–201 (p. 838, (8) and row scaling by `χ(σ)`).
- §0.6: CD14 lines 98–101 (Theorem 2, p. 3), 123–131 ((3) and interpolation, p. 4), 140–141 (Theorem 3, p. 4), 161–180 ((4)–(5), p. 5), 218–228 (`Γ_ℓ`, Theorem 4, p. 6), 238 ((11), p. 7), 322–351 ((16)–(17), Theorem 1.1, p. 9), 478 ((25), p. 12), 830–833 (§2.7, p. 18), 1048–1050 (Theorem 3.1, p. 22), 1063–1079 ((61), p. 22), 1089–1100 (Proposition 4.1, Theorem 4.2, p. 23), 1265–1276 (Proposition 4.3, p. 26). The smoothing hypothesis "prime norm `ℓ`, prime to `𝔣p`" is CD14 line 98.
- §0.8: DKV18 lines 84–87 (Conjecture 1 and (4), p. 835), 129–132 (Conjecture 2, p. 836), 152–160 (Theorem 1 and the equivalence with `R_p ≠ 0`, p. 837), 169–174 (Remark 1.1, p. 837).
- §1.1: lines 202–222 (p. 838: `H¹_R`, `H¹(G_𝔭, E) = Hom_cts(F̂_𝔭^×, E)`, footnote 3 on Serre's convention), 225–227 (p. 839), 392–394 (p. 843).
- §1.2: lines 403–426 (Proof 1, (18)–(22), pp. 843–844); DDP11 lines 687–735 (Proposition 1.4 and Lemma 1.5, pp. 455–456).
- §1.5: lines 477–501 (Proposition 2.2 with proof, p. 845).
- §1.7: lines 228–239 (p. 839, `dim H¹_cyc = r`, `det(y_{ij}) ≠ 0`); DDP11 lines 712–735 (Lemma 1.5 and its Poitou–Tate proof).
- §2.5: lines 596–610 ((28)–(29), p. 848), 613–639 (`F̃`, (30)–(31), the case division, pp. 848–849). `L(χ_{R′}, 0) = D_χ` is lines 600–603.
- §3.2: lines 769–776 (p. 853, `W_2` and its ideal: all eight relations as in the README).
- §3.9: lines 777–889 (Theorem 3.6 and proof, pp. 853–855; the `w = −1` branch at lines 872–889), 890–897 (Remark 3.7, p. 855).
- §4.1: lines 949–975 (p. 857: `𝔪`, `T_(𝔪)` reduced, `L = ∏ L_{H_i}`, (51)), 981–998 (Theorem 4.1, pp. 857–858), 1120–1139 ((63)–(64), pp. 860–861).
- §4.4: lines 1179–1223 (§4.3, (70)–(74), p. 862).
- §4.7: lines 1298–1317 (Lemma 4.7, p. 864).
- §5.3: lines 1435–1457 (§5.2 and Lemma 5.1, pp. 867–868), 1460–1467 (`C ⊂ ∑ (C_𝔭/A_𝔭) 𝔶`, p. 868).
- Also read: DKV16 lines 559–560 (preprint Theorem 3.2 with the normalization `ν_1(t)E_1(1, χ_S) = E_1(1, χ_S)`, p. 16); DDP11 lines 1313–1356 (Lemma 2.9, Corollary 2.10, pp. 469–470) and 1453–1524 (Propositions 3.3–3.4, Lemma 3.5, pp. 472–474); V15 lines 568–569 (Theorem 2, p. 14), 577–792 (§§4.1–4.2, pp. 15–20, Lemma 3 at line 728, Lemma 4 at line 748 with `r = e + m + 1` at `p = 2`); CD14 lines 1319–1365 ((79)–(80), pp. 27–28), 1381–1423 ((81)–(84), p. 29), 1426–1472 (Theorems 5.1–5.2, Lemma 5.3, pp. 30–31). The author flagged no locator as unverified.

**Supplier citations resolved (file and heading at the current head).** IntegralIwasawaTheory (#1306): Conventions (line 20), §0.1 (62), §0.4 (96), §4.2 (555; `algebraicLog_kernel`, `bakerBrumer_algebraicNumbers` at 557), §6.0 (706; `totallyRealHeckeValue_rational`, `deligneRibetPseudomeasure`, `deligneRibet_distributionCongruences` at 708–710), §6.3 (761; `deligneRibet_arithmeticInterpolation`, `deligneRibet_characterNumerator` at 763–765, with the interpolation `G_{ψ,S}(u^r − 1) = H_ψ(u^r − 1) L_S(1 − r, ψω^{−r})` and `H_ψ = 1` off type W), §9.3 (1146; `hilbertCuspGeometry` 1150, `hilbertHasseLift` 1166, every `p`). DirichletPadicLFunctions (#1039): §0.6 (265) with `HasIwasawaDecomposition`, `IsIwasawaLog`, `iwasawaLog`, `localIwasawaLog`, `existsUnique_isIwasawaLog_of_finiteDimensional`, value `0` at `p` and on roots of unity, product law, equivariance, angular coordinate with generator `1 + p` or `5`. ArithmeticGaloisDuality (#858): §R02.1.3 (701), §R02.2.3 (1402; inflation–restriction for compact and rational coefficients at 1467), §R02.3.3 (2295; `Pic(R_{F,S})` term at 2303, 2321), §R02.4.2 (3119; the degree-`(1,1)` swap sign at 3132–3133), §R02.4.3 (3437), §D7.6 (6019; real-place correction at `p = 2` at 6035–6036), §D7.7 (6223). IntegralHeckeAndGaloisDeterminants (#1689): §1.3 (2153; henselian lifting of matrix units, GMA), §1.4 (2327; extension module 2407, injection with `d!` invertible 2425–2428), §4.1 (3124; `Determinant.eq_of_charpoly_frobenius` 3138–3147, also declared in that roadmap's `Suggested.lean` line 355). NoncommutativeAndEquivariantIwasawa (#1307): §F.5 (2520; `hilbertForms`, `hilbertCuspForms`, `hilbertQExpansion` 2524, `hilbertCoefficientFamily`, ordinary projector, control, Hecke images, fractional Eisenstein families 2534–2566, stated for odd `p` at 2534). PadicFamilies (#1019): §5.9a (2849), §5.10 (2877, `p` odd), §5.11 (2915), §5.12 (2929), §5.13 (2943). ClassFieldTheory (main): §2.6 "Frobenius convention" (460; `χ_cyc(Art_K(u)) = N_{K/ℚ_p}(u)⁻¹` at 468 and 1368), Layer 7 (1312), Layer 11 (1683), Layer 12 (1724), Layer 13 (1799). Chebotarev (`Completed/Chebotarev/README.md`): Layer 10 (410), `hasDirichletDensity_frobeniusPrimeSet` (416, 686). LFunctions (main): Layer 5 "finite-order Hecke L-functions" (929), Layer 7 "intrinsic nonvanishing" (1440). OrdinaryAutomorphicFormsAndModularityLifting (#1066): §2.12 (366) exists and states the two-character series, Chai's form and Wiles' vanishing (R02 concerns the complement statement; R01 concerns §3.14). `roadmaps resolve` on the README: no cross-roadmap citation found nowhere; the one Lean-name lead (`Determinant.eq_of_charpoly_frobenius`) resolves to IntegralHeckeAndGaloisDeterminants.

**Library declarations opened at the pins.** Mathlib: `Matrix.det` (`LinearAlgebra/Matrix/Determinant/Basic.lean`:63), `Matrix.det_mul` (:141), `Matrix.det_nonsing_inv` (`LinearAlgebra/Matrix/NonsingularInverse.lean`:409, with `Ring.inverse` as the README says), `LinearMap.det` (`LinearAlgebra/Determinant.lean`:173), `LinearMap.det_toMatrix` (:206), `FreeAbelianGroup` (`GroupTheory/FreeAbelianGroup.lean`:96), `NumberField.RingOfIntegers.instFintypeClassGroup` (`NumberTheory/NumberField/ClassNumber.lean`:58), `NumberField.Units.finrank_eq` (`NumberTheory/NumberField/Units/DirichletTheorem.lean`:461), `NumberField.IsTotallyReal` (`NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean`:47), `NumberField.IsCMField` (`NumberTheory/NumberField/CMField.lean`:69), `PowerSeries.coeff` (`RingTheory/PowerSeries/Basic.lean`:76), `PowerSeries.X` (:154), `PowerSeries.order` (`RingTheory/PowerSeries/Order.lean`:50, `ℕ∞`-valued), `HenselianRing` (`RingTheory/Henselian.lean`:94), `IsAdicComplete.henselianRing` (:170), `FractionRing` (`RingTheory/Localization/FractionRing.lean`:729), `IsReduced` (`Algebra/GroupWithZero/Basic.lean`:191), `groupHomology` (`RepresentationTheory/Homological/GroupHomology/Basic.lean`:228). Tau Ceti: `TauCeti.ContCohomology.H1` (`RepresentationTheory/Homological/ContCohomology/LowDegree.lean`:725), `H1EquivOfSmulEqSelf` (:953), `TauCeti.ClassFieldTheory.artinMap` (`NumberTheory/ClassFieldTheory/Local/ArtinMap.lean`:109, normalized by arithmetic Frobenius per its module docstring line 29), `denseRange_artinMap` (:174), `continuous_artinMap` (:215), `artinMap_norm` (:310), `localArtinMap_Q2_zeta5` (`…/Local/Cyclotomic.lean`:188, "sends `ζ` to `ζ ^ 2`"). All exist with the hypotheses the README attributes to them.

**Declared gaps.** `dyadic-hilbert-coefficient-families` and `dyadic-hilbert-hida-localization` are precise (each names the exact statements and the dyadic conventions `u = 5`, `ω ∈ {±1}`), minimal (NoncommutativeAndEquivariantIwasawa §F.5 line 2534 and PadicFamilies §5.10 line 2879 are stated for odd `p` only) and declared with the same slug and section in `design/plan.json` and in the README. The third gap is precise and minimal but mis-anchored (R01).

**Shape.** Six layers, each with `### Examples` and `### Dependencies` (6 and 6); 50 `### k.n` targets, 50 `*Needs:*` lines, every target with a locator; `**Checks.**` lists with at least three bullets in §§0.1 (4), 0.2 (4), 0.4 (5), 0.5 (5), 0.6 (4), 1.1 (4), 1.6 (3), 1.8 (3), 2.1 (3), 2.3 (3), 2.5 (3), 3.1 (4), 3.2 (3), 3.3 (3), 3.7 (3), 4.3 (3), 4.4 (3), 5.3 (3) (R06 for §§2.4, 4.1); no backticked name of this roadmap's own (every backticked identifier is Mathlib, Tau Ceti or a supplier declaration listed above); no process residue, pull-request number, date, local path, LaTeX delimiter or `lemma` keyword; mathematics in Unicode; all five cited works recorded in `sources.toml` with status `certified` (DKV16, V15 arXiv; DKV18, DDP11 Annals open archive; CD14 author page).

**Adversarial table** (sampled targets, headline theorems and the targets the findings touch).

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §0.1 partition `R`, `R′` | `H = ℚ(i)`, `p = 2, 3, 5` | `(2) = (1+i)²` ramified, `χ(2) = 0`, `R = ∅`, `R′ = {(2)}`; `χ(3) = −1`, `R = ∅`; `5 ≡ 1 (4)`, `χ(5) = 1`, `R = {(5)}`, `r = 1` | holds | none |
| §0.2 `x_i ∈ X_χ` | `σ x_i` | `σ∑_g χ(g)g[𝔓] = ∑_h χ(σ⁻¹h)h[𝔓] = χ⁻¹(σ)x_i`; `c x_i = −x_i` | holds | none |
| §0.2 witness unit | `u = (2+i)/(2−i)`, `𝔓 = (2+i)` | `u = (3+4i)/5`, `ord_𝔓 u = 1 − 0 = 1`; `c(u) = u⁻¹`; `i ≡ −2 (5)` since `(−2)² = 4 ≡ −1` and `2 + i ≡ 0` | holds | none |
| §0.4 regulator formula | `O = (2)`, `L = (3)`; `diag(2,3)`, `diag(5,7)`; right factor `diag(4,1)`; row scaling by `χ(g)` | `−3/2`; `35/6`; `(−1)²·140/24 = 35/6`; `ord_{g𝔓}(u) = ord_𝔓(g⁻¹u) = χ(g)ord_𝔓 u`, same for `ℓ`, ratio fixed | holds | none |
| §0.4 `R_5(χ)` for `ℚ(i)` | `𝔓 = (2+i)` and `(2−i)` | `−log_5 u/1`; conjugate prime scales both by `χ(c) = −1` | holds | none |
| §0.5 `D_χ` | `ℚ(i)`, `p = 3`; `p = 2` | `B_{1,χ} = (1 − 3)/4 = −1/2`, `L(χ,0) = 1/2`; `p = 3`: `(1 − (−1))·1/2 = 1`; `p = 2`: `(1 − 0)·1/2 = 1/2` | holds | none |
| §0.5 pole branch | `ℚ(i)`, `p = 2`, `χ = ω` | `χω = 1`, `L_2(1, 0) = (1 − ω⁻¹(2))L(ω⁻¹, 0) = 1·1/2`; only pole of `L_2(1, s)` at `s = 1` | holds | none |
| §0.6 interpolation identity | `k ≥ 0` | `ω^{−k}(𝔠)N𝔠^k = ω(N𝔠)^{−k}ω(N𝔠)^k⟨N𝔠⟩^k = ⟨N𝔠⟩^k` | holds | none |
| §0.6 smoothing factor | `F = ℚ`, `𝔠 = (3)`, `χ` of conductor 4; `n = 1`, `k = 0` | `1 − (−1)·3 = 4`; `ζ_{1,3}(1,0) = ζ(0) − 3ζ(0) = (−2)(−1/2) = 1` | holds | none |
| §0.6 `𝒬` | CD14 §1.1 | `m`-tuples, each nonvanishing on `ℚ^n ∖ 0`; README: `n`-tuples | mismatch | R04 |
| §0.7 Spiess step | `r = 1`, `T = ⟨π_1⟩`, `M` free over `ℂ_p[T]` | Koszul complex `M → M`, `m ↦ (1−π_1)m`, injective; `H_1(T, M) = 0`; `1_𝒪 = (1 − π_1)1_{𝒪_{R′}}` | holds; edge map unowned | R03 |
| §0.7 at `r = 0` | `R = ∅` | `T = 1`, `I = 0`, bound `ord ≥ 0` | vacuous, as stated | none |
| Conventions: `ε_cyc(rec x)` | `K = ℚ_p`, `x = p`, `x = u`; `ℚ_5`, `x = 2`; `ℚ_2`, `ζ_5` | `rec(p) = Art(p⁻¹) = Frob⁻¹`, trivial on `μ_{p^∞}`: value `1 = p·p^{−1}`; `rec(u) = Art(u⁻¹)`: `ζ ↦ ζ^{u}`, value `u`; `Art(2)ζ_5 = ζ_5^{3}` (`2·3 ≡ 1 (5)`), `rec(2)ζ_5 = ζ_5^2`; over `ℚ_2`, `Art(2) = Frob`, `ζ_5 ↦ ζ_5^2`, `rec(2)`: `ζ_5 ↦ ζ_5^{3}` | holds | none |
| §1.1 `o_𝔮`, `ℓ_𝔮` independent | `ϖ`; `1 + p²` | `o(ϖ) = 1`, `o(1+p²) = 0`, `ℓ(1+p²) = log_p(1+p²) ≠ 0`; with `Art`: `o(Art ϖ) = ord(ϖ⁻¹) = −1` | holds | none |
| §1.2/§1.3 orthogonality | `r = 0`; `r = 1`, `ℚ(i)`, `p = 5` | empty sum `0`; `x·1 + y·ℓ(u) = 0 ⇒ x/y = −log_5 u` | holds | none |
| §1.5 injectivity | `R = ∅`, `V = E` | unramified classes factor through the finite class group of `H`; `Hom(finite, E) = 0`; `H¹_∅ = 0` | holds | none |
| §1.6 coefficients | local map `2o_j + 3ℓ_j` | `(x_j, y_j) = (2, 3)` | holds | none |
| §1.7 dimension | `dim W = 2r`, valuation block `O` | `det O ≠ 0 ⇒` evaluation `W → U_χ^∨` onto; kernel `2r − r = r` | holds | none |
| §1.8/§1.9 `L_alg = R_p` | `X = (2)`, `Y = (3)`; general `r` | `2/3`; `XO + YL = 0 ⇒ det X/det Y = (−1)^r det L/det O = det(−L)/det O` | holds, no stray sign | none |
| §2.1 weight coordinate | `ν_k(π)`, `d/dk` at `1`; `ε(σ) mod π²`; `f = as² + bs³` | `(u^{k−1}−1)/log u`, derivative `1`; `1 + π log_p⟨ε_cyc σ⟩`; `g(k) = f(1−k)`: leading `π²` coefficient `a`, a term `cs` gives `−cπ` | holds | none |
| §2.1 dyadic `⟨−1⟩` | `p = 2`, `ε_cyc(σ) = −1` | `ω(−1) = −1`, `⟨−1⟩ = 1`, `ε(σ) = 1`; `3 ∉ 1 + 4ℤ_2` | holds | none |
| §2.4 `W`, `w`, `c` | `s = t`; `s > t` | `w = (−1)^s D_χ L^*(χ)/((−1)^t D_{χ⁻¹}L^*(χ⁻¹)) · L(χ⁻¹,0)/L(χ,0) = L^*_an(χ)/L^*_an(χ⁻¹)`; `c = (−1)^{s−t}L^*_an(χ)/L^*_an(χ⁻¹)` (DKV18 line 1478) | holds | R06 (Checks) |
| §2.5 `F̃` | Cases 1, 2 (`w = −1`), 3 | `ν_1`: `E_1(1,χ_S)`; `(1 + w)E_1(1,χ_S) = 0`; `E_1(1,χ_S)`; Case 1 correction `≡ (−1)^s L^*_an π^s E_1(1,χ_{R′})` (DKV18 line 675) | holds | none |
| §2.6 cuspidal projection | `t` on `⟨E_1(1, χ_{R′∪J})⟩` | each factor of `t` has the same eigenvalue on every `E_1(1,χ_{R′∪J})` as on `E_1(1,χ_S)` (`T_λ`: `1 + χ(λ)`; `U_𝔮`, `𝔮 ∈ R′`: `1`), so `ν_1(t)` is the scalar `1` there | holds; complement input unowned | R02 |
| §3.1 `W_1` | `r = s = 1`; `r = 1, s = 2`; `r = 0` | `ε = aπ`, `dim = 2 = 2^1 + 1 − 1`; `ε = −aπ²`; relation `1 + (−1)^s aπ^s = 0` makes `π` a unit, ring `0` | holds | none |
| §3.2 `W_2` | `r = s = 1`, `w ∉ {0,−1}`; `w = −1`; `z^n` | `y² = yπ = 0`, `wπ = (w+1)y`, `y = wπ/(1+w)`, `ε = a(π − y) = aπ/(1+w)`; `π = 0`, `ε = −ay`, `E[y]/(y²)`; `z² = π² − 2y² + y² = π² − y²`, `yz = 0`, induction `z^{n+1} = π^{n+1} − y^{n+1}` | holds | none |
| §3.5 dimension | `r = 2`, `s = 3` | `s + s + (2^r − 2) = 3 + 3 + 2 = 8` | holds | none |
| §3.3 `W_3` | `r = t = 1`, `s = 2`; sign of `∏ε` | `yπ = y² = 0`, `y = πW = cπ²`, `ε = −aπ² = by` with `c = −a/b`; `(−1)^{s+1}aπ^s = (−1)^{s+1}a y^t/c = (−1)^{t+1} b y^t` | holds | none |
| §3.7 `Y` denominator | `χ(𝔮) ≠ 1`; `p = 2` | `(1 − ε(𝔮))/π ≡ −log_p⟨N𝔮⟩`; residue `−(χ(𝔮)−1)log_p⟨N𝔮⟩`; `⟨N𝔮⟩ = ±N𝔮 ≠ 1` for odd `N𝔮 ≥ 3` | holds | none |
| §3.9 Hecke formulas | `r = 1`, `w ∉ {0,−1}`, `𝔩 ∣ 𝔫`; `T_𝔩` | `U_𝔩 ↦ 1 + log⟨N𝔩⟩·wπ/(1+w)`; `T_𝔩 ↦ 1 + χ(𝔩) + log⟨N𝔩⟩π(χ(𝔩) + w)/(1 + w)` (DKV18 line 894 with `π` for `T`) | holds; DKV Remark 3.7 `U_𝔩 ↦ 1` is wrong (DDP11 (87)) | none |
| §3.9 independence | `w ≠ −1` | `α(1+w) + βw = 0`, `α + β = 0 ⇒ α(1 + w − w) = 0 ⇒ α = β = 0` | holds | none |
| §3.10 orders | `d = s − t`, apply `Y^{t−m}` to `π^jF`, `j ≥ d + m` | order `j + (t − m) + d ≥ 2d + t = 2s − t ≥ s + 1` iff `s ≥ t + 1` | holds | none |
| §4.1 `ρ(c)` | complex conjugation | `ε_cyc(c) = −1`, `⟨−1⟩ = 1`, `ε(c) = 1`, `det = χ(c)·1 = −1`, `ρ(c)² = 1 ⇒` eigenvalues `±1`, trace `0` | holds | R06 (Checks) |
| §4.4 characters | `ε_y ε_z` | `(1 + Ay)(1 + Az) = 1 + Aπ + A²yz = ε` with `A = (ε−1)/π`, `yz = 0` | holds | none |
| §4.7 away from `p` | `𝔩 ≠ p`, inertia image `𝒪_w^×` | `μ_{q−1} × (1 + 𝔪_w)`: finite part `→ B̄` zero; compact pro-`ℓ` image in a `ℤ_p`-lattice is pro-`p`, hence `0` | holds; DKV's "pro-`ℓ`" and "`B̄` pro-`p`" are gaps | none |
| §5.1 local terms | `η_i⁻¹(rec u)`, `ε(rec u)` | `η_i(rec ϖ⁻¹) = U ⇒ η_i⁻¹(rec u) = U^{o_i(u)} ↦ (1 + ε_i)^{o_i} = 1 + o_i ε_i`; `ε(rec u) ≡ 1 + log_p N(u) π = 1 + ℓ_i(u)π` | holds | none |
| §5.2 graded determinant | `r × r`, `zε_i = 0` | mixed terms vanish; `det L z^r + det O ∏ε_i`; `s = r`: `∏ε = (−1)^{r+1}a z^r ⇒ a = (−1)^r det L/det O = R_p` | holds | none |
| §5.3 inertia image | `σ ∈ I_𝔮`, `χ = η = 1` | `ε − ε_z = ε_z(ε_y − 1) = (ε_y − 1) + A²zy = ε_y − 1 ∈ yW_3` | holds | none |
| §5.4 inverse character | `r = t = 1`, `s = 2`; `𝔪_W yW_3` | `det L⁻ + det O⁻ · b = 0 ⇒ b = −L⁻/O⁻ = R_p(χ⁻¹)`; `𝔪y = (πy, y², ε_i y) = y²W_3` | holds | none |
| §5.5 rank zero | `ℚ(i)`, `p = 2, 3` | `f_χ(0) = L(χ,0)∏_{𝔮∣p}(1 − χ(𝔮)) = D_χ`, `L_an = 1 = det` of `0 × 0` | holds | none |
| §5.6 Gross–Stark | `ℚ(i)`, `p = 5` | `L_5′(χω, 0) = (1/2)(−log_5 u)`; consistent with §0.4 and §1.9 | consistent | none |
| §5.7, §5.8 | `R_p = 0`; `r = 1` | `s_χ > r`, `0 = 0`; `R_p = −ℓ(u)/o(u)`, `o(u) ≠ 0`, Baker–Brumer gives `ℓ(u) ≠ 0` | holds | none |
| Gap 3 `needs` | DKV Theorem 4.1 | stated over `L_H` (line 983); README asks over `L̄_H` with "Λ-adic topology" | weaker and ill-topologised | R01 |

**Ownership.** The integral Sczech–Eisenstein cocycle and the Gross–Stark objects are owned here because no roadmap on main, under `Completed/`, in the board package index or at any of the 457 open heads states them (grep above). Ownership against open pull requests was checked with the brief's tools over all open heads.

## Not verifiable

- Sczech, *Eisenstein group cocycles for GL_n*, Invent. Math. 113 (1993): not in the manifest; CD14 cites it for the cocycle property and nontriviality of `Ψ` (R05). Not opened.
- Wiles 1988 (Theorems 2 and 4) behind DKV Theorem 4.1, Shimura 1978 Proposition 3.4 behind the Eisenstein complement, and Spiess 2014 behind CD14 §5: not in the manifest; the statements were checked only through DKV18, CD14 and DDP11.

## Source issues

- **Misprint** in DKV18 at Remark 1.1, p. 837: the source says the endomorphism `ℓ ∘ o⁻¹` is an endomorphism of `U_χ`; it should be of `X_χ` (the conjugate on `U_χ` has the same characteristic polynomial); affects nothing.
- **Gap** in DKV18 at Theorem 3.2, p. 849: the source asserts only the existence of `t` with `t·e·F̃` cuspidal; it should add the normalization `ν_1(t)E_1(1,χ_S) = E_1(1,χ_S)`, without which `t = 0` qualifies; affects the proof; corrected in print at arXiv:1605.08169v1, Theorem 3.2, p. 16 (the preprint has the normalization).
- **Misprint** in DKV18 at proof of Theorem 3.6, p. 854: the source prints the dimension of `W_2` as `2r_an + 2r_an − 2`; it should be `2^r + 2r_an − 2`; affects nothing.
- **Error** in DKV18 at Remark 3.7, p. 855: the source says `U_𝔩 ↦ 1` for `𝔩 ∣ 𝔫`; it should be `1 + (w/(1+w)) log_p⟨N𝔩⟩ π`, as Theorem 3.6 and DDP11 (87) give; affects a stated result (the remark only).
- **Misprint** in DKV18 at Remark 3.7, p. 855: the source writes the formulas with the variable `T`; it should use `π = T/log_p u`; affects nothing.
- **Gap** in DKV18 at Lemma 4.3, p. 860, and Lemma 4.6, p. 864: the source chooses `τ` avoiding the ordinary lines only at `𝔭 ∈ R`, but Lemma 4.6 needs `A_𝔭, C_𝔭` invertible for every `𝔭 ∣ p`; it should extend Lemma 4.3 to all `𝔭 ∣ p` (Lemma 4.2 allows it); affects the proof.
- **Gap** in DKV18 at proof of Lemma 4.7, p. 864: the source says the inertia image in `G_w^{ab}` is pro-`ℓ` and that `B̄` is pro-`p` as a finite-dimensional `E`-space; it should treat the finite prime-to-`ℓ` torsion of the local units separately and use that compact images lie in a lattice; affects the proof.
- **Misprint** in DKV18 at §5.2, p. 867: the source writes the lower-entry identity as `c(σσ′) = c(σ)a(σ) + d(σ)c(σ′)`; it should be `c(σ)a(σ′) + d(σ)c(σ′)`; affects nothing.
- **Misprint** in CD14 at proof of Theorem 5.1, p. 31 (author copy): the source says a free `ℂ_p[T]`-module has homological dimension `1`; it should say projective dimension `0`, so `H_q(T, ·)` vanishes for `q > 0`; affects nothing.
- **Misprint** in V15 at §4.2, p. 20 (arXiv v1): the source ends the proof with "this finishes the proof of Theorem 1"; it should be Theorem 2; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "e83350bb6fbc9161c49728a7dff8874e28799ffd", "job": "REV-PKG-IntegralIwasawaTheoryPartII", "model": "fable", "worker": "chris-x9"} -->
