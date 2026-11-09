# Review of CharacteristicClasses (pull request #1808 at eabc47f)

**Verdict:** needs changes

This is a full review. The folder changed by 1339 lines since 7933169, the head the previous review read. That review had eleven findings. Nine are repaired; its R08 and R09 stand, as R06 and R07 below. This review also finds five new defects:
- two P2s: this roadmap and three roadmaps it consumes each supply the other;
- three P3s: drifted GeometricTopology locators, a Poincaré–Hopf theorem that MorseNovikov owns, and definitions that still have no Checks.

`Suggested.lean` elaborates with only `sorry` warnings. All five headlines are true as stated. The worker's gate fails only on `outside-folder=2`.

## R01 (P2) — This roadmap and GeneralizedCohomology, and this roadmap and SpinGeometry, each supply the other

Location:
- `TauCetiRoadmap/CharacteristicClasses/README.md:446–449`: "GeneralizedCohomology G4.0a supplies the quaternionic projective line HP¹ with its Sp(1)/Spin(3) calibration, and its G4 the ordinary quaternionic-line normalization `u=c₂(F)`, used by C7.AdjointHopfObstruction." The same citation appears at 2904–2911 and in C7's Dependencies at 3022.
- `README.md:453–456`, 492, 1906–1911, 1925 and 1934–1938 (C3.5): "SpinGeometry G4.1a owns rank0/rank1 and frame transport … The item order is G4.1a → C3.5 → G4.3." C3's Dependencies (2043) lists SpinGeometry G4.1a.

Claim: both roadmaps are cited here as suppliers, and both consume this roadmap. Supply therefore runs in both directions between each pair, which is the "two roadmaps citing each other" defect. The dependency check passes only because the item chains are acyclic:
- C3 → GeneralizedCohomology G4.5 → C7;
- SpinGeometry G4.1a → C3.5 → SpinGeometry G4.3.

Witness:
- GeneralizedCohomology at this head, `README.md:38`: its supplier table lists "CharacteristicClasses, C1–C3". Line 2152 pins "x_H^HZ=−e(γ_H)=c₂(Cγ_H)=h" using this roadmap's c₂.
- SpinGeometry on main, `README.md:50`: "CharacteristicClasses C1,C3.5 … owns mod2 cohomology, universal w₂". Line 852: "G4.1a → CharacteristicClasses C3.5 → G4.3".
- #1807, which the merge-order paragraph puts before this pull request, has removed both citations from its copy of this README. That copy has no match for "GeneralizedCohomology G4" or "SpinGeometry G4.1a".

Repair:
- **C7.AdjointHopfObstruction.** Build the S⁴ instance with C1.1d's own clutching. F is the Hermitian rank-two bundle clutched by S³ ≅ SU(2), using the pinned `TauCeti.realSpinThreeHomeomorphQuaternionSphere`. Orient S⁴ so that ⟨c₂(F),[S⁴]⟩=1, and define u=c₂(F) here.
  - Delete "From TauCetiRoadmap.GeneralizedCohomology" (444–449) and remove GeneralizedCohomology G4.0a from C7's Dependencies.
  - Keep GeneralizedCohomology under Downstream consumers.
  - Point C2.2's third Check (1451), C2's Examples (1666) and C7's Examples (3015) at this S⁴ bundle.
- **C3.5.** Consume the pinned `TauCeti.CliffordAlgebra.isCoveringMap_realCliffordSpinToSpecialOrthogonalRange`, `realCliffordSpinToSpecialOrthogonalRange_eq_one_iff` and `realCliffordSpinContinuousMulEquivUnitsRange` (`Topology/Algebra/CliffordAlgebra/Spin/Real/Projection.lean:244, 226, 93`) for the frame transport.
  - State the rank-0 lift group μ₂ → SO(0)={1} and the rank-1 case as C3.5's own.
  - Delete "From TauCetiRoadmap.SpinGeometry" (451–456), the citations at 492, 1906–1911 and 1925, and the item-order sentences at 1934–1938. Remove SpinGeometry G4.1a from C3's Dependencies.
  - #1807's copy of C3.5 already reads this way.

Tested on the witness:
- Clutching by a generator of π₃(SU(2))=ℤ gives c₂(F)=±1, and the orientation makes it +1.
- Roots 0, x−y, y−x give p₁(su(F))=c₁²−4c₂=−4u, which pairs to −4 as the current Check states. e=0 because H³(S⁴)=0.
- After the edit, neither roadmap is named as a supplier, and both still cite this one as consumers.

## R02 (P2) — AlgebraicTopology and this roadmap each supply the other through C1.2a S0–S4

Location: `README.md:320–324`: "C1.2a consumes ordinary AT2–4 and ordinary 6.1–6.2 only. The separate AT supported-cellular supplement after ordinary 6.2 consumes C1.2a S0–S4 … and proper AT8.5 consumes the needed support interfaces." Also 3027–3030, under Downstream consumers.

Claim: C1–C7 consume AlgebraicTopology Stages 2–8; for example, C1.5a at 1170 consumes AT8.5's Whitehead theorem. In the other direction, AlgebraicTopology's supported-cellular supplement and its proper 8.5 consume C1.2a S0–S4. The compactly supported singular cochain foundation is generic algebraic topology, and supply runs both ways.

The previous review recorded this interleaving as a remark only. It is a finding now because #1807, ordered before this pull request, settles it in the other direction. Merging this copy after #1807 would put the loop back.

Witness:
- AlgebraicTopology at this head, `README.md:1695`: "This supplement consumes ordinary Stage4 cellular data, ordinary6.1–6.2, and CharacteristicClasses C1.2a's S0–S4 interfaces". Line 2342: "Consume CharacteristicClasses C1.2a's generic compact-relative support diagram".
- #1807's copy of this README, line 77: "AlgebraicTopology consumes nothing of C1.2a". Its AlgebraicTopology, line 1929: "C1.2a consumes the foundation".

Repair: adopt #1807's split in both folders of this pull request.
- AlgebraicTopology's supported-cellular supplement owns S0–S4: the support colimit `H_c`, enlargement, cofinality, proper pullback and open extension, supported cups, and jointly proper homotopy invariance.
- C1.2a consumes them. It keeps as its own S5 (support excision and the collared-pair triangle) and the mapping-cylinder collar pusher.
- Rewrite 320–324 and the Downstream-consumers bullet so that AlgebraicTopology consumes nothing of C1.2a.
- Add the old → new note "C1.2a S0–S4 are now AlgebraicTopology's supported-cellular foundation". "S0–S5" is cited by:
  - TopologicalSheafCohomology on main (line 11);
  - ComplexComparisonPartII (#848, lines 291, 804, 4843);
  - FourManifolds (#936, line 181).

Tested: after the edit, AlgebraicTopology lines 1695, 2342, 2952 and 2955 cite no CharacteristicClasses item, and C1.5a's use of AT8.5 is one-way.

## R03 (P3) — GeometricTopology Layer 10 is foliations, and the weak C∞ topology on `ContMDiffMap` is pinned, not GeometricTopology Layer 1's

Location:
- `README.md:381–384`: "GeometricTopology Layers1,3,10,11 owns embeddings/tubular maps, the smooth mapping topology, the oriented-plane Euler target and the smoothing-and-triangulation comparison";
- `README.md:1484–1485` (C2.3): "Compare the rank2 class with GT Layer10";
- `README.md:1615–1616` (C2.5): "Use GT Layer1's weak (compact-open C∞) topology on native `ContMDiffMap` carriers";
- C2's Dependencies (1676).

Claim:
- GeometricTopology Layer 10 states no oriented-plane Euler class. The Euler class of a foliation's tangent plane field is pinned, and it is by definition `TauCeti.eulerClass`, so there is nothing to compare.
- GeometricTopology Layer 1 puts no topology on `ContMDiffMap`. The weak C∞ topology is the pinned `ContMDiffMap.weakWhitneyTopology`, which GeometricTopology itself uses in Layer 3.3.

Witness:
- GeometricTopology on main, `README.md:7645`: "Layer 10: foliations of 3-manifolds". Line 627 lists the pinned `TauCeti.Foliation.eulerClass`.
- Tau Ceti pin, `Geometry/Manifold/Foliation/EulerClass.lean:122–129`: that `eulerClass` is `TauCeti.eulerClass … (fun x ↦ F.distribution x)`.
- `Geometry/Manifold/ContMDiffMap/WeakWhitney/Basic.lean:35`: "the initial topology induced by the compact-open topologies".
- GeometricTopology line 1507 (Layer 3.3) gives `Emb(N,M)` "the weak `C^∞` topology on `ContMDiffMap`".

Repair:
- 381–387: "GeometricTopology Layers 1, 3 and 11 own embeddings and tubular maps, the diffeomorphism-group and isotopy topology, and the smoothing-and-triangulation comparison used by C2.3a."
- 1484–1485: delete "GT Layer10". If the foliation case is wanted, cite the pinned `TauCeti.Foliation.eulerClass` and note that it is `TauCeti.eulerClass` of the tangent distribution by definition.
- 1615–1616: "Use the pinned weak C∞ topology `ContMDiffMap.weakWhitneyTopology` (`Geometry/Manifold/ContMDiffMap/WeakWhitney/Basic.lean`)". Keep GeometricTopology Layer 3.1 for its comparison with the Whitney topology on compact sources.
- 1676: "GeometricTopology Layers 1, 3 and 11".

## R04 (P3) — The vector-field Poincaré–Hopf theorem belongs to MorseNovikov §7.1 on main, but C2 lists it as its own

Location:
- `README.md:477–478`: "C2 builds the bundle disk/sphere cells, the Thom and Euler classes, the Euler class as primary obstruction, Poincaré–Hopf, Gysin maps and fibre integration";
- `README.md:1455–1457` (C2.3): "On a closed oriented manifold prove the sum-of-local-indices formula and the Euler-number identity e(TM)[M]=χ(M)";
- Scope (49–52) names only MorseNovikov N6.

Claim: C2.3 does not say which form its "sum-of-local-indices formula" takes. Combined with its χ identity, it plans Σ ind(V,p)=χ(M) a second time for oriented M. MorseNovikov on main already owns that theorem for every compact manifold.

Witness: MorseNovikov on main, `README.md:17–18`: "It owns the local fixed-point index, the Lefschetz formula and vector-field Poincaré–Hopf theorem". Lines 1285–1287: "Construct the vector-field Poincaré–Hopf theorem here … prove Σind(V,p)=χ(X)."

Repair:
- C2.3: state the index formula in its Euler-class form, which is this roadmap's. For an oriented rank-m bundle E over a closed oriented m-manifold and a section with isolated zeros, ⟨e(E),[M]⟩ is the sum of the local indices. Cite MorseNovikov §7.1 for Σ ind(V,p)=χ(M).
- 478: replace "Poincaré–Hopf" with "the Euler-class index formula".
- 49–52: add "and the vector-field Poincaré–Hopf theorem of MorseNovikov §7.1".

Tested: on S² the height gradient has indices +1 and +1. The Euler-class form gives ⟨e(TS²),[S²]⟩=2, MorseNovikov's form gives χ(S²)=2, and C2.3's headline is exactly the bridge between them.

## R05 (P3) — Six definitions have no Checks, and most targets have no *Needs:* line

Location:
- These items construct objects but have no **Checks.** block:
  - C2.4 (1596): the embedding Gysin map;
  - C2.6 (1647): the G/T transfer;
  - C3.5 (1896): the central-lift cocycle;
  - C6.1 (2682): the bundle-level Td, L and Â;
  - C6.3 (2756): the suspension-degree character and Hper;
  - C7.3a (2946): ν_f and w̄(M).
- Only ten targets carry a *Needs:* line: 603, 1178, 1330, 2312, 2359, 2430, 2492, 2560, 2604 and 2661. No item of C1.1a–C1.6 other than C1.0 and C1.5a has one, nor does any item of C2.1–C2.6 or C3–C7.

Claim: every definition needs at least three discriminating Checks. Every target needs its own *Needs:* line, because the layer-level Dependencies lists do not say which item uses what.

Repair: add Checks such as these, then *Needs:* lines item by item. For example, C2.2: C2.0, C2.1, AT8.9 and the pinned `TauCeti.eulerClass_eq_zero_of_forall_ne_zero`.
- **C6.1.**
  - For a 2-plane with root x, Â₁=−x²/24=−p₁/24. A product over both ±x roots gives Â(x)Â(−x)=1−x²/12, that is −p₁/12.
  - Td(TCP¹)=1+h pairs to 1.
  - L₁(TCP²)=h² pairs to 1, the signature.
- **C7.3a.**
  - w̄(RP²)=(1+a)⁻³=1+a, so w̄₁=a≠0 excludes RP²→ℝ².
  - w̄(RP³)=1 because (1+a)⁴=1, consistent with RP³⊂ℝ⁴.
  - For Sᵐ⊂ℝᵐ⁺¹, ν_f is trivial and w̄=1.
- **C3.5.**
  - w₂(TCP²)=3h mod 2=h≠0, so CP² is not spin.
  - w₂(TS²)=2h mod 2=0.
  - In rank 1, w₂=0 and the trivial lift exists.
- **C2.4.**
  - For Δ:S²→S²×S², Δ*Δ_!(1)=e(TS²) pairs to 2.
  - For i:pt→S², i_!(1) is the orientation class of H²(S²).

## R06 (P3) — The merge order relative to #1854, which rewrites this folder differently, is still not stated

Location: the description's merge-order paragraph: "#1101 (ModularCurves) → #1807 (the other loops) → **this pull request**".

Claim: #1854 changes this folder and conflicts with this head, and neither description says which pull request is rebased on the other. The R01/R02 repairs also mean that when this branch is rebased onto #1807, the rebase must keep #1807's loop cuts and not overwrite them.

Witness:
- `overlaps.md`: "#1808 and #1854 conflict in … `TauCetiRoadmap/CharacteristicClasses/README.md`, `TauCetiRoadmap/CharacteristicClasses/Suggested.lean`".
- `diff` against `roadmaps show CharacteristicClasses --pr 1854` (f28d376) is 1135 lines. That copy has the C2.3 theorem but not `cechSingularCWTypeComparison`.

Repair: state the order relative to #1854 in the merge-order paragraph, and rebase so that every branch carries one agreed copy of this folder.

## R07 (P3) — Two files outside the pull request's roadmap folders are still changed

Location: `Completed/ArithmeticDirichletSeries/README.md:331` and `TauCetiRoadmap/SymplecticGeometry/README.md:77`.

Claim: neither folder is one of this pull request's own, and the gate fails on exactly these two files.

Witness: worker gate "outside-folder=2 … FAIL". `git log origin/main..HEAD` on the two paths gives e591d103 and 61e5385e (2 insertions, 2 deletions).

Repair: drop e591d103 and 61e5385e from the branch, or move them to a pull request of their own.

## Previous findings

- **R01 — repaired.** `Suggested.lean:208` states `eulerClass_tangentBundle_evalFundamentalClass_eq_eulerChar`. README 1474 names it, and 1463–1465 fixes h by `TauCeti.localOrientationOfManifoldOrientation`.
- **R02 — repaired.** README 2107–2110: "Consume LieGroups Layer 5A's Ad-invariant positive-definite metric B_G, the orthogonal splitting". `grep "own input"` returns nothing.
- **R03 — repaired.**
  - README 271–275: "TopK T1.6a's positive-rank finite oriented carriers … their lifted finite cells and coordinate maps".
  - TopologicalKTheory 79–80: "CharacteristicClasses (CC) C1.1a–b … is a consumer and supplies no input to this roadmap"; lines 83–87 give T1.6a the lifted cells and the oriented rank-map lift.
- **R04 — repaired.** README 2833: "IndexTheory I7.2 consumes L₃ for the signature theorem in dimension twelve." IndexTheory appears only as a consumer (2833, 3044).
- **R05 — repaired.**
  - 1352–1354 cite `IsThomClass.singularCohomologyMap` and `IsThomClass.pullback`, each for its own statement.
  - 2118 reads "Mathlib's `LieAlgebra.HasCentralRadical`".
  - `Suggested.lean:85–97` adds the CE/de Rham, Cartan–Koszul and transgression bullets.
- **R06 — repaired for the sampled items.** The house headings are present. Checks were added at 589 (C1.0), 1319 (C2.0), 2301 (C5a.1) and 2419 (C5a.3). The remaining definitions are R05 above.
- **R07 — repaired.** README 1062: "Own cechSingularCWTypeComparison, the Čech/singular comparison on CW type".
- **R08 — not repaired** (R06 above). The merge-order paragraph is unchanged and does not name #1854.
- **R09 — not repaired** (R07 above). The gate still reports `outside-folder=2`.
- **R10 — repaired.** 907–915 consume `TopCat.singularCohomologyBockstein` and `TopPair.singularCohomologyBockstein`. 1696–1705 consume the three pinned Milnor sequences and `subsingleton_limOne_of_isMittagLeffler`.
- **R11 — repaired.** 1184–1191: "⟨ι,hur(f_h∘x)⟩=⟨f_h*ι,[CP¹]⟩=⟨h,[CP¹]⟩=+1 … the +1 normalization belongs to x, not to the sphere map".

## Verified sound

**Gate, build and dependency check.**
- Worker gate: every count is 0 except `outside-folder=2`, which is R07.
- My standalone rerun reports `outside-folder=30`. It is not told the pull request's own folders: 28 of the 30 files are in the fourteen sibling folders, and the other 2 are R07's.
- Dependency check: `depcheck: 236 roadmaps, 2299 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- `lake env lean …/Suggested.lean` exits 0 in 10 s. The only warnings are `declaration uses sorry` at lines 143, 167, 183, 208 and 236.

**Signatures.** One scratch copy ran `#check @` on all five declarations, and each elaborated type matches its README statement:
- C2.1: `[Module.Projective K R]` is present, over an arbitrary base.
- C2.2: `[T2Space B]`, `[Topology.CWComplex univ]`, `hdim` and `hn` are present.
- C2.3: `E M : Type`, `hE`, `hh` and `hu` are present.
- C7.3a: k ≥ 1.
- No section binder is lost.

**Padding probe.** Each `sorry` was replaced by `first | rfl | simp | trivial | decide | infer_instance | aesop`; all five fail. No declaration restates a definition or mirrors a Check.

**Headline theorems** (README 14–23):
- Stated in `Suggested.lean`:
  - Thom class over an arbitrary base, C2.1: two theorems;
  - Euler class as primary obstruction, C2.2;
  - ⟨e(TM),[M]⟩=χ(M), C2.3;
  - Whitney's non-immersion of ℝP^(2^k), C7.3a.
- Named in the docstring as not statable. Each claim was checked at the pin:
  - the Thom isomorphism: no relative cup; `Cohomology/Cup.lean:203` is absolute only;
  - the universal rings: no Chern or Stiefel–Whitney class. The only `StiefelWhitney` files are quadratic-form ones, and `classifyingSpace` is for discrete groups only;
  - Borel / universal Chern–Weil, and the C4.2 comparison: no Chern–Weil map exists;
  - the CE/de Rham and Cartan–Koszul comparisons: no all-degree CE complex and no Weil algebra;
  - universal transgression;
  - the exterior Hopf theorem: no graded cohomology ring; `IntegralCup.lean:245` is only an iterated degree-one product;
  - the Chern character: no K-theory.
- The docstring also names the Gysin sequence as not statable.
- No statable headline is absent. L₃ is not pinned: `GenusPolynomials.lean` stops at `_two` for L and Â. C7.1's target is therefore real.

**Seeded sample, read at the locator:**
- C1.0: dupont-ln Proposition 2.20 (line 532, p. 15), Proposition 2.21 (566, p. 16) and Example 4.3 (976, (1) metric reduction, (2) orientation reduction); hatcher-vbkt line 1019 (printed p. 26, Gram–Schmidt retraction of GLₙ(ℝ) onto O(n)).
- C2.0: hatcher-vbkt line 641 (p. 16, D(E), S(E)) and lines 3427–3436 (p. 88, Thom pair (D(E),S(E))); cohen-fiber-bundles (2.4) at line 2950 (Ch. 3 §2, p. 86) and Proposition 3.7 at line 2979 (p. 87; misprint below). Milnor–Stasheff Lemma 18.1 is uncertified.
- C5a.1: dupont-ln Proposition A2 (2627), Proposition A7 (2713) and Theorem A8 (2752).
- C5a.2: dupont-ccc Proposition 8.3 (3548, (8.4)); hatcher-at §3.G table at line 14230–14239 (printed p. 326): SU(n) 2,…,n and E8 2,8,12,14,18,20,24,30.
- C5a.3:
  - alekseev-meinrenken-chern-weil §3.1, (10) at line 368: F=dθ+½[θ,θ] (line 316), Koszul algebra, and basic subcomplex (Sg*)^inv with vanishing differential (372–373);
  - dupont-ccc Chapter 4, Exercise 3, (4.15)–(4.17) at lines 2247–2264: U_s=sΩ+½(s²−s)[θ,θ];
  - dupont-ln Theorem 9.5 (2244) and Lemma 9.6 (2264).
- C5a.4–C5a.5: dupont-ccc Theorem 8.1 (3514; real coefficients, compact G); hatcher-at Theorem 3C.4 (12343; commutative associative Hopf algebra over a characteristic-0 field, finite type).
- C5a.6: dupont-ccc Corollary 8.35 (3989).
- C5a.7: hatcher-at Corollary 4D.3 (18734, (a) and (b)).
- C7.AdjointHopfObstruction: zentner-instanton-sheet2 Exercise 2, line 50: p₁(su(E))=−4c₂(E)+c₁(E)². Its hint (b) is rational; the README states the integral form by the splitting principle (see Source issues).

**Library declarations opened at the pins:**
- Tau Ceti, `Topology/VectorBundle/`:
  - `EulerClass.lean:245` (`IsThomClass`: span of the fibre restriction is ⊤), 258, 269, 327, 356 and 383;
  - `MayerVietoris/DirectedUnion.lean:227` and `:301` (below-rank vanishing over an arbitrary base; the `ThomClass.lean:477` version needs a global trivialization, and the README cites the right one).
- Tau Ceti, `AlgebraicTopology/`: `Cohomology/Bockstein.lean:127`; `UniversalCover/RealProjective/Basic.lean:60`.
- Tau Ceti, `Algebra/Category/ModuleCat/Tower/`: `Milnor/Basic.lean:501, 518, 532`; `MittagLeffler.lean:191`.
- Tau Ceti, `Geometry/`:
  - `Manifold/Instances/Quotient.lean:242` (needs `IsManifold`; no `ContMDiffConstSMul ℤˣ` sphere instance at the pin, so the docstring's target is real);
  - `Diffeomorphism/Sphere.lean:186` (isometry-group instance only);
  - `Manifold/Foliation/EulerClass.lean:122`;
  - `Manifold/ContMDiffMap/WeakWhitney/Basic.lean:35`;
  - `Manifold/DeRham/Basic.lean:127`.
- Tau Ceti, `Topology/Algebra/CliffordAlgebra/Spin/Real/Projection.lean:93, 226, 244`.
- Tau Ceti, `RingTheory/PowerSeries/`: `CharacteristicSeries.lean:147, 245`; `MultiplicativeSequence.lean:373`.
- Mathlib:
  - `Algebra/Lie/Cochain.lean:118` (`d₁₂_apply_apply_ofTrivial`: `−f ⁅x, y⁆`);
  - `Algebra/Lie/Semisimple/Defs.lean:75`;
  - `Algebra/Lie/Killing.lean:50`;
  - `Geometry/Manifold/Immersion.lean:174–193` (`IsImmersionAt` needs `E × F ≃L E''`, so the source dimension is at most the target dimension).

**Cross-roadmap citations resolved:**
- In this pull request:
  - AlgebraicTopology 2.5 (539–546, `supBallEuclideanDiskHomeomorph` with the formula C2.0 uses), 4.5 (`relativeCWPushoutCWModel` at 880), 5.5 (1337, multiplicative cohomological Serre), 6.0 (1481–1484, limit-complex comparison) and 8.3 (2252–2256, η₂=ε₁ and `h[g]=η_n·g′_*[Sⁿ]`, matching C1.5a's Check);
  - TopologicalKTheory T1.3, T1.4, T1.5a (451), T1.6a (481, countable-colour producer at 529), T6.4 (continuous principal-bundle foundation over arbitrary X×I) and T7 item 4 (doubled space, 1985);
  - ComplexKahlerGeometry K7.1 (2243) and K7.2 (2285);
  - GeneralizedCohomology G4.0a (1783) and G4.5 (2152).
- On main:
  - LieGroups Layers 5A and 6; CompactGroups Layers 0 (205) and 1 (226); LieHighestWeight Layer 1 (351);
  - LieGroupoidsPoisson §G1.3: the all-degree real CE complex, which LieGroupoidsPoisson itself attributes to G1.3a (line 86);
  - ReflectionInvariantTheory §§1–4; SchubertGeometry S9 item 6 (line 120, rational acyclicity of K/N(T), transfer, SU(2)/N(T)=ℝP²);
  - TopologicalSheafCohomology TS1.1–TS1.2 (106; it does not consume this roadmap back);
  - SmoothBundlesConnections B6.0 (1306); DifferentialGeometry Layers 8 (816) and 10.2 (884); MorseNovikov N6 (Lefschetz formula at 1131);
  - SpinGeometry G4.1a (397). The overlaps lead "only #1674 defines it" is false.
- `cechSingularCWTypeComparison` is back (1062), so ComplexComparisonPartII's citations resolve.

**Adversarial table**

| Statement | Instance | Values | Result | Change |
| --- | --- | --- | --- | --- |
| C2.1 `existsUnique_…_fiber` | B=pt, F=ℝ²; trivialization that reverses orientation | u=g for ω; for −ω, u=−g; a reflection pulls g back to −g, so both clauses agree | holds | — |
| same | rank 0, two components, signs (+,−) | u=(g,−g); (g,g) and (−g,−g) fail | holds | — |
| same | g=0 | every fibre restriction is 0, so u=0, unique by the pinned directed-union gluing | holds | — |
| C2.1 `exists_isThomClass_of_orientation` | K=ℤ, B=ℝ trivial ℝ²; K the zero ring; Möbius line | generator exists; span{0}=⊤ in the zero module; Möbius has no `o` (connected cover) | holds | — |
| C2.2 iff | TS² (cells 0, 2), n=2 | ⟨e,[S²]⟩=2≠0 / no section | both false | — |
| same | S²×ℝ²; oriented rank 2 over S¹ | e=0 / constant section; H²(S¹)=0 / trivial bundle | both true | — |
| same | su(F) on S⁴, rank 3 | 4-cell>3, so `hdim` fails; e∈H³(S⁴)=0, no section | `hdim` necessary | — |
| same | ranks 0 and 1 (`hn` dropped) | rank 1: oriented ⇒ trivial, e=0 and a section exists; rank 0, B≠∅: e=±1≠0 and no section | true, but the obstruction route needs S^(n−1) simple and (n−2)-connected | none (route uses `hn`) |
| C2.3 headline | S², T², S¹ | ⟨e,[M]⟩=2, 0, 0; χ=2, 0, 0 | holds | — |
| same | h replaced by −h on S² | −2≠2 | `hh` needed, does not contain the conclusion | — |
| same | M=∅ | 0=χ(∅)=0 | holds | — |
| C7.3a | k=1, 2, 3 | targets ℝ², ℝ⁶, ℝ¹⁴; w̄_(m−1)=a, a³, a⁷≠0; normal ranks 0, 2, 6 < 1, 3, 7 | holds | — |
| same | sharpness | ℝP² immerses in ℝ³; ℝPᵐ in ℝ^(2m−1) for m>1 (Whitney) | not over-strong | — |
| same | ℕ subtraction; k=0 | 2^(k+1)−2=2, 6, 14, never truncated; at k=0 no immersion ℝP¹→ℝ⁰ exists by dimension, but the route needs k≥1 | holds | none (route uses `hk`) |
| C1.0 transport (sample) | H=diag(1,4) | H^(−1/2)e₂=e₂/2 has h₁-norm 1; H^(1/2) gives norm 4, H⁻¹ gives 1/2 | holds | — |
| C1.0 Sylvester | H^(1/2)=diag(1,2) | sums 2, 3, 4>0; the commutator has eigenvalue 0 | holds | — |
| C2.0 (sample) | TS² over S²; rank 0; v=(1,1) | cells 2, 4; X₊; (1,1)/√2 has norm 1, the inverted ratio gives norm 2 | holds | — |
| C5a.1 (sample) | degree 1 | da(X,Y)=−a([X,Y]) = Mathlib `−f⁅x,y⁆`; Σeᵃ∧L_(eₐ)a=−2a([X,Y])=2da | holds | — |
| same | SU(2), Tⁿ | H¹=0, n | holds | — |
| C5a.2 (sample) | E8 | Σ(dᵢ−1)=120; ∏dᵢ=696729600=\|W(E8)\| | holds | — |
| C5a.3 (sample) | F_t at t=½ | coefficient −1/8; (t−t²)/2 gives +1/8; abelian: CS_P=θ, d_Wθ=Ω | holds | — |
| same vs A–M (10), Dupont (4.17) | curvature and U_s | d_Wθ=Ω−½[θ,θ]; U_s=sΩ+½(s²−s)[θ,θ] = README's F_t | agrees | — |
| C5a.4 (sample) | SU(2) | K_I=ℝ[P]⊗Λ(e₃), dimensions 1, 0, 0, 1; e₃ in degree 4 would contradict H³=ℝ | holds | — |
| C5a.5 (sample) | U(2) | (1+t)(1+t³), top degree 4=dim | holds | — |
| C5a.6 (sample) | U(3); P_K(−1) | 1+3+5=9; 0 (trivial group: 1) | holds | — |
| C5a.7 (sample) | E8 exponents | odd degrees sum to 248; dropping 3 gives 245 | holds | — |
| C7.AdjointHopf (sample) | roots 0, x−y, y−x | e₂=−(x−y)², p₁=(x−y)²=c₁²−4c₂; product of roots 0 ⇒ e=0 | holds; matches Zentner | S⁴ by clutching (R01) |
| same | Z=diag(1,−1) | X=0, Y=diag(−i,i), X+iY=Z | holds | — |
| same | ⟨c₂(F),[S⁴]⟩=1 | p₁ pairs to −4≠0; w_i∈H^i(S⁴;𝔽₂)=0 for i=1, 2, 3 | holds | — |
| C1.5a Check vs AT8.3 | ε₁=±1 | ⟨ι,h(f_h∘x)⟩=+1 for either ε₁; the sphere map reads η₂=ε₁ | holds | — |
| C3.2 relation | r=1; CPᴺ | a−c₁=0; a=−h, a^(N+1)=0 | holds | — |
| C3.3 Whitney correction | L⊕L on ℝP∞ | c=(1+y)²=1+y²; p₁=−y²≠0 in ℤ/2 | holds | — |
| C3.3 reduction | j=1, 2 | Sq¹w₁=w₁², Sq¹w₂=w₁w₂+w₃ (Wu) | holds | — |
| C7.1 L₃ | CP⁶, HP³, HP² | (2170−1911+686)/945=1; (496−624+128)/945=0; (49−4)/45=1 | holds | — |
| C6.2 ch | TCP² | ch₂=(9−6)h²/2=3h²/2 | holds | — |
| R04 P–H | S² height gradient | Σind=2=⟨e(TS²),[S²]⟩=χ(S²) | true; owner question only | cite MorseNovikov |
| R03 GT 10 | pinned foliation Euler class | `TauCeti.Foliation.eulerClass` := `TauCeti.eulerClass` of the distribution | comparison is definitional | delete |
| R05 C6.1 | 2-plane root x | Â₁=−x²/24; ±x product gives −x²/12 | discriminates | add Check |
| R05 C7.3a | ℝP², ℝP³, ℝP⁴ | w̄=1+a; 1; 1+a+a²+a³ | discriminates | add Check |
| R05 C3.5 | CP², S² | w₂=h≠0; 0 | discriminates | add Check |

**Ownership.** I compared objects with the `roadmaps` tools against main and the open heads named in this brief. The checks covered:
- the Thom/Euler carriers, which are all pinned;
- C1.1a's oriented carriers (TopologicalKTheory T1.6a, consistent);
- C1.2a S0–S5 (R02; also cited by #848 and #936);
- the vector-field index theorem (R04);
- the foliation Euler class (R03);
- the CE complex (LieGroupoidsPoisson);
- C5.1 (LieGroups 5A/6).

No declaration of `Suggested.lean` reuses a fully qualified name from a roadmap I could read.

## Not verifiable

- The following are settled as uncertified and cited by locator only:
  - Milnor–Stasheff §4, §§9–15, §§18–19 and Appendix C, including Theorem 10.4, §12, Corollary 11.12, Theorem 15.3 and Lemma 18.1;
  - Bott–Tu §§6, 11–14 and 20–23;
  - Milnor, *Topology from the Differentiable Viewpoint* §6;
  - Milnor, *Construction of Universal Bundles II* §§2–3.
- tom Dieck §§9.5 and 13–14.4, May Chapter 16, and Cohen Chapter 1 §2.2 and Chapter 3 §4.2 are outside the sample and were not re-read.
- Ownership against all 459 open pull requests was checked only for the objects listed under Ownership.

## Source issues

- **Misprint** in cohen-fiber-bundles at Proposition 3.7, printed p. 87: the source puts η over X and ζ×η over X∧Y; it should put η over Y and ζ×η over X×Y, with Thom space T(ζ)∧T(η); affects nothing.
- **Gap** in zentner-instanton-sheet2 at Exercise 2(b), p. 2: the source derives p₁(su(E)) through the Chern character, which yields the identity only rationally; integral equality needs the integral splitting principle on the flag bundle; affects the proof.
- **Misprint** in zentner-instanton-sheet2 at Exercise 3, p. 2: the source writes BSU(2) as HP¹≅S⁴; it should be HP∞, whose 7-skeleton is S⁴, which suffices for maps from S⁵; affects nothing.
