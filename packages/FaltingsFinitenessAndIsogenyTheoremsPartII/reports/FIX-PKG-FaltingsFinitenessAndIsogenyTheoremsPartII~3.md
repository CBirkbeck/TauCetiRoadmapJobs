# Repair report

All six findings were checked against the cited supplier text, the cached legal sources and the pins. All six hold and are applied.

## F01 (P1) — applied

§2.2b's citation of §5.8 for "semistable cubist models" (principal only) → new contract gap:cubist-model-symmetric-ample (ArakelovGeometryAndAbelianHeights §5.8; README line plus appended `gaps` entry): every symmetric ample L and tensor power, probability-Haar L² metrics, semistability, degree identity, finite-extension compatibility (bost95 lines 398–453). Type-(1,2) Checks added to the contract and §2.2b.

Evidence: ArakelovGeometryAndAbelianHeights README:1586 builds the Moret–Bailly model only "for the symmetric principally polarizing line `L` and the fixed even `r`". Bost's Théorème 4.2 (bost95 lines 421–453, pp. 128–130) uses an arbitrary symmetric ample L. Its arbitrary-reduction extension (lines 450–453, 624–628) is used in Lemma 5.4 through 4.2(i) and 4.2(ii) (lines 685, 739). Searches for the object ("cubist", "Moret–Bailly model") over main, the open heads and the board packages found no general owner, so the supplier that already builds the principal case is named.

Same pattern elsewhere:
- §2.2 Needs and the Layer 2 Dependencies now name the cubist-model contract.
- The §2.2b statement now cites bost95 lines 450–453.
- The symmetrization step is now stated with its scalings: Riemann form ×2, Δ_L(B)×2^dim B, tangent slope −½log 2.
- That step now cites the metric-rescaling contract. Before, that contract's only consumer was the deleted §6.3 (see F03).

## F02 (P1) — applied

GN §1.2 "genuine integral basis bounded in terms of [the minima]" → GN §1.2 bounds no basis vector; new HeightsAndUnits contract (main, Layer 2, §2.1: general and minima forms) now supplies the bounded basis in the §§2.3, 2.7, 2.8 routes and Needs, Scope and Layer 2 Dependencies. GN keeps minima, flags and the product bound.

Evidence: GeometryOfNumbersAndQuadraticArithmetic README (open head) §1.2.13 says: "No bound on the individual gauges of `b_i` is claimed". HeightsAndUnits README on main, lines 250–274, states b_i∈max(1,(i+1)/2)λ_i·K and says this is strictly more than GN's flag theorem.

Same pattern elsewhere: §2.8's route ("Minkowski gives an integral basis of maximum norm") and §2.7's ("GN integral basis theorem") made the same claim. Both now cite HeightsAndUnits §2.1, with the factors max(1,(i+1)/2) and max(1,r/2) computed. No new gap was added.

## F03 (P2) — applied

Owned §§6.1–6.3 (period graphs, sharp surface estimate, preparatory estimates, quadratic theorem) → deleted; EllipticCurveModularityPartII §6.0f contract and Scope deferral added. §6.4 → §6.1, with C=9C₀/(log 2)², C₀=9,781,210,000,000. Summary, How to read, Downstream, the §2.2b route, a contract Check, Layer 6 Examples/Dependencies, the `Suggested.lean` docstring and `sources.toml` (mz20, gr14) were updated to match.

Evidence: EllipticCurveModularityPartII README (open head) lines 711–722 cover every d≥1, CM and non-CM. The bound there is 10⁷d²(max{h_F,985}+4log d)²≤10⁷·989²·d²H². The proof, including Proposition 6.9 and both period graphs, is owned there. The merge order puts it at 189, before this roadmap at 229.

Same pattern elsewhere: R28.6.6 lost its only consumer (the deleted non-CM graph), so it was removed from the Part I contract and the Dependencies.

## F04 (P3) — applied

The Check "0≤4 log 2" now reads "(log 2)/2≤4 log 2 (≈0.3466≤2.7726)". The quotient-norm calculation is shown, with squared norms 1, ½, 1 and the shortest lift (e₁⊗e₂+e₂⊗e₁)/2. The Check notes that giving every monomial unit norm wrongly gives 0, and that a degree-two scalar extension keeps (log 2)/2. The rank-one Check with slope 0 is unchanged.

Evidence: recomputed. The three lines are orthogonal and the mixed line has normalized degree −½log½. The theorem's bound still holds.

## F05 (P3) — applied

"component ring homomorphisms in `ZHat/Ring.lean`" now reads: `TauCeti.zHat.component` in `ZHat/Component.lean`, line 70, with continuity and surjectivity at lines 121 and 136. `ZHat/Ring.lean` is kept only for the `CommRing` instance.

Evidence: checked at the pinned Tau Ceti. `Component.lean:70` declares `noncomputable def component : Additive zHat →+* ℤ_[ℓ]`; `:121` is `continuous_component`; `:136` is `component_surjective`. `Ring.lean:69` is `instCommRing` and contains no component.

## F06 (P1) — applied

Deleted the QuadraticFormInvariants supplier section (which claimed restriction compatibility for every class), its Scope sentence, the §3.4 Needs entry and the Layer 3 Dependencies entry. The §3.4 route now uses the gap:cyclic-maximal-subfield presentation D=⊕uⁱE, uⁿ=a≠0 directly, for every index. The ClassFieldTheory contract now says that the cohomology-to-algebra passage belongs to fulfilling that gap. Added an index-3 Check.

Evidence: QuadraticFormInvariants README on main. Lines 2467–2470 (milestone 5) state naturality only for ι on Br₂, and the functoriality bullet near line 2501 says "on 2-torsion". MW95's Lemma 3.3 proof (mw95 lines 245–332) uses only a cyclic presentation over the center. The existing gap already asks for exactly that.

## Check outcomes

- **`lake env lean packages/FaltingsFinitenessAndIsogenyTheoremsPartII/Suggested.lean`** (run from the content checkout): exit 0. The only output is the two expected "declaration uses `sorry`" warnings, at lines 45 and 64. The imported `TauCeti.AlgebraicGeometry.EllipticCurve.Isogeny.Degree` object file already existed, so nothing was built. No Lean process is left running.
- **`#check @name` comparison.** I put `#check @name` for all three declarations in one scratch file and elaborated it once: exit 0.
  - `regularOrderDiscriminant` keeps `[Ring D]` and the integral basis.
  - `class_index_bound` keeps `DivisionRing`, `Algebra ℚ D`, `FiniteDimensional ℚ D`, both span hypotheses, `0 < e` and `Module.Finite ℤ M`.
  - `elliptic_isogeny_j_height_bound` keeps `Field`, `NumberField`, both `IsElliptic` instances, `2 ≤ finrank ℚ k` and the geometric isogeny hypothesis.
  - Each type matches its README statement. No binder was lost, and no Lean statement changed this round; only the module docstring did.
- **Dependency-direction gate** (`gate --depcheck … --movable`): exit 0. Output:

      depcheck: 52 roadmaps, 591 edges, 0 problem(s)

  There is no UPWARD, CYCLE or moved line. HeightsAndUnits (main) and EllipticCurveModularityPartII (merge-order position 189, before this roadmap at 229) are the new suppliers.
- **Citation resolver** (`roadmaps resolve` on the README): none found nowhere, checked against main 1ce5c4f and the 363 open heads. Its library-name scan does not run on this host, so `TauCeti.zHat.component` was opened at the pin by hand.
- **`git diff --check`**: clean.
- **Plan file**: `design/plan.json` still parses. Only one `gaps` entry was appended; every other top-level value and every earlier gap is unchanged (compared with HEAD). `sources.toml` parses as TOML.
- **README checks**: no LaTeX delimiters, no TeX-only syntax outside code spans and no machine paths. The new README gap line matches its plan `needs` and supplier.
- **Gate failure `tex=5`** (TeX-only `^{` outside code spans): the five hits were the braced tensor powers. Three were on the gap:cubist-model-symmetric-ample contract line (`π_*ℒ^{⊗n}` twice and `χ(L^{⊗n})`), one in its type-(1,2) Check (`π_*ℒ^{⊗n}`), and one in the §2.2b *Needs:* line (`π_*ℒ^{⊗D}`). Each brace was dropped (`ℒ^⊗n`, `L^⊗n`, `ℒ^⊗D`), and the same three edits were made in that gap's plan `needs`, so it still matches the README word for word. The mathematics is unchanged. After the edit the gate's TeX scanner reports no hits on the README, the plan parses, depcheck again gives `52 roadmaps, 591 edges, 0 problem(s)`, and `git diff --check` is clean. `Suggested.lean` was not touched, so it was not elaborated again.

## Notes for the maintainer

- **Consumers of names other roadmaps may cite.** README §6.4 is now §6.1. The README's quadratic stable-height theorem and the sharp surface estimate are now imported from EllipticCurveModularityPartII §6.0f, so other roadmaps should cite that section for them, not this one. No Lean name changed.
- **Supplier changes.** New suppliers: HeightsAndUnits (Layer 2, §2.1) and EllipticCurveModularityPartII (§6.0f). Dropped as suppliers: QuadraticFormInvariants Layer 7B, and FaltingsFinitenessAndIsogenyTheorems R28.6.6 (dropped as a consumed item only; Part I is still a supplier). New request: gap:cubist-model-symmetric-ample to ArakelovGeometryAndAbelianHeights §5.8. The hermitian-metric-rescaling contract is now consumed by §2.2b.
- **Earlier housekeeping, still open.** Two existing plan entries are unchanged, as decided in earlier rounds, and still need a maintainer:
  - the `needs` text of hom-specialization-saturation still includes the redundant injectivity clause;
  - the coarse hermitian-maximal-slope entry has no README line;
  - G1–G8 also remain.

  Under this job's rule I can only append to the gaps list, so I could not change any of these.
- **Ownership searches.** I searched by object, not by name, over main, the open heads and the board packages using `roadmaps grep` and grep:
  - cubist / Moret–Bailly models: no owner for the general symmetric case;
  - bounded basis from the minima: HeightsAndUnits only;
  - the Gaudron–Rémond Theorem 1.4 bound: EllipticCurveModularityPartII only;
  - the j-height isogeny statement: no duplicate.
- **Lean name collisions.** No declaration in `Suggested.lean` uses the fully qualified name of a declaration in a readable roadmap.
- **Sources.** No new source key and no missing-reference request. The bost95 locator gains §4.2 Théorème 4.2, pp. 128–130 (file page 15 is printed p. 128). The gr14 locator now lists only what is still cited: p. 344, Theorem 1.4, §3.2 and §6.8.
- **Suspicious text.** None found in the review.

## Adversarial mathematics record (new and changed statements)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Cubist-model contract: rank | Principal product line on E₁×E₂; type (1,2) line pr₁*O(0)⊗pr₂*O(2[0]); g=1, L=O(0) | χ=1 vs 2; c₁²=2 vs 4; map-degree 1 vs 4; rank of π_*ℒ^{⊗n} = n² vs 2n²; on E rank n | Nonprincipal input admitted, §5.8 alone excludes it | New gap + 2 Checks |
| Cubist-model contract: degree identity | Same two lines, power n | ¼log(2n²/(2π)²) − ¼log(n²/(2π)²) = ¼log 2 | Rank enters only through ρ | Check |
| Cubist-model contract: powers and symmetrization | Powers of the type-(1,2) line; L⊗[−1]*L | Type (n,2n), never (1,1); symmetrization gives type (2,4) | Principal reduction is unavailable | Check |
| Cubist-model contract: normalization | h_Del vs h_F at g=1 | h_Del−h_F=½log π≈0.5724 (supplier §2.7) | h_Del defined in the contract | Stated |
| Symmetrization scaling (§2.2b) | Elliptic O(P), P not 2-torsion; dimension b | Degree 1→2 = 2¹; squared period norm ×2; Δ_L(B)×2^b; tangent slope −½log 2 (c=2) | Consistent with metric rescaling | §2.2b text, contract Check |
| L↦L⁴ tangent scaling | Rank-b tangent subspace | Lengths ×2, h rises by b log 2, cotangent slope +log 2 | Matches §2.2b Check | Check reworded |
| §2.2b type-(1,2) section space | D=4, length-14 scheme T | h⁰=2·16=32; kernel ≥32−14=18 (principal: 16, ≥2) | Consistent with noninjectivity | New Check |
| Sym² slope Check | ℤ² standard; unit-monomial model; degree-two extension | Squared norms 1,½,1; μ̂_max=(log 2)/2≈0.3466≤4log 2≈2.7726; wrong model gives 0; normalized slope unchanged | Original 0 refuted | Check fixed |
| HeightsAndUnits minima form | ℤ², Euclidean disk; basis (e₁,Ne₁+e₂) | λ₀=λ₁=1; factors max(1,½)=1, max(1,1)=1 give lengths ≤1,1; other basis has length √(N²+1) | Flags do not bound lengths | New contract |
| §2.3 bounded period basis | B=0; dim B=1,2 | Empty basis; factors for i=0..3: 1,1,1.5,2 ≤ max(1,dim B) | Factor stated correctly | Route |
| §2.7 basis from short span | Non-CM E (r=1); E² non-CM (r=4) | Length factors max(1,½)=1 and max(1,2)=2 | Rank ≤4g² gives dimension constant | Route |
| §2.8 bounded basis | End(E²)=M₂(ℤ), D_λ=16 | Minima ≥1, product ≤c·√16=4c, so largest ≤4c | Route valid | Route |
| §3.4 route: cyclic presentation | ℚ; Hamilton (E=ℚ(i), u²=−1); index-3 class with invariants ±1/3 | n=1,2,3; m=1,4,9; bounds 2¹, 2⁴, 2⁹=512; 2α has invariants ±2/3≠0 | Odd index reached without 2-torsion naturality | QFI removed, Check |
| §6.1 j-height constant | D=2, j=0; D=1, j=0; h_F=−1 | H≤3 gives 36C₀ = 4C(log 2)² with C=9C₀/(log 2)²; at D=1, H≤4max(1,h(j)) gives 16C₀; B(1,−1)=9.70225·10¹²≤C₀ | Derived constant exact at D=2 | Route, Check |
| Imported bound vs old §6.3 form | H=max(1,h_F,log d); d=1,2 | max{h,985}≤985H, 4log d≤4H, so 10⁷·989²=9,781,210,000,000; gr14 Theorem 1.4 (gr14 line 182) gives 10¹³ | Supplier implies the deleted target | §§6.1–6.3 deleted |
| Profinite component | ℓ=2,3; a=0,1,6 | component(0)=0, component(1)=1; 6 mod 2 = 0, 6 mod 3 = 0 | Ring homomorphism at the correct file | Locator |
