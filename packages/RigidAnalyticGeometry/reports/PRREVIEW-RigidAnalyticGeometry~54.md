# Review of RigidAnalyticGeometry (pull request #1807 at d1900d4)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/RigidAnalyticGeometry/` at `d1900d437690a59b01e5e14bf8edefeeeff2b9bb`.

- **Gate and build.** The worker's push gate passes: every check is 0 and the build is OK.
- **Elaboration.** `Suggested.lean` exits 0 with eleven `declaration uses sorry` warnings and nothing else.
- **Dependency check.** It reports `depcheck: 234 roadmaps, 2271 edges, 0 problem(s)`.
- **Previous findings.** R02–R08 of the previous review are repaired. R01, the ownerless formal-functions theorem, is not, and it returns as R01 below.
- **New findings.** All six are P3. The quantifier-elimination target has no route and no proving source (R02). Gerritzen–Grauert and Kisin's lemma are route inputs that are not stated (R03, R04). Layer 4 and Layer 5 depend on each other (R05). Pinned adic results are cited through a roadmap (R06). The pull-request description omits this roadmap's ownership moves (R07).

## R01 (P1) — §7.5 (formal functions) has no owner once this pull request merges

**Location.** `TauCetiRoadmap/RigidAnalyticGeometry/README.md` line 73. The table row reads: "| §7.5 | Principal filtrations and formal functions ([Kiehl-E] Theorem 3.4, p. 206, and Theorem 3.7, p. 210) … | AdicSpacesPartIII R3.6 *proper-cohomology-adic-completion* |".

**Claim.**
- On main, §7.5 is a target of this roadmap (main README line 658). The head deletes it and says that Part III now owns its content.
- The Part III target proves nothing: it transports this roadmap's §7.5 and lists it under *Needs:*.
- No open pull request revises AdicSpacesPartIII. `roadmaps grep` finds the target name only on main and in the heads of #1807 and #1808, which do not touch Part III.
- After the merge, Kiehl-E Theorems 3.4 and 3.7 are planned by no roadmap, and Part III's *Needs:* names a section that does not exist.
- The row now restates the theorem in full, which documents it but does not give it an owner. This is the previous review's R01, unrepaired.

**Witness.** `TauCetiRoadmap/AdicSpacesPartIII/README.md` on main:
- line 11031: "transport RigidAnalyticGeometry §7.5's completion theorem and stable principal filtration";
- line 11042: "*Needs:* RigidAnalyticGeometry §7.5, principal filtrations and formal functions";
- lines 102–103 and 604 say the same.

**Repair.** Add `TauCetiRoadmap/AdicSpacesPartIII/` to this pull request, or to a pull request that the merge-order paragraph orders before it, and make three changes there:
- Rewrite R3.6 *proper-cohomology-adic-completion* as the proof of [Kiehl-E] Theorem 3.4 (p. 206) and Theorem 3.7 (p. 210) on Part III's carriers.
- Carry over main's §7.5 statement and Checks. The statement: `R_0=Mⁱ`, `aⁿMⁱ⊆R_n`, `aR_n⊆R_{n+1}` with equality for large `n`, the shifts `d` and `e`, and the isomorphism for a general ideal with its naturality. The Checks: `a=0`, `a=1`, and the identity of `Sp A` in degree 0.
- Delete "RigidAnalyticGeometry §7.5" at Part III lines 102–103, 604, 11031 and 11042.

After this, the row at line 73 points at a target with its own route and no *Needs:* on this roadmap. Restoring §7.5 here is not an option. Its `Mⁱ=Hⁱ(X,F)` and the finiteness its proof uses are Part III's coherent cohomology, as the row itself says, so this roadmap would consume Part III and create a cycle.

## R02 (P3) — The quantifier-elimination target has no route, no inputs and no source that proves it

**Location.** README lines 1620–1626: "Prove that ACVF eliminates quantifiers … [Huber-CV] p. 471 and p. 472 states this and takes it from Prestel's model-theory text, item 4.17." The *Needs:* list is at lines 1629–1637.

**Claim.**
- **Locator.** The only locator is Huber, who states the result without proof and cites Prestel. Prestel appears neither under **References** (lines 1782–1829) nor in the sources manifest.
- **Route.** None is given. The *Needs:* line lists only Mathlib's `FirstOrder.Language.ring`, `FirstOrder.Language.Theory` and `FirstOrder.Language.BoundedFormula.IsQF`.
- **Missing inputs.** Nothing names:
  - a criterion for quantifier elimination;
  - the extension of valued-field embeddings across algebraic extensions, which needs extensions of valuations and their conjugacy in normal extensions;
  - the extension of such embeddings across one transcendental element.
- **Mathlib.** Pinned Mathlib has no quantifier-elimination criterion to cite.

**Witness.**
- HuberCV lines 797–798 cite quantifier elimination as "[11, 4.17]", and HuberCV line 1020 identifies [11] as Prestel's book.
- In `Mathlib/ModelTheory` at the pin, quantifier elimination is mentioned only in a docstring (`Arithmetic/Presburger/Basic.lean:25`). There is no definition or criterion.

**Repair.**
- Add a source that proves elimination for this language, with its theorem number, to **References** and to the manifest. Prestel's *Einführung in die mathematische Logik und Modelltheorie* (Vieweg 1986), item 4.17, is the text Huber names; record it as `uncertified` if no legal copy can be read.
- Give the route. One option is the substructure (embedding) criterion over saturated models, using Mathlib's compactness, with the two embedding-extension steps above.
- List each input in §8.2's *Needs:* as a target here, a pinned name or a supplier section.

**Ownership.** This roadmap is the right owner: it is on main, earlier than every open roadmap. ClassicalAdicEtaleCohomology (#875, README line 4582 at its head) sketches the same back-and-forth argument inside `aic_valuation_finite_conditions_transfer` and cites Prestel 4.17. Reconciling that, by citing §8.2, is for that roadmap's review.

## R03 (P3) — Gerritzen–Grauert is used but never stated, and nothing supplies it

**Location.**
- README lines 1015–1017: "Gerritzen–Grauert supplies finite rational decompositions and the ambient-cover refinement used in descent."
- §5.1 *Needs:*, line 1164: "Layer 4 (rational covers, the Gerritzen–Grauert refinement, flat restrictions)".

**Claim.**
- The sentence reads as an external input, but no supplier, Tau Ceti declaration or Mathlib declaration provides the theorem.
- It is not stated as a target with hypotheses, and its only locator is "[BGR] Chapter 7".
- Tate acyclicity (§5.1) needs the refinement, and AdicSpacesPartII on main cites *gerritzen-grauert* from this roadmap's Layers 3–4 (Part II line 9853).

**Witness.**
- `TauCeti/RingTheory/Affinoid/Subdomain/Flat.lean` line 31: "No completion, Gerritzen–Grauert decomposition or adic comparison is used."
- Bosch §4.3, Lemma 4 (p. 84; Bosch lines 3256–3258), proves the affinoid-to-rational refinement from Gerritzen–Grauert.

**Repair.** In §4.1, replace the sentence with two targets:
- "Prove the Gerritzen–Grauert theorem: `Sp A` has a finite covering by rational subdomains `Xᵢ` such that `Xᵢ∩U` is a Weierstrass domain in `Xᵢ`. In particular `U` is a finite union of rational subdomains ([Bosch] §3.3 Theorem 20, p. 60; §4.2 Theorem 10 and Corollary 12, pp. 76–77)."
- "Every finite covering of `Sp A` by affinoid subdomains is refined by a rational covering ([Bosch] §4.3 Lemma 4, p. 84)."

Give both a *Needs:* list (the locally closed and Runge immersions of Bosch §4.2) and Checks. One Check computed here: the annulus `|ϖ|≤|T|≤1` is a Laurent domain but not a Weierstrass domain of the disc. If `|f|≤1` on the circle `|T|=|ϖ|`, maximum modulus gives `|f|≤1` on the inner disc as well.

## R04 (P3) — §4.2's finite-map step rests on Kisin's lemma, which is not listed and whose cited proof needs formal models

**Location.**
- README lines 1064–1066: "after reducing to a domain and to the generic formal fibre by finite maps of affinoids ([Conrad] pp. 5–6)".
- The *Needs:* list is at lines 1068–1075.

**Claim.**
- On pp. 5–6 Conrad identifies `f_*(𝒪_Y)_x` with `∏_{f(y)=x}𝒪_{Y,y}` for a finite map. The identification rests on Lemma 1.1.4 (Kisin): an admissible open containing `V(I)` contains some `{|fᵢ|≤ε}`.
- The *Needs:* line names neither this lemma nor any input for it.
- The proof Conrad cites uses Raynaud's formal models, which Scope (lines 76–78) excludes.

**Witness.**
- Conrad lines 246–247 and 260–262: the step follows from Lemma 1.1.4.
- Conrad lines 263–266: the proof of Lemma 1.1.4 uses Raynaud's theory of formal models, though "one can give a direct argument purely in terms of rigid spaces".

**Repair.** Add a target to §4.2: for a finite map `f:Sp B→Sp A` and a classical point `x` with `𝔪ₓ=(h₁,…,h_r)`, every admissible open of `Sp B` containing `f⁻¹(x)` contains `f⁻¹{|hⱼ|≤ε}` for some `ε∈√|K×|` ([Conrad] Lemma 1.1.4, p. 6). Prove it without formal models and list it in *Needs:*.

Check: for the identity map of the disc at the origin, the subdomain `|T|≤|ϖ|` contains `{|T|≤ε}` with `ε=|ϖ|`.

## R05 (P3) — Layer 4 depends on Layer 5, and Layer 5 on Layer 4

**Location.**
- README lines 1055–1056: "these stalk statements are proved after Layer 5 establishes the sheaf condition".
- Line 1068, *Needs:*: "Layer 5 (the sheaf condition, used only for the stalk statements)".
- Line 1133: "Layer 5 for the stalk statements of §4.2".
- Against these: §5.1 *Needs:* Layer 4 (line 1164), and Layer 5's dependencies are "Layers 1–4" (line 1227).

**Claim.**
- The layers are not in build order: the dependency runs both ways, a cycle at layer level.
- §4.3's forward implication uses §4.2's completed local rings, so it inherits the dependency on Layer 5.
- The stalk statements do not need the sheaf condition. The stalk is a colimit of the presheaf (the pinned `TauCeti.GTopology.isColimitNhdsCocone`). BGR proves noetherianity and the completion comparison in Chapter 7, before Tate's theorem in Chapter 8.

**Witness.**
- Conrad lines 120–122 cite exactly these stalk facts as [BGR] 5.2.6/1, 7.3.2/3 and 7.3.2/7.
- The README itself cites [BGR] 8.2 for Tate acyclicity (line 1160).

**Repair.** Either option makes the order acyclic.
- **Drop the dependency.** Delete the Layer 5 dependency at lines 1055–1056, 1068–1069 and 1133. Prove the stalk statements from the pinned `TauCeti.IsAffinoidSubdomainMap.quotientPowAlgEquiv` and `TauCeti.GTopology.isColimitNhdsCocone`, as BGR 7.3.2 does. Layer 4 then depends on Layers 1–3, and Layer 5 follows it.
- **Move the statements.** Move the stalk paragraph of §4.2, `isGRing_stalk`, `isUniversallyCatenary_stalk` and the forward implication of §4.3 to a section after §5.1. Move their section comment in `Suggested.lean` with them.

## R06 (P3) — The adic Tate acyclicity is pinned in Tau Ceti but cited only as a roadmap layer

**Location.**
- README line 138, supplier row "AdicSpaces … Layers 1–5 | … Tate acyclicity for rational covers of `Spa(A,A°)` …".
- Lines 319–324.
- §5.1 *Needs:*, lines 1166–1167: "AdicSpaces Layer 4 (Tate acyclicity for rational covers of `Spa(A,A°)`)".

**Claim.** The Tate acyclicity input of §5.1 exists at the pin, but the contracts name no declaration. This is the class of the previous review's R05, which the author repaired for PadicFunctionalAnalysis §1.2.

**Witness.** The pinned declarations, all in namespace `TauCeti.ValuationSpectrum`:
- `quasiIso_cechAugmentation_spaRationalOpens_of_iSup_eq` (`TauCeti/AlgebraicGeometry/AdicSpace/Spa/StructurePresheaf/Rational/Cech.lean:178`): rational covers of rational subsets of `Spa(A,A⁺)`, for strongly noetherian Tate `A`, have exact augmented Čech complexes in all degrees;
- `isSheafFor_ofArrows_spaRationalOpens_of_iSup_eq` (`…/Rational/Cover.lean:276`) and `isSheaf_presentationLimitPresheaf_of_isStronglyNoetherian` (`…/StronglyNoetherian.lean:90`);
- `spa` (`TauCeti/AlgebraicGeometry/AdicSpace/Spa/Basic.lean:105`).

**Repair.** Name these declarations in the `From Tau Ceti` paragraph and in §5.1's *Needs:*. Keep the AdicSpaces row only for what that roadmap provides beyond the pin.

## R07 (P3) — The pull-request description lists this roadmap only under "Consumer sentences rewritten"

**Location.** The description's bullet: "**Consumer sentences rewritten** so that a sentence naming a roadmap that consumes this one says so (AlgebraicCurves, …, RigidAnalyticGeometry, SymplecticGeometry)."

**Claim.** This is the description's only mention of the roadmap. The head also does the following, none of which the "Ownership moves" bullet mentions:
- moves §1.3's complete field extension of finite modules, §7.1, the coherence part of §7.3, §7.4, §7.5 and §8.4 to AdicSpacesPartIII (README lines 65–74);
- adds the §8.2 quantifier-elimination target.

The §7.5 move also needs a change in AdicSpacesPartIII (R01). The rewrite of `Suggested.lean` is already covered by the description's closing paragraph.

**Repair.** Add a RigidAnalyticGeometry item to "Ownership moves": the old → new ids of lines 67–74, the new ownership of quantifier elimination for algebraically closed valued fields, and the revision of AdicSpacesPartIII R3.6 that R01 requires.

## Status of the previous review's findings (r53, at dbb3969)

- **R01 (formal functions unowned): not repaired.** The row at line 73 now restates Kiehl-E 3.4 and 3.7, but AdicSpacesPartIII is unchanged; see R01 above.
- **R02 (two headlines absent): repaired.**
  - `Suggested.lean` states `exactAt_cechComplex_of_cover` (lines 212–219), `isGRing_stalk` (161–168) and `isUniversallyCatenary_stalk` (174–181).
  - The docstring (lines 41–47) no longer calls the stalks unstatable.
  - The README names the theorems at §5.1 line 1156 and §4.2 line 1059.
- **R03 (Huber 4.1's input unowned): repaired.**
  - Corollaries 4.2–4.3 now follow Remark 4.7 (lines 1579–1591).
  - Quantifier elimination is a target (lines 1612–1626) and is listed under Scope (lines 27–29).
  - What remains is in R02 above.
- **R04 (§6.3 inputs excluded by Scope): repaired.**
  - Lines 1345–1356 keep the existential definition, locality on the base, base change and finite morphisms.
  - Lines 76–87 say why the two statements are not planned.
- **R05 (pinned results cited through roadmaps): repaired.** See §0.2 lines 397–405 and 417–422, supplier rows 136–137, and §1.1 *Needs:* lines 526–528.
- **R06 (Checks that compute nothing): repaired.** See §8.3 lines 1696–1701, §5.2 lines 1206–1211, §0.1 lines 378–388, §1.4 lines 706–710 and §8.1 lines 1546–1559.
- **R07 (Kiehl-AB locator): repaired.** README lines 1160–1163 and Lean lines 190–192 cite Hilfssatz 1.3 on p. 260 (KiehlAB lines 198 and 209–212).
- **R08 (name and generality): repaired.** Lean line 141 now reads `exists_norm_le_mul_supSeminorm`, and README line 838 says "complete ultrametric algebra norm".

## Verified sound

**Gate and build.**
- The worker's gate reports every check 0 and the build OK.
- My own run of the gate command matches it, except `outside-folder=26`. Those 26 files are the README and `Suggested.lean` of the 13 other folders this pull request owns, which the brief names as its own, so they are not findings.
- `lake env lean …/Suggested.lean` exits 0 with eleven `sorry` warnings, at lines 85, 101, 115, 123, 141, 161, 174, 198, 212, 234 and 252. There is no other output.
- The file has no `set_option`, no `lemma` and no sorry'd data. Its imports are Mathlib plus eleven pinned `TauCeti.*` modules.

**Signatures.**
- I ran `#check @` on all eleven declarations in one scratch file.
- Each keeps the binders its statement needs:
  - `[IsDomain A]` (Japanese);
  - `[IsUltrametricDist A] [CompleteSpace A] [IsReduced A]` (Banach function algebra);
  - `[Fact (IsAffinoidAlgebra K A)]` (stalk, sheaf, Čech);
  - `[Finite ι]` and `0 < n` (Čech);
  - `[Algebra.FiniteType A B]` (J-2).
- Each matches its README statement at lines 413, 557, 594–597, 838–839, 1059, 1151, 1153–1158, 1576 and 1597. I changed nothing.

**Carriers read at the pin.**
- `IsWeaklyStable` quantifies over finite extensions in the same universe (`WeaklyStable.lean:36`).
- `GaussFractionField` is `WithAbs` of Mathlib's fraction field, so it is not completed (`FractionField.lean:58`).
- `spa` and `vle` give `v(a)≤1` exactly as `L_A` needs (`Spa/Basic.lean:105`).
- The topology of `Spv` is generated by basic opens (`ValuationSpectrum/Basic.lean:158`).
- The infimum of affinoid subdomains is set intersection (`Rigid/Affinoid/Site.lean:44`).
- The weak G-topology's covers are those with a finite subcover (`Site.lean:63`).
- The site point's fiber is the colimit over admissible neighbourhoods (`GTopology/Points.lean:45`).
- Mathlib's Čech complex is over ordered tuples (`Sites/SheafCohomology/Cech.lean:65`).
- `Polynomial.IsSlopeLE` rules out `χ(Q)=0` on its own: every `α` would be a root, including `0`, and `r>0` (`Unbundled/Slope.lean:64`).

**Padding.** On a scratch copy I tried `first | (simp; done) | rfl | infer_instance | exact?` on all eleven theorems. All eleven fail with "`exact?` could not close the goal", so none is padding.

**Headlines.**
- The Summary's milestones that can be stated at the pins are all stated:
  - weak stability;
  - Japanese;
  - G-ring and J-2;
  - the Banach function algebra theorem;
  - stalk excellence;
  - Tate acyclicity in both forms;
  - Huber 4.1 and 4.2.
- Noether normalisation, maximum modulus and most of the integral reduction are pinned, as the docstring says.
- The docstring names the rest as not statable: rigid spaces, properness, the identity principle, analytification, the rigid–adic equivalence and quantifier elimination. No rigid-space carrier exists under `TauCeti/AlgebraicGeometry/Rigid/`, which holds only `Affinoid/`.

**Dependency check (verbatim).** `depcheck: 234 roadmaps, 2271 edges, 0 problem(s)`

**Library declarations.**
- All 121 qualified README names resolve at the pins: 112 by `#check`, and 9 by source because their modules have no object files. Those nine are at `SpectralNorm/Basis.lean:59, 102`, `GTopology/SlightlyFiner.lean:98, 147, 213, 247, 282`, `Huber/TensorProduct/Restricted.lean:184` and `TateAlgebra/Regular.lean:144`.
- All 30 `TauCeti/…` paths named in the README exist.
- Signatures compared with the prose of the sampled sections:
  - `isClosed_ideal` (strongly noetherian Tate source);
  - `isOpenQuotientMap` and `quotientKerContinuousAlgEquiv` (noetherian, ultrametric and complete source);
  - `continuous_algHom` and `isClosedEmbedding_of_finite_injective`;
  - `comap_isMaximal` (the source need not be affinoid);
  - `exists_ringKrullDim_eq_finite_injective` (`[Nontrivial A]`);
  - `finite_quotient_of_isMaximal_radical` and the two componentwise height theorems;
  - `IsJapanese.of_finite` (`FaithfulSMul` and `Module.Finite`);
  - `denseRange_awayLift`;
  - `completionLocEquiv`, whose `hden` always holds by its docstring at `RationalFraction.lean:322–324`;
  - `isAffinoidAlgebra_isRestricted_iff_pow_eq_norm` (`[Finite σ]`, a positive power equal to `‖c‖`);
  - `supSeminorm_pow` (`n≠0`), `supSeminorm_le_iSup_coeff_rpow_of_eval_eq_zero` (monic), `supSeminorm_map_of_isIntegral` (injective, integral) and `supSeminorm_eq_norm_of_normMulClass`;
  - `IsAffinoidSubdomainMap.comp` and `quotientPowAlgEquiv`;
  - `mem_iff_supSeminorm_le_one_of_isReduced_quotient` (open, bounded, `ϖ` topologically nilpotent and left regular);
  - `isSlopeLE_iff_splittingField`;
  - `exists_basis_norm_comparison` and `forall_exists_bound_spectralNorm_iff`.

**Cross-roadmap citations resolved (24).**
- RestrictedPowerSeries on main, 12 ids: §§0.1, 1.1, 2.1, 2.2, 2.4, 3.3, Layer 4, §§5.1–5.4 and §6.2 (headings at lines 193, 247, 306, 324, 364, 424, 452, 524, 541, 567, 587 and 630). §2.4's finite-extension maximum modulus, §5.3's strict closedness and §5.4's monomial extension match their use.
- PadicFunctionalAnalysis at this head: Layer 1, §1.4 and §2.4 (lines 389, 444, 544–568).
- SchemeAndStackFoundations §0.21: at this head line 1470, on main line 1394.
- AdicSpacesPartII on main:
  - *classical-points-constructible-density* (lines 371 and 9592) reads clauses (i)–(iii) exactly as §8.2 states them;
  - *gerritzen-grauert* (line 9853);
  - *rigid-identity-principle* (line 368).
- AdicSpacesPartIV on main, lines 366–368.
- LocallyAnalyticDistributions §4.16 at its open head (lines 254, 861 and 863) consumes §7.2.
- AdicSpacesPartIII R3.6 on main (lines 11029–11042): defective, see R01.
- Overlaps:
  - #1808 and #1854 are ordered after this pull request: the description reads "`RigidAnalyticGeometry`: **this pull request** → #1808 → #1854".
  - No cited id is dropped by another pull request.
  - The old → new table covers §§1.3, 7.1, 7.3, 7.4, 7.5 and 8.4.

**Ownership against open pull requests.** With `roadmaps grep` over every open head and main, I searched for:
- quantifier elimination, ACVF and model completeness;
- the affinoid carriers in other `Suggested.lean` files (`AffinoidSubdomain.presheaf`, `weakGTopology`, `maximalSpectrumToSpa`, `GaussFractionField`, `IsJapanese`, `IsGRing`, `supSeminorm`).

The results:
- No other `Suggested.lean` states these theorems on affinoids.
- SchemeAndStackFoundations owns `IsJ2` and excellence permanence, and §1.2 cites it.
- ClassicalAdicEtaleCohomology (#875) plans the quantifier-elimination argument inside a proof. This roadmap is the owner, because it is on main; see R02.
- AdicSpacesPartII and AdicSpacesPartIV at the #1187 head consume this roadmap's items and claim none of them.

**Source sample read against the text.**

| Target | Locator | Read at | Verdict |
| --- | --- | --- | --- |
| 0.1 | RestrictedPowerSeries §§1.1, 2.1–2.2, 2.4, 3.3, Layer 4, §§5.1–5.3 | that README, lines 247–606 | present as cited |
| 1.1 | pinned open mapping, continuity and closed embedding; [BGR] 3.7.5, 6.1.3 | signatures above | hypotheses match; BGR uncertified |
| 1.2 | [Conrad] §1.1 pp. 3–5, Thm 1.1.1, Lemma 2.1.5 | Conrad lines 142–148, 156–159, 570 | match: two inputs, Kiehl in all characteristics, heights |
| 1.3 | [BGR] 6.1.1; PadicFunctionalAnalysis §2.4; `weightedRestrictedEquiv` | PFA lines 558–568; Restricted.lean:40–55, 184 | match; BGR uncertified |
| 1.4 | [BGR] 6.1.4–6.1.5, 7.2; pinned fractions | RationalFraction.lean:301–330 | match; BGR uncertified |
| 1.5 | [BGR] 6.1.5; pinned iff | signature above | match |
| 2.1 | [BGR] 3.8.1/7, 6.2.2/4; pinned names | signatures above | match; BGR uncertified |
| 3.1 | [BGR] Ch. 7; pinned site | Site.lean:44–75 | match; BGR uncertified |
| 4.1 | [BGR] Ch. 7; `IsAffinoidSubdomainMap.comp` | signature; Flat.lean:31 | the Gerritzen–Grauert input is not stated (R03) |
| 4.2 | [Conrad] Thm 1.1.3, p. 5 | Conrad lines 201–266 | statement and route match; Lemma 1.1.4 unlisted (R04) |
| 5.2 | [BGR] 8.2 | — | BGR uncertified; Check computed below |
| 6.2 | [Bosch] §5.3; [Conrad] §3.1 (BGR 9.3.6) | Bosch line 3943 (p. 103); Conrad lines 84–87, 821–826 | match, including quasi-separatedness |
| 7.3 | [Conrad] Lemmas 2.1.4–2.1.5 | Conrad lines 554–567, 570 | hypotheses (connected, normal) and both conclusions match |
| 8.1 | [Conrad] §1.2 and App. A; [Conrad-RA] Ex. 2.2.11 | Conrad lines 330–345, 1531–1539; ConradRA lines 854–872 | match: closed-point bijection, completions, P(X)⇔P(X^an), final object |
| 8.2 | [Huber-CV] Thm 4.1, Cor. 4.2–4.3, Rem. 4.7 | HuberCV lines 756–826, 889–999 | statements, `L_A` (766–768), pages 471–476 and the 4.7.1–4.7.4 route match; primary source for quantifier elimination missing (R02) |
| Table row §7.5 | [Kiehl-E] Thm 3.4 p. 206, Thm 3.7 p. 210 | KiehlE lines 630, 647–660, 809–819 | match |
| 5.1 | [Kiehl-AB] p. 258; Hilfssatz 1.3 p. 260 | KiehlAB lines 152–154, 198, 209–212 | match |

**Adversarial table.** Values are computed by hand, with `0<|ϖ|<1`.

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `isWeaklyStable_gaussFractionField` | `n=0`; char `p`, `n=1`, `L=Frac(T₁)(S)` with `S^p=T`, `φ` = the coefficient of `1` | `Frac(T₀)=K`, the pinned complete case; for `y=Σ_{i<p}aᵢSⁱ`, spectral norm `=|Σaᵢ^pTⁱ|^{1/p}=maxᵢ|aᵢ|` (supports disjoint mod `p`) `≥|a₀|=|φ y|`, so `C=1` | true | none |
| same, wrong model | the completed field | the carrier is `WithAbs` of the uncompleted fraction field | excluded | none |
| `isJapanese_of_isAffinoidAlgebra` | `K⟨T⟩` in char `p`; `K`; `K⟨T⟩×K`; `0` | the closure `K⟨S⟩` is free of rank `p`; a field; the last two are excluded by `[IsDomain A]` | true | none |
| `isGRing_of_isAffinoidAlgebra` | `0`; `K`; `K⟨T⟩×K` | no primes; `K→K̂=K`; a product of G-rings | true | none |
| `isOpen_regularLocus_of_finiteType` | `B=K[x,y]/(y²−x³)` in char 2, char 3, other | Jacobian `(x²,0)`, `(0,2y)`, `(−3x²,2y)`, each vanishing on the curve only at `(x,y)`, so the locus is `Spec B∖{(x,y)}` | true (open) | none |
| `exists_norm_le_mul_supSeminorm` | `K⟨T⟩/(T²)`; `K×K` with the max norm; `K⟨T⟩` with twice the Gauss norm; `0` | `‖T‖=1`, `|T|sup=0`, excluded by reducedness; `C=1`; `‖f‖=2|f|sup` forces `C=2`, so the statement is existential; `0≤C·0` | true | none |
| `isGRing_stalk`, `isUniversallyCatenary_stalk` | origin of the disc; origin of the cusp; `A=0` | completion `K⟦T⟧`, regular; `K⟦t²,t³⟧`, a non-regular domain whose stalk is a quotient of a regular stalk (Conrad lines 203–205); `MaximalSpectrum 0=∅` | true | none |
| `isSheaf_affinoidSubdomain_presheaf` | Laurent cover; `A=0` | `Σ_{n∈ℤ}cₙTⁿ` on `|T|=|ϖ|` splits into its `n≥0` part (`|cₙ||ϖ|ⁿ→0`) and its `n<0` part, with kernel `K⟨T⟩`; the empty cover forces `F(∅)=0` | true | none |
| `exactAt_cechComplex_of_cover` | one-member cover; `n=0` against `n≥1` | `Cⁿ=A`, `dⁿ=Σ_{j≤n+1}(−1)ʲ`, which is `0` for even `n` and `1` for odd `n`; `H⁰=A`, `Hⁿ=0` for `n≥1`, so `0<n` is needed | true | none |
| `closure_range_maximalSpectrumToSpa` | `A=K`; `A=0`; `K⟨T⟩` with `v(ΣaₙTⁿ)=|a_k|εᵏ` | the valuation rings containing `K°` are `K°` and `K`, and `v(ϖ)<1` leaves `{|·|}=Max K`; both sides `∅`; `v≤1` on `A°` and `v<1` on `A°°`, while `v(T)=ε<|ϖ|ⁿ` for all `n`, so `v∈L_A∖Spa` | true | none |
| `dense_range_maximalSpectrumToSpa` | `A=K`; circle `|T|=|ϖ|`; the rank-two point `η₀⁻` | one point; contains `T=ϖ`; its singleton is proconstructible with no classical point, hence not constructible | true | none |
| ACVF axioms (§8.2) | derived consequences | `1∣y∧1∣z→1∣yz` (via `x∣y→xz∣yz` and transitivity); `0∣y→y=0` (else `0∣1`); `x∣y⇔y/x∈O` for `x≠0` | `∣` is the divisibility of a proper valuation ring | none |
| quantifier elimination (§8.2) | `∃y(y·y=x∧1∣y)`; `ℚ_p`, `x=p`; `ℚ̄` trivially valued against `ℚ((t))^alg` | equivalent to `1∣x` since `v(y)²=v(x)`; `p` is not a square (`v_p(p)=1`); the two models agree on quantifier-free sentences (char 0, integers are units) and differ on `∃x¬(1∣x)` | true; route and source missing | R02 |
| §8.2 Remark 4.7 route | HuberCV lines 889–999 | 4.7.1 uses BGR 6.1.4 (§1.4) and `C̄=𝒪(U)°` (lines 921–924; §2.3); 4.7.3 uses a rational refinement (§4.1); 4.7.4 is compactness of `{0,1}^S` | matches | R03 (the refinement) |
| §8.2 Theorem 4.1 route | HuberCV lines 776–815 | Weierstrass preparation, then quantifier elimination twice, then a presentation | matches | none |
| table row §7.5 → Part III | Part III main lines 11031, 11042 | Part III transports and needs this roadmap's §7.5, which the head no longer has | unowned | R01 |
| §4.1 Gerritzen–Grauert | Flat.lean:31; Bosch 3.3/20 (p. 60), 4.3 Lemma 4 (p. 84) | not pinned; §5.1 needs it | input not stated | R03 |
| §4.2 route | Conrad lines 242–266 | Lemma 1.1.4, proved with formal models | input not listed | R04 |
| layer order 4/5 | lines 1068, 1133, 1164, 1227 | 4→5 and 5→4; BGR 7.3.2 (Ch. 7) precedes 8.2 | coarse cycle | R05 |
| §0.1 Checks | `(X₁+ϖX₂)²`; `p+T²`; `p+T+pT²`; `n=0` | coefficients `1, 2ϖ, ϖ²` (in char 2: `1, 0, ϖ²`), Gauss norm 1; `|1+p|=1` against `|p|`; reduction `T`; `K` | true | none |
| §1.1 Checks | `K⟨T⟩/(T²)`; `K×K` | `‖T‖=1`, `T²=0`; `𝔪₁ⁿ=0×K`, and the intersection over both is `0` | true | none |
| §1.2 Checks | cusp; `ℚ_p⟨T⟩/(T²−p)`; `K⟨T⟩×K` | free on `1,Y`, dimension 1; residue field `ℚ_p(√p)`, `|T|=p^{−1/2}`; `ht(K⟨T⟩×0)=0` against dimension 1 | true | none |
| §1.3 Checks | `ΣϖⁿXⁿYⁿ`; `A_L` with `L=ℚ_p(√p)`, including `p=2` | `diag(ϖⁿ)` has infinite rank; `(T+√p)−(T−√p)=2√p≠0` is a unit of `L⟨T⟩`, so `A_L=L×L` | true | none |
| §1.4 Checks | `A⟨T/ϖ⟩`; `A⟨ϖ/T⟩`; iteration | `T=ϖS` with sup `|ϖ|`; `T⁻¹=U/ϖ` with sup 1; `T↦ϖ²R` against `S↦R` (which describes `|T|≤|ϖ|`) | true | none |
| §1.5 Checks | `ρ=p^{−1/2}`; empty `σ` | `‖T²/p‖=ρ²/|p|=1`; the criterion is vacuous and `K` is affinoid | true | none |
| §2.1 Checks | `p+T²`; `K×K`; `ℚ_p⟨T⟩/(T²−p)`; `0` | `1` against `|p|`; `|(1,0)(0,1)|sup=0<1`; the bound `max(0,|p|^{1/2})` is attained, while exponent 1 gives `|p|`, below the true value; `|1|sup=0` | true | none |
| §2.3 Check | `ℚ_p⟨T,S⟩/(S²−p²T)` | `(S/p)²=T`; `B=ℤ_p⟨T⟩⊕ℤ_p⟨T⟩S∌S/p`; `B/pB` has `s²=0` | true | none |
| §3.1 Checks | `Sp 0`; `Sp K⟨T⟩/(T²)`; `Sp(K⟨T⟩×K)` | empty, with the empty cover; one point, coordinate ring of `K`-dimension 2; two components | true | none |
| §4.1 Checks | origin of the disc; `{|ϖ⁻¹|≤1}`; standard cover | `t^N=0` in `A′`, while `T^N≠0` in `K[T]/(T^{N+1})`; empty; a maximal ideal containing every `gⱼ` lies in no domain | true | none |
| §4.2 Checks | `Σϖ^{−n}T^{n!}`; `|T|≤|ϖ|`; cusp | at `r=|ϖ|^δ` the exponent `min(δn!−n)→−∞` as `δ→0`, so the series is unbounded and not `g/h`; `K[T]/(Tⁿ)` on both sides; `K⟦t²,t³⟧` | true | none |
| §4.3 Checks | `K⟨T⟩→K⟨T/ϖ⟩`; `(0,1)`; `|T|=1` on dual numbers | `1−T` is a unit; restriction kills `(0,1)`; empty subdomain, zero ring | true | none |
| §5.2 Check | `M=K⟨T⟩/(T)`, Laurent cover | `K⟨S⟩/(ϖS)=K`; `K⟨U⟩/(ϖ)=0`; `0`; `0→K→K→0→0` exact | true | none |
| §6.2 Checks | open disc ∪ circle; `|T|ⁿ≤|ϖ|`; `ℙ¹` with `S↦T⁻¹` against `S↦T` | the `0`/`1` function contradicts §7.3; radii `|ϖ|^{1/n}→1`; `f(T)=g(T⁻¹)` forces constants; `S↦T` makes every `f` global | true | none |
| §6.3 Checks | unit disc inner in itself; `ℙ¹` | `K̃[T]` would be integral over `K̃`; `V_i⋐U_i` with `sup|ϖT|=|ϖ|<1` | true | none |
| §7.2 Checks | `c·id`, `|c|=r`; `X−c` against `1−cT` | first summand everything; root `c` fails `r=1`, root `1/c` passes | true | none |
| §7.3 Checks | `XY=0`; `K⟨T⟩×K`; skyscraper; disc | `Y≠0` vanishes on `X≠0`; `(0,1)` vanishes on the disc; sections are not detected by `U`; finitely many zeros against infinitely many points | hypotheses needed | none |
| §8.1 Checks | `y²=x²(x+1)` in char ≠ 2; cusp; finite `A` | branches `y=±x√(1+x)`; `t=y/x∉K⟦t²,t³⟧`, `t²=x`; `Sp A=Spec A` (ConradRA lines 859–860) | true | none |
| §8.3 Check | `⋃{|T|ⁿ≤|ϖ|}`, `|c|^{n+1}=|ϖ|` | `|c|ⁿ=|ϖ|^{n/(n+1)}>|ϖ|`, so `c` lies in member `n+1` and not in member `n`; no finite subcover | true | none |

## Not verifiable

- **[BGR]** is recorded as `uncertified` (paywalled) and is settled. I took its locators at their numbers without the text: 3.5.1–3.5.3, 3.7.5, 3.8, 4.1/3–4, 4.4/2, 5.3.1/1, 6.1.1–6.1.5, 6.2.1–6.2.4, 6.3.1, Chapters 7–8 and 9.3. Where a result is pinned, I checked the statement against the pinned declaration instead. Weak stability of `Frac(Tₙ)` in characteristic `p` was checked only on the instance in the table.
- **Prestel**, item 4.17, is not in the manifest, and I did not read it (R02).
- **KiehlAB and KiehlE** are OCR scans. The passages used (KiehlAB lines 152–154, 198, 209–212; KiehlE lines 630–660, 809–819) are legible.

## Source issues

- **Misprint** in Conrad at the proof of Lemma 2.1.4, p. 12: the source says `Z` and `Z−X` form an admissible cover of `X`; it should be `Z` and `X−Z`, the complement of `Z`; affects nothing.
