<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/979#issuecomment-6375467915 -->
Red team round 1 pass b (claude) of 627bb70

Verdict: changes needed

1. **F01** (P2) gap:integral-chern-calibration asks the supplier's rational chₙ for the value (2πi)^n

   - **Location.** `packages/BorelRegulators/README.md:126`: "Supply s(chₙ)(Hur εₙ)=(2πi)^n for n≥2 and εₙ=(-1)^n clutch(u^n), u=O(-1)−1, with the ordered suspension of CharacteristicClasses C6 item 3". The same sentence is the `needs` in `design/plan.json`. Also :25 and :239, where "suspended twisted Chern character chₙ" is the README's only use of "twisted", and the word is never defined.
   - **Claim.** The contract's chₙ is the supplier's Chern character.
   - **Witness.** `TauCetiRoadmap/CharacteristicClasses/README.md:177, :1463` at d077cb4: Chern–Weil has "no automatic 2π or i rescaling"; chⱼ is "the rational Newton polynomial … normalized by j!". Its suspension pairs rationally. burgos2002 line 1423–1431 puts (2πi)^p only in the twisted character.
   - **Repair.**
     - Replace the needs (README :126 and plan.json `gaps`) by: "Supply s(chₙ)(Hur εₙ)=1 for n≥2, for the rational character chₙ of CharacteristicClasses C6 item 2 and εₙ=(-1)^n clutch(u^n), u=O(-1)−1, with the ordered suspension of CharacteristicClasses C6 item 3 and the (x,y)↦x+iy orientation of TopologicalKTheory T4; equivalently (2πi)^n·chₙ pairs to (2πi)^n."
     - In Conventions (:25), after "TopologicalKTheory’s u=O(-1)−1.", insert: "The twisted character is chₙᵗʷ=(2πi)^n·chₙ, valued in ℚ(n), where chₙ is the rational character of CharacteristicClasses C6 item 2."
     - Write chₙᵗʷ for chₙ wherever the value (2πi)^n is meant: :25, :239, :247, the §2.1 Checks and the §4.3 first Check.
     - **Tested.** At n=2, ch(u²)=(−v)²=v², so the rational pairing is 1 and the twisted pairing is (2πi)²=−4π², the §2.1 Check value. At n=3, ch(−u³)=v³ gives rational 1 and twisted −8π³i.

2. **F02** (P2) gap:stable-finite-range: the needs sentence names no map, no group and no conclusion

   - **Location.** `packages/BorelRegulators/README.md:76`: "What ArithmeticKTheory must provide (gap:stable-finite-range): Supply the map-level finite-stage comparison and the conservative bound a−1>4Nq." The same needs is in `design/plan.json`.
   - **Claim.** The one-sentence needs says exactly what is missing, with its hypotheses.
   - **Witness.** a, N, q and the group are undefined in the sentence, and "supply the bound" names no theorem. The conclusion (isomorphism through degree q for Res SL_a) is only in the detail. It is also compound: a comparison and a bound.
   - **Repair.**
     - Replace the needs (README and plan.json) by: "Supply, for every number field F of degree N, a≥2, G=Res_(F/ℚ)SL_a with its standard maximal compact K and every arithmetic Γ⊂G(ℚ), the actual invariant-form map H^q(Lie G,K;ℝ)→H^q(Γ;ℝ), compatible with a↦a+1 and finite-index restriction, and bijective in every degree q with a−1>4Nq."
     - **Tested.** At F=ℚ, q=5 the bound needs a≥22. Borel's range of degrees below (a−1)/4 (borel1977 line 460) already gives bijectivity there. At F=ℚ(i), q=3 the bound needs a≥26, inside Borel's a≥14. So the request is conservative and true.

3. **F03** (P2) gap:cyclic-local-degrees: as written, the needs asks for something impossible

   - **Location.** `packages/BorelRegulators/README.md:112`: "Supply cyclic splitting extensions with full local degrees while retaining Wang’s obstruction for fixed prescriptions." The same needs is in `design/plan.json`.
   - **Claim.** The needs states the deliverable.
   - **Witness.** By Chebotarev, in any cyclic L/F of degree a>1 the completely split primes have density 1/a, so unrestricted "full local degrees" is impossible. The degree, place set and real-place condition are only in the detail, and "retaining an obstruction" is not a deliverable.
   - **Repair.**
     - Replace the needs (README and plan.json) by: "Supply, for every number field F, a≥1, finite set S of finite places and set R of real places (R empty when a is odd), a cyclic extension L/F of degree a with [L_w:F_v]=a for all v∈S and w|v, and every place of R complex in L; the local extensions may vary."
     - **Tested.** Take F=ℚ, a=8, S={2}. With R=∅, ℚ(ζ₃₂)⁺ is cyclic of degree 8 with 2 totally ramified. With R={∞}, the fixed field of {1,15} in ℚ(ζ₃₂) is cyclic of degree 8, imaginary, with 2 totally ramified. Wang's fixed unramified prescription is not asserted.

4. **F04** (P3) §5.2 omits n≥2, and its claim fails at n=1

   - **Location.** `packages/BorelRegulators/README.md:599`: "Transport the free compact-dual homotopy lattice through the suspended character into Vₙ(F). Prove that its covolume for the Cₙ(F)-normalized coordinate measure is (2π)^dₙ·ε(F,n)".
   - **Claim.** The statement holds for every n for which Vₙ is defined. Conventions (:19) define Vₙ at n=1.
   - **Witness.** At F=ℚ, n=1, d₁=r₁+r₂=1, but π₁(SU)=π₁(SU/SO)=0 (homotopy sequence of SO→SU→SU/SO, with SO connected). So the transported lattice is {0} in a line and has no covolume 2π. The package review recorded this.
   - **Repair.** Begin §5.2 with "For n≥2, transport the free compact-dual homotopy lattice…". **Tested.** n=1 is now excluded, and the four Checks at n=2, 3, 5 and imaginary quadratic are unchanged.

5. **F05** (P3) Two *Needs* lines omit the pinned inputs they use

   - **Location.**
     - `packages/BorelRegulators/README.md:595`: "*Needs:* §4.3; §4.5; §4.2; ArithmeticKTheory §3.4; gap:stable-finite-range; §4.6."
     - `:368`: "*Needs:* Mathlib `NumberField.discr_ne_zero`; AdelicAlgebraicGroups §§2.4–2.5."
   - **Claim.** Every input is cited.
   - **Witness.** The headline uses `NumberField.IsTotallyReal` (TotallyRealComplex.lean:47), `NumberField.discr` (Discriminant/Defs.lean:36) and `NumberField.dedekindZeta` (DedekindZeta.lean:49). Rank zero uses `nrComplexPlaces_eq_zero_iff` (:52). §3.3's ω↦cω law is `NumberField.prod_abs_eq_one` (ProductFormula.lean:98).
   - **Note.** The package review recorded the §5.1 half of this.
   - **Repair.**
     - At :595 append: "; Mathlib `NumberField.IsTotallyReal`, `NumberField.nrComplexPlaces_eq_zero_iff`, `NumberField.discr`, `NumberField.discr_ne_zero` and `NumberField.dedekindZeta`".
     - At :368 append: "; Mathlib `NumberField.prod_abs_eq_one`".
     - Add to "From Mathlib": "`NumberField.prod_abs_eq_one`, in Mathlib/NumberTheory/NumberField/ProductFormula.lean:98, is the product formula with squared complex absolute values."
     - **Tested.** At c=2 over ℚ, |2|_∞·|2|_2=2·½=1, the first §3.3 Check.

6. **F06** (P3) §3.2's general realization sentence is cited to a lemma that proves one family only

   - **Location.** `packages/BorelRegulators/README.md:329`: "More precisely any finitely supported admissible family of local invariants of denominator lcm a and zero sum is realized by such a division algebra when all infinite invariants are zero. (borel1977, Lemma 2.2…)".
   - **Claim.** Borel's Lemma 2.2 supports the sentence.
   - **Witness.** borel1977 line 177–195 builds only the class with invariant 1/n at each of n finite places. The general realization is the exact sequence together with period equals index: poonen2017 line 1402–1446 (Theorem 1.5.36(i) and (iv)).
   - **Repair.** After "…when all infinite invariants are zero." insert "(poonen2017, Theorem 1.5.36(i) and (iv), pp.25–26, poonen2017 line 1402–1446, with §3.1)". Keep the Borel locator for the existence sentence. **Tested.** Invariants (1/3,−1/3) are not Borel's family. Poonen (i) gives the class, and §3.1 gives index 3 and dimension 9, the §3.2 Check.

7. **F07** (P3) Polylogarithms cites sections that do not exist here, and this README's bullet does not match the consumer

   - **Location.** `packages/BorelRegulators/README.md:775`: "§4.7 uses §5.1’s rank-zero clause together with IntegralIwasawaTheory §6.0." The consumer is `TauCetiRoadmap/Polylogarithms/README.md:14, :99, :105, :111, :293, :704` at 4696a1a.
   - **Claim.** Consumer and supplier cite the same sections.
   - **Witness.** Polylogarithms :99 and :704 cite "Layers 3–5" for injectivity and covolume and "BorelRegulators §7.1" for even-weight rationality. Its §4.7 never cites IntegralIwasawaTheory. This package has six layers and no §7.1, and injectivity is §2.3.
   - **Repair.**
     - **In this README (:775).** Replace the second clause with: "its gap:borel-period-contract is met by §2.3 (real isomorphism, injectivity after ⊗ℝ), §§5.3–5.4 (integral image lattice, zeta covolume, rational-basis determinant), §5.1 and `exists_pos_rat_dedekindZeta_of_isTotallyReal` (totally real even weight) and §3.4 with gap:classical-tamagawa-proof (Tamagawa input)."
     - **In Polylogarithms (for the operator to relay).**
       - :14, :99, :105 and :293: "Layers 3–5" → "§§2.3, 5.3–5.4". The regulator itself is §§2.1–2.2, the Tate conversion is §5.2 and the Beilinson factor is §6.2.
       - :99, :111 and :704: "§7.1" → "§5.1 (`exists_pos_rat_dedekindZeta_of_isTotallyReal`)".
       - "its Tamagawa input" → "§3.4".
     - **Tested.** Polylogarithms' §4.7 Check at ℚ(√2), n=2: the headline gives √8·ζ_F(2)=π⁴/24, so q=1/24, matching Z₂=24ζ_F(2).
   - **Note.** HabiroRings at bb5d6cb cites no BorelRegulators section, so nothing there needs repointing.

Three P2 findings, all in declared gap contracts, plus four P3 findings. The mathematics I recomputed holds: every Check, every displayed normalization and the three Lean statements. The instance table is under Verified sound. Ownership against the open roadmap pull requests whose files the brief supplied was checked (sibling checkouts, `roadmaps grep`, `roadmaps show`). Board packages were checked in this checkout, and PeriodsAndSpecialValues at its board head.

## Verified sound

**Counts.**

- Declarations read: 3 of 3, plus 6 pinned carriers they use.
- Targets read: 26 of 26, in 6 layers.
- Locators verified: 41 source locators (borel1977 19, burgos2002 14, borel1974 3, deligne_goncharov2005 3, poonen2017 2) and 39 pinned-declaration locators (Mathlib 24, Tau Ceti 15).
- Checks: all 110 bullets read, with every numeric value recomputed.
- Sibling citations checked: 64 (53 supplier sections and 11 consumer references).

**Elaboration.** A scratch copy of `Suggested.lean`, with `#check @name` appended for the three declarations, was elaborated once in an environment at the manifest pins. It exited 0 with exactly the three expected `sorry` warnings. The elaborated types are:

- `period_eq_index : ∀ F [Field F] [NumberField F] (A : CSA.{u,u} F), orderOf (mk A) = index F ↑A`
- `exists_divisionAlgebra_split_at_infinity : … 1 ≤ a → ∃ D (DivisionRing) (Algebra) (IsCentral) (FiniteDimensional), finrank F D = a^2 ∧ (∀ σ:F→+*ℝ, IsSplittingField F D ℝ) ∧ (∀ σ:F→+*ℂ, IsSplittingField F D ℂ)`
- `exists_pos_rat_dedekindZeta_of_isTotallyReal : … [IsTotallyReal F] (n), 2 ≤ n → Even n → ∃ q, 0 < q ∧ ↑√|↑(discr F)| * dedekindZeta F ↑n = ↑q * ↑π ^ (n * finrank ℚ F)`

They agree with README §§3.1, 3.2 and 5.1. There are no defs or instances, so no section binder can be lost; nothing changed. Imports: `import Mathlib` plus two existing TauCeti modules. `IsSplittingField` (Splitting.lean:120) comes in through Index.lean. There is no `set_option`, no `lemma`, and no process or pull-request text in the README or docstrings. `git diff --stat origin/main...HEAD` touches only `packages/BorelRegulators/`.

**Dependency check (exact output).**

```text
depcheck: 28 roadmaps, 244 edges, 0 problem(s)
```

**Gaps.** All 12 slugs, suppliers and needs agree verbatim between `README.md` and `design/plan.json`; none has supplier none. Read at the supplier heads, none is already provided, apart from the settled ETUTC item below. In particular, the pinned Tau Ceti has `index_dvd_deg` but no divisibility of splitting degrees, and ArithmeticKTheory §3.2 covers Dedekind rings, not orders.

**Suppliers verified at their heads or on main.**

- GeneralAlgebraicKTheory §§2.5, 3.2, 3.12, 7.7, 7.8.
- StableHomotopyKTheory §§2.3–2.5, 3.37, 4.14.
- ArithmeticKTheory §§3.2–3.4: §3.3 odd-degree surjectivity; §3.4 `borel_rank_order` for every order.
- ALS.F.5, ALS.0.4–0.9, ALS.5b.1; AutomorphicFormsOnReductiveGroups §§1.1–1.3.
- AdelicAlgebraicGroups §§1.2, 1.4, 2.2–2.5, 3.4 (SL₁(D) compactness), 4.2.
- ClassFieldTheory Layers 5 and 10; SemisimpleAlgebras Layer 6.
- ArithmeticGaloisDuality R02.4.5b, R02.4.6.
- LFunctions Layer 3; IntegralIwasawaTheory §6.0.
- CharacteristicClasses C5a.2–C5a.5 and C6 items 2–3 (ch(u)=−v); TopologicalKTheory T4 (β=[O(−1)]−1, (x,y)↦x+iy) and T7 item 1 (c(a)=2u², c(b)=u⁴).
- DifferentialGeometry Layers 5, 6, 8; AlgebraicTopology Stage 5 item 5; SchemeKTheoryOperations §6.8.
- MotivicEtaleKTheory board target, Final targets 2, 3, 5, 6.

**Ownership.** By object, I searched main, the open heads and the board packages for: the Borel regulator and its lattice, period equals index, the existence of division algebras, Siegel–Klingen-type even values and Tamagawa number one. No `Suggested.lean` elsewhere declares these names. The only other owners are those in the settled item below.

**Settled, not re-raised (MERGE-ORDER in the last repair report; maintainer placement).** The last repair report's reason holds, because these points turn on placement in ORDER.txt:

- ColemanIntegration §L3.Fc.1 (ae078af) still proves the lattice theorem.
- HeightsRationalPointsAndObstructions §3.6 (82cf8af) derives period equals index inline.
- PeriodsAndSpecialValues PS.3.2a (board head 9f14c68) still builds the number-field regulator, its factor 2 and the Adams weight.
- All three precede this roadmap in ORDER.txt: lines 155, 157 and 200, against 224.
- EndoscopicTransferAndUnitaryTraceComparison §6.2 (40d60b6, line 166) states τ=1 for every simply connected semisimple group, which overlaps gap:classical-tamagawa-proof.

**Instance table** (values on each side):

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| `period_eq_index` | ℚ: M₂(ℚ); (−1,−1); (−1,3); degree 3 with (1/3,−1/3) | orderOf 1, 2, 2, 3; index 1, 2, 2, 3 | true |
| `exists_divisionAlgebra_split_at_infinity` | ℚ, a=1: ℚ; ℚ, a=2: (−1,3); wrong model (−1,−1); ℚ(i), a=3 | finrank 1, 4, 4, 9; ℝ-split yes, yes (3>0), no; ℂ-split always | true; Hamilton excluded by ℝ clause; a=0 by ha |
| `exists_pos_rat_…isTotallyReal` | ℚ, n=2 and 4; ℚ(√5), n=2; ℚ(√2), n=2 | √Δζ = π²/6, π⁴/90, 2π⁴/75, π⁴/24; q = 1/6, 1/90, 2/75, 1/24 | true |
| dₙ convention | ℚ, n=2, 3; ℚ(i); real quadratic | (0,1); (1,1); (0,2); borel1977 line 137–139 with m=n−1 | true |
| §1.1 Vₙ, Cₙ | ℚ(i), n=2, 3; Tate generators | (t,−t), (t,t); sup norm 2π vs coordinate 1; −4π²↦1 | true |
| §1.2 R, T | ℚ(i)/ℚ, n=2, 3; real quadratic | T(t,−t)=0; T(R t)=2t; T(a,b)=a+b | true |
| §1.3 ζ* | ℚ, n=2, 3, 4; ℚ(i), n=2; ℚ(√5), n=2; n=1 | ratios −1/2, −1/4, 3/4, −1/2 (−G/(6π) vs G/(3π)), 5/4 (1/30 vs 2/75); at n=1, order 0 ≠ d₁=1 | true for n≥2 |
| §2.1 Boₙ | n=2, 3 | twisted −4π², −8π³i; rational pairing 1 | R01 |
| §2.2, §2.3 | ℚ, n=2, 3; ℚ(i); real quadratic | ranks (0,0), (1,1), (1,1), (2,2); tr∘res = 2 | true |
| §3.1 | (1/2,1/2); (1/3,−1/3); 8 at 2 over ℚ | period=index 2, 3; Wang obstructs the unramified prescription only | true |
| §3.3 | ℚ(i), h=3; ω↦2ω | 4^(−3/2)·2³=1; 2·½=1 | true |
| §3.4 | (−1,3) at 2, 3, ∞; norm-one torus | (−1)^(1·1)=−1, (−1/3)=−1, +1; torus lattice ℤ, τ=2 | true |
| §3.5 | SL₂(𝔽₂), SL₃(𝔽₂); ω=2ω_std | 6/8=3/4; 168/256=21/32; 3/8, correction 1/2 | true |
| §3.6 | ℚ(√5), a=2; index-3 level | 5^(3/2); 3·(1/3)=1 | true |
| §4.1 | Λ(x₃,x₅); k[u₂] | dim H⁸=1, Q⁸=0; Q⁴=0 | true |
| §4.2 | q=1, 2, 3, 5 | i, −1, −i, i (Borel j_Γ=i^m μ̄, borel1977 line 322–326) | true |
| §4.3 | ℚ, n=2, 3; ℚ(i), n=2 | π², π³; π⁴ and 4^(−3/2)=1/8 (Borel 5.4) | true |
| §4.4 | (N,j)=(1,1), (1,2), (2,1); a=17 | dimensions 3, 8, 6; factors 2, 9, 4; b=4, I₁₃, det Nrd²=1 | true |
| §4.5, §4.6 | ℚ, n=2, 3; ℚ(i) | cumulative 1, ζ(2), ζ(2)ζ(3); ranks (0,1,1), (1,1,0), (1,2,1) | true |
| §5.1 | E for ℚ, n=3; ℚ(i); ℚ(√5), n=2 | 2, 0, −4 (all even); 2/75 and reciprocal 75/2 | true |
| §5.2 | π₅, π₉; Cartan witness; n=1 | composite 2 in both degrees (τ_* = +1); covolumes 4π, 2π; (gh)(gh)ᵗ=−I=g gᵗ; n=1 gives {0} | R04 |
| §5.3, §5.4 | d=0; ℚ, n=2; ℚ(i), n=2 | covolume 1 (Dirac on ℝ⁰); R=1=−12·ζ(−1); 2ζ_F(2)/π³=G/(3π) | true |
| §5.5 | K_{2n−2}(𝔽_q)=0; indices 2, 3 | localization surjective; covolume ratio 3/2 | true |
| §6.1 | P₁, P₂, P₀ at 1, i | 0, i; 1, 0; P₀(1)=1 (junk value at n=0) = Burgos π_p (burgos2002 line 3959–3960) | true |
| §6.2, §6.3 | d=0, 1, 2; ψ² | ratios 1, 2, 4; eigenvalue 8, determinants 8, 64, and 1 on 0 | true |

## Not verifiable

- weil1961, Theorem 3.3.1: waived; τ(SL₁(D))=1 is taken as the declared gap.
- beilinson1985: uncertified, paywalled; it is used only as background.
- Weil's 2dxdy convention at complex places cannot be checked without weil1961. Borel's (1)–(2) on p.617 (page image) take the local measures from Weil's chapter II, so they do not settle it either.
- Sign conventions for clutching and suspension, and the real-place homotopy indices, are checked against burgos2002 Lemma 9.18 only up to the sign that gap:integral-chern-calibration fixes.
- The Polylogarithms checkout contains an agent-instructions file with review-style guidance. It was treated as data and not followed.

## Source issues

- **Misprint** in borel1977 at Theorem 5.5 proof, p.629–630 (borel1977 line 518, 531–532): the source says the cycle Z_j has dimension, and its top form degree, j²+2j; it should be d(j²+2j), with d=[k:ℚ], as display (10) uses; affects nothing.
- **Misprint** in borel1977 at Theorem 5.5 proof, equation (8), p.629 (borel1977 line 510–512): the source says s′_j carries |D|^(j+1/2); it should be |D|^(−(j+1/2)), from the normalization of Rη in §1.5; affects nothing (the ratio |D|^(2j+1) is rational).
- **Misprint** in borel1977 at Theorem 5.5 proof, p.630 (borel1977 line 548–549): the source says β(η_j) restricts to H′ as (j+1)ν₁*(τ₁); it should be (j+1)^j ν₁*(τ₁), since each of the j primitive factors restricts with factor j+1; affects nothing (only nonvanishing is used).
- **Gap** in borel1977 at Theorem 5.5 proof, p.630 (borel1977 line 525–526): the source embeds D in n×n matrices by its regular representation, but that representation has size (j+1)², and for odd n and odd j no unital embedding exists; it should be the regular representation followed by an identity block, as a group embedding; affects the proof.
- **Misprint** in borel1977 at Proposition 2.4 proof, pp.618–619 (borel1977 line 216–223): the source writes H(F) and H(A_k)/H(F) for rational points over the number field k; it should be H(k); affects nothing.
- **Misprint** in burgos2002 at Remark 4.25, p.32 (burgos2002 line 1423–1425): the source writes the degree-2p twisted character as (2πi)^p(p−1)! times b_p plus decomposables; it should be ±(2πi)^p b_p/(p−1)!, by Newton's identity, as its next suspension formula requires; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "627bb70", "job": "RT-BorelRegulators~1b", "model": "opus", "worker": "fable-rt5"} -->
