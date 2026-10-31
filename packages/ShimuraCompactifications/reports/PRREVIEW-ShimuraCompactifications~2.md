# Review of ShimuraCompactifications (pull request #1053 at 8587a09)

**Verdict:** accepted

No P1 or P2 finding. The push gate passes on this head (every check `0`, `build=0`), the
dependency check is clean, the two statements of `Suggested.lean` survive elaboration, the
`#check` comparison and the one-tactic probe, and the seeded source sample reads as cited. The
eight findings of the previous review are repaired (checked one by one below). The two findings
below are P3 notes the author may take or leave.

## R01 (P3) — 79 Checks carry Lean-style labels

Location: `TauCetiRoadmap/ShimuraCompactifications/README.md`, for example line 560
"`embedding_rankOne_test`: for the trivial `G_m`-torsor and the positive ray, `T(σ) = A¹_Z`", line
680 "`ArithmeticFan.zero_test`: for a rank-zero lattice", line 2100 "`SemiAbelianTateModule.Gm_test`".

Claim: a Check never names or claims a Lean counterpart, and a backticked name of the roadmap's own
is a claim that `Suggested.lean` declares it.

Witness: `grep -o '`[A-Za-z0-9_.]*_test`' README.md | sort -u | wc -l` gives 79; `Suggested.lean`
declares two theorems, neither of them a Check; no roadmap on main labels Checks this way (zero
matches for `_test`` in SchemeAndStackFoundations, AdicSpacesPartIII, ModularCurves,
AlgebraicVectorBundles, ReductiveGroups). The gate's readme-ids rule tests only names whose namespace
prefix exists in the Lean file, so these pass it.

Repair: delete the label and colon at the head of each such bullet, keeping the prose ("For the
trivial `G_m`-torsor and the positive ray, `T(σ) = A¹_Z` with its standard open `G_m`."). The other
backticked target names ("Define `FaceProjection.faceProjection` … (suggested home …)") follow the
practice of the roadmaps on main and the gate accepts them; they are not part of this finding.

## R02 (P3) — 8.39 corrects Dimitrov's Théorème 8.6(vi) without saying so

Location: README lines 3780–3789, "the weight line extends invertibly to the minimal model if and
only if `κ` is parallel and every residual cusp character is trivial … ([Dimitrov], Théorème 8.6(vi)
and its proof, pp. 548–549)".

Claim: the locator supports the "iff" as written.

Witness: dimitrov line 1031–1032 states the extension "if and only if `κ` is parallel", with no
character condition; its proof (dimitrov line 1067–1071) reduces to the `κ`-action of `o×_{C,1}` on
the trivialized pullback and stops. The README's own Check (line 3796–3798: `F = ℚ(√5)`,
`u = φ⁵ = (11+5√5)/2`, `n = (u−1)` of norm `11`, `N(u) = −1`) is a cusp unit in `o×_{C,1}` for
which the parallel weight `(1,1)` has character `N(u) = −1`, so the source's "if" direction fails;
the roadmap's statement is the correct one (computation in the adversarial table).

Repair: add one clause, as 8.43 does for Proposition 8.5(ii): "Dimitrov's (vi) states only
'parallel'; his proof reduces to the triviality of the `κ`-action of `o×_{C,1}`, which for an odd
parallel weight needs `N(u) = 1` at every cusp." The source error is recorded below.

## Verified sound

**Repairs of the previous review (63e3f03 → 8587a09), finding by finding.**

- R01 (target ids): repaired. Every heading is `### k.n …` with digits only; `C2.general` and
  `C3.general` are now `## Layer 3` and `## Layer 5` (lines 1432, 1738); `3.6a/6.12a/6.20a` are
  absorbed into the running count. Gate: `target-ids=0`, `layer-ids=0`.
- R02 (thirteen `HilbertCusp.*` names): repaired. 8.1–8.4 and 8.6–8.8 are prose ("Prove that a
  nonzero element of `F` that is not totally positive has a negative real embedding", line 3142);
  the only `HilbertCusp.` name left is the declared `bounded_cusp_support_is_positive`. Gate:
  `readme-ids-missing=0`.
- R03 (three supplier names that exist nowhere): repaired. Line 333–336 cites "H4.8–H4.9 supply the
  subgroup-level moduli and its 2-Cartesian polarization square" and "H3.6/H4.9 supply the coarse
  Cartesian finite étale `Δ(N)`-torsor square over `X^free/Δ(N)`" by section; line 346–349 cites
  "§RD.5.116 supplies relative Zarhin's trick" without a Lean name; 8.49 (line 3962–3967) the same.
- R04 (C6.49 locator): repaired. 8.51 (line 4015–4017) cites "§7.1, the definition of `ω^+`
  following Definition 7.1, and Proposition 7.4(2) for its comparison with the modified lattice"
  and keeps Definition 7.3 for `ω^int` only.
- R05 (Lan page numbers): repaired, and the new claim is true. The `[Lan]` entry (line 4273–4276)
  says the page numbers are the book's, "which the revision keeps as its running page numbers". I
  checked the running numbers printed in the revision: Definition 4.4.6 at lan line 11467 lies on
  the page ending with "251" (lan line 11485), Theorem 4.4.16 (lan line 11595) on the page ending
  "254", Lemma 6.1.2.6 (lan line 19725) on the page ending "444", Definition 6.3.2.5 (lan line
  22005) on "503", Proposition 6.3.3.17 (22568) on "518", Theorem 6.4.1.1 (22598) on "519",
  Lemma 7.1.1.4 (23072) on "532", Lemma 7.1.2.1 (23139) on "534", Proposition 7.2.1.1 (23359)
  on "540". Every page cited in the README for these items agrees (the previous review's witness
  used PDF page indices, which are offset by 29).
- R06 (C4.9 locator): repaired. 6.9 (line 1997–1999) cites "Proposition 3.3.1.5, p. 192, applied
  to each endomorphism of the degenerating families of Definition 5.3.2.1 … the good algebraic
  models of 6.3.2.5–6.3.2.6 carry the extended action".
- R07 ("Part II of AnalyticToricGeometry"): repaired. Line 5: "Layer 0 extends
  AnalyticToricGeometry Layer 0 to arbitrary coefficient rings, torsor bases and arithmetic cone
  systems"; the nonarchimedean development stays deferred to AnalyticToricGeometryPartII (line 158).
- R08 (C5.26 conditional on an undischarged depth hypothesis): repaired by a different route. 7.26
  (line 2827–2852) now assumes only that `X_alg` is a normal scheme projective and flat over `ℤ_p`
  and that `Z` lies in the special fibre with codimension at least two there, and proves the
  extension from the vanishing of `ℋ⁰_Z(L)`, `ℋ¹_Z(L)` (depth at least two along `Z`, which has
  codimension at least three) and the coherence of `ℋ²_Z(L)` (the new target 7.34, Grothendieck's
  finiteness theorem). I checked the argument: a point `x ∉ Z` whose closure meets `Z` in
  codimension one has `dim O_{X,x} ≥ 2` (catenarity, `codim Z ≥ 3`), so `S2` gives depth two
  there, which is the SGA 2 VIII 2.3 criterion at `n = 2`; `ℋ²_Z(L)` is coherent and supported in
  the special fibre, hence killed by `p^N`; `0 → L →(p^n) L → L/p^n → 0` (`X` flat) gives
  `ℋ⁰_Z(L/p^n) = 0` and `ℋ¹_Z(L/p^n) ≅ ℋ²_Z(L)[p^n]`; the map of short exact sequences
  `(p, id, red)` shows that the transition maps on these kernels are multiplication by `p`, so
  their inverse limit is zero and left exactness of `lim` identifies `lim Γ(X_n, L_n)` with
  `lim Γ(X_n ∖ Z, L_n)`, no Mittag-Leffler needed. The depth hypothesis is gone and nothing
  downstream is conditional. 7.34's hypotheses ("locally a closed subscheme of a regular scheme")
  hold for `X_alg` of finite type over `ℤ_p`; its route cites SGA 2 VIII 2.1–2.3 and Mathlib's
  `localCohomology` (present at the pin, `Mathlib/Algebra/Homology/LocalCohomology.lean`).

**Gate and dependency direction.** `gate.md` for 8587a09: every check `0`, `build=0`, `OK`.
`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ShimuraCompactifications'` is empty.
The folder holds `README.md`, `Suggested.lean`, `metadata.toml` only. My run of the dependency
check:

    depcheck: 205 roadmaps, 1435 edges, 0 problem(s)

ShimuraCompactifications is line 143 of the merge order, right after
HilbertModularVarietiesAndShimuraCurves (142), its last supplier.

**Principles.** No route-specific shortcut (every PEL statement keeps Lan's good-prime hypotheses
(6-b)/(7-a) and the Hilbert layer treats all primes prime to the level, `p = 2` and ramified primes
included, by its own charts and the gluing theorem 8.57). No re-planned roadmap: the principal
Siegel compactification is consumed from ArakelovGeometryAndAbelianHeights §§5.0a–5.0b (its
README at #1000, lines 1343–1375: `SiegelModuli.toroidalDegenerationChart`,
`SiegelModuli.toroidalRefinement`, `SiegelModuli.MinimalCompactification`,
`SiegelModuli.hodgePower_generated`, `SiegelModuli.hodgeDegree_zero_criterion` all present), and
Layers 6–7 extend them to general degeneration and PEL data with agreement on the principal Siegel
specialization (6.5, 7.3, 7.13, 7.16, 7.17, 7.30, 7.32, 7.33). No copied passages in the sampled
sections; no algorithm; no sorry'd data, no `set_option`, no `lemma`, no `#eval`; imports are
`import Mathlib` and one existing `TauCeti.NumberTheory.NumberField.TotallyPositive`.

**Ownership against open work.** `roadmaps grep` over main and the 433 open roadmap pull requests
for the objects this roadmap constructs: the face projection (`FaceProjection|faceProjection`),
semi-abelian Tate modules (`Tate module.*semi-abelian`), Rapoport's gluing (`découpage|formal
gluing`), the nonaffine Verschiebung, and Grothendieck's finiteness theorem for local cohomology
(`local cohomology.*(coherent|finite)`) each answer "no match on main or in any open roadmap pull
request" outside this roadmap. `Koecher` matches only ShimuraVarieties 2.8 (the complex
Baily–Borel codimension statement, earlier in the order and cited here) and this roadmap.
GaloisSectionsPadicPeriodMaps (merge order 328, the one roadmap citing Bresciani's paper) contains
neither `semi-abelian` nor `Tate module`, so 6.14 has one owner. Consumers later in the order
(AnalyticToricGeometryPartII 144, AutomorphicBundles 163, HilbertModularSurfaces,
HodgeTateAndCanonicalSubgroups, PerfectoidShimuraVarieties, IgusaVarietiesAndTorsionConcentration)
cite this roadmap. Mathlib at the pin has no theorem for Stacks 0E0L: the files mentioning
`GeometricallyReduced` are `Geometrically/Reduced.lean`, `Geometrically/Integral.lean`,
`AffineSpace.lean`, `Group/Smooth.lean`, `RingTheory/Nilpotent/GeometricallyReduced.lean`, none
with a global-functions statement; `Geometrically/Connected.lean` has only `eq_geometrically`,
`isConnected_preimage_singleton`, `isConnected_preimage`, `connectedSpace`,
`connectedSpace_of_subsingleton`, `iff_geometricallyConnected_fiber`, `comp`. Tau Ceti's
`appTop_bijective_of_section` (`TauCeti/AlgebraicGeometry/RationalPoint/Basic.lean:246`) assumes
`[IsIntegral X] [UniversallyClosed f]` over a field with a section, as the README says.

Note for the worker, not a finding: two consumer pull requests still cite the pre-renumbering
labels (HilbertModularSurfaces #1730 README line 807 "ShimuraCompactifications C6.32–C6.33";
AnalyticToricGeometryPartII #1647 README line 141 "ShimuraCompactifications C0.1, C0.4–C0.7 and
C0.16"); the renumbering should be announced on their jobs. AnalyticToricGeometryPartII also
declares `gap:toric-field-fibres` on this roadmap (its line 57: normality and geometric integrality
of `X_{Σ,k}` and the ray divisors over a field); this roadmap declares no gaps itself (no
`design/plan.json`, no `What … must provide` clause), and a consumer's declared gap is not a
finding here.

**Library declarations opened at the pins (Mathlib `6b7abb3`, Tau Ceti `a91d3aa`), by `#check`
in the scratch probe or by file:line.** `AddMonoidAlgebra.comapDomain`, `AddMonoidAlgebra.mapRingHom`,
`AddMonoidAlgebra.domCongr`, `AddMonoidAlgebra.mapDomainAlgHom`, `AddMonoidAlgebra.lift_single`
(`Algebra/MonoidAlgebra/Basic.lean:251`), `Finsupp.comapDomain_apply` (`Data/Finsupp/Basic.lean:516`),
`Ideal.quotientKerAlgEquivOfRightInverse`, `localCohomology`,
`NumberField.Units.dirichletUnitTheorem.exists_unit` (statement: a unit with `log w(u) < 0` at every
`w ≠ w₁`), `NumberField.Units.sum_mult_mul_log`, `NumberField.Units.pos_at_place`,
`NumberField.IsTotallyReal.mult_eq`, `Subgroup.exists_pow_mem_of_index_ne_zero`,
`Submodule.traceDual`, `Submodule.mem_traceDual`, `Units.mul_right_eq_zero`,
`tendsto_pow_atTop_atTop_of_one_lt`, `tendsto_pow_atTop_nhds_zero_of_lt_one`,
`AlgebraicGeometry.Spec.map`, `AlgebraicGeometry.GeometricallyConnected` (`geometrically (fun x =>
ConnectedSpace x)`, and `geometrically P f` quantifies over every field `K` and `Spec K ⟶ Y`;
`ConnectedSpace` extends `PreconnectedSpace` with nonemptiness, `Topology/Connected/Basic.lean:705`),
`IsProper` (`Morphisms/Proper.lean:41`, extends separated, universally closed, locally of finite
type). Tau Ceti: `NumberField.IsTotallyPositive` (printed: strict positivity of every real
embedding), `isTotallyPositive_iff` (`NumberTheory/NumberField/TotallyPositive.lean:38`),
`appTop_bijective_of_section`, `SplitTorus.mapValue_frobenius_eq_comp_powEnd`
(`Algebra/AlgebraicGroup/SplitTorus/Frobenius.lean:76`), `MixedHodgeStructure.Hom.range_inf_F_eq_map_F`
and `range_inf_WQ_eq_map_WQ` (`Geometry/Hodge/Mixed/Strictness.lean:110,131`),
`MixedHodgeStructure.gradedHodgeStructure` (`Mixed/Basic.lean:182`), `structure Fan`
(`Geometry/Toric/Algebraic/Fan/Basic.lean:83`), `Fan.algebraicRealization` (`Fan/Scheme.lean:136`),
`relativeSpec` (`AlgebraicGeometry/RelativeSpec/Functor.lean:178`), `affineToricSchemeMap`
(`Toric/Algebraic/AffineScheme.lean:133`), `IsIntegralLattice`, `IsToricCone`, `IsRegularCone`,
`SplitTorus.groupScheme` (used throughout `Algebra/AlgebraicGroup/SplitTorus`).

**Elaboration.** `lake env lean` on a scratch copy of `Suggested.lean` whose two `sorry`s were
replaced by `first | rfl | simp | infer_instance | simp_all | (intros; simp_all) | sorry`, followed
by `#check @` of both declarations: both goals stay open (neither is padding); the elaborated types
are exactly the README statements of 8.5 and 8.55. 8.5: `{F} [Field F] [NumberField F]
[IsTotallyReal F] {R} [CommRing R] (U : Subgroup (𝓞 F)ˣ) (hU : U.index ≠ 0) (hd : 1 < card
(InfinitePlace F)) (a : F → R) (c : U → F → Rˣ) (ha : ∀ u ξ, a (u² ξ) = c u ξ * a ξ) (y) (hy : ∀ w,
0 < y w) (hbound : ∃ B, ∀ ξ, a ξ ≠ 0 → B ≤ ∑ w, τ_w ξ * y w) : ∀ ξ, a ξ ≠ 0 → ξ = 0 ∨
IsTotallyPositive ξ`; 8.55: `(f : X ⟶ S) [IsProper f] [Flat f] [LocallyOfFinitePresentation f]
[GeometricallyReduced f] [GeometricallyConnected f] (g : T ⟶ S) (U : T.Opens) :
Function.Bijective ((pullback.snd f g).app U)`. Every binder is explicit in the signatures;
nothing was lost from a `variable` block (the file has none).

**Cross-roadmap citations resolved at the heads `roadmaps show` prints (or on main `fa41b37`).**
ShimuraVarieties #933: §P.1–P.6 (`TauCeti.Shimura.finite_analytic_quotient` at line 204), 0.5, 1.5,
2.1, 2.2, 2.5, 2.7, 2.8, Layer 4, 5.2 (`TauCeti.Shimura.weight_one_algebraization` at line 1365),
Layer 7, Layer 8, 8.4, 8.22, 8.23. PELModuli #966: M1.2, M1.7, M2.8–M2.10, M3.6, M4.3, M4.5, M4.6.
HilbertModularVarietiesAndShimuraCurves #1005: H0.3–H0.5, H1.1, H1.6–H1.9, H2.2, H2.2a, H2.2b
(scheme representability of the DP model), H2.3, H2.5–H2.8, H3.1–H3.6 (H3.6: quotient stack
`[X/Δ(N)]`, atlas a finite étale `Δ(N)`-torsor), H4.4, H4.8, H4.9 (2-Cartesian squares over the
quotient stack; Cartesian on coarse quotients over the free locus), H4.11, H4.13, H5.1.
ArakelovGeometryAndAbelianHeights #1000: §2.0 (`GroupScheme.semiAbelianHom_extend` over Noetherian
normal `S`, lines 669–683), §5.0a, §5.0b. ModularCurvesPartII #913: 3.5, 3.6, 3.7, 3.11, 4.8, 5.2,
5.13, 9.1. FiniteFlatGroupsAndIntegralPadicHodgeTheory #879: R07.1.1 (`frobeniusHom`,
`verschiebungHom`, lines 604–644), R07.2.21 (line 3831). ArithmeticGaloisDuality #858: R02.1.1 with
its Milnor sequence (lines 144–201). PadicDifferentialEquationsAndRigidCohomology #1002:
§RD.5.116 Zarhin's trick (line 11341). AlgebraicModuliForArithmeticGeometry #853: Layer 6,
`Approximation.HasArtinApproximation` (line 8999). ComplexComparisonPartII #848: §C−1.1
(`ComplexAnalyticSpace` line 765, `complexSchemeAnalytification` line 774), C0.4, Layer 2, C3.3,
C4.2, C4.4, §§6.1–6.4. NeronModelsAndSemistableAbelianVarieties #852: Layer 1, 3.10, 3.13, 3.14.
AbelianSchemesAndArithmeticModuli #849: A0.1, A1.3, A2.2, A2.3, A2.5, A2.8, A3.2, A3.6, A3.9, A4.1,
A5.3. AdelicAlgebraicGroups #792: 3.2, 3.3, 3.4, 3.6. ShimuraData #1038: §1.1, §4.3 (`SV4`,
`sv4_rationalHodge` line 841), Layers 3–4. On main: SchemeAndStackFoundations §§0.3, 0.6, 0.8, 0.17
(depth, Cohen–Macaulay, Serre's conditions, line 1138; the new citation of 7.34), 0.28, 0.29, 1.15,
2.5, 2.6 (`ample_serre_vanishing` line 3445), 4.7, 4.8, 4.9, 4.10; AdicSpacesPartIII F0.2–F0.8,
R2.10, R3.7 and the item names formal-functions-affine, theorem-on-formal-functions,
formal-direct-image-comparison, cohomology-of-mittag-leffler-limit, grothendieck-existence,
grothendieck-algebraization, formal-completion-and-algebraic-comparison, fractional-valuation-bound,
hasse-domain, gaga-comparison-map, proper-gaga; AdicSpacesPartII R1.3 (analytification-functor),
R1.4, R1.7; ModularCurves §0E and Layer 10; JacobianChallenge Layer C; AlgebraicVectorBundles L0B,
L0C, L1A, L1B, L2A, L2B; ReductiveGroups Layer 7; AnalyticToricGeometry (Completed) Layers 0–5,
with the support criterion stated for nonempty finite fans (its line 164), as 0.17 records. The
worker's `citations.md` lists no cross-roadmap citation found nowhere; I found none.

**Source sample (the fifteen seeded targets), each read at the locator.**

| Target | Source, locator | Read at | Supports as written |
| --- | --- | --- | --- |
| 0.15 | [Lan17] Def 2.5, 2.7, Prop 2.8, pp. 5–6; [Pink] 9.18–9.23, pp. 154–158 | lan17 line 199–246 (page 5–6); pink line 6148–6313 (printed 154–158) | yes: Def 2.5(2) integral positive on nonzero lattice points, (4) `pol(x+y) ≥ pol(x)+pol(y)`; Prop 2.8 smooth and projective common refinements, also with Hecke twists and `H′`-invariance; Pink 9.20 barycentric subdivision for 7.12(∗), 9.21 needs `K_f` neat, 9.23 finitely many maps |
| 2.4 | [Pink] 6.6 and 6.24, pp. 98 and 112 | pink line 3858–3874, 4469–4478 | yes: 6.6 "normal complex space", 6.24 normal, Hausdorff, contains `M_K(ℂ)` as open dense subset |
| 4.3 | [Pink] 6.25, 9.23, pp. 112–113 and 157–158 | pink line 4485–4499, 6306–6313 | yes: 6.25(a) extension when every `σ′` lies in some `τ ∈ [·p_f]^*Σ`, quotient by `K′_f/K_f` for normal `K′_f`; 9.23 one `Σ` for finitely many maps |
| 4.7 | [Stacks] 08AZ in Situation 08AV | stacks-08AZ line 1848–1850, 1927–1934 | yes: `A` Noetherian, `f` proper morphism of algebraic spaces to `Spec A`, `F` coherent: `H^p(X,F)^∧ ≅ lim H^p(X, F/I^nF)`; the middle term `R^i f̂_* Ê` is the README's own identification through AdicSpacesPartIII F0.6, as stated |
| 4.8 | [Lan17] Prop 7.5 (7.8), pp. 28–29 | lan17 line 1235–1248 | yes: `R^i = 0` for `i > 0` for the morphism (7.2) in the projective-cone, lattice-collection setting |
| 6.6 | [Lan] 4.4.1–4.4.16, pp. 250–255; Section 4.1 | lan line 9676–9683 (printed 207), 11439–11616 (printed 250–254) | yes: `R` noetherian normal domain complete for `I` with `rad(I) = I`, exactly (6-a); Theorem 4.4.16 gives `M_pol : DD_pol ≅ DEG_pol` with quasi-inverse `F_pol`; Definition 4.4.6 and Remark 4.4.7 (`2λ_A`) on p. 251 as cited by 6.4 |
| 6.12 | [Lan] 4.4–4.5 in rank one, pp. 250–281 | lan line 11426–11630 | yes as a range; the Tate comparison with ModularCurvesPartII 3.6–3.7 is the roadmap's own, as it says |
| 6.15 | [BHW] proof of Lemma 5.12 and §7.1 | bhw line 1048–1073 (Lemma 5.12), 1361–1372 (§7.1), arXiv v4 pagination | yes: the proof extends Frobenius over the boundary "since the boundary is already contained in the ordinary locus" and by Hartogs on the normal `X^*`; §7.1 introduces `ω^int` away from the Rapoport locus; the determinant comparison for semi-abelian `G` is the roadmap's own, as stated |
| 7.1 | [Lan] 6.3.2.5–6.3.2.9, pp. 503–505; errata 60–77 | lan line 22005–22061 (printed 503–504); lan-errata line 228–283 | yes: Definition 6.3.2.5 has the stratified étale neighbourhood, the two embeddings `ı_nat`, `ı_alg` and conditions (3a) tautological objects, (3b) closeness, (3c) logarithmic Kodaira–Spencer; 6.3.2.6 existence and covering; errata (61), (63)–(65), (72), (76) replace "formally étale" by "étale" and add finiteness hypotheses |
| 7.9 | [Lan] 6.3.3.17, 6.4.1.1, pp. 518–523 | lan line 22568 (printed 518), 22598–22699 (printed 519–521) | yes: 6.3.3.17 properness over `S_0`; 6.4.1.1(2) strata smooth over `S_0` and closure relation by faces, (3) reduced boundary a relative normal-crossings Cartier divisor whose components have no self-intersections at neat level |
| 7.12 | [Lan] 6.4.1.1(4), pp. 519–520 | lan line 22641–22648 | yes: `KS ≅ Ω¹_{M^tor/S_0}[d log D_∞]` with the PEL relations; the Siegel `Sym² E` form is the principally polarized specialization |
| 7.22 | [Lan17] Thm 8.7, Remarks 8.9–8.10, errata (3); [BPS] 5.2.1; [LanHK] 2.3 | lan17 line 1517–1542; lan17-errata line 14–15; bps line 1303–1307; lanhk line 128–141 | yes: `O ⊗ ℚ` simple, `R` an `O_{F_0,(p)}`-algebra, `E` formally canonical, every open `U^min`, bijection except `dim M_H = 1` and `U^min − U ≠ ∅` (the errata clause); 8.9 nonsmooth `Σ`; 8.10 no higher Koecher; BPS 5.2.1 is Lan's 8.7 applied to `ω^κ` modulo `π^n`; LanHK 2.3 needs `c_M > 1` |
| 7.26 | [BCGP21] §8.2, p. 240 | bcgp21 line 11494–11502 (page 240) | yes: the source asserts `H⁰(X,L) = H⁰(Y,L)` for a normal formal `X` and a complement of codimension `≥ 2`, and that the minimal boundary has that codimension; the README's proof route is its own and is sound (R08 above) |
| 8.25 | [Dimitrov] Thm 7.2(i)–(ii), pp. 541–543 | dimitrov line 733–756 (printed 541–542) | yes: completion along the boundary is `∐_C (S^∧_{Σ_C}/o×_{C,1}) × Spec(ℤ[1/N(n), ζ_C]^{H_{C,1}})` on the fine model and with `o×_C`, `H_C` on the coarse one |
| 8.38 | [Dimitrov] Thm 8.6(v), p. 548 | dimitrov line 1025–1030 (printed 548) | yes: completion along `π⁻¹(C)` is `(S^∧_{Σ_C}/o×_C) × Spec(ℤ[1/N(n), ζ_C]^{H_C})`, and `(S^∧_{Σ_C}/(o×_n × o×_{D+})) × Spec ℤ[1/N(n)]` at an unramified cusp |

Also read for claims the README makes about its sources: dimitrov line 380–382 (Prop 3.3(iv): the
exact sequence `0 → X^* → γ⁻¹Γγ ∩ B_ℚ → o×_C → 1` with `X = cbb′`, `o×_C = {(u,ε) : u − 1 ∈
nb′b⁻¹, uε − 1 ∈ bb′⁻¹}`, `o×_{C,1}` as in 8.56), 514–534 (Prop 4.1(i)–(iii): the Cartesian square,
the phase `q^ξ ↦ ζ_C^{n·Tr(ξx)} q^ξ` for `x ∈ (ab)^*/(ab′)^*`, transport under `(u,ε) ∈ o×_C` and
`h ∈ H_C`), 839–847 (Cor 7.4: étale-local toric form, free action of `o×_C` on non-open strata),
850–852 (Prop 7.6), 973–986 (Thm 8.3 and its proof over `o′[1/Δ]`-algebras), 994–1003 (Prop 8.5),
1008–1032 (Thm 8.6), 1033–1071 (its proof); lan17 line 1192–1225 (Prop 7.1 and 7.3: the morphism
(7.2) goes from level `H` to a larger `H′`); pink line 4058–4066 (6.13: the controlled open is the
interior of the closure), 4560–4561 (6.27: complete `Σ` gives a compact space); stacks-0E0L line
3679–3685 (Lemma 36.32.6: proper, flat, finite presentation, geometrically reduced and connected
fibres; `f_*O_X = O_S` after any base change).

**Adversarial table** (values computed on each side).

| Statement | Instances tried | Values | Result | Change |
| --- | --- | --- | --- | --- |
| 8.5 `bounded_cusp_support_is_positive` | `R = 0` | `a ξ ≠ 0` never holds | vacuously true | none |
| same | `F = ℚ(√2)`, `U = o^×`, `a` supported at `ξ = −√2`, `y = (1,1)`, `v = 1+√2` | pairing at `u = v^n`: `n = 1`: `−√2(3+2√2) + √2(3−2√2) = −8`; `n = 2`: `−√2(17+12√2) + √2(17−12√2) = −48`; `→ −∞` | no `B` exists, hypothesis excludes | none |
| same | `F = ℚ` | one infinite place, `o^× = {±1}`, `u² = 1`: `a` at `−1`, `y = 1`, `B = −1` satisfies every other hypothesis, conclusion false | `hd : 1 < card` excludes | none |
| same | `U = ⊥` for `d > 1` | `U.index = |o^×| = ∞`, encoded `index = 0` | `hU` excludes; needed since `⊥` gives no covariance | none |
| same | `a` supported at `0` | sum `0`, `B = 0`; conclusion `ξ = 0` | holds; constant term allowed as 8.5 says | none |
| same | `ξ` totally positive, `a ξ ≠ 0` | right disjunct | holds | none |
| 8.55 `proper_flat_globalFunctions_baseChange` | `X = ∅ → Spec k` | fibre empty; `ConnectedSpace` needs `Nonempty` | hypothesis excludes; conclusion `k → 0` would fail | none |
| same | `Spec ℂ → Spec ℝ` | fibre over `Spec ℂ` is `Spec(ℂ ⊗_ℝ ℂ) = Spec(ℂ × ℂ)`, disconnected; `ℝ → ℂ` not bijective | excluded, and needed | none |
| same | `Spec k[ε]/(ε²) → Spec k` | fibre nonreduced; `k → k[ε]` not surjective | excluded, and needed | none |
| same | `f = id_S`, `S = Spec ℤ/4`, any `T`, `U` | map `O_T(U) → O_T(U)` identity | holds | none |
| same | `ℙ¹_T → T`, `U ⊆ T` | `H⁰(ℙ¹_U, O) = O(U)` | holds (Stacks 0E0L, hypotheses identical) | none |
| 0.1 face projection multiplicative | even submonoid of `ℕ` | `π(e_1) = 0`, `π(e_2) = e_2`, but `e_1² = e_2`: `π(e_1)² = 0 ≠ e_2` | face condition needed; Check correct | none |
| 0.4 kernel | `R = ℤ/4`, `P = ℕ`, `F = {0}` | `J = (e_1)`; `2e_0 ∉ J` | correct, no reduction of `R` | none |
| 0.15 `pol` | quadrant subdivided at `(1,1)`, `pol = x + y + min(x,y)` | `(1,0) ↦ 1`, `(0,1) ↦ 1`, `(1,1) ↦ 3`; pieces `2x+y` on `x ≤ y`, `x+2y` on `x ≥ y` | superadditive `3 ≥ 2`, Lan17 Def 2.5(4); cone `⟨(1,0),(1,2)⟩` has index `2`, split by `(1,1)` into two determinant-`1` cones | none |
| 0.17 properness criterion | empty source fan over nonempty base | preimage of `τ` contains `0`, union of source cones mapping into `τ` is `∅` | criterion fails, map proper: converse needs nonempty source, as stated | none |
| 0.19 completion | `r = 2`: `∑ x_1^n x_2^n` and `∑ x_1^n`; `R[x,x⁻¹]` at `(x)` | for each `h` the first has `h` terms with `a ∉ (h,h)+ℕ²`, the second infinitely many (`a_2 = 0`); `(x) = (1)` so completion `0` | Checks correct | none |
| 0.20 lattice change | rank one, index `e` | `q ↦ q′^e`, `R[q′]` free of rank `e` over `R[q]` | finite of degree `e` | none |
| 1.1 modular boundary | `P_1 = {[[a,b],[0,1]]}`, `h_{1,0}(z_1,z_2) = diag(z_1z_2,1)` | kernel `{(z,z⁻¹)}`; `diag(t⁻²,1)[[a,b],[0,1]]diag(t²,1) = [[a,t⁻²b],[0,1]]` | weight scales `b` by `t⁻²`, central in `G_1 = G_m` not in `P_1` | none |
| 2.4 normality | cone `⟨(1,0),(1,2)⟩` | dual monoid generated by `(1,0),(0,1),(2,−1)`: chart `k[x,y,z]/(x² − yz)` | normal, singular (`A_1`): matches the Check | none |
| 4.3 Hecke span | `g = diag(p,1)`, `Γ′ = Γ(N) ∩ gΓ(N)g⁻¹` | `g[[1,n],[0,1]]g⁻¹ = [[1,pn],[0,1]]`: translations `pNℤ`, width `pN`; `t = e^{2πiz/pN}`: `q_N = t^p` under `z ↦ z`, `t` under `z ↦ z/p` | correct, multipliers `p` and `1` | none |
| 4.7 formal functions | `ℙ¹_{k[t]}`, `E = O(−2)`, `I = (t)`, `i = 1` | `H¹ = k[t]` (rank one), completion `k[[t]]`; `lim H¹(ℙ¹_{k[t]/t^{n+1}}, O(−2)) = lim k[t]/t^{n+1} = k[[t]]` | equal | none |
| same | `I = 0`; `I = (1)`; finite `Spec A′ → Spec A` | identity; all three zero; `A′ ⊗_A Â = lim A′/I^{n+1}A′` (finite module over noetherian `A`) | Checks correct | none |
| 4.8 higher direct images | `Bl_0 A²` | thickenings of `E ≅ ℙ¹` have graded pieces `O_E(n)`, `n ≥ 0`; `H¹(ℙ¹, O(n)) = 0` for `n ≥ −1` | `R¹π_*O = 0`, consistent with 4.5 | none |
| 4.9 boundary ideal | `Bl_0 A²`, `I = (xy)` | `π^*(xy) = u²v` in the chart `x = u, y = uv`: order `2` on `E`; new boundary ideal `(uv)`: order `1` | `π^*I_D ⊊ I_{D′}`, `π_*I′ = (xy)` | none |
| 4.6 level direction | Lan17 (7.2) `M_{H} → M_{H′}` | Prop 7.3 has `H ⊆ H′`; invariants under `H′/H` | README's parenthetical correct; source misprint recorded | none |
| 6.3 sign | `X = ℤ`, `c(1) = P` | pushout along `−1`: line `L_P`; along `+1`: `L_P⁻¹ = L_{−P}` | sign distinguishes the two | none |
| 6.6 equivalence | `R` a complete DVR; `R = k[[x,y]]/(y² − x³)`; generic `[p]` on the Tate curve | first is NeronModels 3.13–3.14; second not normal, excluded; `[p]` is a DEG-morphism but not an isomorphism, DD has only isomorphisms | scope as stated | none |
| 6.12 Tate | `u ↦ u^p`; identity on `u` from period `q^p` to `q` | `d(u^p)/u^p = p·du/u`; `(q^p)^ℤ ⊂ q^ℤ` of index `p`: generic kernel `ℤ/p`, special fibres both `G_m` with the identity map: kernel `1` | Checks correct | none |
| 6.15 `Ha = det V^*` | `G = G_m^g`, any `p` including `2`; `G = T × A`; totally toric cusp | `F = [p]` so `V = id`, `det = 1`; block determinant `1 · Ha(A)`; `G[p] = μ_p^g` of order `p^g`, height `g ≠ 2g` | correct; `det V^* ∈ Hom(ω, ω^{⊗p}) = ω^{⊗(p−1)}` | none |
| 6.16 Klingen | frame `(ℤ/p²)⁴`, `L = ⟨e_1,pe_2,pf_2⟩`, `H_1 = ⟨pf_1⟩` | `⟨pe_2,pf_2⟩ = p² = 0`; `L ∩ H_1 = 0`; `[p]⁻¹H_1 = ⟨f_1,pe_1,pe_2,pf_2⟩`, modulo `L` generated by `f_1` of order `p²`; for `L_0 = ⟨e_1,e_2⟩` it is `⟨f_1⟩ ⊕ ⟨pf_2⟩ ≅ ℤ/p² ⊕ ℤ/p` | correct, wrong type excluded | none |
| 7.1 good models | rank zero; Tate | étale chart of the open moduli; `R^∧ = B[ζ][[t]]` with `q = t^w` | consistent with Lan 6.3.2.5 | none |
| 7.8 components | `ℙ¹_z × ℙ¹_w`, `w = 1` and `w = z²`, `2` invertible | `z² = 1`: two disjoint sections `z = ±1` | a connected component must be chosen | none |
| 7.9 proper closures | boundary section of `ℙ¹_B`; section minus special fibre | closed immersion, proper; not closed in `ℙ¹_B`, not proper | correct | none |
| 7.12 log KS | Siegel `g`; `g = 1` | `rank E = g`, `rank Ω¹(log D) = g(g+1)/2 = rank Sym² E`; `(du/u)^{⊗2} ↦ dq/q` | consistent with 6.13 | none |
| 7.22 Koecher exception | `dim M_H = 1`, `U^min = X(1) ∋ ∞` | `Γ(Y(1), O) = ℂ[j] ≠ ℂ = Γ(X(1), O)` | exception needed; Lan17 8.7 has it | none |
| 7.25 codimension | `d = 1`; `d = 2` | open `3`, boundary `≤ 1`, codim `2`; open `6`, boundary `≤ 2`, codim `4` | `≥ 2d ≥ 2` | none |
| 7.26 local cohomology | `Spf ℤ_p[[x,y]]`, `Z` the closed point; the transition maps | depth `3 > 2` so `ℋ²_Z(O) = 0`; map of sequences `(p, id, red)` gives `ℋ²_Z(L)[p^{n+1}] →(p) ℋ²_Z(L)[p^n]`; `p^N` kills `ℋ²_Z(L)`, so `x_n = p^N x_{n+N} = 0` | limit zero; extension holds without `S2` of thickenings | none |
| 7.29 canonical bundle | `diag(t_1,t_2)` on rank-two `E` | `Sym²` eigenvalues `t_1², t_1t_2, t_2²`, product `(t_1t_2)³` | `det Sym² E = (det E)^{⊗3}` | none |
| 7.34 finiteness | `𝔸²_k`, `Z = 0`, `n = 2`; `𝔸³_k`, `Z = 0`; cone over an abelian surface | generic point: depth `0`, `c = 2`: `0 > 0` fails, `ℋ²_Z(O) = k[x⁻¹,y⁻¹]` infinite; `𝔸³`: `0 > −1` holds at `n = 2`, `ℋ²_Z = 0`, fails at `n = 3`; cone: `ℋ²_Z(O) = ⊕_n H¹(S, L^n) = H¹(S, O)`, dimension `2` (Mumford vanishing for `n ≠ 0`) | Checks correct | none |
| 8.1–8.3 | `ℚ(√2)`, `ξ = −√2`, `v = 1+√2`, `y = (1,1)` | `|τ_1(v)| = 2.414 > 1`, `|τ_2(v)| = 0.414 < 1`; pairings `−8, −48, …` | `→ −∞` | none |
| 8.14 lattices | `F = ℚ`, `b′ = ℤ` and `b′ = ⅓ℤ` | `X = ℤ, X^* = ℤ, ⟨m,n⟩ = mn`; `X = ⅓ℤ, X^* = 3ℤ, ⟨⅓,3⟩ = 1`; `(ab′)^* ⊆ (ab)^*` since `ab′ ⊇ ab` | correct, quotient direction correct | none |
| 8.16–8.20 phases | `A = ℤ, B = ⅓ℤ, n = 3, x = 1`; `n = 2`; `x′ = 4`; `B = ¼ℤ, n = 4, ζ = 2 ∈ (ℤ/5)^×, x = 0, 1`; `ℤ/8, ζ = 3` | `m = 3·⅓ = 1`; `2·⅓ ∉ ℤ`; `traceDual(⅓ℤ) = 3ℤ ∋ 3`; values `ζ⁰ = 1`, `ζ¹ = 2` (order of `2` mod `5` is `4`); `3⁴ = 81 ≡ 1 (mod 8)` | all correct; additivity is linearity of the trace | none |
| 8.28 irregular cusp | `s = [[1,0],[2,1]]`, `T = [[1,1],[0,1]]` | `sTs⁻¹ = [[−1,1],[−4,3]]`, `γ = −sTs⁻¹ = [[1,−1],[4,−3]] ∈ Γ_1(4)`, trace `−2`, det `1`: eigenvalues `−1,−1` | correct | none |
| 8.39 weights | `F = ℚ(√5)`, `u = φ⁵`, `n = (u−1)`, `b = b′ = o`, `κ = (1,1)` and `(2,2)` | `φ⁵ = 5φ+3 = (11+5√5)/2`; `N(u) = (−1)⁵ = −1`; `N(u−1) = (81−125)/4 = −11`; `u − 1 ∈ n`, `uε − 1 ∈ o`: `u ∈ o×_{C,1}`; character `N(u)^k`: `−1` for `k = 1`, `1` for `k = 2` | README's iff correct; source's bare "parallel" fails (R02) | none |
| 8.43 descent | `ℤ/4 → (ℤ/4)[t]/(2t)` | `2A = {0,2}`, `t ∈ ker(2)`, `t ∉ 2A` | injective, not flat, allowed | none |
| 8.49 fixed point | `F = ℚ(√3)`, `S = [[1,1+i],[1−i,−1]]`, `u = 7+4√3`, `E: y² = x³−x` | `S² = 3I`; `(2+√3)² = 7+4√3`; `η = u² = 97+56√3 ≡ −1 (mod 7)`; `(7I+4S)² = 97I + 56S`; `#E(𝔽_5) = 8`, `a_5 = −2`; `disc = 12`, `7 ∤ 12` | class in `Δ(7)` nontrivial, point ordinary | none |
| 8.55 route | `D → C` for the Tate cusp, `B = ℤ/4` | `D = Spec B[ζ]^{H}`-torus-boundary, `f_*O_D` keeps `2` | consistent | none |
| 8.56 stabilizer | `F = ℚ`; `diag(2,½)` on `[[1,1],[0,1]]`; `ℤ/9`, `e = 2`, `ζ = −1`, `τ_g = 1`, `ξ = ½` | `o^× = {±1}`, `u² = 1`; conjugate `[[1,4],[0,1]]`: `q ↦ q⁴`, dual `¼`; `(−1)^{2·½·1} = −1 ≠ 1` in `ℤ/9` | correct | none |

**Generality README versus Lean.** 8.5: both quantify over an arbitrary commutative `R`, a
finite-index `U ≤ o^×`, `[F:ℚ] > 1` (as `1 < card InfinitePlace F`, equal to the degree for totally
real `F`), arbitrary positive `y`, and unit multipliers. 8.55: both take proper, flat, locally of
finite presentation (with properness, finite presentation), geometrically reduced and geometrically
connected fibres, and conclude bijectivity on every open after every base change, with no
reducedness of the base; the README's 8.55 applies it to `f : D → C` and says the general theorem
is the one stated in Lean.

**Conventions with witnesses.** `pol` superadditive (Lan17 Def 2.5(4), witness `3 ≥ 1 + 1`);
Tate curve `(du/u)^{⊗2} ↦ dq/q` with `du/u ↦ p·du/u` under `u ↦ u^p`; cusp-unit action
`ξ ↦ u²εξ` with pullback `q^ξ ↦ q^{a_gξ}` and contragredient `ξ ↦ a_g⁻¹ξ` (witness `[[1,4],[0,1]]`
versus `¼`); phase `ζ_e^{e·Tr(ξx)}` (dimitrov line 523); Pink's weight with the inverse-diagonal
convention (witness `diag(t⁻²,1)`); the extension sign of 6.3 (witness `L_P` versus `L_{−P}`);
`Ha = det V^*` in `ω^{⊗(p−1)}` (witness `G_m`, value `1`).

**Shape.** Summary, scope and ownership, conventions, exact supplier contracts (Mathlib, Tau Ceti,
roadmaps), how to read the build, Layers 0–8 in build order each ending with Examples and
Dependencies, worked examples, downstream consumers, references: present. Every target has a
locator and a `*Needs:*` line; every definition has an API list and at least three Checks (counted
on 0.1–0.21, 1.1–1.6, 2.1, 2.3, 2.9, 4.1, 4.3, 6.1, 6.4, 6.5, 6.7, 6.14, 6.16, 7.1, 7.3, 7.15,
7.16, 7.19, 7.28, 7.31, 8.14, 8.20, 8.57). No process words, pull-request numbers, LaTeX
delimiters, round labels or local paths. The module docstring names, layer by layer, the carriers
each unstated headline lacks.

**Headline theorems.** The README's headline table lists, per layer, the compactification,
degeneration, Koecher, `q`-expansion and gluing theorems. Of these only 8.5 and the general
theorem behind 8.55 are statable at the pins; both are stated. The rest need torus torsors and
arithmetic cone systems, mixed boundary data, Shimura varieties and toroidal models, semi-abelian
families and degeneration data, PEL moduli, Hilbert moduli with cusp charts and weight sheaves, and
formal algebraic spaces, none of which exist at the pins, and the docstring says so. Layer 0's
face-projection API (0.1–0.7) is statable on `AddMonoidAlgebra` but consists of one-tactic API
facts, which the file rightly omits. 7.34 (local cohomology on schemes with depth) is not statable
(Mathlib's `localCohomology` is for ideals in a ring and there is no scheme depth at the pin) and
is not a headline. Nothing in the file is padding (one-tactic probe above).

## Not verifiable

- [FC] Faltings–Chai, *Degeneration of Abelian Varieties* (Springer, paywalled): cited in 6.2, 6.5,
  6.6, 6.8, 7.13, 7.14, 7.16, 7.32, 7.33; cited by locator, with Lan's and Moret-Bailly's parallel
  statements read instead where the sample needed them.
- [DT] Dimitrov–Tilouine (8.13, 8.41–8.43) and Moret-Bailly, *Pinceaux* (7.32–7.33): not fetched
  this round; the previous review read them and I did not re-read them.
- Ash–Mumford–Rapoport–Tai (through Pink 6.19 in 1.5), EGA IV₂ 5.10.5, SGA 1 XII 3.2 and VIII 5.2,
  SGA 2 VIII 2.1–2.3, SGA 3 I 4.7.3 and VII_A 4.1–4.3, Stacks Tags 0A18, 0CBN, 0C23, 0FW2: not
  fetched; the SGA 2 statement used in 7.26/7.34 is the standard finiteness criterion and I checked
  its application by hand (above).
- [BHW], [BPS], [CG], [Pilloni12], [Pilloni20], [Yuan], [Bresciani]: read (where read) in arXiv,
  HAL or author copies whose pagination differs from the journal pages the README cites; theorem
  numbers checked, journal pages not.

## Source issues

- **Error** in dimitrov at Théorème 8.6(vi), printed p. 548: the source says `ω^κ` extends to an
  invertible sheaf on the minimal compactification if and only if `κ` is parallel; it should also
  require the `κ`-character of each cusp-unit group `o×_{C,1}` to be trivial, which fails for odd
  parallel weight when a cusp unit has norm `−1` (level `(φ⁵−1)` over `ℚ(√5)`); affects a stated
  result.
- **Misprint** in dimitrov at proof of Théorème 8.3, printed p. 547: the source says take `ξ_0`
  with `a_{ξ_0} ≠ 0` not totally positive and finds a strictly negative pairing; it should say
  `ξ_0 ≠ 0`, since `0` is not totally positive and has no negative pairing; affects nothing.
- **Gap** in dimitrov at Proposition 8.5(ii), printed p. 547: the source says the descent holds for
  every `R`-algebra `R′`; it should say for inclusions `R ⊆ R′`, which is what its cited proof
  covers, uniqueness failing for `R → 0`; affects a stated result.
- **Misprint** in lan17 at Proposition 7.5, author copy p. 28: the source says that when `H′` is a
  normal subgroup of `H` the group `H/H′` acts and the invariants give the left side, although
  (7.2) and Proposition 7.3 go from level `H` to the larger level `H′`; it should say `H` normal in
  `H′` with `H′/H`-invariants; affects nothing.
- **Gap** in bcgp21 at §8.2, printed p. 240: the source says sections of a line bundle on a normal
  formal scheme extend across an open whose complement has codimension at least two; it should
  argue through the algebraic model (finiteness of `ℋ²_Z` and the `p`-power transition maps), since
  normality of the formal scheme does not make its thickenings `S2`; affects the proof.
