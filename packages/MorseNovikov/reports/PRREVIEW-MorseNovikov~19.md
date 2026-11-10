# Review of MorseNovikov (pull request #1161 at e3dc9d3)

**Verdict:** needs changes

The head is the one the previous review read (no change in the folder). The previous review's only finding was about the pull request description, and the description now carries the requested sentence. This round adds one finding of its own: a Check that this pull request added to §4.2 states a false identity of total quotient rings.

## R01 (P2) — §4.2 Check identifies the total-quotient components with ℚ((t)), which is strictly larger

**Location.** `TauCetiRoadmap/MorseNovikov/README.md:737` (added by this pull request, commit 3a07f9f): "For H=ℤ⊕ℤ/2 and N(n,e)=−n, with t=e^(−1,0) … Q(Nov)=ℚ((t))×ℚ((t)) and the map from Q(ℤ[H]) is ℚ(t)→ℚ((t)) in each component".

**Claim.** The total quotient ring of Nov(ℤ,ℤ⊕ℤ/2,N) is ℚ((t))×ℚ((t)).

**Witness.** Nov(ℤ,ℤ⊕ℤ/2,N)=ℤ((t))[g]/(g²−1), so each component is F=Frac(ℤ((t))). If exp(t)=f/g with f,g∈ℤ((t)) and c is the leading coefficient of g, then exp(t)∈ℤ[1/c]((t)), but 1/p! is not in ℤ[1/c] for any prime p not dividing c. So F≠ℚ((t)).

The pinned `TauCeti/RingTheory/NovikovSeries/TotalQuotient.lean` docstring (lines 22–27) says the same thing: Q(Nov(R,H,N)) is a finite algebra over the fraction field of Nov(R,K,N|K), where K is a torsion-free subgroup of finite index. §4.3 of this README (`README.md:744–747`) also only *embeds* each component into a Novikov field over ℚ. The §4.2 Check states an equality where §4.3 states an embedding.

**Repair.** In `README.md:737`, replace "Q(Nov)=ℚ((t))×ℚ((t)) and the map from Q(ℤ[H]) is ℚ(t)→ℚ((t)) in each component" by:

> Q(Nov)=F×F with F the fraction field of ℤ((t)), a proper subfield of ℚ((t)): exp(t) has the denominators n! and is not a quotient of integral Laurent series. The map from Q(ℤ[H]) is ℚ(t)→F in each component, followed by the embedding F⊂ℚ((t)) of §4.3.

**Tested.** On the refuting instance: the basis {1,g} over ℤ((t)) and the idempotents (1±g)/2 split ℚ⊗Nov into two copies of ℚ⊗ℤ((t)). Inverting the nonzero divisors gives F×F. The element 1/(2−t)=Σtⁿ/2ⁿ⁺¹ lies in F, and exp(t) does not. The rest of the Check (the splitting with free generator (1,1) gives the same minimal ideals (1±g)/2) is unaffected.

## Verified sound

### The previous review's findings

| Previous finding | Passage now | Status |
|---|---|---|
| R01 (P3): the description said the `AbelianCoverHomology` section was unchanged | Description, second bullet: "The `AbelianCoverHomology` section (`doubling`, `fiberMap` and their three one-line theorems) is deleted; §2.3 of the README keeps the calibration as prose. The Lefschetz statement takes its nondegeneracy hypothesis from Tau Ceti's `TauCeti.IsNondegenerateFixedPt`, so the file also imports `TauCeti.Geometry.Manifold.MFDeriv.FixedPoint`, …" | Repaired. It matches `Suggested.lean:5`, `:21–30`, `:107`, and main's `Suggested.lean:104–133`, which this head deletes. |

I also checked the other factual sentences of the description against main and the head. Main's file had `fixedPointDerivative` (main `Suggested.lean:42`), `vectorFieldChartDerivative` (`:75`) and `[SecondCountableTopology M]` in both theorems (`:62`, `:91`), and this head removes them. At a fixed point and at a zero, the new determinants are those of the same linear maps.

### Gate, dependency check and diff

- **Gate, own run:** `gate MorseNovikov: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's gate adds `build=0`.
- **Dependency check:** `depcheck: 233 roadmaps, 2263 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- **Outside the folder:** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/MorseNovikov'` is empty.
- **Citation resolver:** no cross-roadmap citation and no Lean name is found nowhere.

### Lean

- **Elaboration.** `lake env lean` on `Suggested.lean` exits 0. The only diagnostics are "declaration uses `sorry`" at lines 102 and 149.
- **Signatures.** A scratch copy with `#check @name` for all eight declarations reproduces `scratch/signatures.md` exactly. Both theorems carry `[FiniteDimensional ℝ E] [I.Boundaryless] [IsManifold I ∞ M] [CompactSpace M] [T2Space M]`, with `M : Type u` and `E`, `H` in independent universes. This matches §6.5 (`README.md:1281–1290`) and §7.3 (`:1466–1473`). `zeroDet` and `zeroSign` keep `[IsManifold I 1 M]`, which the tangent bundle's charted space needs. No binder is lost.
- **One-tactic probe.** On a scratch copy, each headline was tried with `simp`, `rfl`, `infer_instance`, `norm_num` and `exact?`:
  - `simp` and `norm_num` leave goals unsolved.
  - `rfl` fails, and `infer_instance` reports "type class instance expected".
  - `exact?` finds only the sorried theorem itself.
  
  There is no padding. The six definitions are exactly what the two statements need.
- **Pinned carriers opened** (Tau Ceti at the pin):
  - `TauCeti.IsNondegenerateFixedPt` (`Geometry/Manifold/MFDeriv/FixedPoint.lean:74`) is `IsFixedPt f x ∧ MDifferentiableAt I I f x ∧ ∀ v, mfderiv I I f x v = v → v = 0`. For smooth f in finite dimension, this is `fixedPointDet ≠ 0`, as `README.md:1317` says.
  - `finite_fixedPoints_of_isNondegenerateFixedPt` (`:146`) needs `[CompleteSpace 𝕜] [FiniteDimensional 𝕜 E] [CompactSpace M] [T2Space M]` and `Continuous f`, as `README.md:131–135` says.
  - Singular homology: `TopPair.singularHomology` and `TopPair.singularHomologyMap` (`AlgebraicTopology/Singular/Relative.lean:295`, `:300`), `TopPair.singularHomologyInclIso` (`Singular/Empty.lean:143`).
  - Euler characteristic: `eulerChar_eq_finsum_finrank_singularHomology` (`Cellular/EulerCharacteristic/FiniteCWType.lean:133`, a division ring in the universe of X). The `FiniteCWType` instances are for finite discrete spaces, products, finite covers, CW complexes and homeomorphic copies. None is for a compact manifold, as `README.md:1457` says.
  - `isCompleteVectorField_of_compactSpace` (`Geometry/Manifold/Flow/Complete.lean:154`, C¹ fields, compact).
  - `MorseChart` (`Morse/Lemma.lean:69`), `stableSet_eq_biUnion_orbit_localInvariantSet_Ici` (`Analysis/Calculus/Morse/LocalToGlobal.lean:187`).
  - Novikov series and torsion: `TauCeti.NovikovSeries` (`RingTheory/NovikovSeries/Basic.lean`), `orbitZeta` and `orbitZeta_eq_mapRingHom_eulerProduct` (`OrbitZeta.lean`), `HomologicalComplex.reidemeisterTorsion` and its three companions (`Algebra/Homology/ReidemeisterTorsion/`).
  - Knots: `TauCeti.KnotTheory.alexander`, `TauCeti.BraidWord.seifertMatrix`, `TauCeti.SmoothCircleEmbedding`. No pinned declaration attaches a Seifert matrix, PD code or Alexander polynomial to a `SmoothCircleEmbedding` (`KnotTheory/PDCode/Basic.lean:27` says realization is supplied separately). This confirms the docstring's "not statable" list.
  - Mathlib: `TopPair.incl` is at `Mathlib/Topology/Category/TopPair.lean:99`, and `IsAddQuotientCoveringMap` is at `Topology/Covering/Quotient.lean`.
- **Headlines.** Two are stated: the smooth Lefschetz fixed-point formula (§6.5) and vector-field Poincaré–Hopf (§7.3).
  - The algebra of Layers 1, 4 and 5 is named in the docstring as proved at the pin.
  - The other headlines are named as not statable, each with its missing carrier: cutoff trajectory spaces, the Novikov complex of a closed one-form, periodic-orbit data, based cellular torsion of an abelian cover, the Alexander polynomial of a smooth knot, the continuous fixed-point index, and the Euler-structure torsor.
  - A grep of both pins for a Lefschetz theorem, Poincaré–Hopf, a fixed-point index, Betti numbers of singular homology, an Euler-structure torsor or a Novikov complex of a one-form finds none. No statable headline is absent.

### Sources: the seeded sample

Read in the worker's cache: rt3 (file page N is printed page 208+N) and Hat02 (file page N is printed page N−9). I fetched rt2, rt1 and the erratum page through the sources service into a scratch manifest only (author's copies).

| Target | README locator | Text at the locator | Result |
|---|---|---|---|
| 1.1 | rt3 §1.2, p. 211; rt2 §1, p. 371 | rt3 lines 137–147 (finite below each R, convolution, group ring inclusion); rt2 lines 98–104 (Nov(H₁,−θ), finite on {−θ(h)≤C}) | agrees |
| 1.2 | rt3 §1.2, p. 211; §2.1, p. 220; §3.4, pp. 226–227 | rt3 lines 604–631 (O(R), limits, extension to Q(Λ)); lines 1043–1069 (sequence on p. 226; pushforward and finite-kernel pullback on p. 227) | agrees |
| 1.5 | rt3 §1.4, pp. 212–213 | rt3 lines 213–224: chains finite above each value of f, free over Λ on chosen lifts | agrees |
| 2.3 | Hatcher §1.2, pp. 51–52 | Hat02 lines 2338–2350: N₂ is the Klein bottle, word aba⁻¹b, abelianization ℤ⊕ℤ/2 | agrees |
| 2.4 | rt3 §1.1, p. 211; §1.3, p. 212; §1.4, p. 213; Lemma 2.2, pp. 218–219 | rt3 lines 114–117 (expected dimension); 176–180 (length bounded by a multiple of R); 243–246; 538–575 | agrees |
| 3.1 | rt3 §1.4, (1.3), pp. 212–213 | rt3 lines 225–246 | agrees |
| 3.2 | rt3 §2.1, Lemmas 2.2 and 2.5, pp. 218–219; family-Floer erratum, §2.2 and Prop. 3.4 | rt3 lines 538–601; erratum lines 23–27 (an arbitrary function homotopy with generic metrics fails transversality; Prop. 3.4 is false; the fix is a generic path or a generic connection) | agrees |
| 3.3 | (1.4), p. 213; Lemma 4.1, p. 235, proof p. 236; Example 1.8, p. 215; Remark 4.3, p. 237 | rt3 lines 252–258; 1634–1663; 364–376 ("apparently", a sketch); 1712–1714 | agrees |
| 3.4 | rt3 (1.4), p. 213; Appendix A, pp. 239–240 | rt3 lines 252–258; 1815–1944 | agrees |
| 5.1 | rt3 §1.1, p. 210 | rt3 lines 67–82: return map, normal linearization independent of U, Lefschetz sign | agrees |
| 5.3 | rt3 (1.1)–(1.2), p. 212; Prop. 3.6(a), p. 228; rt2 Def. 1.3 and (2), p. 371 | rt3 lines 162–208, 1146–1195; rt2 lines 105–130 (exponent −(−1)^{i₀}) | agrees; the README's odd-dimension caveat is right (Source issues) |
| 6.1 | rt3 Def. 1.5, p. 214; Thms A, B, pp. 214–215; Def. 2.6, p. 220; Lemma 3.2, p. 223; §2, pp. 218–222; §§3.1–3.3, pp. 223–226; rt2 Thm 1.7, p. 373 | rt3 lines 305–343, 632–637, 837–860, 956–1042, 1385–1400 (normal form (3.13)); rt2 lines 174–178 | agrees |
| 6.2 | rt3 Lemmas 3.5, 3.7–3.10, pp. 227–231; Lemma 3.7, p. 229; Lemma 3.8(a)–(b), p. 230 | rt3 lines 1090–1133, 1241–1374 | agrees; the README's divisibility in H/T repairs a step of the source (Source issues) |
| 6.4 | rt3 Examples 1.7–1.9, pp. 215–216; rt2 Ex. 1.4, p. 372; rt1 Ex. 1.9, p. 863; Hatcher Thm 2C.1, p. 177 | rt3 lines 354–417; rt2 lines 150–154; rt1 lines 80–83 (credits Milnor, points to its Lemma 2.6); Hat02 lines 7714–7716 (file p. 186) | agrees |
| 6.5 (Lean docstring) | Hatcher Thm 2C.3, p. 179, proof pp. 180–181 | Hat02 lines 7787–7789 (file p. 188); 7829–7880 (trace formula at 7866–7870, file p. 190) | agrees |
| 7.3 | Hatcher Cor. A.8–A.9, p. 527; Lemma 3.27(b), p. 236; Milnor TDV §6, p. 35 | Hat02 lines 22832–22845 (file p. 536: a compact ENR has finitely generated homology; a compact manifold is an ENR); 10255–10259 (file p. 245) | Hatcher agrees; Milnor is under Not verifiable |

The README flags no locator as unverified.

### Supplier citations resolved (main at 2bbd3cb)

- **MorseTheory:** M1 `:110`, M2 `:144`, M3 `:453`, M4 `:481`, M6 `:895`.
- **HeegaardFloer:**
  - Lane M §§1.1–1.5 are at `:300–467`. §1.5 (M.5) `:467` holds the A₂ fold and signed elementary chain change (`:536–545`).
  - §1.9 (M.9) `:1162` holds the Morse Euler/index proof, and names the N7 comparison as downstream (`:1177–1180`).
  - Layer 2 is F0, and §2.8 (F0.6) `:1913` is the local return germ with conjugacy and every iterate (`:1938–1951`).
  - HF lists MorseNovikov as a consumer only (`:54`).
- **DifferentialGeometry:** Layers 0–3 `:268–371`, 5 `:503`, 6 `:782`, 8 `:816`, 10 `:877`, 12 `:910`. In its `Suggested.lean`: `circleAngularForm` `:1952` with |∫|=2π `:1957`, `closedForms`, `RoughForm`, `flowOf`, `toFlow`.
- **AlgebraicTopology:** Stages 1–7 at `:289–1573`; Stage 4 items 2–3 at `:512–520`.
- **DGFloer:** Layer 1 item 1 (degree-one Hurewicz) `:462`.
- **UniversalCovers** (Completed): Stage 2 items 7–8 `:107`, `:111`.
- **GeometricTopology:** Layer 1 `:783`, Layer 3 `:1429`, Layer 4 `:1611` with §4.4 `:2740`, Layer 5 `:5893`, Layer 11 `:7732` with §11.3 `:7887`.
- **Consumers named in `README.md:1527–1536`:**
  - On main: DGFloer `:1343`, `:1375` (N1, N4); TaubesGromov `:15`, `:445`, `:451` (N1 with a noninjective period map; N6 mapping-torus trace); HamiltonianFloerOperations `:16` (N1).
  - At their open heads: FukayaTheory `:26` (N1); AlgebraicTopologyPartII `:421` (N6 Lefschetz for a fixed-point-free conjugation, which the stated theorem covers with an empty fixed set); K3SurfacesAndSymplecticBoundedness `:198–200` (N6). GromovWittenTheory names N1 in its supplier list.

### Duplication, ownership and the open revision #1854

- **Headline ownership.** No roadmap on main or at an open head states the smooth Lefschetz formula or vector-field Poincaré–Hopf.
  - CharacteristicClasses hands both to MorseNovikov: on main at `:138`, and at #1807, #1808 and #1854 (#1808 `:50–54`, `:1618`).
  - HeegaardFloer §1.9 names N7's theorem as a downstream comparison.
  - IndexTheory, SchubertGeometry and GroupActionsOnRiemannSurfaces own the Atiyah–Bott and holomorphic formulas.
  - EtaleCohomologyFoundations' `PerfectComplex.lefschetzNumber` is an étale perfect-complex trace and does not overlap.
  - No other `Suggested.lean` declares these eight names.
- **Pinned algebra and the pinned one-form API.** At the pin, `TauCeti.NovikovSeries` with its whole Layer 1 API, `HomologicalComplex.reidemeisterTorsion`, `orbitZeta`, `TauCeti.IsMorseOneForm`, `TauCeti.periodHom` and `Flow.ClosedOrbit` exist.
  - This README still describes them as targets. Its Scope (`:31–34`) says the completed ring, based torsion and orbit zeta series are constructions of this roadmap, while `Suggested.lean:21–30` says they are proved at the pin.
  - It also consumes DGFloer Layer 1 item 1 (`:185`, `:441`) while DGFloer consumes N1 and N4. That mutual citation is already on main.
  - The open revision #1854 rewrites exactly these passages: it consumes the pinned carriers (its README `:36–37`, `:152–236`) and repoints H₁=π₁ᵃᵇ to AlgebraicTopology AT8.3 and the pinned `TauCeti.HurewiczOne.hurewiczHomologyAddEquiv` (`:248–252`, `:287–288`).
  - The generated merge-order block orders this pull request first and #1854 second, so #1854 rebases onto this one. Under the overlap rule these changes are not asked for here a second time.
- **FourManifolds (#936).** At `:176` and `:364` it cites MorseNovikov N6 for the Seifert presentation tV−Vᵀ of the Alexander module, which N6 owned on main (main `README.md:1188–1189`). At this head, §6.4 states that the module, its presentations and Δ_K are GeometricTopology §4.4's (`README.md:1249–1250`). N6 keeps the identification of the cover's H₁ with that module. The citation can therefore be followed to its new owner from the section it cites; repointing it is FourManifolds' change.
- **Overlaps file.** #1854 is the only open pull request that changes this folder. No id is dropped or defined only by a revision, in either direction.

### Adversarial pass

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| §4.2 Check, Q(Nov) for H=ℤ⊕ℤ/2 | exp(t); 1/(2−t) | exp(t)∈ℚ((t)) has denominators n!, so it is not in Frac(ℤ((t))); 1/(2−t)=Σtⁿ/2ⁿ⁺¹ is in it | Check false | R01 |
| `lefschetz_fixed_point_formula` | T², A=[[2,1],[1,1]] | one fixed point; det(1−A)=(−1)(0)−(−1)(−1)=−1, so LHS −1; traces 1, tr A=3, det A=1, so RHS 1−3+1=−1 | equal | none |
| same | S², antipodal map | no fixed points, LHS 0; RHS 1+(−1)²·(−1)=0 | equal | none |
| same | S¹, z↦z̄; S¹, z↦z²; ℝP², rotation | 2=1−(−1); −1=1−2; 1=1 (rational homology ℚ in degree 0) | equal, including a nonorientable case | none |
| same | E=0, three points with two swapped; two points mapped to one | det on the zero space is 1; LHS 1, trace of the permutation on ℚ³ is 1; LHS 1, trace of [[1,1],[0,0]] is 1 | equal | none |
| same | identity of S¹; translation of ℝ | v=1 is fixed by df, so `hnd` fails and nothing is claimed; 0 against 1, excluded by `CompactSpace` | hypotheses needed | none |
| wrong model det(df−1) | S¹ reflection | det(−1−1)=−2 at both points gives −2≠2 | excluded by the Check at `README.md:1305` | none |
| `poincare_hopf` | S³ with a nonvanishing field; T² with a constant field | 0=1−0+0−1; 0=1−2+1 | equal | none |
| same | S² height gradient; E=0 with two points | +1+1=2=1+1; 1+1=2=b₀ | equal | none |
| `zeroDet` wrong projection `fst` | any zero | the first component of the section's derivative is the identity, so det 1 everywhere; a T² Morse gradient would give 4≠0 | `snd` needed | none |
| §7.1/§7.3 sign convention | V=∇f against −∇f at a critical point of index i | det(Hess) sign (−1)^i; det(−Hess) sign (−1)^(n−i), different in odd n | as stated at `README.md:1391` | none |
| `rationalBetti` | S¹; ℝP²; infinite discrete | (1,1), sum 0, against reduced (0,1) with sum −1; (1,0,0) against 𝔽₂ (1,1,1); `finrank`=0 | Checks discriminate | none |
| §1.1 | H=0; N=0 on ℤ; N(k)=k | Nov=R; Σt^k has infinitely many terms below 1; Σt^k squared has 3 at t² and 0 at t⁻¹ | as claimed | none |
| §1.1 onto iff N=0 | zero ring; N(h)>0 | both rings are 0, so onto for every N, hence "nontrivial R"; Σe^(kh) is not finite | hypothesis needed | none |
| §1.2 | ℤ²→ℤ; ℤ⊕ℤ/2→ℤ; U₂ | 1+e^(0,1)↦2; pullback of 1 is 1+g and (1+g)²=2+2g; t²∈U₂, t⁻³t²=t⁻¹∉U₂; P(U_C)⊆U′_(cC) since N′(φh)=cN(h)≥cC | as claimed | none |
| §1.3 | N(k)=−k; Π(1−tⁿ)⁻¹ | (1−t)(−t⁻¹Σt^(−k))=−Σ_(k≥1)t^(−k)+Σ_(k≥0)t^(−k)=1; t⁴ coefficient p(4)=5 | as claimed | none |
| §1.5 | one orbit, F(s)=0 | F(e^h s)=−N(h), so finite above C is finite with N<−C; t²·U₃⊆U₅ | as claimed | none |
| §2.3 | A(s,y)=(s+1,−y), B(s,y)=(s,y+1) on ℝ×ℝ/2ℤ | AB=(s+1,−y−1)≡BA=(s+1,−y+1); A^nB^e=(s+n,(−1)ⁿ(y+e)) is free; [a,b]=b⁻²; H₁(C)=ℤ→2[b]=0 | as claimed | none |
| §2.4 / §3.1 | circle with α=(c+sin θ)dθ, \|c\|<1 | max lift flows to two adjacent min lifts with signs ±1, so ∂p̃=±(1−t)q̃; at t=1 this is 0 | as claimed | none |
| §3.2 | change of lift by t² | [t²][t⁻²]=[1] | as claimed | none |
| §3.3 | −∇(cos θ+C⁻¹θ)=(sin θ−C⁻¹)∂θ | C=2: zeros at π/6 and 5π/6; C=1/2: sin θ−2<0 everywhere, so the circle is one closed orbit | as claimed | none |
| §3.4 top degree | T² with dx; Klein bottle with ds | 1−t is a unit, so H₂^Nov=0 against H₂(T²)=ℤ; 1±e^A is a unit for N(A)≠0, so the twisted invariants vanish | as claimed, including nonorientable | none |
| §4.1 | ℚ→ℚ by 2; A₀=3, A₁=5; swap on ℚ² | τ=1/2; new d=10/3 and τ=3/10=(1/2)·3·5⁻¹; det −1, τ=−1=1·det(A₀) | as claimed | none |
| §4.4 | ℤ→ℤ/2, s=t² | 1+ct has matrix [[1,cs],[c,1]] with det 1−c²s; 2·even part of log(1+ct) is −Σc^(2m)s^m/m=log(1−c²s) | as claimed | none |
| §5.1 | P=2x, h=3x | hPh⁻¹=2x, det(1−2)=−1 in both sections | as claimed | none |
| §5.2 cubic | x+x³∓εx | 0 (+1), ±√ε (−1 each), total −1; 0 alone (−1) | index −1 both ways | none |
| §5.3 signs | λ=1/2, 2, −2 | ε(γ^k)=sgn(1−λ^k): all +, all −, (+,−,+,…); factors (1−t)⁻¹, 1−t, 1+t; i₊+i₋+i₀+2c=n−1 gives exponent (−1)^(n−i₀) | as claimed | none |
| §5.3 Klein bottle | f(θ)=−θ+ε sin θ | L(f^k)=1−(−1)^k, so Σ L(f^k)t^k/k=log((1+t)/(1−t)); orbit factors (1−t)⁻¹ at 0 and (1+t) at π; rt2's −(−1)^{i₀} would give (1−t)^(+1) at 0 | consistent with §6.4 | none |
| §6.1 normal form | V_t=(x₁²+(t−t₀),−x₂,…) | for t<t₀, zeros at ∓√(t₀−t), with x₁-Hessian ∓2√ give indices i and i−1; −V_t has x₁-component (t₀−t)−x₁²>0 between them | matches rt3 (3.13), lines 1387–1398 | none |
| §6.2 covers | H=ℤ⊕ℤ/2, h=(2,1) | d=2 in H/T; μ(n,e)=2n mod 3 gives μ(h)=1; ν(n,e)=n mod 4 gives ν(nh)=2n mod 4=0 iff n even; e^(2h) coefficient 4·c₂ | as claimed | none |
| §6.2 exponent | τ₊=x^((−1)^i)τ₋, ζ₊=yζ₋ | equality iff y=x^((−1)^(i+1)), leading coefficient b₁=(−1)^(i+1)a₁ | matches rt3 Lemmas 3.7(b), 3.8(b) | none |
| §6.4 surgery | trefoil V=[[−1,1],[0,−1]] | det(tV−Vᵀ)=(1−t)²+t=t²−t+1, Conway form t⁻¹−1+t; (1−t⁻¹)²=t⁻²(1−t)² | as claimed | none |
| §6.4 adapter | e=[v₀,v₁], barycentre b | Sd e=[v₀,b]+[b,v₁]; λ sends b↦v₁, so λ#Sd e=e+0 | as claimed | none |
| §7.3 Checks | V=(−x,y); conjugation by (x,y)↦(−x,y) | det −1 before and after | as claimed | none |

## Not verifiable

- **Milnor, *Topology from the Differentiable Viewpoint*, §6, p. 35** (`README.md:1377`, `:1438`, `:1473`, `:1544`; `Suggested.lean:129`). This is a published book. It is not in the sources cache or the manifest, and I know of no legal open copy, so it is cited by locator.
- **Dold, *Lectures on Algebraic Topology*, Chapter VII, §6** (`README.md:1298`, `Suggested.lean:98`). A Springer book, not read. Hatcher Theorem 2C.3 and its proof, which were read, cover the trace argument.
- **Turaev (1990 and 2001) and Pajitnov (2006).** They are cited without locators as background. rt3 Appendices A–B, which were read, cover what §§4.5 and 7.1–7.2 use.
- **Milnor, Whitehead torsion, §3, pp. 365–368 (§4.1).** This is outside the sample and was not read this round.
- **Manifest.** The package manifest records rt3, Gra72, Hop29 and Hat02. The README cites neither Granas nor Hopf 1929, and the works it does cite (rt1, rt2 and the erratum page) are not in the manifest. I read those three from legal author copies and recorded them only in a scratch manifest. This is a matter for the board's manifest, not the folder.

## Source issues

- **Error** in rt2 at equation (2), printed page 371: the source says each irreducible orbit contributes the exponent −(−1)^{i₀} on a closed oriented n-manifold; it should be −(−1)^{i₊+i₋}=(−1)^{n−i₀}, which agrees only for odd n (a multiplier in (0,1) on a surface needs (1−[γ])⁻¹); affects a stated result.
- **Error** in rt3 at the proofs of Lemmas 3.7 and 3.10, printed pages 229–230: the source takes d as the divisibility of h in H and asserts homomorphisms H→ℤ/k sending h to 1 (k prime to d) and torsion-killing H→ℤ/dk sending h to d; for H=ℤ⊕ℤ/2, h=(2,1) neither exists at k=4, respectively k=2; it should take d as the divisibility of h's image in H/Tors, as README §6.2 does; affects the proof.
- **Misprint** in rt3 at §1.2, printed page 211: the source says the inclusion of the group ring into the Novikov ring is the identity exactly when N vanishes; it should say the inclusion is onto, hence an isomorphism, exactly when N vanishes; affects nothing.
- **Gap** in rt3 at equation (1.5), printed page 215, and Remark 4.3, page 237: the source states the Euler-refined equality but proves it only through Example 1.8's sketch, which it calls apparent; it should give a rigorous triangulation-adapted Morse model; affects a stated result.
