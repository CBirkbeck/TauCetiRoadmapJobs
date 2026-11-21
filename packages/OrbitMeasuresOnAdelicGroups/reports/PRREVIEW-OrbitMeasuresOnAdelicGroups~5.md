# Review of OrbitMeasuresOnAdelicGroups (pull request #2879 at b444955)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/OrbitMeasuresOnAdelicGroups/`
**Verdict:** accepted

**Summary.** Accepted: no finding. This is an incremental re-review of the 116 lines changed since `413804c`: the new definition of fibre measures with its uniqueness claim, the unimodular case of `M ⋉ N`, the z-extension remark and the new Checks were recomputed and hold, and every new citation (AdelicAlgebraicGroups §§3.1 and 5.1, ReductiveGroups Layers 3A and 6A, ReductiveGroupsPartII RG2.1.5, AdicSpacesPartV §6.5, GeometryOfNumbersAndQuadraticArithmetic §3.3, HeightsRationalPointsAndObstructions §3.18b, and the six files of the formal proof) resolves to a statement that says what the README takes from it. There are four small corrections and no format note; the earlier small correction (two citations without a locator) is not repaired and is the first of them. The human reviewers have the family premise, the licence of the formal proof's repository and the unread texts to decide.

## C01 — The citations of [Tate] and [Weil 1965] still carry no locator

In *tamagawa-multiplicative-group* (line 294) [Tate] is cited for the volume `κ_F` of the norm-one idele classes and the residue of the zeta integral, and in *homogeneous-gauge-measure* (line 188) [Weil 1965] is cited for the residue form `dx/dQ`; neither gives a theorem, section or page, so a reader cannot go to the place.

Add the section and page for each. For Weil 1965 the roadmap GeometryOfNumbersAndQuadraticArithmetic §3.3, which the same sentence now cites, gives locators for the fibre measures of a quadratic form (Proposition 6, §37, p. 54; §§42–43, pp. 60–62); I could not read the paper to confirm them.

## C02 — The targets that name [FormalProof] give its file and declaration but not the form it states

The Conventions say (line 24) that where a target names [FormalProof] "the form that proof establishes is recorded at the target: its hypotheses, ranges and constants are those of the proof". At the three places that name it (lines 178–182, 296–299, 441–443) only a path and declaration names follow, with "totally complex `F`" as the one hypothesis mentioned, so a reader cannot compare the roadmap's statement with the form without opening the repository.

I opened the six files. `GlobalTheory.FlagMeas.GenLinVolume` says: for a totally complex number field `E` and every `j ≥ 1`, the sum over the classes of `𝒪_E`-lattices in `E^j` of the covolumes of their automorphism groups in `∏_w GL_j(ℂ)`, measured on the slab `1 ≤ ∏_w |det|² < e` for Lebesgue measure divided by `(∏_w |det|²)^j`, equals `Res_{s=1} ζ_E` times a power of a constant of `E` times `∏_{l=2}^{j} ζ_E(l)`. So it is the classical volume form of `τ(GL_j) = 1`, and the case `j = 1` is the form of `τ(G_m) = 1`. `GlobalTheory.T.tamagawa_adelicHaar_eq_map_product_measure` says: for every number field, a Haar measure on `𝔸_F^κ` for which `F^κ` has a fundamental domain of mass one is the product of copies of a Haar measure on `𝔸_F` with the same property. One clause of this kind at each of the three places would make the Conventions sentence true as written; or the sentence could say that the form is cited by file and declaration.

## C03 — The paths into the formal proof lack their first directory

The six paths are written `Development/AbelianVarietyTheory/…` (lines 180–182, 297–299, 441–442), and the References give the repository; in that repository the files are at `src/Development/AbelianVarietyTheory/…` (`Development.AbelianVarietyTheory.…` is the module name). All six files exist there with the declarations named. Write the paths with `src/`, or say once that they are relative to `src`.

## C04 — The description does not name the supplier this head adds, nor the open roadmap it now cites

The description says: "The suppliers AdelicAlgebraicGroups, ReductiveGroups, ReductiveGroupsPartII, AnalyticNumberTheoryPartII and EndoscopicTransferAndUnitaryTraceComparison are on main." This head adds AdicSpacesPartV §6.5 as a supplier of 2.6 *homogeneous-gauge-measure* (ii) (it is on main), with its own subsection in the supplier contracts, and a Check of 3.4a (line 447) now cites HeightsRationalPointsAndObstructions §3.18b, a roadmap that is still an open pull request. Add AdicSpacesPartV to the list of suppliers on main, and say that HeightsRationalPointsAndObstructions §3.18b is cited in a Check (not as a supplier) at its open head.

## Questions for the author

- DifferentialGeometry 5.5a on main defines the density `|ω|` of a top form on a real manifold and its integral. Should the real case of *top-form-measure* cite it for chart independence? I could not tell from its text whether it yields the Borel measure on `Y(ℝ)` that 2.6 needs, so I do not raise it. The submersion statements of 2.6 now name a supplier at nonarchimedean `k` and at `ℂ`; at `k = ℝ` they rest on the route's own Jacobian argument, which is sufficient.

## Previous findings

The previous report (of `413804c`) had no finding; its one small correction:

- C01 — not repaired: lines 188 and 294 still read "[Weil 1965] for the residue form `dx/dQ`" and "[Tate]: the volume `κ_F` of the norm-one idele classes", with no section or page. Written again as C01.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 2.6 (iv), fibre measures: definition and uniqueness (changed) | `Φ = x²` on `𝔸¹` over `ℝ`, `A° = {x ≠ 0}`; two families agreeing a.e. | `μ_b = (δ_{√b} + δ_{−√b})/(2√b)`, `∫f dx = ∫₀^∞ (f(√b)+f(−√b))/(2√b) db`; continuous in `b` for `f ∈ C_c(A°)`; a.e. equal and continuous gives equal, Haar null sets having dense complement | holds |
| 2.6 (iv), continuity route (changed) | coordinate projection `(x, y) ↦ y` | `∫ f(x, b) g(x, b) dx` continuous in `b` for continuous `g`, compactly supported `f`; partition of unity | holds |
| 2.6 (iv) against GeometryOfNumbersAndQuadraticArithmetic §3.3 | `quadraticFiberDistribution`, main line 911 | there: `m > 4`, on `{x ≠ 0 : Q(x) = t}`, gauge `dx/dQ`, continuous in `t`; here `A° = {x ≠ 0}` since `dQ_x = B(x, ·)` | cited case agrees |
| 2.6 *tamagawa-measure-unipotent-radical*, parabolic sentence (changed) | AdelicAlgebraicGroups §3.1, main line 2125 | there `δ_P(m)⁻¹ dn dm` in `(n, m)`, `Δ_P(nm) = δ_P(m)`; here `dn′ dm` in `mn′`, `nm = m(m⁻¹nm)`, `d(m⁻¹nm) = δ_P(m)⁻¹dn`; modular character `|χ(m)|` | agree |
| 3.4a *tamagawa-number-unipotent-radical*, unimodular sentence (changed) | `M = U(V)`; `G_m ⋉ G_a`; `SL₂ ⋉ G_a²` | `X^*_F(U(V)) = 0` (Galois acts by `−1` on `ℤ`), so `χ = 1`; affine group `|χ(a)| = |a| ≠ 1`, orders differ by `|a|`; `det = 1`, orders agree | holds |
| 3.4a *tamagawa-central-induced-quotient*, z-extension sentence (changed) | RG2.1.5 *z-extension*, main lines 2239–2253 | there: connected reductive, kernel a central induced torus, simply connected derived group; `surjective_points` for every field `K′/K`; here `G_2` connected reductive, `T_1` central induced | applies |
| 3.4a Check `SL_n/μ₂` (new) | `G_2 = (SL_n × G_m)/μ₂`, `T_1 = 1 × G_m`; `n = 2` | `μ₂ ∩ (1 × G_m) = 1`; `X^*_F(G_2) = ⟨t²⟩`, image `2ℤ`, `i = 2`; `G_2/T_1 = SL_n/μ₂`; `n = 2`: `GL₂ → PGL₂`; `τ = 2·τ(G_2)/1 = 2` with `τ(G_2) = 1` | holds |
| 3.4a Check `GL_n → PGL_n` (changed) | `n = 2` | `i = n`; `τ(PGL_n) = n·1/1` given `τ(GL_n) = 1`, now attributed and marked as no target here | holds |
| 3.4a *tamagawa-multiplicative-group* against the formal proof (changed; headline 1) | `GenLinVolume` at `j = 1`, `E = ℚ(i)` | covolume of `μ₄` in `{1 ≤ |z|² < e}` for `dx dy/|z|²`: `2π·(1/2)/4 = π/4`; `Res ζ_{ℚ(i)} = 2π/(4·2) = π/4` | consistent |
| 3.4a, `𝔸_F^× = 𝔸_F^1 × ℝ_{>0}` now cited to §5.1 (changed) | AdelicAlgebraicGroups §5.1, main line 4845 | states the product decomposition, the diagonal `ℝ_{>0}`, compactness of `F^×\𝔸_F^1` | supplier states it |
| 2.6 (ii), orbit map smooth and submersive (changed) | ReductiveGroups 3A.5f; Tau Ceti pin; AdicSpacesPartV §6.5 | `TauCeti.SchemeAction.smooth_toOrbit_of_charZero` (`AlgebraicGeometry/GroupAction/Orbit/Stabilizer.lean:105`): `CharZero`, affine `G`; §6.5: orbit map `G(F) → (G/H)(F)` a submersion, complete nonarchimedean, characteristic 0 | suppliers state it |
| Filtration and Levi complement (changed) | ReductiveGroups Layer 6A, main lines 2664–2707 | Levi complement for smooth connected affine `G`, characteristic 0; item 1: lower-central filtration, vector quotients with linear action, `U(k) → (U/U₁)(k)` onto | suppliers state it |

The rows of the previous review, of `413804c`, for the untouched statements (2.6 *top-form-measure* and its Checks, 2.6 (i)–(iii), the route constants of 3.4a, 4.1 and the two Lean statements) stand as written there.

- Source locators checked against the text: 6 files of the formal proof at their paths (under `src/`), with the 6 declarations named (`GlobalTheory.T.genLin_tamagawa_volume`, `GlobalTheory.FlagMeas.GenLinVolume`, `GlobalTheory.FlagMeas.glVol`, `GlobalTheory.T.tamagawa_adelicHaar_eq_map_product_measure`, `GlobalTheory.SWLit.IsTamagawa`, `GlobalTheory.SWQ.IsCov1`); the changed passages add no locator into Oesterle1984 or Sansuc1981.
- Library declarations opened at the pin: `TauCeti.SchemeAction.smooth_toOrbit_of_charZero` (`AlgebraicGeometry/GroupAction/Orbit/Stabilizer.lean:105`), `isLocallyClosed_orbit` (`AlgebraicGeometry/GroupAction/LocallyClosed.lean:177`).
- Cross-roadmap citations resolved: on main, AdelicAlgebraicGroups §3.1 *Parabolic Haar Jacobian* and §5.1 *The `GL_1` quotient is the idele class group*; ReductiveGroups Layer 3A, 3A.5d, 3A.5f, Layer 6A item 1; ReductiveGroupsPartII RG2.1.5 *z-extension*; AdicSpacesPartV §6.5 *smooth-morphism-submersion*; GeometryOfNumbersAndQuadraticArithmetic §3.3 (`quadraticFiberDistribution`, `orthogonalTamagawa_stabilizer`, `quaternionAdjointTamagawa`). At its open head: HeightsRationalPointsAndObstructions §3.18b `tamagawa_SLquotient_two`.
- Automatic checks: all passed. Dependency check: `depcheck: 171 roadmaps, 1993 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `Suggested.lean` is unchanged since `413804c`; it elaborates with the two `sorry` warnings only, and the elaborated types of both declarations are as in the previous review.
- Headlines: unchanged. (1)–(3) are not statable at the pins and the docstring says so; (4) is stated in two clauses.
- Changes outside the folder: the family index only (its README changed since `413804c`: the description of the formal proof, the place of one sub-roadmap in the list, three descriptions of other sub-roadmaps; the line for this roadmap is unchanged).
- No layer was added, removed or reordered.

Overlap check: read HermitianFormsAndLattices, ThetaKernelsForUnitaryDualPairs, BaseChangeAndGaloisRepresentationsForUnitaryGroups, FiniteReductiveGroups (open), AdelicAlgebraicGroups, ReductiveGroupsPartIII, EndoscopicTransferAndUnitaryTraceComparisonPartII (main), as in the previous review; the list by results is empty; nothing shared. The objects the change touches: the fibre measures of a quadratic form (`quadraticFiberDistribution`), `τ(PGL₁(D)) = 2` and the stabilizer comparison are owned by GeometryOfNumbersAndQuadraticArithmetic §3.3 (main) and now cited by name as cases; `τ(SL_n/μ₂) = 2` by HeightsRationalPointsAndObstructions §3.18b (open, earlier in the merge order) and cited as a case; orbit maps and Levi complements by ReductiveGroups Layers 3A and 6A and cited; the general statements remain owned here.

Source independence: changed passages only: 3 passages (the three that name [FormalProof]) compared with its 6 files, and the new sentences on fibre measures, unimodularity and z-extensions with the supplier statements they cite; none shared (declaration names and paths only); largest share Oesterle1984, 13 of 26 locators; the arrangement was not compared again, no layer having been added, removed or reordered. Weil, Platonov–Rapinchuk–Rapinchuk, Tate, Weil 1965, Steinberg and Humphreys could not be read.

Research link: Layers 2–3 are the Tamagawa-measure comparisons of Weil (1961, 1965), Sansuc (1981) and Oesterlé (1984), used by HermitianFormsAndLattices for `τ(U(V)) = 2`, local densities and Siegel's main theorem; Layer 4 is Steinberg's connectedness theorem (1968), used by FiniteReductiveGroups. Rests on the README's overview and Downstream consumers, and on Oesterle1984 and Sansuc1981.

## Not verifiable

- Weil, *Adeles and Algebraic Groups*, Chapter II, Section 2.4: a book with no open copy; not in the manifest.
- Platonov–Rapinchuk–Rapinchuk, Theorem 3.71, p. 196: a 2023 Cambridge University Press book behind a paywall.
- Weil 1965, Acta Mathematica 113: recorded as uncertified (paywalled).
- Tate's thesis in Cassels–Fröhlich: no open copy; not in the manifest.
- Steinberg, Memoirs of the AMS 80, Theorem 8.1, and Humphreys, §2.11: no legal copy found in an earlier round; not searched again.
- The formal proof: I read the six cited statement and definition files, not the proofs behind them, and did not build the repository; the value of the constant in `GenLinVolume` beside the residue (its definition is in a file I did not open) is not checked.

## Source issues

- none

## For the human reviewers

- Scope: the family index and the description say the family follows a formal proof of the Riemann hypothesis for Dirichlet L-functions announced on 20 November 2026. I did not verify the proof; this roadmap's statements are standard Tamagawa theory and do not depend on it.
- Licence: the repository cited as [FormalProof] states in its README that the formalization was published without a licence and is mirrored for verification only. The README here cites six of its file paths and declaration names (lines 178–182, 296–299, 441–443) and copies no code.
- Not tested: six cited texts (Weil 1961, Platonov–Rapinchuk–Rapinchuk, Tate, Weil 1965, Steinberg, Humphreys) could not be read legally, so wording was not compared with them. The source with the largest share, Oesterle1984, was read in the previous review.
