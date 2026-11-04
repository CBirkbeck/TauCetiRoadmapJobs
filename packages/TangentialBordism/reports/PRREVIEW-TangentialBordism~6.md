# Review of TangentialBordism (pull request #942 at 4c63ec0)

**Verdict:** needs changes

This is a full re-review: the folder changed by 191 lines since bb3149f (the head the previous review accepted). The change moves the finite F₂ Arf algebra out of this roadmap: Layer 1 (`README.md:172–204`) now consumes "GeometricTopology Layer 4.3.1", the Scope paragraph (`:67–69`), the supplier table (`:141`, `:150`) and the build summary (`:157`) say the same, and `Suggested.lean` lost its Layer 1 block (eight declarations) and the `TauCeti.LinearAlgebra.BilinearForm.SymplecticBasis` import. Every other passage is unchanged and was re-read; its verification is recorded below.

## Previous findings

The previous review (PRREVIEW-TangentialBordism~5) accepted bb3149f with no finding. There is nothing to carry.

## R01 (P1) — Layer 1 consumes a GeometricTopology section that does not exist on main

**Location.** `README.md:176–178`: "Consume GeometricTopology Layer 4.3.1's finite nonsingular-F₂ quadratic Arf algebra on native quadratic forms"; `:194` `*Needs:* GeometricTopology Layer 4.3.1 finite quadratic Arf algebra`; the same citation at `:67–69`, `:141`, `:150`, `:157`, `:203`, and downstream through B3.2(a) in 8.1 (`:1848`) and 8.2 (`:1850`, `:1874`).

**Claim.** The symplectic-basis formula, basis independence, isometry invariance, orthogonal-sum additivity, plane classification, Gauss sum, q-zero counts and q-zero Lagrangian criterion are supplied by GeometricTopology §4.3.1.

**Witness.** GeometricTopology is a roadmap on main. On main (fa41b37) `TauCetiRoadmap/GeometricTopology/README.md` has "Layer 4: knot theory, done properly" at lines 409–518 with no subsection 4.3.1; the words "quadratic" and "Arf" occur nowhere in the file (grep count 0). The section "4.3.1 Quadratic refinements and proper links" exists only at the head of pull request #903, which revises the existing GeometricTopology folder. The brief's supply rule is that a pull request revising an existing roadmap is never a dependency: the roadmap is cited as it is on main. Written as it stands, B3.2(a) and everything that needs it (8.1, 8.2 and the ΩSpin₂ row of 8.4) rest on a section that no supplier in this roadmap's allowed set provides, which is exactly the case the brief classifies as a dependency that should have been a gap but is written as if supplied (P1). The depcheck cannot see this (it resolves the roadmap name, which is on main, not the section), so its `0 problem(s)` is not evidence here.

**Repair.** Make the contract explicit as a declared supplier gap, which the brief treats as a stated contract rather than a finding. In `## Exact supplier contracts`, in the GeometricTopology row or a GeometricTopology subsection, add one sentence of the form `What GeometricTopology must provide (gap:finite-quadratic-arf): for a finite-dimensional F₂ vector space with a quadratic form whose polar form is nondegenerate, of dimension 2m (m ≥ 0), the Arf invariant with its symplectic-basis formula and basis independence, isometry invariance, orthogonal-sum additivity, the hyperbolic/anisotropic plane classification, the integer Gauss sum (−1)^Arf·2^m, the q-zero count 2^(2m−1)+(−1)^Arf·2^(m−1) for m ≥ 1, and the equivalence of Arf 0 with a q-zero subspace of dimension m.` List the slug under the README's gaps, and add the matching `gaps` entry (`supplier` GeometricTopology, `section` 4.3.1, the same `needs`) to `design/plan.json` if this roadmap has a plan (none is readable here; if there is none, say so in the pull request so the intake records the contract from the README). Then Layer 1 and the citations at `:67`, `:141`, `:150`, `:157` read as the gap. The alternative of restoring the Layer 1 of bb3149f would re-create two owners against #903 and is not recommended. Note for the author: FourManifolds (#936, `README.md:501`) and HomotopySpheres (#1287, `README.md:1203–1208`) still cite TangentialBordism 1.1/B3.2 for `finiteQuadraticArf`; after this move those citations point at a target that no longer exists here, which their own reviews will raise.

## R02 (P3) — Residue of the Layer 1 move

**Location.** `README.md:124–127`: "Use `LinearMap.BilinForm.IsAlt.exists_basis_toMatrix_eq_J` and `LinearMap.BilinForm.IsAlt.even_finrank` … for the finite quadratic basis"; `README.md:2697–2701`: the Pyronneau reference, "The Gauss-sum and Lagrangian formulations here are consequences of the paired-plane classification"; `README.md:2629–2630`: "HomotopySpheres consume the ordinary operation, Adams, finite quadratic and framed PT interfaces"; `Suggested.lean:31–32`: a pointer comment saying the Arf algebra is specified in GeometricTopology.

**Claim.** These passages describe a construction and a source that the roadmap no longer contains.

**Witness.** No target in the README constructs a symplectic basis any more (grep for `exists_basis_toMatrix_eq_J` hits only line 124); "Pyronneau" occurs only in the reference list; the "finite quadratic" interface is supplied by GeometricTopology under R01, not here.

**Repair.** Delete the SymplecticBasis sentence from `### From Tau Ceti` (keep the `IsOrientedAtlas` sentence); drop the Pyronneau entry or move it to the gap sentence of R01; change the Downstream sentence to "the ordinary operation, Adams and framed PT interfaces and the Spin-surface refinement"; delete the two-line comment in `Suggested.lean` (the module docstring already says where the algebra lives).

## R03 (P3) — Two locator precisions

**Location.** `README.md:1829–1830` and `:1848`: "Consume SpinGeometry's actual two circle lifts and all Spin structures on a closed surface Σ … *Needs:* B3.2(a); SpinGeometry G4 circle and surface lifts"; `README.md:382–383`: "Milnor–Stasheff, §§17.1–17.2, Lemmas 17.1–17.2, pp.206–207".

**Witness.** In `TauCetiRoadmap/SpinGeometry/README.md` on main, G4.3 proves existence and G4.4 the H¹ torsor of lifts; the two circle lifts (the trivial Spin(1)=ℤ/2 cover and the connected double cover of the oriented frame bundle) and all torus lifts through H¹ are constructed in G6 item 5 (lines 775–787). In the cited Milnor–Stasheff edition, 17.1 is Theorem 17.1, the collar neighbourhood theorem (`milnorstasheff line 5439`, printed p.206), and 17.2 is Lemma 17.2, that oriented cobordism is an equivalence relation (`line 5457`, p.207).

**Repair.** In 8.1 cite SpinGeometry G4.3–G4.4 for existence and the torsor on Σ and G6 item 5 for the two circle lifts (and add G6 item 5 to the SpinGeometry supplier row); in 2.4 write "Theorem 17.1 and Lemma 17.2, pp.206–207".

## Verified sound

### Gate, dependency direction and the acceptance test

The worker's gate at this head reports every scanner at zero and a passing targeted build. I reran the gate (every count zero, `OK`, exit 0) and the dependency check with `--movable`:

```text
depcheck: 204 roadmaps, 1403 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The outside-folder diff against `origin/main` is empty; the folder holds `README.md`, `Suggested.lean` and `metadata.toml` only. TangentialBordism is line 9 of the merge order; its open-pull-request suppliers StringOrientation (line 6), SmoothBundlesConnections (7) and PseudodifferentialOperators (8) precede it, IndexTheory (#1077, not in the order) cites TangentialBordism only as a downstream consumer (`rev/1077 README.md:873`), and GeometricTopology at #903's head names TangentialBordism only as a consumer (lines 50, 143, 1391, 5531), so the earlier GeometricTopology↔TangentialBordism cycle is broken at both ends.

I elaborated a scratch copy of `Suggested.lean` with `#check @orientedThreeManifold_parallelization` appended (`lake env lean`, 3 s, exit 0): the only output is the `sorry` warning at line 42 and the elaborated type, which carries `T2Space M`, `SecondCountableTopology M`, `ChartedSpace (EuclideanHalfSpace 3) M`, `IsManifold (modelWithCornersEuclideanHalfSpace 3) ∞ M` and `TauCeti.IsOrientedAtlas … A`, and concludes with a pointwise `Module.Basis (Fin 3) ℝ (TangentSpace … x)`, positivity of `Matrix.det` of the chart derivative of the frame on every chart of `A`, and `ContMDiff` of the two bundle maps. This is the README statement at `:1920–1934` (Hausdorff, second countable, boundary allowed, no compactness or connectedness, positivity in every chart of the chosen atlas, smooth frame and inverse). The file has one import besides `import Mathlib` (`TauCeti.Geometry.Manifold.Orientation`, present at the pin), no `set_option`, no sorry'd data, no admitted `example`. Padding probe: the one declaration is the roadmap's parallelization headline (deep: Wu/Spin route plus the noncompact and boundary extensions) and closes with no one-tactic attempt (the previous reports' 16 probes stand; nothing new was added). The headlines not statable are named in the docstring with the missing carriers (bordism groups, Thom spectra, Steenrod operations, KO, the compact Albert algebra); I confirmed at the pins that `SingularManifold` (Mathlib `Geometry/Manifold/Bordism.lean:110`) has no bordism relation and that no Thom spectrum, Steenrod operation or KO spectrum exists in Mathlib or Tau Ceti.

### Library declarations opened at the pins (Mathlib 6b7abb3c, Tau Ceti a91d3aaf)

`TauCeti.IsOrientedAtlas` (`TauCeti/Geometry/Manifold/Orientation.lean:332`, with `[NeZero n]`) and `IsOrientedAtlas.det_fderivWithin_pos` (`:352`); `TauCeti.orientationPreservingGroupoid` (`:26`); `TauCeti.orientable_closedBall` (`Geometry/Manifold/Instances/ClosedBall.lean:47`, dimension at least two as the README says at `:342`); `TauCeti.Lie.nonempty_embeddedLieSubgroupData_lieSubalgebraOfSubgroup_of_isClosed` (`Geometry/Lie/Subgroup/Embedded.lean:43`); `TauCeti.realCliffordForm` (`LinearAlgebra/CliffordAlgebra/RealForm/Basic.lean:124`); `LinearMap.BilinForm.IsAlt.exists_basis_toMatrix_eq_J` and `even_finrank` (`SymplecticBasis.lean:301`, `:309`); Mathlib `exists_embedding_euclidean_of_compact` (`Geometry/Manifold/WhitneyEmbedding.lean:131`, with `[T2Space M] [CompactSpace M]`), `ChartedSpace.secondCountable_of_sigmaCompact`, `SingularManifold` and `.prod` (`Bordism.lean:110`, `:62`), `Rep.FiniteCyclicGroup.groupHomologyIsoEven` (`GroupHomology/FiniteCyclic.lean:85`), `Orientation.eq_or_eq_neg_of_isEmpty` (`LinearAlgebra/Orientation.lean:217`), `Orientation.map_of_isEmpty` (`:116`), `ContMDiffVectorBundle` (`VectorBundle/Basic.lean:305`), `spinGroup` (`SpinGroup.lean:292`), `CategoryTheory.SpectralSequence` (`SpectralSequence/Basic.lean:36`), `QuadraticMap.polar_self` (`QuadraticForm/Basic.lean:311`). `TauCeti.DivisionOctonionReal` (the citation scanner's one lead) is not a pinned declaration and is not claimed as one: LieHighestWeight Layer 8 on main plans it (`README.md:1261`), and the supplier row at `:151` cites it from there.

### Cross-roadmap citations resolved (every round)

On main: GeneralizedCohomology G1 item 1 (`:141`), G3 items 3, 8, 9 (`:710`, `:785`, `:878`), G4 item 3 (`:1224`), G5.2–G5.5, `MappingPathSpace` (`:555`), `spectrumConnectiveCover` (`:797`), `realMixedCliffordIndexClassification` (`:2084`), `realNegativeCliffordFamilyIndex` (`:2099`); CharacteristicClasses C1 items 3–4 (`:486`, `:504`), C3.6, C7.3/C7.3a (`:1638`); DifferentialGeometry 2.1 (`:345`, `OrientationLift`/`Manifold.Orientation`), `dense_isRegularValue` (`:885`); SpinGeometry G4 (`:395`), G5.0 `realCliffordSpinorBundle` (`:506`), G6.0 `realSpinDiracClosedRealization` (`:586`), `realSpinLichnerowiczFormula` (`:636`), `realSpinDiracIndexClass` (`:655`), G6.7 (`:821`); ClassifyingSpaces Stage 4 `groupHomology` (`:222`, `:238`); RiemannianGeometry R1 (`:179`); LieHighestWeight Layer 8 `compactAlbertDerivation_complexification`/`_killing_negDef` (`:1391`, `:1398`); SpinRepresentations Spin(3) (`:863`); AffineMorseLefschetz A0/A5/A6 (`:67`, `:494`, `:535`); ComplexKahlerGeometry K7.1 (`:291`); DGFloer Layer 1 (`:442`); DGAInfinity (on main); GeometricTopology Layer 1 and Layer 11 (`:177`, `:831`) and item 1 of the smoothing comparison (`:938`). At open heads: StringOrientation S1.3, S1.5, S2.2, S2.3, S5.3 (`rev/948 README.md:343`, `:435`, `:528`, `:580`, `:1094`; S2.3 states `π₃S≅ℤ/24` with generator ν at `:585`); IndexTheory `spinFour_signature_eq_neg_sixteen_mul_quaternionicIndex` and `rokhlin_signature_dvd_sixteen` (`rev/1077 README.md:869–871`); PseudodifferentialOperators P5/P6 (`rev/952 README.md:914`, `:1470`). GeometricTopology 4.3.1 resolves only at #903's head: R01.

### Seeded sample against the texts

Cache ids are sha256 prefixes of the sources cache; pages are printed pages.

- 2.4 (B1.2): Milnor–Stasheff Theorem 17.1 (collar neighbourhood) `milnorstasheff line 5439` p.206 and Lemma 17.2 (reflexive, symmetric, transitive by the cylinder, reversal and gluing along the collar) `line 5457` p.207 (R03 for the label); Miller Chapter 1 Definitions 1.1–1.2 `miller line 95`, `line 104` (printed p.2; printed = pdf − 5) and Chapter 2 Definitions 1.1 (π-structure as a homotopy class of lifts of the stable normal map, `line 1453`, p.39) and 1.3 (null-bordant through an embedded W in ℝ^(n+k)×ℝ₊ with the lifted classifier, `line 1538`, p.41).
- 2.5 (B1.3): no external source is cited; the free face into A, collars along every face and compatible corner intersections are this roadmap's constructions (Conventions `:85–88`); checked for consistency with 3.3's connecting map (table).
- 3.2 (B2.2): Miller Chapter 1 §1 p.2 for the product over spaces; Milnor–Stasheff §17.2 pp.207–208: the graded ring and `M₁×M₂ ≅ (−1)^(mn) M₂×M₁` at `milnorstasheff line 5480`, the sign the README states.
- 3.3 (B2.3): the README attributes nothing to Thom beyond "not the coefficient theorem of IV.8", which is at `thom1954 line 2462`, folio 75 (`line 2464`).
- 4.1 (B4.1): Milnor–Stasheff Chapter 8 "Existence of Stiefel-Whitney Classes" (`line 2449`) builds the squares and the Thom identity; Chapter 11 (`line 3172`) and Theorem 11.14 (`line 3651`) for Wu; the signed integral higher-diagonal equation is stated as this roadmap's own extension.
- 5.1 (B5.1): Miller Chapter 1 §§2–3 pp.3–7 (table of contents `lines 19–20`); Thom Théorème IV.6 (L-equivalence classes identified with maps to M(SO(k)), compatible with the group structure for k ≥ n/2+1) `thom1954 line 2410`, folio 74 (`line 2424`); IV.8 `line 2462`, folio 75.
- 5.5 (B5.5): Miller Chapter 2 Theorem 1.4 (Thom: Ω^G_*(X) ≅ π_*(MG∧X₊)) `miller line 1565`, p.41; Chapter 1 §5 pp.12–14 for the Thom isomorphism (`line 22`).
- 5.6 (B5.6): GeneralizedCohomology G4 item 3 (`:1224`, orientation data and the cohomological and homological Thom isomorphisms) and G5 items 1–3; the rank bookkeeping is recomputed in the table.
- 6.2 (B4.5): Thom IV.10 (`line 2528`) and Corollaire IV.11 (`line 2538`), folio 77 (`line 2545`).
- 6.6 (B6.2): Wall, OCR text: Lemma 7 (P(ℂ) cobordant to P(ℝ)² unorientedly) `wall1960 line 352` p.300; the proof of Theorem 1 `line 450` p.302; Lemmas 8–12 `lines 467–528` pp.303–304 (∂₂ as the derivation of the dual polynomial algebra, kernel elements of each degree not a power of 2, the greatest-term lemmas) and Lemma 13 (Pontrjagin numbers on the image) `line 567` p.305; printed pages 292–311 (`line 9`).
- 8.1 (B3.2(b)) and 8.2: Atiyah Proposition (4.1) (a Riemann surface with Spin structure is a Spin boundary iff the mod 2 index vanishes) `atiyah1971 line 419` and Theorem 3′ (2^(g−1)(2^g+1) bounding Spin structures) `line 432`, both on p.58 (`line 415`); SpinGeometry lifts: R03.
- 8.3 (B3.3): StringOrientation S2.3 as above; the Lie-framed T³ as η³ = 12ν is this roadmap's computation (table).
- 9.3 (B3.8): Borel–Hirzebruch Theorem 19.4 (a generator u of H⁸ with p(W) = 1+6u+39u²) `borelhirzebruch1958 line 3021`, 19.5 index 1 `line 3027`.
- 10.2 (B6.4): Führing §3 (closed fibre, p.359) `fuhring2022 line 175` and Proposition 3.4 (p.362) `line 332`, as in the previous report; Theorems 1.1 and 1.3 `lines 18`, `66`.
- 10.4 (B6.6): Kreck–Stolz Proposition 4.2 `kreckstolz1993 line 494` p.244 and Lemma 4.3 `line 511` p.245: s_n(P(E_r)) = −2a_r with a_r = binom(2n,2(r+1))−1, and the gcd 2^(a(n))·p when 2n+1 is a p-power with a(n) = 2 for n = 2^j−1, else 1, exactly the README's statement; Rosenberg–Stolz Theorem 3.3 `rosenbergstolz line 302` p.8 (kernel of α equals the HP²-bundle subgroup; 2-local in Stolz, odd primes in Kreck–Stolz, `lines 309–313`). Stolz 1992 and Anderson–Brown–Peterson: not verifiable.
- 8.4: Benedetti–Lisca Theorem 1 `benedettilisca line 15` p.1, §2.1 `line 74`.

### Ownership

The diff removes a construction rather than adding one. The Spin-surface quadratic refinement and the ΩSpin₂ filling theorem are claimed here (8.1–8.2) and by no roadmap on main or in the brief's checkouts: GeometricTopology at #903 owns the generic finite algebra and the Seifert/knot refinement and names TangentialBordism as the consumer for the Spin-surface refinement (`rev/903 README.md:1391`); FourManifolds #936 §1.4 builds the knot/proper-link Arf invariant (`:493–534`), which overlaps GeometricTopology 4.3.1, not this roadmap; HomotopySpheres #1287 consumes the refinement (`:781`). Ownership against open pull requests whose files the brief does not supply was not checked.

### Adversarial mathematics table

New rows were computed in this review; rows marked r4/r5 carry the values computed in PRREVIEW-TangentialBordism~4 and ~5 for passages the diff leaves untouched (re-read, not recomputed).

| Statement / target | Instances tried | Values computed on both sides | Result / change |
| --- | --- | --- | --- |
| 1.1 Check: zero refinement | V = 0, m = 0 | empty basis sum 0; Gauss sum over one vector = 1; count formula not applied at m = 0 (count 1) | Pass, new |
| 1.1 Check: hyperbolic plane | q = xy on F₂² | values (0,0,0,1) on (00,01,10,11); Arf = q(1,0)q(0,1) = 0; Gauss 3−1 = 2 = +2¹; q-zero lines spanned by (1,0) and (0,1) | Pass, new |
| 1.1 Check: anisotropic plane | q = x²+xy+y² | values (0,1,1,1); Arf 1; Gauss 1−3 = −2; no nonzero q-zero vector; zero count 1 = 2¹−1 | Pass, new |
| 1.1 Check: two anisotropic planes | A⊕A on F₂⁴, diagonal {(v,v)} | q(v,v) = 2q(v) = 0 on all four diagonal vectors, dimension 2 = m; Gauss (−2)² = 4; zero count 10 = 2³+2 | Pass, new |
| 1.1 Check: Lie-spin torus realizes A | q(a) = q(b) = 1 | q(a+b) = 1+1+a·b = 1; Arf = 1; matches 8.1's torus Check | Pass, new |
| 1.1 interface vs GT 4.3.1 text | each listed law | symplectic-basis formula, basis independence, isometry invariance, additivity, plane classification, Gauss sum, counts, Lagrangian criterion all stated at `rev/903 README.md:1367–1398`; nothing on main | Fails on main: R01 |
| 8.4 parallelization headline: empty M | M = ∅ | frame is the empty function; positivity and both ContMDiff conditions vacuous | Pass, new |
| 8.4 headline: ℝ³ and half-space | coordinate frame, chart = id | det = 1 > 0; both bundle maps are products, smooth | Pass, r4 |
| 8.4 headline: wrong-orientation frame | negate e₁ | det = −1, fails positivity in the same atlas | Excluded, r4 |
| 8.4 headline: nonorientable guard | RP²×ℝ | w₁ ≠ 0, no oriented atlas, hypothesis fails; statement not asserted | Pass, r4 |
| 8.4 headline: countable union of half-spaces | componentwise frames | det 1 on each component; no compactness used | Pass, r4 |
| 8.4 obstruction dimensions | BS³, 3-complex | first obstruction in H⁴ = 0 | Pass, r4 |
| 5.6 graph-embedding ranks | (d,e,r) = (0,1,1),(0,1,2),(2,2,5),(1,3,3) | normal rank r+e−d = 2,3,5,5; shift r − rank = d − e = −1,−1,0,−2 | Pass, r5 |
| 5.6 point into oriented circle | d = 0, e = 1, n = 1 | shift −1; degree-one cycle has one positive preimage | Pass, r5 |
| 6.2 field duality without finiteness | infinite wedge of circles | H¹ = ΠF₂ = Hom(H₁,F₂) | Pass, r5 |
| 6.2 why a field | RP² with ℤ versus F₂ | Hom(H₁(RP²;ℤ),ℤ) = 0; over F₂ the pairing is nonzero | Pass, r5 |
| 6.2 point numbers do not detect over X | id: S¹→S¹ | all point numbers 0; joint number 1 | Pass, r5 |
| 9.4 Borel–Hirzebruch conversion | k = 1,2,3 | (1,0), (1,2,7), (1,4,12,8); p₁ = (2q−4)u | Pass, r5 |
| 9.4 sign conversion | quaternionic line as ℂ²-bundle | Chern roots ±x₁, c₂ = −u; p(HP²) = 1+2u+7u² | Pass, r5 |
| 10.2 closed-fibre boundary | F = S¹, base I | ∂(I×S¹) coefficients (+1,−1), sum 0 | Pass, r5 |
| 10.2 interval-fibre exclusion | F = I, base pt, A = ∅ | two boundary points, no map to ∅ | Excluded, r5 |
| Conventions: tangent/normal inverse; boundary | oriented point; positive I | inverse 0; ∂I = [1]−[0] | Pass, r4 |
| 2.1 fixed-face transversality | f(t) = t fixed at 0; f(t) = 1+t | face rank 0 < codim 1; second misses Z | Pass, r4 |
| 2.1 tubes/rounding/doubles | I ⊂ I×ℝ; quadrant; I, ∅ | normal rank 1; one boundary arc; doubles S¹, ∅ | Pass, r4 |
| 2.2 zero-dimensional orientation; product sign | ±pt; two lines; pt×line | two rays, one empty basis; −1, +1 | Pass, r4 |
| 2.2 half-space orientation | I endpoints; dimension 3 | signs +,−; det +1 | Pass, r4 |
| 2.3 quotient adapters; disc/sphere bundle | ℤ on ℝ; irrational flow; ranks 1,0 | S¹ Hausdorff; not Hausdorff; ∂D¹ = S⁰, D⁰ = pt | Pass, r4 |
| 2.4 collared witnesses | I×M; reversed; empty | boundary M−M = 0; reversal flips signs | Pass, r4 |
| 2.5 relative-cycle face | (I,∂I)→(I,∂I); →(pt,∅) | second impossible | Pass, r4 |
| 2.6 small representatives | ∅; one point; two points in ℝ⁰ | cardinalities 0,1; ℝ⁰ cannot separate two | Pass, r4 |
| 2.7 quartic / reversal / E(1) | degree 4; F = 3H−ΣE_i | χ = 24, p₁ = −48, σ = −16, Â = 2; reversed +48, +16, −2; F² = 0, χ = 12, σ = −8 | Pass, r4 |
| 3.1 inverses | O points; SO signed points | 1+1 = 0; +1−1 = 0, +1+1 = 2 ≠ 0 | Pass, r4 |
| 3.2 external product / intersection | signed points; lines in RP² | (+)(−) = −; swap −1; 1 mod 2 | Pass, r4 |
| 3.3 connecting map / excision | (I,∂I); (X,X); two points | ∂[I] = [1]−[0]; 0; F₂² or ℤ² | Pass, r4 |
| 3.4 orientation map | pt, ∅, points over x,y | 1,0,(1,0),(0,1) | Pass, r4 |
| 4.1 diagonals / Sq / Cartan / Adem | edge; a ∈ H¹(RP∞); a²; Sq¹Sq¹a | ∂(−e⊗e) = AW−T·AW; Sq¹a = a², Sq²a = 0; Sq²a² = a⁴; 0 | Pass, r4 |
| 4.2 simple system / transgression / Adams d₂ / completion | F₂[a]; K(F₂,2); (1,2); Prüfer | a⁴ new; d₂:(0,1)→(2,0); target (3,3); 0 versus ℤ₂ | Pass, r4 |
| 4.3 Wu / Thom relation | RP²; trivial line; tautological | Sq(1+a) = 1+a+a² = w; SqU = U; Sq¹U = aU | Pass, r4 |
| 4.4 odd operations / Kudo / Milnor degrees | p = 3 | P¹y = y³; τy = 2βι₂; ξ₁ degree 4, τ₀ degree 1 | Pass, r4 |
| 5.1 collapse / stabilization | framed point; trivial line | degrees +1, 0; S¹→S² degree +1 | Pass, r4 |
| 5.2 finite embedding dependence; low rank | a+,b+,a−,b−; n = k = 0 | word length 4 vs 0, abelianize 0; ℝ⁰ holds ≤ 1 point | Pass, r4 |
| 5.3 inverse | degree-one and constant | +pt and ∅ | Pass, r4 |
| 5.4a–c transformation / relative / stable | X = {x,y}; (I,∂I); commutator | (1,0),(0,1); +1−1; stabilized 0 | Pass, r4 |
| 5.5 framed comparison | +pt; η³ | 1↦1; 12ν ↦ 0 in ΩSpin₃ | Pass, r4 |
| 5.7 AHSS | pt; degree 0; two components | only p = 0; (0,0); two copies of Ω₀ | Pass, r4 |
| 6.1 multiplicities | degrees 0–4 | 1,0,1,0,2 (x₄, x₂²) | Pass, r4 |
| 6.3 unoriented generators / exception | RP², RP⁴, H_ℝ(2,4), H_ℝ(1,2) | s = 1,1; binom(6,2) = 15 = 1; Klein bottle 0 | Pass, r4 |
| 6.4 odd Spin/SO; stable/fixed rank | π₄ at p = 3; oriented 2-planes | 16 a unit; Euler class only unstably | Pass, r4 |
| 6.5 rational rank / hypersurface / gcd | degrees 4,8; H_ℂ(2,3); N = 2..12 | 1,2; s₂ = −10; 2,3,2,5,1,7,2,3,1,11,1 | Pass, r4 |
| 6.6 Wall lift / derivations / torsion product | RP²; σ₄; Y₆Y₅ | H¹(RP²;ℤ) = 0; ∂₂σ₄ = σ₂, ∂₂² σ₄ = 1; Y₅² ≠ 0 | Pass, r4 |
| 7.1 ABS normalization / Clifford signs | +pt; circle; K3 | 1, η, 2u²; squares −1, +1 | Pass, r4 |
| 7.2 low comparison / degree 8 | degrees 0–7; 8 | ℤ,ℤ/2,ℤ/2,0,ℤ,0,0,0; ranks 2 vs 1 | Pass, r4 |
| 8.1 surface refinement | standard torus | q(a+b) = q(a)+q(b)+a·b both cases | Pass, r4 (recomputed above) |
| 8.2 filling criterion / handle | genus 0,1,2; A⊕A | 1,3,10 of 1,4,16; diagonal q-zero plane | Pass, r4 (recomputed above) |
| 8.3 Spin three-manifolds | T³; S³ | 0; 12ν ≠ 0 forgets to 0 | Pass, r4 |
| 8.4 tables; CP² = RP²×RP² in ΩO₄ | degrees 0–4; (w₄,w₂²) | as listed; (1,1) both | Pass, r4 |
| 8.5 projective fillings / twistor sign | n = 1,2; q = 1 | ∂D² = RP¹; S³/±1; fibre S²; det −4 | Pass, r4 |
| 9.1 idempotent charts | v = (1,0,0),(1,1,0); 0; id | P² = P, trace 1; traces 0,3 excluded | Pass, r4 |
| 9.2 Clifford relations / volume | nine generators; flip C₈ | 2δI₁₆; −I₁₆ vs +I₁₆ | Pass, r4 |
| 9.3 normal Bott / OP² data | OP¹ ⊂ OP²; p₂ = 6u, p₄ = 39u² | e(ν) = u, ∫u = 1; (381·39−19·36)/14175 = 1 | Pass, r4 |
| 9.4 obstruction table / HP² signature | RP², CP², HP², OP² | w₁ = a; w₂ = h; λ = u; H⁴ = 0; (49−4)/45 = 1 | Pass, r4 |
| 10.1 realization range / degree 7 | C₃ even; lens product | H_even>0(C₃;ℤ) = 0; coefficient 2 ≠ 0 in F₃ | Pass, r4 |
| 10.3 kernels / semidirect / degree 5 | RP², CP²; conjugation; P(1,2) | nonzero generators; degree +1, i↦−i; ∫w₂w₃ = 1 | Pass, r4 |
| 10.4 isotropy / PSC / BG / Sq tables / Gysin / KO Pontryagin / cover index / Ext / Newton | as in ~4 | 1+1 = 0 in π₁SO₈; Scal ≥ 56; w₈ = w₁₂ = 1; all differences 0; π!u₄² = 1; π₁ = [ℓ_ℝ]−2; k = 0,8,10; a² = 4b; −10, −28, gcd 28 | Pass, r4; Newton values rechecked against Lemma 4.3: −2(6−1) = −10, −2(15−1) = −28 |

The new rows exclude the plausible wrong models for the moved interface: a definition of Arf with the pairing ignored (would give 0 on the anisotropic plane), a Gauss sum normalized by 2^(2m) (would give 1/2 on the hyperbolic plane), and a Lagrangian criterion dropping the dimension (the hyperbolic plane's zero vector alone would qualify). None of these affects the verdict: the algebra is correct wherever it lives; the finding is where it lives.

## Not verifiable

- GeometricTopology §4.3.1 is verifiable only at #903's head (read there); on main it does not exist, which is R01, not an unverifiable item.
- Lee, *Introduction to Smooth Manifolds* (Springer, paywalled); Milnor 1960 (JSTOR); Atiyah–Bott–Shapiro (Elsevier); Anderson–Brown–Peterson (JSTOR); McCleary (Cambridge); Stong (publisher page); Gompf–Stipsicz (AMS); Stolz 1992 (JSTOR); mathlib4#31350 (not a text in the cache): cited by locator alone, as in the previous reports. No `sources.toml` exists for this roadmap and nothing was edited.

## Source issues

- none
