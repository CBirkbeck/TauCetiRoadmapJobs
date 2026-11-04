# GATE-GrossZagierAndArithmeticHeights~7: answers to human review

There is one review, by rwst, at head `07a320c` (sections R01–R10). Points are numbered in the order they appear. Repairs are in commit `660084d9` on the pull-request branch, which has not been pushed. Section numbers refer to `TauCetiRoadmap/GrossZagierAndArithmeticHeights/README.md` after the commit.

## H01 (rwst) — applied
HilbertModularVarietiesAndShimuraCurves R18.2.8–R18.2.10 are indeed maximal at the division primes ("The division case has maximal local level"), and R18.5.20–21 cover generic fibres only, so the contract had no owner. The contract paragraph `gap:principal-level-quaternionic-intersections` is gone. In its place a new owned target, §7.46a "Principal-level integral models, CM sections and Čerednik–Drinfeld charts", builds the models as the normalization of the R18.2.9 model at U♮ in X_U, with regular and semistable models after finite extension and CM sections. Its local lengths are normalized by e(H_w/F_v), and their sum with the vertical correction is the finite Néron symbol of §2.5, which does not depend on the model. Every former use (§7.47 items 2–4 and its *Needs*, the supplier table, the Layer 7 Dependencies, Source and interface limits) now cites §7.46a.

## H02 (rwst) — applied
§7.46a item 3 states the principal-level Čerednik–Drinfeld chart. The completion along the special fibre is B(v)^× \ (Σ̂_(U_v) × 𝔅_f^(v,×)/U^v), where Σ̂_(U_v) is the normalization of Ω̂ (R18.5.3) in the level-U_v covering of the R18.5.20–21 tower. It is compatible with R18.5.15.

## H03 (rwst) — applied
§7.46a item 5 treats F = ℚ with 𝔅 ramified only at ∞ (the cusped modular case). It uses the coarse models of ModularCurvesPartII §§5.1–5.3 normalized in X_U, the cusps of §§4.1–4.8 and the level maps of §5.15. CM sections never meet cusps because CM curves have potentially good reduction. A Check verifies this for D = −7: j = −3375 is an integer.

## H04 (rwst) — applied differently
Option (a) is taken on this roadmap's side. EffectiveClassNumbers §2.8 (open PR #1406) does state "Prove the class-character Gross–Zagier formula" with *Needs* that contain no kernel or local-height input. This roadmap holds the proof route, so ownership goes with the route:
- The supplier row and the Scope sentences importing EffectiveClassNumbers §2.8 are deleted.
- §8.15 now proves every case. The case c = 1, D odd, all p | N split is derived from §8.6 by weighting with χ, projecting to φ and using ĥ_H = h·ĥ_K: this is Gross–Zagier I (6.3)–(6.5), gz86 lines 224–248.
- §8.19 drops the import, and Downstream consumers names EffectiveClassNumbers §2.8 as a consumer.

For this to be consistent, EffectiveClassNumbers must cite §§8.15/8.19 and move after this roadmap in the merge order. That change is in another pull request and is a human decision. depcheck reports 0 problems because this roadmap no longer cites EffectiveClassNumbers at all.

## H05 (rwst) — applied
§2.1 used to say "complex embeddings count twice real ones". It now sums over all embeddings σ: L → ℂ with each embedding counted once, so a complex place (σ, σ̄) counts twice a real place. The third Check now computes the imaginary-quadratic case: 2g at the one place, against 4g if each embedding were weighted 2 and g if the place were counted once.

## H06 (rwst) — applied
The §7.58 Check now gives the value 2, explained through Aut(x̄). The reduction lies over j = 0 = 1728 in characteristic 3, #Aut(x̄) = 4, and the four norm-3 elements each lift to order exactly 1. As a cross-check, GZ III (9.7) runs over n ∈ {3, 6, 9}, where r_A(15) = 0 (3 and 5 are inert in ℚ(√−7)), r_A(9) = 1 and r_A(3) = 0, so only n = 6 contributes (gz86 lines 1612–1615). The former "(4·1)/4 = 1" now appears as the wrong alternative.

## H07 (rwst) — applied
§6.69 now restricts the target to k = 1, where the constant of Gross–Zagier IV (5.6) equals 8π²/√|D|. It records that the projection of §6.66 gives 2^(4k−1)π^(2k)/((2k−2)!|D|^(k−1/2)), and that the printed constant carries an extra (k−1)! (equal values for k ≤ 2; at k = 3 the ratio is 2). The phrases "printed and corrected constants agree" and "the case k ≥ 2 is 6.66" are gone. §6.72 is restated for k = 1 with P₀ = 1.

## H08 (rwst) — applied
The first §6.22 Check is now restricted to v inert, or ramified with v(D_v) = 1. It adds the counterexample E = ℚ(i) at v = 2, where v(D_v) = 2 and the shell n = 1 occurs. This matches Yuan–Zhang Lemma 7.5(2), yuan-zhang lines 2719–2726.

## H09 (rwst) — applied
§9.9 now assumes, from Brooks §2.1 (brooks lines 199–204), that every prime of N⁺ splits or ramifies in K; this is (gen-H) with N⁻ > 1. The Consequence now says that BDP Theorem 5.4 is the analogous N⁻ = 1 identity on X₀(N), outside this target's hypothesis.

## H10 (rwst) — applied
§0.3 used to assume "L(E,·) … L(E,1) = 0 (the case of odd analytic rank)". It now assumes "N > 0 and L differentiable at 1 with L(1) = 0", with one function name.

## H11 (rwst) — applied
The §4.7 Consequence now requires F_v/ℚ_p and K_v/F_v unramified (δ and D units) before saying that every factor in (c) equals 1. It adds that for n = c = 0 with K_v ramified, (c) gives α(W₀)β(f) = |D|^(1/2), which also follows from (a)·(b).

## H12 (rwst) — applied differently
The §6.31 Check now names the coefficient e_s(3, Ny/δ)·r_A(1) of the explicit Fourier-kernel setting, the combined Eisenstein coefficient of the trace, against 2e_s(3, Ny/δ). It is no longer attributed to E^(1)_s. The finer claim that this coefficient comes from the E^(−7)_s component was not verified from GZ IV (1.2)–(1.3) and is not asserted.

## H13 (rwst) — applied
The §7.47 Check "would give 9 instead of 3" now reads: an unnormalized inner sum would multiply by #C_U, a level count unrelated to V = 2L(1,η).

## H14 (rwst) — applied
§4.7 now fixes the local measures of CST §2:
- da is self-dual for ψ_v, and d^×a = L(1,1_v)da/|a|_v;
- the three d^×x conventions for F_v², a quadratic field and a quaternion algebra;
- Vol(GL₂(O_v)) = L(2,1_v)⁻¹|δ|², and Vol(O_(B_v)^×) = L(2,1_v)⁻¹(q−1)⁻¹|δ|² for B_v division.

These come from cst lines 808–821 (p. 13) and line 1453 (p. 23). γ is now defined for division B_v, and the Assume clause points to these measures.

## H15 (rwst) — applied
§4.7 now defines W₀ in two cases:
- Nonarchimedean v: W₀(g) = |δ|^(−1/2)W♮(diag(δ,1)g), where W♮ is the AL.2 normalized newvector for x ↦ ψ_v(δ⁻¹x). One checks that W₀ is ψ_v-Whittaker and W₀(diag(δ⁻¹,1)) = |δ|^(−1/2).
- Real v: W₀(diag(y,1)) = |y|^(k/2)e^(−2π|y|) for both signs of y (CST pp. 26–27, cst lines 1652 and 1693).

With L(1,1_ℝ) = 1 this gives (W₀,W₀) = 2Γ(k)(4π)^(−k), which is 1/(8π²) at k = 2, as in the existing Check.

## H16 (rwst) — applied
§5.3 now requires that ⊗_v b_v be the Petersson form for Tamagawa measure of volume 2, and notes that doubling one b_v doubles α and leaves the period product unchanged. It also fixes the completion convention: ζ_F(2) is the complete L(2,1_F) = Γ_ℝ(2)^[F:ℚ]ζ_F(2), and L(1/2), L(1,π,ad) and L(1,η) are complete (CST (2.1), cst line 789; L(s,1_F) at cst line 168).

## H17 (rwst) — applied
§9.15 now defines t_K = w_K·[O_K^×:ℤ^×]·#Cl_K^ram, following Burungale §5.2, (5.8) and Theorem 5.6 (pp. 27–28). Burungale's #U^alg equals w_K, because every root of unity has the form x/x̄ by Hilbert 90. Contrary to JSW's "power of 2", t_K is 18 = 9·2 for K = ℚ(√−3), 8 for ℚ(i) and a power of 2 otherwise. It is prime to p in every case because p splits in K. §§9.11, 9.14 and 9.16 now refer to this definition.

## H18 (rwst) — applied
α(f, f_GL2) is replaced by α(f, f_B) at all four places. §9.9 defines it as the ratio of weight-k Petersson norms, which is the ratio of §9.6 when k = 2.

## H19 (rwst) — applied
§8.14 now states that L(s, A, χ) has no archimedean Euler factors, as in GZ V (2.1), and that it differs from the completed L-functions of §8.11 by those factors. The (2π²)^d figure is not restated.

## H20 (rwst) — applied
The §0.7 outline now cites ArithmeticGaloisRepresentations §2.7 (Weil–Deligne ε-factors with the monodromy factor det(−r(F)|V^I/(ker N)^I), inductivity in degree zero, λ-constants) and GL2AutomorphicRepresentationsAndTransfer R16.0.1. Both are added to *Needs* and to the AL supplier row. ArithmeticGaloisRepresentations is earlier in the merge order.

## H21 (rwst) — applied
§4.1 now takes the archimedean Casselman–Wallach category from AutomorphicFormsOnReductiveGroups §2.7 and AutomorphicSpectralTheory §§0.48–0.49. Both are in its text, its *Needs* and the AF supplier row.

## H22 (rwst) — applied
§3.8 is rewritten on the CNS route. With π: J_Γ → E the Albanese map, ω_f integral on the Néron model (CNS Theorem 5.15, Proposition 6.2) and CNS Lemma 7.1 (π∘π^∨ = [deg φ]), one gets deg φ·ω_E = c_φ(π^∨)^*ω_f, hence v_p(c_φ) ≤ v_p(deg φ); otherwise δ_p as in CNS Theorem 7.2. c_φ is defined on X_Γ. The §3.1 API item now states π∘π^∨ = [deg φ] and functoriality of Néron lattices. §3.6, NeronModelsAndSemistableAbelianVarieties R11.1 and JacobianChallenge Layers E–F are added to *Needs*.

## H23 (rwst) — applied
The owner exists: LubinTateFormalModulesAndQuasiCanonicalLifts, earlier in the merge order. Its LT.3 covers marked deformations and the universal deformation; its LT.6 covers canonical and quasi-canonical lifts, End(H_L), quadratic CM orders and minimal fields. §7.2 and the supplier row now cite both. The filtration End(F_n) = O_L + π_L^n O_D and the lengths n_ℓ are not in that roadmap (no "filtration" target) and are recorded as owned here. That roadmap is a board package at the design stage, so its section labels were read from the board copy.

## H24 (rwst) — applied
§2.11 has a new first API bullet stating the archimedean compatibility. Minus the 2.1 summand at the embeddings over v equals ⟨a,b⟩_v, or half of it at a real place, because |·|_v is the squared absolute value only at complex places. With §2.5 at the finite places this gives h𝒫 = Σ_v ⟨,⟩_v (GZ I (4.2)–(4.3)).

## H25 (rwst) — applied
Castella-exc assumes a_p = 1 throughout (castella-exceptional line 35). §9.5 now states that Theorems 2.10–2.11 use a_p only through 1 − a_p/p and U_p = a_p, and that the case a_p = −1 is proved here. Castella's own Theorem 3.2 for semistable E uses exactly that case (castella-multiplicative lines 433–437). §9.12 points to §9.5 for a_p = −1.

## H26 (rwst) — applied
Downstream consumers is rewritten by roadmap name:
- HeegnerPointEulerSystems, with the sections it imports: Layer 0a, §0.5, Layers 3, 4 and 5, §8.11 and §§9.10, 9.14, 9.20, 9.22.
- EffectiveClassNumbers §2.8 and ModularIwasawaMainConjectures (§§0.4, 3.1, 3.5, 3.7, 3.10).

The names "Rank zero and one BSD", "Semistable Selmer parity", "Cyclotomic p-adic heights" and "supersingular BSD" exist in no roadmap and are removed; so are the RankZeroOneBSD references in the Scope section, §8.19 and §8.20. On gap:integral-family-logarithm the boundary is stated: the family logarithm and explicit reciprocity on Iwasawa cohomology is a Perrin-Riou regulator statement, not a target here, and its regulator inputs are PadicHodgeRegulators §§8.17–8.22, which HeegnerPointEulerSystems already cites. That roadmap's contract text has to change accordingly; it is a separate pull request.

## H27 (rwst) — applied differently
This follows H04. Ownership moves to this roadmap rather than importing EffectiveClassNumbers §2.8. Importing §2.8's Heegner points while EffectiveClassNumbers imports §§8.15/8.19 would be a supply cycle. The Scope section now says that §0a.2 constructs the cyclic CM pairs, their trace and inverse-ideal action for every proper invertible order, the maximal order included.

## H28 (rwst) — applied
- §0.1 now imports h_x = 2h_(O) (HeightsRationalPointsAndObstructions §0.19 Check) and the identification of B_x (§0.21) and owns only the 2^(−r) Gram comparison and the field bookkeeping.
- §1.1's identity h𝒫(x,φ_L y) = ĥ_L(x+y) − ĥ_L(x) − ĥ_L(y) is marked as §0.21's Poincaré comparison.
- §1.3 imports §§0.19 and 0.21 and owns the Abel–Jacobi sign and the regulator.

## H29 (rwst) — applied
§2.3 now keeps only i_*μ_ad and its mass. Potential scaling, model curvature and base-change subdivision are taken from TropicalAndBerkovichArithmetic §§6.7–6.8 and 2.13, and the retraction from §2.7, which is added to *Needs*. The three restating API names are removed, and the Scope sentence is adjusted.

## H30 (rwst) — applied
§3.7 now applies NeronModelsAndSemistableAbelianVarieties §6.4d (`SemistableQuotientCotangent`) to the optimal quotient. It needs e = 1 < p−1 and semistability at p because p² ∤ N. Rational singularities give ω_f in the Néron lattice (CNS Theorem 6.12, Corollary 6.14, cns lines 239–242), and ω_f is primitive there (Remark 5.16, cns line 2026). The invented slug `R07.1/raynaud-uniqueness` is removed.

## H31 (rwst) — applied
§8.17 now imports the height formula inside the scope of ArithmeticStatisticsPartVI, "Heegner logarithm and low rank", with its marked divisor, quotient and isogeny; §8.8 identifies the classes. §8.17 owns the formula outside that scope: A_f of any dimension and no Selmer, residual or ordinary hypothesis. The reverse direction (Statistics citing §8.17) would make a cycle with this roadmap's import of Statistics' marked divisors, so it is not taken.

## H32 (rwst) — applied
§9.20 now imports PadicHodgeRegulators §1.9 (H¹_e = H¹_f = κ(A(K_v)⊗ℚ_p) and log_BK∘κ = log_A at good reduction) and SelmerIwasawaCohomology §4.26, and owns the Heegner and differential specialization. The same defect as H01 was repaired on the pattern level: the contract `gap:point-kummer-logarithm` had no supplier for its semistable part (PadicHodgeRegulators has no such target), so it is deleted. §9.5 now owns κ∘exp_A = exp_BK at arbitrary reduction (Bloch–Kato, Example 3.10.1). The README now contains no `gap:` contract.

## H33 (rwst) — applied
MetaplecticAutomorphicForms §6.22 does construct the nonsplit toric Shimizu contraction and unfolding. §5.1 and §5.3 now import the division case from it (`toricTheta_pairingComparison`) and own the split case only.

## H34 (rwst) — applied
The weight-two content of GZ (6.2)–(6.5) is removed from §6.1. §6.1 now keeps the projector definition, the weight 2k > 2 coefficient formula (5.1) and the Colmez growth domain, and points to §6.55 for weight two. The (6.2) locator is dropped from §6.1.

## H35 (rwst) — applied
§7.64 stated no identity and nothing cited it, so it is deleted.

## H36 (rwst) — applied
The §9.18 outline now routes the cotangent step through §9.1 over ℤ_p, the good-reduction case of §6.4d. §9.1 and §9.6 are added to its *Needs*, so §9.1 has the consumer that Scope announces.

## H37 (rwst) — applied
Layers 2–5:
- The §2.5 compatibility item has moved into §2.9's API, and §2.5 no longer needs §2.9.
- The resolvent-mean statement and its Check have moved from §2.9 to §7.11; §2.9 keeps a generic mean-constant statement.
- §6.1's dependence on §§6.18–6.19 is gone (H34).
- §6.2 defines p_(k−1) inline.
- §6.18 no longer cites §6.37.

## H38 (rwst) — applied
Layer 6:
- GZ (6.1)–(6.4), A(N₁), B(N₁), α(M) and β(M) are displayed once, as the new Classical setting 8 in the Conventions; §6.55 refers to it.
- §6.57 no longer cites §7.25.
- §6.31's Check now uses the Conventions characterization instead of §6.41, and its *Needs* gains §§6.29–6.30.
- §6.56's *Needs* now lists §§6.57 and 6.61 explicitly.

The sections are not physically reordered.

## H39 (rwst) — applied
Layer 7:
- §7.4 defines Σ(σ,χ) through §4.2 and no longer derives a consequence from §8.1.
- §7.24 cites Gross–Zagier III (7.3)(2) as §7.59 and adds §7.59 to *Needs*.
- §7.47 item 4 now says i₀ "as in 7.28".
- *Needs* now name the later dependencies explicitly: §7.39 (7.43, 7.57, 7.58), §7.44 (7.58) and §7.45 (7.62). §7.68 → 7.79 and §7.71 → 7.82 were already explicit.

Within-layer order is still not renumbered. Explicit *Needs* make the dependency checkable, and a renumbering of Layer 7 would break every internal anchor.

## H40 (rwst) — applied
- §8.1's *Needs* now include §8.12.
- §8.8's reference to §8.9 is reworded as a pointer to its consumer; making it a dependency would create a cycle.
- §8.9's *Needs* include §8.10.
- The labels (gen-H), (H), (good), (split) and (ST) are defined once in a new standing block (A) in the Conventions, so §9.11 no longer depends on §9.15.

## H41 (rwst) — applied
Block (D) now defines S¹ and S² inline, and §7.4 proves their properties. §0a.5 no longer says "checked in 9.9".

## H42 (rwst) — applied
Bare source section numbers are now attributed to their source:
- "as in §7.2", "§7.2 data" and "For compact §7.2 data" become "(Q′) (Yuan–Zhang §7.2)", 11 places.
- "as in §9.2" becomes "Yuan–Zhang §9.2"; "μ-level convention of §8.3" becomes "Brooks §8.3"; "Lemma 7.4" becomes "Yuan–Zhang Lemma 7.4"; "(7.3)(2)" becomes GZ III.

The remaining "§7.2" occurrences are this roadmap's §7.2 or other roadmaps' sections. Bare GZ equation labels such as (2.1) were not all re-attributed.

## H43 (rwst) — applied
`ComplexComparisonPartII:C5/harmonic-projection-green` and "HarmonicGreen" become ComplexKahlerGeometry K5b.1 (on main; K5a–K5b.1 cover compact harmonic and Green theory), identified by ComplexComparisonPartII C5.3. This changes 5 citations and the supplier row.

## H44 (rwst) — applied
The AF slugs now cite sections, checked against the AF headings: GL₂ adelization §7.2, Maass forms §4.5, cuspidal L² realization §4.2, globalization §2.7. Slash actions and Petersson integration are attributed to Mathlib and Tau Ceti.

## H45 (rwst) — applied
`R16.2/casselman-newvector` becomes AutomorphicLFunctionsAndLocalFactors AL.2, "Casselman's newvector theorem".

## H46 (rwst) — applied
`AL.2/normalized-whittaker-newvector` becomes AL.2, GL₂ newvectors, "the normalized Whittaker newvector", whose anchor is `r16-2-normalized-newvector`.

## H47 (rwst) — applied
Each HMV slug now cites its section; all of them are absent from HilbertModularVarietiesAndShimuraCurves at its head:
- `totally-real-uniformisation` → R18.5.15
- `carayol-split-model` → R18.2.6
- `hecke-integral-extension` → R18.2.10
- `canonical-quaternionic-curve` → R18.1.3
- `quaternionic-effective-stabilizers` → R18.1.4
- `arithmetic-hodge-line` → R18.2.12

## H48 (rwst) — applied
`AS.2/automorphic-green` → §2.25, and `AS.2/gz-68` → §§2.23–2.24. The 21 bare `AS.2` citations now cite §§1.25–1.30 and 2.17–2.18 in Layer 6 (Eisenstein families and continuation) and §§2.19–2.25 in Layer 7 (resolvent and Green kernel).

## H49 (rwst) — applied
- A4 `ordinary-serre-tate-coordinates` → A4.10 (`SerreTate.homCriterion`); A1 → A1.2 and A1.3.
- The unflagged A2 and A6 slugs were checked too and are also absent upstream: they now cite A2.2, A2.3, A2.6, A6.4/A6.8, A6.7, A6.12 and A6.13.

## H50 (rwst) — applied
MP slugs: `extended-schwartz-weil` → §5.9; `global-see-saw-and-projection` → §6.15; `quadratic-quaternionic-norm-instances` → §6.16; theta measure normalizations → §6.1; `toric-theta-pairing-interface` → §6.22; coherent and incoherent sections → §§6.7–6.9. Bare MP.5 and MP.7 become Layers 5 and 7.

## H51 (rwst) — applied
ED slugs: `abelian-logarithm` → §4.2, `abelian-integral` → §4.3, `coleman-abelian-comparison` → §4.6.

## H52 (rwst) — applied
`EllipticCurveModularity:R29.5/modular-parametrisation` becomes EllipticCurveModularity Layer R29.5. ModularSymbolsPadicLFunctions `L1/critical-value-algebraicity`, also absent upstream, becomes its Layer 1.

## H53 (rwst) — applied
- "AN.4 genus characters" becomes AnalyticNumberTheoryPartI §2.10.
- The false clause "§0.8 is the different Rankin convolution identity…" is deleted; ANT I §0.8 is "Weighted-prime sum input to the factorial estimate".

## H54 (rwst) — applied
§7.3 now cites ModularCurvesPartII §§3.4, 5.1 and 9.9 (normalized Γ₀ stack, standard levels, full and cyclic isogeny correspondences) instead of §§2.1–2.3.

## H55 (rwst) — applied
`ringClassField` is not in Tau Ceti at the pin; `NumberFieldOrder.Hom.mapPic` is, in `TauCeti/NumberTheory/NumberField/Global/Orders/Functoriality.lean`. §0a.1 now says H_c is `ringClassField` of TauCetiRoadmap.ClassFieldTheory Layer 13.

## H56 (rwst) — answered
The pull-request body is outside this job's edit scope; the worker updates it. The direct suppliers after this round add ArithmeticGaloisRepresentations (#856), SmoothRepresentationsOfLocalGroups (#785), LubinTateFormalModulesAndQuasiCanonicalLifts (design stage) and ComplexKahlerGeometry (main), and remove EffectiveClassNumbers.

## H57 (rwst) — answered
The cycle is between ArithmeticGaloisRepresentations (#856) and NoncommutativeAndEquivariantIwasawa (#1307), both upstream of this roadmap. Neither is editable here, and the merge-order file is not edited by jobs. This roadmap now cites ArithmeticGaloisRepresentations §2.7 (H20), so the cycle has to be broken upstream before merge. depcheck shows no UPWARD or CYCLE line for this roadmap.

## H58 (rwst) — applied
- The duplicated first sentence of the complex-intersection convention is removed.
- In References, the Berkeley copy of the YZZ erratum and the Stanford copy of Conrad are merged into the PKU and SLMath entries as alternative copies.

The §0.1 citation block still lists Müller–Stoll and LMFDB twice with different locators; that duplication was not merged.

## H59 (rwst) — applied differently
Repaired:
- §§3.11 and 3.12 restated §3.9. They are deleted, their two citations redirected to §3.9, and the GZ I §6 and V §2 locators moved to §3.9.
- §6.51 now imports automorphy from §6.20 and proves only the height-series and cuspidality step.
- §7.81 no longer restates the ρ^m expansion of §7.88.

Disputed:
- §7.23 (half count) is not a restatement of §7.3 (the Hom functor).
- §7.37 is the tangent-change formula for §7.19's symbol, not a duplicate.
- §7.55 defines G^m, while §7.36 is its Hecke action.

Not changed in this round: §6.23 against §6.50, §7.30 against §7.12(ii), and §7.70 against §7.80.

## H60 (rwst) — answered
The numbered settings and the blocks (C)–(D) were not merged in this round. Only the false clause of block (G) was fixed (H61), and a new block (A) was added (H40). Merging the two systems means re-pointing every "Assume" line in Layers 6–7.

## H61 (rwst) — applied
Block (G) now reads: D odd, which with (D, N) = 1 from (C) gives (D, 2N) = 1.

## H62 (rwst) — applied
Yuan, Modular heights, Remark 4.4 (yuan-modular lines 2812–2815) has the extra term vanish under YZZ Assumption 5.4 alone. The Conventions sentence and the §7.47 Full-height Check now say this. Statements about the other Hodge pairings are unchanged.

## H63 (rwst) — applied
Every revision-history phrase found in the README is restated as a convention:
- the "[Corrected: …]" bracket (§7.36), now "GZ justify … ; the step uses only …";
- the "corrected reading" (§7.46), now "GZ print …; the convention here is …";
- "(3.5, corrected)";
- "the corrected …" in §§0.7, 6.20–6.21, 6.24, 7.10, 7.51, 7.84, 8.11 and others;
- the §7.35 title, now "CM multiplicity at 𝔹-split, E-nonsplit places", with its two links;
- the two "(correcting [YZZ13 …])" notes, now "differs from …; the one stated here is Yuan–Zhang's".

## H64 (rwst) — disputed
Locators of the form `yuan-zhang line 4334` are the house citation convention for passages: the source id is the key in the roadmap's sources.toml, and N is the line of the recorded text. They sit next to page, equation and lemma numbers, which they do not replace. References now opens with one sentence explaining this form.

## H65 (rwst) — applied
- Edixhoven is now cited in the body: §9.5's semistable model of X₀(pM) at p ≥ 5, Edixhoven §§1.1 and 1.4.
- Bloch–Kato (Example 3.10.1) and Matev have References entries.
- The Amice supplier row separates Mathlib's ℤ_p-only inverse `AbstractMeasure.amiceTransformEquiv` (`Mathlib/NumberTheory/Padics/Measure/AmiceTransform.lean:157`) from PadicMeasuresIwasawaAlgebras §2.5's general inverse.

sources.toml cannot be edited by this job, so the worker must add entries for Bloch–Kato and Matev.

## H66 (rwst) — applied differently
Fixed:
- ĥ in §0.2 is now h_x and h_ℚ, with the canonicalHeightQuadratic restriction.
- "Gram determinant formed from h_(O)" now names the half polar form, at four places.
- `toricHom` → 4.1, `admissibleToricOrder` → 4.4, `waldspurger` → 5.3; `coefficientHeight` now refers to §1.4's own statement.
- "Theorem A.1" → §2.10 (Yuan, Arithmetic bigness, Theorem A.1).
- c_φ is defined on X_Γ (H22).

Not changed: U_n, the s and g overloads, 𝔡 in §7.80, ψ1/ψ2 in §7.52, (O_𝔹)₂, the §7.67 and §7.77 symbols, B versus 𝔹_v, K and E in §9.13(c), L_BDP in §9.14, Z₀(ϕ)_U, and R_𝒞 in §7.98.

## H67 (rwst) — applied differently
The §8.13 Assume clause for the unasserted finite-character converse is deleted. The other template fragments ("Assume also …") were not rewritten in this round.

## H68 (rwst) — applied
- §7.1's ring becomes k[ε]/(ε²) with k an algebraic closure of 𝔽₂.
- §7.60 notes that j = 1728 needs D = −4, so it does not occur under (H).
- §7.84 assumes (H).
- §8.2 states the average only when #G is invertible, with no 0⁻¹ junk value, and cites HeightsRationalPointsAndObstructions §1.7.
- §8.19 defines P_(O_K) and restricts ĥ_K = canonicalHeight to K-points.
- §9.15 explains 2^(#S_f): it is Brooks's C(f,χ) (brooks line 1836) and Burungale (5.10), and JSW (5.1.a) is the case S_f = ∅.
- §§6.11 and 6.28 replace "checked separately below" by S₂(SL₂(ℤ)) = 0.
- §9.17 already cites BDP Theorem 5.13, §5.3, p. 1137, as its main locator, so that item needed no change.

## H69 (rwst) — applied differently
Added: §7.47 (0a.4, 6.8, 6.38, 6.56, 7.28), §8.1 (6.57), §7.102 (6.54, 6.60), §7.109 (6.46), §6.28 (ModularCurvesPartII §§9.1, 9.9–9.10), §2.9 (2.5) and §3.8 (H22). The Layer 0a and 0 Dependencies and the *Needs* of §§2.1, 2.4, 2.6, 2.12, 3.1, 6.66, 6.70 and 7.4 were not changed: the review names no missing item for them.

## H70 (rwst) — applied differently
- The module docstring now says the file "is not the roadmap and is not exhaustive".
- "remain in the README until those carriers exist at the pins" becomes "are stated as README targets".
- The theorem docstring and README §0.2 now state that the restriction along P ↦ 1 ⊗ P is Tau Ceti's `canonicalHeightQuadratic` (`TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight/Basic.lean:341`).

The Lean statement itself keeps the pointwise form, which is equivalent by `canonicalHeightQuadratic_apply`. Rewriting it through `QuadraticMap.restrictScalars ℤ` would add scalar-tower instance goals without changing the content.

## Build and gate

- `lake build TauCetiRoadmap.GrossZagierAndArithmeticHeights.Suggested`: Build completed successfully (8981 jobs). The only warning is `Suggested.lean:39:8: declaration uses 'sorry'`.
- Gate: `gate GrossZagierAndArithmeticHeights: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck (`--movable`): `depcheck: 55 roadmaps, 642 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- `roadmaps resolve` on the README: no cross-roadmap citations found nowhere, and no Lean names found nowhere. The seven earlier leads (`CanonicalModel.special_action`, `SerreTate.homCriterion`, `idealAction.picardEquiv`, …) are target names of ShimuraVarieties, AbelianSchemesAndArithmeticModuli and ComplexMultiplicationAndExplicitReciprocity at their heads, confirmed with `roadmaps grep`.
- Signatures: the one declaration, `canonicalHeightRat_exists_unique`, has an unchanged type; only its docstring changed. Its elaborated type in `scratch/signatures.md` keeps all binders (`[Field K] [Height.AdmissibleAbsValues K] [DecidableEq K]`, `[IsElliptic]`) and matches README §0.2. No new `#check` run was needed, because no signature changed.

## Ownership and sources

- §7.46a and §9.5's arbitrary-reduction exponential comparison are new owned content. Searches on main, the open heads (`roadmaps grep`) and the board packages found no other owner: HilbertModularVarietiesAndShimuraCurves stops at maximal division level, and PadicHodgeRegulators covers good reduction only.
- No Suggested.lean declaration uses another roadmap's qualified name.
- Bloch–Kato (1990) and Matev were not fetched, and sources.toml (not editable here) needs entries for both. Bloch–Kato is paywalled and would be recorded as uncertified. No `needs-references.toml` was written: every claim edited this round was checked against texts already in the cache.
- No suspicious instructions were found in the review text.

## Adversarial pass on changed statements

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §2.1 embedding weights | L imaginary quadratic; L = ℚ | complex place: 2 embeddings × g = 2g; real: g | consistent with ArakelovGeometry ½G = g per embedding | rule rewritten |
| §7.58 Check | D=−7, N=2, p=m=3 | #Aut(x̄)=4; ½·4=2; GZ (9.7): r(15)=0, r(9)=1, r(3)=0 | value 2 | Check fixed |
| §6.69 constant | k=1, 2, 3 | 8π²/√\|D\|; both 64π⁴/\|D\|^(3/2); 2048π⁶/24 vs 4096π⁶/24 (ratio 2) | printed agrees for k≤2 only | restricted to k=1 |
| §6.22 shells | v inert; v(D_v)=1; ℚ(i) at 2 | ranges empty, empty, {1} | Check restricted | added the counterexample |
| §4.7 W₀ adapter | ψ_v of conductor δ⁻¹ | W₀(n(x)g)=ψ_v(x)W₀(g); W₀(diag(δ⁻¹,1))=\|δ\|^(−1/2) | holds | adapter added |
| §4.7(d) norm | k=2, d^×a with L(1,1_ℝ)=1 | 2Γ(2)(4π)^(−2)=1/(8π²) | matches Check | measures fixed |
| §4.7 n=c=0, K ramified | (a)·(b) and (c) | αβ = \|δ\|^(−1/2)·\|Dδ\|^(1/2) = \|D\|^(1/2) | consistent | Consequence restricted |
| §5.3 b_v scaling | b_v → 2b_v at one v | α doubles; P·P unchanged | normalization required | stated |
| t_K | generic K; ℚ(i); ℚ(√−3) | 2·1·2^a; 4·2=8; 6·3=18 | not always a power of 2; prime to split p | defined |
| §7.46a Checks | q=2 division algebra; t=s²; blow-up; D=−7 | 12 vs 3; length 2 → 2/e=1; (x̃+E)·ỹ=1; j=−3375 | hold | new target |
| §3.8 route | 11a3 (c=deg=5) | v_5(c)=1 ≤ v_5(deg)=1 | holds | rewritten |
| §3.7 route | p odd, p∥N | e=1<p−1; rational singularities (CNS 6.12(i),(ii)) | holds | rewritten |
| §8.15 c=1 | GZ (6.3)–(6.4) | L′=8π²(f,f)/(u²√\|D\|)·ĥ_K with μ=0 | matches display | route added |
| §6.31 Check | 37a1, D=−7, s=2 | (4π)^(−3)·37²·Γ(3)=1369/(32π³) | matches | reference changed |
| §7.1 Check | k[ε], char 2 | (1+ε)³=1+3ε=1+ε | holds over alg. closed k | ring fixed |
| §2.11 compatibility | real and complex v, b=div f | ⟨a,div f⟩_v = Σ log\|f\|_v (real), Σ log\|f\|² (complex) | consistent with 2.5 and GZ I (4.2) | bullet added |
| Block (A) labels | (N,D_K)=1 | (gen-H) reduces to (H) | consistent with §§9.9, 9.15 | block added |
