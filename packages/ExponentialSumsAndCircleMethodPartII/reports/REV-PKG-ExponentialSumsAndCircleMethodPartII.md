<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1266#issuecomment-6390808269 -->
Review (claude) of 0a11907

Verdict: needs changes

1. **F01** (P1) Gaps G3 and G6 have no supplier, and §9.5 and §12.4 are open problems planned as targets

   Location: `packages/ExponentialSumsAndCircleMethodPartII/design/plan.json`, top-level `gaps` entries `G3` and `G6`, which have no `supplier` field. README §9.5 (line 1004): "It is a separate proof problem". Line 1006: "Seek an improvement beyond the separate stratum dimension and stalk bounds". §12.4 (line 1444): "Construct a topology on the prescribed-germ set …".

   Claim: these two gaps are unowned. They are this roadmap's own unsolved problems, namely the sharp minor-arc bound and a global germ topology. No supplier and no source proves either of them. Even so, the plan lists them as theorems to prove (`minorsharpgate` has proof status `open-sharp-bound`; `stronggermgate` has `open-global-topology`). G3 also lists `GCM.10/irreduciblesafe` (README §10.8, the headline stated in `Suggested.lean`) in its `neededBy`, which makes the headline look conditional on an unowned gap. The README's §10.8 *Needs:* line does not cite G3.

   Witness: plan.json `gaps[0]` (id `G3`) and `gaps[3]` (id `G6`) carry only `id`, `title`, `neededBy` and `detail`. The README has no `What … must provide (gap:G3)` or `(gap:G6)` line under `## Exact supplier contracts`.

   Repair:
   - Delete G3 and G6 from `gaps`.
   - Restate §9.5 as a definition of the proposition (for example `SharpMinorArcBound(d,f,x)`) and §12.4 as a definition of the required topology data. Use each only as an explicit hypothesis of §10.3, §12.5, §13.1 and §13.3. No target is asked to prove them.
   - Remove `irreduciblesafe` from every `neededBy`.
   - Check on the BS20 example k=3, d=4, n=24 that nothing unconditional uses the sharp cutoff 188: the conservative cutoff is 192 (R-table row 9.4).

2. **F02** (P1) Gaps G4 and G5 have no supplier and record review status, not mathematics

   Location: `design/plan.json` `gaps` entries `G4` ("has no packet/node ids at this snapshot … No unavailable original book was read") and `G5` ("the packet has no independent review yet … not independently verified in this run").

   Claim: both entries are unowned (supplier `none`). Their `needs` text is process narrative, and the intake would post it to a supplier job. G4 duplicates the declared, owned gap `gap:lpv-universal-monodromy`. G5 is a remark about the review status of AlgebraicTopologyPartII and names no missing statement.

   Witness: plan.json G4/G5 have no `supplier`. README line 75 already declares `gap:lpv-universal-monodromy` with supplier LefschetzPencilsAndVanishingCycles for the same universal-monodromy input that G4 describes.

   Repair: delete G4 and G5. Any genuine AT2 prerequisite is handled under R03, and the monodromy prerequisite under R06.

3. **F03** (P1) AlgebraicTopologyPartII is cited as a supplier, but it exists only as a board design

   Location: README line 15 ("AlgebraicTopologyPartII AT2.1–AT2.5 owns configuration schemes, permutation torsors, arrangement cohomology …"). It is also cited at lines 77–81, 589, 661, 1081, 1178, 1373, 1386, 1517 and 1531.

   Claim: §§5.10, 10.4, 11.12 and 13.3 consume AT2.1–AT2.5 as if those sections were supplied. The roadmap AlgebraicTopologyPartII is not on main and not in any open TauCetiRoadmap pull request. It exists only as a board design package (merge order line 124), whose own package review reads "needs changes". The brief's merge order lists it as an earlier roadmap, so the direction of supply is fine. Under this review's binding rule, however, a cited roadmap that is on neither main nor an open pull request is blocking.

   Witness: `roadmaps grep 'AlgebraicTopologyPartII' --fixed` prints "no match on main or in any open roadmap pull request", and so does the worker's citation scan. The sections exist only in `packages/AlgebraicTopologyPartII/design/README.md`, lines 37–600.

   Repair: turn each consumed AT2 item into a declared gap with supplier AlgebraicTopologyPartII and the same slug in plan.json `gaps` and in the README. That covers configurations, configuration torsor, arrangement cohomology, stable diagonal, tame polynomial, tame bouquet, double-loop Betti series and Fermat loop connectivity. Each needs sentence must keep the hypotheses already written in README line 79: m+1≤a≤2m; n≥4 and d(n−3)≥j; n≥5 for the Fermat case. The alternative is to hold the package until AlgebraicTopologyPartII is opened as a roadmap pull request, and then re-resolve AT2.1–AT2.5 at that head.

4. **F04** (P2) gap:at2-mapping-restriction asks for what DGFloer on main already provides, and names the wrong section

   Location: README line 81, "What AlgebraicTopologyPartII must provide (gap:at2-mapping-restriction): … compact-open Hurewicz-fibration theorem for based restriction Map_*(A,X)→Map_*(B,X)". The §12.3 *Needs:* line is at line 1434.

   Claim: the contract duplicates an existing owner. It is also assigned to AT2.1, which is about configuration spaces.

   Witness: `TauCetiRoadmap/DGFloer/README.md` on main, Layer 2 item 2 (lines 484–485): evaluation C(K,X)→C(L,X) along a closed cofibration L⊆K of compact Hausdorff spaces is a Hurewicz fibration. The based map is its pullback along Map_*(B,X)⊂C(B,X).

   Repair: delete the gap from plan.json and the README. In §12.3 and in the supplier contracts, cite DGFloer Layer 2 items 2–3, and state the based restriction as a pullback inside §12.3's proof route. Test: for D²⊃S¹ the fibre over the constant loop is Map_*(S²,X)=Ω²X, as §12.3 requires.

5. **F05** (P2) The FunctionFieldArithmetic contracts are phrased in this roadmap's objects, are compound, and point at unrelated sections

   Location: README line 67, "provide the polarization, symmetric-lattice shrinking and exact counting interfaces yielding #V_k(G_b)(F_(q^r))≤C(d,k,n)(q^r)^(dn(k−1)−n floor(m/(k−1)))", and line 69 (gap:ff-count-dimension, "§0.1; finite-field geometric counting extension").

   Claim:
   - **Not statable by the supplier.** gap:ff-polar-minor-count is stated in this roadmap's own objects: V_k from §8.1, the phase G_b from §§3.4/9.1, and the Hankel rank-m locus from §4.1. FunctionFieldArithmetic could not state it without this roadmap, which contradicts the contract's own "no dependency on this roadmap".
   - **Compound.** It bundles three interfaces with a final bound.
   - **It is BS20 §6 itself.** It asks the supplier for this roadmap's own source section: Lemma 6.1, Lemma 6.4 and Proposition 6.2 (BS20 pp. 935–939).
   - **Wrong section.** FunctionFieldArithmetic §§2.1–2.3 are divisor lattices, self-dual volumes and Fourier transforms of lattice indicators in the adeles. None of them concerns polarization or shrinking.
   - **Wrong section for ff-count-dimension.** gap:ff-count-dimension is assigned to §0.1, which is degree and Frobenius conventions.

   Witness: FunctionFieldArithmetic at its open head has §2.1 divisor lattices, §2.2 the self-dual measure and §2.3 Fourier transforms of lattice indicators. Shrinking is in BS20's own §6 (line 2008). The board design of GeometryOfNumbersAndQuadraticArithmeticPartII proposes a split routing BS20 Lemma 6.4.

   Repair:
   - Plan BS20 §6 here as a layer between Layers 8 and 9: the polar system, Lemma 6.1, Proposition 6.2 and the BV15 Lemma 2.8 count through §1.1.
   - Keep at most one generic contract, stated for symmetric matrices γ over F_q((1/T)) with no V_k, G_b or Hankel locus. That is the Lemma 6.4 shrinking inequality, and its owner should be decided against the GeometryOfNumbersAndQuadraticArithmeticPartII proposal.
   - For gap:ff-count-dimension (BS20 Lemma 5.6), either cite an actual Lang–Weil owner section or make it a local target.

6. **F06** (P2) gap:lpv-universal-monodromy is compound, mostly provided already, and phrased in this roadmap's objects

   Location: README line 75, "provide the full primitive symplectic or orthogonal geometric Zariski monodromy images and their product/Goursat comparison, … sufficient to place simultaneous −Id in the two-factor semisimplification".

   Claim: the contract asks for four things at once: the monodromy images, the classification of the finite case, Goursat, and a −Id conclusion. Its last clause is about 𝒱 (§6.3), which is an object of this roadmap. Most of the images are already planned by the supplier.

   Witness: LefschetzPencilsAndVanishingCycles at its open head has §5.1 (a general line sees the full monodromy of the dual complement), §5.8 (open in Sp), §5.10 (orthogonal: open or finite) and the Sp/O/ADE closure after §5.11. Goursat is BS20's Lemma 4.3 proof, pp. 924–925.

   Repair:
   - Cite LPV §§5.1, 5.8 and 5.10 for the image of each primitive factor over the space of smooth hypersurfaces.
   - Keep as a gap only the residual: for degree k≥3 hypersurfaces in even dimension the image is not finite, except for cubic surfaces. State it for hypersurfaces in P^N, without M_(n,k).
   - Move the Goursat comparison, with BS20's rank bound N₁≥6, into §6.5 as a proof step here.

7. **F07** (P2) gap:ecf-pi1-surjection asks for what InverseGaloisAndArithmeticFundamentalGroups IG.5.7 provides

   Location: README line 55 (gap:ecf-pi1-surjection) and the §6.4 *Needs:* line at line 716.

   Claim: the requested surjection is supplied in substance by an earlier roadmap in the merge order (line 51).

   Witness: IG.5.7 (*Finite-cover criteria for full monodromy image*, at its open head) gives π₁ surjectivity for a smooth surjection with nonempty geometrically connected fibres, and for a dense open of a connected normal stack. Both fibre types in §6.4 are connected.

   Repair: delete the gap. Cite IG.5.7 in §6.4, and keep the fibre verification that §6.4 already plans. The dense-open step uses the normality of H_(n,k) and H_(n−1,k).

8. **F08** (P2) gap:ecf-character-fourier is compound

   Location: README line 53, "construct the nontrivial Artin–Schreier character sheaf with its additive tensor law, nonzero-linear and translation cancellation, and prove H_c^i(𝔾_m×𝔸¹,L_ψ(hg(a)))=0 for i>2 for every one-variable polynomial g of degree 1≤deg g<p".

   Claim: one gap bundles two different deliverables. The first is a generic sheaf package. The second is the specific one-modulus vanishing at the core of BS20 Lemma 3.7, which BS20 proves from the Fourier transform of g_*Q_ℓ (BS20 lines 1161–1168, citing Katz).

   Witness: in BS20 the second clause is a step inside the proof of Lemma 3.7 (p. 918), not a foundational statement. In this README it is consumed only by §5.8.

   Repair: split the gap. Keep the sheaf package (sheaf, tensor law and both cancellations) as gap:ecf-character-fourier. Either declare a second gap for the Fourier input actually used ("the ℓ-adic Fourier transform of a middle-extension sheaf on 𝔸¹ has no geometrically constant quotient"), or make the vanishing on 𝔾_m×𝔸¹ a target of Layer 5 consuming that input.

9. **F09** (P3) The statements of Layers 11–13 are original, but their locators read as if BS20 contained them

   Location: §11.11 (line 1356, locator "BS20, Context: §7, (7.1) and Lemma 7.2 with its proof"), and likewise §§11.4–11.12, 12.1–12.5 and 13.2.

   Claim: BS20 §7 contains none of these statements: the escaping loop, end winding, the controlled collars, the failure of the compact-open reading of Lemma 7.2, and the failure of Conjecture 7.1. They are new. I checked the main ones and they are correct (table rows 11.4–13.2). A locator, however, should not suggest that the source supports them.

   Witness: BS20 lines 2149–2194 define Hom_(d,P)(C,X), Conjecture 7.1 and Lemma 7.2 without any topology, any winding invariant or any example.

   Repair: in each of these locators, replace "Context" with a phrase saying that the statement is original to this roadmap and that BS20 §7 is the setting it refines. Add one Scope sentence recording that Layers 11–12 contain new examples, since §13.2's disproof has no published source. Whether unpublished results may stay is a policy decision for a human.

10. **F10** (P3) The roadmap is titled Part II, but no Part I exists

   Location: README line 1 ("part II") and line 5 ("This is the geometric continuation of exponential-sum and circle-method theory: the arithmetic input stops at polarization, shrinking and uniform finite-extension counts.").

   Claim: the base roadmap ExponentialSumsAndCircleMethod is not on main, not in any open pull request and not on the board. The introduction therefore cannot say where the base stops, and the second sentence describes an unnamed base. Nothing is re-planned, because there is nothing to import from.

   Witness: `roadmaps grep 'ExponentialSumsAndCircleMethod' --fixed` prints "no match on main or in any open roadmap pull request". There is no `packages/ExponentialSumsAndCircleMethod` folder. Other board packages cite only an atlas id, "ExponentialSumsAndCircleMethod:ES.0".

   Repair: rewrite the second summary paragraph without the base reference. State directly that the arithmetic input is BS20 §6 (see R05), or rename the roadmap; either way a human decides.

11. **F11** (P3) §0.2 does not cite the counting theorem it generalizes

   Location: README line 113, "(LR14v2, Theorem 1.1 and Proposition 2.3, v2 pp. 3–5; LR14v2 line 124 and line 231; …)".

   Claim: the F_q-grid count is LR14v2 Theorem 2.1 (p. 3). Theorem 1.1 is a Bézout inequality. The version for an arbitrary field and an arbitrary grid S^N is the roadmap's own adaptation of the slicing proof of Proposition 2.3.

   Witness: LR14v2 line 144 (Theorem 2.1, affine case Σ c-deg_l(X)q^l). Neither LR14v2 nor BV15 states an S^N version.

   Repair: add "Theorem 2.1, p. 3; LR14v2 line 144" to the locator, and say at the claim that the arbitrary-grid form adapts the proof of Proposition 2.3, using only the inequality form of Bézout.

12. **F12** (P3) §§5.12, 7.2 and 7.4 are narrower than the source

   Location: line 612 ("For n≥3, …"), line 780 ("For d≥k−1≥2 and n>2^k(k−1), …") and line 812 ("… even order of ℓ mod p, …").

   Claim: BS20 Lemma 3.11, Proposition 2.5(1)–(2) and Proposition 4.1 assume only the standing hypotheses (smooth X and Z, n≥2) and char>k. Proposition 4.1 additionally excludes the Lemma 4.3 cases. Neither the range on d and n nor the parity of ℓ is needed.

   Witness: BS20 lines 553–563 and 1221–1223. For n=2, X is an affine curve with H⁰_c=0 and a top-trace isomorphism, so §5.12 already holds.

   Repair: drop the extra hypotheses from these three statements. Any special case can be recorded as a Check.

13. **F13** (P3) Citation style and one missing Scope clause

   Location: lines 589, 661, 1081, 1178, 1373, 1386, 1517 and 1531, for example "AlgebraicTopologyPartII AT2.1 / configuration-torsor". Also the Scope section (lines 9–15).

   Claim: eight *Needs:* lines cite design node slugs instead of section titles, which line 79 does use. The kept Hankel–Padé variant of §4.4 does not say how it differs from ClassicalArithmeticCompletion §6.44 (*Kronecker's eventual Hankel vanishing criterion*, on main).

   Witness: ClassicalArithmeticCompletion §6.44 states eventual vanishing of leading Hankel determinants for infinite series. §4.4 is a finite-length statement about rectangular rank with a Padé error term (BS20 Lemma 2.4(4)).

   Repair: replace each slug with its section title (*Configuration permutation torsor*, …). Add one Scope clause: "§4.4 is the finite-length rectangular-rank form; ClassicalArithmeticCompletion §6.44 is the infinite eventual-determinant criterion."

Fourteen findings: three P1, six P2, five P3 (R09 raised to P2 by the maintainer: padding in the acceptance test is blocking, not style). The mathematics of the README holds up well: every Check and worked example I evaluated came out right, and the conservative repair of the minor-arc range is justified, since the printed proof in BS20 really does fail at that step (see Source issues). The blocking problems are all in the supplier layer: four plan gaps have no supplier, one cited supplier exists only as a board design, and five gap contracts are either already provided elsewhere, phrased in this roadmap's own objects, or compound.

## R09 (P2, blocking by maintainer override) — `small_degree_excess_dimension` is padding

Location: `Suggested.lean` lines 84–100, and README line 1142 ("The acceptance statement `small_degree_excess_dimension` writes …").

Claim: this is a sharpness control (BS20 Remark 1.5), not a headline. It is an explicit example showing that the hypothesis d≥k−1 cannot be dropped. The proof is a count of variables minus equations on one explicit closed subscheme, plus one point. `hchar` and `hdk` are not needed for its truth.

Witness: with g₂=0 and constant g_j satisfying Σ_(j≥3)c_j^k=−1 (solvable over any algebraically closed field), Krull gives dimension ≥ d(N−1)−k(d−1)−1 for every d≥1. That is exactly d(n+2)+k−1 ≤ dim+kd. A one-tactic `simp` probe fails, as expected.

Repair: delete it from `Suggested.lean`. In README §10.9, keep the target and delete the sentence that names the Lean declaration.

## Verified sound

**Lean.** I ran `lake env lean` on `Suggested.lean` from the content checkout. It elaborates with exactly two warnings, both "declaration uses `sorry`" (lines 62 and 88).
- In a scratch copy I ran `#check @` on all five declarations. Every binder is explicit, there are no section variables, and the elaborated types match README §§3.1, 10.8 and 10.9. Nothing changed.
- These definition probes elaborated: coefficient d of `mappingPolynomial` is `C (x j)`, coefficient i<d is `X (i, j)`, `mappingIdeal` of f=1 is ⊤, and of f=0 is ⊥.
- A one-tactic `simp` on `small_degree_excess_dimension` fails.
- The headline's hypotheses are satisfiable: the Fermat cubic in 40 variables with d=2 and x=(1,ζ,0,…) passes every hypothesis, and `hrange` reads 2<1·3.

**Library declarations opened at the pins.** All sixteen cited locations hold the cited declaration:

| Declaration | File:line |
| --- | --- |
| `MvPolynomial.eval₂Hom` | `Mathlib/Algebra/MvPolynomial/Eval.lean:158` |
| `MvPolynomial.pderiv` | `Mathlib/Algebra/MvPolynomial/PDeriv.lean:61` |
| `MvPolynomial.homogeneousComponent` | `Mathlib/RingTheory/MvPolynomial/Homogeneous.lean:512` |
| `Matrix.rank` | `Mathlib/LinearAlgebra/Matrix/Rank.lean:132` |
| `LaurentSeries` | `Mathlib/RingTheory/LaurentSeries.lean:100` |
| `RatFunc.inftyValuation` | `Mathlib/FieldTheory/RatFunc/Valuation.lean:81` |
| `Ideal.height_le_spanRank_toENat_of_mem_minimalPrimes` | `Mathlib/RingTheory/Ideal/KrullsHeightTheorem.lean:185` |
| `Nat.forall_exists_prime_gt_and_modEq` | `Mathlib/NumberTheory/LSeries/PrimesInAP.lean:462` |
| `legendreSym.quadratic_reciprocity` | `Mathlib/NumberTheory/LegendreSymbol/QuadraticReciprocity.lean:107` |
| `legendreSym.at_two` | `Mathlib/NumberTheory/LegendreSymbol/QuadraticReciprocity.lean:60` |
| `CategoryTheory.Abelian.SpectralObject` | `Mathlib/Algebra/Homology/SpectralObject/Basic.lean:41` |
| `ContinuousMap.curry` | `Mathlib/Topology/CompactOpen.lean:430` |
| `nonempty_inter_closedPoints` | `Mathlib/Topology/JacobsonSpace.lean:105` |
| `AlgebraicGeometry.LocallyOfFiniteType.jacobsonSpace` | `Mathlib/AlgebraicGeometry/Morphisms/FiniteType.lean:112` |
| `UnitAddCircle.fundamentalGroupMulEquiv` | `TauCeti/AlgebraicTopology/UniversalCover/Circle/FundamentalGroup.lean:257` |
| `Circle.fundamentalGroupMulEquiv_expLoop` | same file, line 388 (sends exp(2πit) to +1) |

**Cross-roadmap citations resolved.**
- SchemeAndStackFoundations on main: §§0.2, 0.3, 0.7, 0.8, 0.9 and 5.12 (Bézout inequality). §0.7 has semicontinuity and the generic fibre formula but not constructible level sets, so gap:sf-fibre-strata is genuine.
- EtaleCohomologyFoundations on main: F.0.1, F.0.2, 0.6, 0.7, F.1, F.2.4–F.2.7, F.3, F.4.1–F.4.6, F.5 and F.6. None of them has an Artin–Schreier sheaf.
- EtaleDualityAndPerverseSheaves at its open head: §0.6 (Poincaré duality and the smooth connected top degree), §§3.2–3.8, 4.1, 4.3, 4.6 and 5.9. gap:edc-top-components extends §0.6 to singular M, so it is genuine.
- LefschetzPencilsAndVanishingCycles at its open head: Layer LPV.5.
- FunctionFieldArithmetic at its open head: §§0.1 and 2.1–2.3.
- AlgebraicTopology on main: Stage 4, Stage 6 (universal coefficients) and Stage 8.
- DGFloer on main: Layer 1 item 1.

Every cited section exists where it is cited, except AlgebraicTopologyPartII (R03).

**Dependency check.** It reports no UPWARD and no CYCLE line:

    moved: ExponentialSumsAndCircleMethodPartII moved in the merge order from #124 to #168, right after its last supplier FunctionFieldArithmetic; checked as moved (the worker moves it there when it submits)
    depcheck: 36 roadmaps, 333 edges, 0 problem(s)

**Gaps.** The other two declared gaps are fine:
- gap:sf-fibre-strata is precise, minimal and statable by SchemeAndStackFoundations (Stacks 05F9 supports constructibility).
- gap:edc-top-components is precise and statable. It could also be a local target built from EDC §0.6 and excision, but as stated it is acceptable.

**Duplication.** I searched by object across main, all 340 open roadmap pull requests and the board packages. The objects were: mapping scheme, Hankel/Padé, Weyl differencing, circle method, Artin–Schreier sheaf, Lang–Weil, configuration spaces, double loop spaces, Milnor fibres, Hurewicz fibrations, shrinking lemma and successive minima.
- Only R04, R05, R06, R07 and R14 found existing owners.
- No declaration in `Suggested.lean` shares a fully qualified name with another roadmap.
- Ownership against the sibling pull requests named in the brief was checked through that same index of open heads.

**Sources.** I verified all fifteen sampled targets against the text.
- These match their locators and hypotheses: §3.4, §4.1, §4.2, §5.5, §6.6, §7.1 (Stacks 012K and 0BK5), §7.2, §8.2, §8.5 and §10.1.
- §0.2 needs a locator repair (R12). §7.2 is also narrower than its source (R13).
- §§11.11, 12.1, 12.2 and 13.2 are correct but not in the source (R10).
- I also checked the locators of §§2.1, 3.6, 4.3–4.7, 5.1–5.14, 6.5, 7.4, 8.1, 8.3–8.6, 9.1–9.4, 10.2–10.10 and 13.3 against BS20.
- No locator was flagged unverified by the author.
- None of the fetched text contained instructions.

**README shape.** Every layer ends with Examples and Dependencies, and every definition has at least three Checks. There are no LaTeX delimiters, no process words, no `lemma`, no pull-request numbers and no machine paths. The house-style headings are present.

**Checks.** I read all 224 Check bullets and all 14 Examples paragraphs. I recomputed every one that asserts an explicit value (see the table below) and found none false.

### Adversarial table

| Statement | Instances tried | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| Conv. normalization | 𝔸¹ vs 𝔸⁰ | H²_c(𝔸¹)=E(−1), trace q; H⁰(pt)=E, trace 1 | holds | none |
| Conv. absolute value on 𝔽_q[T] | 0, 1, T; h=0 ball | abs(0)=0, abs(1)=1 (not <1), abs(T)=q; ball={0} | holds | none |
| Conv. Koszul sign | n=4, 5 | (−1)^((n−1)²): −1, +1 | holds | none |
| Conv. winding | exp(2πis), its inverse | +1 (Tau Ceti line 388), −1 | holds | none |
| Conv. D=d(n−k) | n=40,k=3,d=2 | n>2^k(k−1)≥k so no truncation; D=74 | holds | none |
| 0.1 dimension theorem | two planes in 𝔸³; parallel lines | line: 1=2+2−3; empty, so hypothesis fails | holds | none |
| 0.1 consequence | V cone, Δ diagonal (BS20 p.939) | dim(V∩Δ)=0 ⇒ dim V≤(k−1)n−n=(k−2)n | holds | none |
| 0.2 grid bound | S={0,1}, line ∪ (0,1) in 𝔸² | count 3; ΣΔ_i·#S^(e_i)=2+1=3; Δ·#S^e=4; top-only 2<3 | holds; top-only fails | none |
| 0.2 Check parabola | y=x², x=0 | affine section degree 1 vs deg 2 | inequality only | none |
| 0.3 strata | {y=0}∪{x=0} → x-axis | fibre dims 1 at 0, 0 elsewhere; point outside image −∞ | holds | none |
| 1.1 box | 𝔽₂[T], h=2 | S={0,1,T,T+1}; line 4, plane 16; h=0 gives {0} | holds | none |
| 1.1 boundary | BV15 abs(x)≤q^N | equals deg<N+1, i.e. h=N+1 | agrees | none |
| 2.1 coefficient prime | p=5, p=2 | 19≡−1 mod 5, order 2; mod 2, −1≡1 (order 1) | holds; p=2 excluded | none |
| 2.2 residue prime | ℓ=2; ℓ=3 | p=13: 2⁶≡−1, order 12; p=5: (3/5)=(2/3)=−1, order 4 | holds | none |
| 3.1 definitions (Lean) | coefficients d and i<d; f=1; f=0 | C(x_j); X(i,j); ⊤; ⊥ (all elaborated) | holds | none |
| 3.1 Check f=Y₁ | d=1, x₁=1 | T+a₀ gives unit ideal; dropping incidence gives a₀=0 | holds | none |
| 3.2 expected dimension | dn variables, kd equations | each component ≥dn−kd=D; empty gives no claim | holds | none |
| 3.3 Check | Y₁(Y₁−1) in 𝔸² | f₀=Y₁² singular at [0:1], so excluded | holds | none |
| 3.4 phase | Y₁³−Y₂³+1, d=1, x=(1,1) | f(g)=3(a−c)T²+3(a²−c²)T+(a³−c³+1), so e as stated | holds | none |
| 3.4 Checks | b=0; f+1 | e=0; e changes by b₁ | holds | none |
| 3.4 degree-k part | general f | top a-degree part of f(g) is f₀(A(T)) | holds | none |
| 3.5 complex | b=0, dn=2; p=5, ℓ=2 | E[−4](−2), trace q²; ord₅2=4; μ₅⊄ℚ₂ | holds | none |
| 3.6 orthogonality | BS20 Lemma 2.1 | H^i_c(Mor)=H^(i+2kd)_c(𝔸^kd,S(kd)) | agrees | none |
| 4.1 Hankel | L=9,m=4,b₅=1; L=3,m=0 | 5×5 anti-identity, det (−1)^2=+1, rank 5; column zero | holds | none |
| 4.2 nesting | b_r=ca^(r−1) | rows ca^(i−1)(1,a), so rank≤1 and b∈A₁ | holds | none |
| 4.3 full range | L=9, m=4 and m=5 | rank 5>4; 4 rows≤5 so full | holds | none |
| 4.4 Padé | α=0 | h₂=1, h₁=0, m′=0 | holds | none |
| 4.5 uniqueness | two approximants | −m′−m″≤−L−1+m−m′ ⇒ L+1≤2m, contradiction | holds | none |
| 4.6 chart | m=1, c/(T−a) | b_r=ca^(r−1); U₀={(0,1)} | holds | none |
| 4.7 dimension | lower strata | 2m′+(m−m′)=m+m′≤2m | holds | none |
| 5.1 cancellation | translation λT^(d−m)h₂ | needs d−m≥0, given m≤d | holds | none |
| 5.2 remainder | xT²+a₁T+a₀ mod (T−b) | xb²+a₁b+a₀; rank n(d−m), 0 at m=d | holds | none |
| 5.3 residue complex | h₂=T−a; m=0 | phase h·f(g(a)); pair (0,1) gives E | holds | none |
| 5.4 shift | 1 coordinate | E[−2](−1) (BS20 misprints +2) | holds | none |
| 5.5 CRT | BS20 line 1007 | h=h₁l₂+h₂l₁ | agrees | none |
| 5.6 nonsquarefree | ∇f≠0 / f≠0 cases | translations give λh₁(x)∂f and λf | holds | none |
| 5.7 trace fibre | 𝔸^(n−1); two copies | fibre 0; fibre E (one top class left) | holds | none |
| 5.8 one modulus | degree bound | 2(n−1)+2=2n=2(n−2)+4 | holds | none |
| 5.9 constant complex | T vs T−1; Fermat cubic 𝔸³ | same phase h·f(a); rank (k−1)^n=8 in degree 4, twist −1 | holds | none |
| 5.10 descent | m=0, m=1 | E; trivial S₁ | holds | none |
| 5.11 stratum | m=0 | E[−2nd](−nd) | holds | none |
| 5.12 middle degree | n=2 curve | H⁰_c=0, top trace iso | holds for n≥2 | R13 |
| 5.13 sign twist | m=2, n=4 and n=5 | Λ² (agrees with BS20 Fig. 1); Sym² | holds | none |
| 5.14 degrees | a vs PConf degree | a−[m(n−1)+2m+2n(d−m)]=a+m(n−1)−2nd | equals Cor 3.12 | none |
| 6.1 incidence | ΣY^k−1, x=(1,ζ,0,…) | f₀(x)=1+ζ^k=0 | holds | none |
| 6.2 support | top sheaf | E(−(n−1)) | equals Lemma 4.2(3) | none |
| 6.3 extension | sub/quotient, twist | sub h_(n−1)*Prim, quotient h_n*Prim; no twist | equals Lemma 4.2(2) | none |
| 6.4 fibres | h_n, h_(n−1) | cone∖0 over connected Z; open in affine space | connected | R07 |
| 6.5 −1 element | [[−1,1],[0,−1]] | square [[1,−2],[0,1]]≠I; eigenvalue −1 | holds | none |
| 6.5 exceptions | (k,n₁)=(3,3) | occurs only for (k,n)=(3,3),(3,4) | agrees (BS20 line 1424) | none |
| 6.6 relative | Lemma 4.4 | a=i+m(n−1)−2nd | agrees | none |
| 7.1 filtration | two stages | d₁ = localization boundary, bidegree (1,0); 0BK5 | holds | none |
| 7.2 first page | a=m+s in 5.14 | exponent s+mn−2nd | equals Prop 2.5(2) | R13 |
| 7.3 relative | m=0 | E[−2nd](−nd) | holds | none |
| 7.4 parity | column m vs m+r | eigenvalues (−1)^m vs (−1)^(m+r), r odd | d_r=0 | R13 |
| 7.5 shifted page | (0,0); n=40,k=3,d=2 | E(L−nd)=E(−D)=E(−74); m=1 exponent s+n | holds | none |
| 8.1 V_k | k=1; G=a₁², k=2 and k=3 | point / ∅; y₁=0 so dim N−1; all pairs, dim 2N | holds | none |
| 8.2 cd | constant; linear; H^p−H | 2N; −∞; 2N | holds | none |
| 8.3 sign reversal | ord_p ℓ even/odd | ℓ^(ord/2)≡−1; no power ≡−1 | holds | none |
| 8.4 additivity | acyclic factor | −∞+x=−∞ | holds | none |
| 8.5 closed points | nonempty constructible support | a closed point exists, residue field 𝔽_(q^r) | holds | none |
| 8.6 Weyl bound | constant; N=1, p=5, a² with k=2 and k=3 | RHS 2N; dd=0 ⇒ ≤1, actual 1; dd₃=2 ⇒ ≤2 | holds | none |
| 9.1 differencing | Prop 5.7 | dn(k−1)−n⌊m/(k−1)⌋ | agrees | R05 |
| 9.2 stalk bound | Props 5.5 + 5.7, N=dn | (dn2^(k−1)−nq)/2^(k−2)=n(2d−q/2^(k−2)) | agrees | none |
| 9.3 cover | L=9 (d=3); L=12 (d=4) | m∈{3,4}; m≤5. Floor misses A^9∖A₄ | ceiling needed | none |
| 9.4 conservative | k=3,d=4,n=24 (δ=1,t=2) | B(4)=188, B(5)=192; printed 188; conservative 192 | holds | none |
| 9.5 sharp | same | 188<192 at m=5, unproved | open problem | R01 |
| 10.1 spreading | x transcendental over the ring of f | R must contain x | holds | none |
| 10.2 comparison | k=3,d=2,n=40 | i+2dn>2dn+4(k−1)−4tδ ⇔ i>−4; 2dn−2L=2D | holds | none |
| 10.3 sharp gate | k=3, tδ=3 | −8 vs −4 | holds | R01 |
| 10.4 E₁ support | a=s+mn, m+1≤a≤2m | s∈[−m(n−1)+1, −m(n−2)] | equals Lemma 2.8 | none |
| 10.5 bands | n=40 | [−37,−37], [−75,−74]; −1 in neither | holds | none |
| 10.6 degeneration | r≥2 | m≥r(n−3)+2 ⇒ m+s≤−2(n−2)(n−3) | holds | none |
| 10.7 criterion | line ⊔ point, D=1 | point violates the lower bound | holds | none |
| 10.8 headline (Lean) | Fermat n=40; k=3,d=4,n=24 | hypotheses hold (2<3); tδ=2=k−1 excluded | holds; `hn` implied by `hrange` (P3 note) | none |
| 10.9 small degree (Lean) | general d≥1 | d(N−1)−k(d−1)−1=D−d+k−1; n=2 gives 1=0 | holds; `hchar`, `hdk` unused | R09 |
| 10.10 conjecture | i=0, m≥1 | needs m+1≤m(n−1)≤2m ⇒ n≤3 | holds | none |
| 11.1 germ | Fermat g | [1:ζ:z^d:0:…:0:z^d] | holds | none |
| 11.4 phase | r=1/4; s=0, 3/8, 1 | h(1,r)=1 since (1−r)/r≥3; σ=1, −1, 1 | holds | none |
| 11.5 degree | h increases from 0 to 1 | degree +1 | holds | none |
| 11.6 Fermat map | power sum | T^(dk)(1+ζ^k)+1=1 | holds | none |
| 11.7 loop | fixed s>0 | r(T)<s/2 for abs(T) large, so σ=1; abs(a_s)=abs(T)^d | holds | none |
| 11.8–11.10 winding | tube lemma on K×{∞} | common chart; v≠0 at finite points | well defined | none |
| 11.11 value | v=x₀/x₁=1/a_s | ratio R^d/a_s=σ^(−1), winding −1 | holds | R10 |
| 11.12 obstruction | ∨S³⁹ | π₂=π₃=0 ⇒ π₁Ω²X=0, while π₁Hco↠ℤ | holds | R10 |
| 12.1 collar | u=az, w=1+bz; w=1.1; w=−1 | ‖a‖, abs(b); distance ∞; abs(w−1)=2 | holds | none |
| 12.2 straightening | abs(w−1)<1/2 | abs(1+(1−tχ)(w−1))>1/2 | holds | none |
| 12.3 fibre | D²⊃S¹ | Map_*(D²,X) contractible; fibre Map_*(S²,X)=Ω²X | holds | R04 |
| 12.4 topology problem | — | no construction given | open problem | R01 |
| 12.5 conditional | X a point | both sides are points | holds | R01 |
| 13.1 pairing | n=40,k=3,d=2 | range 0≤j<8 | holds | none |
| 13.2 failure | j=1 | H_c^147=0 (i=−1 lies in no band); H¹(Hco,ℚ)≠0 | not perfect | R10 |
| 13.3 implication | n=3 vs n≥4; j bound | π₀Ω²(∨S²)≠0; 8≤d(n−3)=74 | holds | none |

## Not verifiable

- Katz, *Exponential sums and differential equations*, 8.2.5(2), which BS20 uses in the proof of Lemma 3.7 (lines 1161–1168). The manifest does not record it and the README does not cite it. I did not check whether the clause deg g<p in gap:ecf-character-fourier is necessary (see R08).
- Katz–Sarnak, Theorem 11.4.9, BS20's input for Lemma 4.3. It appears only in plan.json G4, not in the README, and I did not read it.
- BV15's journal pagination. The README cites the arXiv v2 preprint pages, and the manifest records this in a version note.
- The board design of AlgebraicTopologyPartII, which has not been reviewed independently. I matched the cited section titles and hypotheses only.

## Source issues

- **Error** in BS20 at the end of §5, proof of Proposition 2.6, printed p. 934: the source bounds the stratum cutoff 4(m+1) from below by 4(k−1)⌊m/(k−1)⌋+4, then uses monotonicity as if that were an upper bound. It should: the argument proves vanishing only above 2dn+4(k−1)−4tδ (at k=3,d=4,n=24,m=5 the cutoff is 192, not 188). Affects a stated result.
- **Misprint** in BS20 at the same proof, printed p. 934: the source takes the top index m₀=⌊kd/2⌋−1, which misses A^kd∖A_⌊kd/2⌋ when kd is odd. It should be ⌈kd/2⌉−1; for kd=9, A₄≠A⁹ (5×5 anti-identity). Affects the proof.
- **Gap** in BS20 at the same proof, printed p. 934: the source uses dim(A_(m+1)∖A_m)≤2(m+1), but Lemma 3.1 parametrizes only the open part U_(m+1). It should: the lower-denominator strata need the Padé count m+1+m′≤2(m+1). Affects the proof.
- **Misprint** in BS20 at the proof of Lemma 3.4, printed p. 913: the source writes the pushforward of the constant sheaf along the remainder map with shift +2n(d−m). It should be −2n(d−m), as the next display uses. Affects nothing.
- **Gap** in BS20 at Proposition 2.5(3) and Proposition 4.1, printed pp. 905 and 922: the source states odd-page vanishing with no exceptions, but its proof uses Lemma 4.3, which excludes (k,n)=(3,3),(3,4). It should list these exceptions, which are harmless under n>2^k(k−1). Affects a stated result.
- **Gap** in BS20 at the spreading-out paragraph after Theorem 2.7, printed p. 906: the source's model ring is generated only by the coefficients of f. It should also contain the coordinates of P, with a nonzero coordinate inverted. Affects the proof.
- **Gap** in BS20 at the proof of Corollary 2.9, printed pp. 907–908: in characteristic p the source applies Theorem 1.1 without choosing ℓ of even order mod p. It should choose ℓ≡−1 mod p, which Dirichlet provides. Affects the proof.
- **Gap** in BS20 at Lemma 7.2, printed p. 940: the source leaves the topology on the space of germ-prescribed maps unspecified; under the compact-open topology an escaping loop has winding −1 while Ω²X is simply connected. It should specify a topology with uniform germ control. Affects a stated result (Lemma 7.2, Conjecture 7.1).
- **Misprint** in BS20 at the argument before Theorem 7.7, printed p. 945: the source equates the sum of first-page dimensions with dim H^(−i) of the mapping space. Under Conjecture 7.1 it should equate dim H_c^(i+2d(n−k))(Mor) with it. Affects nothing.
- **Misprint** in BS20 at the proof of Lemma 2.4, printed p. 903: the source's kernel relation sums i from 1 to m, but the kernel vector has m+1 entries. It should run to m+1. Affects nothing.
- **Misprint** in BS20 at the proof of Lemma 3.5, printed p. 915: the source's final symmetry sentence says the involution switches h1 and h2. It should switch the factors l₁ and l₂ with their numerators and remainders. Affects nothing.
- **Misprint** in BS20 at the proof of Lemma 3.7, printed p. 917: the source speaks of generic a₂,…,a_(n−1). It should be a₂,…,a_n, the other n−1 coordinates. Affects nothing.
- **Error** in LR14v2 at Lemma 2.6, printed p. 5: the source claims equality deg(X∩H)=deg X also for affine X, which fails for y=x² and x=0 (degree 1 vs 2). It should give only the inequality that the sum of component degrees is at most deg X. Affects the proof (of Proposition 2.3(a), which needs only that inequality).
- **Misprint** in LR14v2 at Proposition 2.3, printed p. 4: the source puts an affine subvariety "in P^n". It should be in A^n for the affine case. Affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "0a11907", "job": "REV-PKG-ExponentialSumsAndCircleMethodPartII", "model": "opus", "worker": "fable-rev72"} -->
