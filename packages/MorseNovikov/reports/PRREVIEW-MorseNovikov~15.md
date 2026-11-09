# Review of MorseNovikov (pull request #1854 at b66c1e8)

**Verdict:** needs changes

This is an incremental re-review. Between `56715a5` and `b66c1e8`, `TauCetiRoadmap/MorseNovikov/` changed by 0 lines. The eleven new commits touch only sibling folders: AlgebraicCurves, AlgebraicTopology, BanachSpaceTheory, BordismFormalGroups, CharacteristicClasses, ClassifyingSpaces, ComplexKahlerGeometry, GeneralizedCohomology, LocalPurity and ReductiveGroups. `lake-manifest.json` is unchanged.

None of the seven previous findings is repaired, so each is carried forward under its old number. All seven are P3, and the worker's gate still fails (R01). There is no new finding: no outside edit changes a passage this roadmap cites or makes its text wrong.

## R01 (P3) — The gate fails on two files edited outside the pull request's roadmap folders

**Location.** The worker's gate at `b66c1e8` reports `outside-folder=2`:
- `Completed/ArithmeticDirichletSeries/README.md`;
- `TauCetiRoadmap/SymplecticGeometry/README.md`.

Every other check is 0, including `build` and `depcheck`.

**Claim.** The pull request edits two folders that are not among its reviewed roadmap folders, and no review covers those edits.

**Witness.** `git diff --stat origin/main...HEAD`, with all seventeen reviewed folders excluded, leaves exactly `Completed/ArithmeticDirichletSeries/README.md | 2 +-` and `TauCetiRoadmap/SymplecticGeometry/README.md | 6 +++---`.

**Repair.** Choose one of:
- move the 3-4-1 remark and the CG6 paragraph into a pull request of their own; or
- register ArithmeticDirichletSeries and SymplecticGeometry as folders of this pull request, so that each gets its own review.

Either way, `outside-folder` drops to 0.

## R02 (P3) — `AbelianCoverHomology` in Suggested.lean is padding and contradicts the README

**Location.** `TauCetiRoadmap/MorseNovikov/Suggested.lean`:
- lines 102–133: `doubling : ℤ →+ ℤ`, `fiberMap : ℤ →+ ℤ × ZMod 2`, `doubling_injective`, `fiberMap_eq_zero` and `fiberMap_not_injective`;
- docstring lines 26–27: "The `AbelianCoverHomology` section records the integer coordinate calibration of the Klein-bottle abelian cover of §2.3."

**Claim.**
- The section computes small values of maps between ℤ and ℤ × ZMod 2 and mentions no carrier of the roadmap.
- Its three theorems have no docstrings.
- It sits after Layers 6–7, out of README order.
- README lines 1408–1410 name three supporting definitions in the file (`fixedPointDerivative`, `rationalHomologyMap` and `vectorFieldChartDerivative`). The file has five.

**Witness.** I ran the one-tactic probe again this round, on a scratch copy elaborated with `lake env lean`. Each theorem closes with no error:
- `doubling_injective` by `intro a b h; simpa [doubling] using h`;
- `fiberMap_eq_zero` by `ext <;> simp [fiberMap, doubling] <;> decide`;
- `fiberMap_not_injective` by `exact fun h => one_ne_zero (h (by simp [fiberMap_eq_zero]) : (1:ℤ) = 0)`.

**Repair.** Delete lines 102–133 and docstring lines 26–27. README §2.3 keeps the calibration "n ↦ 2n upstairs, ↦ (0,0) downstairs" as prose.

## R03 (P3) — The docstring says Layer 1, 4 and 5 carriers are missing, but the pinned Tau Ceti has them

**Location.** `TauCetiRoadmap/MorseNovikov/Suggested.lean`:
- lines 13–14: "Layer 1's completion and universal property lack the period-controlled completed group ring and topology";
- lines 17–20 make the same claim for "the based determinant-line torsion construction and the Novikov ring" and for "the periodic orbit counting series and its completion".

**Claim.** These claims about the pins are false. The acceptance test's account of what is not statable must match the pins.

**Witness.** Pinned Tau Ceti has each carrier:
- `TauCeti.NovikovSeries` (RingTheory/NovikovSeries/Basic.lean:92), with `finite_lt` below each cutoff, and `completionPkg` (Topology.lean:349);
- `HomologicalComplex.reidemeisterTorsion` (Algebra/Homology/ReidemeisterTorsion/Basic.lean:291);
- `TauCeti.NovikovSeries.orbitZeta` (OrbitZeta.lean:104) and `orbitZeta_eq_mapRingHom_eulerProduct` (:264).

**Repair.** Replace those sentences with two statements:
- Layer 1's completion, functoriality and domain theorem, Layer 4's based torsion (basis-change, homology-basis and componentwise forms) and Layer 5's integral algebraic product formula are proved at the pinned Tau Ceti. Name the declarations above.
- What remains not statable is the Novikov inequalities, which lack Novikov homology of a closed one-form, and the flow zeta function and cover norm, which lack periodic-orbit data.

Add no Lean statements for the pinned results: each would close by `exact`.

## R04 (P3) — §3.3 plans a construction that pinned Tau Ceti already has; native supplier items are cited only through AlgebraicTopology

**Location.** README §3.3, line 552: "Construct an equivariant finite cellular chain complex of X̃ over ℤ[H] from a finite CW model of X and actual lifted attaching maps." The "From Tau Ceti" contract (lines 111–129) and the §2.2 *Needs:* (line 406) cite neither this object nor the native H₁ Hurewicz isomorphism.

**Claim.** These objects exist at the pin, so they are cited, not planned. AlgebraicTopology Stage 8 item 3 at this head itself only consumes the native H₁ Hurewicz isomorphism (its README lines 2294–2298).

**Witness.** Pinned Tau Ceti has:
- `TauCeti.cellularChainComplexRep : ChainComplex (Rep R G) ℕ` (AlgebraicTopology/Cellular/Covering.lean:153);
- `TauCeti.cellularChainRepIsoFree` (:252);
- `TauCeti.cwComplexPreimage` (Topology/CWComplex/Classical/Covering.lean:398);
- `TauCeti.HurewiczOne.hurewiczHomologyAddEquiv` (Homotopy/Hurewicz/One/Basic.lean:705).

**Repair.**
1. In §3.3, write instead: consume `TauCeti.cellularChainComplexRep` on `TauCeti.cwComplexPreimage`, free over ℤ[H] on chosen lifts by `TauCeti.cellularChainRepIsoFree`. Keep the completion `Nov⊗_(ℤ[H])–` and the comparisons as targets.
2. List under "From Tau Ceti", with their files:
   - these four declarations;
   - `TauCeti.cellularDifferential` (Cellular/Chains.lean:333);
   - `TauCeti.cellularSingularHomologyIso` (Cellular/Comparison.lean:244);
   - `TauCeti.HurewiczOne.homologyMap_hurewiczHomologyAddEquiv` (Hurewicz/One/Naturality.lean:100).
3. In the §2.2 *Needs:*, cite the native Hurewicz isomorphism beside AT8.3.

## R05 (P3) — Another open pull request changes this roadmap, conflicts with this one, and no order is stated

**Location.** The description's merge-order paragraph names only "#1101 → #1807 → this pull request" and says that #1808 is independent.

**Claim.** Open pull request #1161 changes MorseNovikov's `README.md` and `Suggested.lean`, and conflicts with this head in both files. Its head still cites DGFloer Layer 1 item 1 as the supplier of H₁=π₁ᵃᵇ. Merging it unchanged would bring back the MorseNovikov → DGFloer edge that this pull request cuts.

**Witness.**
- The overlap report: "#1161 and #1854 conflict in README.md, Suggested.lean".
- #1161's head `e06d4d0`, README line 80: "The degree-one Hurewicz isomorphism `π₁(X)ᵃᵇ ≅ H₁(X;ℤ)`: DGFloer Layer 1 item 1".
- The same head, line 222: "### From TauCetiRoadmap.DGFloer".

**Repair.** State in the merge-order paragraph that #1161 is rebased onto this pull request before either merges. That rebase replaces its DGFloer Layer 1 item 1 citations (its lines 80, 222, 491, 550, 1377, 1436 and 1462) with AlgebraicTopology Stage 8 item 3, or with the native declaration of R04.

## R06 (P3) — No cited text states the Lefschetz headline's local-index formula

**Location.** README §6.5, lines 1223–1224: "Hatcher §2.C, proof of Theorem 2C.3, pp. 180–181 supplies the chain/homology trace argument; §§5.2 and 6.4 construct the stronger local-index equality." In §6.4 (line 1133), "Hopf's barycentric modification" has no locator.

**Claim.** `lefschetz_fixed_point_formula` states Σ sgn det(1−df_x) = Σ(−1)^i tr f_*, and no cited text states this equality.

**Witness.** Hatcher's Theorem 2C.3 (p. 179) concludes only that a map with τ(f) ≠ 0 of a retract of a finite simplicial complex has a fixed point. Its proof uses a fixed-point-free simplicial approximation, not local indices.

**Repair.** Add a locator to a text that states the Lefschetz–Hopf formula for a compact ENR: the sum of fixed-point indices equals τ(f), with index sgn det(1−df_x) at a nondegenerate fixed point. Dold, *Lectures on Algebraic Topology*, Chapter VII §6, is one candidate; record its proposition number, or mark it uncertified. Give Hopf's construction the same locator.

## R07 (P3) — Notation and layout slips in §4.1, §6.5 and the closing sections

**Location.**
- §4.1, line 646: `τ=±Π_i det(d_s:C_i→C_(i−1))^((-1)^i)`.
- §6.5, lines 1253–1257: a second `**Checks.**` list, which tests the theorem, directly follows the Checks of `rationalHomologyMap`.
- Line 1381: `## Worked examples` precedes `## Downstream consumers` (line 1413) and opens with build-order prose.

**Claim.** The determinant is of the square minor D_i→E_(i−1) defined two lines earlier. C_i→C_(i−1) need not be square.

**Witness.** Take the acyclic complex ℚ →(1,−1)ᵀ→ ℚ² →(1,1)→ ℚ:
- d₁: ℚ²→ℚ is 2→1, so det(d₁: C₁→C₀) is undefined;
- the minors on D₁=⟨e₁⟩→E₀=C₀ and D₂=C₂→E₁=⟨e₂⟩ are 1 and −1 (rt3 Prop. A.2, p. 239).

**Repair.**
1. Write `det(d_s:D_i→E_(i−1))` in §4.1.
2. Move the list at lines 1253–1257 to directly after the theorem paragraph ending at line 1224.
3. Put `## Downstream consumers` before `## Worked examples`, and move lines 1383–1389 into "How to read the build".

## Previous findings

- R01 — not repaired: the worker's gate at b66c1e8 still reports `outside-folder=2`, for `Completed/ArithmeticDirichletSeries/README.md` and `TauCetiRoadmap/SymplecticGeometry/README.md`; every other check is 0.
- R02 — not repaired: Suggested.lean lines 102–133 still declare `doubling`, `fiberMap`, `doubling_injective`, `fiberMap_eq_zero` and `fiberMap_not_injective`; docstring lines 26–27 are unchanged.
- R03 — not repaired: Suggested.lean lines 13–14 still read "Layer 1's completion and universal property lack the period-controlled completed group ring and topology."
- R04 — not repaired: README line 552 still reads "Construct an equivariant finite cellular chain complex of X̃ over ℤ[H] from a finite CW model of X and actual lifted attaching maps."
- R05 — not repaired: the merge-order paragraph still reads "#1101 → #1807 → this pull request … #1808 is independent"; #1161's head `e06d4d0`, line 80, still cites "DGFloer Layer 1 item 1".
- R06 — not repaired: README lines 1223–1224 still read "Hatcher §2.C, proof of Theorem 2C.3, pp. 180–181 supplies the chain/homology trace argument; §§5.2 and 6.4 construct the stronger local-index equality."
- R07 — not repaired: README line 646 is unchanged; the second Checks list is still at lines 1253–1257; `## Worked examples` (line 1381) still precedes `## Downstream consumers` (line 1413).

## Verified sound

**Change set.**
- `git diff --stat 56715a57 HEAD -- TauCetiRoadmap/MorseNovikov` is empty.
- `git log 56715a57..HEAD` has eleven commits, all in sibling folders of this pull request. `lake-manifest.json` and `lean-toolchain` are unchanged, so the pins are those of the previous review.
- Against main, the folder's only change is still the supplier heading (README line 155), the AT8.3 sentence (lines 161–163) and the §2.2 *Needs:* (line 406).

**Outside edits against this roadmap's citations (8 checked).**
- The AlgebraicTopology diff since `56715a5` changes the native-API inventory (lines 396–399 and 455–464), Stage 8 item 8.8b and one acceptance check (lines 3020–3028). It adds or renumbers no heading or item.
- MorseNovikov's AlgebraicTopology citations resolve unchanged at this head:
  - Stages 1–3 (lines 519, 561, 687);
  - Stage 4 items 2–3, `cellularDifferential` and `cellularSingularHomologyIso` (lines 728 and 731);
  - Stages 5–7 (lines 1165, 1449, 2177);
  - Stage 8 item 3 (line 2289), which still consumes `TauCeti.HurewiczOne.hurewiczHomologyAddEquiv` and its naturality.
- CharacteristicClasses moves, word for word, its paragraph deferring the Lefschetz formula and the fixed-point index sum to "MorseNovikov N6" (now its line 49). N6 is this roadmap's Layer 6, and §6.5 owns the formula. No sibling `Suggested.lean` states a Lefschetz or Poincaré–Hopf theorem.
- No other folder changed in this pull request mentions MorseNovikov or is cited by it. MorseTheory, HeegaardFloer, DifferentialGeometry, UniversalCovers and GeometricTopology are unchanged.

**Gate, build and dependency check.**
- The worker's gate: every check is 0 except outside-folder (R01).
- My rerun of the gate without the folder list reports 38 outside-folder hits, because it also counts the sibling folders. `git diff --stat` with those folders excluded leaves exactly the two files of R01.
- `lake env lean TauCetiRoadmap/MorseNovikov/Suggested.lean`: exit 0, with five `sorry` warnings (lines 57, 86, 122, 125, 128) and nothing else.
- The requested dependency check outputs exactly `depcheck: 237 roadmaps, 2308 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved: line.

**Elaborated signatures.** I ran `#check @` on the five non-padding declarations in one scratch copy. Each type matches `signatures.md`. Both headlines keep `FiniteDimensional ℝ E`, `I.Boundaryless`, `IsManifold I ∞ M`, `T2Space`, `SecondCountableTopology` and `CompactSpace`, as README §6.5 and §7.3 state. No binder is lost, and nothing changed.

**One-tactic probe.**
- `first | simp | rfl | infer_instance` fails on `lefschetz_fixed_point_formula` (line 69) and `poincare_hopf` (line 100). Neither headline is padding.
- The three `AbelianCoverHomology` theorems close in one line each (R02).

**Pinned declarations opened this round (16).**
- `TauCeti.NovikovSeries` (Basic.lean:92), `completionPkg` (Topology.lean:349), `HomologicalComplex.reidemeisterTorsion` (Basic.lean:291, namespace opened at :139), `reidemeisterTorsionWithHomology` (Homology.lean:226), `orbitZeta` (OrbitZeta.lean:104) and `orbitZeta_eq_mapRingHom_eulerProduct` (:264);
- `cellularChainComplexRep` (Covering.lean:153), `cellularChainRepIsoFree` (:252), `cwComplexPreimage` (Classical/Covering.lean:398);
- `hurewiczHomologyAddEquiv` (Hurewicz/One/Basic.lean:705) and `homologyMap_hurewiczHomologyAddEquiv` (Naturality.lean:100);
- `TauCeti.IsNondegenerateFixedPt` (Geometry/Manifold/MFDeriv/FixedPoint.lean:74) and `TauCeti.finite_fixedPoints_of_isNondegenerateFixedPt` (:146);
- `AlgebraicTopology.singularHomologyFunctor`, `LinearMap.trace` and `LinearMap.det`, through the elaborated headline types.

**Ownership and overlaps.**
- `overlaps.md` lists #1161 as the only other open pull request that changes this roadmap (R05). Its head is still `e06d4d0`.
- There is no dropped or revision-only id, and the pull request drops no id that another roadmap cites.
- `roadmaps grep` for `lefschetz_fixed_point`, `poincare_hopf` and `poincareHopf` over main and the 460 open heads finds only MorseNovikov (main, #1161 and this head). The pinned Mathlib and Tau Ceti have no Lefschetz or Poincaré–Hopf theorem.

**Seeded sample.** The folder has no changed passage, so no sample target falls in one. The earlier rounds checked 1.1, 1.4, 1.5, 2.2, 2.4, 3.2, 3.4, 4.1, 4.5, 5.1, 5.3, 6.1, 6.4, 6.5 and 7.3. I checked the remaining sample locators against the cached texts, as remarks:

| Target | Locator | Text at the locator | Result |
|---|---|---|---|
| 1.2 | rt3 §1.2, p. 211; §3.4, pp. 226–227 | rt3 lines 129–147 (support condition); line 1043, §3.4 "finite cyclic cover", starting on PDF p. 18 = p. 226 | agrees |
| 2.3 | Hatcher §1.2, pp. 51–52 | Hat02 lines 2338–2346: the Klein bottle as N₂ and as the square with word aba⁻¹b, printed pp. 51–52 | agrees |
| 3.1 | rt3 §1.4, (1.3), pp. 212–213 | rt3 lines 213–230: Novikov chains finite above every bound, free on chosen lifts; (1.3) sums over all target lifts | agrees |
| 4.2 | rt3 Lemma A.4 and proof, p. 240 | rt3 line 1900 (PDF p. 32): total quotients of ℤG and the Novikov ring are finite sums of fields, compatible with inclusion | agrees |
| 6.2 | rt3 §§3.4–3.5, Lemmas 3.5, 3.7–3.10, pp. 227–231 | Lemma 3.5 at line 1090 (p. 227), §3.5 at 1232 (p. 229), Lemma 3.10 at 1328 (p. 230), §3.6 at 1384 (p. 231) | agrees |
| 6.3 | rt3 Lemmas 2.7–2.9, pp. 220–221; §4, pp. 237–238 | Lemmas 2.7–2.9 at lines 638, 681, 727 (pp. 220–221) agree; for §4 see the remark below | partly |
| 6.4 | rt3 Examples 1.7–1.9, pp. 215–216 | lines 354, 364, 377 (p. 215, continuing to p. 216) | agrees |
| 7.1 | rt3 Def. B.1, p. 241 | line 1983 (PDF p. 33 = p. 241) | agrees |
| 7.2 | rt3 Defs. B.3–B.4, pp. 241–242; Theorem B, p. 215 | lines 2009 (p. 241) and 2050 (p. 242); Theorem B at line 338 (p. 215) | agrees |

**Adversarial table.** No statement changed. The rows marked r10 and r11 are carried from the previous reports, `PRREVIEW-MorseNovikov~10` and `~11`. The rows marked r15 are new values for sample targets not tabulated before.

| Statement | Instances | Values computed | Result | Round |
|---|---|---|---|---|
| `lefschetz_fixed_point_formula` | M=∅; point with f=id | 0 = 0; det on the 0-dim space is 1 ⇒ +1, tr on H₀=ℚ is 1 | holds | r10 |
| same | two points: swap; constant | 0 = tr[[0,1],[1,0]] = 0; 1 = tr[[1,1],[0,0]] = 1 | holds | r10 |
| same | S¹ reflection; rotation | det(1−(−1)) = 2 ⇒ +1,+1 and 2 = 1−(−1); 0 = 1−1 | holds | r10 |
| same | S² antipodal; rotation by θ | 0 = 1+(−1); det(I−R_θ) = 2−2cos θ > 0 at both poles ⇒ 2 = 1+1 | holds | r10 |
| same | RP², [x:y:z]↦[x:2y:3z] | local signs +1, −1, +1 ⇒ 1; H_*(RP²;ℚ) = ℚ in degree 0 ⇒ 1 | holds, nonorientable | r10 |
| same, wrong models | sign det(df−1); translation of ℝ | reflection gives −2 ≠ 2; 0 ≠ 1 shows `CompactSpace` is needed | conventions pinned | r10 |
| `poincare_hopf` | ∅; two points | 0 = 0; 1+1 = 2 | holds | r10 |
| same | S¹ with sin θ ∂θ; T² constant field | +1−1 = 0; 0 = 1−2+1 | holds | r10 |
| same | S² height gradient; RP² Morse gradient | 1+1 = 2; 1−1+1 = 1 | holds | r10 |
| `vectorFieldChartDerivative` | V=±x; V=x²; conjugation by diag(−1,1) | ±1; 0, so not nondegenerate; det −1 before and after | determines the sign | r10 |
| `fixedPointDerivative` | f=−x; f=2x conjugated by 3x | det(1−(−1)) = 2; det(1−2) = −1 | holds | r10 |
| §1.1 support | Σt^k with N(k)=k; N=0; R=0 | 3 terms below 3; square has 3 at t², 0 at t⁻¹; infinitely many terms below C=1 when N=0; R=0 onto for every N | holds | r10 |
| §1.2 maps | projection ℤ²→ℤ; precomposition along ℤ⊕ℤ/2→ℤ | 1+e^(0,1) ↦ 2; (1+g)² = 2+2g ≠ 1+g | not a ring map, as stated | r10 |
| §1.2 filtration | Σ_(k>m)t^k, C=5; t² in U₂, U₃; N, 2N, −N on Σ_(k≥0)t^k | m=5: support from 6, in U₅; t²: N=2 is not <2, so in U₂; 2<3, so not in U₃; under −N, {k ≥ 0 : −k < 1} is infinite, but Σt^(−k) is finite below | holds; reversal is h↦−h | r15 |
| §1.3 | (1−t)Σt^k; exp, log | 1,0,0; 1+t+t²/2; t−t²/2 | holds | r10 |
| §1.4 domain | H=ℤ/2 | (1−g)(1+g) = 0 | torsion-free hypothesis needed | r10 |
| §1.5 orbit module | one orbit, F(s)=0; t²·U₃; reversed potential | F(e^h s) = −N(h); t² shifts N≥3 supports to N≥5; the opposite sign gives the wrong ring | holds | r11 |
| §2.2 H₁ sequence | ℝ→S¹; ℤ²-grid cover of S¹∨S¹; dθ on ℝ/ℤ | 0 → ℤ, identity onto H; commutator loops lift, so H₁(cover) ↦ 0; P(1)=1, N(1)=−1 | exact at H₁(X) | r11 |
| §2.3 cover | A, B on ℝ×ℝ/2ℤ | AB = BA mod 2; B² = id; 2[b] = 0 in H₁ | universal abelian cover | r10 |
| §2.4 dimension | index pairs (1,0), (0,0) | 0; −1, absent | holds | r10 |
| §3.1 differential | circle, critical pair, nonzero period; t=1; empty critical set | ∂p̃ = q̃ − t·q̃ = (1−t)q̃ ≠ 0; t=1 gives 0, so H₀ = H₁ = ℤ for S¹; all groups 0, empty torsion 1; one-lift model ∂ = ±1 is acyclic at t=1, contradicting H(S¹) ≠ 0 | holds; the all-lifts sum is needed | r15 |
| §3.2 continuation | constant family; lift change t² | [1], not [0]; [t²]·[t⁻²] = [1] | holds | r11 |
| §3.3 | exact circle; nonzero period | ℤ[t^±]/(1−t) = ℤ, H₁ = 0; (1−t)⁻¹ = Σt^k | holds | r10 |
| §3.4 top degree | α=0 on S¹; nonzero period | H₁ = ℤ ≠ 0; ker(1∓e^h) = 0 when N(h)≠0 | holds | r10 |
| §4.1 convention | ℚ →2→ ℚ; basis change A₀=3, A₁=5 | rt3 2⁻¹, Milnor 2; τ = 3/10 = ½·3·5⁻¹ | holds; R07 notation | r10 |
| §4.2 components | H=0; H=ℤ/2; H=ℤ/3; 𝔽₂ | Q(ℤ)=ℚ; ℚ[ℤ/2] ≅ ℚ×ℚ, 1−g ↦ (0,2), 1+g ↦ (2,0); ℚ[ℤ/3] ≅ ℚ×ℚ(ζ₃), dimension 1+2 = 3; (1+g)² = 2+2g = 0 in 𝔽₂[ℤ/2] with 1+g ≠ 0 | holds; char 0 needed | r15 |
| §4.4 norm, trace | s=t²; 1+t²; idempotent of ℤ[ℤ/2] | det(M_t) = −s, Norm(1−t) = 1−s; Tr = 2+2s; norm of (1+g)/2 is 0 | holds | r10 |
| §4.5 componentwise torsion | H=ℤ/2, d=1−g; lift changes | components (0, ½); c₀↦tc₀ gives τ·t; c₁↦tc₁ gives τ·t⁻¹ | holds | r11 |
| §5.1 return germ | P=2x, h=3x; critical-free circle orbit | hPh⁻¹ = 2x, det(1−2) = −1 in both sections; 0-dim transverse space, det 1 | section-independent | r11 |
| §5.2 local index | x/2; 2x; x+x²−ε | +1; −1; −1 at √ε, +1 at −√ε, total 0 | conserved | r10 |
| §5.3 iterate signs | multipliers ½, 2, −2; circle | (1−t)⁻¹; (1−t); (1+t)/(1−t²) = (1−t)⁻¹; log ζ = Σt^k/k | exponent (−1)^(n−i₀) holds | r10 |
| §5.3 cover norm | double circle cover | Norm((1−t)⁻¹) = (1−s)⁻¹ | holds | r10 |
| §6.1 Cerf fold | x³/3−εx | zeros ±√ε, indices 0 and 1 | matches rt3 (2.1) | r10 |
| §6.1 / §6.4 circle | no critical points; one pair | τ = 1, ζ = (1−t)⁻¹; τ = (1−t)⁻¹, ζ = 1 | same I | r10 |
| §6.2 covers | H=ℤ⊕ℤ/2, h=(2,1) | divisibility 2 in H/T, 1 in H; no map H→ℤ/4 with h↦1 | README fixes rt3 gap | r10 |
| §6.3 cutoff limits | events with drops k; d=2+t^m; d=t^m | {k < C} finite for each C; τ = (2+t^m)⁻¹ = ½ − t^m/4 + …, so it differs from ½ first in degree m and tends to τ(d=2) = ½; τ = t^(−m), support −m → −∞, no limit, and the limit d=0 is not acyclic (pinned torsion 0) | holds; acyclicity comparison needed | r15 |
| §6.4 mapping torus | reflection, identity; unknot; trefoil | (1−t)⁻¹(1+t); 1; (1−t)⁻²; Δ = t⁻¹−1+t | holds | r10 |
| §7.1 / §7.2 Euler | S² gradient; S¹ nonsingular field | 2; H₁=ℤ torsor, (1−t)⁻¹ ↦ t(1−t)⁻¹ | holds | r10 |
| R02 padding | three theorems | each closes in one line, re-run this round | padding | r10, r11, r15 |

**Remarks on untouched text (no change requested).**
- The §6.3 locator "§4, pp. 237–238" (README line 1095) covers rt3 Remarks 4.2–4.3. Lemma 4.1, which is the large-gradient α+C·df comparison, and the proof of Theorem B, equations (4.1)–(4.4), are on pp. 235–236 (rt3 lines 1624–1702).
- The "From Tau Ceti" contract does not cite the pinned `TauCeti.IsNondegenerateFixedPt` (FixedPoint.lean:74) or `TauCeti.finite_fixedPoints_of_isNondegenerateFixedPt` (:146). The latter gives §6.5's finiteness of the fixed-point sum.

## Not verifiable

- V. Turaev, *Introduction to Combinatorial Torsions* (2001) and *Euler structures, nonsingular vector fields…* (1990): paywalled, and no legal copy was found. They appear only in References, with no locator that a target relies on.
- A. Pajitnov, *Circle-valued Morse Theory* (2006): paywalled. It appears only in References.
- Milnor, *Topology from the Differentiable Viewpoint*, §6, p. 35 (§7.1, §7.3): not in the roadmap's source manifest, and not re-read this round. The previous full review checked this locator.
- Hopf 1929 (`Hop29`) is settled as uncertified and is cited by locator only.

## Source issues

- none
