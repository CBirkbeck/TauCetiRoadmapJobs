# Review of RigidAnalyticGeometry (pull request #1807 at dbb3969)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/RigidAnalyticGeometry/` at `dbb3969923697be516375b660691fd03628028d2`. The push gate passes: every check is 0 and the build is OK. `Suggested.lean` elaborates with exit 0 and seven `declaration uses sorry` warnings, nothing else. The dependency check reports `depcheck: 234 roadmaps, 2271 edges, 0 problem(s)`. The pull request changes nothing outside its own folders.

Most of the previous review's findings are repaired; the status of each is listed after the findings. Four blocking findings remain. R01: the formal-functions content moved to AdicSpacesPartIII has no owner. R02: two headline theorems that can be stated at the pins are missing from `Suggested.lean`. R03 and R04: two targets rest on inputs that nothing supplies.

## R01 (P1) — The formal-functions theorem (old §7.5) is mapped to a target that only transports §7.5

**Location.** `TauCetiRoadmap/RigidAnalyticGeometry/README.md` lines 77–78: "§7.5, principal filtrations and formal functions → AdicSpacesPartIII R3.6 *proper-cohomology-adic-completion*."

**Claim.** On main, §7.5 was a target of this roadmap. It covered the stable principal filtration `R_n=ker(Hⁱ(X,F)→Hⁱ(X,F/aⁿF))` with uniform shifts `d` and `e`, and the formal-functions isomorphism `(Hⁱ)^∧_J ≃ lim Hⁱ(X,F/JⁿF)` for every ideal `J` (Kiehl-E Theorems 3.4 and 3.7). The Part III target named in the mapping does not prove this. Its stated route is to transport this README's §7.5, and its *Needs:* line cites §7.5. Once the pull request merges, no roadmap plans the theorem, and the old → new line points the id back at the target that consumes it.

**Witness.** `TauCetiRoadmap/AdicSpacesPartIII/README.md` on main, line 11031: "transport RigidAnalyticGeometry §7.5's completion theorem and stable principal filtration". Line 11042: "*Needs:* RigidAnalyticGeometry §7.5". Lines 102–103 and 604 say the same.

**Repair.** AdicSpacesPartIII must own the proof before this README drops §7.5. Restoring §7.5 here is not an option: its `Mⁱ=Hⁱ(X,F)` needs Part III's finiteness (R3.6 *proper-affinoid-cohomology-finite*), which would bring back the cycle the previous review's R01 removed.
- Add `TauCetiRoadmap/AdicSpacesPartIII/` to this pull request, or to one that the merge-order paragraph orders before it.
- Rewrite R3.6 *proper-cohomology-adic-completion* as the proof of Kiehl-E Theorems 3.4 and 3.7 on Part III's carriers. Carry over main's §7.5 statement: `R_0=Mⁱ`, `aⁿMⁱ⊆R_n`, `aR_n⊆R_{n+1}` with equality for large `n`, the shifts `d` and `e`, and the general-ideal isomorphism with naturality. Carry over its Checks: `a=0`, `a=1`, and the identity of `Sp A` in degree 0.
- Delete "RigidAnalyticGeometry §7.5" from Part III lines 102–103, 604, 11031 and 11042.

Once Part III is revised this way, the line at README 77–78 points at a target whose *Needs:* no longer names this roadmap.

## R02 (P2) — Two headline theorems that can be stated at the pins are absent, and the docstring calls one of them unstatable

**Location.**
- `Suggested.lean` lines 36–37: "Tate's acyclicity theorem in its sheaf form".
- Lines 44–45: "excellence of the analytic local rings (Layer 4), which needs the stalks of the structure sheaf on `Sp A`".

**Claim.**
- (a) Tate acyclicity is a headline of the Summary (README line 8) and is what AdicSpacesPartIII R3.1 consumes as "classical affinoid acyclicity". Only its degree-0 part, the sheaf condition, is stated. Vanishing of the Čech cohomology in positive degrees can be stated with Mathlib's Čech complex on the pinned subdomain poset, and it is neither stated nor named as unstatable.
- (b) The stalks the docstring says are missing do exist at the pin, so the G-ring half of Conrad Theorem 1.1.3 can be stated.

**Witness.** Both statements below elaborate in a scratch copy, with `sorry` as the only warning and no new definition. `exact?` closes neither.
- (a) uses `CategoryTheory.cechComplexFunctor` (`Mathlib/CategoryTheory/Sites/SheafCohomology/Cech.lean:65`). Its finite products come from the pinned `SemilatticeInf` (`TauCeti/AlgebraicGeometry/Rigid/Affinoid/Site.lean:44`) and `BoundedOrder` (`Presheaf.lean:239`).
- (b) uses `TauCeti.GTopology.point` (`TauCeti/Topology/GTopology/Points.lean:45`) with Mathlib's `GrothendieckTopology.Point.presheafFiber`.

**Repair.** Add the two theorems (statements as tested, inside the file's namespace with `open CategoryTheory`):

```lean
theorem cechComplex_exactAt_of_cover (A : Type*) [CommRing A] [Algebra K A]
    [Fact (TauCeti.IsAffinoidAlgebra K A)] {ι : Type} [Finite ι]
    (U : ι → TauCeti.AffinoidSubdomain K A) (hU : ∀ x : MaximalSpectrum A, ∃ i, x ∈ U i)
    (n : ℕ) (hn : 0 < n) :
    ((cechComplexFunctor U).obj (TauCeti.AffinoidSubdomain.presheaf (K := K) (A := A) ⋙
      forget₂ (CommAlgCat K) (AlgCat K) ⋙ forget₂ (AlgCat K) (ModuleCat K))).ExactAt n := by
  sorry

theorem isGRing_stalk {K : Type u} [NontriviallyNormedField K] [IsUltrametricDist K]
    [CompleteSpace K] (A : Type u) [CommRing A] [Algebra K A]
    [Fact (TauCeti.IsAffinoidAlgebra K A)] (x : MaximalSpectrum A) :
    TauCeti.Excellence.IsGRing
      ((((TauCeti.AffinoidSubdomain.weakGTopology (K := K) (A := A)).point x).presheafFiber
        (A := CommRingCat.{u})).obj (TauCeti.AffinoidSubdomain.presheaf (K := K) (A := A) ⋙
          forget₂ (CommAlgCat K) CommRingCat)) := by
  sorry
```

- The hypothesis `0 < n` is needed. In degree 0 the cohomology is `A`, which the sheaf condition gives; it is nonzero for `A ≠ 0`.
- Docstrings: [BGR] 8.2.1/1 with KiehlAB line 152–154 (p. 258) for the first; Conrad Theorem 1.1.3 (Conrad line 201, p. 5) for the second. The pinned `TauCeti.IsUniversallyCatenary` (`TauCeti/RingTheory/UniversallyCatenary.lean:56`) can state universal catenarity of the same stalk.
- Delete the stalk item from the "not statable" paragraph, and name both theorems in README §5.1 and §4.2.

## R03 (P2) — §8.2 targets Huber's Theorem 4.1, whose proof needs quantifier elimination that nothing supplies

**Location.** README lines 1473–1476: "Prove its equality with the constructible closure of the classical points ([Huber-CV] Theorem 4.1, p. 472); deduce their density". The *Needs:* list is at lines 1483–1487.

**Claim.**
- The cited source proves Theorem 4.1 using quantifier elimination for algebraically closed fields with a nontrivial valuation-divisibility relation. No layer, supplier section or pinned declaration provides this, and the *Needs:* line omits it.
- Theorem 4.1 is needed: AdicSpacesPartII R1.7 consumes it as clause (i) (`TauCetiRoadmap/AdicSpacesPartII/README.md` lines 10636–10638).
- The headline itself, Corollary 4.2, and Corollary 4.3 do not need Theorem 4.1, but the README routes them through it.

**Witness.**
- HuberCV lines 756–758 announce the model-theoretic input for (4.1), and lines 797–799 and 800–802 use it twice in the induction. It is cited from Prestel's model-theory text, item 4.17 (HuberCV line 1020).
- HuberCV lines 889–890: Remark 4.7 gives new proofs of (4.2)–(4.5) without (4.1).
- Quantifier elimination appears in pinned Mathlib only for Presburger arithmetic, and no roadmap on main plans it.

**Repair.**
1. Route Corollaries 4.2–4.3 through HuberCV Remark 4.7 (pp. 474–476) in §8.2 and in the docstring of `dense_range_maximalSpectrumToSpa`, replacing "from Theorem 4.1" there.
2. For Theorem 4.1, add the quantifier-elimination input as a target of this roadmap, with its locator (HuberCV line 797–799, Prestel 4.17), and list it in §8.2's *Needs:*. Alternatively, give a route for Theorem 4.1 that avoids it, with its locator.

## R04 (P2) — §6.3's composition law and every-affinoid inner-cover form need theories the Scope excludes

**Location.**
- README lines 1254–1256: "Formal models and Berkovich spaces are outside this roadmap, so those routes are inputs these two theorems need from outside it, not constructions here."
- Scope, lines 82–83: "Formal models, Raynaud's theorem, admissible blow-ups, Berkovich spaces … are outside this roadmap."

**Claim.** Two targets of §6.3 have no route that rests on a supplier:
- the inner-cover form of Kiehl properness over every affinoid open of the base;
- the composition law.

Both routes go through Raynaud formal models (Lütkebohmert) or Berkovich spaces (Temkin). The Scope excludes both, and a cited paper is not a supplier. This extends the previous review's R03, whose repair asked only that these papers be named.

**Witness.**
- Lutkebohmert lines 409–413: Theorem 3.1 and Corollary 3.2 are statements about admissible formal schemes.
- Temkin lines 792–800: Corollary 4.5 is proved through Berkovich's Theorem 4.1.
- Formal models are owned by AdicSpacesPartIII (main line 56), which consumes this roadmap.
- Part III's Kiehl theorems take the every-affinoid form as a hypothesis (main lines 10744–10753), so nothing downstream needs these two theorems from here.

**Repair.** Delete both theorems from §6.3 (lines 1239–1256) and from its *Needs:* line (1264–1267). Keep the existential definition, locality on the base, the base-change law ([Bosch] §6.3 Lemma 7) and finite morphisms. Under Scope and ownership, say that the two theorems are not planned here because their proofs need formal models or Berkovich spaces. Alternatively, move them to AdicSpacesPartIII R3.6 next to *proper-relatively-compact-covers*, with an old → new line. The Checks at lines 1271–1292 are unaffected.

## R05 (P3) — Results pinned in Tau Ceti are cited through roadmap sections or listed as targets

- **§0.2, lines 372–375 and *Needs:* 385–386, table row 134.** "Apply the Japanese-ring criteria of SchemeAndStackFoundations §0.20". The criteria the proof needs are pinned:
  - `TauCeti.Ring.IsJapanese.of_isPurelyInseparable` (`TauCeti/RingTheory/Japanese.lean:329`);
  - `TauCeti.Ring.isJapanese_iff_isPurelyInseparable` (`:359`);
  - `TauCeti.Ring.finite_integralClosure_of_isSeparable` (`:268`).
- **§0.2, lines 358–360.** "Develop … the weakly Cartesian finite-extension criterion and the comparison of finite-extension norms". Both are pinned:
  - `Module.Basis.forall_exists_bound_spectralNorm_iff` (`TauCeti/Analysis/Normed/Unbundled/SpectralNorm/Basis.lean:59`);
  - `TauCeti.IsWeaklyStable.exists_basis_norm_comparison` (`:102`).
- **§1.1 *Needs:* lines 471–472 and supplier rows 133 and 277.** These cite PadicFunctionalAnalysis §1.2 for open mapping and closed graph. That section says its contents are "In the pinned library, with nothing remaining" (PadicFunctionalAnalysis README line 408):
  - `ContinuousLinearMap.isOpenMap_of_isTate` (`TauCeti/Analysis/Normed/Operator/RingOpNorm/OpenMapping.lean:282`);
  - `LinearMap.continuous_of_isClosed_graph_of_isTate` (`:423`).

**Repair.** Cite these pinned names in the text, the *Needs:* lines and the `From Tau Ceti` paragraph. Drop "Develop" for the pinned §3.5 API. Keep SchemeAndStackFoundations §0.20 and PadicFunctionalAnalysis §1.2 only for what they plan beyond the pin.

## R06 (P3) — Some Checks compute nothing, leaving §8.3 and §5.2 with two discriminating Checks each

**Location and witness.**
- §8.3, lines 1524–1526: "These distinguish local image, full faithfulness and essential surjectivity." and "Check the affinoid case and the empty space." Neither computes a value.
- §5.2, lines 1104–1105: "Verify both the augmentation and differential under the comparison."
- Directives of the same kind are at §0.1 lines 342–343, §1.4 lines 646–647, §2.2 line 810 and §8.1 line 1456.

**Repair.** Replace each directive with a computed Check. Two examples, both computed here:
- **§8.3.** `r(Sp K)=Spa(K,K°)` is one point and `r(∅)=∅`. The rigid open unit disc is not affinoid, and its image `⋃ₙ{|T|ⁿ≤|ϖ|}` is not quasi-compact. This tests clause (v).
- **§5.2.** Take the Laurent cover of the unit disc and `M=K⟨T⟩/(T)`.
  - `M⊗K⟨T/ϖ⟩=K`.
  - `M⊗K⟨ϖ/T⟩=0`, because `T` is a unit where `|T|≥|ϖ|`.
  - The intersection term is `0`.
  - So the complex `0→K→K→0→0` is exact.

## R07 (P3) — Kiehl-AB locator for Tate's reduction step

**Location.** README lines 1064–1066 and `Suggested.lean` lines 139–141: "Tate's theorem as recorded in [Kiehl-AB] §1 (p. 258), whose Hilfssatz 1.3 reduces covers to Laurent covers".

**Witness.** KiehlAB lines 152–154 (p. 258) do record the sheaf property. Hilfssatz 1.3, however, is on p. 260 (KiehlAB lines 198 and 209–212). It refines a cover by special subdomains by a Laurent cover, on each member of which the induced cover is formal.

**Repair.** "… (p. 258); its Hilfssatz 1.3 (p. 260) refines a covering by special subdomains to a Laurent covering on each member of which the induced covering is formal."

## R08 (P3) — Name and README generality of the Banach function algebra theorem

**Location.** `Suggested.lean` line 128, `theorem banachFunctionAlgebra`. README lines 773–775: "For every reduced affinoid and complete algebra norm prove `‖f‖≤C|f|sup`".

**Claim.** The theorem is named with a lowerCamelCase noun, the shape Mathlib gives to definitions rather than theorems. The Lean statement also assumes `[IsUltrametricDist A]`, which the README sentence omits.

**Repair.** Rename the theorem after its conclusion in both files, for example `exists_norm_le_mul_supSeminorm`. Write "complete ultrametric algebra norm" at README line 774, as the Lean docstring already does.

## Status of the previous review's findings (r51, at 9562289)

- **R01 (two-way supply with Part II/III): repaired, except item 4.**
  - Line 29–30: "All three are downstream of this roadmap and supply nothing to it".
  - Every remaining mention of Part II, III or IV names a consumer or an ownership boundary.
  - The dependency check reports 0 problems.
  - Item 4 (formal functions) was resolved by a mapping that leaves the content unowned; see R01 above.
- **R02 (headlines not stated): repaired.** `Suggested.lean` lines 72, 102, 110 and 165 state weak stability, the G-ring and J-2 halves of excellence, and density. Pinned imports are at lines 4–12. New gaps are reported in R02 above.
- **R03 (Kiehl properness too strong): repaired.** Lines 1233–1236 use the existential form, matching Bosch lines 4959–4961. Follow-up in R04 above.
- **R04 (two false Checks): repaired**, at lines 640–643 and 968–974.
- **R05 (vacuous regular-locus target): repaired.** Lines 541–543: "contains a nonempty open subset of `Spec A`".
- **R06 (pinned results listed as targets): repaired.** See lines 430–434, 367–368, 545–546, 619–624, 725–727, 818–823, 946, 979–980 and 1138–1147. The remainder is in R05 above.
- **R07 (RestrictedPowerSeries sections): repaired**, at lines 317–324, 263–273 and 469–470. The Zariski-density import is gone.
- **R08 (locators): repaired, except the Kiehl-AB item.**
  - HuberCV Corollary 4.3 is now cited (line 1479).
  - The FK wording at lines 847–849 is correct.
  - The Kiehl-E Satz 3.5 item is moot, because §7.4 moved.
  - The Kiehl-AB wording is still imprecise; see R07 above.
- **R09 (missing Checks, wrong justification): repaired**, at lines 1275–1288 and 963–965.
- **R10 (order against #1854): repaired.** The merge-order block reads "`RigidAnalyticGeometry`: **this pull request** → #1808 → #1854."
- **R11 (house shape and timelessness): repaired.**
  - Conventions (line 91) now precede the supplier contracts (line 127).
  - Layer 3 has §3.1, Layer 4 has §§4.1–4.3 and Layer 5 has §§5.1–5.2.
  - The self-describing sentence and the "Coordinate" sentence are gone.

## Verified sound

**Gate and build.**
- The worker's gate at this head reports every check 0 and the build OK.
- `lake env lean …/Suggested.lean` exits 0 with seven `sorry` warnings, at lines 72, 88, 102, 110, 128, 146 and 165.
- The file has no `set_option`, no `lemma`, no sorry'd data and no other roadmap's module. It uses the `module`/`public import` header that 20 Suggested files in this repository use.

**Signatures.** I ran `#check @` on all seven declarations in one scratch file. Each keeps its binders: `[IsDomain A]`; `[IsUltrametricDist A] [CompleteSpace A] [IsReduced A]`; `[Fact (IsAffinoidAlgebra K A)]`; `[Algebra.FiniteType A B]`. Each matches its README statement (§0.2 line 369, §1.2 lines 500 and 537–540, §2.2 line 775, §5.1 line 1061, §8.2 line 1476). I changed nothing.

**Padding.** On a scratch copy I tried `first | (simp; done) | rfl | infer_instance | exact?` on every theorem. All seven fail, so none is padding. The Loogle and LeanSearch leads in `library-matches.md` state none of the targets.

**Dependency check (verbatim).** `depcheck: 234 roadmaps, 2271 edges, 0 problem(s)`.

**Library declarations at the pins.**
- 126 backticked README names resolve by `#check` in one scratch file. Seven more resolve in source because their modules have no object files: `SlightlyFiner.lean:98, 147, 213, 247, 282`, `Huber/TensorProduct/Restricted.lean:184`, and `TateAlgebra/Regular.lean:144` (namespace `TauCeti.MvPowerSeries`).
- All 22 `TauCeti/…` paths named in the README exist.
- Signatures read, each matching the prose:
  - `supSeminorm_le_norm` (every complete ultrametric normed affinoid);
  - `exists_supSeminorm_pow_eq_norm` (`∃ m ≥ 1, ∀ f`);
  - `mem_iff_supSeminorm_le_one_of_isReduced_quotient` (open bounded `B`, `ϖ` topologically nilpotent and left regular);
  - `comap_isMaximal` (the source need not be affinoid);
  - `exists_pointNorm_eq_supSeminorm` (`[Nontrivial A]`);
  - `supSeminorm_pow` (`n ≠ 0`);
  - `isClosedEmbedding_of_finite_injective`;
  - `isSlopeLE_iff_splittingField`;
  - `height_eq_ringKrullDim_of_isDomain`;
  - `isAffinoidAlgebra_isRestricted_iff_pow_eq_norm`;
  - `supSeminorm_eq_norm_of_normMulClass` (`NormMulClass` and `NormOneClass`);
  - `AlgHom.injective_of_injective_reductionMap` (`[IsReduced A]`);
  - `range_maximalSpectrumToSpa` (maximal support);
  - `continuous_algHom`;
  - `Subdomain/Kernel.lean:76` (`[IsDomain A]`) and `Subdomain/Flat.lean:89`;
  - `TauCeti.IsWeaklyStable` (`WeaklyStable.lean:36`, linear functionals bounded by `spectralNorm`);
  - `IsJapanese` (`Japanese.lean:125`), `IsGRing` (`GRing.lean:57`) and `regularLocus` (`Locus.lean:61`);
  - Mathlib `constructibleTopology` (`ConstructibleTopology.lean:43`, generated by open compact sets and their complements).

**Cross-roadmap citations resolved (41).**
- RestrictedPowerSeries on main: §§0.1, 1.1, 2.1, 2.2, 2.4, 3.3, Layer 4, §§5.1–5.4 and §6.2 (12 ids). §2.4's finite-extension maximum modulus and §5.4's monomial extension match their use.
- PadicFunctionalAnalysis at this head: §1.2, Layer 1 and §2.4. §2.4 states completed scalar extension as a target on the pinned `BanachModule.CompletedTensor`.
- SchemeAndStackFoundations at this head: §§0.20 and 0.21.
- AdicSpaces (Completed): Layers 1–5 and §3.1.
- Downstream ids on main: AdicSpacesPartII R0.9, R1.1, R1.7 and R1.9 (lines 4071, 8427, 9806, 10509); AdicSpacesPartIV F1.1 and R5.7; LocallyAnalyticDistributions §4.16 at its open head (lines 254 and 861).
- Every AdicSpacesPartIII target in the old → new list exists on main (lines 595–608, 9884, 10727, 10839, 10853, 10980, 11077, 11097, 11111, 11261, 11458). Each carries its own route, except *proper-cohomology-adic-completion* (R01).
- The old → new list covers every dropped id that others cite: §7.4 (AdicSpacesPartIV line 446; PadicHodgeTheory head line 1374), §7.5 (AdicSpacesPartIII) and §8.4 (CohomologyComparisonsPartII line 765; PadicHodgeTheory line 1451). The overlap tool still lists them because it does not parse the bulleted form. Only the §7.5 entry is defective (R01).
- Overlaps: #1808 and #1854 are ordered after this pull request. No cited id is dropped by another pull request.

**Ownership against open pull requests.** Using `roadmaps grep` over every open head and main, I searched for: Banach function algebra, weak stability, the Gauss fraction field, excellence of affinoids, Tate acyclicity, constructible density, the identity principle, and rigid analytification. The only other roadmaps that touch these objects consume this one: AdicSpacesPartII R1.7 and R1.9, ResolutionOfSingularitiesCharacteristicZero ("From RigidAnalyticGeometry"), and the AdicSpacesPartIV dagger identity principle, which transports Part II's. No other `Suggested.lean` states these theorems.

**Source sample read against the text.**

| Target | Locator | Read at | Verdict |
| --- | --- | --- | --- |
| 0.1 | RestrictedPowerSeries §§1.1, 2.1–2.2, 2.4, 3.3, 5.1–5.3 | that README, lines 247–600 | items present as cited |
| 1.3 | [BGR] 6.1.1; PadicFunctionalAnalysis §2.4 | PFA README line 542 | PFA target matches (countable type of `Tₙ`); BGR uncertified |
| 1.4, 2.1, 2.2, 3.1, 4.3, 5.2 | [BGR] 6.1.4–6.1.5, 7.2, 3.8, 6.2, Chs. 7–8, 8.2 | — | BGR uncertified; checked against the pinned names instead |
| 2.3 | FK B.1.3(1), p. 236 | FK lines 10017, 10032–10036 | matches; stated without proof, as written |
| 5.1 | Kiehl-AB §1, p. 258; Hilfssatz 1.3 | KiehlAB lines 117, 152–154, 198, 209–212 | sheaf property ✓; Hilfssatz page and content (R07) |
| 6.2 | [Bosch] §5.3; [Conrad] §3.1 | Bosch line 3943; Conrad lines 85, 821–822 | match (BGR 9.3.6 recorded, quasi-separated) |
| 6.3 | [Bosch] §6.3 Def. 6, 8, Lemma 7; [Temkin] Cor. 4.5–4.6; [Lütkebohmert] 2.6, 3.1, 3.2 | Bosch lines 4933–4968; Temkin 787–811; Lutkebohmert 330, 409, 413 | match (route issue R04) |
| 7.3 | [Conrad] Lemma 2.1.4 (pp. 12–13), 2.1.5 | Conrad lines 554–571 | statement and hypotheses match |
| 8.1 | [Conrad] App. A; [Conrad-RA] Ex. 2.2.11 | Conrad lines 1531–1592; ConradRA lines 854–899 | match, including field-extension compatibility |
| 8.2 | [Huber-CV] Thm 4.1, Cor. 4.2–4.3 | HuberCV lines 766–826, 889–999 | `L_A` and statements match; route (R03) |
| 8.3 | [Huber-FR] Prop. 4.5 | HuberFR lines 1436–1447, p. 543 | (i)–(v) match README lines 1504–1509 |
| 1.2 | [Conrad] §1.1, Thm 1.1.1, 1.1.3 | Conrad lines 129–206 | match (Kiehl in all characteristics, two inputs) |

**Adversarial table** (values computed by hand; `0<|ϖ|<1`).

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `isWeaklyStable_gaussFractionField` | `n=0`; char `p`, `n=1`, `L=Frac(T₁)(T^(1/p))`, `φ`=coefficient of 1 | `Frac(T₀)≅K`, pinned complete case; `y=Σ_{i<p}aᵢT^(i/p)`: `spectralNorm y=|Σaᵢ^pTⁱ|^(1/p)=maxᵢ|aᵢ|` (exponents `pn+i` distinct), `|φ y|=|a₀|`, so `C=1` | true | none |
| same, wrong model | completed fraction field | the complete case would apply; the carrier is the uncompleted `FractionRing` with the Gauss norm | excluded by carrier | none |
| `isJapanese_of_isAffinoidAlgebra` | `K`; `K⟨T⟩` char `p`; `K⟨T⟩×K`; `0` | field (`of_field`); closure `K⟨T^(1/p)⟩` free of rank `p`; last two excluded by `[IsDomain A]` | true | none |
| `isGRing_of_isAffinoidAlgebra` | `0`; `K`; `K⟨T⟩×K` | no primes; `K→K̂=K` regular; product of G-rings | true | none |
| `isOpen_regularLocus_of_finiteType` | `B=K[x,y]/(y²−x³)` in char 2, 3, other; `K[ε]/(ε²)`; `0` | Jacobian `(x²,0)`, `(0,2y)`, `(−3x²,2y)`, each vanishing on the curve only at the origin, so the locus is `Spec B∖{(x,y)}`; `∅`; `∅` | true (open) | none |
| `banachFunctionAlgebra` | `K⟨T⟩/(T²)`; `K×K` max norm; `K⟨T⟩` with `2·`Gauss; `0` | `‖T‖=1`, `|T|sup=0` (excluded by reducedness); `C=1`; `C=2>1` forces `∃C`; `0≤C·0` | true | R08 |
| `isSheaf_affinoidSubdomain_presheaf` | Laurent cover; `A=0` | `Σ_{n∈ℤ}cₙTⁿ` on `|T|=|ϖ|` splits into `n≥0` and `n<0` parts; kernel is `K⟨T⟩`; empty cover gives `0` | true | none |
| positive-degree acyclicity (R02 probe) | `n=0` against `n≥1`; `A=0` | `H⁰=A≠0`, so `0<n` is needed; `H¹=0` as above; all terms `0` | statable, true | R02 |
| `dense_range_maximalSpectrumToSpa` | `K`; `{v(T)=|ϖ|}` in the disc; rank-two `η⁻`; `0` | one point, classical; contains `T=ϖ`; `{η⁻}` is constructibly closed but not constructible; `∅` dense in `∅` | true | R03 (route) |
| stalk G-ring (R02 probe) | origin of the disc | stalk `=⋃_{r<1}K⟨T/r⟩`, excellent (Conrad line 201) | statable | R02 |
| §0.1 Checks | `p+T²`; `p+T+pT²`; `n=0` | Gauss norm 1, `|1+p|=1`, value at 0 is `p⁻¹`; reduction `T`; `K` | true | none |
| §0.2 example | `T₁[√T]`; `T₁[T^(1/p)]` | `K⟨S⟩` normal of rank 2; rank `p` | true | R05 |
| §1.1 Checks | `K⟨T⟩/(T²)`; `K×K` | `‖T‖=1`, `T²=0`; `𝔪₁ⁿ=0×K`, `𝔪₁∩𝔪₂=0` | true | R05 |
| §1.2 Checks | cusp; `ℚ_p⟨T⟩/(T²−p)`; `K⟨T⟩×K` | `Y`-distinguished of degree 2, dim 1; residue field `ℚ_p(√p)`, `|T|=p^(−1/2)`; height 0 against dim 1 | true | none |
| §1.3 Checks | `Σϖⁿ XⁿYⁿ`; `A_L`, `L=ℚ_p(√p)`, including `p=2` | diagonal matrix of infinite rank, against rank `≤r`; `|2√2|=2^(−3/2)≠0`, a unit, so `A_L≅L×L` | true | none |
| §1.4 Checks | `f=T/ϖ`; `|f|sup≤1`; `g=f=0` | `K⟨S⟩` with `T=ϖS`, not `A`; `A⟨S⟩/(S−f)≅A`; `A⟨S⟩`, `g` not inverted | true | R06 |
| §1.5 | `ρ=p^(−1/2)`; `ρ∉p^ℚ` | `ρ²/|p|=1`; `ℚ_p⟨S,T⟩/(T²−pS)≅T_{1,ρ}` (`|a_{2j+e}pʲ|=|a_{2j+e}|ρ^{2j}→0`); no `n` | true | none |
| §2.1 Checks | `K×K`; `X²−p` | `0≠1·1`; `|p|^(1/2)` attained, while exponent 1 gives `p⁻¹<p^(−1/2)` | true | none |
| §2.2 multiplicativity | annulus `XY=c` | `|X|sup=|Y|sup=1`, `|XY|sup=|c|`; `Ã=K̃[X,Y]/(XY)` is not a domain, consistent with the criterion | true | none |
| §2.3 Checks | `S²=p²T`; `ℤ_p`, `ϖ=p²`; `𝒪_{ℂ_p}`, `ϖ=p` | `B=ℤ_p⟨U²⟩⊕pUℤ_p⟨U²⟩`, `B/pB=𝔽_p[T]⊕𝔽_p[T]s` with `s²=0`, `U∉B`; `ℤ/p²` nonreduced while `B=A°`; `p^(1/2)` nilpotent | true | none |
| §3.1 Checks | `K⟨T⟩/(T²)`; bidisc; `K⟨T⟩×K` | one point, dim-2 ring; completed tensor; idempotents | true | none |
| §4.1 origin | `A′` with one point | finite over `K`, `t^N=0`; `K⟨T⟩→K[T]/(T^(N+1))` does not factor | true | none |
| §4.2 stalk | `Σϖ^(−n)T^(n!)` | `|ϖ|^(−n)r^(n!)→0` for `r<1`, unbounded as `r→1`; by contrast `Σϖ^(−n)Tⁿ=ϖ/(ϖ−T)∈A_𝔪` | true | none |
| §4.3 Checks | `K⟨T⟩→K⟨T/ϖ⟩`; `K⟨T⟩×K`; `K⟨T⟩/(T²)` | `1−T` is a unit; `(0,1)↦0`; `|T|=1` is empty, so the restriction is `0` | true | none |
| §5.2 module form | `M=K⟨T⟩/(T)`, Laurent cover | `K`, `0` (`T` a unit), `0`; `0→K→K→0` exact | true | R06 (Check) |
| §6.1 Checks | `ℕ` with finite covers; constant `ℤ` on two points | bounded functions glue, but `f(n)=n` fails for singletons; sheafification `ℤ×ℤ` | true | none |
| §6.2 Checks | open disc ∪ circle; `|T|ⁿ≤|ϖ|` | gluing `0`/`1` contradicts §7.3; radii `|ϖ|^(1/n)→1` | true | none |
| §6.3 Checks | punctured disc; two gluings; `ℙ¹` | the first `N` annuli miss `ϖ^(N+1)`; the open disc is not quasi-compact; the closure of `{(t,t)}` contains `(0,0)`; `S↦T⁻¹` is onto | true | none |
| §6.3 inner relation | unit disc in itself | `fᵢ` reduce to 0, so `T̃` would be integral over `K̃` | true | none |
| §6.3 composite and every-affinoid form | Lutkebohmert lines 409–413; Temkin lines 792–800 | routes need formal models or Berkovich spaces | input excluded by Scope | R04 |
| §7.2 Checks | `c·id`, `|c|=r`; `X−c` against `1−cT`, `|c|<1` | `|c|≥r`; `a₀` a unit kills `M₁` for `U=0`; `c` fails, `1/c` passes | true | none |
| §7.3 Checks | axes `XY=0`; `K⟨T⟩×K` | `Y≠0` vanishes on `{X≠0}`; `(0,1)` vanishes on the disc | hypotheses needed | none |
| §8.1 Checks | `y²=x²(x+1)`; finite `A` | branches `y=±x√(1+x)`; `Sp A=Spec A` (ConradRA lines 859–860) | true | none |
| §8.2 Theorem 4.1 | HuberCV lines 756–802, 889–890 | quantifier elimination used; Remark 4.7 avoids it for 4.2–4.5 | input unowned | R03 |
| §8.3 | HuberFR Prop. 4.5 | (i)–(v) match | true | R06 |
| old §7.5 → Part III | AdicSpacesPartIII lines 11028–11043 | the target transports and needs §7.5 | unowned | R01 |
| old §1.3, §7.1, §7.3, §7.4, §8.4 → Part III | lines 9884, 10727, 10839–10980, 11077, 11458; R3.2–R3.4 | each has its own route and locator | owned | none |

## Not verifiable

- **[BGR]** is recorded as `uncertified` (paywalled) and is settled; I took its locators at their numbers without the text. In the sample these are §§1.3, 1.4, 2.1, 2.2, 3.1, 4.3, 5.1 and 5.2 (6.1.1, 6.1.4–6.1.5, 7.2, 3.8, 3.8.3/7, 6.2.1–6.2.4, Chapters 7–8, 8.2.1/1) and §0.2's 2.3.2/7, 3.5.1–3.5.3, 4.1/3–4, 4.4/2 and 5.3.1/1. Where the result is pinned, I checked the statement against the pinned declaration instead. BGR 9.3.6 is corroborated by Conrad lines 85 and 821–822, and BGR 9.6.2/2 by Temkin line 788. The truth of the headline "weak stability of `Frac(Tₙ)` in characteristic `p`" (BGR 5.3.1/1) was checked only on the instance in the table.
- **KiehlAB and Lutkebohmert** are OCR scans. The passages used (KiehlAB lines 117, 152–154, 198, 209–212; Lutkebohmert lines 330, 409, 413) are legible.

## Source issues

- none
