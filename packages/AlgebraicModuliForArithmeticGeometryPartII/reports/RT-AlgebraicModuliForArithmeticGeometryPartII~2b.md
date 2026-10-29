<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1082#issuecomment-6485854194 -->
Red team round 2 pass b (claude) of b3f8aaf

Verdict: needs_changes

1. **F01** (P3) §0.5's *Needs:* omits the section that defines its conclusion, and §0.4 cites the later §0.5

   Location: `packages/AlgebraicModuliForArithmeticGeometryPartII/README.md:185` ("… then L ≡_f 0"), `:189` (*Needs:* §0.1; §0.3; …), `:173` (§0.4 *Needs:* "… §0.5 only for the closed-point characterization"), `:215` (Layer 0 Dependencies: order "definition of numerical triviality, closed-point detection").

   Claim: §0.5 is proved from §0.1 and §0.3; §0.4's API needs §0.5.

   Witness: the conclusion of §0.5 is the predicate `L ≡_f 0` defined only in §0.4 (line 155), so §0.5 needs §0.4; and §0.4's own *Needs:* line names §0.5, a later target, for its fifth API bullet (line 165). The Dependencies paragraph (line 215) orders §0.4 before §0.5, so the two *Needs:* lines together form a forward reference that the stated build order does not resolve.

   Repair: line 189 → "*Needs:* §0.1; §0.3; §0.4 for the definition of `L ≡_f 0`; SchemeAndStackFoundations §§0.9, 0.11, 0.23; JacobianChallenge Layer C." Line 173 → "*Needs:* §0.1, native line bundles and Mathlib `AlgebraicGeometry.Scheme.Hom.fiber` for the definition and subgroup; §0.3 for geometric comparison." Line 165 → "- L ≡_f 0 iff (L·C) = 0 for all curves C in fibres over closed points of S; this is proved in §0.5, after the definition, and is restated here as part of the interface." Tested on the instance of the refuting order: with these lines the Layer 0 order pairing → field extension → definition → closed-point detection → surjective pullback has every *Needs:* edge pointing backwards.

Round 2. Files read in full: `packages/AlgebraicModuliForArithmeticGeometryPartII/README.md` (1118 lines, 51 numbered targets, 8 definitions, 10 admitted headlines named at line 93), `Suggested.lean` (321 lines, 18 declarations), `design/plan.json` (6 gaps), `sources.toml` (14 works), the two round-1 reviews and the round-1 repair report. Read-only: no Lean was run; the `#check @name` comparison was done by reading each signature against the README and the pinned declarations (see Not verifiable).

## Round-1 findings at this head

| Finding | Status | Witness at b3f8aaf |
|---|---|---|
| a.F01 = b.F01 (P2): fibre-graph and rationality headlines absent | repaired | `Suggested.lean:264–296` states `fibreComponentGraph_descends_of_constantNumericalClasses` and `residueField_eq_of_reducible_geometricFibre`; docstring line 18 now says only "Negative-curve descent and intersection-label descent lack that pairing"; README lines 882 and 898 name both; line 93 lists them. The repair's change to b's draft (closure in `S` on both sides) is correct: a closed subset `T` of the subspace `f⁻¹(a)` satisfies `T = closure_S(T) ∩ f⁻¹(a)`, so `e` is still determined, and over the generic point of a fibre-type target both closures are `S` (b's one-sided draft would have failed there). |
| a.F02 (P2): projective contraction descent statable | repaired | `Suggested.lean:195–223`: `IsProjectiveOver` (closed immersion into `Proj` of `homogeneousSubmodule (Fin (n+1)) K` with the structure-map equation) and `contraction_descends_of_constantNumericalClasses`; README §3.7 lines 703–718 with 4 API bullets and 3 Checks. `MvPolynomial.gradedAlgebra` is an `abbrev` at `Homogeneous.lean:613`, `Proj.toSpecZero` at `Basic.lean:151`, `«Proj»` at `ProjectiveSpectrum/Scheme.lean:854`, `SetLike.GradeZero.instAlgebra` at `Algebra/DirectSum/Internal.lean:404` (gives `Algebra K (𝒜 0)`), all at the pin. Docstring lines 13–14 no longer list §3.7. |
| a.F03 (P2): gap asked for the top-intersection identity | repaired | README line 61 and `plan.json` line 3877 carry only the section inequality; §1.6 route (line 344) derives `((π*L)^n·V′) = (L^n·V)` from `proper_pushforward` (SchemeAndStackFoundations README line 6709) and §5.2's degree preservation. |
| b.F02 (P3): docstrings name proof ingredients; Keel's field | repaired differently, correctly | §3.7 half superseded by a.F02; Keel half at `Suggested.lean:150–153` matches KEE99 line 677 (projective schemes over the algebraic closure of a finite field). |
| b.F03 (P3): Tau Ceti quotient and graph carriers | repaired | README lines 39–41; at the pin: `NumericalQuotient/Basic.lean` lines 66, 90, 96, 138, 141, 273, 317 (`numericalPairing_nondegenerate`), `NumericalType/Topology.lean` lines 46, 65. §1.4 route (line 294) and §4.6 route (line 852) cite them; the caveat that `intersectionGraph_connected` reads the structure's `connected` field is stated. |
| b.F04 (P3): Noetherian Stein factorisation applied to locally Noetherian `Y` | repaired | README lines 602, 605, 608: applied over an affine open cover; `stein_factorization` is for Noetherian schemes at SchemeAndStackFoundations README line 5472. |
| b.F05 (P3): two locators | repaired | §0.4 (line 155) cites BMP23 and SCH23 only; §0.3 (line 142) cites KLE05 Proposition 6.12 (line 2724, verified), Theorem 6.3 (line 2498, verified) and Remark 6.14's continuation (line 2754, verified) and says the arbitrary-extension equivalence is proved here. |
| b.F06 (P3): downstream paragraph | repaired | README line 1090 maps the four later roadmaps' requests to §§0.3, 1.1, 1.3, 3.7, 4.8–4.10 and names the non-targets; §3.3 gains the AbundanceStatement Layer 5 bullet (line 647). The consumers' heads still read as described: EnriquesSurfacesAndIntegralNonexistence README lines 80 and 89 (`gap:numerical-contraction-descent`, `gap:picard-flatness-betti`), K3SurfacesAndSymplecticBoundedness README line 98 (`gap:surface-arithmetic-quotient`). |

No repair introduced an error that I could find: the new Mathlib file:line claims at README line 33 (Smooth.lean:59, Fiber.lean:37–46, ResidueField.lean:237, Homogeneous.lean:613, Basic.lean:151) are all correct at the pin; the three new §3.7 Checks compute correctly (see table); the generic-point sentence at line 882 is right (a normal proper curve with `H⁰ = κ(η)` has `κ(η)` algebraically, hence separably, closed in its function field, so it is geometrically irreducible).

## Verified sound

Counts: 18 declarations read and compared binder by binder with README §§0.4, 1.1–1.3, 2.7, 2.10, 2.12, 3.1, 3.6, 3.7, 4.1, 4.2, 4.8, 4.9, 5.3; 51 targets read, each with a locator and a *Needs:* line; 44 source locators verified against the cached texts (every SCH23, KLE05, BMP23, HW23, WIT22, DW22, CT20, AHK07, LIP69, EGA-IV3, KEE99, PS12 and LMFDB11 line cited in the README, and the ten Stacks tags: 0AYW, 0BEL, 0BET, 0BDG in the cached Varieties chapter at lines 4474, 4676, 4790, 1320; 00PH, 0C66, 0D3A, 0D3D, 0D01 in the cached Algebra, Semistable Reduction, Divisors on Spaces, Descent on Spaces and Quot chapters at lines 13506, 2982, 1392, 1008, 1177); 166 Check bullets recomputed; 61 sibling citations checked (SchemeAndStackFoundations on main: §§0.9, 0.11, 0.23, 1.1–1.11, 2.1–2.2, 2.6, 2.10–2.11, 2.15, 2.22, 3.4–3.5, 4.9–4.12, 5.2–5.3, 5.9–5.10 and the names `Num.free_finiteRank`, `c1_degree_curve`, `proper_pushforward`, `stein_factorization`, `etale_galois_comparison`, `finite_pushforward_exact`, `lineBundleNorm` at README lines 7206, 6711, 6709, 5472, 3872, 3674, 4878; JacobianChallenge Layers A–D at lines 111–143; StableReduction Layers 1, 2, 4 at lines 321, 354, 468 with J-A2 at line 238, openness of fibrewise ampleness at line 391 and contraction descent at line 400; AlgebraicVectorBundles L0A–L1B at lines 215–290; EtaleCohomologyFoundations §F.3 at line 602; at the open heads, AlgebraicModuliForArithmeticGeometry §§1.4–1.6, 2.1, Layer 3, 7.3, 7.6.1–7.6.1a, 7.9 with `bigLineBundle`, `boundedSupportParameters`, `picard_infinitesimal_lifting`; ComplexComparisonPartII §§C3.2d.2, C3.2d.4, C3.2e, C3.2f.1–C3.2f.2 with the three names; ResolutionOfSingularitiesCharacteristicZero §7.8; AbundanceStatement Layers 4A–4D and 5, whose scope is projective varieties over algebraically closed characteristic-zero fields, as the README says).

Policy: `git diff --stat origin/main...HEAD` touches only `packages/AlgebraicModuliForArithmeticGeometryPartII/`; no `lemma`, no `set_option`, no `#eval`/`#print`, no `True` placeholder, no sorry'd data, no pull-request numbers or process words, no machine paths; imports are `import Mathlib` plus two existing `TauCeti.AlgebraicGeometry.LineBundle.*` modules. Every Lean name appears in the README (line 93) and every own backticked name in the README is declared. Dependency check output:

```text
depcheck: 188 roadmaps, 1232 edges, 0 problem(s)
```

Exit 0, no UPWARD, CYCLE or moved line. AbundanceStatement (open pull request #545, another author, new folder) is a permitted supplier and is already cited by SchemeAndStackFoundations §5.10 on main.

Gaps: the six slugs agree between README (lines 51, 53, 59, 61, 63, 65) and `plan.json` (lines 3870–3903), each with a named supplier; none asks for what the pins or the cited sections provide (SchemeAndStackFoundations §5.3 has no nef-and-big criterion and §5.9 is surfaces only; the parent's §1.6 `bigLineBundle` is projective geometrically integral with no finite-point detection; its §2.1 is the Hilbert functor as Quot without the proper algebraic-space representability; its §7.3 has no nonflat Picard descent).

Ownership: `roadmaps grep` by object (numerically trivial, Néron–Severi, `IsProjectiveOver`, component graph, contraction descent, Picard scheme, Stein factorisation, Zariski's lemma, Keel) finds no earlier owner of the arbitrary-field proper numerical theory, the contraction-descent theorems, the component graph or `IsProjectiveOver`. EnriquesSurfaces (#1286, another author) uses SchemeAndStackFoundations §§5.9–5.10's `Num` for Enriques surfaces only; MotivesAndAlgebraicCycles, ModularCurvesPartII, JacobianChallengePartII, RelativeJacobiansAndIntegralCurveModels, AbelianSchemesAndArithmeticModuli, WeilConjectures, NeronModelsAndSemistableAbelianVarietiesPartII and EnriquesSurfacesAndIntegralNonexistence are all later in the merge order (positions 49–147 against 47). Mathlib and Tau Ceti at the pins have no numerical-triviality, nef, semiample, projectivity, Picard-scheme, Hilbert-space or contraction predicate (Tau Ceti's only Picard object is the rigidified functor), so the module docstring's "not statable" list is justified and none of the eight definitions duplicates a pinned object.

### Declaration table (context, instances, values)

| Declaration (line; §) | Context actually retained | Instances; values on each side | Result |
|---|---|---|---|
| `NumericallyTrivial` (40; §0.4) | `[Field k]`, `[IsProper x]`, `L`; quantifies integral closed `C` with `topologicalKrullDim C = 1`, degree via `C.Over := ⟨i ≫ x⟩` | P¹, O(m): χ(O(m))−χ(O) = m; ∅ and Spec k: no test curve, true; double line, O(1): reduced test curve degree 1 | kernel is m = 0; matches README |
| `RelNumericallyTrivial` (51; §0.4) | `[IsProper f]`; fibre over every `s`, proper instance supplied via `pullback.snd` | id_S: fibres are points, all L trivial; pr₁ on P¹×P¹, O(a,b): fibre degree b | kernel ℤ×0; no Noetherian needed for the definition |
| `numericallyTrivialClasses`, `relNumericallyTrivialClasses` (64, 73; §1.1) | closure of represented classes | closure of {O(2,0), O(−3,0)}: degrees 0, inverse degree 0 | equals the set once §0.4 gives the subgroup |
| `numericalClassGroup_free_finite` (82; §1.2) | `[IsProper x]`, any field | P⁰: rank 0; Pⁿ (n ≥ 1): 1; E×E: 2 + rank End ∈ {3,4,6}; ∅: 0 | deep; no one-tactic proof |
| `relNumericalClassGroup_free_finite` (93; §1.3) | `[IsProper f] [IsNoetherian S]` | pr₁: rank 1; id: 0; S = Spec ∏_ℕ k: bounded integer sequences, not f.g. | Noetherian hypothesis present and necessary |
| `HasTrivialNumericalGaloisAction` (107; §2.7) | `[IsAlgClosure k K]`, `[IsProper x]`; `g` pinned by both projection equations (unique by the pullback property) | P¹: σ fixes m; P¹_ℂ/ℝ: swap (1,0)↦(0,1); pointless conic: ℤ, trivial; ∅: 0 | holds, fails, holds, holds |
| `constantNumericalClasses_iff_positivePowerDescent` (129; §2.10) | as above; `∃ d, 0 < d` before `∀ L ∃ M` | P¹: d = 1; conic: image 2ℤ, d = 2, d = 1 fails on class 1; P¹_ℂ/ℝ: (d,0) ∉ diagonal for all d ≥ 1, both sides false; d = 0 excluded | iff survives, uniformity tested |
| `numericallyTrivial_torsion_of_algebraic_finiteField` (154; §2.12) | `[Fact p.Prime] [Algebra (ZMod p) k] [Algebra.IsAlgebraic (ZMod p) k]` | E/F̄₂, y²+y=x³: 2 affine + ∞ = 3; E/F̄₃, y²=x³−x: 3 affine + ∞ = 4; ℚ̄ excluded by the instance | p = 2, 3 included |
| `IsContraction` (168; §3.1) | any `X Y`; `IsProper f ∧ ∀ U, IsIso (f.app U)` (`Scheme.Hom.app` is `Scheme.lean:177`) | Bl_x S → S: O → O; 𝔸¹ → cusp: k[t] ≠ k[t²,t³]; P¹_ℂ → Spec ℝ: H⁰ = ℂ ≠ ℝ; ∅ → Y nonempty: Γ(Y,U) → 0 not iso | second, third, fourth excluded |
| `contraction_descends_purelyInseparable` (176; §3.6) | `[IsPurelyInseparable k K]`, proper `x`, `y'`, contraction `f'`, over-equation | K = k: v = 𝟙, f = f′; infinite K = k^perf: route via qcqs flat base change of Γ and faithful flatness works (checked); ℂ/ℝ excluded by the instance | both squares present |
| `IsProjectiveOver` (195; §3.7) | `[Field K]`, `y`; `∃ n`, closed immersion, structure-map equation | P⁰_K = Spec K (n = 0): true; ∅: true; 𝔸¹_K: not proper, false; Spec ℂ over ℝ: V(T₀²+T₁²) ⊂ P¹_ℝ, true, while Spec ℂ → P⁰_ℝ is not a closed immersion; Spec K with shift σ on ℚ(t₁,t₂,…): K over σ(K) is σ(K)(t₁), not finite type, false | the three README Checks compute as stated |
| `contraction_descends_of_constantNumericalClasses` (209; §3.7) | `[IsAlgClosure k K]`, `[IsProper x]`, `hnum`, projective `Y′` (hence proper), contraction, over-equation | K = k: v iso; X = ∅: Y′ = ∅ = Y; X = Spec k′, k′/k separable quadratic: X_K two points, only Y′ = X_K, descends; P¹_ℂ/ℝ: hnum fails; P¹×P¹, pr₁: Y = P¹; projectivity of Y from 0BDG (Varieties line 1320–1321, statement verified) | holds in each admissible case |
| `componentGraph` (230; §4.1) | any scheme; `Adj A B := A ≠ B ∧ (A ∩ B).Nonempty` | P¹ ⊔ P¹: 2 vertices 0 edges; V(xy): 1 edge; ∅: empty; V(x²+y²)_ℝ: 1 vertex, over ℂ 1 edge | simple, loopless, as SCH23 line 232 |
| `constantNumericalClasses_iff_componentGraphDescent` (247; §4.2) | `[IsAlgClosure k K]`, `[IsProper x]`, `hpure`; marked iso | P¹_ℂ/ℝ: 2 → 1 vertices, Num not constant; P¹_ℝ ⊔ Spec ℂ excluded by `hpure`; ∅: both hold; swapped e on P¹ ⊔ P¹ fails closure equation; P¹ over k[ε]/ε²: 1 vertex, ℤ; P¹_{k(a^{1/p})}/k: 1 vertex, multiplicity p | iff holds; vertex bijectivity reflects adjacency via `(D_i)_K = C_i` as sets and faithful flatness |
| `fibreComponentGraph_descends_of_constantNumericalClasses` (264; §4.8) | `[IsProper s] [Smooth s]`, `hsurf`, `hconst : IsIso (s.app ⊤)`, `hnum`, `[IsProper z]`, contraction, `hfz`, `[IsAlgClosed Ω]`, `hfib` | blow-up of a k-point on a smooth fibre: 2 vertices, 1 edge, e identity; generic point of fibre type: 1 = 1, closures S = S; Z = Spec k: fibre dim 2, excluded; birational, dimension-1 point of Z: fibre dim 0 (Z normal, f iso in codimension one), excluded; conic bundle over ℝ: hnum fails; S = ∅: hconst fails | true or excluded; closure-on-both-sides equation determines e |
| `residueField_eq_of_reducible_geometricFibre` (284; §4.9) | as above plus `hred` | blow-up fibre over a k-point: κ(a) = k; smooth fibre over a degree-2 point: hred fails; generic point: hred fails. Route: the negative geometric component descends (§4.7) to geometrically integral D ⊂ S, scheme-theoretic image W of D has W_Ω = Spec Ω, so W = Spec k | strengthening of SCH23 2.1(iii) (line 354) is sound |
| `lineBundle_lifts_completeDVR_of_h2_zero` (306; §5.3) | DVR, `IsAdicComplete (maximalIdeal R) R`, `[IsProper x] [Flat x]`, `Subsingleton (Cohomology (trivial X₀).obj 2)` | P¹_R, O(d), d = −1,0,1; abelian/K3 surface excluded (h² = 1); ∅ trivial; flatness needed so the thickening ideals are O_{X₀} ⊗ m^n/m^{n+1} | stated as an actual iso of modules |

### Target table (sampled rows with computed values; every Check block was recomputed)

| Target | Instances; values | Result |
|---|---|---|
| §0.1 pairing | P¹: m; P¹_ℂ/ℝ: 2·2 − 2·1 = 2; V(y²): 3 − 1 = 2; finite degree-n pullback: n·1 | laws hold |
| §0.2 d_C | P¹_ℂ/ℝ: m = 1, r = 2, d = 2; P¹_{k(t^{1/p})}/k: m = p, r = 1, d = p; DW22 lines 522–528 read as the quotient [L:k]/[K(C_L):K(C)] (fraction flattened by the extraction): 2/1 and p/1 agree | README's "quotient, not product" is right |
| §0.3 | P¹_ℝ vs P¹_ℂ: m = 0 both; generic line of P²_{k(u)}: degree 1 both | both directions |
| §1.2 route | r independent classes → r curves with nonzero minor; image lattice Λ′ of all of Pic has rank r; Pic/ℓ ↠ Λ′/ℓΛ′ of dimension r; Kummer injects Pic/ℓ into finite H²(μ_ℓ) | bound and freeness sound (uses all of Pic, not only the r classes) |
| §1.4 | E×E: det A = 2 − 2 = 0, det(A+I) = 4, det(A+I/2) = 7/4; id_S: N₁ = 0 | NE ≠ NE‾ |
| §2.3 | ℂ/ℝ: Br(ℂ) = 0; k[ε]: Br(k); ℝ×ℝ: (ℤ/2)² | |
| §2.4 | pointless conic: 2ℤ ⊂ ℤ, cokernel ℤ/2 = Br(ℝ) | |
| §2.6 | S₃: (12)(23) = (123), (23)(12) = (132) | nonabelian excluded |
| §2.9–2.10 | basis l_i, n_i l_i from §2.9, n′_i n_i l_i from §2.4, d = ∏; dℤ^ρ ⊂ image; σ(v) − v killed by d in torsion-free ℤ^ρ | both directions |
| §2.12 | counts 3 and 4 as above | |
| §3.2 | Bl_p P², g = id: E ↦ E, does not factor | |
| §3.4 | O(1,0): pr₁; O_X: X → X^aff; torsion L: Veronese B[s], P = X^aff | |
| §3.7 route | k ⊂ k₁ (Galois) ⊂ k′ (purely inseparable); purely inseparable stage first (§3.6), Galois averaging ⊗_σ L′^σ ≡ L′^{[k₁:k]} | consistent with SCH23 lines 276–288 |
| §4.3 | two lines: [[1,1],[1,1]]; E: [−1]; fibre: [0]; κ/k degree 2 doubles; V(x^p−a)·V(y^p−a) = p² | |
| §4.5 | E² = −[κ(x):k]; Bl at V(u²+1,v): −2 = (−1)+(−1)+2·0; A₂: q(1,1) = −2 | |
| §4.6 | I₂: q(a,b) = −2(a−b)², radical (a,a) | |
| §4.7 | (E₁−E₂)·E₁ = −1 | distinct classes |
| Layer 4 Examples | (C₁−C₂)·C₁ = −4 and −2 | |
| §5.1 | quadric over ℤ_(5): rulings over ℚ(i) conjugate, Pic rank 1; −1 = 2² mod 5, special fibre split, rank 2 | injective, not surjective; HW23 line 111 confirms completeness is needed |
| §5.2 | 11.a2 over 𝔽₇: affine counts (0,1,2,0,2,2,2), total 10; E(ℚ) = ℤ/5; a₇ = −2 | |
| §5.5 | H² = 4 − 3 = 1; H·ℓ = 2 − 3 = −1 | converse fails |
| §5.7 | CT20 lines 630–641: the four hypotheses match; Bl_p S, O(−E): (−E)·E = 1 nef, not a pullback | hypothesis (4) needed |
| §5.8 | P¹_ℂ/ℝ: 2/2 = 1; D = −2H on values 1, 2: −2, −4 | |
| §5.9 | P²: 1 = 2 − 1; F₂: 2 − 1; quadric threefold cone: P²-bundle over P¹, ρ = 2, exceptional fibre P¹ of codimension 2, so 2 − 0 = 2 vs Cartier rank 1 | |

## Not verifiable

- No Lean elaboration was run (read-only pass). The repair report's elaboration result (10 `sorry` warnings, no errors) and its `#check` comparison are taken as reported; the `CoeFun` on `Scheme.Hom` (`Scheme.lean:106`), `SetLike.GradeZero.instAlgebra` and the `IsTorsionFree` side condition of `IsAlgClosure` (`IsAlgClosed/Basic.lean:264–265`) were checked to exist at the pin but not elaborated here.
- Ownership against open pull requests was checked only through the `roadmaps grep` index (415 pull requests, index of 2026-10-29) and the sibling checkouts named in the brief; the supplier heads of AlgebraicModuliForArithmeticGeometry (#853), ComplexComparisonPartII (#848), ResolutionOfSingularitiesCharacteristicZero (#1199) and AbundanceStatement (#545) were read through `roadmaps show`.
- The six declared gaps are contracts; their delivery by the named suppliers is future work.
- Stacks tag 0CZV (Remark 99.7.10, cited at README line 863) was located by chapter file only; its line was not re-read this round (verified in round 1).

## Source issues

- **Misprint** in SCH23 at Lemma 1.1, printed p. 5, line 192: the source says the uniform exponent is an integer at least zero; it should be at least one, since zero makes the condition hold for every scheme; affects a stated result.
- **Misprint** in CT20 at Lemma 2.17, printed p. 17, line 640: the source says the descended divisor lives on a scheme called Y, which is not in the statement; it should be the base S of f; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "b3f8aafb2a89b8f1edcb0410e03a70c7e762312b", "job": "RT-AlgebraicModuliForArithmeticGeometryPartII~2b", "model": "fable", "worker": "chris-x8"} -->
