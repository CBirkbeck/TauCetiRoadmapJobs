# Review of PELModuli (pull request #966 at e6a4fe8)

**Verdict:** needs changes

The only blocking item is the push gate: its dependency check reports two UPWARD edges (R01). Both cited suppliers are on main and carry the cited content, so I believe the lines are a false positive of the merge-order placement, but the gate rule is binding and the board has to settle the placement before acceptance. Everything else I found is a P3 note. The mathematics of the sampled targets, the headline theorems and the Checks I recomputed is sound; the details are in the adversarial table below.

## R01 (P2) — Gate: dependency check reports two UPWARD suppliers

Location: `TauCetiRoadmap/PELModuli/README.md` lines 837, 1383, 1513, 2832, 3150 (ClassFieldTheory Layer 13) and lines 694, 740, 1513 (ProfiniteArithmetic Layer 0).

Claim: the gate at e6a4fe8 is `FAIL` with `depcheck=2`. Running the check myself gives:

```
not movable: PELModuli consumes ProfiniteArithmetic (#324) and is consumed by SelmerIwasawaCohomologyPartII (#169), which comes first: moving PELModuli after ProfiniteArithmetic would put a supplier after a consumer, a cycle through PELModuli
UPWARD: PELModuli (#106) -> ClassFieldTheory (#258) at README lines [837, 1383, 1513, 2832, 3150]
UPWARD: PELModuli (#106) -> ProfiniteArithmetic (#324) at README lines [694, 740, 1513]
depcheck: 163 roadmaps, 1183 edges, 2 problem(s)
```

Witness that the citations themselves resolve on main: `TauCetiRoadmap/ClassFieldTheory/README.md` line 1799 is the heading of Layer 13, and lines 1805 and 1818 state `cyclicHasseNorm` and `isGlobalNorm_iff_isLocalNormEverywhere`; `Completed/ProfiniteArithmetic/README.md` line 187 is Layer 0 and lines 306–307 state the product decomposition of `Ẑ` over primes. The merge-order file's own header allows consuming roadmaps on main. So the README text needs no repair for this; the exact lines above are, in my reading, a false positive produced by listing two main-branch roadmaps (which have open revision pull requests) below PELModuli in `ORDER.txt`, and the `not movable` line shows the author cannot fix it by reordering. Repair: the board confirms that main-branch suppliers are exempt from the UPWARD rule, or places ClassFieldTheory and ProfiniteArithmetic above PELModuli in the merge order. If instead the board insists on the rule, the only README-side repair is to drop the two citations, which would leave the Hasse norm theorem (M0.9(5), M0.24, M3.2) and the `Ẑ` decomposition (M0.6, M0.7) unowned; I do not recommend that.

## R02 (P3) — Cited supplier declaration `alternating_elementaryDivisors` does not exist

Location: `TauCetiRoadmap/PELModuli/README.md` lines 174, 601, 611: "AbelianSchemesAndArithmeticModuli A5.4(1) `alternating_elementaryDivisors`".

Claim: the name is attributed to AbelianSchemesAndArithmeticModuli A5.4(1).

Witness: at the head of that roadmap (#849) the name occurs neither in its README nor in its `Suggested.lean`; a search of all roadmaps on main and at open heads finds it only in PELModuli. The statement itself is there: A5.4 proves `polarizationType`, whose part (1) is the alternating elementary-divisor normal form `[[0,D],[−D,0]]` with `d₁ | ⋯ | d_g`.

Repair: cite "A5.4 `polarizationType` (1)" in the three places.

## R03 (P3) — Wrong namespace on a ShimuraVarieties declaration

Location: `TauCetiRoadmap/PELModuli/README.md` line 1406: "`TauCeti.CM.CMType.reflexField`".

Claim: the type-reflex field agrees with a ShimuraVarieties declaration of that name.

Witness: ShimuraVarieties' `Suggested.lean` (#933) declares `reflexField` inside `namespace TauCetiRoadmap.ShimuraVarieties` and `namespace CMType`, so the declaration is `TauCetiRoadmap.ShimuraVarieties.CMType.reflexField`; its README §5.1 writes it as `CMType.reflexField`. No `TauCeti.CM` namespace exists at the pin or in that roadmap.

Repair: write "ShimuraVarieties §5.1 `CMType.reflexField`".

## R04 (P3) — Unsupported remark that the source's signature-type condition "is not enough"

Location: `TauCetiRoadmap/PELModuli/README.md` M1.3, line 1620: "(Definition 3.4.3, p. 149; checking characteristic polynomials of single elements over a finite residue field is not enough)".

Claim: the roadmap's definition (equality of multivariable determinant polynomials) is stated as strictly stronger than the cited definition, which is the single-element characteristic-polynomial identity.

Witness: ltxzz-2022 line 1617 defines signature type exactly by `charpoly(i(a) | Lie) = ∏_τ (T − τ(a))^{r_τ}` for every `a ∈ O_F`, as an identity in `O_S[T]` over the whole base, not fibrewise. Over a field `κ` with `p` unramified the two conditions agree: `O_F ⊗ 𝔽_p = ∏ 𝔽_{p^{f_i}}`; put a primitive element `x` of the `i`-th factor and `0` elsewhere; the characteristic polynomial of that `a` is `T^{N−Σ} ∏_{τ over i} (T − τ(x))^{r_τ}` with pairwise distinct `τ(x)`, so unique factorisation in `κ[T]` returns every `r_τ`. The roadmap's own Picard Check (`detCondition_splitting_picard`) is such an instance.

Repair: either delete the clause, or state the precise claim (the single-element identity on a nonreduced base need not imply the polynomial identity) and add a Check with a witness base.

## R05 (P3) — Works cited in the text are absent from `## References`, and a Check cites software documentation

Location: `TauCetiRoadmap/PELModuli/README.md` line 803 (Milne, *Algebraic Groups*, Proposition 3.50), line 1361 (Lang 1956), line 2109 (Kohel, thesis), line 2685 (Rapoport–Richartz), line 3563 (Conrad, *Modular curves*); lines 2119–2121 (two Sage reference-manual URLs inside a Check).

Claim: every cited work is listed in References; sources are mathematical texts.

Witness: the References section (lines 4138–4170) lists none of the five works. The Check at lines 2112–2121 already proves `H_{−23} ≡ T³ mod 5` by the Frobenius computation `β = π − ρ`, `β² − β + 6 = 0`, which I recomputed (see the table); the Sage links add nothing mathematical and software documentation is not a source under the house rules.

Repair: add the five works to References with locators (Lang: Amer. J. Math. 78 (1956); Kohel: Berkeley thesis 1996; Conrad: the notes actually meant; Milne: *Algebraic Groups*, CUP 2017; Rapoport–Richartz: Compositio 103 (1996)); delete the two Sage links.

## R06 (P3) — A named consumer does not exist, and M3's Dependencies omit two suppliers that M3.2 needs

Location: `TauCetiRoadmap/PELModuli/README.md` line 4133 ("AutomorphicPadicLFunctions"); lines 2800–2801 and the M3 `### Dependencies` paragraph (lines 2717–2722).

Witness: the open-pull-request index has `AutomorphicPadicLFunctionsPartII` (#1543) but no `AutomorphicPadicLFunctions`, and main has none. M3.2's `*Needs:*` line cites ProfiniteCohomology Layers 5, 7, 10 and Chebotarev Layer 10 (both exist: `TauCetiRoadmap/ProfiniteCohomology/README.md` lines 960, 1168, 1549; `Completed/Chebotarev/README.md` line 410), but neither appears in M3's Dependencies paragraph nor in the Scope's supplier list.

Repair: name the intended consumer; add "ProfiniteCohomology Layers 5, 7 and 10; Chebotarev Layer 10" to M3's Dependencies and to the Scope list of cited roadmaps.

## R07 (P3) — The route for `detPoly_classifies` covers only separable centres; the statement is more general

Location: `TauCetiRoadmap/PELModuli/README.md` M0.15, lines 1176–1189, and `TauCetiRoadmap/PELModuli/Suggested.lean` line 62.

Claim: the Lean statement is for every finite-dimensional semisimple algebra over the field, and the README says the same-field statement "applies to any finite-dimensional semisimple algebra over that field"; the route cited is Lan's.

Witness: lan-thesis lines 1248–1299 (Lemma 1.1.2.15 and Proposition 1.1.2.16, pp. 16–18) argue through embeddings of the centre into `K^sep`, which exist only when the centre is separable over `k`; the README's sentence "product of distinct embedding linear forms" is that argument. For `k = 𝔽_p(t)`, `C = k(t^{1/p})`, the generic norm is `Σ_j X_j^p t^j`, a `p`-th power over `k̄` with no linear factor over `k`. The statement is nevertheless true: for a simple factor with simple module `S`, `Det_{C|S}` is a positive power of one `k`-irreducible polynomial (its `k̄`-factors form a single Galois orbit, so every `k`-factor is a power of the orbit product), the factors of different simple factors live in disjoint variable sets, and unique factorisation in `k[X]` returns the multiplicities.

Repair: add this power-of-an-irreducible step to the route of M0.15 (or restrict the Lean statement to a separable centre, which I do not recommend since the general form is correct).

## R08 (P3) — Annals locators for Bijakowski–Pilloni–Stroh cannot be matched to the readable version

Location: `TauCetiRoadmap/PELModuli/README.md` M0.21 (lines 1229–1247) and M2.16 (lines 2713–2716): "Hypothèse 1.1.1 (p. 980)", "Remarque 1.1.3, p. 981", "Lemme 1.1.4, p. 981", "§1.5, p. 987, Remarque 1.5.1, p. 988".

Witness: the arXiv version (bps-2016, arXiv:1212.2035v2) has a different structure: §1 is rigid geometry, the unitary setting is §5 with an unnumbered "Hypothèse" at line 1481 (complete splitting in the reflex field) and places of `F₀` above `p` allowed to be split or inert (line 1400). The README describes Hypothèse 1.1.1 as requiring every place of `F₀` above `p` to split in `F`, which is not what the arXiv text requires. The Annals text is paywalled, so I could not check which is right.

Repair: record the Annals citation as uncertified in the manifest, and either restate M0.21's hypothesis as the arXiv version has it (reflex-field splitting, with Frobenius-orbit constancy proved along each inert place) or add a `version_note` saying the Annals numbering is used and the split hypothesis is the Annals one.

## Verified sound

**Gate and build.** `lake env lean TauCetiRoadmap/PELModuli/Suggested.lean` elaborates in the worktree with exactly three warnings, all `declaration uses sorry` (lines 62, 70, 80). The gate's other scanners are all zero. I put `#check @` of all four declarations in one scratch file and elaborated it: every elaborated type carries exactly the binders its README statement needs (`detPoly` keeps `Module.Free`, `Module.Finite`, `Fintype ι`, `DecidableEq ι`; both classification theorems keep `Field k`, `FiniteDimensional k C`, `IsSemisimpleRing C`, and the second keeps `CharZero k`; the conjugacy theorem keeps `FiniteDimensional ℝ V`). Nothing changed.

**One-tactic probe.** On scratch copies with each `sorry` replaced by `simp`, `rfl`, `infer_instance` (and `exact?` not attempted because the first three already failed): `simp` makes no progress on the two classification theorems and leaves the conjugacy goal open; `rfl` and `infer_instance` fail on all three. No declaration is padding. Headline coverage: the README's headline table names 54 targets; the three stated are those the pins can carry. I agree with the module docstring that the others are not statable at the pins: Tau Ceti has `AbelianVariety` over a field only (no abelian schemes, duals, polarizations or Tate modules), no algebraic spaces or moduli stacks, no complex-analytic spaces, no Shimura data, no Galois cohomology of algebraic groups, and no Dieudonné or display carriers; the module docstring names each missing carrier.

**Library declarations opened at the pins.** `LinearMap.polyCharpoly` at `Mathlib/Algebra/Module/LinearMap/Polynomial.lean:362` (with `polyCharpoly_baseChange` :392 and `polyCharpoly_map_eq_charpoly` :400); `Matrix.det_eq_sign_charpoly_coeff` at `Mathlib/LinearAlgebra/Matrix/Charpoly/Coeff.lean:150` (so `detPoly` is the determinant of the generic element, and `(-1)^{rank}` is the right sign); `TauCeti.SymplecticForm` at `TauCeti/Geometry/Symplectic/AlmostComplex.lean:343` (alternating and nondegenerate), `TauCeti.AlmostComplexStructure` :56 (`J ∘ J = −1`), `SymplecticForm.Tames` :446 (`0 < ω v (J v)`), `SymplecticForm.Compatible` :455 (invariance plus positive definiteness of `ω(·, J·)`), `SymplecticForm.exists_compatible` at `ExistsCompatible.lean:188`; `TauCeti.AlmostComplexStructure.IsRiemannForm` at `TauCeti/Geometry/Hodge/WeightOne/RiemannForm.lean:80` (positivity `E_ℝ(Jx, x) > 0`, as the Conventions say); `TauCeti.Hodge.isPolarization_of_weilOperator_invariant_on_realPoints_of_pos` at `WeightOne/Polarization.lean:122`. No conjugacy theorem for compatible structures and no positive-involution notion exists in Tau Ceti (`Geometry/Symplectic/Transport.lean` and `StandardCompatible.lean` have only transport and the standard form), so the headline and `detPoly` duplicate nothing.

**Cross-roadmap citations resolved (every one I checked exists where cited).** On main: ClassFieldTheory Layer 13 (`cyclicHasseNorm`, `isGlobalNorm_iff_isLocalNormEverywhere`); ProfiniteArithmetic Layer 0 §0.3; RestrictedProducts; NumberFieldArithmetic Layer 5 (finite places; archimedean completions are Mathlib's, consistent with the README's use); Chebotarev Layer 10; ProfiniteCohomology Layers 5, 7, 10; GlobalNumberFields Layer 11 `NumberFieldOrder`; LocalFieldsRamification Layer 2; ReductiveGroups Layers 3, 6, 7; IntegralLattices (symmetric carrier, as M0.4 says); ModularCurves §§0E, 2E (and the autoduality `P ↦ O([P]−[0])` in 2D, which is what M5.3's inversion adapter assumes), 3C, 5B (`Y(N,ζ)` is the fibre of `e_N(P,Q)`), 7D, 9E; SchemeAndStackFoundations §§0.14, 0.20, 0.21, 1.15, 1.18, 1.19, 1.21, 1.23, 2.3, 3.8, 4.1–4.4, 4.10, 4.14 with every named declaration; EtaleCohomologyFoundations §§F.0.2, F.2.5, 0.11, F.4.1–F.4.6, F.5, F.6; ClassicalArithmeticCompletion §§7.4, 7.21, 7.49, 7.56 with `IntegralOrder.IsOrder`, `isOrder_iff`, `IsMaximalOrder`. At open heads: AbelianSchemesAndArithmeticModuli A1, A2.4, A2.6, A2.8, A3.3–A3.9, A4.1, A4.3, A4.7, A4.8, A4.9, A4.CR.7.2, A5.2 (positivity `E(Jv,v) > 0`, `RiemannForm.homological` with Weil operator `−J` and `Q = −E`, `RiemannForm.hodgeDual`), A5.4(1), A5.6, A6.14, A6.15 (`realRosatiDecomposition` with exactly the cyclic, star-invariant, positive trace hypotheses the README states), A6.18, A6.20, A6.26, A6.27, A6.38, and the A3.5 inversion identity `e_n(x, ι_E y) = e_n(x, λ_E y)^{-1}`; AlgebraicModuliForArithmeticGeometry Layers 2, 3 (§3.5 `ModuliDescent.polarizedDescentComparison`), 4, 5, 7, 8 with every named declaration; ShimuraVarieties §§P.1–P.6, Layer 0, 2.7, 3.2, 3.4a, 4.1–4.4, 4.8, 4.10, 4.12 (`CanonicalModel.unique_iso`), 5.0, 5.1, 5.10, 5.11, 6.1, 6.2, 8.11–8.13, with `TauCeti.Shimura.PureDatum`, `real_approximation_tori`, `rational_siegel_moduli`, `siegel_moduli_uniformization`, `geometricArtin`, `main_cm`, `cm_polarization_level`, `hodge_inheritance`, `hodge_canonical` as that README's target names; ReductiveGroupsPartII RG2.3.7 (`Lang.lang_surjective`, declared in its `Suggested.lean`; the `H¹(𝔽_q, H) = 1` consequence is stated there) and RG2.5.1 `AbsoluteRootData`; AdelicAlgebraicGroups §§1.2, 1.3, 3.4, 4.1 (coordinate torsors, local vanishing for simply connected groups, real Hasse kernel), 4.3; ComplexComparisonPartII §§C−1.1, C−1.2, C−1.3 (`SpaceAnalytification.quotient`), C0.4; ArithmeticGaloisDuality R02.4.6 (all-place Sha duality for finite modules over a global field, archimedean terms included); FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2, R07.2.15, R07.2.16 (`slopeSequence`), R07.2.20 (`M_cov(G) = M(G^D)`); NeronModelsAndSemistableAbelianVarieties: the citations tool flagged "R11.3" as missing, but that roadmap says (line 652 of its README) that consumers refer to its layers as R11.1–R11.6, and Layer 3 §3.10 is "Semistable reduction after a finite separable extension", so the citation is fine. ModularCurvesPartII §§1.5 and 11.5 exist and say what M5.3 and M4.6 use. Ownership: the open roadmaps that mention PEL moduli (ShimuraData #1038, IgusaVarietiesAndTorsionConcentration #1090, ShimuraCompactifications #1053, HilbertModularVarietiesAndShimuraCurves #1005, PerfectoidShimuraVarieties #1085, EndoscopicTransferAndUnitaryTraceComparison #999) all cite PELModuli for the data and moduli problems; none constructs them. Open pull requests not listed with files in the brief were not checked beyond the index search.

**Sources read at the text (the seeded sample and the headline locators).**

- *Tate lattices and localized homomorphisms* (M1.10): lan-thesis line 4716 (Lemma 1.3.5.2, p. 128), line 4751 (Proposition 1.3.5.3, p. 129), line 4773 (Corollary 1.3.5.4, pp. 129–130): the correspondence between equivalence classes of prime-to-`□` isogenies and `π₁`-invariant open compact subgroups of `V^□A_{s̄}` over a connected locally noetherian `S` with residue characteristics `0` or in `□`, with `O`-invariant subgroups matching actions integral on `O`; exactly the hypotheses and conclusion of `primeToLatticeRealization`. Definition 1.3.1.15 is at line 4175 (p. 110). The uniqueness and integrality criterion `localizedHom_integral_of_tate` is the step at lines 5727–5733 (p. 159).
- *Integral–rational comparison* (M1.10): lan-thesis line 5687 (Construction 1.4.3.1, p. 158), line 5709 (Proposition 1.4.3.3, p. 159), line 5710 (Remark 1.4.3.4: fibrewise equivalence), proof lines 5714–5800 (pp. 159–161): injectivity through `V^□(f)(T^□A) = T^□A′` and `r = 1` from `𝔸^{∞,□,×} = ℤ_(□),>0^× · Ẑ^{□,×}`; essential surjectivity by realizing `α̂(L ⊗ Ẑ^□)` and rescaling by a unique positive `r`. The README's route is this one.
- *Integral torsors of the CM torus* (M0.24): ltxzz-2022 line 1895 (`T₀` over `ℤ[(disc F)⁻¹]`), line 1900 (Remark 3.5.2, p. 156: `GU(W₀) ≅ T₀ ⊗ ℤ_(p)` and similarity classes `≅ ker¹(T₀)`, finite), lines 1916–1919 (Definition 3.5.3, p. 157, with `≥ 0`), lines 1942–1944 (finite étaleness stated without proof; `T_p` the minimal clopen containing `w⁻¹(W₀)`). The integral `H¹` vanishing is the roadmap's own Lang–Hensel argument; its Lang input is ReductiveGroupsPartII RG2.3.7 and its lifting input Stacks 0H74 (more-algebra text line 1784: smooth algebras over henselian pairs lift maps). Lang 1956 itself: see Not verifiable.
- *Covariant Hodge cocharacter* (M2.16): wedhorn-1999 lines 266–274 (§1.3.1, p. 580–581: `h` of type `{(−1,0),(0,−1)}` with `(v, h(√−1)w)` positive), lines 278–292 (§1.3.3, p. 581: `μ(D) = h_ℂ ∘ i₁`, its `G°(ℂ)`-class and reflex field), lines 472–485 (§2.1.4, p. 586: the determinant condition in the form `det(b | Lie X) = det(b | V₀)` with `V₀` the weight-`0` space of the cocharacter). With Deligne's convention `μ_h` has weight `1` on `V₀`, so the cocharacter with weight-zero space `V₀` is `ω μ_h⁻¹`, as the README defines `μ_cov`; recomputed in the table.
- *PEL Newton point and averaged Hodge cocharacter* (M2.16): wedhorn-1999 lines 353–361 (§1.4.3, p. 583: `μ̄` as the Galois average of the dominant representative), lines 362–402 (§1.5, pp. 583–584: `ν(x)` from the isocrystal with `G`-structure via Rapoport–Richartz 3.4–3.5, independent of `k`), lines 404–418 (§1.6.1–1.6.2, p. 584: `M(D)` and the Density Theorem, also for disconnected `G`), lines 420–437 (§1.6.3, pp. 584–585: for connected `G`, ordinary locus nonempty iff dense iff `E_v = ℚ_p`), lines 441–462 (§2.1.1, p. 585). The README's `wedhornOrdinary` restricts to connected type A or C, which is within these.
- *Finite unitary centre and its all-place obstruction* (M3.2): kottwitz-1992 lines 943–949 (§7, p. 393: components and simple connectivity), lines 950–970 (Hasse principle by case, `D` for `n` even and odd), lines 971–996 (p. 394): `Z₀ = Z(G^der)`, the two-row diagram with `x ↦ xⁿ`, `H¹(ℚ_v, D₁)` killed by `2`, injectivity of `H¹(Z) → H¹(D)`, `ker²(ℚ, Z₀) = 0` by Tate duality with `ker¹(ℚ, X^*(Z₀))`, Shapiro to `F₀`, and a place inert in `F`. The README's target states exactly this chain, with ArithmeticGaloisDuality R02.4.6 in place of Tate's reference; the identification `Z₀ = D₁[n]` and `X^*(Z₀) = Ind(ℤ/n(χ))` are the roadmap's own and I recomputed them (table).
- Headlines: lan-thesis line 1278 (Proposition 1.1.2.16, p. 18) and line 1306 (Definition 1.1.2.17, p. 19); milne-svi line 3402 (Proposition 8.1, p. 79, with Remark 8.2 on characteristic `p`); kottwitz-1992 lines 698–700 (Lemma 4.3, p. 388: two positive `h` are conjugate under `G₁(ℝ)`, for `B` a semisimple real algebra with positive involution). The Lean statement has an arbitrary star ring `O` acting; the real span of `ρ(O)` is a star-closed subalgebra whose star is the adjoint for the positive form `ω(x, Jy)`, hence positive, so Kottwitz's lemma applies to it.
- Also checked: kottwitz-1992 lines 745–907 (§5, pp. 389–392: data, determinant condition and why determinants, representability, case division, `p ≠ 2` in Case D, properness when `End_B(V)` is a division algebra via the toric part of the Néron model), lines 1170–1260 (§8, pp. 398–400: pieces indexed by `ker¹`, the twist by `(a, β)` with `a` totally positive and a unit above `p`); milne-svi lines 3771–3773 (Proposition 8.14, p. 86), 3874–3891 (Lemma 8.20, p. 89, proof through `G(ℝ) → T(ℝ)^+` and real approximation), 3892–3905 (Lemma 8.21, p. 89), 3624, 3673, 3686, 3703, 3705, 3744, 3829 (Propositions 8.7, 8.10, 8.12, 8.13, Remark 8.9, Definition 8.11, Theorem 8.17 on pp. 83–88), 3066 and 3223 (Proposition 6.3 p. 70, Theorem 6.11 p. 74), 1531, 1686, 1742 (Proposition 3.6 p. 34, Theorems 3.12 and 3.14 pp. 38–39), 2374 (Theorem 5.4 p. 54), 4835, 5084, 5395, 5490 (Definition 12.2, Lemma 13.3, Propositions 14.12, 14.14); lan-thesis-errata lines 127–137 (p. 4, Definition 1.2.1.5: uniqueness of the multiplier needs `L ≠ 0` and flat `R`, `G = G_m` for `L = 0`), 233–254 (p. 7: Lemma 1.2.5.3 and the retraction of Lemma 1.2.5.10 in favour of a finite extension `F₀′` unramified at prescribed primes), 363–365 (p. 10: actual polarization), 407–429 (p. 11: Remark 1.4.3.8 retains `O`; Remark 1.4.3.11 needs finite `□` and excludes type D; the vague sentence of Remark 1.4.4.3 removed), 577–579 (p. 15: formal smoothness), 588–599 (p. 16: `S₀` with one or infinitely many points, the open immersion into a larger `□′`, and the completed-ring correction to Proposition 2.3.4.2); lan-book-errata lines 26–28 (p. 1); lan-thesis-revision lines 5580–5610 (Lemma 1.4.4.2, pp. 105–106: open-and-closed immersion, unique `G(ℤ_p)`-orbit); lan-intro-sh-ex lines 3911–3935 (§5.1.3, p. 54: full group, `D = G(ℝ)·h₀`) and 4019–4029 ((5.1.3.7), p. 55: open-and-closed immersion and the union over the `G^{(j)}`); borel-serre-1964 line 1869 (Théorème 7.1, p. 158); lipnowski-tsimerman lines 180 (Corollary 2.2, p. 5), 643 (Remark 4.2, p. 17), 646 (Definition 4.3, p. 17); Stacks 0H74, 0539, 02GU, 03GR, 035L, 035I, 035J, 033C, 03GV, 035S all located and saying what the README uses them for. Every Lan thesis locator I mapped (36 statements) lands on the page the README gives, with the thesis page equal to the PDF page minus 40.

**Adversarial table.** One row per statement; the values are the ones I computed.

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `detPoly` (M0.14) | `O = ℤ`, `M` rank `r`; `M = 0`; `O = ℤ[i]`, `M = ℂ` with `i ↦ ±√−1` | constant coefficient of `polyCharpoly` is `det(−A) = (−1)^r det A`, so `detPoly = det(Σ X_j φ(b_j))`; `X^r`; `1` for the zero module; `X₁ ± √−1 X₂` | sound | none |
| `detPoly_classifies` (M0.15) | `C = k × k` over `𝔽_p`; `C = M₂(ℚ)`; `C = 𝔽_p(t^{1/p})` over `𝔽_p(t)`; `C = 0` | `𝔽_p^p` vs `0`: `X^p ≠ 1` (traces both `0`); generic `2×2` determinant for the simple module, its square for two copies; inseparable centre: norm form `Σ X_j^p t^j` irreducible over `k`, so `S^m ↦ (norm)^m` still separates `m`; zero algebra forces `M = N = 0`, `1 = 1` | sound as stated | R07 (route only) |
| `detPoly_classifies_charZero` (M0.15) | `C = ℚ × ℚ`; `C = 𝔽_p`, `pM` | traces `(r₁, r₂)` on the idempotents recover multiplicities; in char `p` the trace of `𝔽_p^p` is `0`, hence the `CharZero` binder is needed and present | sound | none |
| `compatibleComplexStructures_conjugacy` (M0.11) | `V = 0`; `O = 0`; `V = ℝ²`, `ω(e,f) = 1`, `J e = f`, `J′ = −J`; `O = ℤ[i]` with `ρ(i) = J` | `V = 0` and `O = 0` are trivial (`O = 0` forces `End V = 0`); `−J` is not compatible (`ω(e, −Je) = −1 < 0`), so the pair `(J, −J)` is excluded by `hJ′`; `g`-adjoint of `ρ(b)` is `ρ(star b)` because `ω(ρ(b)x, Jy) = ω(x, ρ(b*)Jy) = ω(x, Jρ(b*)y)`, so the real span of `ρ(O)` has a positive involution and Kottwitz 4.3 applies | sound | none |
| M0.1 Checks | `ℚ`, `M_n(ℚ)` transpose, `M₂(ℚ)` adjugate at `diag(1,−1)` | `x² > 0`; `Σ x_{ij}² > 0`; `x x* = det(x)·1`, `Trd = −2`, regular trace `−4` | sound | none |
| M0.2 Albert types | `ℚ`; imaginary quadratic; definite and indefinite quaternion; `ℚ × ℚ` with swap | C, `I_bad = 1`; A; D with `B ⊗ ℝ = ℍ`; C; swap gives `x x* = 0` at `(1,0)` | sound | none |
| M0.3 discriminants | `ℤ[i]`, `M_n(ℤ)`, `M₂(ℤ)` regular vs reduced, `ℤ[2i]`, Hurwitz order | Gram `diag(2,−2)`, det `−4`; permutation matrix of `(ij) ↦ (ji)`, sign `(−1)^{n(n−1)/2}`; `−16` vs `−1`, duals `½M₂(ℤ)` vs `M₂(ℤ)`; `−16`; reduced discriminant `2`, `Disc = 4ℤ` | sound | none |
| M0.4 dual index | rank `4` blocks `1, d`; `(ℤ, xy)` | Gram det `d²` = index; symmetric form is not alternating though doubly dual | sound | none |
| M0.5 positivity | Gram `−Matrix.J` (`= [[0,1],[−1,0]]` blockwise), `Je = f`, `Jf = −e`; `J ↦ −J` | `ψ(e, Je) = ψ(e,f) = 1`, `ψ(f, Jf) = −ψ(f,e) = 1`; negated `J` gives `−1` | sound | none |
| M0.7 similitudes | genus one `diag(2,1)`; genus two `diag(2,1,1,1)`; `5J` over `𝔽₅` | multiplier `det = 2`; scales `⟨e₁,f₁⟩` by `2`, `⟨e₂,f₂⟩` by `1`, not a similitude; form vanishes, identity has multipliers `1` and `2` | sound | none |
| M0.9 `galoisH1_mu2`, `ker1_infinity_essential` | class of `2`; `SL₁(ℍ_ℚ)`, `Nrd = −1` | `2` is a square in `ℚ_p` iff `p ≡ ±1 mod 8`, nonsquare in `ℚ₂`; local reduced norms surjective at finite places, positive at `ℝ` | sound | none |
| M0.9(4) route | `c ∈ ker¹(ℚ,G)` | image in `H¹(ℚ,D)` locally trivial hence trivial; `c` from `c′ ∈ H¹(ℚ,G^der)`, `c′_∞ = δ(d)` with `d ∈ D(ℝ) = D(ℚ)D(ℝ)^+`; twist by `d′ ∈ D(ℚ)` kills `c′_∞`; Kneser plus real injectivity kills `c′` | matches milne-svi lines 3877–3891 | none |
| M0.13 `signature_gaussian_trace` | `K = ℚ(i)`, `H = xȳ`, `δ = i/2`, basis `(1,i)` | `ψ(1,i) = Tr(½) = 1`, `ψ(i,1) = −1`, `ψ(1,1) = 0`; `ψ(x, ix) = ‖x‖² = a² + b²`; `(1,0)` at `τ(i) = i` | sound | none |
| M0.14 Checks | `x = 1`, rank one; `𝔽₉`, `i ↦ ±τ(i)`, `M = k³` | both sides `−1`; traces `3τ(x) = 0`; `(X₁ + τ(i)X₂)³ ≠ (X₁ − τ(i)X₂)³` since `τ(i) ≠ −τ(i)` in char `3` | sound | none |
| M0.16 `reflexField_picard`, `reflexField_U11` | `K = ℚ(√−3)`, `(2,1)`, `a = √−3`; `(1,1)` | `2√−3 − √−3 = √−3 ∉ ℚ`; `Tr_{K/ℚ}(a) ∈ ℚ` | sound | none |
| M0.18 `detCondition_zero`, `𝔽₃` families | `V₀ = 0`; `φ(a) = a·diag(1,0)`, `ψ = 0` | reference polynomial `1` forces `M = 0`; both determinants `0`, traces at `1` are `1` and `0` | sound | none |
| M0.20 odd `p` Check | `ψ(e₁,f₁) = 1`, `ψ(e₂,f₂) = p`, `Λ′` with `p⁻¹f₂` | `Λ^#/Λ ≅ (ℤ/p)²`, Gram det `p²` vs `1`; a similitude forces `0 = 4v_p(c) + 2` | sound | none |
| M0.21 orbit constancy | `x ∈ O_{F,π_i^+}`, `diag(x,1,…,1)` | determinant `∏_j σ_j(x)^{a_j}` is `ℤ_p`-valued iff Frobenius-invariant iff `a_j` constant on the orbit (independence of characters); at `x = 1` the value is `1`, adding the identity would give `2` in rank one | sound | R08 (locators only) |
| M0.22–M0.23 | `ℚ(i)`, `⟨x,y⟩ = Tr(∓i xȳ)` | `Tr(i x x̄) = 0` (alternating); `⟨i,1⟩ = 2`, `⟨1,i⟩ = −2`; `ψ_PEL(1, i) = 2`; `⟨ix, x⟩ = 2‖x‖² ≥ 0` so type `Φ(i) = i` | sound | none |
| M0.24 integral torsors | `ℚ(i)`, `p = 5`; `p = 3`; `μ₂/ℤ₃` | `T₀ = G_m²`; `T₀ = Res_{ℤ₉/ℤ₃} G_m`, special fibre connected; `x² = 2` has no `𝔽₃`-point (squares mod `3` are `0, 1`) | sound | none |
| M0.25 `gcmType_reflex_imagQuad` | `(n−1)τ + τ̄` | swapped type equals `Ψ` iff `n − 1 = 1`; reflex `F` for `n ≠ 2`, `ℚ` for `n = 2` | sound | none |
| M0.26 reflexive closure | `ℚ(√2, i)` | types induced from `ℚ(i)` or `ℚ(√−2)`, intersection `ℚ`, closure `F` | sound; published Definition 3.3.2 (ltxzz-2022 line 1542) is the intersection, arXiv v3 line 1288 the composite | none |
| M0.27 `tauComposite_mixedQuartic` | `X⁴ + 6X² + 7` at `17` | discriminant `16·7·(36−28)² = 7168`; `(X²−8)(X²−3) ≡ X⁴ + 6X² + 7`; `6² ≡ 2`, `(±5)² ≡ 8`; `3` is a nonsquare mod `17` (squares `1,4,9,16,8,2,15,13`); stabilizer of `2τ₀ + τ₁ + τ₁^c` fixes `τ₀(F)`; `psiField = ℚ₁₇` for `τ_∞ = τ₀`, `K₂` for `τ₁` | sound | none |
| M1.4/M1.5 Checks | `GL₂(𝔽₃)`; type `(3)` at `n = 3`; `λ = 2λ_can`, `n = 1` | `(9−1)(9−3) = 48`, `24` per multiplier; completed lifts of a fixed `α₃` differ by `h ≡ 1 mod 3` with `det h ≡ 1`, so the multiplier mod `3` is pinned; `2`-adic valuation of the Gram determinant `0` on `L`, `2` on `T₂A` | sound | none |
| M1.6 `rationalLevel_not_integral` | `λ = 3λ_can`, `□ = {2}` | degree `9`; multiplier `3ν₀ det h` has `3`-adic valuation `1`, image `3T₃G_m` | sound | none |
| M1.7 genus two basis | `diag(−1,1,1,1)` in `(e₁,e₂,f₁,f₂)` | `⟨−e₁,f₁⟩ = −1 ≠ 1 = ⟨e₂,f₂⟩` mod `3` | sound | none |
| M1.10 Checks | `Λ = 3T^□A`, `(1/3)T^□A`; `α̂ = 3α₀` | `f = id/3` sends `3T` to `T`; `[3]` sends `(1/3)T` to `T`; multiplier `9`, transported polarization `9λ`, `r = 1/9 ∈ ℤ_(2)^×` | sound | none |
| M1.13 Hecke at `3` | `g = diag(1,3)`, `K(3)` | `gKg⁻¹` has lower-left entries in `9ℤ₃`, index `3` in `K`; `#ℙ¹(𝔽₃) = 4` | sound | none |
| M1.14 `K = ℚ(√−23)` at `5` | `E : y² = x³ + 1` | `(−23/5) = (2/5) = −1`, inert; `a₅ = 0`, `π² = −5`; `πρ = ρ²π` since `ζ₃⁵ = ζ₃²`; `β = π − ρ`: `β² − β + 6 = 0`, `β† = 1 − β` | sound | R05 (Sage links) |
| M2.2 `arithmeticNeat_not_PinkNeat` | `χ₃(u₃) = χ₅(u₅)` | `χ₃(−1) = −1 ≠ χ₅(−1) = 1`, so `−1 ∉ H`; `u₅` of order `4` with `χ₅(2) = −1`, `u₅² = −1` | sound | none |
| M2.6, M2.10 dimensions | Siegel `g`; Picard `(2,1)`; Hilbert; CM | `g(g+1)/2`; `2·1 = 2`; `[F:ℚ]`; `0` | sound | none |
| M2.11 properness | `B` simple, `V` simple | `dim X^*(T)_ℚ ≤ dim V/2 < dim S` for the unique simple `S = V`, so `T = 0` | matches kottwitz-1992 lines 880–892 | none |
| M2.14 degrees | `α^∨λ_Bα = ϖ^e λ_A` | `2ρ + d_B = 2Ne + d_A`; `(0,0,1)`, `(0,2,1)`, `(2,0,1)`, `(2,2,1)`, `(2,0,0)` give `N, N−1, N+1, N, 1` | matches ltxzz-2022 lines 1777–1796 | none |
| M2.15 `display_deformation_skew` | `N = [[0,1],[0,0]]`, `J = [[0,1],[−1,0]]` | `NᵀJ = [[0,0],[0,1]]`, `JN = [[0,0],[0,−1]]`, sum `0`; symmetric identity pairing gives `Nᵀ + N ≠ 0` | sound | none |
| M2.16 cocharacters | `μ_h`, `ω`, `μ_cov`; CM by `ℚ(i)` at `5`; inert Picard `(2,1)` | `μ_h` weights `(1,0)` on `(V₀, V₀^c)`, `ν(μ_h) = z`; `ν(ω) = z²`; `μ_cov = ω μ_h⁻¹` weights `(0,1)`, `ν = z`; Newton `(0,1)` at the ordinary CM point; `((0,0,1)+(0,1,1))/2` on each of two labelled parts gives slopes `(0,0,½,½,1,1)` | sound | none |
| M3.2 `Z₀`, `X^*(Z₀)` | `GU(V)`, `F/F₀` | `Z(SU(V)) = {ζ : ζⁿ = 1, N(ζ) = 1} = D₁′[n]`, so `Z₀ = D₁[n]`; `X^*(D₁′) = ℤ` with sign action, `X^*(Z₀) = Ind(ℤ/n(χ))`; `H¹(k, D₁) = F₀^×/N F^×` killed by `2` since `N(x) = x²` on `F₀` | matches kottwitz-1992 lines 975–996 | none |
| M3.2 `hasse_GU21` | `{N(x) = t³}` | `y ↦ (N(y)y, N(y))` has inverse `(x,t) ↦ x/t`, `N(x/t) = t³/t² = t` | sound | none |
| M3.2 rank-two unitary Check | `ℤ/2` trivial action | `H¹(Gal(F/ℚ), ℤ/2) = ℤ/2`, restriction to an inert decomposition group is injective | sound | none |
| M3.5 equivariance | `γ ∈ G(ℚ)` | `ε(γh′) = sign c(γ) ε(h′)`, `q_{γg} = q_g/abs c(γ)`; `ε q c(γ) ψ ∘ γ` returns `ε(h′) q_g ψ`; `q_g ψ` is `Ẑ`-valued on `g(L_K ⊗ Ẑ)` since `q_g c(g) ∈ Ẑ^×` | sound | none |
| M3.9 components | `K(n)` | `ν(K(n)) = Ẑ^× ∩ (1 + nẐ)`, index `φ(n)`; `(ℤ/3)^×` has two elements | sound | none |
| M4.5 normalizations | `ℚ_p(√p)`, `C = ℤ_p[p√p]` | `ℤ_p[√p]`, special fibre `𝔽_p[t]/t²`; `(p√p)² = p³ ∈ ℤ_p`, index `p` | sound | none |
| M4.6 `normalizedModel_gamma0` | `n ≥ 3`, `p ∤ n`; `p = 7`, `n = 3` | `φ(n)` geometric components each splitting into two; `2φ(3) = 4`; `7 ≡ 1 mod 3` so `μ₃ ⊆ 𝔽₇` | sound | none |
| M5.1 Siegel datum | `⟨x, J_D y⟩` | `Σ d_i (x_{e_i}y_{e_i} + x_{f_i}y_{f_i})`, positive for `d_i > 0`; Gram det `(∏ d_i)²`; bad primes divide `n d_g` | sound | none |
| M5.3 pairing inversion | `φ_{O(0)}` vs `P ↦ O([P]−[0])` | Mumford's `φ_L(y) = O([−y]−[0]) = λ^MC ∘ [−1]`, and ModularCurves 2D uses `λ^MC`; so `e^{MC} = (e^{pol})^{-1}`; swapping `(P,Q)` inverts both and `ν ↦ ν⁻¹` | sound | none |
| M5.4 Hilbert lattice | `O_F ⊕ 𝔡⁻¹`; `f(a,b) = (a,−b)` | dual of `O_F` is `𝔡⁻¹` and of `𝔡⁻¹` is `O_F`, self-dual; `O_F ⊕ O_F` has index `disc(F)²`; `fJf⁻¹ = −J`, `(−ψ)(fx,fy) = ψ(x,y)`; `(−ψ)(e₁, (−J)e₁) = 1` | sound | none |
| M5.6 Picard | `δ = 1/s`, `s² = d_K`, `H = diag(1,1,−1)` | dual of `O_K` for `Tr(δ x ȳ)` is `s·𝔡⁻¹ = O_K`, index `1`; `Im(1/s) = −Im s/‖s‖² > 0` | sound | none |
| M5.7 nonprincipal type | `O_F ⊕ pO_F` | second pairing scaled by `1/p` has type `(1,p)`, det `p²`; unscaled `(1,p²)`, det `p⁴` | sound | none |
| M6.1 degrees | `U(3)`, `g = 1` | `#GL₂(𝔽₃) = 48`, coarse degree `#PGL₂(𝔽₃) = 24` | sound | none |
| M6.3 cover | `ℤ[1/3] ∪ ℤ[1/4]` | covers `Spec ℤ`; `U(4)` neat since a root of unity `≡ 1 mod 4` is `1` | sound | none |
| M6.4 `h⁰(L³)` | `χ(L) = d` | `χ(L³) = 3^g χ(L) = 3^g d` | sound | none |
| M6.8 bound | `g = 1`; general | `2·48 = 96 ≤ 2·81`; `#GL_{2g}(𝔽₃) < 3^{4g²}` | sound | none |
| M6.9 determinant identity | rank `g` | `det Sym² ω = (det ω)^{g+1}` (each weight appears `g+1` times) | sound | none |
| M6.11 `finiteField_elliptic` | `q` odd | class count `2q + 6, 2q + 2, 2q + 4, 2q` by `q mod 12`, so at most `2q + 6` | sound | none |
| Conventions: `ψ` vs `E` | `E = −ψ`, `Q = ψ` | `E(Jx,x) = ψ(x,Jx) > 0`; `Q(−Jx, x) = ψ(x,Jx)` | consistent with Tau Ceti `IsRiemannForm` and A5.2 | none |

Counts: 56 rows, 6 sampled targets, 3 headline statements, 47 Checks or identities recomputed, 0 refuted.

## Not verifiable

- Lang, *Algebraic groups over finite fields* (1956), Theorem 1, pp. 556–558 (M0.24): JSTOR only, no open copy found; cited by locator, and the Lang input is in any case owned by ReductiveGroupsPartII RG2.3.7.
- Milne, *Algebraic Groups* (CUP 2017), Proposition 3.50, p. 80 (M0.9(1)): book, not readable here.
- Bijakowski–Pilloni–Stroh, Annals 183 (2016), Hypothèse 1.1.1, Remarque 1.1.3, Lemme 1.1.4, §1.5, Remarque 1.5.1 (M0.21, M2.16, M5.6): the Annals text is paywalled; the arXiv v2 text has a different numbering and a weaker hypothesis (R08).
- Tsimerman, Annals 187 (2018), Lemma 4.1 and footnote 1, pp. 380, 384, 387 (M6.5–M6.8, M6.10, M3.5): arXiv:1506.01466v5 contains footnote 1 (its line 39) but no Lemma 4.1 or Silverberg argument, so the published numbering could not be matched.
- Kohel, thesis, §3.2, Theorem 17, p. 29 (M1.14): the author-page copy did not download (no route to host at fetch time).
- Faltings–Chai, *Degeneration of Abelian Varieties*, I.1.6 and §4.11 (M1.12, M6.4): book.
- Conrad, *Modular curves*, Example 7.15, Proposition 7.16, p. 17 (M5.3): not fetched; ModularCurvesPartII §1.5 cites Proposition 7.16 and Remark 7.17 only.
- Lan thesis, Appendix B.3.8, B.3.10, B.3.12 (M2.8): the theorem statements are at lan-thesis lines 29426, 28603, 29421 (pp. 1025, 995, 1024); the README's page ranges 1018–1026 and 1023–1024 cover B.3.8 and B.3.12 but B.3.10 is on p. 995, which I did not check further.

## Source issues

- **Gap** in milne-svi at §8, printed page 87: the text derives SV3 for a simple PEL datum from the nontriviality of `h` and the simplicity of `G^ad`; it should require `h` to be nontrivial in `G^ad`, which fails for a wholly definite unitary datum of rank at least two; affects a stated result (the pair being a Shimura datum).
- **Error** in lan-thesis at Lemma 1.2.5.10, printed page 92: the text asserts an `O_{F₀}`-lattice model of `V₀`; it should be a model over a finite extension `F₀′` unramified at prescribed primes; affects the proof; corrected in print at the thesis errata, page 7.
- **Gap** in lan-thesis at Definition 1.2.1.5, printed page 47: the text treats the multiplier as determined by the automorphism; it should add `L ≠ 0` and flatness of the base ring; affects a stated result (`G = G_m` when `L = 0`); corrected in print at the thesis errata, page 4.
- **Error** in ltxzz-2022 (arXiv v3) at Definition 3.3.2: the text defines the reflexive closure as the composite of `F` with all reflex fields of CM types; it should be `F` joined with their intersection; affects a stated result; corrected in print at Invent. Math. 228, Definition 3.3.2, page 147.
- **Gap** in lan-thesis at Remark 1.4.3.11, printed page 164: the text identifies the characteristic-zero fibre with an adelic problem for every `□`; it should assume `□` finite and no type D factor; affects a stated result; corrected in print at the thesis errata, page 11.
