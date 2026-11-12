# Review of CharacteristicClasses (pull request #1807 at 8cb420c)

**Verdict:** needs changes

## Previous findings

Status of the r71 findings at this head:

- **R01: repaired.** `Suggested.lean:257` states `exists_isSmoothEmbedding_mapFundamentalClass_eq`, and `README.md:1521` names it. Docstring lines 73–77 say the mod 2 form is not statable.
- **R02: repaired.** No "Layer 10" remains. `README.md:1377–1379` now reads: "No separate plane-field Euler class enters: the pinned Euler class of a foliation, `TauCeti.Foliation.eulerClass`, is `TauCeti.eulerClass` of its tangent field."
- **R03: repaired.**
  - C2.4 (`README.md:1497–1501`) and C2.5 (`:1666–1673`) consume the pinned normal bundle, tube and Whitney topologies.
  - `:178` reads "Layers 0–2 and 5–10".
  - The GeometricTopology row reads "§1.5 …, §11.3".
  - One "GT Layer11" is left in C2.3a; it is R04 below.
- **R04: repaired.** `README.md:607–618` names `TauCeti.PrincipalBundle`, `trivializationOfSection` and `division`, and cites TopologicalKTheory T6.4. `:1118` adds T6.4 to the dependencies.
- **R05: repaired.** `README.md:3298–3305` uses ComplexKahlerGeometry K7.1's model comparison and the pinned `OnePoint.diffeomorphProjectivization`.
- **R06: repaired.** `README.md:1518`, `:1521` and `:1546` cite Théorèmes II.26 and II.27 (p. 55), II.1 (p. 29) and pp. 43 and 50. All are confirmed at `thom1954` lines 1499, 1513, 538, 1061 and 1315, and `thom1954` is in the manifest.
- **R07: repaired.** The description carries the requested paragraph and no longer says "the same dependencies". It still omits the DGFloer drop (R05 below).

## R01 (P2) — C1.3 builds the finite faithful representation that LieGroups Layer 7 owns

**Location.** `README.md:940–944` (C1.3): "For compact Lie G prove the no-small-subgroups property … to obtain one finite faithful unitary representation. Prove its smoothness using the continuous-homomorphism theorem of LieGroups." The same claim is at `:17–18` (scope) and `:284`.

**Claim.** One object has two owners. LieGroups, already a supplier of this roadmap and on main, owns the faithful finite-dimensional unitary representation of a compact Lie group.

**Witness.** `RepresentationTheory/LieGroups/README.md:892–898` (Layer 7, on main): "For every compact Lie group G, including all its components … constructs a faithful finite-dimensional unitary ρ:G→U(V), smooth by Layer2." LieGroups cites no CharacteristicClasses, so the citation adds no cycle.

**Repair.**
- In C1.3, replace the three sentences quoted above with: "For compact Lie G take the finite faithful smooth unitary representation G⊂U(N) of LieGroups Layer 7 (finite faithful representations)."
- Drop "finite faithful representations and" from the C1 scope bullet.
- Replace `:284`'s "C1 builds finite faithful representations as the universal-approximation connector." with "C1.3 consumes LieGroups Layer 7's finite faithful unitary representation."
- Add "Layer 7 (finite faithful unitary representations of compact Lie groups)" to the LieGroups row.
- In `:1124–1125`, replace "CompactGroups' Peter–Weyl theorem, LieGroups" with "LieGroups Layer 7".
- Keep the (S¹)^ℕ Check.

## R02 (P3) — C1.5 and C4.2 state theorems with no locator

**Location.**
- `README.md:990–993` (C1.5): "Prove `H*(CP∞;Z)=Z[h]`, `H*(RP∞;F2)=F2[a]` and `H*(RP∞;Z)=Z[y]/(2y)`".
- `README.md:2185–2191` (C4.2): "Construct Chern, trace-character, Pontryagin and Pfaffian forms … obtain exactly the real images of C3's Chern and Pontryagin classes."

**Claim.** Neither target cites a source, although both statements are in texts the manifest already holds.

**Witness.**
- `hatcher-at` line 9541 (Thm 3.19, p. 220) and line 9630 (p. 222: H*(RP∞;ℤ)≈ℤ[α]/(2α)).
- `dupont-ccc` line 3099 (Thm 7.3, pp. 99–100), line 3243 (Thm 7.17, p. 104) and line 3994 (Cor. 8.36(i), p. 130).

**Repair.**
- C1.5: append "(Hatcher, *Algebraic Topology*, Theorem 3.19, p. 220, for H*(RP∞;𝔽₂) and H*(CP∞;ℤ), and §3.2, p. 222, for H*(RP∞;ℤ))".
- C4.2: append "(Dupont, *Curvature and Characteristic Classes*, Theorems 7.3, pp. 99–100, and 7.17, p. 104, for the Chern–Weil Chern and Pontryagin classes and their axioms; Corollary 8.36(i), p. 130, for their uniqueness, hence agreement with C3's classes)".
- Extend both References entries.

## R03 (P3) — C3.1 states Leray–Hirsch more narrowly than its source

**Location.** `README.md:1762–1765`: "general cohomological Leray–Hirsch for a numerable locally trivial fibre bundle with a finite homogeneous family of global classes whose restrictions give a free basis of the entire fibre cohomology".

**Claim.** The source needs neither numerability nor a finite family. The narrowing excludes fibres such as CP∞, and the README's own route (pinned Serre membership, degreewise-finite cochain maps) needs neither restriction.

**Witness.**
- `hatcher-at` lines 18645–18651 (Thm 4D.1, p. 432) take any fibre bundle, with Hⁿ(F;R) finitely generated and free for each n.
- B×CP∞ with the classes h^j meets those hypotheses but not C3.1's.
- `README.md:235` says the pinned Serre membership holds "with no hypothesis on the base".

**Repair.**
- Replace the quoted text with "general cohomological Leray–Hirsch for a locally trivial fibre bundle over an arbitrary base whose fibre cohomology over R is finitely generated and free in each degree, with homogeneous global classes, finitely many in each degree, whose restrictions form a basis of it".
- Keep the finite family only in the compact-support and local-system extensions.

## R04 (P3) — C2.3a still cites GeometricTopology Layer 11 as a whole

**Location.** `README.md:1406–1407`: "take a specified finite compatible smooth triangulation h:|K|≃M from GT Layer11's smoothing-and-triangulation comparison."

**Claim.** The supplier contract and C2's dependencies consume only GeometricTopology §11.3. Layer 11 also covers PL structures, Manolescu's theorem and collapse, and names no "smoothing-and-triangulation comparison".

**Witness.**
- `README.md:181` and `:1748` cite "§11.3".
- `GeometricTopology/README.md:7732` is headed "Layer 11: triangulations, PL structures and collapse".
- `GeometricTopology/README.md:7887` is headed "11.3 Smooth triangulations and combinatorial manifolds" and uses the pinned `TauCeti.IsSmoothTriangulation`.

**Repair.** Replace the sentence with "take a specified finite smooth triangulation h:|K|≃M from GeometricTopology §11.3 (the Cairns–Whitehead theorem)."

## R05 (P3) — The description omits that CharacteristicClasses drops DGFloer as a supplier

**Location.** The CharacteristicClasses paragraph of the pull request's description: "It no longer consumes HomotopySpheres §§3A, 4A, … or GeneralizedCohomology G4.0a–b, …".

**Claim.** Main's CharacteristicClasses consumes DGFloer Layer 1.2. The head cites no DGFloer, and neither this paragraph nor the loop paragraph says so.

**Witness.**
- Main's `CharacteristicClasses/README.md:71–83`: "DGFloer Layer1 item2 owns the Serre-fibration membership interface…".
- The same file at `:379` and `:612` (`connectedMapHomologyComparison`).
- The head README contains no "DGFloer".

**Repair.** After the G4.0a–b clause, add: "It no longer consumes DGFloer Layer 1.2 (Serre-fibration membership, the connected-map homology comparison and the Serre spectral sequences), replaced by Tau Ceti's Serre-fibration theorems and AlgebraicTopology 4.10 and 5.5."

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| C1.2 Bockstein | RP∞, 0→ℤ→ℤ→𝔽₂→0 | β(a)=y generates H²(RP∞;ℤ)=ℤ/2; β(1)=0 since 1 lifts; ρβ(a)=a²≠0 | holds; pinned `Cohomology/Bockstein.lean:127, :278` | none |
| C1.3 approximations | U(1), m=3; ℤ/2⊂U(1); (S¹)^ℕ | 2(3−1)≥d+1 gives d≤3; H^d(CP∞)→H^d(CP²) iso d≤5, fails d=6; RP^(2m−1) iso d≤2m−1; small subgroups | holds | cite LieGroups (R01) |
| C1.4 smoothing | U(1) over S²; a point | continuous and smooth classes both ℤ; one bundle over a point; II.11–II.12 need connected M, applied componentwise | holds | none |
| C1.5 rings | CP^N, N=0,1; RP∞ over ℤ; z₁z₂ on T² | H²=ℤh for N≥1, 0 for N=0; H¹=0, H²=ℤ/2, 2y=0; class −h₁−h₂ | holds | locator (R02) |
| C2.0 Thom cells | TS²/S²; Möbius/S¹; rank 0; ∅ | cells 2,4 = H̃ degrees 2,4; cells 1,2 = RP², H̃¹(RP²;ℤ)=0≠ℤ; X₊; one point | holds | none |
| C2.2 Checks | O(1)_ℝ/CP¹; rank 2 over S¹; su(F)/S⁴ | e=1, no section; H²(S¹)=0, oriented bundle trivial; rank 3, e∈H³(S⁴)=0, p₁=−4u, no section | holds | none |
| C2.3a field | flag dims (0,2), t=(½,½); tetrahedron | μ=1, v=(−½,½), Σv=0, Σdᵢvᵢ=1=Σtᵢ(dᵢ−μ)²; vᵢ=tᵢdᵢ gives Σ=1; 4−6+4=2 | holds | GT citation (R04) |
| C2.6 transfer | SU(2); T; U(3); SO(3) | χ(S²)=2=\|W\|; point, \|W\|=1; χ(Fl(ℂ³))=6=\|S₃\|; W₃ of order 2 ↦ 0 in torsion-free H*(BT;ℤ) | holds; Lemma 8.30 p.125, chain map p.126 | none |
| C3.1 Leray–Hirsch | B×CP∞; arbitrary base | classes hʲ, one per even degree: Hatcher (a)(b) hold, finite family fails; pinned Serre membership needs no base hypothesis | narrower than source | R03 |
| C4.2 forms | tr(X²); X₁₁ on gl₂; O(1); plane block | B_P=tr(XY); diag(1,0)→diag(0,1), 1→0; (i/2π)(−2πiω)=ω; det(1+tF/2π)=1+t²a²/4π² = 1+t²Pf² | holds | locator (R02) |
| C4.3 universal map | U(1), m=1,2,3 | −a/2π ↦ −h, pairs −1; unnormalized pairs 2π; m=1: H²(pt)=0; h² pairs 1 on CP² for m≥3 | holds; Thm 6.13 a)–d) pp.94–95 | none |
| C5.5 Pfaffian | SO(2) block; O(−1) | Pf([[0,−α],[α,0]]/2π)=−dα/2π = c₁ form; Dupont (7.38) ℰ(Hₙ)=−hₙ matches c₁(O(−1))=−h | holds; Cor 8.37(i) p.131 | none |
| C6.2 ch | O(1), O(2), TCP² | (1+h+h²/2)²=1+2h+2h²=ch(O(2)); without j!: 1+2h+3h²≠1+2h+4h²; ch₂=(9−6)/2·h²=3h²/2 | holds; VBKT p.109, Prop 4.2 p.110 | none |
| C6.3 suspension | pt; S²; S¹ | Hperⁿ(pt)=ℚv^(−n/2); K⁰(S²)⊗ℚ=ℚ²=H⁰⊕H²v; K¹(S²)=0; H¹(S¹)v=ℚ; (−v⁻¹)(−U_Rv)=U_R | holds; Prop 4.5 p.111, finite cell complexes | none |
| C7.6 Hopf | Hopf p; constant map | fibres {(λz₁,λz₂)}; π₃(S³)≅π₃(S²); f_* on H₂ factors through H₂(S³)=0; constant: fibre S³, H₃=ℤ | holds; CKG K7.1 owns the model comparison | none |
| C2.1 ∃! `existsUnique_…_thomPair_fiber` | point; rank 0, two components; B=∅ | u=g for ω, −g for −ω; (1,−1); u=0 unique, conditions vacuous | holds | none |
| C2.1 `exists_isThomClass_of_orientation` | Möbius/S¹; K=0; compact B | no orientation, hypothesis fails; u=0 spans 0; pinned `exists_isThomClass` (`ThomClass.lean:186`) is the compact case | holds | none |
| C2.2 `eulerClass_eq_zero_iff_exists_ne_zero` | TS²; S²×ℝ²; RP² rank 2; ∅; su(F)/S⁴ | e=2, no section; e=0, section; e∈ℤ/2, dim=rank, complete; both true; rank 3<4 excluded by hdim | holds | none |
| C2.3 `eval_eulerClass_tangent_eq_eulerChar` | S²; S¹ (n=0); T³; ∅; reversed o | 2=2; unit section, e=0=χ; 0=0; 0=0; (−u,−[M]) still 2 | holds | none |
| C2.4a `exists_isSmoothEmbedding_mapFundamentalClass_eq` | T², c=1, (2,0); S², c=2, n[pt]; RP³; S¹, m=0; x=0 | two parallel circles; \|n\| signed points; RP¹; signed points; N=∅; bordism sign (−1)^c gives −N₀⊔N₁ | holds; Thom II.27 p.55 | none |
| C7.3a `not_exists_isImmersion_realProjectiveSpace` | k=1, 2; RP³ | w̄(RP²)=1+a excludes ℝ²; w̄₃(RP⁴)=a³≠0 excludes ℝ⁶; 2^(k+1)−2≥2, no truncation; w̄(RP³)=1 | holds | none |

- **Source locators: 28 checked against the text.**
  - `thom1954`: II.1 p.29; §7 p.43; §9 p.50; II.26 and II.27 p.55.
  - `mueller-wockel-smoothing`: lines 225, 461, 686.
  - `hatcher-vbkt`: pp.16, 88, 109, 110 (×2), 111.
  - `hatcher-at`: pp.220, 222, 392, 432.
  - `dupont-ccc`: pp.94–95, 99–100, 104, 111, 125–129, 130, 131.
  - `cohen-fiber-bundles`: pp.86, 87.
  - `landweber-k-theory-elliptic`: p.14.
- **Pinned declarations opened.**
  - `HomologicalOrientation` (`Orientation/Homological.lean:75`); `fundamentalClass` and `mapFundamentalClass` (`LocalHomology/FundamentalClass.lean:204`).
  - `PrincipalBundle`, `division`, `trivializationOfSection` (`FiberBundle/Principal.lean:156, :191, :363`).
  - `SmoothEmbedding.NormalSpace` (`NormalSpace/Basic.lean:59`) and `exists_diffeomorph_normalBundle_subset`.
  - `manifoldStrongWhitneyTopology_eq_manifoldWeakWhitneyTopology`.
  - `Foliation.eulerClass` (`Foliation/EulerClass.lean:122`) and `eulerClass_eq_zero_of_forall_ne_zero` (`EulerClass.lean:383`).
  - `IsSmoothTriangulation`.
- **Cross-roadmap citations resolved**, at this head or on main:
  - AlgebraicTopology §§2.5–8.16 (8.13 at :4973 hands C2.4a here; 8.16 at :5236);
  - TopologicalKTheory T1 items 3–6 and T6.4 (:1610);
  - ComplexKahlerGeometry K7.1 (:2758);
  - GeometricTopology §1.5 (:974) and §11.3 (:7887);
  - SmoothBundlesConnections B1.4 (:421) and B6.0 (:1306);
  - SchubertGeometry S9 item 6 (:120), TopologicalSheafCohomology TS1.1 (:106) and LieGroups Layer 7 (:892).
  - All 15 suppliers are on main. The citation resolver lists nothing unresolved.
- **Gate.**
  - The worker's gate at 8cb420c passes, `build=0` included.
  - My rerun reports only `outside-folder=24`. Every hit is in the 12 sibling folders the brief names, and the diff outside the 13 folders is empty.
- **Dependency check:** `depcheck: 207 roadmaps, 1938 edges, 0 problem(s)`.
- **Lean.**
  - `lake env lean` gives six `declaration uses sorry` warnings (lines 161, 185, 201, 225, 257, 281) and nothing else.
  - `#check @` on all six matches the README, with no lost binder.
  - `simp`, `rfl`, `infer_instance`, `trivial` and `aesop` each fail on all six theorems, so none is padding.
- **Headlines.**
  - Stated: C2.1 (two theorems), C2.2, C2.3, C2.4a and C7.3a.
  - Named as not statable: the mod 2 form of C2.4a, C2.1's Thom isomorphism, C2.2's Gysin sequence, C3.4/C3.6, C4.2, C5.2, C5a.1, C5a.5 (two) and C6.3–C6.5.
- **Overlaps.**
  - #1808 and #1854 revise this folder after this PR, as the merge-order block states.
  - `roadmaps grep` finds no other owner of C2.4a or of the Hopf instance.
  - No dropped id.

## Not verifiable

- Milnor–Stasheff: Lemma 18.1 (C2.0), §12 (C2.2, C3.4a), Thm 10.4 (C2.1), Cor 11.12 (C2.3), Thm 15.3 (C3.3) and §19 (C7.1). The work is uncertified and cited by locator; no legal copy was read.
- Milnor, *Topology from the Differentiable Viewpoint* §6 (C2.3a); Bott–Tu §6 (C2.4, C2.5); Milnor, *Construction of Universal Bundles, II* §§2–3 (C1.1b). All uncertified.

## Source issues

- **Misprint** in cohen-fiber-bundles at Proposition 3.7, p. 87: the source says η is a bundle over X and the product ζ×η lies over X∧Y; it should be η over Y and ζ×η over X×Y; affects nothing.
- **Error** in landweber-k-theory-elliptic at §1.7, p. 14: the source says the correction ∏(1−e^(x_i))/x_i equals (−1)^n td(E)^(−1); it should be (−1)^n exp(c₁(E)) td(E)^(−1); affects a stated result.
