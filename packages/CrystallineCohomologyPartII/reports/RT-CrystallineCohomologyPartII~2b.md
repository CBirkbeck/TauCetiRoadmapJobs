<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13111#issuecomment-6794652684 -->
Red team round 2 pass b (claude) of e5e4857

Verdict: needs_changes

1. **F01** (P2) §1.5 proves descent for the blowup where its own cancellation step needs universal descent; §1.4 is stated only over Y

   - **Location.** `packages/CrystallineCohomologyPartII/README.md:468–469` (§1.5 steps 3–4): "By the composition and cancellation laws (ArcTopologyAndDescent §1.1) it suffices to treat the blowup Bl_J Y → Y" and "it suffices that F(Y′) → `F(X^{n/Y′})` ⊕ F(Z) → `F(E^{n/Y′})` is a fibre sequence for every n". Also `:437` (§1.4 statement).
   - **Claim.** Descent of Bl_J Y → Y′ over Y′ itself suffices for the reduction of step 3.
   - **Witness.** ArcTopologyAndDescent §1.1 (head of its pull request, README line 286): "If g∘f is of universal descent then g is; if f is universal and g is of descent then g∘f is of descent." With X_1 → Y_1 universal and Y_1 → Y only of descent, X_1 → Y is only of descent, and the first law does not give X → Y. Universality needs every base change Y″ → Y′; §1.4 assumes the structure-sheaf fibre sequence, which §1.3 (iv) gives over Y′ only, and Y″ may have dimension > dim Y, so the induction on dim Y does not reach it. BS17 line 2463 states plain descent as the goal and line 2465 uses Lemma 2.10; BS17 line 353 ("By the same argument") covers base changes in Theorem 2.9 only because its excision hypothesis holds for every abstract blowup square.
   - **Repair.**
     - §1.4, add to the statement: "More generally, for every affine Y-scheme Y″ = Spec A″ and every n ≥ 1, with X″ = X ×_Y Y″, Z″ = Z ×_Y Y″, E″ = E ×_Y Y″ (classical fibre products), RΓ(Y″, W(O)[1/F]) → RΓ(X″^{n/Y″}, W(O)[1/F]) ⊕ RΓ(Z″, W(O)[1/F]) → RΓ(E″^{n/Y″}, W(O)[1/F]) is a fibre sequence. The structure-sheaf hypothesis is imposed on the square over Y only; its base change to Y″ need not satisfy it."
     - §1.4, add a route step: "Base change. Tensor the structure-sheaf sequence over A with A″ ⊗^L_A RΓ(X, O)^{⊗(n−1)}; by step 2 with the factors Y″, X, …, X this is the structure-sheaf sequence of the derived square with corners Y″ ×^L_Y X^{n−1}, Y″ ×^L_Y X^n, Y″ ×^L_Y X^{n−1} ×^L_Y Z and Y″ ×^L_Y X^{n−1} ×^L_Y E. Apply the n = 1 argument, remove the derived structure by §1.2 (factors Y″, X, …, X and Z or E), and paste over n, starting from n = 1."
     - §1.5 step 2: replace "argue by induction on dim Y" by "prove by induction on d that every proper surjective X → Y in Sch^fp_S with Y affine of dimension ≤ d is of universal F-descent".
     - §1.5 step 4: replace the first sentence by "By induction E → Z is of universal F-descent. Let Y″ → Y′ be affine in Sch^fp_S, with base changes X″, Z″, E″. Then F(Z″) ≅ Tot `F(E″^{•/Z″})`, and the base-changed form of §1.4, applied to the structure-sheaf fibre sequence of §1.3 (iv), gives the fibre sequences F(Y″) → `F(X″^{n/Y″})` ⊕ F(Z″) → `F(E″^{n/Y″})` for every n; as in the proof of BS17 Theorem 2.9, F(Y″) ≅ Tot `F(X″^{•/Y″})`. A general Y″ is covered by affine opens and F is a Zariski sheaf (§1.1). So the blowup is of universal F-descent, as step 3 requires."
   - **Test of the repair.** Y″ = Y′ gives the present statement. Y″ = Z gives X″ = E″ = E, Z″ = Z and the sequence F(Z) → F(E^n) ⊕ F(Z) → F(E^n), a fibre sequence for trivial reasons. In both cases the induction is applied only to Z, of dimension < d, never to Y″.

2. **F02** (P3) three inputs of proof routes have no `*Needs:*` edge and no supplier contract

   - **Location.** `README.md:307` (§0.7 step 3): "apply SchemeAndStackFoundations §2.6 proper_fibreDimension_vanishing to W_nI … Grothendieck vanishing gives H^i(X, W_nI) = 0 above dim X"; `:301` (*Needs:* of §0.7); `:106` (contract); `:327`, `:420`, `:528` (finiteness and coherence for proper morphisms).
   - **Claim.** Every input of a route is a target, a named supplier section or a pinned declaration.
   - **Witness.** The *Needs:* line of §0.7 and the SchemeAndStackFoundations contract list only "§2.6, qcoh higher direct images". On main, SchemeAndStackFoundations §2.5 owns `noetherianSpace_vanishing`, §2.6 owns `proper_fibreDimension_vanishing`, and §2.6 says finiteness of H^q and coherence of R^qf_\* for proper morphisms are "supplied by JacobianChallenge Layer C". The README names neither §2.5 nor JacobianChallenge.
   - **Repair.**
     - Contract "From TauCetiRoadmap.SchemeAndStackFoundations": add "§2.5, `noetherianSpace_vanishing` (Grothendieck vanishing on a Noetherian space of finite Krull dimension); §2.6, `proper_fibreDimension_vanishing`".
     - Add a contract subsection "From TauCetiRoadmap.JacobianChallenge": "Layer C, finiteness of H^q(X, F) and coherence of R^qf_\*F for f proper over a Noetherian base and F coherent (Stacks, Proposition 30.19.1 and Lemma 30.19.2)".
     - *Needs:* of §0.7 (and the Layer 0 Dependencies): add "SchemeAndStackFoundations §2.5, `noetherianSpace_vanishing`; SchemeAndStackFoundations §2.6, `proper_fibreDimension_vanishing`".
     - *Needs:* of §0.1, §0.8, §1.3, §2.1 and §2.6: add "JacobianChallenge Layer C, proper coherence and finiteness". In §2.1 step 2 replace "(SchemeAndStackFoundations §2.6, qcoh higher direct images with properness)" by "(JacobianChallenge Layer C, proper coherence)".
     - JacobianChallenge is earlier in the merge order; rerun the dependency check after the edit.

3. **F03** (P3) HW23 "Corollary 1.3, pp. 2, 19–20" is not in the text the manifest records

   - **Location.** `README.md:824` (§3.6): "HW23, Corollary 1.3 and its proof, pp. 2, 19–20"; also `:1246`, `:1528`, `:1684`, `:1710`, `:1733`, `:1753`, and References `:1804`.
   - **Claim.** HW23 has a Corollary 1.3 on rational points of rationally chain connected klt fourfolds, proved on pp. 19–20.
   - **Witness.** The manifest entry is arXiv:2009.02631v2 with locator "§2; Corollary 4.6 and proof (v2)". That text numbers its introduction Theorems 1.1–1.5 (HW23 lines 30, 60, 82, 103, 146) and has no Corollary 1.3; no line contains "rational point" or "chain connected"; pp. 19–20 (HW23 lines 836–932) are the proof of Theorem 1.1. The published version was not read.
   - **Repair.** Cite the version read.
     - §3.6: delete the HW23 citation (BBE07 Theorem 1.1 is the source).
     - §6.5, §6.13, §6.14 and the "These results apply to" lines of §5.5 and §6.11: replace "HW23, Corollary 1.3 …" by "HW23, Corollary 4.6, p. 21 (arXiv v2): Q-factorial klt fourfolds with a log resolution have WO-rational singularities". Keep the point-count attribution on the texts that state it: CR12, Corollary 4.4.16, p. 85, and GNT19, Theorems 1.1–1.3, p. 2 (GNT19 lines 51, 58, 68).
     - §6.11: drop "HW23, Corollary 1.3, p. 2" from the locator list.
     - References: delete "Corollary 1.3 and pp. 19–20 are locators of the published version."
     - Alternative: fetch the published version (doi 10.1017/fmp.2023.6) through the sources service, verify the corollary there and record both numberings in the entry's `version_note`.

4. **F04** (P3) manifest status words in four References entries

   - **Location.** `README.md:1816–1819`: "Uncertified publisher text; cited by locator." (Ser58, Ax64, BS83, Tsu04).
   - **Claim / witness.** "Uncertified" is the manifest's status vocabulary, the same class as the wording removed from the HW23 entry by 1b/F08; the entries for Eke84, Kol96, EkeII and Tsu03 at `:1809–1814` already say "cited by its locator without the text".
   - **Repair.** Replace "Uncertified publisher text; cited by locator." by "Cited by its locator without the text." in the four entries.

5. **F05** (P3) the Mittag-Leffler input is a pinned Tau Ceti declaration, cited as a roadmap section that no longer exists

   - **Location.** `README.md:78` (contract "From TauCetiRoadmap.DerivedModuleAlgebra"): "§1.T.1, mittag-leffler-lim-one"; also the *Needs:* lines of §0.1 and §0.7, the routes at `:147` and `:305`, and the Layer 0 Dependencies.
   - **Claim.** DerivedModuleAlgebra §1.T.1 supplies the vanishing of lim¹ for Mittag-Leffler towers.
   - **Witness.** DerivedModuleAlgebra on main has no §1.T.1 heading; its README (lines 28–40) says the tower algebra "is Tau Ceti's" and that citations of §1.T.1 resolve to Tau Ceti declarations. At the pin: `TauCeti.ModuleTower.subsingleton_limOne_of_isMittagLeffler` (`TauCeti/Algebra/Category/ModuleCat/Tower/MittagLeffler.lean:191`), with `isMittagLeffler_of_surjective` (`:104`) and `isMittagLeffler_of_isArtinian` (`:113`) in the same file.
   - **Repair.** Delete the contract subsection "From TauCetiRoadmap.DerivedModuleAlgebra". Add to "From Tau Ceti": "`TauCeti.ModuleTower.subsingleton_limOne_of_isMittagLeffler` in `TauCeti/Algebra/Category/ModuleCat/Tower/MittagLeffler.lean`, line 191 (lim¹ of a Mittag-Leffler tower of modules vanishes), with `TauCeti.ModuleTower.isMittagLeffler_of_surjective` (surjective transition maps) and `TauCeti.ModuleTower.isMittagLeffler_of_isArtinian` (Artinian terms, used for the finite-length groups H^i(X, W_nI) of a proper X)". Replace every "DerivedModuleAlgebra §1.T.1, mittag-leffler-lim-one" by "Tau Ceti `TauCeti.ModuleTower.subsingleton_limOne_of_isMittagLeffler`". Both uses are covered: the surjective tower of §0.1 step 5 by `isMittagLeffler_of_surjective`, the finite-length tower by `isMittagLeffler_of_isArtinian`.

Round 2. One blocking finding (S01, P2) and four P3 findings. All seventeen round-1 findings are repaired at this head; the residue of 1b/F01 that the repair report itself lists as "not addressed in this round" is S01.

## Round-1 findings at this head

| Id | Status | Repaired passage (quoted) and witness |
|---|---|---|
| 1a/F01 (P2) | repaired | `Suggested.lean:48–53`: "Ax's criterion in its point-count form (§6.3) … The pins have the zeta function of a Weierstrass curve only". No stand-in theorem was added. |
| 1a/F02 (P3) | repaired | `README.md:797`: "CT03, Corollary 11.2.6, p. 197, which rests on the coskeleton identity of CT03, Proposition 11.2.5, pp. 196–197". |
| 1a/F03, 1b/F05 (P3) | repaired | `README.md:1588`: "Ser58Top, n° 3 (Opérations de Bockstein) of §1, pp. 27–29". Ser58Top line 1127 (n° 3), line 1146 (printed p. 28), lines 1153–1157 (the criterion), line 1162 (Igusa, torsion in dimension 1). |
| 1a/F04 (P2) | repaired | `README.md:963`: "write ĉl(Z)\|_X for its image in H^c(X, WΩ^c_X) under the map forgetting supports … ĉl(D)\|_X = c_1(O(D))"; Check at `:989` (−dt/t ≠ 0 in k[t, t⁻¹]dt/k[t]dt). |
| 1a/F05 (P3) | repaired | `README.md:639`, `:662`, `:474`, `:494`, `:841`: split and nonsplit nodes separated; recomputed below (q, q + 2; Frobenius ±1). |
| 1a/F06 (P3) | repaired | `README.md:1817`: "BBE07 Proposition 6.3, p. 35". BBE07 line 1475. |
| 1a/F07 (P2) | repaired | `Suggested.lean:56–63`: Ekedahl duality, correspondences (§§4.1, 4.5) and Serre's Bockstein vanishing (§6.8) named as not statable. |
| 1b/F01 (P2) | partly repaired | `README.md:468`: "choose a dense open U ⊂ Y … and a U-admissible blowup Y_1 = Bl_J Y → Y … (gap:reduced-flattening-by-blowup)". The reduction to a blowup is now owned. The same step applies the cancellation law, which needs universal descent of the blowup; step 4 proves plain descent only: S01. |
| 1b/F02 (P2) | repaired | `README.md:1602–1605`, four-step route; recomputed below (criterion, primitivity, ∧² injectivity at p = 2). `exteriorCohomology` exists at the head of AbelianSchemesAndArithmeticModuli §A4.4 with part (1) for every abelian scheme. |
| 1b/F03 (P3) | repaired | `README.md:927`: "For a finite surjective morphism f: X → Y of connected smooth k-schemes (equivalently, f finite and dim X = dim Y, so r = 0)". |
| 1b/F04 (P3) | repaired | `README.md:1513`: "Tau Ceti `TauCeti.AlgebraicGeometry.bijective_cohomologyBaseChange`"; at the pin `TauCeti/AlgebraicGeometry/Cohomology/FlatBaseChange.lean:185`, hypotheses `[Module.Flat R R'] [CompactSpace X] [IsAffineHom (pullback.diagonal …)]`, every `n : ℕ`. |
| 1b/F06 (P3) | repaired | `README.md:264`: "`p^N[b] = V^N[b^{p^N}]` lies in the image of W(A) … so `b^{p^N}` ∈ A"; recomputed below. |
| 1b/F07 (P3) | repaired | `Suggested.lean:67–71`. |
| 1b/F08 (P3) | repaired as proposed; the proposed text leaves S03 | `README.md:1804`: "Corollary 1.3 and pp. 19–20 are locators of the published version." |
| 1b/F09 (P3) | repaired | §0.3 has four distinct Checks (`README.md:222–225`); `README.md:1641` cites BBE07, Remarks 6.6 (ii) (BBE07 line 1553). |
| 1b/F10 (P3) | repaired | `README.md:92–94`; heading "1.1 ferrand geometric pushouts" exists at the head of NeronModelsAndSemistableAbelianVarietiesPartII. |

No repair introduced a false statement. The two gaps added by the repair have the same slug and `needs` sentence in `design/plan.json` and in the README, and are true as stated (table below).

## Dependency check

```
depcheck: 236 roadmaps, 2149 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

## Suggested.lean declarations

Elaborated types read from the supplied signatures (8 declarations; the ninth entry there, `under`, is a word of the module docstring at line 70, not a declaration). No Lean was run.

| Declaration | Context and binders | Instances and values | Result |
|---|---|---|---|
| `card_rationalPoints_modEq_of_cohomologyPullback_bijective` (§6.4 (ii)) | `K : Type u`, `[Field K] [Finite K]`, `X Y : Scheme.{u}`, `πX πY` proper, `f ≫ πY = πX`, bijectivity `∀ i : ℕ` | X = Y = ∅: 0 ≡ 0. X = ∅, Y = Spec K: H⁰ is 0 ← K, not bijective. Blowup of a surface at a rational point: counts differ by q. Fold P¹ ⊔ P¹ → P¹: H⁰ is K → K², excluded; counts differ by q + 1. | true as typed; equals BBE07 Corollary 1.6 (BBE07 lines 195–198) |
| `card_projectiveZeroLocus_modEq_one` (§6.6) | `K : Type*`, `n r : ℕ`, `hF` homogeneous, `hd : 1 ≤ d j`, `∑ d j ≤ n` | r = 0: 1 + q + ⋯ + qⁿ ≡ 1. n = 0 forces r = 0: 1 point. F_j = 0 with d_j ≥ 1: dropping it keeps the bound. x² − ay² on ℙ¹ (n = 1, d = 2 > n): 0 points, excluded. Conics in ℙ²: q + 1, 2q + 1, 1. F = 1, d = 0: excluded by `hd` (0 ≢ 1). | true; equals BBE07 Corollary 1.5 (line 177) |
| `card_dvd_card_solutions_of_sum_lt` (§6.6) | `[Finite σ]`, `s : Finset ι`, `∑ totalDegree < Nat.card σ` | s = ∅: q^{|σ|} with |σ| ≥ 1. σ = ∅: hypothesis false. Nonzero constant: 0 zeros. Ternary nondegenerate quadric over F_9: 81. Derivation from the projective form: 1 − 1 ≡ 0 with ∑ d_i ≤ m − 1. | true; not in Mathlib (`char_dvd_card_solutions_of_sum_lt`, `Mathlib/FieldTheory/ChevalleyWarning.lean:110`, gives p only) |
| `IsThetaDivisor` (§6.9) | `A : AbelianVariety K`, `I : A.toScheme.IdealSheafData`; real body | E, I = O(−P): dual O(P) ample, h⁰ = 1: accepted. 2P and P + Q: h⁰ = 2, rejected. I itself in place of its dual: h⁰(O(−P)) = 0, rejected. dim A = 0: only the unit ideal, Θ = ∅. | determines the object |
| `card_thetaDivisor_modEq` (§6.9) | `[Finite K]`, two theta divisors | g = 1: 1 ≡ 1. g = 0: 0 ≡ 0. 2P versus P + Q (not theta): 1 ≢ 2. | true; BBE07 Theorem 1.4 and the definition at BBE07 lines 166–168 |
| `zeroCycleDegree` (§6.10) | `π : X ⟶ Spec L`, `z : AlgebraicCycle X ℤ`; finsum with `residueDegree` | P¹ over F_q: [x] ↦ 1, [y] (degree 2) ↦ 2, [y] − 2[x] ↦ 0; unweighted sum would give −1. Infinite residue degree gives 0, which does not occur for closed points of a finite-type scheme. | correct |
| `UniversallyCH0Trivial` (§6.10) | `[IsProper π]`, `L : Type u` | ∅: no cycle of nonzero degree, rejected. Spec K′ (degree 2): two geometric points, difference not torsion, rejected. Pⁿ: accepted. Curve of genus ≥ 1: rejected over an algebraic closure of k(C), which lies in `Type u`. `pointsOfDimension` at the pin uses the height in the specialization order, so dimension-0 points are the closed points. | correct; ℚ-coefficient form of Conventions item 9 |
| `card_rationalPoints_modEq_one_of_universallyCH0Trivial` (§6.14 (i)) | `[X.Over (Spec (.of K))] [X.IsProjectiveOver K] [Smooth …] [GeometricallyConnected …]`; `IsProper` from `IsProjectiveOver.isProper` (pin, `ProjectiveOver.lean:77`) | Pⁿ: ≡ 1. y² = x³ + x + 1 over F_5: 9 points ≡ 4, not CH₀-trivial. y² = x³ − x over F_3: 4 ≡ 1 although not CH₀-trivial (no converse claimed). Spec F_{q²}: 0 points, excluded twice. | true; ESN03 Theorem 1.1 and (1.3)–(1.4) (ESN03 lines 52–69) |

Headline theorems of the README: §3.6, §6.2, §6.3, §1.5–1.6, §4.1, §4.5, §5.4, §5.6, §5.12, §6.4 (ii), §6.6, §6.8, §6.9, §6.13, §6.14. The four statable ones are stated; each of the others is named in the module docstring with the missing carrier. No padding: no declaration follows from one library lemma, and the two forms of Ax's theorem differ by the reduction of §6.6 step 4, not by a tactic. No fully qualified name of the file occurs in another roadmap (`roadmaps grep` on the eight names: no match).

## Adversarial pass (computed values)

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| Conventions Checks | W_2(F_2); F_4, F = (σ, 2σ); x² − ay² | FV(1) = 2 ≠ [1]; φ = F² = (1, 4), v_4 = 0, 1; affine 1 = 1 + (q − 1)·0 | hold |
| §0.1 V-sequence, Teichmüller Check | I = (t) ⊂ F_p[t], n = 2 | [t](a_0, a_1) = (ta_0, t^p a_1); V(t) = (0, t) ∉ [t]W_2 | holds |
| §0.2 End Check | Spec F_p | colimit of Hom(Nℤ_p, ℤ_p) = ℤ_p[1/N] = ℚ_p | holds |
| §0.4 (iii) | F_p[t_i]/(t_i^{p^i}), x = (t_1, t_2, …) | F^c x has coordinate t_i^{p^c} ≠ 0 for i > c | negative control holds |
| §0.5 (ii) ⇐ | F_q ⊂ F_{q²}; k[t] ⊂ k[t, s]/(s² − t); F_p[t] ⊂ F_p[t^{1/p}] | no b^{p^N} ∈ F_q for a generator b; s^{p^N} = t^{(p^N−1)/2}s ∉ A; b^p ∈ A | holds; cokernel on sections killed by p^{2N} |
| §0.6 | two lines; W(I_1 + I_2) = W(I_1) + W(I_2) | x − [b_0] − [c_0] = V(x′), x′ ∈ W(I_1 + I_2), iterate | holds |
| §0.7 (3) | A² ∖ {0} → A²; proper f | [x⁻¹y⁻¹] ≠ 0 in H¹; degree m + 1 killed by surjective tower in degree m | holds |
| §0.8 | P¹, ordinary and supersingular E | 0; rank 1 slope 0; rank 2 slope 1/2 | holds |
| §1.2 | k ⊗^L_{k[t]} k; m = 3 | π_1 = k; π_1W = ∏_ℕ k killed by F and by p | holds |
| §1.3 | J = (f); Bl_0 A²; J with J^n a = 0 | B′ = A; B′ = k[x, y]; kernel of A → B′ nilpotent (a^{n+1} = 0) | holds |
| §1.4 / §1.5 | Y″ = Y′; Y″ = Z; general Y″ | covered; trivial; not covered | S01 |
| §1.5 step 3 | V(xy) | Bl_pt = two lines, flat; preimage of U dense in Y_1 because E is Cartier | holds |
| gap:qcqs-frobenius-factorization | f.p. nilimmersion; non-f.p. A → F_p for A = F_p[t_i]/(t_i^{p^i}) | I^{[p^N]} = 0 for I finitely generated; excluded by finite presentation | true, needs f.p. as stated |
| gap:reduced-flattening-by-blowup | V(xy), X = two lines | not flat at the node; flattened by the blowup | true; SchemeAndStackFoundations §4.12 on main assumes S integral |
| gap:quasi-coherent-kunneth | E × E; Spec k | H²: 1 = dim ∧²k²; k ⊗ k = k | true; no owner at the pins, on main or at the open heads (`roadmaps grep` Künneth) |
| §2.1 step 3 | p^c > a, r ≥ 1 | p^c r ≥ r + a | holds |
| §2.1 Check | cone over canonical curve; Bl_0 A² | ⊕_{m≥1} H¹(C, O(m)) = H¹(ω_C) = k; H¹(P¹, O(m + r)) = 0 | holds |
| §2.3 Checks | A¹; G_m | 0; H¹_c = K²/K = K, ζ^W = 1 − t | hold |
| §2.5, §2.6 nodal Checks | split, nonsplit, y² = x²(x − 1) over F_3 | q + 3 and q + 1 points; cocycle a = 0, b + c = 0, H¹ = K; q and q + 2 = 5 | hold |
| §3.1 | F = p^aσ; 1 − a_1t + pt² | E^{<1} = E iff a ≤ 0; unit-root factor | holds |
| §3.5 Check | p-rank f | 2g − f | holds |
| §3.7 | A¹, G_m | all 0; only H¹ | holds |
| §4.2 degree formula | point → P¹; Frobenius of A¹ | bidegree (1, 1); p | holds |
| §4.5, §4.6 Checks | [P¹ × x], [x × P¹], point inclusion, two points | 0 and (∫α)ĉl(x)\|_P¹; id and 0; degree 1; diag(1, 0) | hold |
| §5.1 Frobenius factorization | b^{p^n} ∈ k(A) ∩ B | = A by normality of Y | holds |
| §5.5 Check | ℤ/p^n on V, dim V > dim V^G + 2 | depth = dim V^G + 2 < dim V | holds |
| §5.10 | cone over Spec F_{q²} ⊂ P¹ | W(F_q)_ℚ → W(F_{q²})_ℚ, ranks 1 and 2 | negative control holds |
| §5.11 | P^d | Δ = ∑ h^i × h^{d−i}; i = d term is pt × P^d, the rest on P^d × H | holds |
| §5.12 (ii) | P¹ → Spec k; P^n_Y → Y; identity; resolution (r = 0) | H¹(Wω) = W_ℚ = H⁰(WS_0); R^n = Wω_Y(−n); tautology | holds; the printed CR12 form fails on P¹ (Source issues) |
| §6.1 extension formula | k′/k of degree r | det(1 − t^rφ^r) = ∏_{ζ^r = 1} det(1 − ζtφ) | holds |
| §6.3 | 1/(1 − qt); 1/(1 − t); Φ = 1; 1/(1 − pt) with q = p² | N_r = q^r; 1; 0; p^r not divisible by q^r | signs N_r = ∑β^r − ∑α^r hold |
| §6.4 Checks | node, two P¹, fold, blowup, isogeny of degree p | q; 2q + 1; q + 1; + q; tangent map of the dual isogeny has kernel | hold |
| §6.5 Check | quadric cone, F_2 | q² + q + 1; (q + 1)² | holds |
| §6.6 route | MV complex of K's; step 4 | augmented simplex complex exact; m − 1 = 0 forces no equations | holds |
| §6.7 | P¹, D a point; row exactness for I | 1/(1 − t) = 1/(1 − t)·1; V^i injective on H^n(I) through H^n(I) ≅ H^n(O) | holds |
| §6.8 criterion | m = n − 1; induction on j | x = R^{n−j}(y + Vw) | holds; matches Ser58Top lines 1153–1157 |
| §6.8 degree one | E_1 × E_2, p = 2 | (1, 1)-component a_1 ⊗ a_2 + a_2 ⊗ a_1 ≠ 0; e = V^n f, i_1^\*f = i_2^\*f = 0 gives f = 0 | holds |
| §6.9 route | g = 1 | ζ^{<1}(E)·P_1^{<1}(E)^{−1} = 1/(1 − t) | holds |
| §6.10 | ∅; P¹ and F_{q²} | rejected; π_\*π^\*[x] = 2[x], π_\*π^\*[y] = 2[y] | holds |
| §6.14 Checks | F_5, F_3 curves | 2 + 0 + 2 + 2 + 2 + 1 = 9; 3 + 1 = 4 | hold |

## Verified sound

- Read in full: `README.md` (1821 lines) and `Suggested.lean` (181 lines). Declarations read: 8. Layers read: 7, with 59 numbered sections (targets).
- Policy: the pull request changes 8 files, all in the package folder; `theorem` only; no `set_option`, `#eval`, `#print`, `lemma`; no pull-request numbers; one `import Mathlib` followed by nine `TauCeti.*` modules, each present at the pin.
- Pinned declarations checked (17, with the three tower declarations of S05): the three Witt identities at `Identities.lean:43, 102, 141`; `map_surjective` (`Basic.lean:263`); `frobeniusEquiv` (`Frobenius.lean:283`); `char_dvd_card_solutions_of_sum_lt` (`ChevalleyWarning.lean:110`); `bijective_cohomologyBaseChange` (`FlatBaseChange.lean:185`); `AbelianVariety` (`AbelianVariety/Basic.lean:95`, proper and geometrically integral); `IsProjectiveOver` and its `isProper` instance; `Chow.cyclesOfDimension` (`Chow/Basic.lean:86`), `Chow.RatEquiv` (`:257`, an `AddSubgroup` of the k-cycles, `[IsLocallyNoetherian X]`).
- Sibling citations checked (59 section headings): every cited section heading exists except DerivedModuleAlgebra §1.T.1 (S05). On main: SchemeAndStackFoundations (§0.23, §0.26, §2.5, §2.6, §2.18, §4.12, §5.2), EnhancedDerivedSheaves (§E1.3, §E1.4, E5 layers), EtaleCohomologyFoundations §G.2, AdicSpacesPartIII §F0.6. DerivedModuleAlgebra §1.T.1 does not exist as a heading (S05). At the open heads: ArcTopologyAndDescent §1.1, §1.3, §1.6; AbelianSchemesAndArithmeticModuli §A2.4, §A4.4; MotivesAndAlgebraicCycles §0.1, §0.6, §2.2; CrystallineCohomology §CR.3:duality.1, §CR.4.4, §CR.4.6, §CR.4.7, §CR.4.8; all 23 sections of PadicDifferentialEquationsAndRigidCohomology; DerivedDeRhamCohomology §PD.6; ClassicalAdicEtaleCohomology §5.4; PrismaticCohomology §2.0; NeronModelsAndSemistableAbelianVarietiesPartII §1.1.
- The CrystallineCohomology targets are cited by descriptive labels; each maps to one target of the cited section ("Witt structural identities" is *Finite-length Witt operators and their identities*, "Witt slope spectral sequence" is *Degree filtration and the slope spectral sequence*, "crystalline comparison" is *Finite and infinite crystalline de Rham–Witt comparison*, "logarithmic Witt sheaves" is *Logarithmic Hodge–Witt sheaves*). *Proper smooth crystalline trace* states that for part (1) smoothness of pure dimension d suffices, as §4.1 uses it.
- Locators verified against the cached texts (17): BBE07 lines 163–198, 1475, 1536–1553, 1594, 1679, 1715; BS17 lines 224, 289–359, 2389–2500; CR12 lines 3354–3381, 4544–4559; ESN03 lines 52–77; Ser58Top lines 1127–1162; Stacks line 1074 (tag 0FH6); GNT19 lines 51–68; HW23 line 953 (Corollary 4.6).
- Checks and instances computed: the 40 rows of the table above, covering 96 instances. Each definition has at least three discriminating Checks.
- Ownership: `roadmaps grep` for Ax–Katz, Chevalley–Warning, Witt-rational, rationally chain connected, Witt vector cohomology, theta divisors, CH₀-triviality and slope < 1 parts finds no second owner on main or at the open heads. The overlap check lists no pull request that changes this roadmap and no dropped id.
- Declared gaps: three, each precise, true on the instances above, absent from the supplier as stated, and declared with the same slug in `design/plan.json` and the README.

## Not verifiable

- Ser58, Ax64, BS83, Tsu03, Tsu04, Eke84, EkeII, Kol96: settled as uncertified; their locators were not checked.
- HW23 published version: not read (S03).
- Stacks tags 02RH and 0BED: the cached text is the Weil-cohomology chapter; the chapters Chow Homology and Varieties were not opened in this pass. The statements cited are the standard ones for these tags.
- CR12 Proposition 4.8.4 and Theorem 4.5.6 in the degree-shifted form used by §5.12 steps 5–6: the shift was checked on P¹ → Spec k, P^n_Y → Y and the identity, not through the full proofs.
- Sign compatibility in dimension d ≥ 2 between CR12's pushforward (π_\*ĉl(pt) = 1) and the parent's normalisation ε_d = (−1)^{d(d−1)/2} of the crystalline trace: §4.1 checks d = 1 only (ε_1 = 1), and no statement of this roadmap depends on d ≥ 2.
- Elaboration: no Lean was run in this pass; the types are those of the supplied signatures.

## Source issues

- **Gap** in BS17 at proof of Proposition 11.41, pp. 53–54: the source proves descent for proper surjections by induction on the dimension of the base and reduces to a blowup by its Lemma 2.10; it should prove universal descent, extending Lemma 11.45 to affine base changes by tensoring the structure-sheaf sequence; affects the proof.
- **Error** in CR12 at Theorem 4.8.1 (and Theorem 5 of the introduction), p. 96: the source says the positive-degree direct images of Wω match the positive-degree cohomology of the Witt canonical complex of the base; it should shift the degree by the relative dimension, as P¹ over a point shows; affects a stated result.
- **Gap** in NT20 at Lemma 2.17, proof, p. 13: the source tests the universal-homeomorphism conclusion at maximal ideals only; it should treat every point, which the p-power argument on Witt coordinates does; affects the proof.
- **Misprint** in CR12 at Proposition 2.3.4, p. 40: the source states the degree formula for a finite morphism of connected smooth schemes without equal dimensions; it should assume equal dimension, as CR11 Theorem 1.2.3 (1) does; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "e5e48575eb8b1783e49d873a6c606a2a0de45dab", "job": "RT-CrystallineCohomologyPartII~2b", "model": "fable", "worker": "chris-l"} -->
