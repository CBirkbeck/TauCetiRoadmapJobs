# Review of HomotopySpheres (pull request #1287 at 93d7033)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/HomotopySpheres/` at `93d7033`. The folder changed by 263 README lines since `29eac99`, the head the previous review read; `Suggested.lean` and `metadata.toml` are unchanged. Main is at `1bea8354`; it does not carry a `HomotopySpheres` folder, so this pull request adds the roadmap (its baseline is #284, which still conflicts in both files). Line numbers of other roadmaps refer to their README at the commit named.

## Previous findings

- **Old R01 (1.2 restates GeometricTopology §1.3.1): repaired.** README:604–615 now consumes §1.3.1's Morse functions on a triad, the regular-band product (Milnor, Theorem 3.4, p.21) and the elementary handle step (Theorem 3.13, p.31), and keeps here the ordered decomposition as a structure, reordering, cancellation, slides and the elementary-cobordism homology (Theorem 3.14, Corollary 3.15, p.32). README:381–382 says the smooth form of `TauCeti.exists_bandHomeomorph` is §1.3.1's regular-band theorem; 2.2's *Needs* (:756) and Layer 1's Dependencies (:731–733) cite §1.3.1; the contract paragraph (:406–411) lists it. Checked against main's GeometricTopology README:888–937.
- **Old R02 (GeometricTopology citations that main no longer supports): repaired.** Scope (:90–102) names §§1.1–1.5, §4.3.1 and Layer 11.3 and says surgery in general dimension is Tau Ceti's `TauCeti.SphereSurgery` with the smooth surgered manifold owned here as the outgoing boundary of the trace; the contract (:400–424) matches main's GeometricTopology §1.1 (:788), §1.2 (:822), §1.3 (:851, handle attachment of `Dᵏ × Dⁿ⁻ᵏ` along `Sᵏ⁻¹ × Dⁿ⁻ᵏ → ∂M` with the corner straightened), §1.4 (:939), §1.5 (:974, uniqueness up to isotopy and the retraction), §4.3.1 (:2430) and 11.3 (:7887, unique up to PL homeomorphism). 7A.3 (:2455–2466) and 7A's Dependencies (:2493) cite §1.3, §1.5 and `TauCeti.SphereSurgery`; 2.1 (:742) and Layer 2's Dependencies (:886–887) cite Layer 11.3; 6B's *Needs* (:2342–2344) cites §1.1, §1.3 and §1.5 and says the plumbing is owned here; the non-Mathlib items left the "From Mathlib" list. The test instance of old R02 is now 7A.3's first Check (:2470), and it is correct (see the table).
- **Old R03 (`gap:finite-quadratic-arf` cited as a supplier): repaired.** README:516–518, :2597, :2623–2630, :2660 and :2908 cite GeometricTopology §4.3.1 for the finite quadratic Arf algebra; the word `gap:` no longer occurs. TangentialBordism at #942 (`f212a45c`, a newer head than the last review read) has no `gap:` and its B3.2(a) (README:421, :114) consumes GeometricTopology Layer 4.3.1, as README:2630 now says.
- **Old R04 (BordismFormalGroups revisions own the James construction and the Toda brackets): not repaired.** Carried as R01 with the heads of today.
- **Old R05 (#1742, #1799, #851 own objects of 3B, 4A–4B, 7B): not repaired.** Carried as R02.
- **Old R06 (9.7 cites Kervaire–Milnor §§4–6 for the Arf invariant): repaired.** README:2954–2963 and :3333–3336 cite Theorem 5.1 (p.512) for bP₇ = 0, §8 (pp.534–535) for the quadratic function and c(M) with their restriction to odd k ≠ 1, 3, 7, §7 Case 1 (p.528) and Browder for the framed refinement. Verified in `kervairemilnor1963`: Theorem 5.1 at line 346 (p.512); "Case 1. Let k = 3 or 7 … any imbedded k-sphere will have trivial normal bundle" at lines 903–908 (p.528); "Henceforth we will assume that k is odd and ≠ 1, 3, 7" at line 1127 (p.534); the definition of c(M) at line 1146 and Lemma 8.4 at line 1150 (p.535).
- **Old R07 (6A.3 and 8.1 attribute the almost-framed group to Kervaire–Milnor Part I): repaired.** 6A.3 (:2042–2051) is now "Normal-frame model", says Part I uses normal frame fields on all of a closed manifold (§4, p.510) and defines no almost-framed group; 8.1 (:2678–2683) says the forgetting map is a construction on 6A's carrier and compares it with the classes `p(M, Φ)` and the coset `p(Sⁿ) = im Jₙ` (Lemmas 4.2 and 4.5, the Remarks after Theorem 4.1, pp.510–512). Verified: the definition of bP_{n+1} and of `p(M, Φ)` with "a specific field Φ of normal k-frames" at lines 238–256 (p.510); Lemma 4.2 at 257 (p.510); Lemma 4.5 at 292 (p.511); the Remarks identifying `p(Sⁿ)` with the image of J at 316–319 (p.512). 6B.4 (:2230–2233) and 6C.1 (:2358–2360) carry the same attributions and are correct.
- **Old R08 (branch pins differ from the pins the README is written against): not repaired.** Carried as R03, now with one more declaration.

## R01 (P2) — Three open revisions of BordismFormalGroups own the James construction and the Toda brackets that 3B and 3C.3 own

**Location.** README 3B.1–3B.4 (:1052–1092), 3C.3 (:1237–1253), and :3266–3267, "BordismFormalGroups consumes the James stages of 3B in F6.2 and the Toda brackets of 3C.3 in F4".

**Claim.** On main the sentence at :3266 is true: main's BordismFormalGroups README:331 consumes "HomotopySpheres Stage 3C's three-fold Toda brackets" and :668 "HomotopySpheres 3B's actual James stages". Each open revision of BordismFormalGroups instead owns both objects, and the description of this pull request does not mention them. When any of them merges, the James reduced product with its word filtration and the three-fold Toda brackets have two owners, and :3266–3267 becomes false.

**Witness.** "Own the three-fold Toda brackets of pointed spaces" and "Own the James construction" are at BordismFormalGroups README:999 and :1509 at #1807 (`edec751`); :944 and :1475 at #1808 (`400e9ea`); :1017 and :1564 at #1854 (`200e4f3`). None of the three mentions HomotopySpheres.

**Repair.** One owner, settled either way:
- keep this roadmap as the owner, as main's BordismFormalGroups has it, and record in the description that #1807, #1808 and #1854 must turn their "Own" sentences (F4, F6.2) into citations of 3C.3 and 3B before they merge; or
- a recorded human decision that moves ownership to BordismFormalGroups: then 3B.1–3B.4 and 3C.3 become citations of F6.2 and F4 as they are at those heads, the merge-order paragraph names that revision, and :3266–3267 is deleted.

Test on the instance that separates the two: the Check at :1200, `ΣJ₂(S¹) ≃ S² ∨ S³` with H₂ of rank 1 against rank 3 for Cartesian powers. Exactly one roadmap may state the filtration quotient `J_r X / J_(r−1) X ≅ X^∧r` that this Check uses.

## R02 (P2) — Three later open roadmaps own objects this roadmap owns

**Location.** README 3B.1–3B.4 (:1052–1092), 4A.1 (:1471–1482), 4B.1–4B.8 (:1612–1726), 7B.2–7B.4 (:2507–2540).

**Claim.** Unchanged since the last two reviews. All three roadmaps come after this one in `ORDER.txt` (HomotopySpheres 45, DGFloerPartII 46, GeometryOfNumbersAndQuadraticArithmetic 55, GeneralAlgebraicKTheoryPartII 335), and each still owns an object of this roadmap without citing it:
- GeneralAlgebraicKTheoryPartII (#1742, `ca44359`) owns J(W), its word filtration, the James map and the connected James equivalence. Its HomotopySpheres contract cites only §3B.6.
- DGFloerPartII (#1799, `ba8a414`) owns stable O, the finite-to-stable range, the Bott maps and real Bott periodicity.
- GeometryOfNumbersAndQuadraticArithmetic (#851, `3b084ef`) owns Wall's forms and formations and the odd L-groups.

**Witness.**
- #1742 README:1212 is "### 4.30b The James reduced product", defining `JamesReducedProduct` and its word filtration; README:196–198, "From TauCetiRoadmap.HomotopySpheres", consumes §3B.6 only.
- #1799 README:1330 is "### 4.2a Stable orthogonal groups and the finite-to-stable range" and :1442 "### 4.2c Index bounds, the Bott maps and real Bott periodicity"; HomotopySpheres is mentioned 0 times.
- #851 README:2777 defines `WallFormation R ε` from Ranicki §2; HomotopySpheres is mentioned 0 times.

**Repair.** Name #1742, #1799 and #851 in the description as consumers whose sections become citations before they merge: #1742's §4.30b of 3B.1–3B.4, #1799's §§4.2a–4.2c of 4A.1 and 4B.1–4B.8, #851's §6.8 of 7B.2–7B.4. The alternative is a recorded human decision for the reverse settlement, with the corresponding sections here rewritten as citations. Test: the value `π₈(O(n)) ≅ ℤ/2` for n ≥ 10 is a `Suggested.lean` headline here (`nonempty_orthogonalGroup_eighthHomotopyGroup`); the same entry is #1799's 4.2c output, so one of the two files must not declare it.

## R03 (P3) — The branch pins Tau Ceti `a91d3aa` and Mathlib `6b7abb3`; the README cites declarations that exist only at main's `2fd255d` and `1b1ccf4`

**Location.**
- `lake-manifest.json`, unchanged (Tau Ceti `a91d3aafa`, Mathlib `6b7abb3c`; main pins `2fd255d9` and `1b1ccf4b`).
- README:340–398 ("From Tau Ceti"), :97, :405, :2431, :2455–2456, :2463, :2494, :3287 (`TauCeti.SphereSurgery`), :336 and :3127 (`padicValRat_bernoulli`, line 696), :324 (`sSetTopAdj`, line 74).
- `Suggested.lean`:2–3 and :9–11, the workaround import and the sentence explaining it; :38 "The pins have that connected sum".

**Claim.** Not repaired. The README names Tau Ceti declarations, with files and lines, that are absent at the pin this branch builds against, and this head adds one more: `TauCeti.SphereSurgery`, which 7A.3 now makes the carrier of the surgered manifold.

**Witness.** At `a91d3aa` (the branch's `.lake/packages/TauCeti`) a search finds no `SphereSurgery`, `TauCeti.Manifold.Orientation`, `…IsOrientationPreservingAt`, `TauCeti.OrientedConnectedSum`, `TauCeti.degreeAtRegularValue`, `TauCeti.dense_isRegularValue` or `TauCeti.exists_bandHomeomorph`. At `2fd255d9` every cited line is exact: `SphereSurgery` is `TauCeti/Topology/Surgery/Basic.lean`:189, with `sphereExterior φ` the complement of `φ(Sᵏ × int Dᵠ)` (:138) as 7A.3 describes; the other 25 Tau Ceti lines and the 6 Mathlib lines are listed under Verified sound. In Mathlib at `6b7abb3`, `padicValRat_bernoulli` is at line 689 and `sSetTopAdj` at line 73.

**Repair.** Unchanged: merge main when rebasing, so that the manifest pins `2fd255d9` and `1b1ccf4b`, and rebuild. Then replace `Suggested.lean`:3 by `import TauCeti.Geometry.Manifold.Orientation.OrientedAtlas` and delete :9–11; :38 is then true as written. Test: `lake env lean` on the branch today exits 0 only because the file imports no module that is missing at `a91d3aa`; the README's `TauCeti.SphereSurgery` citation is a claim about a pin the branch does not have.

## Verified sound

**Gate and dependency check** (my runs at `93d7033`):

```text
gate HomotopySpheres: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
depcheck: 235 roadmaps, 2259 edges, 0 problem(s)
```

- The gate includes the targeted build (`build=0` in the worker's run). The dependency check prints no UPWARD, CYCLE or `moved:` line; the open suppliers are earlier in `ORDER.txt` (IndexTheory 10, StringOrientation 11, TangentialBordism 14; HomotopySpheres 45). None of TangentialBordism #942, IndexTheory #1077, GeometricTopology on main or AlgebraicTopology #1652 cites HomotopySpheres as a supplier; StringOrientation #948 mentions it once (README:100) as a remark that S2.3 does not consume it.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/HomotopySpheres'` is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml` (`topic = "math.GT"`).

**Elaboration, signatures, padding** (branch pins, since Lean runs only there):
- `lake env lean` on `TauCetiRoadmap/HomotopySpheres/Suggested.lean` exits 0 with 16 `declaration uses 'sorry'` warnings and nothing else.
- A scratch copy with `#check @name` for the 19 declarations (3 definitions, 16 theorems; the worker's count of 21 includes two docstring fragments) exits 0. Every hypothesis is in the declaration's own signature; the file has no section `variable` beyond `universe u`. Compared with the README: `5 ≤ n`, `[T2Space W] [CompactSpace W] [SimplyConnectedSpace W]`, `IsClosed ↑M₀` and both homotopy-equivalence hypotheses on the h-cobordism theorem (:682–693); `0 < n` on `sphere_parallelizable_iff` (:670–673); `k + 11 ≤ n` and the ranks 4, 5, 6, 7, 8, 9, 10 on the Bott entries (:1702–1720); `6 ≤ n`, `7 ≤ n`, `8 ≤ n`, `9 ≤ n` with every basepoint on the stems (:2799–2801, :2873–2874, :3036–3038); `[T2Space M] [SecondCountableTopology M] [CompactSpace M] [IsManifold (𝓡 6) ∞ M]` and both `IsOrientedAtlas` hypotheses on the recognition theorems (:3218–3224). Nothing changed.
- One-tactic probe on a scratch copy: each of the 16 theorems with `first | rfl | infer_instance | trivial | decide | (simp; done) | (norm_num; done) | (aesop; done) | exact ⟨inferInstance⟩ | …` fails to close, 16 of 16 (14 fall through to `sorry`; `sphere_parallelizable_iff` and `nonempty_diffeomorph_sphere_six` reach a non-closing alternative with unsolved goals). No declaration restates a definition, mirrors a Check or computes a small value.
- Headlines against the docstring: stated are the h-cobordism theorem, the parallelizable spheres, Bott periodicity with the entries for degrees 2–8, stems 4–7 and both recognition theorems; named as not statable are Θₙ and Θ₆ = 0, the stable stems with J and Pontryagin–Thom, James/EHP/splitting, Hopf invariant one, Aₙ, Pₙ, Lₙ and the exact sequence, Θ₇ and the E₈ results. At both pins there is no suspension homomorphism on `HomotopyGroup`, no framed bordism group and no pointed topological mapping cone with a Hopf invariant, so the list is right.

**Library declarations opened** (every README line, at main's pins `2fd255d9` and `1b1ccf4b`):
- Tau Ceti: `Orientation/OrientedAtlas.lean`:283 (`IsOrientedAtlas`, requiring `[NeZero n]`, covering and lying in the maximal atlas) and :129; `Orientation/Basic.lean`:32; `Orientation/Preserving.lean`:63; `Boundary/Charts.lean`:195, :321 and :374 (the last two with `k ≠ 0`, as :353 says); `ConnectedSum/Oriented.lean`:128, :143, :155, :160, :208, :222, :238 and :295; `ConnectedSum/Orientation.lean`:250; `Sard/EqualDimension.lean`:105 and :112 (`[LindelofSpace M]`, equal finrank); `Degree/Basic.lean`:76; `Morse/Deformation.lean`:259; `AlgebraicTopology/Sphere/SimplyConnected.lean`:408 (`2 ≤ n`); `Topology/Homotopy/MappingCylinder.lean`:87 and :425; `LowDimTopology/Plumbing/E8.lean`:63 (chain 0–6 with the edge (2,7), weight −2 everywhere, as the Check at :2337 says) and :199; `Plumbing/IntersectionForm.lean`:108; `Topology/Surgery/Basic.lean`:189 and :138.
- Mathlib: `SingularSet.lean`:50, :66, :74; `CompactlyGeneratedSpace.lean`:68; `Bernoulli.lean`:696 (`0 < k`, `p − 1 ∣ 2k`, as :336–338 states); `PoincareConjecture.lean`:41 (`[T2Space M]` only, as :547–550 states).

**Cross-roadmap citations resolved today** (main `1bea8354` unless a head is named).
- GeometricTopology: §1.1 (:788), §1.2 (:822), §1.3 (:851), §1.3.1 (:888, with Existence :898, Regular bands :905, The elementary handle step :912), §1.4 (:939; Associativity :956), §1.5 (:974), §4.3.1 (:2430), Layer 11.3 (:7887); the handle calculus is disclaimed at :156–161 and plumbing assigned to Part II at :211, as :99–102 says.
- AlgebraicTopology on main: Stage 4 (:499), Stage 6 (:946), Stage 8 (:1602), 8.11b (:113). Stage 4 item 8, "Compact generation and the pointed adjunction", exists only at #1652 (`946a78a`, README:1571, with the map at :725); the description names #1652 in the merge-order chain.
- TopologicalKTheory T1.5a (:364), T1.6c (:647), T1.6d (:721), T2 (:757), T4 (:1036), T7 (:1517). CharacteristicClasses C1.2b (:599), C6 items 2–3 (:1731 ff.), C7 item 3 (the native `TSⁿ → x^⊥` isomorphism and the radial normal line, as 3C.5 consumes). GeneralizedCohomology G2 items 4–5, G4.0a–b (:39–41), G5 item 6 (:2212). SpinRepresentations Layer 7 (`RepresentationTheory/SpinRepresentations/README.md`:881). DGFloer Layer 1 items 2 and 4. MorseTheory M3 (:453), M5 (:857). RiemannianGeometry R3 (:369, Freudenthal at its item 4), R3.3c (:560). ComplexKahlerGeometry K7.1. SpinGeometry G4 (:395), G6 (:569). HeegaardFloer Lanes M and F0. DifferentialGeometry Layer 2 (:341), Layer 3 (:371), 5.1 (the outward-first `boundaryOrientation`). Completed/UniversalCovers.
- TangentialBordism at #942 (`f212a45c`): B3.2(a) (:421), B1.6 (:457), B1.1 (:727), B1.2 (:900), B4.1 (:1182), B4.2 (:1242), B4.7 (:1326), B5.2 (:1486), B3.2(b) (:2344), B3.2(c) (:2377); no `gap:`. StringOrientation at #948 (`07f09815`): S2.2 (:551), S2.3 (:607). IndexTheory at #1077 (`6d85f5d4`): I7.2 (:1371), I7.5 (:1514).
- Downstream: FourManifolds at #936 (`46ee76a9`) takes the E₈ plumbing from 6B (:66, :658, :689) and the L-groups from 7B (:290); PositiveScalarCurvature on main cites §§1.2–1.6, Layer 2, §3C, Layers 6–8 and §9A.1 (:87–92); BordismFormalGroups on main consumes 3C (:331) and 3B (:668). Eleven roadmaps on main mention HomotopySpheres, matching :3264–3273.
- Overlaps (`scratch/overlaps.md`): #284 (`fb7c47e`) conflicts in both files; it is the baseline this pull request carries forward, as the description says, and the two cannot both merge. No cited id is dropped by an open pull request. The vocabulary neighbours TangentialBordism, FourManifolds, DGFloerPartII and AlgebraicTopology were read for ownership: only DGFloerPartII overlaps (R02).

**Ownership.** This roadmap is the earliest owner of h-cobordism and the handle calculus (GeometricTopology disclaims it; FourManifolds consumes it), Θₙ, James/EHP/Toda (3B–3C), stable SO, Bott and J (4A–4C), Aₙ, Pₙ and the Wall comparisons (6–8), the low stems (9, 9A), the E₈ plumbing family (6B, consumed by FourManifolds) and six-dimensional recognition (10). The exceptions are the later second owners in R01 and R02.

**Seeded sample** (15 targets, all sound at the source; the two findings that touch them are R01–R03's ownership and pins, not locators).
- 1.5, 1.6: `milnor_hcobordism` (printed page = PDF page − 5), Theorem 6.6 at lines 1841–1857 (p.71): dimensions r, s, `r + s ≥ 5`, `s ≥ 3`, injectivity of `π₁(V − M′) → π₁(V)` when r = 1, 2, M oriented and the normal bundle of M′ oriented, the loop of two embedded arcs missing the other intersections; the remark that connected M, M′ with r ≥ 2 and simply connected V need no explicit loop at 1860–1867 (p.72); Lemmas 6.10–6.12 at 2049–2058 (pp.79–80); the λ = 2 case of the proof of Theorem 6.4, `π₁(V₀ − S_L) = 1` from `n − λ − 1 ≥ 3` and van Kampen, at 1885–1894 (pp.72–73). 1.5's hypothesis p, q ≥ 3 makes the injectivity clause unnecessary, and 1.6 is exactly the (2, 3) case.
- 2.1: GeometricTopology Layer 11.3 (:7887) and AlgebraicTopology Stage 8 item 7.
- 2.2: Theorem 3.4 at 582 (p.21); Theorem 8.1 at 2613 (p.100); the twisted-sphere remark at 2875 (p.110); Kervaire–Milnor Lemmas 2.1–2.2 at 70–107 (pp.505–506); GeometricTopology §1.4's associativity (:956).
- 2.3: Lemma 2.3 at 108–124 and Lemma 2.4 at 125–136 (pp.506–507): the half-disc `H²`, the identification `i(tu) × θ ↦ u × ((2t−1) sin θ, (2t−1) cos θ)` for `½ < t ≤ 1`, the deformation retract and the pair-sequence/duality argument, as README:1114–1127 restates.
- 5.0b: `hatcher_at` Examples 4.45 and 4.46 at 16405 and 16424 (pp.377–378); `atiyah1971` Proposition (4.1) at 419 and Theorem 3′ at 432, both on p.58 (PDF page 13 carries the printed number 58).
- 8.2: the proof of Theorem 3.1 at 174–177 (p.508), obstruction class in `Hⁿ(Σ; π_(n−1)(SO))`; Lemma 4.5 at 292 and the Remarks at 316–319 (pp.511–512).
- 8.3: Case 1 at 183 (p.508), `n ≡ 3, 5, 6, 7 (mod 8)`.
- 8.4: Lemmas 4.2–4.5 at 257–307 (pp.510–511); Browder not verifiable (below).
- 9.2: the p.512 table at 320–327; Toda, Gray and Fomenko–Fuchs not verifiable (below).
- 9.5: `snaith2010` (fetched today from arXiv 1001.4751): Example 8.3 at line 1153 states that `S¹ × S¹`, `S³ × S³` and `S⁷ × S⁷` carry framings of Arf invariant one, existence only, as README:2926–2927 says; Definition 3.1 at 253 and §3.1 at 285.
- 9.6: Bott's table gives `π₅SO = π₆SO = 0`, so `A₆ ≅ coker J₆ = π₆ˢ`; the p.512 table gives `Π₆ = ℤ₂`.
- 10.2: Kervaire–Milnor §2, pp.505–507; Theorem 9.1 at 2784 (p.107).
- 10.3: internal construction; `IsOrientationPreservingAt` at the pin.
- 10.4: Proposition B at 2847 (p.109); the Kervaire–Milnor–Wall theorem cited in its proof at 2893 (p.110).
- Also checked today: Theorem 3.13 at 810 (p.31), 3.14 and Corollary 3.15 at 830–834 (p.32), Theorem 4.8 at 1071 (p.44), Theorem 5.4 at 1182 (p.48), Theorem 7.8 at 2565 (p.97), Definition 9.2 at 2804; Kervaire–Milnor Lemma 7.2 at 910 (p.528), Lemma 7.3 at 916 (p.528), Theorem 7.5 at 956 (p.529), the Part II remark on `σ ≡ 0 (mod 8)` at 985–988 (p.530), §8 beginning at 1011 (p.531); `hatcher_vbkt` Theorem 2.16(b) at 2326–2328 (p.59), the `S¹` frame at 196–199 (p.5), the K̃O table at 101–102 (p.1), Proposition 1.14 at 988 (p.25); `hatcher_at` Corollary 4J.4 at 20409 (p.474), the `π₄(S²)` derivation at 20438 (p.475), Propositions 4I.1–4I.2 at 20117–20146 (pp.467–468), the Toda bracket at 16802 (p.387), Exercise 39 at 17033 (p.392), the CW-approximation uniqueness at 15335 (p.352), Proposition A.19 at 23328 (p.537); `ranicki2002` §2 beginning at line 228 (printed p.5), formations defined at 285 (p.6).

**Adversarial table** (values computed today).

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| `exists_diffeomorph_prod_Icc_of_hCobordism` | W = S⁵×I, M₀ = S⁵×0; D⁶ with M₀ = S⁵; (S⁵×I) minus a ball; n = 4 | H₅: ℤ→ℤ at both ends, f = id; M₁ = ∅ fails h₁ (π₀(∅) = ∅ ≠ {∗}); H₅: ℤ→ℤ² fails h₀; excluded by `5 ≤ n` | Pass |
| 1.2 elementary cobordism | one index-λ point, λ = 0 on Dⁿ; λ = 1 on an annulus band | H_*(W,V₀) = ℤ in degree 0 (V₀ = ∅); ℤ in degree 1, generated by the core arc | Pass (Milnor 3.14–3.15) |
| 1.3 trading | n+1 = 6 | remove indices 0, 1, 5, 6; 2–4 remain | Pass |
| 1.5–1.6 Whitney hypotheses | (p,q) = (3,3); (2,3) in V⁵ | r+s = 6 ≥ 5, s = 3, r = 3 needs no π₁ clause; (2,3): r = 2 needs π₁(V∖Q) → π₁(V) injective; attaching circle has codimension 5−1 = 4, so π₁ of its complement is 0 | Pass |
| 2.3 inverse h-cobordism | Σ = Sⁿ; the one-handle model | V = D^(n+1), W = Sⁿ×I, H_n ℤ→ℤ at both ends; one-handle model has π₁ = ℤ, H_n = ℤ² | Pass |
| 2.4 Θₙ | n = 6, 7 | orders 1 and 28 (p.504); [Σ] ≠ [−Σ] for n = 7 since 28 ∤ 2 | Pass |
| 3C.5 exclusion | r = 1…8 | ν₂(3ʳ−1) = 1,3,1,4,1,3,1,5; 2ʳ ∣ 3ʳ−1 exactly for r ∈ {1,2,4} (checked to r = 39) | Pass |
| 3C.5 Clifford frames | Cl(0,1), Cl(0,3), Cl(0,7) | ℂ, ℍ×ℍ, M₈(ℝ)² with modules ℝ², ℝ⁴, ℝ⁸; skew-adjoint with A² = −I gives ⟨x,Ax⟩ = 0, ‖Ax‖ = 1 | Pass |
| 4B.6 λ table | r = 1, 2, 8 | (0,2,8,4,2,2), (2,6,12,6,3,3), (14,30,36,18,9,9); first row excluded at r = 1 | Pass |
| `nonempty_orthogonalGroup_bottPeriodicity` and the entries | (k,n) = (0,11), (3,14), (6,17); ranks 4…10 at degrees 2…8 | ℤ/2 ≅ ℤ/2, 0 ≅ 0, ℤ ≅ ℤ; 0, ℤ, 0, 0, 0, ℤ, ℤ/2 with i = n−2; π₃SO(4) = ℤ², π₇SO(8) = ℤ² excluded by the ranks | Pass |
| 5.0b offsets and Arf | c = 1, 2, 3, 4; Lie torus; two tori | π₃S¹ = 0, π₃S² = ℤ, π₄S³ = ℤ/2, π₆S⁴ = ℤ/2; Arf 1·1 = 1; 1+1 = 0; Whitney bound c+3 = 7 at c = 4 | Pass |
| 6B E₈ family | pinned graph | det = 1, signature −8, entries (2,7) = 1, (6,5) = 1, (0,2) = 0, (7,3) = 0; σ/8 = −1 | Pass |
| 7A.3 surgery trace | unknotted S¹ ⊂ S⁵ = ∂(D²×D⁴), framing from S¹×D⁴ | exterior D²×S³, result D²×S³ ∪_id D²×S³ = S²×S³, H₂ = ℤ; trace S⁵×I ∪ 2-handle ≃ S⁵ ∨ S² (π₁S⁵ = 0) | Pass |
| 7A.3 framing dependence | the other element of π₁SO(4) = ℤ/2 | the nontrivial S³-bundle over S², non-spin (w₂ ≠ 0) ≠ S²×S³ | Pass |
| 7A.3 S⁰ surgery | n ≥ 3; n = 1 | Sⁿ minus two discs = Sⁿ⁻¹×I, plus D¹×Sⁿ⁻¹ = S¹×Sⁿ⁻¹, π₁ = ℤ; at n = 1 the oriented gluing gives two circles | Pass |
| 7B/7C forms | zero module; hyperbolic plane; anisotropic plane; two anisotropic planes | det 1, σ 0, Arf 0; det −1, Arf 0; Arf 1, no nonzero zero; Arf 1+1 = 0, Gauss sum 4, 10 = 2³+2¹ zeros | Pass (GeometricTopology §4.3.1's Check agrees) |
| 8.2–8.3 obstruction group | n = 5…12 | π_(n−1)SO = 0, 0, 0, ℤ, ℤ/2, ℤ/2, 0, ℤ: zero exactly for n ≡ 3, 5, 6, 7 (mod 8) | Pass |
| 8.1 forgetting map | n = 7; n = 6 | J₇(1) ↦ 1 mod 240 in π₇ˢ, both images 0 in A₇; ν² ↦ nonzero in A₆ | Pass |
| 9.2 odd-primary gap | (p,k) = (3,3…7), (5,6), (5,7), (5,15) | 2p−3 = 3, 4p−5 = 7 at p = 3: order 3 at k = 3, 7, zero at 4, 5, 6; 2p−3 = 7 at p = 5: zero at 6, order 5 at 7 and 15 (480 = 2⁵·3·5) | Pass |
| 9.5/9.7 Arf of S³×S³ | framed refinement; normal-bundle refinement | q(a) = q(b) = 1, Arf 1; π₂SO(3) = 0 so every embedded 3-sphere (a, b, the diagonal a+b) has trivial normal bundle, Arf 0 | Pass |
| 9.7 Θ₆ = 0 | exact segment | 0 → Θ₆ → ℤ/2 →(1↦1) ℤ/2 gives Θ₆ = 0; p.504 lists order 1 | Pass |
| 9A.1 e-invariant | 1/240; 2x = 1/120 | 240·(1/240) = 0, 120·(1/240) = 1/2 ≠ 0; solutions 1/240 and 121/240 | Pass |
| 9A.2–9A.3 | p₂ = ±1440, p₁ = 0; (h,j) = (2,−1) | σ = 7·1440/45 = 224, σ/8 = 28; μ = 32/896 = 1/28 both for −E₈ and for the bundle | Pass |
| 9A.4 | k = 2, 3, 4, 5 | −360 ≡ 4 (mod 7); v₂(B₂ₖ) = −1; d₃ = 992/63 (v₂ = 5), d₄ = −2032/15 (v₂ = 4), d₅ (v₂ = 9); formula 2k−2−v₂(k)+v₂(aₖ) agrees; k = 2 gives v₂ = 1, which is why the direct argument is kept there | Pass |
| `sphere_parallelizable_iff` | n = 0, 1, 2, 3, 7, 15 | n = 0: left true (empty frame), right false, excluded; 1, 3, 7 both true; 2, 15 both false | Pass |
| `smoothPoincareSix_oriented` | S⁶ with A = B; reflected atlas; S³×S³; CP³ | transition sign +1; −1, so compose; H₃ = ℤ², H₂ = ℤ fail the hypothesis | Pass |
| 6A.3/6B.4/6C.1 attributions | Kervaire–Milnor §4 | bP_{n+1} and `p(M,Φ)` with a normal k-frame field on all of M are at p.510; no Aₙ, Pₙ, p, i, b in Part I | Pass |
| 9.7 Case 1 | k = 3 | π₂SO(3) = 0 (p.528), so the normal-bundle refinement cannot detect ν² | Pass |

## Not verifiable

- **Browder 1969**, Theorems 1.4 and 3.2, pp.162, 166–168, cited for 8.4, 9.5 and 9.7: the DOI resolves to JSTOR only; recorded in `needs-references.toml`.
- **Bott 1959**, pp.313–315 and 333–336, cited for 4B.6–4B.8 and the λ table: JSTOR only; recorded in `needs-references.toml`. The six λ formulas agree with their Checks (r = 1, 2, 8) but were not read in the source.
- **Gray 2001**, Propositions 2.1–2.4: Springer, paywalled (uncertified). **Toda 1962** (marked uncertified in the README), **Fomenko–Fuchs 2016**, **Wall 1999**, **Milnor, Topology from the Differentiable Viewpoint**, **Milnor, Morse Theory**, **Adams–Atiyah 1966**, **Smale 1961**, **James 1955**: print only or paywalled.
- **Elaboration at main's pins**: Lean runs only in this worktree, which pins `a91d3aa`. Every Tau Ceti declaration was read at `2fd255d9` in the content checkout but not compiled there.

## Source issues

- none
