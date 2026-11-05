# Review of TangentialBordism (pull request #942 at c843330)

**Verdict:** needs changes

## R01 (P2) — Structured and framed Pontryagin–Thom, π₃S and the odd-primary Spin/SO comparison are already planned by StringOrientation

**Location:** `TauCetiRoadmap/TangentialBordism/README.md:18–21` (“StringOrientation S1–S2 owns the normalized String obstruction and its classifiers/lifts”), `:40–43` (“The finite framed Pontryagin–Thom bijection and the stable framed PT map (B5.2, B5.5) … are owned here”), `:1233–1249` (B5.4c, “Prove the coefficient transformation is an isomorphism”), `:1271–1275` (B5.5, “this item owns the resulting stable framed isomorphism Ω^fr_n≃π_n S”), `:1517–1519` (6.4, “Compare BSpin→BSO at odd p … giving MSpin_(p)≃MSO_(p)”), `:1878–1880` (8.3, “η³=12ν≠0 in π3S=Z/24”), `:2605–2607` (“StringOrientation consumes the generic structured PT theorem”).

**Claim:** This roadmap owns the coefficient Pontryagin–Thom isomorphism for a bundle diagram, the stable framed isomorphism, and the odd-primary MSpin/MSO comparison, and StringOrientation consumes them.

**Witness:** StringOrientation is line 6 of the merge order and TangentialBordism line 9, so StringOrientation is a supplier of this roadmap, never a consumer. At its open head, `TauCetiRoadmap/StringOrientation/README.md:413–462` (S2.2) plans θ-manifolds and θ-bordism for every bundle diagram θ of GeneralizedCohomology G5, “Prove the Pontryagin–Thom isomorphism Ω_n^θ≅π_nMθ”, natural and multiplicative, with the identity diagram giving unoriented, BSO(n) oriented and EO(n) framed bordism; `:467–470` (S2.3) proves Ω^fr_n≅π_nS and π₃S≅ℤ/24 with generator ν; `:831–843` (S5.3) proves MSpin→MSO an equivalence after inverting 2 via the K(ℤ/2,1) fibre. Its scope, `:34–38`, names all three as owned there. A search of that README for “TangentialBordism” returns nothing; S2.2’s *Needs* line is “S1.2, S2.1; GeneralizedCohomology G5, G5.3, G5.6; GeometricTopology Layer 1; CharacteristicClasses C2”.

**Repair:** Import these by name and section instead of planning them again. In B5.4c consume StringOrientation S2.2 for the coefficient isomorphism Ω^θ_n≅π_nMθ of a bundle diagram θ (natural, multiplicative), and prove here only the comparison of this roadmap’s coefficient specialization with that isomorphism; keep B5.2–B5.3 (the finite-codimension bijection at fixed rank, which StringOrientation does not state) and B5.4a–b (the theory over spaces and pairs and its morphism of homology theories), each saying in one clause how it differs from S2.2. In B5.5 cite S2.3 for Ω^fr_n≅π_nS and delete the ownership sentence; in 8.3 cite S2.3 for π₃S≅ℤ/24 and ν (at present no *Needs* item supplies them). In 6.4 cite S5.3 for MSpin[1/2]≃MSO[1/2] and keep only the Adams/comodule-algebra refinement. Rewrite the Scope sentences at `:40–43` and the Downstream paragraph at `:2605–2607` accordingly, and add StringOrientation S2.2/S2.3 (and S5.3) to the *Needs* lines of B5.4c, B5.5, 8.3 and 6.4. The dependency check accepts this direction: StringOrientation precedes this roadmap.

## R02 (P2) — The Cayley plane, its characteristic classes and its String-lift uniqueness are already planned by StringOrientation S1.5

**Location:** `TauCetiRoadmap/TangentialBordism/README.md:21–23` (“Here B3.8 proves the carrier-specific H³/H⁴ nullhomotopy test it consumes”), `:2066–2112` (9.1), `:2114–2140` (9.2), `:2142–2185` (9.3, “For every continuous map λ:BSpin→K(ℤ,4) … H⁴(OP2;ℤ)=0 gives existence and H³(OP2;ℤ)=0 gives uniqueness”), `:2187–2215` (9.4 table rows HP2 and OP2), `:2165–2166` (“Riem/Spin/String consumers use this fixed carrier; … do not define another OP2”).

**Claim:** This roadmap owns the OP² carrier F₄/Spin(9), its cell structure, cohomology ring, Pontryagin classes p₂=6u, p₄=39u², Euler class, signature, unique Spin lift and the H³/H⁴ nullhomotopy uniqueness, and StringOrientation consumes them.

**Witness:** `TauCetiRoadmap/StringOrientation/README.md:331–384` (S1.5, open head) defines OP² as the trace-1 idempotents of J₃(𝕆), F₄ as Aut J₃(𝕆), proves transitivity with isotropy Spin(9) at diag(1,0,0), the cell structure S⁸∪e¹⁶ attached by the octonionic Hopf map, H*(OP²;ℤ)=ℤ[u]/(u³), p=1+6u+39u² with u pinned by p₂=6u and ⟨u²,[OP²]⟩=1, w=1+ū+ū², Euler class 3u², signature 1, the unique Spin structure, “exactly one String lift class: apply S1.3 with H⁴(OP²;ℤ)=0 for existence and H³(OP²;ℤ)=0 for uniqueness”, and p(HP²)=1+2u+7u². Its *Needs* line is “S1.3; CharacteristicClasses; AlgebraicTopology Stage 6, Stage 8.7”, with no TangentialBordism edge. The conventions coincide with 9.3–9.4 (p₂=6u, ⟨u²,[OP²]⟩=1, L₄=(381·39−19·36)/14175=1, HP² p₁=2u, p₂=7u²), so the import is sign-compatible.

**Repair:** Cite StringOrientation S1.5 for the carrier, F₄, the Spin(9) isotropy and homogeneous presentation, the cells, the cohomology ring, p₂, p₄, the Euler class, the signature, the unique Spin lift and the nullhomotopy existence/uniqueness (S1.3 for the general torsor), and replace the HP² and OP² rows of the 9.4 table by that citation. Keep in Layer 9 only what S1.5 does not plan, each with a one-clause statement of the difference: the comparison of S1.5’s J₃(𝕆) with LieHighestWeight Layer 8’s `compactAlbertAlgebra` carrier and the three explicit idempotent charts with their transition maps (9.1); the explicit Peirce Cliff(9,0) module with its pinned volume sign, the identification of the full stabilizer, the smooth quotient through SmoothBundlesConnections B1.4 and the F₄ Lie-type comparison (9.2); the Bott-clutching sign computation of p₂ and of the normal Euler class (9.3). Delete the claims at `:21–23` and `:2165–2166` that StringOrientation consumes B3.8 and defines no OP² of its own, and add StringOrientation S1.5 to the *Needs* lines of 9.1–9.4.

## R03 (P3) — A backticked own Lean name that `Suggested.lean` does not declare

**Location:** `TauCetiRoadmap/TangentialBordism/README.md:2401`: “construct the lift `spinHpTwoTransferLift : Σ8 MSpin∧BG₊→F` from this nullhomotopy.”

**Claim:** A backticked name of this roadmap’s own is a claim that `Suggested.lean` declares it.

**Witness:** `Suggested.lean` declares nine names (eight finite-quadratic declarations and `orientedThreeManifold_parallelization`); its docstring lists B6.6 among the headlines not statable at the pins. The neighbouring exports at `:2412–2414` and `:2516` are written in prose without backticks.

**Repair:** Remove the backticks (write the name and its type in prose, as the neighbouring exports do), or move the span into an inline code span that is visibly a type signature rather than a declaration name.

## Verified sound

A full read of both files at c843330: 2,681 README lines and 152 Lean lines, all 44 numbered subsections with their API bullets, Checks, *Needs* lines, Examples and Dependencies, and the whole change set since ea908ef.

### Disposition of the previous review’s findings

| Previous finding | Passage at this head | Disposition |
| --- | --- | --- |
| R01 (P2), relative transversality on fixed faces | README:270–285: “already smooth near C and with every face restriction transverse to Z near C (including the interior stratum) … any face required to stay fixed in its entirety is included in C and must already satisfy this facewise transversality condition”; Check at :312 with f(t)=t and f(t)=1+t; 5.6 at :1331–1333 carries the same condition. | Repaired. The interval instance (ambient derivative 1, face rank 0 against codimension 1) is now excluded by hypothesis and recorded as a negative control. |
| R02 (P2), smooth three-manifold parallelization headline | Suggested.lean:122–150 `orientedThreeManifold_parallelization`; README:1901–1921. | Repaired. Native half-space model of dimension 3, `T2Space`, `SecondCountableTopology`, `IsManifold … ∞`, a chosen `TauCeti.IsOrientedAtlas`, pointwise `Module.Basis` with positive chart determinants and both bundle maps `ContMDiff`. No compactness or connectedness binder. |
| R03 (P3), locators and manifest | README:453–459 (2.4), :629–634 (3.2), :992–998 (5.1), :1293–1299 (5.5), :1841–1846 (8.2), :1980–1989 (8.5), :1907–1911 (Benedetti–Lisca replaces “Kirby’s notes”), references :2673–2681. | Repaired for the locators; every added locator was opened (table below). No roadmap on the content repository’s main branch carries a `sources.toml` (zero files found), so the manifest part is not re-raised. |
| R04 (P3), Clifford volume Check | README:2136: “C₀C₁⋯C₈ sends (1,0)∈𝕆² to (−1,0). Replacing only C₈ by −C₈ sends it to (1,0)”. | Repaired. Recomputed below with the supplier’s Cayley–Dickson product: the nine generators square to +1 and anticommute, the ordered volume is −I₁₆, and flipping C₈ gives +I₁₆. |

No finding of the last repair report was marked “not actionable in this package”; nothing is re-raised.

### Gate, elaboration, signatures and padding probes

The worker’s gate at this head reports every scanner at zero and `depcheck=0 … build=0 OK`. The outside-folder diff against `origin/main` is empty; the folder holds `README.md`, `Suggested.lean` and `metadata.toml` only. I reran the dependency check with `--movable` against the merge order:

```text
depcheck: 208 roadmaps, 1452 edges, 0 problem(s)
```

I built `TauCeti.LinearAlgebra.BilinearForm.SymplecticBasis` and `TauCeti.Geometry.Manifold.Orientation` and ran `lake env lean` on `Suggested.lean`: exit 0, exactly four `declaration uses sorry` warnings (lines 93, 102, 111, 129). A scratch copy with `#check @name` for all nine declarations elaborated; the elaborated types keep `FiniteDimensional (ZMod 2) V` and `Nondegenerate` on every Arf statement, `Fintype V` on the Gauss sum, the explicit `finrank = 2*m` hypotheses, and `T2Space`, `SecondCountableTopology`, `IsManifold`, `IsOrientedAtlas` on the parallelization theorem. Nothing was dropped, and the README’s statements match the elaborated types.

Padding probes on a scratch copy without the admitted theorems: each of the three Arf headlines was tried with `simp`, `rfl`, `infer_instance`, `exact?`, `aesop` and `simp` unfolding the three local definitions; the parallelization theorem with `simp`, `infer_instance`, `aesop` and `exact?`. All 22 probes failed to close the goal (`exact?` found nothing in the pinned libraries). The five proved declarations are the definitions and the symplectic-basis adapter the invariant needs, not padding.

Headline families named in the README: finite Arf classification (stated); oriented three-manifold parallelization (stated); geometric bordism theories and low tables, Pontryagin–Thom over pairs, MO/MSO rings, Steenrod and Adams, ABS and the KO comparison, realization range, Cayley-plane theorems and projective-transfer kernels (each named in the module docstring with the missing carrier: bordism quotient, Thom spectra, Steenrod operations, KO, compact Albert algebra). I confirmed the stated absences at the pins: `Mathlib/Geometry/Manifold/Bordism.lean:110` defines `SingularManifold` with `map`, `prod` (:238) and `sum` (:247) but no bordism relation or quotient; no `Parallelizable`, Thom spectrum, Steenrod operation or KO spectrum declaration exists in either pinned library.

### Seeded source audit

All texts were obtained through the sources service from open repositories, author or institutional pages; Lee 2013 resolved only to a paywalled page and is recorded as uncertified.

| Sampled target | Locator and text inspected | Outcome at the stated generality |
| --- | --- | --- |
| 2.2 Model transport and structures (B1.1) | No external locator; checked against the pins: `Orientation.eq_or_eq_neg_of_isEmpty` (Mathlib `LinearAlgebra/Orientation.lean:217`), `Orientation.map_of_isEmpty` (:116), `TauCeti.orientable_closedBall` (`Geometry/Manifold/Instances/ClosedBall.lean:413`, hypothesis `2 ≤ n`), `orientationPreservingGroupoid` (`Geometry/Manifold/Orientation.lean:178`); DifferentialGeometry 2.1 (README:345) and 2.2 (:352, oriented-atlas criterion for boundaryless M). | The rank-0 sign datum, the two rays with one empty basis and the dimension-1 exclusion of the atlas criterion match the pinned statements. |
| 2.5 Relative cycles (B1.3) | No external locator; DifferentialGeometry 5.5 (README:528, Stokes through the abstract boundary whose faces are consumed) and GeneralizedCohomology G5 structure maps (README:1536, G5.3). | Supplier objects exist as cited; the relative witness with free face is a construction owned here. |
| 2.7 Quartic and elliptic fillings (B1.7) | milnorstasheff1974 lines 5357–5364, Problem 16-D, p.203 (c(Kⁿ)=c(Kⁿ⁺¹)/(1+u) restricted; sₙ[Kⁿ]=d(n+2−dⁿ)); IndexTheory I7.2 (open head README:747). Gompf–Stipsicz not readable. | Quartic numbers follow (table below). The marked E(1) boundary Spin identification is a target here, as the README says. |
| 4.1 Higher diagonals and squares (B4.1) | milnorstasheff1974 line 3651, Theorem 11.14 (Wu), Chapter 11. | Supports Sq(v)=w; the signed integral higher-diagonal equation is a local extension, stated as such. |
| 4.2 Steenrod algebra, transgression, Adams (B4.2) | miller line 1142, Theorem 11.2 (Milnor), p.30; guillouweibel2013 lines 748–759, Definition 6.1 and Theorem 6.2, p.18 (ℓ-simple system with exponents below ℓ, at most 1 on odd elements; base algebra free on transgressions and, for ℓ≠2 and even generators, on τ(y⊗x^{ℓ−1})); lines 784–788, Theorem 6.5, p.19 (β(x) transgresses to −β(y); x^{ℓ−1}⊗y transgresses to −Q_a(y)). | Dual Steenrod algebra input and the 4.4 sign conventions supported; arbitrary-cardinality strong convergence remains a proof target as before. |
| 5.3 Inverse for CW classifiers (B5.3) | thom1954 line 2462, Théorème IV.8, p.75 (stable coefficient theorem for M(SO(n)) and M(O(n))); line 2410, IV.6, p.74. | The README correctly labels IV.8 the coefficient statement and owns the arbitrary-CW mapping-path extension. |
| 6.1 Additive MO splitting (B4.4) | miller Chapter 1, §§5 and 12 (page 17 onward, line 451). No locator in the subsection. | Multiplicities below agree with the generator degrees; the additive-versus-ring distinction is as Miller states it. |
| 6.2 Characteristic-number detection (B4.5) | No locator in the subsection; checked the two Checks by computation (RP², S²; point and two-point target). | Computations pass; the detection theorem over an arbitrary pair is a target here. |
| 6.3 MO multiplication and real hypersurfaces (B4.6) | milnorstasheff1974 lines 5370–5384, Problems 16-E (m,n≥2) and 16-F (real (1,1) hypersurfaces, Yⁿ orientable for n odd), pp.203–204. | Supports the generator choice and the m,n≥2 restriction; the exceptional H_R(1,2) value is computed below. |
| 6.5 Rational and odd-local oriented generators (B6.1) | milnorstasheff1974 line 5372, Problem 16-E: s_{m+n−1}[H_{m,n}]=−(m+n)!/m!n!; thom1954 line 2774, Théorème IV.17, p.84 (Ω⊗ℚ polynomial on one generator per dimension 4m). | Agrees; the arithmetic gcd lemma is computed below. |
| 8.4 Low tables and parallelization (B3.1) | benedettilisca2018 line 15, Theorem 1, p.1 (“every orientable, closed 3-manifold is parallelizable”); lines 74–98, §2.1, pp.2–3 (Wu-class and Spin proofs). | Closed case supported; boundary and noncompact extensions are owned here, as stated. |
| 9.2 Compact automorphisms and Spin isotropy (B3.7) | baez2002 lines 1297–1447, §3.4, pp.30–32 (trace-1 projections, Spin(9) in Aut h₃(𝕆)); pins `TauCeti.Lie.nonempty_embeddedLieSubgroupData_lieSubalgebraOfSubgroup_of_isClosed` (`Geometry/Lie/Subgroup/Embedded.lean`), `realCliffordForm` (`LinearAlgebra/CliffordAlgebra/RealForm/Basic.lean:124`), `spinGroup` (Mathlib `LinearAlgebra/CliffordAlgebra/SpinGroup.lean:292`); LieHighestWeight README:1261–1294 (Cayley–Dickson product (a,b)(c,d)=(ac−d̄b, da+bc̄)). | Supported; the volume sign is recomputed below with that product. See R02 for ownership. |
| 10.2 Associated-family transfers (B6.4) | CharacteristicClasses C1.4 (README:504–507: continuous principal bundles over smooth bases admit smooth representatives, including relative homotopy versions). | Supplier statement matches the use. |
| 10.3 Orientation kernels (B6.5) | fuhring2022 lines 18–20, Theorem 1.1, p.355 (Ω_* generated in positive degrees by CP²-bundles with group PU(3)⋊ℤ₂); line 66, Theorem 1.3, p.356 (ψ surjective for n≥1); lines 1415–1420, §9 (unoriented case, G=SO(3)). | Supports the groups and the displayed structure actions. |
| 10.4 Spin-to-KO kernel (B6.6) | kreckstolz1993 lines 494–499, Proposition 4.2, p.244 (sₙ(PE)=2a(n) or 2a(n)p, a(n)=2 for n=2ⁱ−1); line 511, Lemma 4.3, p.245 (sₙ(PE_r)=−2a_r, a_r=binom(2n,2(r+1))−1); rosenbergstolz line 302, Theorem 3.3, p.8 (ker α = classes of HP²-bundles with group PSp(3)). | Supported; the gcd rule is recomputed below. ABP and Stolz 1992 remain unreadable. |

Also opened: atiyah1971 lines 419–433, §4, Proposition 4.1 and Théorème 3′, p.58 (Spin-boundary criterion by the mod 2 index, count 2^{g−1}(2^g+1) of bounding Spin structures); miller lines 95–104, Definitions 1.1–1.2, p.2, and line 114 (external products); lines 1453, 1538, 1565, Chapter 2 Definitions 1.1 and 1.3 and Theorem 1.4 (Thom), pp.39–41, stated for every G and “along the lines of Chapter 1”; milnorstasheff1974 lines 5452–5465, §17.2 and Lemma 17.2, p.207, and lines 5072–5078, §16.3, p.194 (see Source issues); pyronneau2024 lines 196–231, §2.1, Lemmas 2.11–2.13, Corollary 2.14 and Theorem 2.15, pp.4–5 (paired-plane equivalence, majority-count characterization of Arf, Arf’s classification), the inputs of 1.1.

### Pinned declarations opened

Mathlib and Tau Ceti at the revisions of `lake-manifest.json`.

| File and line at the pin | What was checked |
| --- | --- |
| `TauCeti/Geometry/Manifold/Orientation.lean:332–339` | `IsOrientedAtlas`: subset of the maximal C^n atlas, covers M, coordinate changes in `orientationPreservingGroupoid`. Covering excludes the empty atlas on a nonempty M, so the parallelization theorem is not vacuous on nonorientable M. |
| `TauCeti/Geometry/Manifold/Orientation.lean:352` | `IsOrientedAtlas.det_fderivWithin_pos`, as cited in the supplier contract. |
| `TauCeti/Geometry/Manifold/Orientation.lean:100–104` | `OrientationPreservingOn`: differentiability within `range I` and positive determinant of `fderivWithin`. |
| `TauCeti/LinearAlgebra/BilinearForm/SymplecticBasis.lean:301, :309` | `IsAlt.exists_basis_toMatrix_eq_J` and `IsAlt.even_finrank`, with finite dimension and nondegeneracy. |
| `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean:311` | `polar_self`: polar Q x x = 2 • Q x; in characteristic two the polarization is alternating without division. |
| `Mathlib/Geometry/Manifold/WhitneyEmbedding.lean:131` | `exists_embedding_euclidean_of_compact` needs `[T2Space M] [CompactSpace M]`; no neat-boundary statement. |
| `Mathlib/Geometry/Manifold/ChartedSpace.lean:236` | `ChartedSpace.secondCountable_of_sigmaCompact` needs a second-countable model and sigma-compactness. |
| `Mathlib/RepresentationTheory/Homological/GroupHomology/FiniteCyclic.lean:85` | `Rep.FiniteCyclicGroup.groupHomologyIsoEven`, as used in 10.1. |
| `Mathlib/LinearAlgebra/Orientation.lean:116, :217` | `Orientation.map_of_isEmpty`, `eq_or_eq_neg_of_isEmpty`. |
| `TauCeti/Geometry/Manifold/Instances/ClosedBall.lean:413` | `orientable_closedBall (hn : 2 ≤ n)`; the README’s dimension-one remark is correct. |
| `TauCeti/Geometry/Lie/Subgroup/Embedded.lean:43` | the closed-subgroup embedded Lie data, as cited in 9.2 and 10.3. |
| `TauCeti/LinearAlgebra/CliffordAlgebra/RealForm/Basic.lean:124`; `Mathlib/LinearAlgebra/CliffordAlgebra/SpinGroup.lean:292` | `realCliffordForm p q`, `spinGroup`. |
| `Mathlib/Geometry/Manifold/Bordism.lean:110, :147, :238, :247` | `SingularManifold`, `map`, `prod`, `sum`; no bordism relation. |

`TauCeti.DivisionOctonionReal` and `compactAlbertAlgebra` are not at the pin; they are LieHighestWeight Layer 8’s planned names (README:1261, :1333), so the resolver’s lead is not a missing declaration.

### Cross-roadmap citations resolved

On main: DifferentialGeometry 2.1 (:345), 2.2 (:352), 5.5 (:528), 8.3 (:836), 10.2 `dense_isRegularValue` (:884–885); GeometricTopology Layer 1 (:177), Layer 11 (:831), smoothing-and-triangulation item 1 (:938); GeneralizedCohomology G1.1 (:141), G2.10 `MappingPathSpace` (:533), G3.3 (:710), G3.8 `spectrumConnectiveCover` (:785, :797), G3.9 (:878), G4.0a (:938), G4.5 (:1246), G5.1–G5.5 (:1512, :1523 unframed collapse, :1536, :1559 MU^(2), :1687), `realMixedCliffordIndexClassification` (:2084); CharacteristicClasses C1.3 (:486), C1.4 (:504), C3.3 (:842), C3.6 (:945), C6 and ch(u)=−v (:1447, :1496), C7.3 (:1560), C7.3a (:1589); SpinGeometry G4 (:395), G5.0 `realCliffordSpinorBundle` (:506), G6.0 (:586, :636), G6.7 (:831); TopologicalKTheory T1, T3, T4, T5 (:886), T7 (:1148) with c(a)=2u², c(b)=u⁴ (:1263); RiemannianGeometry R1 (:179; HP^d quotient metric and curvature bounds 1 and 4 at :280–296); ClassifyingSpaces Stage 4 (:222, :238); AlgebraicTopology 8.10 and 8.11b (:107–121); AffineMorseLefschetz A0 (:67), A5 (:494), A6 (:535); ComplexKahlerGeometry K7.1 (:1407); DGFloer Layer 1 (:442); DGAInfinity Layer 0 (:263); LieGroups Layers 2 and 4 (:275, :326); LieHighestWeight Layer 8 (:1197–1398); SpinRepresentations Layer 7 (:881); IntegralLattices (discriminant forms, distinct from the finite F₂ Arf problem). Open heads: SmoothBundlesConnections B1.4 (README:396); IndexTheory I7.2 (README:747), I7.5 (:869–871), I2.5 (used at :468, :800); PseudodifferentialOperators P5 (:883), P6 (:1273); HomotopySpheres 3C item 5 `sphere_parallelizable_iff` (:524); FourManifolds defers the quartic and E(1) to B1.7 (:33–35), so there is one owner there; StringOrientation S1.3 (:268), S1.5 (:331), S2.2 (:413), S2.3 (:465), S5.3 (:831) — the two findings above. EllipticCohomology at its head excludes the Cayley-plane questions (:36–42).

Ownership searches by object (`roadmaps grep` over the open heads and main) for parallelization, Steenrod squares, Arf and Pontryagin–Thom: no roadmap other than StringOrientation plans the objects of Layers 3–9; AlgebraicTopologyPartII (later in the order) cedes Wu classes to B4 item 3; BordismFormalGroups on main consumes this roadmap’s towers. Ownership against open pull requests whose files the brief did not supply was not checked.

### Adversarial computations

“Pass” means the displayed instance agrees with the README; it does not certify the general theorem. The Arf rows are exhaustive enumerations over all quadratic forms with the standard symplectic polarization and all ordered symplectic bases.

| Statement / target | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| 1.1 `finiteQuadraticArf_eq_of_symplecticBasis` | m=0,1,2: 1, 4, 16 forms; 1, 24, 11520 symplectic bases | every basis gives the same value per form | Pass |
| 1.1 `finiteQuadraticArf_gaussSum` | same 21 forms | Σ(−1)^{q}=2^m for Arf 0 and −2^m for Arf 1 in every case; H: values (0,0,0,1), sum 2; A: (0,1,1,1), sum −2 | Pass |
| 1.1 `finiteQuadraticArf_eq_zero_iff_lagrangian` | same 21 forms, all subspaces of dimension m | a q-zero m-dimensional subspace exists exactly when Arf=0 (both directions) | Pass |
| 1.1 zero count | same forms | 2^{2m−1}+(−1)^{Arf}2^{m−1} for m≥1; 1 for m=0 | Pass |
| 1.1 nondegeneracy | zero form on F₂¹ | polar rank 0, finrank 1 odd, no symplectic basis; hypothesis false, no junk value | Pass |
| 1.1 two anisotropic planes | diagonal (x,y,x,y) | q=2(x²+xy+y²)=0, dimension 2, Arf 1+1=0 | Pass |
| 2.1 facewise transversality | f(t)=t, C={0}, Z={0}; f(t)=1+t | ambient derivative 1; face {0} has rank 0 against codimension 1; 1+t misses Z on that face | Pass (repaired R01) |
| 2.1 doubles and neighbourhoods | [0,1]; ∅; interval K⊂ℝ | double S¹; double ∅; sublevel of larger radius contains K in its interior | Pass |
| 2.2 rank-0 orientation | positive, negative point | two rays, one empty basis; `map_of_isEmpty` fixes both | Pass |
| 2.2 boundary orientation | positive [0,1], outward-first | signs at 1 and 0 are +1, −1; ∂[0,1]=[1]−[0] | Pass |
| 2.2 factor swap | dimensions (1,1), (0,1) | (−1)^{1·1}=−1, (−1)^{0·1}=+1 | Pass |
| 2.3 quotients | ℤ on ℝ; irrational flow on T²; S¹ on S³ | S¹ with discrete fibre; non-Hausdorff orbit space (not proper); CP¹ with fibre S¹ | Pass |
| 2.3 disc bundles | trivial line over a point; rank 0 | [−1,1] with 2 boundary points; point with empty sphere | Pass |
| 2.7 quartic | c₂=6h², h²[K3]=4, p₁=−12h² | c₂=24, p₁=−48, σ=−16, Â=2; reversed: +16, −2 | Pass |
| 2.7 E(1) | fibre class 3H−ΣE_i | F²=9−9=0, χ=3+9=12, σ=1−9=−8 | Pass |
| 3.1 group laws | O: two points; SO: ±pt | 1+1=0 in F₂; (+1)+(−1)=0, (+1)+(+1)=2≠0 | Pass |
| 3.4 orientation maps | point, ∅, points over x,y | 1, 0, (1,0) and (0,1); constant map sums to 1 | Pass |
| 4.1 instability and Cartan | a∈H¹(RP∞;F₂) | Sq¹a=a², Sq²a=0; Sq¹a²=0, Sq²a²=a⁴ | Pass |
| 4.2 Adams differential | (s,t)=(1,2), r=2 | target (3,3); stems 1→0 | Pass |
| 4.2 Prüfer completion | ℤ/2^∞ | classical completion 0; derived completion has ℤ₂ in degree 1 | Pass |
| 4.3 Wu on RP² | w=(1+a)³ mod a³ | coefficients (1,1,1): w₁=a, w₂=a²; v₁=a, v₂=0; Sq(v)=1+a+a² | Pass |
| 4.4 p-simple system | F₃[y] | y⁴=y·y³, digits (1,1); y⁹ next element; nothing is zero | Pass |
| 4.4 degrees at p=3 | transgression of x with y=βx | τy=−βι₂=2βι₂; transpotence degree 2·3+2=8; exterior P¹βι₂ in degree 7 | Pass |
| 5.1 collapse degrees | one framed point; reversed framing; ∅ | 1; −1; constant map | Pass |
| 5.2 labelled points | a+,b+,a−,b− versus a+,a−,b+,b− | words aba⁻¹b⁻¹≠1 and 1; both abelianize to (0,0) | Pass |
| 5.2 rank zero | n=k=0 | ℝ⁰ holds one point; no disjoint-union law | Pass |
| 5.4c over-space test | X={x,y} | (1,0),(0,1) in ℤ²; X→pt sums to 2 | Pass; ownership R01 |
| 5.5 framed degrees | +pt, −pt, ∅ | +1, −1, 0 | Pass; ownership R01 |
| 6.1 MO multiplicities | degrees 0–4, generators x₂,x₄,x₅,x₆,… | 1,0,1,0,2 | Pass |
| 6.2 SW detection | RP⁴; RP²×RP²; CP² | w(RP⁴)=1+a+a⁴, (w₄,w₂²)=(1,0); (1,1); (1,1) | Pass |
| 6.3 real Newton numbers | H_R(2,4); H_R(1,2); RP^d | 1; 0 although binom(3,1) is odd (the m=1 term corrects it); d+1 mod 2 = 0,1,1,1 for d=1,2,4,6 | Pass |
| 6.3 Lucas | m=2^r, n=2^{r+1}s, r,s∈{1,2,3} | binom(m+n,m) odd in all nine cases | Pass |
| 6.4 Adams bidegrees | p=3, p=5 | v₁=(1,5) stem 4; v₁=(1,9) stem 8; degree-4 C generator absent at 3 (2·1+1=3), present at 5 | Pass; ownership of MSpin[1/2]≃MSO[1/2] R01 |
| 6.5 complex Newton numbers | H_C(2,3); H_C(1,1); CP⁴ | −10; +2 (CP¹, not −2); 5; gcd(5,10)=5 | Pass |
| 6.5 binomial gcd | N=2,…,12 | 2,3,2,5,1,7,2,3,1,11,1 | Pass |
| 6.6 Wall derivations | σ(4); Y₆Y₅ | ∂₂σ₄=σ₂, ∂₂²σ₄=1; δ(Y₆Y₅)=Y₅²≠0 | Pass |
| 6.6 Dold degree | k=2^{r−1}(2s+1) | dim P(2^r−1,2^r s)=2k−1 | Pass |
| 7.1 ABS on K3 | p₁=−48 | Â=2, c(α)=2u², α=a; K3×K3: a²=4b | Pass |
| 7.2 sign check | α(M)=k·a | 2k=⟨Â,[M]⟩=−σ/8; K3: σ=−16 gives k=1 | Pass |
| 8.1 surface refinement | q(a)=q(b)=0, a·b=1 | q(a+b)=1 | Pass |
| 8.2 Atiyah count | genus g | 2^{g−1}(2^g+1) bounding structures at atiyah1971 line 432; g=1 gives 3 | Pass |
| 8.3 framed torus | Lie-framed T³ | η³=12ν of order 2 in ℤ/24; Spin image 0 | Pass; π₃S owner R01 |
| 8.4 low tables | degrees 0 and 4 | O: F₂, F₂²; SO: ℤ, ℤ; σ(CP²)=1; σ(K3)/16=−1 | Pass |
| 8.4 `orientedThreeManifold_parallelization` | ℝ³ and half-space coordinate frames; countable disjoint union; ∅; A empty | determinant 1; −1 after negating one vector; componentwise frames; empty functions; `IsOrientedAtlas` forces M=∅ when A=∅ | Pass, not vacuous |
| 8.5 Hopf fibre degree | q=1+xj−yk at q=1 | ∂ₓ(qiq⁻¹)=−2k, ∂_y=−2j; determinant in the (j,k) plane −4; degree −1; total sign (−1)ⁿ, −1 at n=1 | Pass |
| 9.1 Albert carrier | diag(1,0,0); 0; identity | trace 1, idempotent; trace 0; trace 3 | Pass |
| 9.2 Clifford relations | all 81 pairs of C₀,…,C₈ | C_iC_j+C_jC_i=2δ_{ij}I₁₆ | Pass |
| 9.2 ordered volume | C₀C₁⋯C₈ on (1,0); C₈ replaced by −C₈ | (−1,0); +I₁₆ | Pass (repaired R04) |
| 9.3 OP² signature and Â | p₂=6u, p₄=39u², p₁=p₃=0 | L₄=(381·39−19·36)/14175=1; Â₄=0; wrong p₄=36 gives 1448/1575 | Pass; ownership R02 |
| 9.4 HP^k Pontryagin | k=1, 2 | (1+u)⁴/(1+4u)≡1; (1+u)⁶/(1+4u)≡1+2u+7u²; L₂=1, Â₂=0 | Pass; ownership R02 |
| 10.1 cyclic homology | C₃, degrees 1–6 | ℤ/3,0,ℤ/3,0,ℤ/3,0 | Pass |
| 10.1 degree-7 class | L⁷(3)×L⁷(3) | ρβ(v₁v₂u₂²)=u₁v₂u₂²−v₁u₂³, P¹β(v₁v₂)=u₁³v₂−v₁u₂³, product −v₁v₂u₁³u₂³ (v²=0, u⁴=0), −1=2 in F₃ | Pass |
| 10.3 semilinear group | conjugation on CP²; scalar circle | degree (−1)²=+1; λ↦λ̄ so normal, not central | Pass |
| 10.4 isotropy path | two blocks | 1+1=0 in π₁(SO₈) | Pass |
| 10.4 scalar curvature | K∈[1,4], dimension 8 | Scal≥8·7=56; value 16·2·4=128 | Pass |
| 10.4 PSp₃ polynomials | t₂,t₃,t₈,t₁₂ in F₂[x₁,x₂,y₁,y₂] | term counts 3,2,32,46; Sq¹t₂=t₃, Sq¹t₃=Sq¹t₈=Sq¹t₁₂=0, Sq²t₂=t₂², Sq²t₃=t₂t₃, Sq²t₈=0, Sq²t₁₂=t₂t₁₂ all exact | Pass |
| 10.4 adjoint correction | x₁=1, others 0 | t₂=1, t₃=t₈=t₁₂=0, w₈=w₁₂=1 | Pass |
| 10.4 Borel–Hirzebruch relation | π*t₈=u₄²+u₈, π*t₁₂=u₄u₈ | u₄³+(u₄²+u₈)u₄+u₄u₈=0 | Pass |
| 10.4 KO-Pontryagin | oriented plane E; zero bundle | λ_t(E−2)=1+(E−2)t/(1+t)², π₁=E−2, higher 0; π₀=1 | Pass |
| 10.4 cover index | I=∅,(2),(3) | k=0, 8, 10 (not 12) | Pass |
| 10.4 Ext bidegrees | a, b, a², h₀²b | (3,7),(4,12),(6,14),(6,14); a²=4b in KO | Pass |
| 10.4 Kreck–Stolz numbers | n=2,r=0; n=3,r=0,1 | −10; −28, −28 | Pass |
| 10.4 Kreck–Stolz gcd | n=2,…,8 over all r | 10,28,6,22,26,4,34 equal 2^a p rule in every case | Pass |

70 rows. Rows marked with a finding passed numerically; the finding concerns ownership, not the value.

## Not verifiable

- Lee 2013 (Theorems 6.26, 6.35, 6.36, 21.10, 21.13 and their pages): the sources service resolved the citation only to a paywalled publisher page and recorded it uncertified; the page numbers were not checked against the text this round.
- Anderson–Brown–Peterson 1967 and Stolz 1992: no legal full text was found by the service in the previous round and none is recorded now; the ABP cover lifts and the 2-primary transfer resolution in 10.4 remain uncertified.
- McCleary 2001, Gompf–Stipsicz 1999, Stong 1968, Atiyah–Bott–Shapiro 1964: paywalled or without readable text, as recorded before; cited by locator only.
- Borel–Hirzebruch §19, Theorem 19.4 (OP² classes) was not reopened; StringOrientation S1.5 cites the same locator as uncertified.

## Source issues

- **Error** in milnorstasheff1974 at §16.3, printed p.194 (line 5076–5078): the source says that odd complex projective space is the total space of a circle bundle over a quaternion projective space; it should be a 2-sphere bundle, the fibre of CP^{2n+1}→HPⁿ being CP¹, as the dimension count 4n+2−4n=2 forces; affects a stated result (the parenthetical remark; the boundary conclusion stands with the correct fibre).
- **Gap** in miller at Chapter 2, Theorem 1.4, printed p.41 (line 1562–1566): the source says the reader may define singular G-manifolds over X and prove the isomorphism along the lines of Chapter 1, giving no proof; it should state the hypotheses on the diagram and the parameter space; affects the proof.
