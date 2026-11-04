<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1051#issuecomment-6393441900 -->
Review (claude) of 4bf6c6f

Verdict: needs changes

1. **F01** (P2) the effective-epimorphism criterion is statable at the pins but is declared not statable

   - **Location.** `packages/ArcTopologyAndDescent/Suggested.lean` lines 25–27: "The universally effective epimorphism criterion lacks the category of qcqs perfect F_p-schemes."
   - **Claim.** BM21 Theorem 5.17's second assertion (README §7.8) cannot be stated at the pins, because no category of qcqs perfect F_p-schemes exists there.
   - **Witness.** In a scratch copy, one real-bodied predicate plus `ObjectProperty.FullSubcategory`, `IsPullback` (`Mathlib/CategoryTheory/Limits/Shapes/Pullback/IsPullback/Defs.lean:61`) and `EffectiveEpi` (`Mathlib/CategoryTheory/EffectiveEpi/Basic.lean:71`) elaborates. The only warning is `sorry`. The theorem is a headline: BM21 Theorem 1.10, BM21 line 191.
   - **Repair.** Add the statement below to `Suggested.lean` under a `/-! ## Layer 7 … -/` comment, and delete the docstring bullet at lines 25–27. In README §7.8, name the new declarations in backticks and give `IsPerfectFpScheme` its API and three Checks. Suggested Checks: the zero ring passes; F_p[ε]/ε² fails because Frobenius kills ε; the perfection of F_p[t] passes. This exact text elaborated:

   ```lean
   def IsPerfectFpScheme (p : ℕ) (X : Scheme.{u}) : Prop :=
     ∀ U : X.Opens, (p : Γ(X, U)) = 0 ∧ Function.Bijective (fun x : Γ(X, U) => x ^ p)

   def QcqsPerfectFp (p : ℕ) : ObjectProperty Scheme.{u} :=
     fun X => CompactSpace X ∧ QuasiSeparatedSpace X ∧ IsPerfectFpScheme p X

   theorem arcCover_iff_universallyEffectiveEpi (p : ℕ) [Fact p.Prime]
       {X Y : (QcqsPerfectFp.{u} p).FullSubcategory} (f : Y ⟶ X) :
       IsSchemeArcCover f.hom ↔
         ∀ (T P : (QcqsPerfectFp.{u} p).FullSubcategory) (g : T ⟶ X) (f' : P ⟶ T) (g' : P ⟶ Y),
           IsPullback g' f' f g → EffectiveEpi f' := by
     sorry
   ```

     The predicate deliberately avoids `CharP`, which fails on the empty open (Γ = 0). Test cases: the identity is an arc-cover, and every base change of it is an isomorphism, hence an effective epimorphism. ∅ → Spec F_p is neither an arc-cover nor an effective epimorphism.

2. **F02** (P2) gap:coherent-topos-pushouts still asks for something AdicSpacesPartII supplies, and for this roadmap's own §5.2 target

   - **Location.** README line 78, and the matching `gaps` entry in `design/plan.json`: "supply coherence of sheafified representables, the coherent-quotient criterion for finite coproducts of these representables with quasi-compact relation, and coherence of pushouts of coherent objects along monomorphisms."
   - **Claim.** No earlier roadmap supplies the coherent-quotient criterion. Pushout coherence is likewise a supplier contract.
   - **Witness.** AdicSpacesPartII §R0.19.10 (main, README line 8039) proves `Topos.isQuasiseparated_iff_of_cover`, the source of BM21 Lemma 4.19(3) (line 1387). BM21 derives Lemma 4.23 from 4.19(3) and Deligne points (lines 1453–1469), as README §5.2 line 772 does.
   - **Repair.** In the README and the plan, narrow `needs` to: "For essentially small finite-limit sites whose covering families have finite covering subfamilies, supply that sheafified representables are coherent (quasi-compact and quasi-separated) objects, so the sheaf topos is algebraic and coherent in the sense of AdicSpacesPartII §R0.19.10." Relabel the section "§2.5 (coherent-site extension)": SchemeAndStackFoundations §2.3 is torsors and H¹ (its README line 3330), while its §2.5 holds the coherent-site lemma `cohomology_filtered_colimits` (line 3402). In §§5.2–5.3, cite `Topos.isQuasiseparated_iff_of_cover` for the quotient criterion, and keep pushout coherence as §5.2's own statement, with its route through AdicEtaleGeometry §A1.15 points.
   - **Test.** On the bounded site, take G with a surjection h_X^# ↠ G. Once h_X^# is coherent, R0.19.10 says G is quasi-separated exactly when h_X^#×_G h_X^# is quasi-compact. G is quasi-compact as a quotient of a quasi-compact object. Together these give BM21 Lemma 4.19(3).

3. **F03** (P2) `arc_affine_purity` is not a headline theorem (padding)

   - **Location.** `Suggested.lean` lines 49–64 (`IsRingArcCover`, `arc_affine_purity`). README line 415: "The headline signature is `arc_affine_purity`."
   - **Claim.** BM21 Proposition 2.11 is one of the roadmap's headline theorems.
   - **Witness.** The Summary (README line 3) omits it. BM21 states it as an aside (line 422) and never cites it again; no later *Needs:* line cites it. BM21's intro announces Proposition 2.19 instead (line 98).
   - **Repair.** Delete `IsRingArcCover` and `arc_affine_purity` from `Suggested.lean`. Keep §2.5 as a README target written in prose, without backticks there or in the first API bullet of §2.7. In line 142, change "four headline signatures" to the new count. Add the Proposition 2.19 characterization (arc-covers are exactly the universal spectral submersions, stable under cofiltered limits) to the Summary, since `arc_spectral_characterization` stays. This is graded P2 under the binding padding rule; the brief alone would grade it P3.

4. **F04** (P2) `HasAffinoidPresentation` rebuilds Tau Ceti's strict topological finite type

   - **Location.** `Suggested.lean` lines 89–93. README line 22: "The acceptance predicate for a finite Tate presentation is only this supplied affinoid notion expressed on pinned native rings." The "From Tau Ceti" contract (line 60) does not mention the Tau Ceti predicate.
   - **Claim.** A finite Tate presentation must be defined locally.
   - **Witness.** `TauCeti.Huber.IsStrictlyTopologicallyFiniteType` (`TauCeti/RingTheory/Huber/TopologicallyFiniteType.lean:133`, Wedhorn Definition 6.28) is an open quotient map out of K⟨X₁,…,X_k⟩. `isStrictlyTopologicallyFiniteType_of_surjective` (line 353) handles Tate bases. RigidAnalyticGeometry's `IsAffinoidAlgebra` (its `Suggested.lean` line 62) is the same predicate verbatim.
   - **Repair.** Delete `HasAffinoidPresentation`. In both affinoid theorems, add `[TopologicalSpace A] [NonarchimedeanRing K]` and replace `hA` by `hA : TauCeti.Huber.IsStrictlyTopologicallyFiniteType (algebraMap K A)`, importing `TauCeti.RingTheory.Huber.TopologicallyFiniteType`. Cite that predicate, with its file and line, in "From Tau Ceti". In §10.0, restate the Checks for it: n = 0 is `isStrictlyTopologicallyFiniteType_id`, and quotients are `quotientMk`.
   - **Test.** The rewritten `affinoid_artin_grothendieck` elaborated with only the `sorry` warning. Its object file was missing, so it was built first with the targeted `lake build TauCeti.RingTheory.Huber.TopologicallyFiniteType`. The extra `[NonarchimedeanRing K]` is needed because the instance is not inferred from `IsUltrametricDist` at the pin; it is a Prop that every ultrametric normed field satisfies.

5. **F05** (P3) the repaired §10.1 route misnames the torsion that affine Artin vanishing covers

   - **Location.** README line 1281: "Together with the residue-invertible primary pieces this treats every constant torsion Λ."
   - **Witness.** K = C_p, Λ = Z/p: |p| < 1, so p is not residue-invertible, and char K = 0, so §2.11 does not apply. Yet EtaleCohomologyFoundations §F.3 (prime-to-characteristic vanishing, its README lines 678–679) covers it.
   - **Repair.** Replace the sentence with: "Together with torsion of order invertible in K (EtaleCohomologyFoundations §F.3; when char K = 0 this includes residue-characteristic torsion), this treats every constant torsion Λ." The repaired sentence covers the test case through §F.3.

6. **F06** (P3) the docstring names proof inputs, not the missing carrier, for algebraic-space mapping descent

   - **Location.** `Suggested.lean` lines 22–24: "the algebraic-space mapping descent theorem additionally lacks the general reconstruction interface."
   - **Witness.** BM21 Theorem 5.17's first assertion (lines 1876–1877) involves only a qcqs algebraic space, X^perf and the arc-sheaf condition; Perf and reconstruction enter only the proof (line 1883). Pinned Mathlib has no `AlgebraicSpace`. Same pattern as F10.
   - **Repair.** Write instead: "Mapping descent into algebraic spaces lacks algebraic spaces and scheme perfection."

7. **F07** (P3) GeneralAlgebraicKTheory is still credited with statements it does not make (the F09 pattern)

   - **Location.** README line 24: "its localization theory in Layer 10 … including the noetherian K-theory completion square". Line 1506: "the K-theoretic theorem of CMM21, whose owner is GeneralAlgebraicKTheory."
   - **Witness.** At its head e0552fe, GeneralAlgebraicKTheory's Layer 10 is Bass negative K-theory (its README line 2291), and it cites CMM21 only for Proposition 4.34 (line 2522). The completion square belongs to SchemeKTheoryOperations §3.4, at its head 88dbd5a (its README line 777).
   - **Repair.** Change the row's owner cell to "GeneralAlgebraicKTheory §§8.5–8.6, 10.9 and 10.12; SchemeKTheoryOperations §3.4", and its interface cell to "Milnor excision in degrees ≤ 1; supported K-theory under noetherian completion". Delete "whose owner is GeneralAlgebraicKTheory" from §12.5.

8. **F08** (P3) locators and the manifest

   - **Location.** §6.1, line 842: "(BM21, Lemma 5.1 p. 37, Proposition 5.2 pp. 37–38 and Lemma 5.3 p. 38.)". §1.6, line 335: "Text locators: BS17 line 208". `sources.toml` line 107, the CMM21 locator: "Lemma 6.4 p. 52; CMM21 line 2201".
   - **Witness.** BM21 Lemma 5.1 and Proposition 5.2 (lines 1519, 1535) concern descent; only Lemma 5.3 (line 1556) supports §6.1. BS17 line 208 is Theorem 2.4; Lemma 2.12 is line 375. The README no longer cites CMM21 Lemma 6.4.
   - **Repair.** In §6.1, cite only BM21 Lemma 5.3, p. 38 (line 1556). In §1.6, add "BS17 line 375". Remove "Lemma 6.4 p. 52; CMM21 line 2201" from the CMM21 locator.

9. **F09** (P3) style and Checks

   - **Location.** Line 1460: "Checks for the supplied the arc-site of p-adic formal schemes". Line 1439 (§11.4): "For I=R the proper-ideal test class is empty". `Suggested.lean` lines 96–99.
   - **Witness.** The first has a doubled article. In the second, I is an ideal of A, so the unit ideal is I = A. In the third, the body of `IsTorsionEtaleSheaf` is Mathlib's `IsAddTorsion` (`Mathlib/GroupTheory/Torsion.lean:56`) applied to each affine section group.
   - **Repair.** "Checks for the supplied arc-site of p-adic formal schemes"; "For I=A …". Use `IsAddTorsion (F.obj.obj …)` as the body; it elaborated in scratch.

Nine findings, four of them blocking (P2). Ten of the twelve round-one findings are repaired. F01 is only partly repaired (R02). F10 was reworded as asked, but the new wording makes a false claim (R01), and the same pattern appears in the bullet above it (R06). Two blocking findings concern `Suggested.lean` and were not raised in round one. One declaration is not a headline (R03). One local predicate rebuilds a pinned Tau Ceti predicate (R04).

## Verified sound

### Round-one findings

| Id | Repaired passage (quoted) | Status |
| --- | --- | --- |
| F01 | line 76: "Use AdicEtaleGeometry §A1.15 (coherent-topos-enough-points) for Deligne enough points and AdicSpacesPartII §R0.19.10" | partly repaired: Deligne points moved to their owner; the residual gap overlaps R0.19.10 and §5.2 (R02) |
| F02 | line 104: "Extend the §2.6 comparison to the image of every p-complete integral perfectoid A in A[1/p]" | repaired; ClassicalAdicEtaleCohomology §2.6 at head dfcb6b7 states the normalized comparison and its tilt |
| F03 | line 1281: "SchemeAndStackFoundations §2.11 gives the constant Z/p bound q≥2" | repaired; the gap is gone from README and plan (five remain); `Etale.artinSchreier_vanishing` is in that roadmap's `Suggested.lean` (line 1405); wording slip R05 |
| F04 | line 1398: "each of its connected components is the spectrum of a localization of one of these ultraproduct valuation rings" | repaired; matches CS24 lines 774–777 and 790–793 |
| F05 | line 64: "composition and base-change rules"; cancellation bullets at lines 325, 413 and 439 | repaired; BM21 line 364; RYD10 lines 350–352 |
| F06 | line 1005: "BS22 Remark 8.9 p. 67; CS24 §2.2.1 p. 18" | repaired; BS22 line 2610 lies before page 68 (line 2630); CS24 line 733 |
| F07 | line 378: "Use PrismaticCohomology §2.0 (`Arc.Cover.ofVCover`)"; line 836: "Use ClassicalAdicEtaleCohomology §6.1" | repaired; PrismaticCohomology head ff0050b line 2666; ClassicalAdicEtaleCohomology §6.1 states that a valuation ring with algebraically closed fraction field is strictly henselian |
| F08 | line 691: "admits q⊋p with [p,q]∈P, and each nonzero q admits r⊊q" | repaired; BM21 lines 1124–1125 print strict inclusions; Check at line 701 verified (row below) |
| F09 | Needs of §§2.3, 4.3, 5.5: "Conventions (Milnor datum)" | repaired for the Needs lines; the pattern persists elsewhere (R07) |
| F10 | `Suggested.lean` lines 25–27 | reworded as asked, but the new claim is false (R01); the sibling bullet repeats the pattern (R06) |
| F11 | line 651: "the hypothesis ker f⊆p is included in addition to the printed statement"; duplicate removed at line 1068; bullets at lines 1253–1255 | repaired |
| F12 | `sources.toml` line 50: "Lemma 8.8 and Remark 8.9, p. 67; BS22 lines 2603 and 2610" | repaired; stale CMM21 locator (R08) |

### Elaboration, binders and padding probes

- **Elaboration.** `lake env lean` on `Suggested.lean`, run from the content checkout at Mathlib `6b7abb3c…` and Tau Ceti `a91d3aaf…`, takes 6 s. Exit 0, exactly four `declaration uses sorry` warnings (lines 58, 76, 108, 118), no errors.
- **Binder audit.** `#check @` on all nine declarations, in one scratch file. The file has no `variable` block, so no binder can be dropped, and all nine types match README §§2.5, 2.7, 10.0 and 10.8.
- **Padding probes.** `first | simp | rfl | infer_instance | aesop` was tried on each of the four theorems. All four failed (aesop exhausted its search or made no progress).
- **Non-vacuity.** `IsSchemeArcCover (𝟙 X)` was proved in scratch.
- **Redundant hypotheses (note, not a finding).** In `arc_spectral_characterization`, `[QuasiCompact f] [QuasiSeparated f]` follow from qcqs source and target, so they are harmless.
- **Elaborated probes.** Three probe statements elaborated: R01's theorem, R04's rewritten theorem, and R09's `IsAddTorsion` body.

### Dependency check

`gate --depcheck … --name ArcTopologyAndDescent --order merge-order/ORDER.txt --movable` printed `depcheck: 48 roadmaps, 549 edges, 0 problem(s)`. There was no UPWARD, CYCLE or `moved:` line. The roadmap is at ORDER line 123.

`roadmaps resolve` on the README found no cross-roadmap citation and no Lean name missing everywhere. The worker's three leads were checked:
- `Arc.Cover.ofVCover` is in PrismaticCohomology §2.0 at its head.
- `Etale.artinSchreier_vanishing` is in SchemeAndStackFoundations on main.
- `sources.toml` is a file name, not a Lean name.

A mechanical pass found every cited section heading in its supplier.

### Seeded sample (15 targets), checked at the text

| Target | Locators checked | Result |
| --- | --- | --- |
| §1.1 | BM21 Def 3.2 (line 655, p. 16) and Lemma 3.4(3) (line 670, pp. 16–17); BS17 Thm 2.9 and Lemma 2.10(b) (lines 289 and 321, p. 7) | supports both cancellation bullets |
| §1.5 | BS17 Remark 4.2 (line 708, p. 15) and Prop 4.5 (line 727, pp. 15–16) | correct |
| §2.3 | BM21 Lemma 2.7 (line 390, p. 10), Cor 2.9 (line 414), Example 1.3 (line 105, p. 3) | correct; an excision datum automatically gives the pullback |
| §2.5 | BM21 Prop 2.11 (line 423, p. 11) and Lemma 2.3 (line 364, p. 9) | correct |
| §3.2 | BM21 Def 3.1 (line 639) and Def 3.5 (line 680) | correct |
| §4.4 | BM21 Lemma 4.7 (lines 1120–1127, pp. 27–28) | correct |
| §4.5 | BM21 Lemma 4.4 (line 1073, pp. 26–27) | correct; the README adds the missing third case (Source issues) |
| §5.3 | BM21 Lemmas 4.21–4.22 (lines 1392 and 1423, pp. 33–34) | correct; the counterexample is at lines 1404–1406 |
| §7.4 | BM21 Thm 5.14 (line 1811, p. 43) and Cor 5.15 (line 1838, p. 44); HJ14 Cor 6.5 (line 738, printed p. 465) and Prop 6.10 (line 763, p. 466) | correct |
| §8.1 | BM21 Def 1.14 (line 228, p. 6) | correct |
| §8.4 | BM21 Prop 6.2 (line 1946, p. 47) | correct |
| §8.5 | BM21 Prop 6.3 (line 1959, p. 47) and Example 6.8 (line 2054, pp. 49–50) | correct |
| §10.5 | BM21 Prop 6.22 (line 2228, p. 53) and Remark 6.23 (p. 54) | hypothesis "ℓ prime to the residue characteristic" matches |
| §12.4 | BS22 Prop 8.10, second assertion (line 2621, p. 67), proof (lines 2650–2661, p. 68) | correct |
| §12.5 | CMM21 Thm 6.3 proof (lines 2187–2190, p. 51) | correct |

The author flagged no locator as unverified; HUB96 is settled as uncertified.

Spot checks outside the sample:
- BM21: Remark 2.18 (line 519), Thm 4.1 (line 1009), Lemmas 4.9–4.13 (lines 1209–1300), Lemma 4.19 (line 1381), Lemma 4.23 (line 1443), Thm 5.6 and Prop 5.7 (lines 1624 and 1633), Thm 5.17 (line 1875), Thms 6.4, 6.6 and 6.11 (lines 1976, 2022, 2087), Example 6.15, Construction 6.16, Cor 6.17 (lines 2130–2142), Props 6.21 and 6.24, Props 7.5 and 7.6.
- BS22: Def 8.7 (line 2594, p. 67).
- CS24: §2.2.1 (lines 711–736), Lemma 2.2.2 (line 755), Lemmas 2.2.3–2.2.4 (lines 764–797), Thm 2.2.5 and Remark 2.2.6 (lines 800–825), Lemma 3.1.2 (line 1207, p. 30), Lemma 4.2.6 (line 1717).
- RYD10: lines 330–352.
- STACKS: tags 09Z8, 09ZH and 09ZI (lines 6868, 7001, 7011).

No source passage is copied into the README.

### Adversarial pass

This table covers four groups: every passage the repairs changed or added, every Lean declaration, the R01 probe, and every section round one summarised without values (§§3.3, 3.9, 3.10, 4.2, 4.6, 5.2–5.5, 6.2, 6.6, 8.6, 8.8, 8.9, 9.2, 9.5, 9.8, 9.9, 10.2, 10.6 and 12.4–12.7). For the other sections, round one's rows carry computed values and are relied on.

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `IsSchemeArcCover` | 𝟙 X; Spec Frac V→Spec V | W=V, e=id (proved in Lean); a lift of the closed point would make t a unit | determines its object | none |
| `arc_spectral_characterization` | rank-two split; ∅→∅; generic inclusion | split: open-preimage subsets ∅,{0},{0,p},{0,p,m} are 4 of 8, exactly the opens; ∅: both sides true; {m} has preimage ∅ but is not open: both sides false | holds | none |
| `arc_affine_purity` | V→Frac V | V/(t)⊗Frac V=0, so the class of 1 maps to 0: both sides false | true, but not a headline | R03 |
| `HasAffinoidPresentation` | n=0; K⟨T⟩/(T²) | presents K; quotients compose; Tau Ceti `isStrictlyTopologicallyFiniteType_id` and `quotientMk` give the same | same class as the Tau Ceti predicate | R04 |
| `IsTorsionEtaleSheaf` | ⊕_r Z/ℓ^r; constant Z | sectionwise exponent ℓ^(max r); n·1=n≠0 | equals ∀U, `IsAddTorsion` | R09 |
| `affinoid_artin_grothendieck` | A=K, d=0; A=0; A=K×K | H^q(Spec K)=0 for q≥1 (range q>1); all groups 0; H⁰=(Z/ℓ)² | consistent | R04 carrier |
| `…_prime_to_residue` | C₂ with ℓ=2; char K=p with ℓ=p | ‖2‖=1/2; ‖p‖=0; both excluded by ‖ℓ‖=1 | consistent | none |
| R01 probe | identity; ∅→Spec F_p | identity: arc-cover, and every base change is an isomorphism, hence an effective epimorphism; ∅→Spec F_p: the identity test has no lift, and it is no effective epimorphism since Spec F_p is not initial | statable, elaborated | R01 |
| §1.6 cancellation | A→A[x₁..x_n]→A[x₁,x₂,…] | all xᵢ↦0 gives W=V; projecting gives the middle lift | correct | none |
| §2.5 / §2.7 cancellation | A→B→C; Y→Z→X | b_C∘(B→C)∘f=e∘a; b≫(Y→Z), same e | correct | none |
| §4.4 strictness Check | chain {0}∪{p_n} with P = intervals avoiding 0, plus [0,0] | length-≤1 intervals [p_(n+1),p_n] and singletons lie in P; non-strict tests pass via singletons; [0,p₁]∉P; no q⊋0 with [0,q]∈P | Check correct | none |
| §4.4 Check 2 | {0,p,m} | [0,p]∩[p,m]={p}, union [0,m] | correct | none |
| §4.5 third case | s∈ker∖p | pW=0, W⊗V_p=0, W⊗κ(p)=0, so F(W)≅F(W)×_{F(0)}F(0) | correct | none |
| §5.2 pushout Check | A={a}⊂B={a,b}, C={c} | D={b,c}; |B×_D B|=2, |B×_D C|=1, |C×_D C|=1; A=∅ gives B⊔C | correct | none |
| §5.2 quotient criterion | G₁=h_X^# | R0.19.10: G qs ⇔ h_X^#×_G h_X^# qc; G qc as a quotient | equals BM21 4.19(3) | R02 |
| §5.3 | Spec Q ⊔ ∐Spec Z_(p) over Spec Z | has arc-lifting, but no finite subfamily covers, so not surjective | source qc needed | none |
| §5.4 | X=Spec k, |k|<κ<κ′ | f*h_X^#=h_X^# | correct | none |
| §5.5 | I=0; I=A | pushout is h_A in both cases | correct | none |
| §3.3 | constant {0,1} | Tot={0,1} commutes with filtered unions | correct | none |
| §3.9 | I={1,2}; I=∅ | δ₁,δ₂ give A→A₁, A→A₂; I=∅: A=0 and the empty family detects over ∅ | correct | none |
| §3.10 | A=k algebraically closed | one factor V=k (rank 0) is a v-cover | correct | none |
| §4.2 | constant diagram | any j | correct | none |
| §4.6 | terminal functor; RΓ(−,Λ), Λ torsion | all three conditions hold; Λ=Λ×_ΛΛ on the aic square | correct | none |
| §6.1 | V/p for aic V | aic by §0.1, so its fraction field is algebraically closed and ClassicalAdicEtaleCohomology §6.1 applies | correct | R08 locator |
| §6.2 | X=Spec k, k separably closed | the strict henselization is X itself | correct | none |
| §6.5–6.6 | rank 0; rank 1 with a doubled generic point | rank 0: FinSet, fold 2→1 allowed; doubled point: closed stalk 2 → generic stalk 1, not injective, so separated excludes it and constructible keeps it | correct (corrects BM21) | Source issues |
| §8.6 | I=0; I=A | U=∅ gives F(A)=F(B); U=Spec A gives a tautology | correct | none |
| §8.8 | I=0 | both punctured spectra empty | correct | none |
| §8.9 | U=Spec A; Z=∅ | both sides equal RΓ(A/a) by Gabber; supports give 0=0 | correct | none |
| §9.2 | identity; A⁺→0 | surjective; the F_p[[t]] test has no lift and Spa(0)=∅ | correct | none |
| §9.5 | identity hypercover of complete aic V | every term Λ[0] | correct | none |
| §9.8 | Z_p[x]/(px)→Z_p, t=p | generic ring Q_p on both sides | correct | none |
| §9.9 | k→k^(1/p) | same Galois group, same RΓ | correct | none |
| §10.0 extensions | 0→Z/2→Z/4→Z/2→0 | exponents 2,2 give 4 | correct | none |
| §10.1 route | K=C_p, Λ=Z/p | p invertible in K; |p|<1; char K=0 | covered by §F.3, misnamed | R05 |
| §10.1 Checks | char p, n=1, Z/p; n=0, K[ε]/ε²; ⊕Z/p^r | H^q=0 for q≥2; strictly henselian gives q≥1; filtered colimit 0 | correct | none |
| §10.2 | f=1, g=0 | A⟨1/0⟩=0, A⟨0/1⟩=A, overlap 0: square is RΓ(A) | correct | none |
| §10.6 | A=B=K; A=K×K | F_ℓ⊗F_ℓ=F_ℓ; F_ℓ²⊗F_ℓ=F_ℓ² | correct | none |
| §11.2 components | one factor, D(t); two factors, D((t,1)); empty product | Spec Frac V=Spec V_(0) (1 point); components Spec Frac V₁ and Spec V₂; no components | correct | none |
| §12.2 Checks | completed Z_p[p^(1/p^∞)]; F_p×O_(C_p); perfect char p | R=A; A[p^∞]=F_p×0, A_tf=O_(C_p), A[1/p]=C_p; A[1/p]=0 | correct | none |
| §12.4 | T=Spf F_p, X=Spf O_C | no arc-cover O_C→S with pS=0 (the test O_C has no lift), so the presheaf is consistent | correct | none |
| §12.5 | I=0; X=Spec A | trivial; reduces to Gabber | correct | R07 owner clause |
| §12.6 | ϖ=0, A perfect of char p | the 0-complete arc topology is the arc topology; A♭=A | correct | none |
| §12.7 | perfect field k | totalizations k, k, W(k) | correct | none |

### Declared gaps

The five gap slugs agree between the README and `design/plan.json`, with the same supplier, section and `needs`.

- algebraic-space-perf-tannaka: matches BH16 Theorem 1.5 (line 86).
- constructible-etale-space-descent: SchemeAndStackFoundations §§1.2–1.10 has no universally submersive descent.
- perfectoid-tate-constant-comparison: ClassicalAdicEtaleCohomology §2.6 covers only R=(R[1/p])°; no roadmap compares Spa(A,A⁺) with Spa(A,A°).
- bounded-torsion-punctured-approximation: AdicEtaleGeometry §A1.0.5 requires a nonzerodivisor t (its README line 2148).

These four are precise and minimal. coherent-topos-pushouts is R02.

### Library declarations opened at the pins

- **Mathlib:**
  - `Sheaf.H` (`CategoryTheory/Sites/SheafCohomology/Basic.lean:56`)
  - `Scheme.AffineEtale.Spec` and `sheafEquiv` (`AlgebraicGeometry/Sites/AffineEtale.lean:59,140`)
  - `MvPowerSeries.IsRestricted.subring` (`RingTheory/MvPowerSeries/Restricted.lean:107`)
  - `Ring.KrullDimLE` (`RingTheory/KrullDimension/Basic.lean:30`)
  - `ValuationRing` (`RingTheory/Valuation/ValuationRing.lean:64`)
  - `EffectiveEpi` (`CategoryTheory/EffectiveEpi/Basic.lean:71`)
  - `IsPullback` (`…/Pullback/IsPullback/Defs.lean:61`)
  - `ObjectProperty.FullSubcategory` (`CategoryTheory/ObjectProperty/FullSubcategory.lean:39`)
  - `PerfectRing` (`FieldTheory/Perfect.lean:44`)
  - `IsMulTorsion`/`IsAddTorsion` (`GroupTheory/Torsion.lean:56`)
  - `Pseudofunctor.IsStack` (`CategoryTheory/Sites/Descent/IsStack.lean:49`). Descent data exist, but there is no pullback pseudofunctor of étale schemes, so §6.6 stays unstatable.
- **Mathlib absences.** No `AlgebraicSpace`. No module-level universally-injective predicate: `AlgebraicGeometry.UniversallyInjective` is a different, pointwise notion.
- **Tau Ceti:**
  - `MvPowerSeries.instAlgebraIsRestrictedSubring` (`RingTheory/MvPowerSeries/TateAlgebra/Basic.lean:313`)
  - `TauCeti.Huber.IsStrictlyTopologicallyFiniteType` (`RingTheory/Huber/TopologicallyFiniteType.lean:133`)

### Cross-roadmap citations resolved

On main:
- SchemeAndStackFoundations §§0.24, 1.2, 1.4, 2.3, 2.5, 2.11, 2.15 (`artinSchreier_vanishing` in its `Suggested.lean`)
- AdicEtaleGeometry §§A1.0.5, A1.15
- AdicSpacesPartII §R0.19.10
- PerfectoidSpaces §§P1.15, P1.20, P1.24, P1.25, P1.27, P2.2, P3.2, P3.9–P3.12, P3.20
- EnhancedDerivedSheaves §§E1.6, E2.6–E2.8, E4.1, E4.3, E5:abstract.5, E5:descent
- EtaleCohomologyFoundations §F.3
- RigidAnalyticGeometry §§1.1–1.3

At open heads:
- PrismaticCohomology §2.0 (ff0050b)
- ClassicalAdicEtaleCohomology §§2.6, 6.1 (dfcb6b7)
- DiamondsAndVStacks §§D0.11–D0.12, D0.18, D0.22 (7c7453f)
- PerfectoidQuotients §§0.4–0.6 (502f1d5)
- GeneralAlgebraicKTheory §§8.5–8.6 and Layer 10 (e0552fe; see R07)
- SchemeKTheoryOperations §§3.4, 4.10 (88dbd5a)

### Ownership

`roadmaps grep` was run over main and the 352 open heads, and the local board packages were grepped, by object:
- **The nine Lean names.** No match outside this package.
- **Spectral submersion.** Only DiamondsAndVStacks §D0.11, a supplier.
- **Arc-cover, arc-topology, arc-sheaf, arc-descent.** PrismaticCohomology and its Part III are suppliers or consumers. BunGAndNewtonStrata's arc-descent of vector bundles is a different object. RiemannianGeometry's "arc" is unrelated.
- **Artin–Grothendieck, total integral closure.** No other roadmap.

No `Suggested.lean` declaration reuses another roadmap's fully qualified name.

## Not verifiable

- **HUB96.** It is paywalled and settled as uncertified. Its locators were checked only against ClassicalAdicEtaleCohomology §§2.5–2.6 and 6.3.
- **BS17, proof pp. 46–47 of Theorem 11.2(2)** (cited in §7.7). These pages were not read.
- **Sibling checkouts.** The brief listed sibling pull requests without checkout paths. Ownership against them was checked only through `roadmaps grep` at their indexed heads.
- **Board packages on other pull-request heads.** Their READMEs (the 20 packages in the board index) were not opened.

## Source issues

- **Error** in BM21 at Lemma 4.3, p. 25: the source says pW is prime and contracts to p whenever pW≠W. For V→V/q with p=0⊊q, pW=0 contracts to q. It should add the hypothesis ker(V→W)⊆p; affects a stated result.
- **Gap** in BM21 at the proof of Lemma 4.4, pp. 26–27: the source splits only into pW=W and pW≠W, and misses p⊊ker(V→W), where Lemma 4.3 fails. That case is trivial, since both localized terms vanish; affects the proof.
- **Error** in BM21 at the proof of Theorem 5.6(2)(a), p. 40: the source uses functors into finite sets with injections, which forces every morphism to be injective. The fold V⊔V→V is a non-injective morphism. It should allow all natural transformations between injective-transition functors; affects the proof.
- **Misprint** in BM21 at the proof of Theorem 5.6(2), p. 40: the source writes the spectrum of a rank-n valuation ring as {1,…,n}, which has n points. It should have n+1 points; affects nothing.
- **Misprint** in BS22 at the proof of Proposition 8.10, p. 68: the source's final sentence swaps the cover Y→X with X→Y and the descended map |X|→|T| with |Y|→|T|. It should keep Y→X as the cover and produce |X|→|T|; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "4bf6c6f", "job": "REV-PKG-ArcTopologyAndDescent~2", "model": "opus", "worker": "fable-rev86"} -->
