<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/131#issuecomment-6322150425 -->
Red team round 1 pass b (claude) of 6f8b9e0

Verdict: needs_changes

1. **F01** (P1) EffectiveDiophantineMethods already owns the enclosures, algebraic values, p-adic balls, Fincke–Pohst, local images and saturation that CN.0, CN.3 and CN.4 plan again

   - Location: `packages/ComputationalNumberTheory/README.md` lines 123–126 ("Downstream roadmaps build on this one … the `2`-Selmer groups … are built on Layers CN.2–CN.4 by the effective Diophantine roadmap"), 0.8, 0.13, 0.14, 3.18–3.23, 3.25, 4.7, 4.10–4.13, 4.26–4.27, and lines 1954–1957 (downstream list).
   - Claim: EffectiveDiophantineMethods is a downstream consumer; this roadmap owns isolated algebraic root certificates, canonical p-adic balls, complex boxes, p-adic ball arithmetic, root isolation, the Fincke–Pohst enumeration, certified local images of the x − T map, the size check, good-odd-prime images, p-saturation and the reduction sieve.
   - Witness: `merge-order/ORDER.txt` line 130 places EffectiveDiophantineMethods before this roadmap (brief: it is a permitted supplier). Its head (content commit 076ace7, `TauCetiRoadmap/EffectiveDiophantineMethods/README.md`) plans the same objects with the same examples and never cites ComputationalNumberTheory: §0.1 `ED0.RealEnclosure`, `ED0.ComplexEnclosure`, `ED0.PadicEnclosure.toPadicApproximation` (canonical `(N, v, s)` record, examples `(5,1) ↦ (1,0,2)` and `(0,2) ↦ (2,2,0)`); §0.2 `ED0.ExactAlgebraicData` with `.ofRat`, `.arithmetic`, `.eq_iff_common_root`; §0.9 `ED0.LocalBallData.add/mul/inv` (precisions `min(N,M)`, `min(N+b,M+a)`, `N−2s`); §1.7–1.8 Fincke–Pohst with checks `fp_identity_one`, `fp_hexagonal`, `fp_centre_half`, `fp_negative_bound`, `fp_box_non_example`; §3.1 `ED3.card_localDescentImage_padic`, `ED3.two_mul_card_localDescentImage_real`; §3.2 `ED3.LocalImageData.span/span_le_range/span_eq_range_of_card/card_span/localCondition_eq_comap` with the examples `y² = x³ − x` at ∞ (abscissae −1/2, 2), the empty datum, and `x = 1/4` at `p = 2`; §3.3 the size check; §3.4 good odd places; §3.17 `ED3.IsPSaturated`, `ED3.isPSaturated_iff`, `ED3.isPSaturated_iff_not_dvd_index`; §3.18 saturation from jointly injective reductions.
   - Repair: make EffectiveDiophantineMethods a supplier. In "Exact supplier contracts" add a subsection citing EffectiveDiophantineMethods §0.1 (enclosures and the canonical p-adic ball record), §0.2 (exact algebraic data, `.ofRat`, `.arithmetic`, `.eq_iff_common_root`), §0.9 (`LocalBallData.add/mul/inv`), §1.7–1.8 (Fincke–Pohst), §3.1–3.4 (local 2-descent images, size check, good odd places) and §3.17–3.18 (p-saturation, reduction sieve). Delete 0.8–0.14 (keep 0.9 only if it adds the `rationalRootCertificate` name as an alias of `ED0.ExactAlgebraicData.ofRat`, otherwise delete), 3.18–3.23, 3.25, 4.7, 4.10–4.13, 4.19, 4.26–4.27 and their Lean mirrors (`AlgebraicRootCertificate`, `algebraic_*_certificate`, `PadicApproximation`, `localImageSpan*`, `IsPSaturated`, `isPSaturated_iff_*`, `saturationSieve_sound`, `complexBoxSet`), or restate each as a `*Needs:* EffectiveDiophantineMethods §x.y` consumer with only the strictly new content (3.24 `mem_nsmul_iff_exists_root` and 3.26 `pSaturationTest` may stay as the exact divisibility test and the terminating test, both citing ED3 §3.17–3.18). Remove EffectiveDiophantineMethods from "Downstream consumers" and from the sentence at lines 123–126. Rewrite the layer-table row of CN.3 and CN.4 inputs accordingly.

2. **F02** (P1) ClassicalArithmeticCompletion Layer 5 (on main) already owns the class-group relation lattice, Minkowski generation, the regulator stopping bound and the joint class–unit completeness criterion that 2.10–2.15 restate; the README inverts the direction

   - Location: `packages/ComputationalNumberTheory/README.md` 2.10–2.15 (lines 989–1046); lines 1967–1968 ("**ClassicalArithmeticCompletion** (Layers CA.5–CA.7): interprets the certified basis, unit and class-group outputs of Layer CN.2").
   - Claim: this roadmap owns `classRelationLattice`, `classNumber_dvd_relation_index`, `minkowski_factorBase_generates`, `units_complete_of_regulator_bound`, `joint_class_unit_bound`, `certified_class_unit_complete`, and ClassicalArithmeticCompletion consumes them downstream.
   - Witness: `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md` on main: §5.1 (line 11130) generation by primes of norm ≤ Minkowski bound; §5.2 (line 11156) `classGroupPresentation`, `relationLattice`, `ClassGroupPresentation.index_relationLattice`; §5.3 (line 11199) "A regulator lower bound establishes a fundamental system of units" (IsMaxRank, R(u) < 2L); §5.11 (line 11453) "Found relations bound the class number from above" (`h_K ∣ |det A|`); §5.16 (line 11595) "The class-number–regulator completeness criterion" (`|det A|·R(u) < 2h*` with `h* ≤ h_K R_K`); §5.22 (line 11751) the same from rigorous intervals. A roadmap on main cannot consume a package.
   - Repair: delete 2.10–2.15 and the Lean declarations `classRelationLattice`, `classNumber_dvd_relation_index`, `minkowski_factorBase_generates`, `units_complete_of_regulator_bound`, `joint_class_unit_bound`, `certified_class_unit_complete`; cite ClassicalArithmeticCompletion §§5.1–5.3, 5.10–5.11, 5.16, 5.22 in the supplier contracts wherever 2.8/2.9 outputs feed a class–unit computation; delete the "ClassicalArithmeticCompletion (Layers CA.5–CA.7)" entry from "Downstream consumers"; rewrite the CN.2 introduction and the layer-table row so that CN.2 ends at prime-ideal decompositions, Newton data and the two local computations.

3. **F03** (P2) The four cited CA.3 target slugs do not exist in ClassicalArithmeticCompletion

   - Location: `packages/ComputationalNumberTheory/README.md` lines 230–232 ("ClassicalArithmeticCompletion CA.3: `hermite-normal-form-certificate`, `hermite-basis-of-a-sublattice`, `index-eq-prod-hermite-pivots`, `smith-normal-form-certificate`"), repeated in *Needs:* of 2.1, 2.5, 2.6, 2.8, 2.11.
   - Claim: these are targets of ClassicalArithmeticCompletion Layer 3.
   - Witness: `grep -c` of each slug in `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md` returns 0; the layer's anchors are `layer-3-topic-N` and its targets are §3.3 (Smith normal form decomposition), §3.25 (Hermite normal form decomposition), §3.27 (index of a full sublattice is the product of its Hermite pivots), §3.48 (every sublattice of ℤᵐ has a unique Hermite basis).
   - Repair: replace the four slugs by "ClassicalArithmeticCompletion §3.25 (Hermite normal form decomposition), §3.48 (Hermite basis of a sublattice), §3.27 (index as the product of Hermite pivots), §3.3 (Smith normal form decomposition)" at line 230 and in every *Needs:* line that cites them; also cite §3.33 (Newton polygon by slope multiplicities) at 2.17 where "ClassicalArithmeticCompletion CA.3's" ordinary Newton polygons are mentioned.

4. **F04** (P1) "AnalyticNumberTheory (Layer AN.4)" is not a roadmap, and the analytic class-number input is owned elsewhere

   - Location: `packages/ComputationalNumberTheory/README.md` lines 115–119 ("**AutomorphicLFunctionsAndLocalFactors** (Layer AL.1) and **AnalyticNumberTheory** (Layer AN.4)"), line 236, line 863 (CN.2 proof obligations), line 1145 (CN.2 Dependencies), layer table row CN.2.
   - Claim: a roadmap AnalyticNumberTheory with a Layer AN.4 supplies the Tate–Hecke continuation and its comparison with the Dedekind zeta function, used for the residue in the hR lower bound.
   - Witness: no folder `AnalyticNumberTheory` exists on main, in Completed, in the merge order or in any open pull request; the merge order has AnalyticNumberTheoryPartI (line 75) and AnalyticNumberTheoryPartII (line 76). AnalyticNumberTheoryPartII Layer 4 (content commit abee65e) is "Lerch continuation, complex Hurwitz zeta and Barnes G"; AnalyticNumberTheoryPartI has §2.15 "Explicit residue bound for Dedekind zeta functions (Louboutin)" (an upper bound). The class number formula at the residue of the Dedekind zeta function is owned by Completed/NumberFieldArithmetic (its README line 9 and line 273, `NumberField.dedekindZeta`).
   - Repair: delete every "AnalyticNumberTheory (Layer AN.4)" / "AN.4" citation. If, after R02, any hR input remains in this roadmap, cite "NumberFieldArithmetic, the class number formula at the residue of the Dedekind zeta function" and AutomorphicLFunctionsAndLocalFactors Layer AL.1 `TateZeta.partialHeckeL_trivial_char` for the identification of the Hecke continuation with the Dedekind zeta function; otherwise drop the AL.1 citation too.

5. **F05** (P3) `set_option` in Suggested.lean

   - Location: `packages/ComputationalNumberTheory/Suggested.lean` lines 32–33: `set_option linter.unusedVariables false`, `set_option linter.unusedSectionVars false`.
   - Claim: file-level options are allowed.
   - Witness: the package rules forbid every `set_option` (file-level or `in`).
   - Repair: delete both lines; silence the linters by naming unused binders `_` and removing section variables not used by the declarations that follow.

6. **F06** (P3) Admitted (`sorry`) examples throughout Suggested.lean

   - Location: `packages/ComputationalNumberTheory/Suggested.lean` lines 133, 179, 244, 248, 252, 289, 306 (three `by sorry` fields), 388, 430, 442, 538, 587, 641, 645, 678, 697, 717, 733, 794, 814, 836, 864, 867, 896, 926, 941, 977, 1010, 1015, 1098, 1124, 1191, 1208, 1227 (the 34 admitted `example`s, including the `⟨…, by sorry, by sorry, by sorry⟩` term).
   - Claim: an example may be admitted.
   - Witness: the package rules allow at most two proved, discriminating examples per kept definition and no admitted examples; a boundary case that cannot be proved yet becomes a named `sorry`'d theorem listed in the README.
   - Repair: for each admitted example either prove it (the decidable ones: `aksParameter`, `AKSIdentities 9 2 0`, `StrongLiar 2047 2` by `decide`/`norm_num`, `IsPSaturated` on `ZMod 2`/`ZMod 3` by `decide`, the interval and `checkNegativeGram` examples by `norm_num`/`decide`, `multiplierRing` membership by `simp`), or turn it into a named `theorem … := by sorry` and add that name to the README's target list; delete the rest.

7. **F07** (P3) Lean names absent from the README, and README API names with no Lean counterpart of the same name

   - Location: `packages/ComputationalNumberTheory/Suggested.lean` declarations `AlgebraicRootCertificate.value_mem_algebraicClosure`, `FiniteFieldPresentation.lift`, `FiniteFieldPresentation.bijective`, `OrderBasisCertificate.lattice`, `OrderBasisCertificate.mul_mem`, `PrattCertificate.nodeOK`, `PrattCertificate.checkList`, `prattBitSizeList`, `RAMExecution.bitCost`, `RAMExecution.bitCost_le`, `RabinCertificate.of_irreducible`, `aksLen`, `aksOrder`, `exists_millerBasis`, `ramArith`, `ramCompare`, `ramDest`; README 0.15 `RabinCertificate.exists_of_irreducible`, 0.8 `AlgebraicRootCertificate.value_spec`, 2.1 `OrderBasisCertificate.order`/`mem_order`, 3.3 `millerBasis`.
   - Claim: README and Lean agree on names.
   - Witness: `grep` of each listed Lean name in README.md returns nothing (17 names); the README's 0.15 name `exists_of_irreducible` and 3.3 name `millerBasis` have no declaration of that name in the file.
   - Repair: add the 17 names to the README API bullets of 0.2–0.5, 0.8, 0.15–0.16, 1.1–1.2, 1.5, 1.11, 2.1 and 3.3 (or rename the Lean declarations to the README's names: `RabinCertificate.exists_of_irreducible`, `OrderBasisCertificate.order`), and state in 3.3 that the Lean mirror is `exists_millerBasis`.

8. **F08** (P3) Downstream list names roadmaps that exist nowhere, and misdescribes two that do

   - Location: `packages/ComputationalNumberTheory/README.md` lines 1978–2000 ("Downstream consumers": PeriodsAndSpecialValues, RankZeroOneBSD, FiniteFieldsAndCharacterSums, LevelOneAutomorphicFormsForClassicalGroups; ComplexMultiplicationAndExplicitReciprocity "(Layer CM.5): enclosure arithmetic and `uniqueInteger_sound`").
   - Claim: these roadmaps consume this one.
   - Witness: no folder with any of the four names exists on main, in Completed, in the merge order or in the open pull requests of the board; ComplexMultiplicationAndExplicitReciprocity (content commit 8b89480) has no "CM.5" label, its Layer 5 is "Reduction, isogeny graphs and mathematical recovery", and its README never mentions ComputationalNumberTheory, enclosures or `uniqueInteger`.
   - Repair: delete the four nonexistent entries and the ComplexMultiplicationAndExplicitReciprocity entry (or replace the latter by a citation of its Layer 3 "Class polynomials and generated class fields" only if that roadmap is amended to consume this one); after R01 and R02, delete the EffectiveDiophantineMethods and ClassicalArithmeticCompletion entries as well.

9. **F09** (P2) Missing easy headlines: `ore_residual_irreducible` (2.20) and `card_padicRoots_eq` (2.23) are Summary headlines absent from Suggested.lean although their carriers exist at the pins

   - Location: `packages/ComputationalNumberTheory/README.md` line 18 (Summary names 2.20) and line 20 (2.23), 2.20 (line 1101), 2.23 (line 1129); `Suggested.lean` lines 1250–1270 (closing list puts both under "stated only in README").
   - Claim: their statements need constructions that are themselves targets.
   - Witness: 2.19's residual polynomial is a light real-bodied definition on existing carriers (`(phiExpansion φ f (s + e*j)).coeff i / p^(u − h*j)` reduced into `AdjoinRoot (φ.map (Int.castRingHom (ZMod p)))`, with `IsPhiNewtonSide` already defined at line 806); 2.20 is then `Irreducible (f.map (Int.castRingHom ℚ_[p]))` under `IsPhiNewtonSide p φ f 0 (h*d) e h d`, `f.map (ZMod p) = (φ.map (ZMod p))^(e*d)` and `Irreducible (residual)`. 2.23 is `Nat.card {x : ℚ_[p] // aeval x f = 0} = Nat.card {P : Ideal (𝓞 K) // P.IsPrime ∧ P ≠ ⊥ ∧ P ∣ span {p} ∧ ramificationIdx = 1 ∧ inertiaDeg = 1}` with Mathlib's `Ideal.ramificationIdx` and `Ideal.inertiaDeg` (both at the pin) and `K := AdjoinRoot f` as a number field.
   - Repair: add a real-bodied `phiResidualPolynomial` and the two `sorry`'d theorems `ore_residual_irreducible` and `card_padicRoots_eq` to Suggested.lean under Layer CN.2, with the hypotheses of 2.20 and 2.23; remove both names from the closing list.

10. **F10** (P3) Recorded library pins are stale and the "after the pinned commit" sentence is false at the manifest pin

   - Location: `packages/ComputationalNumberTheory/README.md` line 164 ("From Mathlib (pinned at `082e2d37e8b0463410cdb532e111cd43d5a66174`)"), line 192 ("From Tau Ceti (pinned at `f790474821cf4256814db967cb154e7af3d0c369`)"), lines 76–82 ("Tau Ceti after the pinned commit adds `NumberFieldOrder.multiplierRing` and `NumberFieldOrder.isIntegral` … and `TauCeti.NumberField.IntegralPrimitiveElement.not_dvd_index_iff`").
   - Claim: these are the pins and those declarations postdate them.
   - Witness: `lake-manifest.json` of the content repository pins Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; at `a91d3aaf`, `git grep` finds `multiplierRing` in `TauCeti/NumberTheory/NumberField/Global/Orders/ProperIdeal.lean` and `not_dvd_index_iff` in `TauCeti/NumberTheory/NumberField/Index/DedekindCriterion.lean`.
   - Repair: replace both commit hashes by the manifest's; rewrite lines 76–82 as "Tau Ceti at the pin provides `NumberFieldOrder.multiplierRing`, `NumberFieldOrder.isIntegral` (…) and `TauCeti.NumberField.IntegralPrimitiveElement.not_dvd_index_iff`", and move them into the Tau Ceti supplier list.

11. **F11** (P3) Mattuck is linked from a third-party course page, and the HRP citation uses a label that roadmap does not have

   - Location: `packages/ComputationalNumberTheory/README.md` lines 2067–2069 (Mattuck link `people.dm.unipi.it/lombardo/NonAbelianChabauty/Mat55.pdf`), lines 120–122 and 237–243 ("HeightsRationalPointsAndObstructions (Layer RP.1)", "RP.1: `#A(F)/2A(F) = |2|_F^(−g)·#A(F)[2]`").
   - Claim: the linked copy is a legal source; HRP has a layer "RP.1".
   - Witness: the sources service resolves Mattuck only to JSTOR (paywalled); the linked host is neither the author's page nor the publisher nor an institutional deposit. HeightsRationalPointsAndObstructions (content commit cec11c9) labels its layers "Layer 0–6"; the formula is its §1.17 `card_quotient_two_padic` ("#(A(F)/2)=|2|_F^(−g)#A(F)[2] … Over ℝ the quotient order is #A(ℝ)[2]/2^g").
   - Repair: cite Mattuck by "Ann. of Math. 62 (1955), Theorem 7, p.114, DOI 10.2307/2007101" without a link (uncertified); replace every "RP.1" by "HeightsRationalPointsAndObstructions §1.17 `card_quotient_two_padic`" (or, after R01, by EffectiveDiophantineMethods §3.1 `ED3.card_localDescentImage_padic` / `ED3.two_mul_card_localDescentImage_real`, which state the elliptic case directly).

12. **F12** (P3) Suggested.lean states 2.22 only for ℚ_p while the README states it for every finite extension L of ℚ_p, and the 3.18 use needs the general form

   - Location: `packages/ComputationalNumberTheory/Suggested.lean` lines 820–824 (`isSquare_iff_isSquare_mod (p) (u : ℤ_[p]ˣ)`); README 2.22 (line 1123, "Let L be a finite extension of ℚ_p"); README 3.18 (lines 1355–1363, "its unit part passes the square test of `isSquare_iff_isSquare_mod` (2.22)" applied in the field factors `K_v[X]/(f_j)`).
   - Claim: the Lean mirror has the README's generality.
   - Witness: the Lean statement is the case `L = ℚ_p`; the field factors of `A_p` in 3.18 are extensions of degree up to 3, where the test needs `4πO_L`.
   - Repair: rename the Lean declaration `isSquare_iff_isSquare_mod_padic` and say in 2.22 that Suggested.lean records the `L = ℚ_p` case; keep `isSquare_iff_isSquare_mod` for general `L` as a README target with LocalFieldsRamification Layer 0 carriers (or state it in Lean over a `[NormedField L] [Algebra ℚ_[p] L] [FiniteDimensional ℚ_[p] L]` with the valuation ring from that supplier once it exists).

13. **F13** (P3) `RabinCertificate`/`FiniteFieldFactorCertificate` in Lean are semantic predicates, not the finite data with a Boolean checker the README defines; `saturationSieve_sound` in Lean is a triviality that does not state 3.25

   - Location: `packages/ComputationalNumberTheory/Suggested.lean` lines 230–238 (`structure RabinCertificate (f) : Prop`), 532 (`rabin : ∀ g ∈ factors, RabinCertificate g.1`), 1029–1035 (`saturationSieve_sound` over arbitrary `ψ : A →+ C i` with `p • c = 0`); README 0.15 (`RabinCertificate.check` Boolean, stored residue and Bézout pairs), 1.22 (`FiniteFieldFactorCertificate.check`), 3.25 (reduction at good primes, kernel intersection ⇒ `V_p = 0`).
   - Claim: README and Lean agree.
   - Witness: no `check` exists for either structure in Lean, and the README never says the Lean records the semantic predicate; the Lean 3.25 hypothesis `∃ y, Σ b_j • g_j = p • y` with `p • c = 0` makes the conclusion immediate for any family of homomorphisms, while 3.25's content (reduction maps `W(ℚ) → W̃(𝔽_q)/pW̃(𝔽_q)` at good primes, and `V_p = 0` from a trivial kernel intersection) is not stated.
   - Repair: either add to 0.15 and 1.22 the sentence "Suggested.lean states the proposition the checker verifies; the stored residue, Bézout pairs and `check` are README targets", or store the data (`residue`, `bezout : ∀ s ∈ primeFactors, F[X] × F[X]`) with a `check : Bool` and the soundness theorem. Restate 3.25 in Lean with the reduction homomorphism of EllipticCurves Layer 4 (or delete the Lean mirror and leave 3.25 a README target).

14. **F14** (P3) Step-by-step algorithms in the README

   - Location: `packages/ComputationalNumberTheory/README.md` 1.28 *Method* (lines 831–839: form `F̃(Y) = a^(n−1)F(Y/a)`, choose a prime, lift to `p^k > 2B`, enumerate subsets, test division, recurse), 4.26 *Construction* (lines 1801–1808: choose `x_(n−1), …, x_0` in turn, budget reduction), 4.18 *Method* (lines 1717–1721), 3.26 *Method* (lines 1436–1443).
   - Claim: an algorithm's steps belong in the specification.
   - Witness: the package rules admit mathematical background and exclude computational algorithms; each of these passages is a procedure, not a statement.
   - Repair: keep each target as the statement a contributor is held to (existence of a certificate, completeness of an enumeration, termination), state its hypotheses, and cut the procedural steps to a one-sentence pointer to the source (LLL82 §3, de Weger §3.6, Siksek §4).

## Dependency-direction gate

Output of `tauceti-roadmap … gate --depcheck packages/ComputationalNumberTheory/README.md --name ComputationalNumberTheory --order merge-order/ORDER.txt`:

```
NOT IN ORDER: ComputationalNumberTheory (insert it after its last supplier)
depcheck: 7 roadmaps, 46 edges, 1 problem(s)
```

No UPWARD or CYCLE line. "NOT IN ORDER" is not a finding (the roadmap has no accepted design and is not yet inserted). The gate resolves only seven roadmap names; the citations of "AnalyticNumberTheory" (R04) and the EffectiveDiophantineMethods/ClassicalArithmeticCompletion direction (R01, R02) are not visible to it because the README lists those two as consumers rather than suppliers.

## Adversarial mathematics pass

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| 0.3 `ramStep` floor division | `3 / (−2)`, zero denominator, negative indirect address | `Int.fdiv 3 (−2) = −2`; errors as specified | none |
| 0.7 magnitude bound | halt trace with stored 7, bounds `C = 6` and `C = 7` | 7 ≤ 0·1⁰+7, 7 > 6 | none |
| 0.14 `PadicApproximation` | `(0,−1,1)` at p = 3; mantissa 3 at p = 3; zero ball `(N,N,0)` | centre 1/3, ball `1/3 + ℤ₃`; mantissa 3 rejected | owner: EDM §0.1 (R01) |
| 0.15 Rabin | `X²+X+1` over 𝔽₂ (X⁴ ≡ X, Bézout `1·(X²+X)+1·f = 1`); `X²+1` over 𝔽₅ (`X²⁵ ≡ X`, gcd = f); degree one `X − a` | accepted / rejected / accepted as claimed | none |
| 0.17 presentation change | 𝔽₃: `(X+2, X+1)` from `X²+1` to `X²+X+2`; 𝔽₇: `(2X,2X)` on `X³−2` fails, `(2X,4X)` works; `X³−2` irreducible mod 7 (cubes are 1, 6) | all three identities hold | none |
| 1.2/1.5 Pratt | `(3,2,[2])` accepted, size `1+2+2+1+1 = 7`; `(9,2,[2,2,2])` rejected | as claimed | none |
| 1.7–1.9 strong liars | n = 9 (liars {1,8}: 4·2 ≤ 8), 15 ({1,14}), 25 ({1,7,18,24}), 49 (6 liars) | bound `4·#L ≤ n−1` holds with equality at 9 | none |
| 1.11–1.13 AKS | n = 2 (r = 2 = n → accept), n = 9 (r = 3, gcd 3), n = 1 | as claimed; loop bound `2·len(n)·⌊√r⌋+1` matches Shoup Fig. 21.1 (Shoup line 21551) | none |
| 1.15–1.17 Pocklington | n = 17, F = 8, a = 3: `3¹⁶ ≡ 1`, `gcd(3⁸−1,17) = 1`, `64 > 17`; F = 2: `4 ≤ 17` | accepted / rejected | none |
| 1.22–1.23 finite-field factors | 𝔽₅: `X²+1 = (X−2)(X−3)`; single factor `X²+1` rejected; zero polynomial | as claimed | none |
| 1.26 Hensel | `X²−2 ≡ (X−3)(X+3)` mod 7 lifts to `(X−10)(X+10)` mod 49 (`100 ≡ 2`) | holds | none |
| 1.28 nonmonic | `2X²+3X+1`: `F̃ = Y²+3Y+2`, factors `X+1/2`, `X+1`, scalar 2 | holds | none |
| 2.3 `IsPMaximal` | p = 1 (no admissible a), R = ⊤ at a prime, R = ℤ ⊆ ℚ | false / true / true | none |
| 2.4 Frobenius nilradical | zero ring (finrank 0), `A = ZMod p` with k = 0 | iff holds | none |
| 2.6 multiplier criterion | ℤ ⊆ ℚ at every prime (`pℤ`, multiplier ring ℤ) | consistent with Stevenhagen Prop. 9.3 (NumberRings line 1125) | owner of 2.10–2.15: CA Layer 5 (R02) |
| 2.13–2.15 stopping bounds | `h = 1, h′ = 0` passes the inequality: positivity of `h′` needed and present | consistent with Mathlib `regOfFamily_div_regulator` (index of `closure u ⊔ torsion`) | delete, cite CA §§5.3, 5.16, 5.22 (R02) |
| 2.16–2.19 Newton data | `X²−3` at 3: side (0,1)–(2,0), residual `Y−1`; `(X−3)²`: residual `Y²+Y+1 = (Y−1)²` mod 3; `X²` has coefficient valuation 0 | as claimed; conventions match GMN Defs 1.6, 1.9 and Cor. 1.20 (lines 314, 385, 713) | none |
| 2.22 unit squares | ℚ₂: 17 (≡ 1 mod 8) square, 5 not; ℚ₅: 6 square; Hensel margin `|4π| < |2w|²` | iff holds for every finite L; Lean only ℚ_p | R12 |
| 2.23 roots in ℚ_p | `X²−2`: 2 roots in ℚ₇ (3² = 2), none in ℚ₂; inseparable f excluded by hypothesis | holds | R09 (state in Lean) |
| 3.3 Miller basis | weights 0, 2 (empty), 12 ({Δ}), 38 (d = 2), all even k < 200 | unitriangular elimination reproduces Kronecker normalisation | none |
| 3.4 congruence Sturm | k = 4, 12 by hand | holds | none |
| 3.6–3.7 Hecke matrices | weight 12, p = 2: `T₂ = −24`; weight 38, p = 79: matrix mod 79 `[[3,17],[25,10]]`, det `−395 = −5·79` | recomputed from q-expansions: identical | none |
| 3.8–3.9 | `a₁₀₇(ΔE₄²E₆)` recomputed exactly | `35830422465487817813321292 ≡ 106 ≡ −1 (mod 107)` | none |
| 3.12–3.13 nonordinary pairs | every prime p < 200, every even 2 ≤ k < p, det `T_p` mod p | exactly the 16 listed pairs; gcd filter gives {79,151,173,193}; p ≤ 79 gives {59,79}; agrees with CG13 table (lines 536–564) | none |
| 3.16 companions | gcd checks for the six pairs; p = 151: T₂,T₃,T₅ twisted-eigenvalue match only at (52,100) with gcd 3 (and the trivial (76,76)) | consistent with the stated correction and CG13 line 556 | none |
| 3.17 point counts | `y² = x³+x` over 𝔽₃ (4), `y² = x³+x+1` over 𝔽₅ (9, trace −3), cusp `y² = x³` over 𝔽₅ (6), `y² = x³+1` over 𝔽₂ (3 vs 4 with `quadraticChar`) | as claimed; odd-characteristic hypothesis necessary | none |
| 3.18–3.19 local images | `y² = x³−x` at ∞ (disc 4, r = 3, N = 2, abscissae −1/2 → (+,−,−), 2 → (+,+,+)); at p = 2 (N = 8, x = 1/4 gives ≤ 2); `y² = x³+1` at ∞ (N = 1) | as claimed; formula `#E(K_v)/2E(K_v) = #E[2]·|2|_v⁻¹` from HRP §1.17 | owner: EDM §3.1–3.4 (R01) |
| 3.21 good odd primes | splitting types (3), (1,2), (1,1,1) → kernel orders 1, 2, 4 = 1 + r_p | consistent | owner: EDM §3.4 (R01) |
| 3.22–3.23 saturation | `6ℤ` at 5 / 2 / 3; `ℤ × ℤ/2` with `G = ℤ × 0`; `ℤ/3` with empty list at p = 2; `ℤ/2` with G = 0 | as claimed; both iff directions checked | owner: EDM §3.17–3.18 (R01) |
| 3.24 divisibility test | P = 0, p-torsion Q (ΨSq_p(x₀) = 0 impossible for pQ = P ≠ 0) | iff holds; converse direction is a restatement | none |
| 3.26 `pSaturationTest` | `y² = x³−x` (r = 0, torsion (ℤ/2)²) at p = 2 and odd p; `g₁ = 2Q`; `(Q, 2Q)` | verdicts as claimed | none |
| 4.1–4.8 intervals | `[−2,3]·[−4,5]`, `[−1,1]²`, `[2,4]⁻¹`, `[−4,−2]⁻¹`, hull of 1/3 at p = 2, of −1/3 at p = 0, unique integer in `[3/4,5/4]`, `[0,1]`, `{1/2}` | all as claimed | none |
| 4.10–4.13 p-adic balls | `(1+O(9))+(2+O(27)) = (2,1,1)`; `O(9)+(1+O(81)) = (2,0,1)`; `O(9)·(1+O(81)) = (2,2,0)`; `O(9)·O(81) = (6,6,0)`; `(3+O(81))·(1/3+O(9))`: precision 3; inverse of `3+O(81)`: precision 2 | all as claimed | owner: EDM §0.9 (R01) |
| 4.14–4.17 CT scalars | all eight expressions against CL Prop. 3.17 (lines 11662–11673) and CT Prop. 4.4 (lines 1557–1562); `r`, `φ` definitions (CL line 11659) | identical; `x r(x)` decreasing for x ≥ 0.773 (CL line 11771) justifies the `α(N+1) ≥ 1` threshold | none |
| 4.18 | `8/π² ≈ 0.8106 ∈ (0.8, 0.82)` | holds | none |
| 4.22–4.24 Platt | H(q) parities and the two ranges | match Platt Theorems 7.1–7.2 (lines 955–978) | none |
| 4.26–4.27 Fincke–Pohst | `I₂, R = 1` (5 vectors); `[[2,1],[1,2]], R = 2` (7 vectors, (1,1) ↦ 6); `t = 1/2, R = 1/4` in dimension one ({0,1}); `R = −1`; `G = [0]` | as claimed | owner: EDM §1.7–1.8 (R01) |
| 4.34 multiplicity lift | blocks (2,3), A = 6, K = [[1,2],[2,4]], t = (2,3): β = [[2,−2],[−2,−2]], value −34; expanded (1,1,1,1,1): 30 − 64 = −34 | identity verified symbolically and numerically | none |

## Verified sound

- Declarations read: all 142 in `Suggested.lean` (59 examples, 107 `sorry` lines, 34 admitted examples, 0 `lemma`); every `variable` block checked against each `sorry`'d signature (number-field, finite-field, interval and elliptic sections carry their instances in the signatures or as instance-implicit binders).
- README targets read: all 128 numbered targets, the layer preambles, conventions, supplier contracts, downstream list and references; 261 Check bullets read, 71 Check values recomputed (table above), 16 nonordinary pairs, the weight-26 coefficient and the weight-38 matrix recomputed independently.
- Build order: every `*Needs:*` input is an earlier target, a pinned declaration or a named supplier section; no forward reference inside the roadmap.
- Pinned declarations: all 46 Mathlib names cited exist at Mathlib `082e2d37` (the README's recorded pin) including `PowerBasis.ofAdjoinEqTop`, `Units.IsMaxRank`, `regOfFamily_div_regulator` (which already states the index of `closure u ⊔ torsion`), `ModularForm.E₄/E₆`, `CuspForm.discriminant`, `qExpansion`, `𝒮ℒ`, `sturm_bound_levelOne_nat`, `dimension_level_one`, the Mahler-measure bounds, `hensels_lemma`, `lucas_primality`, `reverse_lucas_primality`, `quadraticChar`, `Complex.digamma_apply_add_nat`, the division-polynomial degree lemmas; all 30 Tau Ceti names and the six imported modules exist at Tau Ceti `a91d3aaf` (`pointCount`, `frobeniusTrace`, `Affine.A/M/μ/μX`, `ker_μ_eq`, `μX_of_eval_f_ne_zero`, `localRes/localCondition/mem_localCondition_iff`, `selmerGroupA`, `normM`, `card_ker_nsmul_two`, `range_μ_le_*`, `mul_eval_ΨSq_eq_eval_Φ_of_zsmul`, `eq_of_sturm_bound`, the Γ₁ Hecke recurrence, `hasEntireExtension_qExpansion_coeff`, `kernelBasis` and its four lemmas, `map_normUnits_unitFiltration`, `badPrimes`).
- Supplier citations checked: ModularForms Layers 7–11, EllipticCurves Layers 1, 3, 4, 6, 7, LocalFieldsRamification Layers 0–2 (with `TauCeti.map_normUnits_unitFiltration` at its line 683), RealAlgebraicGeometry Layers 1–4, PolynomialGaloisGroups Layer 5, NumberFieldArithmetic Layers 3 and 7 (all on main or Completed, headings as cited); AlgebraicModularFormsAndSerreWeights R15.2 (q-expansion principle, bounded denominators), R15.3 (Hasse invariant, theta), R15.5 (Deligne–Serre lifting) at content commit 256555e; AutomorphicLFunctionsAndLocalFactors AL.1 (`TateZeta.partialHeckeL_trivial_char`, completed Hecke continuation) at 691b4b3; HeightsRationalPointsAndObstructions §1.17 at cec11c9 (label drift only, R11). Defective: CA.3 slugs (R03), AN.4 (R04), EffectiveDiophantineMethods direction (R01), ClassicalArithmeticCompletion Layer 5 direction (R02), ComplexMultiplicationAndExplicitReciprocity CM.5 (R08).
- Locators verified in the text (71): Shoup Theorem 10.3 p.309, Exercise 20.2(a) p.524, Theorems 19.10 p.513, 19.14 p.515, 20.1 p.523, 20.5 p.528, Fig. 21.1 p.550 (loop bound `2·len(n)·⌊√r⌋+1`), Lemmas 21.6–21.11 pp.553–558, §3.2 pp.53–55, §3.6 p.71–72; Platt Theorems 7.1–7.2 pp.14–15; BCG Theorem 2.4 (p.515: `a₁₀₇ ≡ −1`), Corollary 3.2 and Remark 3.3 (p.518, primes 79, 151, 173, 193 and 107, 139, 151, 173, 179), Theorem 2.1; Stein Lemma 2.20 pp.20–21, Algorithm 2.18 p.19, Remark 2.21 p.21, Proposition 2.31 p.24, Theorem 9.18 pp.171–172; GMN Definitions 1.6 p.7, 1.9 p.8, Theorem 1.15 p.11, Theorem 1.19 and Corollary 1.20 pp.14–15; Milne Theorems 7.32, 7.33, Lemma 7.34, Proposition 8.2 (±1 page); Théry Theorems 6.1–6.2 p.9 (6.2's `F₁ > N` misprint correctly flagged as corrected); Siksek (39)–(40) p.17, (41) p.18; de Weger §3.6 and Figure 2; CL Proposition 3.17 pp.304–305 and comments (3); CT Remark 2.11, Algorithm 2.4.4, equation (2.4.4), Proposition 4.4; Stevenhagen (9-2) p.234, Proposition 9.3 p.235, §12 p.247–248; Caruso Proposition 2.1.1 p.II-17, Definition 2.1.2 and Proposition 2.1.3 (2.1), (2.3) p.II-18, (2.5) p.II-19; Arb §§2.3, 3.1, 3.1.2, 5, 5.3; CG13 §§6–7 pp.11–12 and table p.14; Cremona Propositions 3.3.1–3.3.2 and "Checking local solubility"; FPS Lemmas 3–4 pp.16–17; Chvátal pp.3–4; Sutherland eq. (1) p.2; LLL82 (2.13) p.20, 3.3 p.23, 3.5 p.25, 3.6 p.26; Bennett–Siksek Proposition 7.2 pp.374–376.
- Policy: the pull request touches only `packages/ComputationalNumberTheory/` (README.md, Suggested.lean, metadata.toml, review.json); no pull-request numbers or process words in README or docstrings; `theorem` throughout; a single `import Mathlib` plus six existing `TauCeti.*` modules; no `#eval`, `#print axioms`, `True` placeholders or sorry'd data.

## Not verifiable

- Mathlib names at the manifest pin `6b7abb3c` (no local checkout; GitHub not used for bulk grep). They were verified at `082e2d37` and the review reports a clean lean-check at the required pins; any rename between the two commits would surface there.
- Elaboration of `Suggested.lean` (no Lean runs permitted in this pass); the `rfl`/`decide`/`norm_num` examples were checked by hand only.
- 3.14 (a common eigenvector of all Hecke matrices at weight 82 over 𝔽̄₁₀₇) and the full eigensystem congruences behind 3.15–3.16: only the T₂, T₃, T₅ twisted-eigenvalue matches at p = 151 and the gcd conditions were recomputed.
- 4.22–4.24: Platt's datasets and Turing counts (only the theorem statements and ranges were verified).
- Mattuck, Theorem 7, p.114 (paywalled; see `needs-references.toml`); the roadmap's own claim is covered by HRP §1.17.
- Whether EffectiveDiophantineMethods will add a citation of this roadmap in a future revision: at its current head (076ace7) it does not, which is the basis of R01.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "6f8b9e077f17c4839cf9914544c2f9c48b43614e", "job": "RT-ComputationalNumberTheory~1b", "model": "fable", "worker": "chris-f"} -->
