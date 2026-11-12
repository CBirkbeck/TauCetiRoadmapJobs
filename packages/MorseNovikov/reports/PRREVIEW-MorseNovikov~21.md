# Review of MorseNovikov (pull request #1854 at 85fe284)

**Verdict:** needs changes

## R01 (P2) — The README plans, as its own constructions, objects the pinned Tau Ceti proves, and contradicts `Suggested.lean`

**Location.** README lines 32–34: "The completed ring, cutoff moduli, based Novikov torsion, orbit zeta series and Euler torsor are constructions of this roadmap." §§1.1–1.5, 2.1–2.2, 3.3, 4.1–4.5 and 5.2–5.3 plan these objects. "From Tau Ceti" (lines 117–153) names none of them.

**Claim.**
- The pinned Tau Ceti proves Layer 1 and the algebra of §§2.1–2.2, 3.3, 4.1–4.5 and 5.2–5.3.
- `Suggested.lean` lines 21–30 say so: "proved at the pinned Tau Ceti and are therefore not restated here". The README and its acceptance test therefore disagree about who owns these objects.
- This branch's commit 49135b7e consumed them; the merge commit 7d06cbab dropped that change.
- This finding supersedes the previous R02.

**Witness.**
- `TauCeti.NovikovSeries` (RingTheory/NovikovSeries/Basic.lean:92) is §1.1's carrier, with the same `N h < C` cutoff.
- `ofFinsupp_surjective_iff` (:697) is §1.1's last sentence.
- `AddMonoidAlgebra.exists_ringEquiv_pi_field_of_isFractionRing` (Algebra/MonoidAlgebra/TotalQuotient.lean:198) is the ℤ[H] half of §4.2.

**Repair.**
1. Replace Scope lines 31–35 with the 49135b7e paragraph. It begins "The pinned libraries supply group algebras…", lists by section what the pinned Tau Ceti has, and ends "…the dynamical/cellular equality and the Euler torsor are constructions of this roadmap."
2. Add every declaration in the table below to "From Tau Ceti", with its file and hypotheses.
3. In each listed section:
   - replace the sentence that constructs a pinned object with "Consume `…`";
   - keep the section's Checks;
   - keep as targets only what the declaration does not state, as 49135b7e did. For example, §4.2 keeps the Nov(ℤ,H,N) half, the cyclotomic description and independence of the splitting.
4. In Worked examples, lines 1517–1520, cite `TauCeti.NovikovSeries.IrrationalExample` (RingTheory/NovikovSeries/Examples/Irrational.lean:28–201) instead of requiring the example.

| § | Pinned declaration (file:line under `TauCeti/`) |
|---|---|
| 1.1 | `TauCeti.NovikovSeries`, `forall_finite_lt_iff_forall_finite_le`, `exists_isLeast_image_support`, `ofFinsupp_surjective_iff` (RingTheory/NovikovSeries/Basic.lean:92, 122, 141, 697) |
| 1.2 | `completionPkg` (Topology.lean:349); `mapRingHom` (Functoriality.lean:184) |
| 1.3 | `nonnegSubring`, `posIdeal`, `unitsOneSub` (TopologicalRing.lean:245, 277, 312); `expMulEquiv` (ExpLog.lean:70); `multipliable_of_finite_cutoffs` (InfiniteProduct.lean:148) |
| 1.4 | `toLaurentSeries`, `toLaurentSeriesUniformEquiv` (LaurentSeries.lean:77, 183); `PeriodKernelSplitting`, `hahnSeriesEquiv` (HahnSeries.lean:98, 376); `isDomain_of_fg` (LeadingTerm.lean:266) |
| 1.5 | `TauCeti.NovikovModule` (RingTheory/NovikovModule/Basic.lean:53); `kernelMap` (KernelMap.lean:126) |
| 2.1–2.2 | `TauCeti.IsMorseOneForm`, `IsMorseOneForm.finite_zeroSet` (Geometry/Manifold/Morse/OneForm.lean:48, 171); `TauCeti.periodHom` (Geometry/Manifold/DeRham/Period.lean:313) |
| 3.3 | `TauCeti.cellularChainComplexRep` (AlgebraicTopology/Cellular/Covering.lean:153); `TauCeti.cwComplexPreimage` (Topology/CWComplex/Classical/Covering.lean:398) |
| 4.1 | `HomologicalComplex.reidemeisterTorsion` and its `_eq_mul_of_shortExact`, `_eq_mul_of_splitting` and `_eq_mul_finprod_det_toMatrix` (Algebra/Homology/ReidemeisterTorsion/Basic.lean:291, 668, 738, 896); `reidemeisterTorsion_homotopyCofiber` (MappingCone.lean:196); `reidemeisterTorsion_eq_finprod_det_torsionMinor` (SquareMinor.lean:202); `reidemeisterTorsionWithHomology` (Homology.lean:226) |
| 4.2 | `AddMonoidAlgebra.exists_ringEquiv_pi_field_of_isFractionRing` (Algebra/MonoidAlgebra/TotalQuotient.lean:198); `NovikovSeries.ofAddMonoidAlgebra_mem_nonZeroDivisors` (NonZeroDivisors.lean:153), `isReduced_iff` (Reduced.lean:63), `charZero_quotient_of_isFractionRing` and `isArtinianRing_of_isFractionRing` (TotalQuotient.lean:87, 95) |
| 4.3, 4.5 | `tendsto_reidemeisterTorsion_of_det_torsionMinor_ne_zero` (ReidemeisterTorsion/Topology.lean:110); `NovikovSeries.isField_iff` (Field.lean:95); `componentwiseReidemeisterTorsion` (Componentwise.lean:99) |
| 4.4 | `cosetBasis`, `finrank_eq_index`, `trace_eq_index_smul_comap` (FiniteIndex.lean:146, 207, 216); `log_normNonnegSubring` (Norm.lean:189) |
| 5.2–5.3 | `Flow.ClosedOrbit`, `Flow.ClosedOrbit.multiplicity` (Dynamics/Flow/ClosedOrbit.lean:307, 427); `orbitZeta`, `orbitZeta_eq_mapRingHom_eulerProduct` (OrbitZeta.lean:104, 264); `LinearMap.sign_det_one_sub_pow` (LinearAlgebra/Matrix/Charpoly/DetSign.lean:168) |

Tested on two instances:
- On H=ℤ/2, the pinned theorem gives ℚ×ℚ with 1−g ↦ (0,2), as in §4.2's Check.
- On the §5.3 Klein-bottle Check, the pinned exponent −(ε₁σ) with σ=(−1)^(i₋) gives (1−t)⁻¹(1+t), which is the README's value.

## R02 (P3) — Scope plans comparisons with an external repository's carrier

**Location.** README lines 43–46: "For injective N, construct the coefficient-preserving comparison with the one-variable carrier on the image of N, including convolution and the period topology. For noninjective N, … compare through the supplied kernel splitting below."

**Claim.**
- These are construction targets placed in Scope, and no layer contains them.
- The external repository is not a Tau Ceti dependency.
- Read inside the library, both comparisons are pinned.
- Previous R06; not repaired.

**Witness.**
- `TauCeti.NovikovSeries.continuousDomCongr` (RingTheory/NovikovSeries/Equiv.lean:139), along H ≃+ N(H) with c=1, sends e^(1,1) to the monomial at 1+√2 for N(a,b)=a+√2b.
- The noninjective case is `hahnSeriesEquiv` (HahnSeries.lean:376).

**Repair.** Delete from "For injective N, construct" (line 43) through "independent of the descent theorem in that project." (line 47). Keep the citation of the existing work and the coordination sentence.

## R03 (P3) — Three locators are missing or imprecise

**Location.**
- (a) §6.5, lines 1303–1305, and `Suggested.lean` lines 97–99: "Dold, Lectures on Algebraic Topology, Chapter VII, §6".
- (b) §6.4, lines 1197–1198: "Hopf's barycentric modification", with no locator.
- (c) §6.1, lines 1023–1030, pins the Cerf normal form without a locator, and line 1039 gives "§2, pp. 218–222".

**Claim.**
- (a) cites a paywalled book, by section only, and the book is not in the manifest. The manifest's certified Gra72 states the index form exactly.
- (b) has no locator, although the manifest records Hop29.
- (c) The normal form is rt3 Lemma 2.11(a), equation (2.1), and its α-form is on p. 223. §2 runs to p. 223.

**Witness.**
- Gra72 lines 545–548 (Theorem 10.1, p. 224): the ANR index satisfies (I)–(VII). Lines 225–226 ((VII), p. 214): Ind f = Λ(f).
- rt3 lines 783–785 (p. 222) and 815–816 (p. 223).

**Repair.**
- (a) In both files, replace the Dold citation with "Granas, Bull. SMF 100 (1972), Theorem 10.1, p. 224, with properties (I), (II) and (VII) of §5, p. 214, and the Euclidean index of §6, p. 215". Keep Dold in References.
- (b) After "Hopf's barycentric modification", add "(Hopf, Math. Z. 29 (1929), 493–524)".
- (c) After the displayed `V_t`, add "(rt3 Lemma 2.11(a), equation (2.1), p. 222, and its proof, p. 223)". Change "§2, pp. 218–222" to "§2, pp. 218–223".

## R04 (P3) — A wording slip, and the closing sections are out of order

**Location.**
- (a) §6.4, line 1267: "The chain adapters and local-index proof below supply the comparisons."
- (b) `## Worked examples` (line 1500) precedes `## Downstream consumers` (line 1533), and its first paragraph (lines 1502–1508) restates the build order.

**Claim.**
- (a) The adapter is built above this sentence, and the local index belongs to §5.2. This is the previous R07(2), not repaired.
- (b) The house order is Downstream consumers, then Worked examples, then References. Build order belongs in "How to read the build".

**Witness.**
- Line 1212, "Build the finite-triangulation chain adapter here.", precedes line 1267.
- §5.2 (lines 892–952) constructs the local index.

**Repair.**
- (a) Write "The chain adapter of the mapping-torus item and §5.2's local index supply the comparisons."
- (b) Move `## Downstream consumers` (lines 1533–1542) before `## Worked examples`. Move lines 1502–1508 into "How to read the build" after line 217, or delete them.

## Previous findings

- **R01 (gate, outside folders): repaired.** The worker's gate reports `outside-folder=0`. `git diff --stat origin/main...HEAD`, with the three folders of this pull request excluded, is empty.
- **R02 (§4.2 field decomposition): not repaired.** Lines 721–722 still read "prove that the total quotient rings of ℤ[H] and Nov(ℤ,H,N) are finite products of characteristic-zero fields". It is now part of R01.
- **R03 (knot-surgery carriers): repaired.** `Suggested.lean` lines 40–49 name the missing based cellular torsion. They also name the missing Alexander polynomial of a knot, since `TauCeti.KnotTheory.alexander` is defined on a Seifert matrix.
- **R04 (CharacteristicClasses C2.3): settled on the supplier side.**
  - CharacteristicClasses at #1808, lines 51–54, gives "the vector-field Poincaré–Hopf theorem `Σ ind(V,p)=χ(M)` on every compact manifold to MorseNovikov §7.1".
  - #1808 precedes this pull request in its merge order.
  - Nothing changes here.
- **R05 (#1161): repaired.**
  - #1161 is merged (a98b09b1), and `overlaps.md` lists no other open pull request that changes this roadmap.
  - DGFloer appears only under Downstream consumers (line 1535).
- **R06 (existing-work comparisons): not repaired.** Now R02.
- **R07: partly repaired.**
  - (1) is repaired: "How to read the build" (lines 209–217) no longer says "already".
  - (2) is not repaired: now R04(a).

## Verified sound

| Statement | Instances | Values computed (left side; right side) | Result |
|---|---|---|---|
| `lefschetz_fixed_point_formula` | M=∅; three points, f=(1 2) | 0; 0. Fixed set {3}, det on 0-dim space = 1, so 1; trace of H₀ permutation matrix = 1 | holds |
| same | S¹ reflection; squaring z↦z² | +1+1=2; 1−(−1)=2. det(1−2)=−1; 1−2=−1 | holds |
| same | ℝP² rotation θ∉{0,π}; T², x↦−x | one fixed point, 2−2cosθ>0, so 1; ℚ in degree 0 only, so 1. Four half-periods, det(2I)=4; 1+2+1=4 | holds, nonorientable included |
| same, wrong models | sgn det(df−1); translation of ℝ | reflection gives −2≠2; 0≠1 | sign convention and `CompactSpace` needed |
| `poincare_hopf` | ∅; two points (E=0) | 0=0; 1+1=2=dim H₀ | holds |
| same | S¹, V=sinθ∂θ; S² height gradient; ℝP² Morse gradient | +1−1=0=1−1; +1+1=2=1+0+1; +1−1+1=1=1+0+0 | holds without orientation |
| same | ℝ, constant field | 0≠1 | compactness needed |
| `fixedPointDet`, `zeroDet` | f=−x; f=2x conjugated by 3x; V=(−x,y) conjugated by diag(−1,1) | 2, sign +1; −1 in both charts; −1 before and after | chart-independent |
| `rationalBetti` | S¹; ℝP² over ℚ versus 𝔽₂ | (1,1), sum 0; (1,0,0) versus (1,1,1) | holds; reduced homology would give sum −1 |
| §1.1 | N(k)=k, Σtᵏ; N=0 | 3 terms below C=3; the square has 3 at t² and 0 at t⁻¹; infinitely many terms below 1 | rt3 l.137–147 (p. 211) and rt2 l.100–102 (p. 371) agree; pinned (R01) |
| §1.2 | t² in U₂, U₃; t⁻³·t²; pullback along ℤ⊕ℤ/2→ℤ | ∈U₂, ∉U₃; t⁻¹∉U₂; 1↦1+g and (1+g)²=2+2g | rt3 l.604–614 (p. 220) and l.1063–1070 (p. 227) agree |
| §1.3 | (1−t)Σtᵏ; t⁴ coefficient of Π(1−tⁿ)⁻¹; N(t)=−1 | 1,0,0; p(4)=5; (1−t)⁻¹=−t⁻¹Σt^(−k) | rt3 l.163–212 (p. 212) agrees |
| §1.4 | H=ℤ/2; ℤ² with a+√2b | (1−g)(1+g)=0; unique least exponent, so a domain | rt3 l.148–153 (p. 211) and l.1925–1930 (p. 240) agree |
| §2.3 | A, B on ℝ×ℝ/2ℤ; [a,b] | AB=(s+1,−y−1)≡BA=(s+1,−y+1); B²=id; [a,b]=b⁻² and π₁/⟨b²⟩≅ℤ⊕ℤ/2 | Hatcher l.2338–2350 (pp. 51–52) gives ℤ⊕ℤ/2, which agrees |
| §2.4 | index pairs (1,0), (0,0) | dimensions 0 and −1 | rt3 l.114–117 (p. 211), l.179–180 (p. 212), l.243–246 (p. 213) and l.538–575 (pp. 218–219) agree |
| §3.1 | circle with one maximum and one minimum; t=1 | ∂p̃=(1−t)q̃; 0 | rt3 (1.3), l.225–230 (p. 213), agrees |
| §3.3 | −∇(cosθ+θ/C) with C=2; C=½ | zeros at θ=π/6 and 5π/6, no orbit; sinθ−2<0, so the circle is a closed orbit | rt3 Lemma 4.1 (l.1634, p. 235), its proof (p. 236) and Remark 4.3 (l.1712, p. 237) agree |
| §4.1 | ℚ—2→ℚ; A₀=3, A₁=5; A₀ a swap | rt3 gives ½, Milnor gives 2 (Mil66 l.270–273, p. 365); 3/10=½·3·5⁻¹; −1=1·(−1) | rt3 Proposition A.2 (l.1862–1875) and A.5 (l.1933–1944) agree |
| §4.4 | s=t²; Norm(1+ct) | t↦[[0,s],[1,0]], trace 0, det −s, Norm(1−t)=1−s; 1−c²s, whose log is twice the even part of log(1+ct) | rt3 l.1069–1097 (p. 227) and l.1146–1150 (p. 228) agree |
| §4.6 | d=2 in ranks (1,1); d=0 | b=(0,0): 0≤1 and 0=0; b=(1,1): 1≤1 and 0=0 | rt3 (1.4), l.254–257 (p. 213), and Appendix A agree; the inequalities are derived, not stated, there |
| §5.2 | x+x²−ε; x+x³∓εx | at ±√ε signs −1 and +1, total 0; +1−1−1=−1, and −1 | rt3 l.64–82 (p. 210), l.119–128 (p. 211) and l.855–858 (p. 223) agree |
| §5.3 (R01) | Klein-bottle mapping torus, f=−θ+ε sinθ | log ζ=Σtᵏ/k+Σ(−1)^(k+1)tᵏ/k, so ζ=(1+t)/(1−t); the pinned Euler product gives the same | agrees; rt2 (2) fails (Source issues) |
| §6.1 | Cerf form, c=t−t₀<0 | zeros x₁=±√−c, Hessian 2x₁, so indices i at −√−c and i−1 at +√−c | rt3 l.783–785 (p. 222) and l.815–816 (p. 223) agree; the locator is missing (R03) |
| §6.4 | unknot; trefoil | cells of S¹×S²: d₁=t−1, d₂=0, d₃=t−1, so (1−t)⁻²; (t⁻¹−1+t)/(1−t)² | rt2 Example 1.4, l.150–154 (p. 372), agrees |
| §6.5 route (R03) | Gra72 (VII), (II) and §6 | Ind f=Λ(f) on a compact ANR; the index is additive over isolated points; the local index is deg(x−f(x))=sgn det(1−df) | Gra72 l.225–226 (p. 214), l.234–245 (p. 215) and l.545–548 (p. 224) |
| §7.1 | S² gradient; T² gradient; maximum in dimension 3 | 2=χ; +1−1−1+1=0; ∇f gives −1=(−1)^ind, while −∇f gives +1 | rt3 Appendix B (l.1951–1964, B.1 l.1983, B.3 l.2009, p. 241; B.4 l.2050, p. 242) agrees |
| §7.3 | ℝP²; degrees i>n | (1,0,0); H_i(M)=H_i(M∣M)=0 | Hatcher Corollaries A.8–A.9 (l.22832–22845, p. 527) and Lemma 3.27(b) (l.10255–10260, p. 236) agree |
| §4.2 (R01) | H=ℤ/2 with N=0; ℤ⊕ℤ/2 | ℚ×ℚ with 1−g↦(0,2); F×F with exp(t)∉F and 1/(2−t)∈F | the ℤ[H] half is pinned |
| R02 comparison | N(a,b)=a+√2b on ℤ² | `continuousDomCongr` with c=1 sends e^(1,1) to the monomial at 1+√2 | pinned |

- **Gate.** The worker's gate is 0 on every check, including the build. My standalone `gate … --base origin/main` differs only by `outside-folder=4`, all in BanachSpaceTheory and SelfAdjointSpectralTheory, which are this pull request's own folders.
- **Dependency check.** `gate --depcheck … --movable --pr 1854` prints `depcheck: 206 roadmaps, 1903 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean TauCetiRoadmap/MorseNovikov/Suggested.lean` exits 0. Its only warnings are `declaration uses sorry` at 102:8 and 149:8. `#check @` on all 8 declarations matches `signatures.md`; every binder is explicit, so no section variable is lost. The one-tactic probe (`simp`, `rfl`, `infer_instance`, `decide`, `norm_num`, `aesop`) fails on both theorems, and neither pin states Lefschetz or Poincaré–Hopf, so there is no padding.
- **Form.** Both headlines are statable at the pins and stated. The docstring names every other headline and the carrier it lacks. The file has no `set_option` and no sorry'd data. Every Lean name appears in the README.
- **Locators checked against the text.** 60 in total: rt3 41, rt2 5, Mil66 3, Hat02 7, Gra72 4.
- **Library declarations opened at the pins.** 73: the 47 in R01's table and 26 cited by the README or the docstring, among them `IsNondegenerateFixedPt` (FixedPoint.lean:74), `TopPair.singularHomologyMap` (Singular/Relative.lean:300) and `hurewiczHomologyAddEquiv` (Hurewicz/One/Basic.lean:705).
- **Cross-roadmap citations resolved on main.**
  - MorseTheory M1–M4 and M6 (lines 515–1458).
  - HeegaardFloer Lane M (217), §1.5 (467), §1.9 (1162) and §2.8 (1913).
  - DifferentialGeometry Layers 0–3, 5, 6, 8, 10 and 12.
  - AlgebraicTopology's Stage-to-Layer map (851–884) and §§4.2–4.3 (1294, 1305).
  - UniversalCovers Stage 2 items 7–8 (107–125).
  - GeometricTopology Layers 1, 3, 4, 5 and 11, and §4.4 (2740).
  - The consumers DGFloer (169, 1157, 1375), TaubesGromov (15) and HamiltonianFloerOperations (16).
- **Overlap check.**
  - Read: DGFloer (#1798 and main), AlgebraicTopology (#1807, #1808), FourManifolds (#936), InstantonFloerTheory (#1083), HeegaardFloer and MorseTheory (main). The results-and-headings list is empty.
  - Novikov completions and torsion over total quotients: owner MorseNovikov N1/N4, on the pinned carriers (R01); DGFloer consumes them.
  - Ordinary Morse moduli and continuation: owner HeegaardFloer Lane M.
  - Compact-band Morse theory: owner MorseTheory.
  - H₁=π₁ᵃᵇ: owner Tau Ceti.
  - Vector-field Poincaré–Hopf: owner MorseNovikov §7.1; CharacteristicClasses at #1808 defers to it.
  - The knot's Seifert presentation: owner GeometricTopology §4.4. FourManifolds (#936, line 31) credits MorseNovikov N6 for it; that citation belongs to FourManifolds' own review.

## Not verifiable

- Milnor, *Topology from the Differentiable Viewpoint*, §6, p. 35 (§§7.1 and 7.3, and the `zeroSign` docstring). It is not in the manifest. The publisher copy is paywalled, and I found no author or open-archive copy.
- Dold, *Lectures on Algebraic Topology*, Chapter VII, §6 (§6.5). The Springer copy is paywalled, and it is not in the manifest; R03 replaces it with Gra72.
- Hopf 1929 (`Hop29`). Settled as uncertified, and cited by its locator only.
- Turaev (2001; 1990) and Pajitnov (2006). They are paywalled, and they carry no locator that a target relies on.

## Source issues

- **Error** in rt2 at equation (2), p. 371: the source gives each irreducible orbit the exponent −(−1)^(i₀); it should be −(−1)^(i₊+i₋)=(−1)^(n−i₀), which agrees only for odd n (a ½-multiplier orbit on T² gives (1−t)⁺¹, not (1−t)⁻¹); affects a stated result.
- **Gap** in rt3 at Lemma A.4, proof, p. 240: the source infers that L_j⊗Q(ℤF) and L_j⊗Q(Nov(F,N)) are fields only from ℤF and Nov(F,N) being domains; it should also use that ℚ is algebraically closed in those fraction fields; affects the proof.
