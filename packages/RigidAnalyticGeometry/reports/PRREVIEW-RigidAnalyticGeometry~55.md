# Review of RigidAnalyticGeometry (pull request #1807 at 953b278)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/RigidAnalyticGeometry/` at `953b278a16e9c0d0465e16cb085e6d82b0cb8af0`. The folder changed by 531 lines since `d1900d4`, the head the previous review read.

- **Gate, build and dependencies.** The worker's gate passes every check. `Suggested.lean` elaborates with eleven `sorry` warnings and no other output. The dependency check reports 0 problems.
- **Previous findings.** R02–R07 of the previous review are repaired. R01, the formal-functions theorem that loses its owner, is not repaired and returns below as R01.
- **New findings.** There are four:
  - The Gerritzen–Grauert theorem is now a target and can be stated at the pins, but `Suggested.lean` does not state it (R02, P2).
  - The excellence route cites Conrad for a proof that Conrad does not give (R03).
  - §4.3's two new definitions have no API and no Checks (R04).
  - `ϖ` is never fixed, although the new Kisin target depends on `0<|ϖ|<1` (R05).

## R01 (P1) — §7.5 (formal functions) still has no owner once this pull request merges

**Location.** `TauCetiRoadmap/RigidAnalyticGeometry/README.md` line 73. The table row reads: "| §7.5 | Principal filtrations and formal functions ([Kiehl-E] Theorem 3.4, p. 206, and Theorem 3.7, p. 210) … | AdicSpacesPartIII R3.6 *proper-cohomology-adic-completion* |".

**Claim.**
- The head deletes §7.5 and maps it to an AdicSpacesPartIII target.
- On main, that target proves nothing. It transports this roadmap's §7.5, and its *Needs:* line names §7.5. Read through the table, the citation therefore points back at the target itself.
- After the merge, no roadmap plans a proof of Kiehl-E Theorems 3.4 and 3.7.
- This pull request does not change AdicSpacesPartIII, and no open pull request does: `roadmaps grep` finds the target name only on main.
- The description admits the gap ("AdicSpacesPartIII is to prove it from its own proper-cohomology finiteness") but does not close it.
- No repair report marks this finding as not actionable.

**Witness.** `TauCetiRoadmap/AdicSpacesPartIII/README.md` on main:
- line 11031: "transport RigidAnalyticGeometry §7.5's completion theorem and stable principal filtration";
- line 11042: "*Needs:* RigidAnalyticGeometry §7.5".

Lines 102 and 604 and its `Suggested.lean` line 51 say the same.

**Repair.** Add `TauCetiRoadmap/AdicSpacesPartIII/` to this pull request, or to a pull request that the merge-order paragraph places before it, and make two changes there.
- Rewrite R3.6 *proper-cohomology-adic-completion* as the proof of [Kiehl-E] Theorem 3.4 (p. 206) and Theorem 3.7 (p. 210).
  - Prove it from Part III's own *proper-affinoid-cohomology-finite* and the finiteness over the Rees ring `⊕ₙaⁿA` (KiehlE pp. 206–208).
  - Carry over the statement now in the table row.
  - Carry over main's §7.5 Checks: `a=0`, `a=1`, and the identity of `Sp A` in degree 0.
- Delete "RigidAnalyticGeometry §7.5" at Part III README lines 102, 604, 11031 and 11042 and at its `Suggested.lean` line 51.

Restoring §7.5 here is not a repair. The theorem is about `Hⁱ(X,F)`, which is Part III's coherent cohomology, so this roadmap would have to consume Part III, and that is a cycle.

## R02 (P2) — The Gerritzen–Grauert theorem can be stated at the pins, but `Suggested.lean` neither states it nor names it as unstatable

**Location.**
- README line 1133: "Prove the Gerritzen–Grauert theorem: for a locally closed immersion `φ` there are finitely many rational subdomains `X₁,…,X_r` covering `Sp A`…".
- `Suggested.lean` lines 34–61: the docstring's "Stated below" and "Not statable" lists. Neither mentions Gerritzen–Grauert.

**Claim.**
- The head makes Gerritzen–Grauert one of this roadmap's principal theorems:
  - it is the title of §4.3;
  - the build paragraph names it (line 367), and so does step 3 of the dependency order (line 2004);
  - AdicSpacesPartII consumes it by name as *gerritzen-grauert* (Downstream consumers, line 2031; Part II README line 8470 on main), and so does AdicSpacesPartIV (line 384 on main).
- The acceptance file already states deep Layer 4–5 results that the Summary does not list, namely stalk excellence. So leaving Gerritzen–Grauert out is not explained by the Summary.
- Its finite-union form can be stated on pinned carriers:
  - `TauCeti.AffinoidSubdomain` (`AlgebraicGeometry/Rigid/Affinoid/Presheaf.lean:45`);
  - `TauCeti.rationalDomain` (`RingTheory/Affinoid/Subdomain/Rational.lean:79`).

**Witness.** The statement in the repair elaborates at the pins with only a `sorry` warning. I tested it on a scratch module importing Mathlib, `TauCeti.RingTheory.Affinoid.Subdomain.Rational` and `TauCeti.AlgebraicGeometry.Rigid.Affinoid.Site`.

**Repair.**
1. Add the following to `Suggested.lean`, under a `/-! ## Layer 4: affinoid subdomains, local rings and covers -/` comment placed before Layer 5.
   ```lean
   /-- The Gerritzen–Grauert theorem, finite-union form (Bosch §3.3 Theorem 20, p. 60;
   §4.2 Corollary 12, p. 77): every affinoid subdomain of `Sp A` is a finite union of rational
   domains `R(fᵢ/gᵢ)` with `(gᵢ, fᵢ)` generating the unit ideal. -/
   theorem exists_eq_iUnion_rationalDomain (A : Type*) [CommRing A] [Algebra K A]
       [Fact (TauCeti.IsAffinoidAlgebra K A)] (U : TauCeti.AffinoidSubdomain K A) :
       ∃ (n : ℕ) (m : Fin n → ℕ) (g : Fin n → A) (f : (i : Fin n) → Fin (m i) → A),
         (∀ i, Ideal.span (insert (g i) (Set.range (f i))) = ⊤) ∧
           (U : Set (MaximalSpectrum A)) = ⋃ i, TauCeti.rationalDomain K (g i) (f i) := by
     sorry
   ```
2. Add `public import TauCeti.RingTheory.Affinoid.Subdomain.Rational` to the imports.
3. Name the theorem in §4.3 and in the docstring's "Stated below" list.

Instances checked against this statement:
- `A=0`: `U=∅`, with `n=0`.
- `U=Sp A`: `n=1`, `g=1` and no `f`.
- The annulus `|ϖ|≤|T|≤1`: `n=1`, `g=T`, `f=ϖ`.

Negative control for the unit-ideal clause: without it, `rationalDomain K T ![]` would be the punctured disc `{T≠0}`, which is not an affinoid subdomain.

## R03 (P3) — §1.2's excellence route cites Conrad for a proof Conrad does not give

**Location.** README lines 623–632: "Prove that affinoid algebras are excellent in every characteristic: Kiehl's theorem, whose proof [Conrad] §1.1 (pp. 3–5) explains. … it suffices to treat Tate algebras and to prove two inputs".

**Claim.**
- What Conrad §1.1 proves:
  - the reduction to the two inputs;
  - Kiehl's regularity criterion (Theorem 1.1.1 and Corollary 1.1.2).
- What it does not prove: either input. Those inputs are the open regular locus of an affinoid domain and the geometrically regular formal fibres of `(Tₙ)_𝔪`.
- Conrad credits characteristic 0 to Matsumura's *Commutative Algebra*, Theorem 102, and characteristic `p` to Kiehl [K3]. Neither is in **References**.
- As a result, the substantive step of the headlines `isGRing_of_isAffinoidAlgebra` and `isOpen_regularLocus_of_finiteType` has no proving source and no route.
- Conrad also remarks that Kiehl's argument seems to need faithful flatness of `A→A⊗̂_K L`. The head hands that fact to AdicSpacesPartIII (table row §1.3). If the remark is right, §1.2 would consume Part III, which consumes this roadmap: a cycle.

**Witness.**
- Conrad lines 135–140: characteristic `p` excellence is "proven … by Kiehl [K3]"; Conrad explains only Satz 2.2 of [K3].
- Conrad lines 151–153: the formal-fibre claims are stated but not proved.
- Conrad line 269: "Kiehl's arguments in [K3] also seem to require this".

**Repair.**
1. Replace "whose proof [Conrad] §1.1 (pp. 3–5) explains" with "which [Conrad] §1.1 (pp. 3–5) reduces to two inputs, proving Kiehl's regularity criterion".
2. Add to **References** and to the manifest:
   - R. Kiehl, *Ausgezeichnete Ringe in der nichtarchimedischen analytischen Geometrie*, J. reine angew. Math. 234 (1969), 89–98 (Conrad line 1827);
   - Matsumura, *Commutative Algebra*, Theorem 102, for characteristic 0.
3. State the two inputs as targets, each with its locator in [K3], and give the route with its inputs in *Needs:*.
4. If that route uses faithful flatness of `A→A⊗̂_K L` (Conrad Lemma 1.1.5(1), p. 6), state it here in §1.3 and have AdicSpacesPartIII cite it. It cannot be consumed from Part III.

## R04 (P3) — §4.3 defines locally closed and Runge immersions with no API and no Checks

**Location.** README lines 1129–1133: "A morphism `φ:Sp A'→Sp A` of affinoid spaces is a *locally closed immersion* if it is injective on classical points and every stalk map … is surjective, and a *Runge immersion* if it is a closed immersion into a Weierstrass domain".

**Claim.**
- These are two new definitions. Each needs API bullets and at least three discriminating Checks.
- §4.3's four Checks test Gerritzen–Grauert, the refinement and Kisin's lemma.
- None of them separates a locally closed immersion from a morphism that is merely injective, or a Runge immersion from a locally closed one.

**Witness.** Take the normalisation of the cusp, `K⟨X,Y⟩/(Y²−X³)→K⟨t⟩` with `X↦t²` and `Y↦t³`.
- It is bijective on classical points: `(a²,a³)=(b²,b³)` with `a≠0` forces `a=b`.
- The completed stalk map `K⟦t²,t³⟧→K⟦t⟧` misses `t`, so it is not a locally closed immersion.

**Repair.**
- Add API bullets in prose, each with its locator:
  - closed immersions, and inclusions of affinoid subdomains, are locally closed immersions;
  - each class is stable under composition and under restriction to affinoid subdomains of the target ([Bosch] §4.2 Remark 2, p. 69);
  - a finite locally closed immersion is a closed immersion (Proposition 3, p. 70);
  - an open and closed immersion is the inclusion of a Weierstrass domain (Proposition 4, p. 71).
- Add Checks:
  1. The cusp normalisation above. This agrees with Proposition 3, because `t` is not in the image of `K⟨X,Y⟩/(Y²−X³)`.
  2. The inclusion of the annulus `|ϖ|≤|T|≤1` into the disc is an open immersion but not a Runge immersion. An open Runge immersion defines a Weierstrass domain (proof of Corollary 11, pp. 76–77), and §4.3's first Check shows that the annulus is not one.
  3. With `|2|=1`, the map `T↦S²` is finite but has two points over `T=c²`, so it is not a locally closed immersion.
  4. The origin `Sp K→Sp K⟨T⟩` is a closed immersion, and therefore a Runge immersion with `W` the whole disc.

## R05 (P3) — `ϖ` is never fixed, yet the Kisin target is stated with `|ϖ|ⁿ`, and §2.3 uses `ϖ` for something else

**Location.**
- README line 1160: "there is `n≥1` with `{x : |fₖ(x)|≤|ϖ|ⁿ for all k}⊆W₁∪…∪W_m`".
- Conventions item 1 (line 96) fixes `K` but introduces no `ϖ`.
- Line 943 uses the same letter differently: "`ϖ∈B` which is topologically nilpotent and left regular in `A`".

**Claim.**
- The Kisin statement is true only when `0<|ϖ|<1`. Its route also uses that the values `v(ϖ)ⁿ` are cofinal towards zero.
- The README fixes `0<|ϖ|<1` in only one place, a §6.2 Check (line 1524).
- §2.3 gives `ϖ` a second meaning, an element of `B` that need not be a scalar ("The element `ϖ` need not be a scalar").

**Witness.** Take `|ϖ|=1`, `I=(T)` on the disc, and `W₁={|T|≤|c|}` with `0<|c|<1`. Then `V(I)={0}⊆W₁`, but `{|T|≤|ϖ|ⁿ}` is the whole disc for every `n`.

**Repair.**
- Add to Conventions item 1: "Fix `ϖ∈K` with `0<|ϖ|<1`; `ϖ` denotes this element throughout."
- Rename §2.3's element (lines 943–950), for example to `t∈B`.

With the convention in place, the instance above holds for every `n` with `|ϖ|ⁿ≤|c|`.

## Status of the previous review's findings (r54, at d1900d4)

- **R01 (formal functions unowned): not repaired.**
  - AdicSpacesPartIII is unchanged.
  - The description now admits the gap.
  - See R01 above.
- **R02 (quantifier elimination without route or source): repaired.**
  - **Prestel** is in **References** and in the manifest (`uncertified`).
  - Lines 1816–1897 state the target and give the four-step route: the substructure test, the algebraic extension, the conjugacy of extensions, and one transcendental element.
  - Every step names its inputs in *Needs:*.
  - All six Mathlib inputs exist at the pin with the hypotheses used; see Verified sound.
- **R03 (Gerritzen–Grauert not stated): repaired.**
  - §4.3 (lines 1127–1155) states Bosch §4.2 Theorem 10 and Corollaries 11–12, and the refinement of Lemma 4.3/4.
  - It gives *Needs:* and four Checks. The new defect in this section is R04.
- **R04 (Kisin's lemma unlisted): repaired.**
  - Lines 1157–1191 state the lemma with a route through `Spa(A,A°)` that avoids formal models.
  - §5.3's *Needs:* lists it.
- **R05 (Layer 4/Layer 5 cycle): repaired.**
  - §4.2 proves the stalk statements from the presheaf colimit, following Bosch §4.1 Propositions 1, 2 and 6.
  - Layer 4's Dependencies read "Nothing of Layers 5–8 is used".
  - Stalk excellence is now §5.3, after the sheaf condition, and the `Suggested.lean` theorems moved with it (lines 185–221).
- **R06 (pinned adic acyclicity cited through a roadmap): repaired.**
  - The `From Tau Ceti` paragraph (lines 296–315) names the pinned declarations, and so does §5.1's *Needs:* (lines 1304–1317).
- **R07 (description): repaired.**
  - The "Ownership moves" bullet and the RigidAnalyticGeometry paragraph list the moves, the new §4.3 and §8.2 targets, and the eleven headlines.

## Verified sound

**Gate and build.**
- The worker's gate passes every check, including `build=0` and `depcheck=0`.
- My own run of the gate command matches, except for `outside-folder=26`. Those 26 files are the README and `Suggested.lean` of the 13 other folders that the brief names as this pull request's own, so they are not findings.
- `git diff --stat origin/main...HEAD`, excluding the 14 own folders, is empty.
- `lake env lean` on `Suggested.lean` exits 0 with eleven `declaration uses sorry` warnings and nothing else (lines 85, 101, 115, 123, 141, 160, 174, 199, 212, 234 and 252).
- The file has no `set_option`, no `lemma`, no sorry'd data and no definitions. Its imports are `Mathlib` plus eleven pinned `TauCeti.*` modules.

**Dependency check (verbatim).** `depcheck: 223 roadmaps, 2035 edges, 0 problem(s)`

**Signatures.** I compared all eleven elaborated types (`#check @`) with their README statements. Every binder the statement needs is present:
- `[IsDomain A]` (Japanese);
- `[IsUltrametricDist A] [CompleteSpace A] [IsReduced A]` (Banach function algebra);
- `[Fact (IsAffinoidAlgebra K A)]` (sheaf, Čech, stalks);
- `[Finite ι]`, the covering hypothesis `hU` and `0<n` (Čech);
- `[Algebra.FiniteType A B]` (J-2).

No binder was lost and I changed nothing. The generality matches README lines 446, 590, 627–630, 869–872, 1288–1297, 1366–1367, 1780 and 1802.

**Padding.** On a scratch copy I replaced every `sorry` with `first | (simp; done) | rfl | infer_instance | exact?`. All eleven fail with "`exact?` could not close the goal", so none is padding.

**Headlines.**
- The Summary's milestones that can be stated at the pins are all stated:
  - weak stability of the Gauss fraction field;
  - finiteness of normalisation;
  - the G-ring and J-2 halves of excellence;
  - the Banach function algebra theorem;
  - Tate acyclicity in sheaf and Čech form;
  - Huber 4.1 and 4.2.
- The file also states stalk excellence.
- Noether normalisation, maximum modulus and the pinned parts of integral reduction are proved at the pin.
- The docstring names rigid spaces, properness, the identity principle, analytification, the rigid–adic equivalence and quantifier elimination as not statable.
  - `TauCeti/AlgebraicGeometry/Rigid/` holds only `Affinoid/`.
  - Mathlib's `FirstOrder.Language.Theory.ACF : ℕ → Language.ring.Theory` fixes the characteristic and has no valuation relation, so ACVF is not at the pin.
- The one omission is Gerritzen–Grauert (R02).

**Library declarations opened at the pins.**
- Tau Ceti:
  - `IsJapanese` (`RingTheory/Japanese.lean:125`; its `of_isIntegrallyClosed` covers perfect fraction fields, so only characteristic `p` is new);
  - `IsGRing` (`RegularLocalRing/GRing.lean:57`, Stacks 15.51.1);
  - `regularLocus` (`Locus.lean:61`, not asserted open);
  - `IsUniversallyCatenary` (`UniversallyCatenary.lean:56`);
  - `IsWeaklyStable` (`WeaklyStable.lean:36`);
  - `GaussFractionField` (`FractionField.lean:58`, `WithAbs` of the uncompleted field);
  - `AffinoidSubdomain` (`Presheaf.lean:45`);
  - `rationalDomain` (`Rational.lean:79`);
  - `maximalSpectrumToSpa` (`MaximalIdealPoint.lean:237`; injectivity at 268, image at 274);
  - `quasiIso_cechAugmentation_spaRationalOpens_of_iSup_eq` (`Rational/Cech.lean:178`: strongly noetherian Tate, a rational `W`, `[Nonempty ι]`);
  - `isSheafFor_ofArrows_spaRationalOpens_of_iSup_eq` (`Rational/Cover.lean:276`);
  - `isSheaf_presentationLimitPresheaf_of_isStronglyNoetherian` (`StronglyNoetherian.lean:90`);
  - `spa_eq_biUnion_rationalSubset_of_span_eq_top` (`RationalSubset/Basic.lean:451`, any ring);
  - `exists_span_eq_top_forall_rationalSubset_subset_of_isOpen_of_iUnion_eq_univ` (`Refinement.lean:184`);
  - `IsAffinoidAlgebra.isStronglyNoetherian` (`TopologicallyFiniteType.lean:92`);
  - the `SpectralSpace` instance on `spa` (`Spectral.lean:90`).
- Mathlib:
  - `LocalSubring.exists_le_valuationSubring`;
  - `Algebra.IsInvariant.exists_smul_of_under_eq_of_profinite`, which needs a profinite `G`, discrete `B`, `ContinuousSMul` and `IsInvariant`, all of which hold for the integral closure with the absolute Galois group over the perfect closure;
  - `IsAlgClosed.lift` (needs `Algebra.IsAlgebraic`);
  - `ElementaryEmbedding.ofModelsElementaryDiagram`;
  - `Theory.isSatisfiable_iff_isFinitelySatisfiable`;
  - `compactSpace_withConstructibleTopology` (compact, quasi-sober, prespectral, quasi-separated);
  - `cechComplexFunctor` (`HasFiniteProducts` on the poset of subdomains).

**README names.**
- All 142 qualified backticked names resolve: 128 by `#check`, and 13 by source because their modules have no object files at the pin. One name is the module path `TauCeti.RingTheory.MvPowerSeries.TateAlgebra.Basic`.
- The 13 source-checked names are at `SpectralNorm/Basis.lean:59, 102`, `GTopology/SlightlyFiner.lean:98, 147, 213, 247, 282`, `Huber/TensorProduct/Restricted.lean:184`, `TateAlgebra/Regular.lean:144`, `Rational/Cech.lean:178`, `Rational/Cover.lean:276`, `StronglyNoetherian.lean:90` and `Refinement.lean:184`, each in the namespace the README gives.
- The README backticks the eleven `Suggested.lean` names and no other unqualified name of its own.

**Cross-roadmap citations resolved.**
- RestrictedPowerSeries on main: §§0.1, 1.1, 2.1, 2.2, 2.4, 3.3, Layer 4, §§5.1–5.4 and §6.2 (headings at lines 193, 247, 306, 324, 364, 424, 452, 524, 541, 567, 587 and 630).
- PadicFunctionalAnalysis at this head: Layer 1, §1.4 and §2.4 (lines 398, 461, 571).
- SchemeAndStackFoundations §0.21 at this head (line 1470).
- AdicSpaces (`Completed/`): Layers 1–5 and §§2.3, 2.4, 3.1 (lines 272, 360, 413, 440, 456, 461, 554, 631).
  - §2.4 gives the quotient pair as a closed subspace.
  - §3.1 identifies `Spa(A_U,A_U⁺)` with `U`.
  - Since `A_U⁺` is open and contains the image of a presentation ring, it equals `(A_U)°` by §2.3. That is what Kisin's route needs.
- AdicSpacesPartII on main: R0.3 (1769), R0.4 (2270), R0.5 (2759), R0.9 (4071), R1.1 (8427), R1.7 (9806) and R1.9 (10509).
  - *gerritzen-grauert* (8470) reads "Supplied by RigidAnalyticGeometry Layers 3–4", so there is no second owner.
- AdicSpacesPartIII on main: all 16 targets named in Scope and the table, at lines 596–607 and in the body.
- AdicSpacesPartIV on main: F1.1 (2998) and R5.7 (2165). Line 415 consumes rational-local reducedness from "Layers 3–4" (§4.4).
- LocallyAnalyticDistributions §4.16 at its open head (#854, lines 253 and 858–862).

**Overlaps and renumbering.**
- The table header "Former section of this roadmap" maps §§1.3, 7.1, 7.3, 7.4, 7.5 and 8.4. Through it, the outside citations of those ids stay followable:
  - AdicSpacesPartIV line 446 on main (§7.4);
  - ColemanIntegrationPartII #1360 (§§1.3, 7.3, 8.4);
  - CohomologyComparisonsPartII #1364 (§§7.3–7.4, 8.4);
  - ModularityAndLanglandsExtensions #1180 and TriangulineVarietyAndItsLocalModel #1829 (§7.3, which keeps the identity principle).
- Old §4.3 is now §4.4. No roadmap on main or at an open head cites RigidAnalyticGeometry §4.3 or §4.4 by number.
- #1808 and #1854 also change this folder, and the description orders them after it: "`RigidAnalyticGeometry`: **this pull request** → #1808 → #1854".
- `overlaps.md` lists no dropped ids.

**Ownership against open pull requests.** I ran `roadmaps grep` over all 432 open heads and main for Gerritzen, Kisin, quantifier elimination and ACVF.
- AdicSpacesPartII and AdicSpacesPartIV consume this roadmap's §4.3. TropicalAndBerkovichArithmetic #1494 (line 571) only mentions the result.
- For quantifier elimination this roadmap is the owner, as it is on main. ClassicalAdicEtaleCohomology #875 (line 4581, `aic_valuation_finite_conditions_transfer`) plans a transfer statement for algebraically closed valued fields; reconciling it with §8.2 is a matter for that roadmap's review.

**Source sample, read at the locators.**

| Target | Locator | Read at | Verdict |
| --- | --- | --- | --- |
| 0.1 | RestrictedPowerSeries §§1.1, 2.1–2.2, 2.4, 3.3, Layer 4, §§5.1–5.3 | that README, lines 247–606 | present as cited |
| 0.2 | [BGR] 2.3.2/7, 3.5.1–3.5.3, 4.1/3–4, 4.4/2, 5.3.1/1; pinned criteria | `Japanese.lean:40–80`, `Basis.lean:59, 102`, `WeaklyStable.lean:36–55` | pinned parts match; BGR uncertified |
| 1.2 | [Conrad] §1.1 pp. 3–5, Thm 1.1.1, Lemma 2.1.5 | Conrad lines 129–159, 570–577 | heights and two inputs match; proof of the inputs not in Conrad (R03) |
| 1.4 | [BGR] 6.1.4–6.1.5, 7.2; pinned fractions | `Rational.lean:79–156` | pinned parts match; BGR uncertified |
| 2.1 | [BGR] 3.8.1/7, 6.2.2/4; pinned names | signatures resolved | match; BGR uncertified |
| 2.3 | [FK] B.1.3(1), p. 236 of v5 | FK lines 10016–10036 | p. 236 (PDF 254), stated without proof ("The following propositions are easy") |
| 3.1 | [BGR] Ch. 7; pinned site | `Presheaf.lean:45–66` | match; BGR uncertified |
| 4.1 | [BGR] Ch. 7; `IsAffinoidSubdomainMap.comp` | signature | match |
| 4.2 | [Bosch] §4.1 Props 1, 2, 6, pp. 66–68 | Bosch lines 2549–2660 | match, including the Krull and closure argument for noetherianity |
| 4.3 | [Bosch] §4.2 Defs 1, 5 (pp. 69, 71); Thm 10 (p. 76); Cors 11–12 (pp. 76–77); §3.3 Thm 20 (p. 60); route pp. 77–81; §4.3 Lemma 4 (p. 84); [Conrad] Lemma 1.1.4 (p. 6) | Bosch lines 2385–2386, 2665–2669, 2704–2728, 2750–2752, 2924–2944, 3040–3137, 3256–3290; Conrad lines 263–266 | all match; the route uses Prop. 3 (finite locally closed implies closed) as stated |
| 5.1 | [Kiehl-AB] §1 p. 258; Hilfssatz 1.3 p. 260 | KiehlAB lines 152–154, 198, 209–212 | match |
| 6.1 | [BGR] 9.1–9.2.3/1; pinned G-topologies | `SlightlyFiner.lean:98–282` | pinned parts match; BGR uncertified |
| 7.2 | [Urban] §2.3 | Urban lines 868–882 | match: Urban's `Q*` is the README's annihilator polynomial |
| 8.1 | [Conrad] App. A; [Conrad-RA] Ex. 2.2.11 | Conrad lines 1500–1580; ConradRA lines 854–875 | match: final object, `Sp C=Spec C` for finite `C` |
| 8.2 | [Huber-CV] Thm 4.1 p. 472, Cors 4.2–4.3 p. 473, Rem 4.7 pp. 474–476, [11, 4.17] | HuberCV lines 756–826, 889–999 | match: `L_A` (766–768), induction (776–815), quantifier-elimination input (797–804) |
| 8.3 | [Huber-FR] Prop 4.5 | HuberFR lines 1436–1453 | (i)–(v) match the five clauses |

**Adversarial table.** All values are computed by hand, with `0<|ϖ|<1`.

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `isWeaklyStable_gaussFractionField` | `n=0`; char `p`, `n=1`, `L=Frac(T₁)(S)`, `S^p=T`, `φ`= coefficient of `1` | `Frac(T₀)≅K`, complete; for `y=Σ_{i<p}aᵢSⁱ`, `y^p=Σaᵢ^pTⁱ` with supports `≡i mod p` disjoint, spectral norm `=maxᵢ|aᵢ|≥|a₀|=|φy|`, `C=1` | true | none |
| `isJapanese_of_isAffinoidAlgebra` | `K⟨T⟩` char `p`; `K`; `K⟨T⟩×K` | closure `K⟨S⟩` free of rank `p` (`Σaₙ Sⁿ=Σ_{r<p}S^rΣ_m a_{mp+r}T^m`); a field; excluded by `[IsDomain A]` | true | none |
| `isGRing_of_isAffinoidAlgebra` | `0`; `K`; `K⟨T⟩×K` | no primes; `K→K̂=K`; a product of G-rings | true (route source: R03) | R03 |
| `isOpen_regularLocus_of_finiteType` | `B=K[x,y]/(y²−x³)` in char 2, char 3, other; `B=0` | Jacobian `(x²,0)`, `(0,2y)`, `(−3x²,2y)`, each vanishing on the curve only at the origin, so the locus is `Spec B∖{(x,y)}`, open; `PrimeSpectrum 0=∅` | true (R03) | R03 |
| `exists_norm_le_mul_supSeminorm` | `K⟨T⟩/(T²)`; `K⟨T⟩` with twice the Gauss norm; `0` | `‖T‖=1`, `|T|sup=0`, excluded by reducedness; `C=2` forced, so existential; `0≤C·0` | true | none |
| `isSheaf_affinoidSubdomain_presheaf` | Laurent cover; `A=0` | `Σ_{n∈ℤ}cₙTⁿ` on `|T|=|ϖ|` splits into `n≥0` and `n<0` parts, kernel `K⟨T⟩`; empty cover forces `F(∅)=0` | true | none |
| `exactAt_cechComplex_of_cover` | one-member cover; `ι=∅` | `dⁿ=Σ_{j≤n+1}(−1)ʲ`: `d⁰=0, d¹=1, d²=0`; `H⁰=A`, `Hⁿ=0` for `n≥1`, so `0<n` is needed; `ι=∅` forces `Max A=∅`, all terms `0` | true | none |
| `isGRing_stalk` | cusp origin; `A=0` | completion `K⟦t²,t³⟧`; inverting `t²` gives `K((t))`, regular; `Max 0=∅`, vacuous | true | none |
| `isUniversallyCatenary_stalk` | origin of `K⟨X,Y,Z⟩/(XY,XZ)` | minimal primes `(X)`, `(Y,Z)` of coheights 2 and 1, a quotient of the regular 3-ball stalk | true, not equidimensional | none |
| `closure_range_maximalSpectrumToSpa` | `A=K`; `A=0`; `K⟨T⟩` with `v(ΣaₙTⁿ)=|a_k|εᵏ` | `L_K={|·|}=Max K`; `Spv 0=∅` (`v(1)=1≠0=v(0)`); `v≤1` on `A°`, `<1` on `A°°`, `v(T)=ε<|ϖ|ⁿ` for all `n`, so `v∈L_A∖Spa` | true | none |
| `dense_range_maximalSpectrumToSpa` | `A=K`; circle `|T|=|ϖ|`; rank-two point below Gauss | one point; contains `T=ϖ`; singleton proconstructible, no classical point | true | none |
| §0.1 Checks | `(X₁+ϖX₂)²`; `p+T²`; `p+T+pT²` | coefficients `1,2ϖ,ϖ²` (char 2: `1,0,ϖ²`), Gauss norm 1; `1` against `|p|`; reduction `T` | true | none |
| §1.2 Checks | cusp; `ℚ_p⟨T⟩/(T²−p)`; `K⟨T⟩×K` | free on `1,Y`, dim 1; `|T|=p^{−1/2}`; `ht(K⟨T⟩×0)=0` against dim 1 | true | none |
| §1.4 Checks | `A⟨T/ϖ⟩`; `A⟨ϖ/T⟩`; iteration | `T=ϖS`, sup `|ϖ|`; `TU=ϖ`, `T⁻¹=U/ϖ`, sup 1; `T↦ϖ²R` against `S↦R` | true | none |
| §2.1 Checks | `K×K`; `ℚ_p⟨T⟩/(T²−p)`; `0` | `|(1,0)(0,1)|sup=0<1`; bound `max(0,|p|^{1/2})=p^{−1/2}` attained, exponent 1 gives `p^{−1}`; `|1|sup=0` | true | none |
| §2.3 Check | `ℚ_p⟨T,S⟩/(S²−p²T)` | `(S/p)²=T`; `B=ℤ_p⟨T⟩⊕ℤ_p⟨T⟩S∌S/p`; `B/pB=𝔽_p[T][s]/(s²)`, nonreduced | true | none |
| §3.1 Checks | `Sp 0`; `Sp K⟨T⟩/(T²)`; `Sp(K⟨T⟩×K)` | empty with the empty cover; one point, dim 2; two components | true | none |
| §4.1 Checks | standard cover converse; `{|ϖ⁻¹|≤1}`; origin | a common zero lies in no member; empty; `t^N=0` in `A'` but `T^N≠0` in `K[T]/(T^{N+1})` | true | none |
| §4.2 Checks | `Σϖ^{−n}T^{n!}`; `n=0`; cusp | at `r=|ϖ|^δ`, `min_n(δn!−n)→−∞` as `δ→0`, and `h·f=g` would bound `|f|_r≤|g|/|h|_r`; `A/𝔪⁰=0` on both sides; `K⟦t²,t³⟧` needs two generators | true | none |
| §4.3 Gerritzen–Grauert | annulus `U`; covering by `ϖ²,T`; covering by `ϖ,T` | `U∩{|T|≤|ϖ|²}=∅={|ϖ⁻¹|≤1}`; `U∩X₂={|ϖT⁻¹|≤1}`; `U∩{|T|≤|ϖ|}`= circle, not Weierstrass by maximum modulus | true | R02 (not stated) |
| §4.3 refinement | `U¹={|T|≤|ϖ|}`, `U²={|ϖ|≤|T|}` | products with a denominator factor: `ϖT, ϖ², T²`; members: circle, `U¹`, `U²`; without `ϖ²` both vanish at 0 | true | none |
| §4.3 Kisin | `I=(T)`, `W₁={|T|≤|ϖ|}`; `I=A`; `I=0`; `T↦S²`, `|2|=1` | `n=1`; `Σaₖfₖ=1` makes the set empty for large `n`; whole space, which the `Wⱼ` cover; `|S+c|≥|2c|=1⇒|S−c|≤|ϖ|`; with `|ϖ|=1` it fails | true for `0<|ϖ|<1` | R05 |
| §4.3 definitions | cusp normalisation; annulus inclusion | bijective on points, completed stalk map misses `t`; open, not Weierstrass, so not Runge | not covered by any Check | R04 |
| §4.4 Checks | single member `|T|≤|ϖ|`; `K⟨T⟩×K`; `K⟨T⟩/(T²)` on `|T|=1` | `1−T` a unit, `(T−1)` generates `(1)`; `(0,1)` restricts to `0`; empty subdomain, zero ring | true | none |
| §5.1 Checks | Laurent; one-member; `A=0` | `d(u,v)=v−u`, exact; `0,1,0,…`; `F(∅)=0` | true | none |
| §5.3 Checks | cusp; `(XY,XZ)`; node `y²=x²(x+1)` | `K((t))` regular; coheights 2, 1; `A` a domain (a root would lie in `K⟨x⟩`, but `1+x` is not a square), analytic stalk with two branches, reduced completion | true | none |
| §6.1 Checks | bounded functions on `ℕ`; constant `ℤ` on two points | finite covers glue bounded functions, singletons glue `n↦n`, unbounded; `F(X)=ℤ` against sheaf `ℤ×ℤ` | true | none |
| §7.2 Checks | `c·id`, `|c|=r`; `0`; `X−c` against `1−cT` | root `c`, `|c|=r`, first summand everything; root 0 excluded, first summand 0; `|c|<1` fails `r=1`, `|1/c|>1` passes | true | none |
| §8.1 Checks | node; cusp; finite `A` | `√(1+x)` converges on a small disc; `t=y/x`, `t²=x`, `t∉K⟦t²,t³⟧`; `Sp A=Spec A` (ConradRA lines 859–860) | true | none |
| §8.2 QE route | `∃y(y²=x∧1∣y)`; `ℚ̄` trivial against `ℚ((t))^alg`; `5`, `3` in `ℚ(i)`; radius `p^{−√2}`, `1`, `ℂ_p` | equivalent to `1∣x`; same quantifier-free sentences (nonzero integers are units), differ on `∃x¬(1∣x)`; `5=(2+i)(2−i)`, conjugation swaps them, `3` inert; value `p^{−√2}∉p^ℚ`, transcendental residue, no closest approximation | true | none |
| §8.3 Check | `⋃{|T|ⁿ≤|ϖ|}`, `|c|^{n+1}=|ϖ|` | `|c|ⁿ=|ϖ|^{n/(n+1)}>|ϖ|`: in member `n+1`, not in `n` | true | none |
| table row §7.5 → Part III | Part III lines 102, 604, 11031, 11042 | the target transports and needs §7.5, which maps back to it | unowned | R01 |
| §1.2 excellence route | Conrad lines 135–140, 151–153, 269 | criterion proved; inputs only cited ([K3]) | source gap | R03 |

## Not verifiable

- **[BGR]** is recorded as `uncertified` (paywalled) and is settled. I took its locators at their numbers without the text: 2.3.2/7, 3.5.1–3.5.3, 3.7.5, 3.8.1/7, 3.8.3/7, 4.1/3–4, 4.4/2, 5.3.1/1, 6.1.1–6.1.5, 6.2.1–6.2.4, 6.3.1/4–6, 6.3.4–6.3.5, Chapters 7–8 and 9.1–9.3. Where a result is pinned, I checked the statement against the declaration instead. I checked weak stability of `Frac(Tₙ)` in characteristic `p` only on the instance in the table.
- **[Prestel]** 4.17 is `uncertified` and settled. I checked the route of §8.2 step by step instead (table).
- **Kiehl [K3]** (*Ausgezeichnete Ringe*, 1969) and Matsumura's Theorem 102 are not in the manifest, and I did not read them. R03 asks for them. My finding rests on Conrad's own text alone.
- **KiehlAB** is an OCR scan. The passages used (lines 148–156 and 196–214) are legible.

## Source issues

- **Misprint** in Bosch at §4.3, Lemma 4 setup, p. 84: the source indexes the rational covering by `i=0,…,n` after choosing generators `f₀,…,f_r`; it should be `i=0,…,r`, matching the covering `(Uᵢ)_{i=0…r}`; affects nothing.
- **Misprint** in Conrad at the proof of Theorem 1.1.1, p. 4: the source writes the differential module of the local ring at `q` as `Ω¹_{R_q/T}`; it should be `Ω¹_{C_q/T}`, since no ring `R` occurs in the statement; affects nothing.
- **Misprint** in Conrad at the proof of Lemma 2.1.4, p. 12: the source says `Z` and `Z−X` form an admissible cover of `X`; it should be `Z` and `X−Z`, the complement of `Z`; affects nothing.
