# Review of CharacteristicClasses (pull request #1854 at be597fe)

**Verdict:** needs changes

This is a full review. Since 59d8c40, `TauCetiRoadmap/CharacteristicClasses/` has changed by 1068 lines (commit df0367fc):
- `README.md`: 1061 lines;
- `Suggested.lean`: 7 docstring lines added, no statement changed.

Of the previous review's nine findings, four are repaired (R02, R03, R05, R07), one is partly repaired (R06) and four still stand (R01, R04, R08, R09). The table at the end gives each one with a quote.

This round finds three new defects:
- R02 (P2): the pinned library can state `e(TM)[M]=χ(M)`, but the module docstring says it cannot.
- R05 (P3): pinned declarations are credited to AlgebraicTopology or left unnamed.
- R06 (P3): three GeometricTopology citations and one GeneralizedCohomology citation point at the wrong item.

Three findings block: R01 (P1), R02 (P2) and R03 (P2). The gate still fails on `outside-folder` (R07).

No repair report marks any finding "not actionable in this package", so none of the findings below is a re-raise.

## R01 (P1) — Nobody constructs the lifted oriented Schubert cells, the oriented lift of the rank map or the last-column SO comparison

**Location.** `TauCetiRoadmap/CharacteristicClasses/README.md`:
- `:1898–1903`: "consumes TopK T1.6a's weak-CW union on the stable BSO carrier and its oriented lift, new positive line first, of T1.5's rank map. … These lifted cells and the fixed-rank and stable colimits belong to TopK T1.6a."
- `:617–621`: "carries TopK T1.6a's lifted Schubert cells … and that TopK's last-column SO comparison … is the transport of the determinant sign."
- `:253–255`: "TopK T1.6a's positive-rank finite oriented carriers …, their lifted finite cells and coordinate maps".

**Claim.** This README hands the lifted cells, the oriented lift of the rank map and the last-column SO comparison to TopologicalKTheory T1.6a. TopologicalKTheory hands the same objects back to C1.1a. It is unchanged in this pull request since 59d8c40, and main says the same. So nobody constructs them.

The pinned carrier exists but has no cells. `Topology/Grassmannian/Oriented.lean` declares only:
- `finiteOrientedGrassmannian`, `forget` and `Tautological`;
- compactness;
- `encard_univ_fullRank`.

This is a regression in this folder. Main's copy of this README constructs the cells in C1.1a.

Previous-review repair step 3 (the parenthetical at `:253–254`) was applied, but steps 1–2 were not, and neither was the alternative.

**Witness.**
- TopologicalKTheory at this head, `:504–506`: "CC C1.1a owns the positive-rank finite oriented lift of T1.5's new-line-first rank map and its last-column SO comparison".
- The same file at `:116–117`: "C1.1a supplies only the earlier finite oriented-cover and lifted-cell precursor".
- Main `CharacteristicClasses/README.md:261`: "For positive rank construct the lifted Schubert CW cells"; `:1287`: "These lifted cells belong to C1.1a".

**Repair.** Restore main's arrangement, which matches TopologicalKTheory at this head:
1. In C1.1a, state as its own targets, on the pinned `TauCeti.finiteOrientedGrassmannian n N`:
   - the lifted Schubert cells (the two lifts under `forget` of each T1.5 Schubert cell), with their characteristic and coordinate maps;
   - the oriented lifts of the pinned `rankStabilization` (new line first) and `ambientStabilization`;
   - the last-column SO comparison, with the sign (−1)^(n−1) on the added line (−1 for n=2, +1 for n=3).
2. At `:617–621`, drop "TopK T1.6a's" and "TopK's".
3. At `:253–255`, write "C1.1a's lifted finite cells".
4. At `:1902–1903`, write "These lifted cells belong to C1.1a; the fixed-rank and stable colimits belong to TopK T1.6a."

**Test.** This README and TopologicalKTheory `:504–506` then name the same owner, C1.1a.

## R02 (P2) — `e(TM)[M]=χ(M)` is statable at the pins, but `Suggested.lean` says it is not and omits it

**Location.**
- `TauCetiRoadmap/CharacteristicClasses/Suggested.lean:61–69`: "no identification of a tangent-bundle orientation with the homological orientation that fixes `[M]`, so the sign of `e(TM)[M]` has no carrier".
- README C2.3 `:1428–1434`: "construct first the identification of that tangent-bundle orientation with the homological orientation fixing [M], pointwise through the pinned generator `Orientation.localOrientation`".

**Claim.** The pointwise identification is pinned. One manifold orientation `o` fixes both sides:
- the homological orientation `h`, through its local orientations;
- the tangent Thom class `u`, normalized on each fibre by `Orientation.localOrientation (o.toVectorBundleOrientation x)`.

So the headline is statable with no new definition. What C2.3 has left to prove is that the pinned pointwise family is transport-compatible, i.e. a `TauCeti.HomologicalOrientation`.

**Witness.**
- Tau Ceti pin, `AlgebraicTopology/Singular/LocalHomology/Orientation/Chart.lean:202`: `def localOrientationOfManifoldOrientation`.
- A scratch file with the theorem below elaborates at this pin: `lake env lean` exits 0, and the only warning is `declaration uses sorry`.
- #1808's copy of this folder states the same theorem (`Suggested.lean`, the C2.3 section).

**Repair.**

In `Suggested.lean`:
1. Add the imports `TauCeti.AlgebraicTopology.Cohomology.FundamentalClass`, `…Singular.LocalHomology.Orientation.Chart`, `…Singular.LocalHomology.Orientation.Linear` and `…Cellular.EulerCharacteristic.FiniteCWType`.
2. After `end Bundle`, add a C2.3 section with this theorem and a docstring citing Milnor–Stasheff, Corollary 11.12:

```lean
open scoped Manifold ContDiff in
theorem eulerClass_tangentBundle_evalFundamentalClass_eq_eulerChar
    {E : Type} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
    {M : Type} [TopologicalSpace M] [T2Space M] [CompactSpace M] [ChartedSpace E M]
    [IsManifold 𝓘(ℝ, E) ∞ M] [TauCeti.FiniteCWType M] {n : ℕ} (hE : finrank ℝ E = n + 1)
    (o : TauCeti.Manifold.Orientation 𝓘(ℝ, E) M (Fin (n + 1)))
    (h : TauCeti.HomologicalOrientation M E (n + 1))
    (hh : ∀ x, h x = TauCeti.localOrientationOfManifoldOrientation o hE x)
    (u : (TauCeti.thomPair E (TangentSpace 𝓘(ℝ, E) : M → Type)).singularCohomology
      (ModuleCat.of ℤ (ULift.{0} ℤ)) ℤ (ModuleCat.of ℤ (ULift.{0} ℤ)) (n + 1))
    (hu : ∀ x, (TopPair.singularKronecker _ ℤ (n + 1)
        (TopPair.singularCohomologyMap (TauCeti.fiberThomPairMap E (TangentSpace 𝓘(ℝ, E)) x) _
          u)).hom (Orientation.localOrientation (F := E) (o.toVectorBundleOrientation x) hE).val =
        ULift.up 1) :
    h.evalFundamentalClass hE (ModuleCat.of ℤ (ULift.{0} ℤ)) (ContinuousMap.id M)
      (TauCeti.eulerClass (ModuleCat.of ℤ (ULift.{0} ℤ)) ℤ (ModuleCat.of ℤ (ULift.{0} ℤ)) E
        (TangentSpace 𝓘(ℝ, E) : M → Type) (n + 1) u) = ULift.up (TauCeti.eulerChar M) := by
  sorry
```

3. Replace the `:61–69` bullet with a sentence saying that this headline is stated. Keep the self-map pullback identity as a README target.

In `README.md`:
4. Cite `TauCeti.localOrientationOfManifoldOrientation` in C2.3. Narrow "construct first the identification … pointwise" to its transport compatibility.
5. Add the theorem to the Summary's end theorems.

**Test, recomputed.**
- S²: χ=2 and ⟨e(TS²),[S²]⟩=2.
- S¹ (n=0): TS¹ is trivial, so e=0=χ.
- Reversing `o` flips both `h` and `u`, so the value is unchanged. Flipping `h` alone gives −χ, as `hh` excludes.

## R03 (P2) — TopologicalKTheory T6.4 at this head does not supply the principal-bundle category and homotopy invariance that C1.1b consumes

This finding was R04 of the previous review and is not repaired.

**Location.** `README.md`:
- `:251`: "Its T6.4 supplies continuous principal/associated bundles and descent."
- `:659–661`: "Use [TopK T6.4]'s general numerable principal/associated-bundle category and its classifier-independent cylinder homotopy invariance."

**Claim.** At this head, T6.4 is equivariant descent for a compact Lie group H. It builds the category only as needed there and states no homotopy invariance; T1.4 is vector-bundle invariance only. Main's T6.4 is the general foundation, but this branch's TopologicalKTheory still conflicts with main.

**Witness.**
- TopologicalKTheory at this head, `:1109–1114`: "Let H be a compact Lie group. … Build the continuous principal/associated-bundle category needed here".
- Main, `:1286`: "**Continuous principal-bundle foundation.**"; `:1309`: "numerable principal bundle over X×I".
- `git merge-tree --write-tree origin/main HEAD` (origin/main 1bea835) exits 1, with conflicts in `TauCetiRoadmap/TopologicalKTheory/README.md` and `Suggested.lean`.

**Repair** (unchanged): merge main and resolve the TopologicalKTheory conflict so that T6.4 is main's continuous principal-bundle foundation, with this branch's TopologicalKTheory changes on top. Otherwise C1.1b must state, as its own targets with locators, the numerable principal-bundle category and its cylinder homotopy invariance.

## R04 (P3) — The definitions in C1.5, C3, C4 and C6 have no Checks, and most targets have no *Needs:* line

This finding was R06 of the previous review and is partly repaired.

**Location.**
- C3.2 `:1721–1736`: "In positive rank define w_i and c_i by the unique monic projective relations above".
- C3.3 `:1737–1752`: integral p_i and `W_k(E)=β(w_(k−1)(E))`.
- C4.1–4.2 `:1951–1966`: Chern–Weil forms.
- C6.2 `:2612`: "Construct `ch_j(E)` as the rational Newton polynomial".
- C1.5 `:1111–1117`: the degree-2 line class and w₁.

**Claim.** The house shape is now in place: there are `# Roadmap:`, Summary, Scope, Supplier contracts, How to read the build, `### Examples` and `### Dependencies` in each layer, and Downstream consumers. The sampled targets each have Checks and a *Needs:* line. But the roadmap's central definitions (w, c, p, W, ch and the Chern–Weil forms) have no Checks, contrary to the rule of at least three per definition.

**Witness.**
- `grep -n '\*\*Checks\.\*\*'` gives 17 blocks, at C1.0, C1.1d, C1.5a, C2.0–C2.3a, C5a.1–C5a.7, C7.1 and C7.AdjointHopf. None is in C3, C4, C5 or C6.
- `grep -c '\*Needs:\*'` gives 10. None is in C3–C7, including C7.AdjointHopf.

**Repair.** Add Checks with computed values, for example:
- C3.2:
  - `c₁(O(−1))` pairs to −1 on CP¹; the convention a=c₁(O(1)) would give +1.
  - `c(TCP²)=(1+h)³` gives c₂=3h², pairing 3=e[CP²].
  - `w(TRP²)=1+a+a²`, and w₂ pairs to 1=χ(RP²) mod 2.
- C3.3:
  - p₁(TCP²)=3h²; the sign +c₂ would give −3.
  - W₁=β(1)=0.
  - c₁(L_ℂ)=β(a)=y≠0 on RP².
- C6.2:
  - ch(O(1))=e^h on CPⁿ.
  - ch₀ = rank.
  - ch₂=(c₁²−2c₂)/2, which gives (3/2)h² for TCP².

Add a *Needs:* line per target in C3–C7.

## R05 (P3) — Pinned declarations are credited to AlgebraicTopology's construction or left unnamed

**Location.**
- C1 item 2 `:871–874`: "Consume AlgebraicTopology Stage6.1's coefficient long exact sequence and Bockstein construction".
- C3.1 `:1633–1634`: "consume AlgebraicTopology Stage 6.0's countable-tower cochain Milnor sequence and Mittag–Leffler vanishing". The same applies at C3.6 `:1909`.
- C1.1b `:628–629`: "use a type copy of the same native finite-support indexed-join carrier".

**Witness.** Tau Ceti pin:
- `AlgebraicTopology/Cohomology/Bockstein.lean:127` and `:278` declare `TopCat.singularCohomologyBockstein` and `TopPair.singularCohomologyBockstein`.
- `Algebra/Category/ModuleCat/Tower/Milnor/Basic.lean:501` declares `TauCeti.ComplexTower.limOneToHomology_injective`.
- `Tower/MittagLeffler.lean:191` declares `TauCeti.ModuleTower.subsingleton_limOne_of_isMittagLeffler`.
- `AlgebraicTopology/ClassifyingSpace/CountableJoin.lean:41` declares `TauCeti.universalGSpace`, defined as `(indexedJoin fun _ : ℕ => G).Realization` with the weak topology.
- AlgebraicTopology at this head (`:360–364`, `:1562–1567`) itself lists the Bocksteins and tower sequences as native.

**Repair.**
- Name these declarations, with their files, under "From Tau Ceti" and at C1 item 2, C3.1 and C3.6. Keep AlgebraicTopology 6.0–6.1 only for their local-coefficient forms and the pair-connecting compatibility.
- In C1.1b, name `TauCeti.universalGSpace` as the carrier whose type is copied with the strong topology.

## R06 (P3) — Three GeometricTopology citations and one GeneralizedCohomology citation point at the wrong item

**Location and witness.**
1. **GeometricTopology Layer 10.** `:360–365` says Layers 1, 3 and 10 own "the oriented-plane Euler target", and C2.3 `:1437–1438` says "Compare the rank2 class with GT Layer10". On main, GeometricTopology `:7645` is "## Layer 10: foliations of 3-manifolds". Its plane-field Euler class is the pinned `TauCeti.Foliation.eulerClass` (`Geometry/Manifold/Foliation/EulerClass.lean:122`), which is defined as `TauCeti.eulerClass` of the tangent field. There is nothing separate to compare with.
2. **GeometricTopology Layer 1.** C2.5 `:1562–1564` says "Use GT Layer1's weak (compact-open C∞) topology on native `ContMDiffMap` carriers". That topology is in Layer 3 (main `:1429`, `:1507`), not Layer 1.
3. **GeometricTopology Layer 11.** C2.3a `:1459–1460` and `:1521–1522` consume "GT Layer11's" smoothing-and-triangulation comparison. Layer 11 is missing from `:360` and from C2's Dependencies `:1613`.
4. **GeneralizedCohomology.** `:424–427` cites "its G4 the ordinary quaternionic-line normalization `u=c₂(F)`". This is G4.5: GeneralizedCohomology at this head, `:2694`: "Pin x_H^HZ=−e(γ_H)=c₂(Cγ_H)=h". C7's Dependencies `:2904` list only G4.0a.

**Repair.**
1. Delete "and the oriented-plane Euler target" and C2.3's "GT Layer10 and"; keep the comparison with C1's line class.
2. Cite Layer 3 for the weak topology.
3. Cite GeometricTopology Layers 1, 3 and 11 at `:360` and in C2's Dependencies.
4. Write "G4.5" at `:426` and add it to C7's Dependencies.

## R07 (P3) — The pull request changes two files outside its roadmap folders, so the gate fails

This finding was R08 of the previous review and is not repaired.

**Location.** `Completed/ArithmeticDirichletSeries/README.md` and `TauCetiRoadmap/SymplecticGeometry/README.md`.

**Witness.**
- The worker's gate reports "outside-folder=2 … FAIL".
- Rerunning the gate here gives `outside-folder=38`. `git diff --name-only origin/main...HEAD` lists 40 files: 2 in this folder, 36 in the sixteen folders the brief names as the pull request's own, and exactly these 2.

**Repair.** Move the two loop-cut sentences to their own pull request, or have both folders recognised as this pull request's own.

## R08 (P3) — The merge-order paragraph calls #1808 independent, but #1808 rewrites this folder differently

This finding was R09 of the previous review and is not repaired.

**Location.** The description's merge-order paragraph: "#1808 is independent of this pull request."

**Claim.** #1808 conflicts with this pull request in `TauCetiRoadmap/CharacteristicClasses/README.md` and `Suggested.lean` (`overlaps.md`). `roadmaps show CharacteristicClasses --pr 1808` differs from this head in 376 lines. Each copy has repairs the other lacks:
- #1808 has the χ(M) headline, the pinned Bockstein and Milnor names, and C1.1b Checks;
- this head has the AlgebraicTopology supported-cochain arrangement and the LieGroups 5A consumption.

Whichever merges second will drop the other's repairs unless it is rebased.

**Witness.** #1808's copy, `README.md:320–324`: "The separate AT supported-cellular supplement after ordinary 6.2 consumes C1.2a S0–S4". This head `:298–303`: "No AT stage consumes C1.2a."

**Repair.**
- Say which branch is rebased onto which, and that the later branch carries both sets of repairs.
- Also name the TopologicalKTheory conflict with main (R03).

## Previous findings

| r55 | Status | Quote at this head |
| --- | --- | --- |
| R01 | Not repaired (now R01). Only step 3 was applied. | `:1902–1903`: "These lifted cells and the fixed-rank and stable colimits belong to TopK T1.6a". TopologicalKTheory `:504`: "CC C1.1a owns the positive-rank finite oriented lift". |
| R02 | Repaired. | `:298–303`: "C1.2a consumes AT's supported-cellular foundation … No AT stage consumes C1.2a." AlgebraicTopology at this head `:1700–1711` owns the foundation and names C1.2a as its consumer. |
| R03 | Repaired. | `:2000–2004`: "Consume [LieGroups Layer 5A]'s Ad-invariant positive-definite metric B_G, the orthogonal splitting … for G compact and connected". |
| R04 | Not repaired (now R03). | `:251`: "Its T6.4 supplies continuous principal/associated bundles and descent." |
| R05 | Repaired. | `:2715`: "IndexTheory I7.2 consumes L₃ for the signature theorem in dimension twelve." |
| R06 | Partly repaired (now R04). | The house headings are present. There are 17 Checks blocks and 10 *Needs:* lines, with none in C3–C6. |
| R07 | Repaired. | `Suggested.lean:80–86` adds the C5a.1/C5a.4 bullet. `:1317–1318` cites `IsThomClass.singularCohomologyMap` and "its special case for the pullback bundle f*E … `TauCeti.IsThomClass.pullback`". `:2011–2012` reads "Mathlib's `LieAlgebra.HasCentralRadical`". |
| R08 | Not repaired (now R07). | The gate reports `outside-folder` FAIL on the same two files. |
| R09 | Not repaired (now R08). | The description is unchanged. |

## Verified sound

### Gate, dependency check and elaboration

- **Gate.** The worker's gate has every check at 0 except `outside-folder=2`, and `build=0`. The rerun's 38 hits are explained under R07.
- **Dependency check**, run this round: `depcheck: 236 roadmaps, 2298 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line. R01 is an edge the check cannot see, because it reads TopologicalKTheory from main.
- **Elaboration.** `lake env lean TauCetiRoadmap/CharacteristicClasses/Suggested.lean` exits 0. The only warnings are `declaration uses sorry`, at 132:8, 156:8, 172:8 and 194:8.
- **Signatures.** `#check @name` was run on all four theorems in one scratch file. The elaborated types equal `signatures.md`:
  - `[FiniteDimensional ℝ F]`, `[Module.Projective K R]`, `[T2Space B]`, `hdim` and `hn` are present;
  - no section binder is lost;
  - the README generality matches C2.1 `:1324–1335`, C2.2 `:1397–1403` and C7.3a `:2868–2876`.
- **One-tactic probe** (scratch copy): `first | simp | rfl | infer_instance | exact <pinned lemma>` fails on all four theorems. The pinned compact-base lemmas need `CompactSpace B`. None is padding.

### Not-statable claims, checked at the pin

- There is no relative cup. `Cohomology/Cup.lean`, `Relative.lean`, `CrossProduct.lean` and `Twisted/Cup.lean` define only `singularCup`, `singularCross`, `twistedCup` and `integralCup`.
- There is no Grassmannian colimit, universal bundle, Chern class, Chevalley–Eilenberg complex, Weil algebra or topological K-theory.
- There is no graded rational cohomology algebra. `integralCupProd` covers only integral degree-one classes.
- Only the χ(M) bullet is wrong (R02).

### Seeded sample, checked at its locators

**C1.0.**
- dupont-ln:
  - line 532: Proposition 2.20, p. 15, local isometric trivializations by Gram–Schmidt;
  - line 566: Proposition 2.21, p. 16, the O(n) frame bundle with its right action and equivariant charts;
  - line 976: Example 4.3, p. 32, where a metric is a reduction to O(n) and an orientation a reduction to GL(n,ℝ)₊.
- hatcher-vbkt lines 1019–1028: printed p. 26 (file page 30), the Gram–Schmidt deformation retraction of GLₙ(ℝ) onto O(n).

**C2.0.**
- hatcher-vbkt lines 640–641: p. 16, the disk and sphere bundles.
- hatcher-vbkt lines 3428–3430: p. 88, the pair (D(E),S(E)) carrying the Thom class.
- cohen-fiber-bundles line 2950: (2.4), the Thom space D/S, p. 86.
- cohen-fiber-bundles lines 2979–2992: Proposition 3.7, stated on p. 87. Its proof on p. 88 gives the boundary S(ζ)×D(η)∪D(ζ)×S(η).
- Milnor–Stasheff Lemma 18.1 is uncertified.

**C5a.1.**
- dupont-ln line 2627: Proposition A2, p. 93. Its differential, Σ_(i<j)(−1)^(i+j)α([v_i,v_j],…), is indexed from 1; the README's 0-indexed version has the same signs.
- dupont-ln line 2713: Proposition A7, invariant inner product by averaging.
- dupont-ln line 2752: Theorem A8, compact connected G, de Rham cohomology of invariant forms.
- Mathlib `Algebra/Lie/Cochain.lean:118`: `d₁₂ R L M f x y = - f ⁅x, y⁆`.

**C5a.2.**
- dupont-ccc line 3548: Proposition 8.3, p. 115, `I(G)≅Inv_W I(T)` for compact connected G.
- hatcher-at line 14239: the §3.G table, with E8 degrees 2, 8, 12, 14, 18, 20, 24, 30 and SU(n) degrees 2,…,n.

**C5a.3.**
- alekseev-meinrenken lines 332–373: §3.1, (10) `Wg=Sg*⊗∧g*` with curvature generators. The differential vanishes on the basic invariants, whose cohomology is `(Sg*)^inv`.
- dupont-ccc lines 2247–2264: Chapter 4, Exercise 3, (4.15)–(4.17), pp. 69–70, with `U_s=sΩ+½(s²−s)[θ,θ]`.
- dupont-ln lines 2244 and 2264: Theorem 9.5 and Lemma 9.6.

**C5a.4 and C5a.5.**
- dupont-ccc line 3514: Theorem 8.1, p. 114, `I(G)≅H*(BG)` over ℝ for compact G.
- hatcher-at line 12343: Theorem 3C.4, the Hopf algebra over a field of characteristic 0 with finite-dimensional degrees.

**C5a.6.** dupont-ccc line 3989: Corollary 8.35, Borel, real coefficients.

**C5a.7.** hatcher-at line 18734: Corollary 4D.3(a)(b), integral U(n) and SU(n) via U(n−1)→U(n)→S^(2n−1).

**C7.AdjointHopfObstruction.** zentner-instanton-sheet2 line 50: `p₁(su(E))=−4c₂(E)+c₁(E)²`, with (a) and (b) at lines 51–58.

### Library declarations opened at the pins

- `TauCeti.localOrientationOfManifoldOrientation`: `Orientation/Chart.lean:202`.
- `TauCeti.HomologicalOrientation`: `Orientation/Homological.lean:75`.
- `TauCeti.IsThomClass`: `EulerClass.lean:245`.
- `IsThomClass.singularCohomologyMap`: `:269`.
- `IsThomClass.pullback`: `:327`.
- `eulerClass_eq_zero_of_forall_ne_zero`: `:383`.
- `VectorBundleOrientation.exists_singularCohomology_thomPair_fiber`: `Orientation/ThomClass.lean:121`.
- `VectorBundleOrientation.exists_isThomClass`: `:186`.
- `exists_isThomClass_of_compactSpace`: `MayerVietoris/Basic.lean:612`.
- `finiteOrientedGrassmannian`: `Grassmannian/Oriented.lean:44`.
- `rankStabilization`: `Stabilization.lean:82`.
- `universalGSpace`: `CountableJoin.lean:41`.
- `classifyingSpace`: `ClassifyingSpace/Basic.lean:73`.
- Bocksteins: `Bockstein.lean:127` and `:278`.
- Tower Milnor and Mittag–Leffler: `Milnor/Basic.lean:501` and `MittagLeffler.lean:191`.
- `Foliation.eulerClass`: `Foliation/EulerClass.lean:122`.
- `ContRepresentation.isUnitarizable`: `Compact/Unitarizable.lean:241`, with `[RCLike 𝕜]`, so it covers ℝ.
- Mathlib `LieAlgebra.HasCentralRadical`: `Semisimple/Defs.lean:75`.
- Mathlib `LieAlgebra.IsKilling`: `Killing.lean:50`.
- Every other backticked name of the README is found at the pins, except this roadmap's four theorems and AlgebraicTopology's own target names `relativeCWPushoutCarrier` and `relativeCWPushoutCWModel` (AlgebraicTopology `Suggested.lean:304` and README `:948`).

### Cross-roadmap citations resolved

**AlgebraicTopology at this head.**
- Stage 8 items 8.3, 8.5, 8.8b (`:2470–2490`, c_G for a Hausdorff CW K(G,1)), 8.10 and 8.12 (`:2905–2925`, which names CharacteristicClasses as its consumer).
- The supplement (`:1700–1760`).
- 6.0–6.1 (`:360–364`, `:1562–1567`).
- The dependency table (`:2960–2966`).

**Other folders of this pull request.**
- TopologicalKTheory at this head: `:66–117`, `:375–392`, `:455–465`, `:500–510`, `:605–612` and `:1105–1125`.
- ComplexKahlerGeometry at this head: K4, 7.1 and 7.2 (`:1153`, `:2202`, `:2244`). It cites this roadmap only as a consumer (`:2272`, `:2533`).
- ClassifyingSpaces at this head: `:543`, consumer only.
- GeneralizedCohomology at this head: G4.0a (`:2259–2282`) and G4.5 (`:2614`, `:2694–2699`).
  - It consumes C1.1b, C1.2, C1.5a, C2.1, C2.4, C2.5 and C3.2. This roadmap's C7 consumes G4.0a and G4.5. There is no item cycle.
  - Its `p₁(Rξ)=−2c₂(Cξ)` agrees with C7: (Rγ_H)⊗ℂ=2·Cγ_H gives −2u, and su(F)⊗ℂ=End₀F gives −4u.

**Roadmaps on main.**
- LieGroups `:641–665` (5A) and `:750` (6).
- SpinGeometry `:397` (G4.1a). The `overlaps.md` lead that only #1674 defines it is false.
- SchubertGeometry S9.6 (`:128`).
- ReflectionInvariantTheory §§1–4 (`:7`, `:68`).
- TopologicalSheafCohomology TS1.1–TS1.2 (`:7–11`).
- SmoothBundlesConnections B6.0 (`:1306`).
- LieHighestWeight Layer 1 (`:351`).
- CompactGroups Layer 0 (`:205`).
- DifferentialGeometry Layer 8 (`:816`) and 10.2 (`:884`).
- LieGroupoidsPoisson G1.3a (`:18`, `:603`).
- GeometricTopology Layers 1, 3, 10 and 11 (R06).

**Open pull requests.**
- IndexTheory is now cited only as a consumer.
- #1652's AlgebraicTopology head (`:805`, `:2426`) still has the supplement consume C1.2a S0–S4, which is main's arrangement. That pull request must adopt this one's when it rebases. #1797's AlgebraicTopology head agrees with this pull request (`:181`, `:2168`).

**Note on `hn`.** `hn : 2 ≤ finrank ℝ F` is not needed for truth: n=1 and n=0 hold as well. But the proof route needs the (n−2)-connected fibre, so this is a note, not a finding.

### Adversarial table

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| `existsUnique_…_thomPair_fiber` (L132) | B=pt, rank 1; 𝔽₂; rank 0; g=0 | o=ω gives u=g, o=−ω gives u=−g; over 𝔽₂, −g=g; rank 0: fibre pair (pt,∅), u is the locally constant sign, (g,−g) on two opposite components; g=0 gives the unique u=0 | true; not one-tactic |
| `exists_isThomClass_of_orientation` (L156) | zero ring; trivial line; Möbius line | H=0, so span{0}=⊤ and u=0 works; the pulled-back generator; the Möbius cover is connected, so it has no orientation and the hypotheses fail | true |
| `eulerClass_eq_zero_iff_exists_ne_zero` (L172) | TS²; S²×ℝ²; O(1)_ℝ on CP¹; su(F) on HP¹; n=1 | e=2, no section; e=0, constant section; e=1, no section; rank 3 with a 4-cell violates `hdim`, and there e∈H³(S⁴)=0 with no section; n=1: oriented lines are trivial, so both sides are true | true; `hdim` necessary |
| `not_exists_isImmersion_…` (L194) | k=1, 2, 3; ℕ subtraction | w̄ is (1+a), (1+a)³=1+a+a²+a³ and (1+a)⁷, so w̄_(m−1)=a^(m−1)≠0; targets ℝ², ℝ⁶, ℝ¹⁴; 2^(k+1)−2≥2 | true |
| χ headline (R02 probe) | S², S¹, reversal of o | 2=2; e=0=0; (−h,−u) gives the same value, −h alone gives −χ | elaborates; true |
| C1.0 transport | H=diag(1,4) | H^(−1/2)e₂=e₂/2 has h₁=1; H^(1/2): h₁(2e₂)=16 (norm 4); H⁻¹: h₁(e₂/4)=1/4 (norm 1/2); Sylvester sums 2, 3, 4; commutator eigenvalue 0 | correct |
| C1.1a sign | n=2, 3 | (−1)^(n−1) is −1, +1 | correct; ownership is R01 |
| C1.1d classes | [S¹,O(2)], [S¹,O(3)], [S²,O(k)], O(−1) | JR(θ)J⁻¹ has entries cos θ, sin θ, −sin θ, cos θ, i.e. R(−θ), so ℤ⋊ℤ/2; ℤ/2×ℤ/2; π₂(SO(k))=0, so ℤ/2; s_S=z⁻¹s_N gives winding −1 | correct |
| C1.5a | H¹(RP∞;ℤ), π₂(CP∞) | Hom(ℤ/2,ℤ)=0; π₁(S¹)=ℤ | correct |
| C2.0 cells | rank 0; TS²; v=(1,1) | S(E)=∅; cells in degrees 2 and 4; (1,1)/√2 of norm 1, while the inverted ratio gives norm 2 | correct |
| C2.3 and C2.3a | id, antipodal and constant maps of S²; flag velocity | 2, −2, 0 (Lefschetz number 1); Σv_i=μ−μ=0 and Σd_iv_i=Σt_i(d_i−μ)²; 4−6+4=2 | correct |
| C3.3 Whitney correction | general k; L⊕L on RP⁴ | c_(2k) splits as even·even plus odd·odd, and (−1)^k gives the formula; p₁=−y²=y²≠0 in H⁴(RP⁴;ℤ)=ℤ/2 | correct |
| C3.3 Wu reduction | j=1, 2 | Sq¹w_j=w₁w_j+(j−1)w_(j+1) gives w₁² and w₁w₂+w₃ | correct |
| C3.4a fibre group | π_(k−1)V_r(ℝⁿ), n−r=k−1 | ℤ if r=1 or k is odd; ℤ/2 if r≥2 and k is even | correct |
| C3.6 torus | BSO(2r) | e↦∏x_j and p_r↦∏x_j²=e² | correct |
| C5a.1 sign | degree 1; SU(2); Tⁿ | −a([X,Y]) equals Mathlib's value; H¹=0; H¹=𝔱*, of dimension n | correct |
| C5a.2 | E8; U(2) | Σ(d_i−1)=120; ∏d_i=696729600=\|W(E8)\|; weights 2 and 4 | correct |
| C5a.3 | F_t at t=1/2 | (t²−t)/2=−1/8, while the wrong version gives +1/8; F₀=0 and F₁=Ω | correct |
| C5a.4–C5a.7 | SU(2), U(2), U(3), SU(3), E8, RP² | dimensions 1,0,0,1; (1+t)(1+t³) with top degree 4; 1+3+5=9; 3+5=8; 3+15+23+27+35+39+47+59=248; H²(RP²;ℤ)=ℤ/2 | correct |
| C7.1 L₃ | K₃ from power sums; CP⁶; HP³; HP² | Σz³=e₁³−3e₁e₂+3e₃ and Σz_iz_j²=e₁e₂−3e₃ give 2/945, −13/945 and 62/945; (2170−1911+686)/945=1; p(HP³)=1+4u+12u²+8u³ gives (496−624+128)/945=0; p(HP²)=1+2u+7u² gives (49−4)/45=1 | correct |
| C7.AdjointHopf | Z=diag(1,−1); roots; HP¹ | X=0 and Y=diag(−i,i); e₂(0,x−y,y−x)=−(x−y)², so p₁=c₁²−4c₂; ⟨p₁,[HP¹]⟩=−4; e∈H³(S⁴)=0 | correct; matches zentner line 50 |
| C7.3a | m=4 | w=(1+a)⁵=1+a+a⁴; w̄=(1+a)³; the product is (1+a)⁸=1 | correct |
| Conventions | standard character; the block [[0,−α],[α,0]] | (i/2π)(ia)=−a/2π; Pf=−α, so the Euler form is −dα/2π, which equals c₁=(i/2π)(i dα) | correct |

## Not verifiable

These texts are settled `uncertified` in the manifest and are cited by locator; they were not read:
- Milnor–Stasheff (Theorem 10.4, §12, Corollary 11.12, Lemma 18.1, §19);
- Milnor, *Topology from the Differentiable Viewpoint*, §6;
- Milnor, *Construction of Universal Bundles II*, §§2–3;
- Bott–Tu.

The table above checks the mathematics they are cited for independently.

tom Dieck 14.4.3 and May, Chapter 16, are outside the seeded sample and were not read this round.

Ownership against open pull requests was checked through the listed sibling checkouts and `roadmaps show` for TopologicalKTheory, AlgebraicTopology (#1652, #1797), #1807 and #1808.

## Source issues

- **Misprint** in zentner-instanton-sheet2 at Exercise 2, p. 1: the source calls the endomorphisms defining su(E) "skey-adjoint"; it should say skew-adjoint; affects nothing.
- **Gap** in zentner-instanton-sheet2 at Exercise 2(b), p. 1: the source derives the integral identity for p₁(su(E)) through the Chern character, which sees classes only modulo torsion; it should use the integral splitting principle with roots 0, ±(x−y); affects the proof.
- **Error** in zentner-instanton-sheet2 at Exercise 3, hint, p. 2: the source identifies BSU(2) with HP¹≅S⁴; it should say BSU(2)≅HP∞, whose 7-skeleton is HP¹≅S⁴, which suffices for the [S⁵,−] reduction; affects nothing.
- **Misprint** in cohen-fiber-bundles at Proposition 3.7, p. 87: the source puts η over X and the product bundle ζ×η over X∧Y; it should put η over Y and ζ×η over X×Y; affects nothing.
