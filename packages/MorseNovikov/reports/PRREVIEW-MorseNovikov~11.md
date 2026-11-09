# Review of MorseNovikov (pull request #1854 at 56715a5)

**Verdict:** needs changes

This is an incremental re-review. Between `c07dda7` and `56715a5`, `TauCetiRoadmap/MorseNovikov/` changed by 0 lines: the two new commits touch only AlgebraicTopology and BordismFormalGroups. None of the seven previous findings is repaired, so each is carried forward under its old number. All seven are P3, and none blocks on its own, but the worker's gate still fails (R01). No new finding: the outside edits change no passage this roadmap cites.

## R01 (P3) — The gate fails on two files edited outside the pull request's roadmap folders

**Location.** The worker's gate at this head reports `outside-folder=2`: `Completed/ArithmeticDirichletSeries/README.md` and `TauCetiRoadmap/SymplecticGeometry/README.md`. Every other check is 0, including `build` and `depcheck`.

**Claim.** The pull request edits two folders that are not among its reviewed roadmap folders, and no review covers those edits.

**Witness.** `git diff --stat origin/main...HEAD`, with all seventeen reviewed folders excluded, leaves exactly `Completed/ArithmeticDirichletSeries/README.md | 2 +-` and `TauCetiRoadmap/SymplecticGeometry/README.md | 6 +++---`.

**Repair.** Choose one of:
- move the 3-4-1 remark and the CG6 paragraph into a pull request of their own; or
- register ArithmeticDirichletSeries and SymplecticGeometry as folders of this pull request, so that each gets its own review.

Either way, the outside-folder count drops to 0.

## R02 (P3) — `AbelianCoverHomology` in Suggested.lean is padding and contradicts the README

**Location.** `TauCetiRoadmap/MorseNovikov/Suggested.lean` has two pieces:
- lines 102–133: `doubling : ℤ →+ ℤ`, `fiberMap : ℤ →+ ℤ × ZMod 2`, `doubling_injective`, `fiberMap_eq_zero` and `fiberMap_not_injective`;
- docstring lines 26–27, which point at this section.

**Claim.**
- The section computes small values of maps between ℤ and ℤ × ZMod 2 and mentions no carrier of the roadmap.
- Its three theorems have no docstrings.
- It sits after Layers 6–7, out of README order.
- README lines 1408–1411 say the file's three supporting definitions are `fixedPointDerivative`, `rationalHomologyMap` and `vectorFieldChartDerivative`. The file has five.

**Witness.** The one-tactic probe on a scratch copy, elaborated with `lake env lean`, closes all three theorems with no error:
- `doubling_injective` by `intro a b h; simpa [doubling] using h`;
- `fiberMap_eq_zero` by `ext <;> simp [fiberMap, doubling] <;> decide`;
- `fiberMap_not_injective` by `exact fun h => one_ne_zero (h (by simp [fiberMap_eq_zero]) : (1:ℤ) = 0)`.

**Repair.** Delete lines 102–133 and docstring lines 26–27. README §2.3 keeps the calibration "n ↦ 2n upstairs, ↦ (0,0) downstairs" as prose.

## R03 (P3) — The docstring says Layer 1, 4 and 5 carriers are missing, but the pinned Tau Ceti has them

**Location.** Suggested.lean, lines 13–14: "Layer 1's completion and universal property lack the period-controlled completed group ring and topology". Lines 17–20 make the same claim for "the based determinant-line torsion construction and the Novikov ring" and "the periodic orbit counting series and its completion".

**Claim.** These claims about the pins are false. The acceptance test's account of what is not statable must match the pins.

**Witness.** Pinned Tau Ceti has each carrier:
- `structure NovikovSeries` (RingTheory/NovikovSeries/Basic.lean:92) and `completionPkg` (Topology.lean:349);
- `HomologicalComplex.reidemeisterTorsion` (Algebra/Homology/ReidemeisterTorsion/Basic.lean:291) and `reidemeisterTorsionWithHomology` (Homology.lean:226);
- `orbitZeta` (OrbitZeta.lean:104) and `orbitZeta_eq_mapRingHom_eulerProduct` (:264).

**Repair.** Replace those sentences with two statements:
- Layer 1's completion, functoriality and domain theorem, Layer 4's based torsion (basis-change, homology-basis and componentwise forms) and Layer 5's integral algebraic product formula are proved at the pinned Tau Ceti. Name the declarations above.
- What remains not statable is the Novikov inequalities, which lack Novikov homology of a closed one-form, and the flow zeta function and cover norm, which lack periodic-orbit data.

Add no Lean statements for the pinned results: each would close by `exact`.

## R04 (P3) — §3.3 plans a construction that pinned Tau Ceti already has; native supplier items are cited only through AlgebraicTopology

**Location.** README §3.3, line 552: "Construct an equivariant finite cellular chain complex of X̃ over ℤ[H] from a finite CW model of X and actual lifted attaching maps." The "From Tau Ceti" contract (lines 111–129) and the §2.2 *Needs:* (line 406) cite neither this object nor the native H₁ Hurewicz isomorphism.

**Claim.** These objects exist at the pin, so they are cited, not planned. AlgebraicTopology Stage 8 item 3 at this head itself only consumes the native H₁ Hurewicz isomorphism (its README lines 2282–2286).

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

**Location.** The description's merge-order paragraph names only "#1101 → #1807 → this pull request" and #1808.

**Claim.** Open pull request #1161 changes MorseNovikov's `README.md` and `Suggested.lean` and conflicts with this head in both files. Its head still cites DGFloer Layer 1 item 1 as the supplier of H₁=π₁ᵃᵇ, so merging it unchanged would bring back the MorseNovikov → DGFloer edge that this pull request cuts.

**Witness.**
- The overlap report: "#1161 and #1854 conflict in README.md, Suggested.lean".
- #1161's README line 80: "The degree-one Hurewicz isomorphism `π₁(X)ᵃᵇ ≅ H₁(X;ℤ)`: DGFloer Layer 1 item 1".
- #1161's README line 222: "### From TauCetiRoadmap.DGFloer".

**Repair.** State in the merge-order paragraph that #1161 is rebased onto this pull request before either merges. That rebase replaces its DGFloer Layer 1 item 1 citations (its lines 80, 222, 491, 550, 1377, 1436 and 1462) with AlgebraicTopology Stage 8 item 3, or with the native declaration of R04.

## R06 (P3) — No cited text states the Lefschetz headline's local-index formula

**Location.** README §6.5, lines 1223–1224: "Hatcher §2.C, proof of Theorem 2C.3, pp. 180–181 supplies the chain/homology trace argument; §§5.2 and 6.4 construct the stronger local-index equality." In §6.4, "Hopf's barycentric modification" has no locator.

**Claim.** `lefschetz_fixed_point_formula` states Σ sgn det(1−df_x) = Σ(−1)^i tr f_*, and no cited text states this equality.

**Witness.** Hatcher's Theorem 2C.3 (p. 179) concludes only that a map with τ(f) ≠ 0 of a retract of a finite simplicial complex has a fixed point. Its proof uses a fixed-point-free simplicial approximation, not local indices.

**Repair.** Add a locator to a text that states the Lefschetz–Hopf formula for a compact ENR: the sum of fixed-point indices equals τ(f), with index sgn det(1−df_x) at a nondegenerate fixed point. Dold, *Lectures on Algebraic Topology*, Chapter VII §6, is one candidate; record its proposition number, or mark it uncertified. Give Hopf's construction the same locator.

## R07 (P3) — Notation and layout slips in §4.1, §6.5 and the closing sections

**Location.**
- §4.1, line 646: `τ=±Π_i det(d_s:C_i→C_(i−1))^((-1)^i)`.
- §6.5, lines 1253–1257: a second `**Checks.**` list testing the theorem directly follows the Checks of `rationalHomologyMap`.
- Line 1381: `## Worked examples` precedes `## Downstream consumers` and opens with build-order prose.

**Claim.** The determinant is of the square minor D_i→E_(i−1) defined two lines earlier. C_i→C_(i−1) need not be square.

**Witness.** Take the acyclic complex ℚ →(1,−1)ᵀ→ ℚ² →(1,1)→ ℚ:
- d₁: ℚ²→ℚ is 2→1, so det(d₁: C₁→C₀) is undefined;
- the minors on D₁=⟨e₁⟩→E₀=C₀ and D₂=C₂→E₁=⟨e₂⟩ are 1 and −1 (rt3 Prop. A.2, p. 239).

**Repair.**
1. Write `det(d_s:D_i→E_(i−1))` in §4.1.
2. Move the list at lines 1253–1257 to directly after the theorem paragraph ending at line 1224.
3. Put `## Downstream consumers` before `## Worked examples`, and move lines 1383–1389 into "How to read the build".

## Previous findings

- R01 — not repaired: the worker's gate at 56715a5 still reports `outside-folder=2`, for `Completed/ArithmeticDirichletSeries/README.md` and `TauCetiRoadmap/SymplecticGeometry/README.md`; every other check is 0.
- R02 — not repaired: Suggested.lean lines 102–133 still declare `doubling`, `fiberMap`, `doubling_injective`, `fiberMap_eq_zero` and `fiberMap_not_injective`; docstring lines 26–27 still describe "the integer coordinate calibration of the Klein-bottle abelian cover".
- R03 — not repaired: Suggested.lean lines 13–14: "Layer 1's completion and universal property lack the period-controlled completed group ring and topology."
- R04 — not repaired: README line 552: "Construct an equivariant finite cellular chain complex of X̃ over ℤ[H] from a finite CW model of X and actual lifted attaching maps."
- R05 — not repaired: the merge-order paragraph still reads "#1101 → #1807 → this pull request … #1808 is independent"; #1161's head line 80 still cites "DGFloer Layer 1 item 1".
- R06 — not repaired: README lines 1223–1224: "Hatcher §2.C, proof of Theorem 2C.3, pp. 180–181 supplies the chain/homology trace argument; §§5.2 and 6.4 construct the stronger local-index equality."
- R07 — not repaired: README line 646 `τ=±Π_i det(d_s:C_i→C_(i−1))^((-1)^i)`; second Checks list at lines 1253–1257; `## Worked examples` at line 1381 still precedes `## Downstream consumers` at line 1413.

## Verified sound

**Change set.**
- `git diff --stat c07dda78 HEAD -- TauCetiRoadmap/MorseNovikov` is empty.
- `git log c07dda78..HEAD` has two commits, touching only AlgebraicTopology (README and Suggested.lean) and BordismFormalGroups (README and Suggested.lean).
- `lake-manifest.json` is unchanged, so the pins are those of the previous review.

**Citations that depend on the outside changes (5 resolved at this head).** The AlgebraicTopology diff changes:
- the 8.8b ownership paragraph (lines 97–107);
- the native-API inventory (lines 449–466);
- Stage 8 item 4 (relative Hurewicz);
- items 8.8b and 8.8c;
- one dependency-table row.

MorseNovikov cites none of these. Its citations still resolve, unchanged, at this head:
- Stages 1–3 (lines 507, 549, 675);
- Stage 4 items 2–3, `cellularDifferential` and `cellularSingularHomologyIso` (lines 716 and 719);
- Stages 5–7 (lines 1153, 1437, 2165);
- Stage 8 item 3 (line 2277), which still consumes `TauCeti.HurewiczOne.hurewiczHomologyAddEquiv` and its naturality.

The BordismFormalGroups diff mentions MorseNovikov nowhere, and MorseNovikov does not cite BordismFormalGroups. `grep MorseNovikov` over both changed folders returns nothing. No outside change makes MorseNovikov text wrong.

**Gate and build.**
- The worker's gate: every check is 0 except outside-folder (R01).
- My rerun of the gate without the folder list reports 34 outside-folder hits, because it also counts the pull request's own sixteen sibling folders. `git diff --stat` with those folders excluded leaves exactly the two files of R01.
- `lake env lean` on Suggested.lean: exit 0, with five `sorry` warnings (lines 57, 86, 122, 125, 128) and nothing else.

**Elaborated signatures.** I ran `#check @` on the five non-padding declarations in a scratch copy. Each type matches `signatures.md` and the previous review. Both headlines keep `FiniteDimensional ℝ E`, `I.Boundaryless`, `IsManifold I ∞ M`, `T2Space`, `SecondCountableTopology` and `CompactSpace`, as README §6.5 and §7.3 state. No binder is lost, and nothing changed.

**One-tactic probe.**
- `first | simp | rfl | infer_instance` fails on `lefschetz_fixed_point_formula` (line 69) and `poincare_hopf` (line 100), so neither headline is padding.
- The three `AbelianCoverHomology` theorems close in one line each (R02).

**Dependency check.** Output: `depcheck: 238 roadmaps, 2351 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved: line, and DGFloer appears only under Downstream consumers.

**Pinned declarations reopened (16).** Each is at the file and line its finding gives:
- `NovikovSeries` (Basic.lean:92), `completionPkg` (Topology.lean:349), `reidemeisterTorsion` (:291), `reidemeisterTorsionWithHomology` (:226), `orbitZeta` (:104) and `orbitZeta_eq_mapRingHom_eulerProduct` (:264);
- `cellularChainComplexRep` (:153), `cellularChainRepIsoFree` (:252), `cwComplexPreimage` (:398), `cellularDifferential` (:333) and `cellularSingularHomologyIso` (:244);
- `hurewiczHomologyAddEquiv` (:705) and `homologyMap_hurewiczHomologyAddEquiv` (:100);
- `AlgebraicTopology.singularHomologyFunctor`, `LinearMap.trace` and `LinearMap.det`, through the elaborated headline types.

**Overlaps.**
- `overlaps.md` lists #1161 as the only other open pull request that changes this roadmap (R05).
- It finds no dropped or revision-only id and no id of this roadmap that the pull request drops.
- The vocabulary neighbours (DGFloer, MorseTheory, FourManifolds, FukayaTheory) are unchanged since the previous review's ownership audit.

**Seeded sample.** The folder has no changed passage, so no sample target falls in one. The previous review checked nine of the fifteen targets (1.4, 2.4, 3.4, 4.1, 5.3, 6.1, 6.4, 6.5, 7.3). I checked the other six against `rt3` as remarks; each agrees:

| Target | Locator | rt3 lines | Result |
|---|---|---|---|
| 1.1 | §1.2, p. 211 | 129–147: integer Novikov sums finite below every bound; ℤG inclusion is the identity iff N=0 | agrees |
| 1.5 | §1.4, pp. 212–213 | 213–224: critical-lift sums finite above every bound, free on chosen lifts | agrees |
| 2.2 | Choice 1.2, p. 211 | 133–136: connected abelian cover with exact pullback, H₁(X)→H onto, kernel the lifting loops | agrees |
| 3.2 | §2.1, Lemmas 2.2 and 2.5, pp. 218–219 | 538 and 592 | agrees |
| 4.5 | Defs A.1 and A.3, pp. 239–240; §1.5, pp. 213–214 | 1851, 1886, 261 | agrees |
| 5.1 | §1.1, p. 210 | 52 onward, journal page = PDF page + 208 | agrees |

**Adversarial table.** The rows marked r10 are carried forward from the previous report (statements untouched). The rows marked r11 are new values for the sample targets not tabulated before. No statement changed.

| Statement | Instances | Values computed | Result | Round |
|---|---|---|---|---|
| `lefschetz_fixed_point_formula` | M=∅; point with f=id | 0 = 0; det on the 0-dim space is 1 ⇒ +1, tr on H₀=ℚ is 1 | holds | r10 |
| same | two points: swap; constant | 0 = tr[[0,1],[1,0]] = 0; 1 = tr[[1,1],[0,0]] = 1 | holds | r10 |
| same | S¹ reflection; rotation | det(1−(−1)) = 2 ⇒ 2 = 1−(−1); 0 = 1−1 | holds | r10 |
| same | S² antipodal; rotation by θ | 0 = 1+(−1); det(I−R_θ) = 2−2cos θ > 0 ⇒ 2 = 1+1 | holds | r10 |
| same | RP², [x:y:z]↦[x:2y:3z] | local signs +1, −1, +1 ⇒ 1; H_*(RP²;ℚ) = ℚ in degree 0 | holds, nonorientable | r10 |
| same, wrong models | sign det(df−1); ℝ translation | reflection −2 ≠ 2; 0 ≠ 1 shows `CompactSpace` is needed | conventions pinned | r10 |
| `poincare_hopf` | ∅; two points | 0 = 0; 1+1 = 2 | holds | r10 |
| same | S¹ with sin θ ∂θ; T² constant field | +1−1 = 0; 0 = 1−2+1 | holds | r10 |
| same | S² height gradient; RP² Morse gradient | 1+1 = 2; 1−1+1 = 1 | holds | r10 |
| `vectorFieldChartDerivative` | V=±x; V=x²; conjugation by diag(−1,1) | ±1; 0, so not nondegenerate; det −1 before and after | determines the sign | r10 |
| `fixedPointDerivative` | f=−x; f=2x conjugated by 3x | det(1−(−1)) = 2; det(1−2) = −1 | holds | r10 |
| §1.1 support | Σt^k with N(k)=k; N=0; R=0 | 3 terms below 3; square has 3 at t², 0 at t⁻¹; infinitely many terms below C=1; R=0 onto for every N | holds | r10 |
| §1.2 maps | projection ℤ²→ℤ; precomposition along ℤ⊕ℤ/2→ℤ | 1+e^(0,1) ↦ 2; (1+g)² = 2+2g ≠ 1+g | not a ring map, as stated | r10 |
| §1.3 | (1−t)Σt^k; exp, log | 1,0,0; 1+t+t²/2; t−t²/2 | holds | r10 |
| §1.4 domain | H=ℤ/2 | (1−g)(1+g) = 0 | torsion-free hypothesis needed | r10 |
| §1.5 orbit module | one orbit, F(s)=0; t²·U₃; reversed potential | F(e^h s) = −N(h), so {F > −C} finite iff {N < C} finite; t² shifts supports N≥3 to N≥5 and lowers F by 2; with F(hs)=F(s)+N(h) the finite-above condition becomes finite-above in N, the wrong ring | holds | r11 |
| §2.2 H₁ sequence | ℝ→S¹; ℤ²-grid cover of S¹∨S¹; dθ on ℝ/ℤ | 0 → ℤ, identity onto H, image 0 = kernel 0; commutator loops lift, so H₁(cover) ↦ 0; P(1)=1, N(1)=−1 | exact at H₁(X), first arrow not injective | r11 |
| §2.3 cover | A, B on ℝ×ℝ/2ℤ | AB = BA mod 2; B² = id; 2[b] = 0 in H₁ | universal abelian cover | r10 |
| §2.4 dimension | index pairs (1,0), (0,0) | 0; −1, absent | holds | r10 |
| §3.2 continuation | constant family; lift change t² | [1], not [0]; [t²]·[t⁻²] = [1] | holds | r11 |
| §3.3 | exact circle; nonzero period | ℤ[t^±]/(1−t) = ℤ, H₁ = 0; (1−t)⁻¹ = Σt^k | holds | r10 |
| §3.4 top degree | α=0 on S¹; nonzero period | H₁ = ℤ ≠ 0; ker(1∓e^h) = 0 when N(h)≠0 | holds | r10 |
| §4.1 convention | ℚ →2→ ℚ; basis change A₀=3, A₁=5 | rt3 2⁻¹, Milnor 2; τ = 3/10 = ½·3·5⁻¹ | holds; R07 notation | r10 |
| §4.4 norm, trace | s=t²; 1+t²; idempotent of ℤ[ℤ/2] | det(M_t) = −s, Norm(1−t) = 1−s; Tr = 2+2s; norm of (1+g)/2 is 0 | holds | r10 |
| §4.5 componentwise torsion | H=ℤ/2, d=1−g; lift changes | components g↦1: d=0, g↦−1: d=2 ⇒ (0, ½); c₀↦tc₀: d ↦ at⁻¹, τ ↦ t·a⁻¹; c₁↦tc₁: τ ↦ t⁻¹a⁻¹ | holds | r11 |
| §5.1 return germ | P=2x, h=3x; critical-free circle orbit | hPh⁻¹ = 2x, det(1−2) = −1 in both sections; 0-dim transverse space, det 1 | section-independent | r11 |
| §5.2 local index | x/2; 2x; x+x²−ε | +1; −1; −1 at √ε, +1 at −√ε, total 0 | conserved | r10 |
| §5.3 iterate signs | multipliers ½, 2, −2; circle | (1−t)⁻¹; (1−t); (1+t)/(1−t²) = (1−t)⁻¹; log ζ = Σt^k/k | exponent (−1)^(n−i₀) holds | r10 |
| §5.3 cover norm | double circle cover | Norm((1−t)⁻¹) = (1−s)⁻¹ | holds | r10 |
| §6.1 Cerf fold | x³/3−εx | zeros ±√ε, indices 0 and 1 | matches rt3 (2.1) | r10 |
| §6.1 / §6.4 circle | no critical points; one pair | τ = 1, ζ = (1−t)⁻¹; τ = (1−t)⁻¹, ζ = 1 | same I | r10 |
| §6.2 covers | H=ℤ⊕ℤ/2, h=(2,1) | divisibility 2 in H/T, 1 in H; no map H→ℤ/4 with h↦1 | README fixes rt3 gap | r10 |
| §6.4 mapping torus | reflection, identity; unknot; trefoil | (1−t)⁻¹(1+t); 1; (1−t)⁻²; Δ = t⁻¹−1+t | holds | r10 |
| §7.1 / §7.2 Euler | S² gradient; S¹ nonsingular field | 2; H₁=ℤ torsor, (1−t)⁻¹ ↦ t(1−t)⁻¹ | holds | r10 |
| R02 padding | three theorems | each closes in one line, re-run this round | padding | r10, r11 |

**Remarks on untouched text (no change requested).** None beyond the carried findings. The three source issues recorded in the previous report (rt3 Lemmas 3.7(a)/3.10, rt2 (2), rt3 Lemma A.4) still stand. They are not repeated below.

## Not verifiable

- V. Turaev, *Introduction to Combinatorial Torsions* (2001) and *Euler structures, nonsingular vector fields…* (1990): paywalled, and no legal copy was found. They appear only in References, with no locator that a target relies on.
- A. Pajitnov, *Circle-valued Morse Theory* (2006): paywalled. It appears only in References.
- Milnor, *Topology from the Differentiable Viewpoint*: read from the Edinburgh-hosted copy the sources service holds; the DOI route leads only to a review.

## Source issues

- none
