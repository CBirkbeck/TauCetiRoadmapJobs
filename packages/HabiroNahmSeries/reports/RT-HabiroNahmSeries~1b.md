<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/152#issuecomment-6335884336 -->
Red team round 1 pass b (claude) of 0c13697

Verdict: needs_changes

1. **F01** (P3) The vanishing-Gauss-factor Checks hold for only half of the primitive cube roots

   **Location:** `packages/HabiroNahmSeries/README.md:392`: “`vanishingGauss` at A=1,B=0,m=3 has Q(n)=n²/2, D=2 and G=(1−1)/2=0. The normalised full expansion is flat”; also `:393` (“ā=3⁻¹=3 mod 4”) and `:454` (“At the third root for A=1,B=0 the Gauss factor vanishes”).

   **Claim:** The Gauss factor G(Q,a/m) of §2.5 depends on the integer a through ā = a·m⁻¹ mod D, and Q(n)=n²/2 is not 1-periodic, so the expansion at a/m depends on a mod 2m, not only on ζ=e(a/m). For a=2 (ζ=e(2/3)) one gets ā = 2·3⁻¹ ≡ 0 mod 2, hence G = ½(e(0)+e(0)) = 1, and with D=4, ā = 2·3 ≡ 2 mod 4 gives terms e(r²)=1, so G=1 again. The Checks as written (no a specified, “the third root”) are false for even a: for a=2 (ζ=e(2/3)), and equally for a=4, which is the same root ζ=e(1/3) as a=1 reached along the representative 4/3.

   **Witness:** A probe copy summed f(τ)=∑ e(τn²/2)/(q;q)_n at τ=a/3+iε/(6π) with Λ=π²/12: at ε=0.025, |f|·e^(−Λ/(3ε)) = 7.3·10⁻¹⁵ for a=1 (flat, G=0) but 0.99983 for a=2 (nonzero leading constant, G=1); at ε=0.05 the values are 1.0·10⁻⁷ and 0.99965.

   **Exact repair text:** In `vanishingGauss` write “at A=1,B=0,m=3 and a=1 (ζ=e(1/3)) has Q(n)=n²/2, D=2, ā=1 and G=(1−1)/2=0”; in `gaussRefinement` keep a=1 explicit (“ā=1·3⁻¹=3 mod 4”); add the negative control “`gaussRepresentative`: at a=2 (ζ=e(2/3)) ā≡0 mod 2 and G=1, and the normalised modulus tends to a nonzero constant; a=4 gives G=1 at the same root ζ=e(1/3) as a=1. The residual class of a modulo D is part of the datum of a radial expansion when Q is not integer-valued, as `puiseuxBranch` already records.” In the Examples paragraph replace “At the third root for A=1,B=0” by “At τ=1/3+iε/(6π) for A=1,B=0”.

2. **F02** (P3) `rationalGaussTaylor_mul_odd` is one `simp` call from Mathlib and carries an unused hypothesis

   **Location:** `packages/HabiroNahmSeries/Suggested.lean:314`: “theorem rationalGaussTaylor_mul_odd (m p : ℕ) (hm : 0 < m) (hp : Odd p) : rationalGaussTaylor (p * m) = rationalGaussTaylor m := by sorry”; `packages/HabiroNahmSeries/README.md:1292`: “Prove `rationalGaussTaylor_mul_odd`: for every positive odd integer p and every m>0, a_pm=a_m.”

   **Claim:** The statement is a target but closes by one tactic at the pinned Mathlib (`Nat.Coprime.dvd_mul_left` with `Odd.coprime_two_left`); the binder `hm : 0 < m` is never used (the identity also holds at m=0).

   **Witness:** A probe copy with the same definition elaborated the proof below with only an “unused variable `hm`” linter warning.

   **Exact repair text:** Replace the `sorry` by
   ```lean
   simp [rationalGaussTaylor, Nat.Coprime.dvd_mul_left hp.coprime_two_left,
     Nat.Coprime.dvd_mul_left (Nat.Coprime.pow_left 2 hp.coprime_two_left)]
   ```
   and drop `(hm : 0 < m)` from the signature (in the README: “for every odd p and every m, a_pm=a_m”). Keep the proved statement as an API lemma; it is no longer listed as a target.

3. **F03** (P3) The Garoufalidis–Zagier locator for the Neumann–Zagier dictionary points at the congruence-class decomposition

   **Location:** `packages/HabiroNahmSeries/README.md:1257`: “Sources: GSWZ Remark 4.2, (233), p. 48; GZ §5, (26)–(31), pp. 8–10.”

   **Claim:** In the cited arXiv v1 text, equations (26)–(31) on pp. 8–9 belong to §4.3 (the residue-class decomposition f^[k,k′] in the proof of Theorem 3.1), not to §5; the dictionary A = I − ℬ⁻¹𝒜 with its linear shift is displayed in §5 on pp. 10–11.

   **Witness:** GZ lines 462–500 ((26)–(31), pp. 8–9, inside “4.3. Proof of Theorem 3.1”); GZ line 608 (“5. A syntactical identity…”, p. 10), line 630 (the NZ equations, (39)), line 651 (the dictionary, (41)), line 654 (the map T, (42)), p. 11. The published text numbers the dictionary (40) and the map (41) (GZ-published lines 663 and 666).

   **Exact repair text:** “Sources: GSWZ Remark 4.2, (233), p. 48; GZ §5, (39)–(42), pp. 10–11 (in the published text the dictionary is (40)–(41)).”

4. **F04** (P3) Process word “current” in the scope and dependency prose

   **Location:** `packages/HabiroNahmSeries/README.md:11`: “The current `FuchsianOrbifolds` roadmap, Layers 3–5, owns cusp charts”; same line: “The current `ModularForms` roadmap owns”; `packages/HabiroNahmSeries/README.md:512`: “Current FuchsianOrbifolds Layers 3–5 and the pinned cusp APIs listed above.”

   **Claim:** “current” is in the roadmap repository’s list of process narrative to avoid (a reader a year from now cannot tell which version was meant); both roadmaps are on `main`, so the word carries no information. (The third occurrence, `:52` “the current Tau Ceti library’s”, is repaired by pass a’s F10 and is not re-raised.)

   **Witness:** The roadmap-shape rules list “current” with “so far” and “to be checked”; `TauCetiRoadmap/FuchsianOrbifolds` and `TauCetiRoadmap/ModularForms` exist on `main`.

   **Exact repair text:** `:11`: “The `FuchsianOrbifolds` roadmap, Layers 3–5, owns cusp charts, …. The `ModularForms` roadmap owns general-level modular-form geometry.” `:512`: “FuchsianOrbifolds Layers 3–5 and the pinned cusp APIs listed above.”

5. **F05** (P3) `isStrongDenominator_two_mul` carries a needless symmetry hypothesis

   **Location:** `packages/HabiroNahmSeries/Suggested.lean:104`: “theorem isStrongDenominator_two_mul {N : ℕ} (A : Matrix (Fin N) (Fin N) ℚ) (hA : A.IsSymm) (B : Fin N → ℚ) (C : ℚ) (d : ℕ) (hd : IsDenominator A B C d) : IsStrongDenominator A B C (2 * d)”; `packages/HabiroNahmSeries/README.md:93` states the theorem without symmetry.

   **Claim:** `quadraticExponent A B C` depends only on the symmetrisation ½(A+Aᵀ), and the proof needs only what `IsDenominator` gives: evaluating at 0, ±e_i and e_i+e_j shows dC, d·A_ii, d(A_ij+A_ij)/2 and 2dB_i are integers, and then Q(k+2du)−Q(k) = 2d·uᵀ(dA_sym)u + 2uᵀ(dA_sym)k + 2dB·u ∈ ℤ. `hA` is never used, so the Lean target is narrower than the README’s statement and than the truth.

   **Witness:** For A = !![0, 1; 0, 0] (the matrix of the `nonsymmetricFormalRejected` Check), `quadraticExponent A B C` is the same function as for !![0, 1/2; 1/2, 0], so the conclusion holds for A with the same proof; the docstring (“Twice a denominator is a period”) mentions no symmetry.

   **Exact repair text:** Delete `(hA : A.IsSymm)` from the signature of `isStrongDenominator_two_mul`; if symmetry is wanted as a standing convention, keep it in `NahmDatum` only.

## Verified sound

Read all 1,383 lines of `packages/HabiroNahmSeries/README.md` and all 342 lines of `packages/HabiroNahmSeries/Suggested.lean`, every comment on the pull request (the job brief and the pass-a review with findings F01–F24), `metadata.toml` and `review.json`; no `sources.toml` exists in the package (pass a F03).

Lean: 46 declarations read (14 real-bodied definitions/structures, 11 `sorry`-ed theorems, 21 proved examples); the file elaborated as submitted at the pinned Mathlib with exactly 11 `declaration uses 'sorry'` warnings and no other diagnostic. Every Lean name appears in the README. Single `import Mathlib`, no `TauCeti.*` import, no `set_option`, no `lemma`, no sorry’d data, at most two examples per definition. Each sorried statement was checked as typed: `isStrongDenominator_two_mul` (true; F05), `existsUnique_nahmEq` (strictly convex potential ½sᵀAs+∑Li₂(e^(−s_i)) with Hessian A+diag(x/(1−x)); VZ Lemma 2.1 confirms), `nondegenerate_zero_isAlgebraic` and `nondegenerate_coordinateField_finite` (Ω_{L/ℚ}=0 and finite generation, characteristic 0), `nahmSummand_summable` and `analyticNahmSum_holomorphic` (Gaussian domination and ∏(|q|;|q|)_∞>0 on compacta), `torsion_of_unbounded_divisibility` (free coordinates), `formalNahmSeries_qDifference` (coefficient ratio c_n(1−q^{n_j}) = (−1)^{A_jj} q^{(An)_j} c_{n−e_j}, which uses `hA` through E(n)−E(n−e_j)=(An)_j; `MvPowerSeries.rescale` is substitution t_i↦a_i t_i), `formalExponent_two_mul` (parity by symmetry), `rationalGaussTaylor_eq_gaussSum` (|G(m)|²/m = 1, 0, 2), `rationalGaussTaylor_mul_odd` (true; one tactic, F02). One-tactic probes were tried on all eleven; only `rationalGaussTaylor_mul_odd` closed. The 21 examples were read against the definitions; `regularisationJet` was re-derived by Wick contraction (⟨w⁶⟩=15h³C³ gives the 1/8+1/12 split; the mixed bT term is ½).

README targets: all 38 numbered subsections and 209 Check bullets read. Checks recomputed exactly or numerically (47): both Rogers–Ramanujan exponents; Q=n²/4, n/2, n², rank-0 constants; discriminants −31/−23; cubic δ=z⁻³(3−2z) and (2−z)/z for the all-ones matrix; the 𝔽₅ roots 2 and 3 and δ=0 at A=2,z=2; t=4/27 at z=3/2; the golden δ=(5+√5)/2; clearing polynomials at M=2,−1; the rank-one Jacobian −1−2y; the A=1/2 lift (x,y)=((3−√5)/2,(√5−1)/2); L_CGZ((√5−1)/2)=π²/15 and L_CGZ(1/2)=π²/12; the Bloch–Wigner values 0, ±0.79158333 for x³+x−1 and 2.0298832128 for 2[ζ₆]; the Dedekind phases χ=e^{πi/18} at (1,3) and χ=1 vs e(1/5) at (2,5), and the identity χ=m^{−1/2}exp((1/m)∑rLog(1−ζ^r)) (modulus and argument); the Euler expansion (q;q)_∞∼√(2π/ε)e^{−π²/(6ε)+ε/24}; the first coefficient −1/60 and +1/40 without the Euler term; the order-one constant (2−x)^{−1/2}=0.8507; the covolume bookkeeping m^{−N/2}; the Gauss values at D=2 and D=4 for a=1 (and a=2, F01); the 2^{−1/4} and √2 constants of `coefficientFieldLinearTerm`; the majorant data (1/2,3/2; 11/60,131/60; 1/128; 1+e^{−t}); 2q³ for (2,−3,5); s=120 and e(−c/(60d)); the unipotent product ((1,Lk),(L,1+L²k)); the σ⁻¹ identity and the phase e(−3v/5), scale 25y; Λ=4π²λ; the plethystic data for (T;q)_∞, (T;q⁻¹)_∞, (−T;q)_∞, exp(−T/(1−q)²), U₂=(1+T)^{−1/2} and the full q=−1 root expansion of (T;q)_∞ (confirming the sign +(m−1)/(2m)); F₀, F₁, the A=3 q-difference and its t, t² coefficients; z=1+t+3t²+12t³+55t⁴+273t⁵ and δ=1−5t−3t²−10t³−42t⁴; G_j, R_{−e_j}, U_{j,2} at A=0 and (1−t^m)⁻¹ at A=1; V₀, V₁, V₃, V_{−1} to t⁴ and the m=2 residues; the restricted level coefficient −(q³+2q−1)/(2(q−1)³(1+q²)(1+q+q²)) (recomputed from scratch; the Φ₂ factor cancels, the Φ₄ pole is genuine); L_{(1,1)}, L_{(2,2)} for 1+t₁t₂ and (1−q^m)/(s(1−q^{ms})); the order-m system by iterating the m=1 equation (m=2 gives q^{3A_jj}); the A=5,p=5 relation T²≡z⁴; the A=3,m=1 first jet −(z−1)(28z²−99z+108)/(12(2z−3)³) (exact match from the displayed b,Q,T₃,U₄,c and C=Λ_A⁻¹); the modified potential identity W_p = V_A(t^p)/p − pV_A(t) as an exact t-series identity for (A,p)=(0,5),(1,5),(3,5),(2,7) (its proof reduces to φ(1−z_j)=(1−z_j)^p e^{pβ_j}, which the Nahm equations give for odd p) and the reflection sign of §6.3; the Ψ/P values 16t⁴,16t²,256t⁴, t/2, 2t₁+t₂/2, −Li₂(t²)+Li₂(t) and 3−2x+x²+x³/5; the cubic δ=−z²−z−2, δ⁻¹=(2z²+3z−9)/23, norm −23, the t coefficient q⁻²+…+q², the q=−1 values 1,1,4,5,21,28 from Gaussian binomials and from (z⁻¹+T)/δ, and the z^{a_ℓ−2}/δ numerator via ∑binom(3j+a,j)t^j=z^{a+1}/(3−2z); the quartic certificates (1−u=u⁸v⁵, 1−v=u⁵v⁴, δ and δ⁻¹, e²−3e+1=0, v=−9e−3u²−5u+11, discriminant −11875, Gram matrix and −475, norms −1,1,1,−1,9025, D₄ and S₄ Galois groups, discriminant 229 and the S₄ factor’s equations); the figure-eight z=ζ₆, δ=−√−3, 2a₂−a₁²=−1/27; the pretzel identity −24α²+32α−26=−2(2α²−2α+3)²; the Gauss companions 2+2i, 2, i,0,−i,−2 versus ½(1+i^m)²; the quadratic-radical description for 4|m and the sign change for m≡2 mod 4; the Rogers–Ramanujan residues and −5F²−5F=1.

Locators verified against the cached legal copies (20 groups): CGZ (42) and the ℝ/(π²/2)ℤ target of the Rogers map (CGZ lines 1680–1699, p. 36, which also justifies `nahmRogersValue_rat_of_torsion`), Theorem 7.1 (43)–(44), Corollary 7.2, Remark 7.3 (lines 1716–1739, pp. 36–37), Theorem 7.4 p. 37, (48)–(49) p. 38, Theorem 7.5, (53), Remarks 7.6–7.7 pp. 40–41, Definition 2.1/Lemma 2.2 pp. 8–9, Proposition 2.5 p. 11, Remark 2.6 p. 13; GZ Lemma 2.1 p. 3, Proposition 2.2 (10)–(11), (12)–(14) p. 4, (16) p. 5, Theorem 3.1 (18)–(21) pp. 5–6, (23)–(25) pp. 7–8, Claims 1–4 and (34)–(37) pp. 8–10, Proposition 7.1 pp. 13–14 (the §5 locator fails, F03); GSWZ (1)–(2) p. 1, Theorem 2 (25)–(26) pp. 10–11, Definition 1.7 (27)–(28), (34)–(36) p. 13, Theorems 4–5 and (39) p. 14, Corollary 1.11 p. 15, Lemma 2.5 (74)–(75) p. 22, Lemma 2.6 (79) p. 23, (116) p. 29, Lemma 2.13 (130) p. 31, (168) p. 36, (174) p. 37, Lemma 3.1, Propositions 3.2–3.3, Theorem 9 (183) pp. 38–39, (184)–(195) pp. 39–41, §3.3 p. 43, Remark 3.11 p. 44, Theorem 11 (222) p. 46, Theorem 12, Example 4.1 (231) p. 47, Remark 4.2 (233) p. 48, (242) p. 49, §4.4 (264)–(275) pp. 53–54, §4.5 p. 54, §4.6 p. 55, Examples 4.4–4.5 (289)–(295) pp. 57–58 (the cached copy’s page markers run three ahead of the printed numbers from p. 31 on; printed numbers were read from the page headers); VZ Lemma 2.1 p. 2, Lemma 2.2 and (2.3)–(2.4) pp. 2–3, Theorem 2.3 p. 4, §4 pp. 15–18; Zagier II.1A p. 23, II.3A (25) p. 43, II.3B/C headings pp. 44 and 50 so that pp. 55–56 lie in II.3C (printed numbers are two ahead of the markers); GSW Lemmas 3.1–3.2 (22)–(25) p. 10; Aarhus Proposition 2.13 p. 8 (block A invertible, as pass a F06 says); GW Definition 1.2 and (13)–(14) p. 5, Proposition 1.14 (47) and Theorem 1.13 p. 11, Theorem 1.18 (50)–(53) pp. 12–13, (173) p. 30, (182) p. 31; Wagner 2.13 Corollary (§2.2) and 3.13 Corollary (§3.2); Stacks Lemma 10.148.3 tag 00UO (cached).

Pinned declarations grepped and found: Mathlib `Matrix.PosDef.add_posSemidef`, `Matrix.posDef_iff_dotProduct_mulVec`, `SchwartzMap.tsum_eq_tsum_fourier`, `OnePoint.exists_mem_SL2`, `CuspOrbits`, `Subgroup.strictWidthInfty`, `isCusp_SL2Z_iff`, `Subgroup.isArithmetic_iff_finiteIndex`, `meromorphicOrderAt`, `hensels_lemma`, `PowerSeries.log`, `KaehlerDifferential.D`; Tau Ceti (a91d3aaf) `cuspTranslationOrbitWidth`, `multivariateGaussianPDFReal`, `multivariateGaussian_eq_withDensity`, `integrable_pow_gaussianReal`, `integrable_eval_mul_gaussianEnvelope`, `FiniteQuadraticModule.gaussSum`, `gaussSum_mul_conj`, `gaussSum_eq_card_mul_gaussSum_quotientOfLeQuadraticRadical` (so pass a F10 stands).

Supplier citations checked (18 names): on `main`: ThetaSeries, FuchsianOrbifolds, ModularForms, StandardDistributions; in the merge order: PolylogarithmFunctions (34), HabiroCyclotomicCompletions (63), QWittVectors (64), ColemanIntegration (102); existing nowhere (no `main` folder, no `Completed` folder, no merge-order line, no board package): K3BlochGroups, Polylogarithms, BorelRegulators, HabiroNumberFields, HabiroRings, PadicHodgeRegulators, ArithmeticKTheory, HabiroCohomologyFoundations, ArithmeticQuantumTopology; QSeriesPartitionsAndMockModularForms has a board package without a README. These are pass a’s F11–F15 and are not re-raised. No `gap:` contract is declared. The dependency gate at this head:

```text
depcheck: 9 roadmaps, 80 edges, 0 problem(s)
```

`HabiroNahmSeries` is absent from `merge-order/ORDER.txt` (an imported package; not a defect).

Pass a’s findings F01–F24 (cycle §6.1/§6.3; pull-request numbers and the trailing name catalogue; missing `sources.toml`; residue normalisation, finite residue sum and kernel denominators of §7.1; block Fubini; p|m in the first-jet algebra; S_A and 1/2; the A=1/2 example; Gauss-sum pin; Polylogarithms/K3BlochGroups/q-series/HabiroRings/HabiroNumberFields suppliers; `unitSeries_descent`; missing Lean mirrors; `nahmIntegralModel` Checks; the Frobenius algorithm; the cubic-only q-binomial theorem; dim Spec R; Zagier and GSWZ (35) locators) are not re-raised; where I touched the same objects (F09, F10, F23, F24, F06) I found them correct.

## Not verifiable

- The all-order analytic estimates (uniform saddle remainder, global tails, Kummer descent of all coefficients) and the Gaussian normalisation/regularity/identification comparisons of §§2.3–2.6 and §5.6 were checked for stated hypotheses and at the listed boundary cases, not reproved.
- Exact Bloch orders (60ξ=0 for the quartic), the descendant rank 8, the tame-kernel ledger, degree-27/400 denominators and the all-order integrality of the knot examples are computational claims of the source; only the finite algebraic subclaims listed above were recomputed.
- The claimed sign/normalisation corrections to GSWZ (67), (114), (121)–(124), (218) and GW (182) were checked where a finite computation decides them ((67) via (T;q)_∞ at q=−1, (242) via the first jet, (182) via the q=−1 values); the remaining ones rest on the asymptotic derivations above.
- The published editions of CGZ and GZ were consulted only for equation numbering; printed pagination of the published GZ text (pp. 221–238) was not mapped.
