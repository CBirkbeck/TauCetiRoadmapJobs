<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2153#issuecomment-6408737368 -->
Review (claude) of abded8a

Verdict: needs changes

1. **F01** (P2) Ownership of Layers 2–3, §§1.4–1.5 and §§7.4–7.6 is stated as settled while four later roadmaps still plan the same objects

   **Location.** `README.md` lines 49–63 ("**This roadmap owns** … the crystalline key formula over perfect
   schemes …; fppf cohomology of animated rings with its deformation triangle, p-adic continuity, excision
   and descent modulo p …; factoriality of regular local rings, parafactorial local rings and the local
   Grothendieck–Lefschetz theorem …") and lines 108–112 ("**Downstream boundary.** SchemeAndStackFoundationsPartII
   and PrismaticCohomologyPartIII §6.0 consume the flat cohomology of animated rings, the crystalline key
   formula, continuity and excision from Layers 2–3 here, and EtaleDualityAndPerverseSheavesPartII consumes
   the local duality and local Lefschetz statements of §§1.4–1.5; DeformationAndDerivedPatchingAlgebra
   consumes … §§7.4–7.6"); the same claims in `## Downstream consumers` (lines 2234–2242).

   **Claim.** These objects have a single owner, this roadmap, and the four named roadmaps import them.

   **Witness.** At their current heads none of the four imports anything from this roadmap; each plans
   the object itself:
   - PrismaticCohomologyPartIII (pull request 1070, head d797991) §6.0 "Animated flat cohomology and the
     multiplicative fracture square" constructs `Prismatic.FlatCohomology.perfectDieudonneComparison`
     (the covariant Dieudonné sheaf over a perfect base and the triangle `Rε_*G → M(G) → M(G)`, with the
     Checks of §2.1 here), `Prismatic.FlatCohomology.pContinuity` (CS24 Theorem 5.3.5, §3.4 here),
     `Prismatic.FlatCohomology.excision` (CS24 Theorem 5.4.4, §3.5 here) and "flat cohomology on animated
     rings by sheafification" with the square-zero fibre sequence (CS24 Theorem 5.2.8, §§3.2–3.3 here);
     its README contains no occurrence of `PurityForFlatCohomology`.
   - SchemeAndStackFoundationsPartII (board design, `packages/SchemeAndStackFoundationsPartII/design/README.md`
     lines 7–9, 62, 114–116, 258–262) says it "owns ind-fppf and ind-syntomic maps, the pro-fppf site …",
     that "PrismaticCohomologyPartIII §6.0 owns the perfect-base classification, Hom/Ext description,
     perfect pro-fppf comparison, V−1 sequence and perfect-base cohomology triangle", declares
     `gap:animated-flat-cohomology` and `gap:cohomology-deformation` against PrismaticCohomologyPartIII,
     and plans "Animated group points and cotangent deformation" (its Layer 2); its only mention of this
     roadmap (line 1018) says this roadmap *uses* its support excision and continuity.
   - EtaleDualityAndPerverseSheavesPartII (board design, lines 1112, 1250–1251) plans EQ.7
     `local-lefschetz-hyperplane-theorem` and says "PurityForFlatCohomology PF.1 … uses EQ.7".
   - DeformationAndDerivedPatchingAlgebra (pull request 1034) §6.9 states `localCI_parafactorial`
     (SGA 2 XI 3.13(ii); `README.md` line 1337 of that roadmap), the theorem of §7.6 here.

   The merge order places this roadmap at line 66 and the four at lines 67 (PrismaticCohomologyPartIII),
   69 (DeformationAndDerivedPatchingAlgebra), 119 (EtaleDualityAndPerverseSheavesPartII) and 198
   (SchemeAndStackFoundationsPartII), so the package rightly cannot cite them and moved the notions down;
   the package report records the moves (its §3). The design's `plan.json` had declared these notions as
   gaps `SF-PII-key-formula`, `SF-PII-deformation`, `SF-PII-continuity`, `SF-PII-excision`, `SF-PII-brauer`,
   `SF-PII-tori`, `SF-PII-algebraization`, `EDP-PII-local-lefschetz` and `BR-RESIDUE-*` against those
   roadmaps; the design review accepted that assignment, and `design/README.md` line 72 still says this
   roadmap imports §6.9 from DeformationAndDerivedPatchingAlgebra. So today the objects have two planners
   each, and the README describes the intended end state as if it were the present one.

   **Repair** (prose only; the mathematics stands). In `## Scope and ownership`, after the list "Owned
   elsewhere and consumed here", add one paragraph "Owned here and imported by later roadmaps" listing, one
   clause each: Layer 2 and §2.3 (also planned at PrismaticCohomologyPartIII §6.0 as
   `Prismatic.FlatCohomology.perfectDieudonneComparison` and at SchemeAndStackFoundationsPartII Layer 0);
   Layer 3 (PrismaticCohomologyPartIII §6.0 `pContinuity`, `excision`; SchemeAndStackFoundationsPartII
   Layers 2–3); §§1.4–1.5 (EtaleDualityAndPerverseSheavesPartII EQ.7); §§7.4–7.6 and §1.3
   (DeformationAndDerivedPatchingAlgebra §§3.4, 6.9, R03.3); §7.11, §7.15, §8.2, §8.13
   (SchemeAndStackFoundationsPartII Layer 1 and its `SF-PII-tori`, `BR-RESIDUE-*` gaps), each with the
   sentence "that roadmap is later in the merge order and imports this section". Rewrite "Downstream
   boundary" and `## Downstream consumers` in the same terms ("import from Layers 2–3 here" rather than
   "consume … from Layers 2–3 here" as a present fact), so that the intake can announce the repointing on
   those four jobs. Tested on the instance: with the paragraph in place, the dependency check still reports
   no UPWARD or CYCLE line, since no `*Needs:*` line changes.

2. **F02** (P3) §2.3 cites PerfectoidQuotientsPartII §Q7.1 for a statement it does not make

   **Location.** `README.md` line 857 ("*Needs:* §§2.1–2.2; PerfectoidQuotientsPartII §Q7.1 (ind-fppf
   ring maps and their stability)") and lines 861–862 ("Pro-ppf maps are stable under base change and
   composition (PerfectoidQuotientsPartII §Q7.1)").

   **Claim.** §Q7.1 supplies stability of pro-ppf maps (filtered colimits of *flat* finitely presented
   algebras) under base change and composition.

   **Witness.** `packages/PerfectoidQuotientsPartII/design/README.md` §Q7.1 defines `IsIndFppf` only for
   *faithfully* flat finitely presented colimits, and its "*Uses*" paragraph says of the pro-fppf site that
   "their stability under base change and composition comes from §2.3.3" (of CS24), not from §Q7.1.

   **Repair.** In §2.3, state the stability of pro-ppf maps under base change and composition as a target
   of this subsection (CS24 §2.3.3; Stacks 00QN-style colimit arguments), and cite §Q7.1 only for ind-fppf
   maps, i.e. change the bullet to "Pro-ppf maps are stable under base change and composition ([CS24]
   §2.3.3, a target here); pro-fppf maps are the faithfully flat ones, PerfectoidQuotientsPartII §Q7.1".

3. **F03** (P3) Noetherian hypothesis: Scope says "predicate on Noetherian local rings", the Lean definitions take any local ring

   **Location.** `README.md` line 52 ("complete intersections as a predicate on Noetherian local rings")
   versus §1.1 line 540 ("for a local ring (R, 𝔪)") and `Suggested.lean` lines 70, 87, 96
   (`CohenPresentation`, `IsCompleteIntersection`, `virtualDimension` with `[CommRing R] [IsLocalRing R]`
   only).

   **Claim.** README and Lean have the same generality.

   **Witness.** `#check @IsCompleteIntersection : (R : Type u) → [CommRing R] → [IsLocalRing R] → Prop`
   and `#check @virtualDimension : … → ℤ` (my audit, below). For a non-Noetherian local ring with no Cohen
   presentation, `virtualDimension R = sInf ∅ = 0` by `Mathlib/Data/Int/ConditionallyCompleteOrder.lean`
   lines 36–39 (junk, never used: all four headline theorems carry `[IsNoetherianRing R]`); for a rank-one
   valuation ring with `𝔪 = 𝔪²`, `R̂ = R/𝔪` is a field and `IsCompleteIntersection R` holds although `R`
   is not Noetherian.

   **Repair.** Change line 52 to "complete intersections as a predicate on local rings (used only for
   Noetherian ones)" and add to the docstrings of `IsCompleteIntersection` and `virtualDimension` the
   sentence "For a non-Noetherian local ring the value is not used"; or, equivalently, add
   `[IsNoetherianRing R]` to the three definitions and to the headline signatures' wording in §1.1. Either
   form elaborates; the first changes no Lean type.

4. **F04** (P3) §7.1 Check understates the theorem's own bound

   **Location.** `README.md` lines 1550–1551: "For a smooth variety `X` over a field and `Z` of codimension
   `≥ c`, `H^i(X, μ_p) ≅ H^i(X ∖ Z, μ_p)` for `i < c − 1`, also in characteristic `p`."

   **Claim.** This is the bound §7.1 gives.

   **Witness.** With every `𝒪_{X,z}` regular of dimension `≥ c`, §7.1 applies with `d = c + 1` (regular of
   dimension `≥ d − 1`) and gives bijectivity for `i < d − 1 = c` and injectivity for `i < d = c + 1`. For
   `c = 2`, `X` a smooth surface and `Z` a point, the Check asserts only `i = 0` while the theorem gives
   `H^1(X, μ_p) ≅ H^1(X ∖ Z, μ_p)` (purity for `μ_p`-torsors) and injectivity of `H^2`.

   **Repair.** Replace "for `i < c − 1`" by "for `i < c`, and `H^c(X, μ_p) ↪ H^c(X ∖ Z, μ_p)`"; the
   instance `c = 2` then reads `H^1` bijective, `H^2` injective, which is §7.3 and §7.13 for a point on a
   surface.

5. **F05** (P3) `design/plan.json` was rewritten, not only extended

   **Location.** `packages/PurityForFlatCohomology/design/plan.json`, key `gaps`.

   **Claim** (brief). After the design only additions to `gaps` are made.

   **Witness.** `git diff 7cb2b9d abded8a -- packages/PurityForFlatCohomology/design/plan.json`: 20
   insertions, 119 deletions; the design's fourteen entries (`SF-PII-key-formula`, `SF-PII-deformation`,
   `SF-PII-continuity`, `SF-PII-excision`, `SF-PII-brauer`, `SF-PII-tori`, `SF-PII-algebraization`,
   `PQ-PII-towers`, `EDP-PII-local-lefschetz`, `BR-RESIDUE-*`, …, in the design's own schema with `id`,
   `title`, `neededBy`, `detail`) are replaced by five entries in the intake schema (`slug`, `supplier`,
   `section`, `needs`). The removal is consistent with the moves of R01 and with the three
   DerivedDeRhamCohomology gaps now declared, and the package report §3 and §5 explain it.

   **Repair.** None in the package files beyond R01; the intake should confirm it accepts the rewritten list
   (the five slugs are the ones it announces). If it requires the design entries to stay, re-add them as
   retired entries rather than deleting them.

6. **F06** (P3) §8.15 can cite ArithmeticGaloisDuality §R02.2.4 for the complete equal-characteristic case

   **Location.** `README.md` §8.15 lines 2158–2165 and Convention 8 (lines 148–151).

   **Claim.** The residue sequence of a complete discrete valuation ring is built here from scratch.

   **Witness.** ArithmeticGaloisDuality (pull request 858, earlier in the merge order) §R02.2.4 "Residue
   sequences of Laurent-series fields" states, for a perfect field `k`, `m` prime to `char k` and
   `K = k((t))`, the split exact sequences `0 → H^q(k, μ_m^{⊗r}) → H^q(K, μ_m^{⊗r}) → H^{q−1}(k, μ_m^{⊗(r−1)}) → 0`
   with the residue normalised to send the Kummer class of `t` to `1`.

   **Repair.** In §8.15 add "for `𝒪 = k⟦t⟧` with `k` perfect and `ℓ ≠ char k` this is ArithmeticGaloisDuality
   §R02.2.4 with `q = 2`, `r = 1`" to the route and the *Needs* line, and add to the Checks of §8.14 the
   witness that Convention 8's crossed product `(L/K, σ, π)` and `χ ∪ [π]` have the same residue `χ` under
   that normalisation (two-term example: `𝒪 = 𝔽_q⟦t⟧`, `L = 𝔽_{q^n}((t))`, `π = t`, `χ(Frob_q) = 1/n`; the
   crossed product `(L/K, Frob_q, t)` and the cup product `χ ∪ [t]` both have residue `χ`), so that the sign
   is pinned against the supplier.

Reviewed at the head of pull request 2153 (abded8a; the fable-rev195 checkout was already at that
head and `FETCH_HEAD` of `pull/2153/head` agrees). Files read: `packages/PurityForFlatCohomology/README.md`
(2337 lines), `Suggested.lean` (155 lines), `sources.toml` (32 entries), `metadata.toml`,
`design/plan.json`, `design/README.md`, and the package report `reports/PKG-PurityForFlatCohomology.md`.

## Verified sound

**Checkout and tooling.** Head abded8a confirmed; Mathlib pin `6b7abb3c7686292736be2955bd3eb9ebf63b456a`
and Tau Ceti pin `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` read from `lake-manifest.json` and equal to
the README's "Exact supplier contracts".

**Elaboration.** `lake env lean Suggested.lean` from the content checkout: exit 0 in 5.1 s, output exactly
four `declaration uses 'sorry'` warnings (lines 114, 125, 135, 147). Imports: `import Mathlib` and
`import TauCeti.AlgebraicGeometry.LineBundle.Class` (olean present at the pin). No `set_option`, no
`lemma`, no `#print`/`#eval`, no sorry'd data; one module docstring in the required form; namespace
`TauCetiRoadmap.PurityForFlatCohomology`; 155 lines.

**`#check` audit** (scratch copy with `#check @name` for all nine declarations, elaborated once): 
- `puncturedSpectrum : (R : Type u) → [CommRing R] → (Spec (CommRingCat.of R)).Opens`;
- `CohenPresentation : (R : Type u) → [CommRing R] → [IsLocalRing R] → Type (u + 1)`;
- `IsCompleteIntersection : … → Prop`; `virtualDimension : … → ℤ` (R03 notes the missing Noetherian
  binder; it is deliberate per §1.1 and harmless);
- `finiteEtalePullback : {X Y : Scheme} → (Y ⟶ X) → ((@IsFinite ⊓ @Etale).Over ⊤ X ⥤ (@IsFinite ⊓ @Etale).Over ⊤ Y)`;
- `zariskiNagata_full_faithful_connected : ∀ R [CommRing R] [IsLocalRing R] [IsNoetherianRing R], 2 ≤ virtualDimension R → Full ∧ Faithful ∧ ConnectedSpace (puncturedSpectrum R)`;
- `zariskiNagata_isEquivalence : … 3 ≤ virtualDimension R → (finiteEtalePullback (puncturedSpectrum R).ι).IsEquivalence`;
- `localPicard_torsion_eq_one : … IsCompleteIntersection R → 3 ≤ ringKrullDim R → ∀ x : LineBundleClass (puncturedSpectrum R), IsOfFinOrder x → x = 1`;
- `localPicard_subsingleton : … (IsCompleteIntersection R ∧ 4 ≤ ringKrullDim R) ∨ IsRegularLocalRing R → Subsingleton (LineBundleClass (puncturedSpectrum R))`.
Every elaborated type agrees with its README statement (§§0.1, 1.1, 1.8, 7.7); no section variable
was lost (the file uses no `variable` block). The `letI` in `finiteEtalePullback` is needed: the
direct `MorphismProperty.Over.pullback _ ⊤ f` fails with "failed to synthesize
`(@IsFinite ⊓ @Etale).IsStableUnderBaseChangeAlong f`" (tested on a scratch copy), although
`MorphismProperty.IsStableUnderBaseChange.inf` is an instance at
`Mathlib/CategoryTheory/MorphismProperty/Limits.lean:406`.

**Padding probe.** Each of the four sorried theorems tried with `first | simp | rfl | infer_instance | exact?`
on a scratch copy: all four fail ("`exact?` could not close the goal"). No declaration restates a
definition, mirrors a Check or computes a value: no padding. The five definitions are the minimum the
headlines need (the carrier `puncturedSpectrum` for all four, `virtualDimension` with its two
auxiliaries for the Zariski–Nagata pair, `finiteEtalePullback` for the functor), and none is sorry'd.

**Headline theorems.** From the README: Zariski–Nagata purity in `vdim ≥ 2`, `≥ 3` (stated),
Gabber's local Picard conjecture (stated, both clauses), purity for flat cohomology of complete
intersections and regular rings (CS24 6.2.3, 6.2.7), Gabber's étale-depth bound and 6.2.4, global
purity 7.1.2, the key formula 6.1.1 and perfectoid purity 6.1.2, arc hyperdescent 5.5.1, torsors and
gerbes 7.1.3, the local Brauer conjecture 7.2.5, Brauer purity (C19 1.1–1.3), multiplicative-type and
torus purity (7.2.8–7.2.9, C19 1.4, 6.1), global complete-intersection Picard groups 7.2.3, the
fundamental-group clauses. Each unstated one is named in the module docstring with the missing carrier,
and I confirmed the absences at the pin: no `HasSheafify` instance for `Scheme.fppfTopology` on
`AddCommGrpCat` (the only AlgebraicGeometry `HasSheafify` instance is in `Sites/AffineEtale.lean`);
`CategoryTheory.Sheaf.cohomologyPresheaf` requires `HasSheafify J AddCommGrpCat.{v}` for the morphism
universe `v` (`#check` output); no `PreGaloisCategory` instance outside `Mathlib/CategoryTheory/Galois/`;
no graded-algebra instance on a quotient by a homogeneous ideal under `Mathlib/RingTheory/GradedAlgebra/`;
no `UniqueFactorizationMonoid` result in `Mathlib/RingTheory/RegularLocalRing/` (so §7.4 is not a
Mathlib duplicate); no torsors or gerbes under finite locally free group schemes over a scheme.

**Dependency gate** (`tauceti-roadmap … gate --depcheck … --name PurityForFlatCohomology --order … --movable`):

    depcheck: 56 roadmaps, 649 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. Every `*Needs:*` roadmap is on main (SchemeAndStackFoundations,
LocalPurity, ModularCurves, EtaleCohomologyFoundations, PerfectoidSpaces, DerivedModuleAlgebra,
EnhancedDerivedSheaves), earlier in the merge order as an open roadmap pull request
(DerivedDeRhamCohomology 868, LefschetzPencilsAndVanishingCycles 873,
FiniteFlatGroupsAndIntegralPadicHodgeTheory 879, PerfectoidQuotients 1042, PrismaticCohomology 1057,
PrismaticCohomologyPartII 1065, PurityOfBranchLocus 1103) or an accepted design on the board
(PerfectoidQuotientsPartII, merge-order line 64).

**Cross-roadmap citations resolved** (every section and backticked name, at main b2cca1d0 or the open
head): SchemeAndStackFoundations §§0.3, 0.4, 0.6, 0.9, 0.12–0.14, 0.17, 0.21, 0.24, 1.15, 1.18, 2.1–2.3,
2.7, 2.9–2.11, 2.15, 2.22, 3.4, 4.7–4.10 and all 28 names (`coherent_extension`, `coherent_hartogs`,
`reflexive_extension_normal`, `henselization_flat`, `henselization_noetherian`,
`henselian_finiteEtale_equivalence`, `Module.depth`, `IsLocalRing.depth`, `Ring.IsCohenMacaulay`,
`cohomologyWithSupport`, `supports_localization_triangle`, `localCohomology_module_comparison`,
`depth_localCohomology_vanishing`, `quasiCoherent_topology_comparison`,
`smoothGroup_fppf_etale_comparison`, `hilbert90`, `fppf_kummer_sequence`, `artinSchreier_sequence`,
`finite_pushforward_exact`, `gabber_affine_proper_base_change`, `etale_galois_comparison`,
`etale_cohomology_limits`, `SchemeBrauerGroup`, `CohomologicalBrauer`,
`SchemeBrauerGroup.toCohomologicalBrauer`, `azumaya_equivalent_conditions`,
`brauer_regular_injectivity`, `brauer_henselian_local`); LocalPurity §§1.1, 1.3, 2.1, 2.2 with
`PurityHolds`, `extends_iff_completion_extends`, `purityHolds_of_isRegularLocalRing`,
`finiteEtale_extend_of_purity` (its `puncturedSpectrum` is `(Spec (.of A)).Opens` for a local `A`, so
§0.1's agreement claim is well posed and the names differ); ModularCurves Layer 4D with
`ringKrullDim_adicCompletion`, `isRegularLocalRing_adicCompletion_iff` (README line 1188 there);
EtaleCohomologyFoundations §F.0.2 `VanishingCycles.finiteEtaleGaloisCategory`, §F.5 (trait dualizing
complexes and local biduality named at its lines 7–9); LefschetzPencilsAndVanishingCycles §0.10;
PurityOfBranchLocus §0.3 with `auslander_buchsbaum`, `IsRegularLocalRing.free_of_isCohenMacaulay`,
`IsRegularLocalRing.isRegularLocalRing_localization`; DerivedDeRhamCohomology §0.19
`DerivedDeRham.cohenFactorization`, §0.21 `DerivedDeRham.absoluteCompleteIntersection`, §1.10
`DerivedDeRham.ordinaryFlatnessFromCompleteFlatness` (Noetherian, torsion-free, classically complete
hypotheses match the uses in §§6.2, 6.5); DerivedModuleAlgebra §§0.K.1, 0.4 `Algebra.CotangentComplex`,
0.25, 1.5, 1.7; EnhancedDerivedSheaves E5:animation.1–4; PerfectoidSpaces §§P1.16–P1.18, P1.24–P1.25
(`IsIntegralPerfectoid`), P3.7 (`isPerfectoidField_of_isAlgClosed`), P4.15.2, P4.15.4
(*semiperfectoid-andre-cover*), P7.16a (*regular-finite-flat-residue-tower*, *regular-cohen-presentations*),
P7.17 (*regular-finite-flat-perfectoid-tower*); PerfectoidQuotients §§0.1, 0.2, 0.6 with
`integralPerfectoid_pi_iff`, `perfectoid_completed_tensor`, `perfectoid_completed_root_quotient`,
`perfectoid_completely_etale_henselization`; PerfectoidQuotientsPartII §§Q5.2, Q5.4, Q6.3–Q6.7, Q7.1,
Q10.1 (design README on the board; the `roadmaps resolve` lead at README line 98 is resolved there);
PrismaticCohomology §2.0 with `Arc.Cover`, `Arc.Site`, `ArcPCover`, `ArcP.Site`, `FormalArc.Site`,
`FormalArc.PerfectoidBasis`, `FormalArc.coverByValuations`, the torsion arc descent, the formal-gluing
square and `RΓ_arc(Spf S, O) ≅ S`; PrismaticCohomologyPartII Layer 4 exists and does not state the
Dieudonné functor (so the gap is a real gap); FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.1.40
`raynaudAbelianEmbedding`, §R07.1.41 `pCompleteFlatDescent`, §R07.2.8 `Dieudonne.dieudonneEquivalenceFinite`.
The ten leads of `roadmaps resolve` are all resolved as above.

**Pinned declarations opened** (file and line): `IsRegularLocalRing` (`RingTheory/RegularLocalRing/Defs.lean:51`,
extends `IsNoetherianRing`, axiom `spanFinrank_maximalIdeal`); `Submodule.spanFinrank`
(`Algebra/Module/SpanRank.lean:66`, `0` when no finite generating set); `Scheme.fppfTopology`
(`AlgebraicGeometry/Sites/Fpqc.lean:53`), `Scheme.etaleTopology` (`Sites/Etale.lean:40`),
`smallEtaleTopology` (`:50`); `GrothendieckTopology.over` (`CategoryTheory/Sites/Over.lean:239`);
`MorphismProperty.Over.pullback` (`MorphismProperty/OverAdjunction.lean:98`);
`Ideal.ofList` (`RingTheory/Regular/RegularSequence.lean:41`), `IsWeaklyRegular` (`:135`), `IsRegular`
(`:146`); `AdicCompletion` `CommRing` instance (`RingTheory/AdicCompletion/Algebra.lean:97`);
`WittVector.fontaineTheta` (`RingTheory/Perfectoid/FontaineTheta.lean:165`); `localCohomology`
(`Algebra/Homology/LocalCohomology.lean`); `PreGaloisCategory.functorToContAction`
(`CategoryTheory/Galois/Equivalence.lean:40`); Mayer–Vietoris (`CategoryTheory/Sites/SheafCohomology/MayerVietoris.lean`,
for a `MayerVietorisSquare`, requiring `HasSheafify J AddCommGrpCat.{v}`); Tau Ceti
`LineBundleClass` (`AlgebraicGeometry/LineBundle/Class.lean:50`, `CommGroup` at `:142`),
`FiniteLocallyFreeCommAffineGroupSchemeCat` (`AffineGroupScheme/CartierDuality/FiniteLocallyFree.lean:131`)
and `cartierDual` (`:331`), `MultiplicativeTypeAffineGroupSchemeCat` (`MultiplicativeType.lean:79`),
`TorusAffineGroupSchemeCat` (`Torus.lean:83`), `HopfAlgebra.pointsFppfSheaf`
(`Algebra/AlgebraicGroup/Fppf/Basic.lean:76`). All file-path claims of the supplier contracts are correct.

**Declared gaps.** All five have a named supplier and the same slug in `plan.json` and the README.
`gap:prismatic-dieudonne-perfectoid`: precise (CS24 §4.2.1 and Example 4.2.2 fix `F`, `V`, the
normalisation witnesses and the perfect-base agreement) and minimal (PrismaticCohomologyPartII Layer 4
has no Dieudonné functor; PrismaticCohomology, AInfCohomology and FiniteFlatGroups… cite ALB23 only in
their bibliographies). `gap:complete-intersection-presentations`: minimal, since DerivedDeRhamCohomology
§0.19 gives "some (equivalently every) *Cohen factorization*" and §0.21 the cotangent criterion, neither
the statement for an arbitrary surjection from a regular local ring (Stacks 09Q1) nor Cohen–Macaulayness.
`gap:flat-local-complete-intersection` (Stacks 09Q7) and `gap:ci-defect-additivity` (Avramov 1977,
Proposition 3.6): each one sentence with its hypotheses; §0.19 states the fibre criterion only for
*l.c.i. homomorphisms*, not the absolute statement. `gap:regular-tower-tilt`: precise; §Q10.1 states the
tower and its perfectoid completion but not the tilt.

**Ownership by object** (`roadmaps grep` over main and 367 open heads): "virtual dimension" occurs only
in symplectic/Gromov–Witten roadmaps; "parafactorial" only in DeformationAndDerivedPatchingAlgebra (R01);
"Zariski–Nagata" only for the branch-locus and regular cases (LocalPurity, PurityOfBranchLocus,
CrystallineCohomology); "groups of multiplicative type over a scheme" and "flat cohomology with supports"
nowhere; "coniveau spectral" only for K-theory (SchemeKTheoryOperations §Layer 4, a different object);
Brauer residues only as Milnor K-theory residues (K2SymbolsBrauer) or Galois-cohomological residue
sequences (ArithmeticGaloisDuality, R06); C19's §4 tilting appears in ClassicalAdicEtaleCohomology, which
this roadmap does not plan. Ownership against the open pull requests named without files in the brief
was checked through `roadmaps grep`, which indexes them.

**Policy.** No LaTeX delimiters, no process words, no pull-request numbers, no "optional/deferred" in
the README (grep); sources named in the README's "Source corrections" are cited by source line, not by
path. `sources.toml`: 32 entries, no entry flagged unverified; the eleven `uncertified` entries are
exactly the settled ones of the brief.

**Sources: the seeded sample and the unverified locators.** No locator is flagged unverified. Each sampled
target was read at its locator (source lines of the cached texts in parentheses):
- 1.1: CS24 §3.2.1, (3.2.1.1)–(3.2.1.3) (lines 1323–1337, p. 32) define `vdim` through a complete
  regular `R̃ ↠ R̂` and cite SGA 2 XIV 5.2/5.4; SGA2 XIV Proposition 5.2 (lines 7398–7409, printed p. 198)
  takes *any* regular local `B ↠ A` and proves independence of `dim B − μ(I)`, reducing to complete `B`
  (so the Lean quantification over every regular `B` is exactly Grothendieck's); Définition 5.3 and
  Proposition 5.4 (lines 7455–7465, p. 200) give `vdim ≤ dim` with equality iff complete intersection;
  Proposition 5.5 (lines 7466–7480) the separable-fibre invariance. Pages 198–200 as cited.
- 1.3: CS24 Remark 3.2.2 (lines 1346–1352, p. 33) as restated; Kohn Theorem A (line 28, p. 1): for a
  finitely generated module `A` with `pd A = h` there is a triply generated `I` with `pd R/I = h`,
  applied to the residue field as the README says.
- 1.4: CS24 proof of Lemma 3.2.3 (lines 1361–1380, p. 33): ILO14 XV 1.2.4, XVII 0.2, SGA 5 I 1.12(a),
  (4.2.2), ILO14 XVI 3.1.1; ILO14 XV Corollaire 1.2.4 (line 10362, printed p. 220) states
  `H^q(U, ℤ/n) = 0` for `q > d` for a strictly local quasi-excellent `X` of dimension `d` and affine
  open `U`; ILO14 (arXiv v1) XVII Théorème 0.9 (lines 12220–12232) is Gabber's dualizing-complex
  theorem, as the manifest's version note says.
- 1.7: CS24 proof of Theorem 3.3.1 (lines 1427–1459, pp. 34–35): Stacks 0DXR with 0DX9 for (a), 0EJP for
  (b), 09ZL, the codimension counts `n ≤ dim R̃ − 2`, resp. `≥ 3`, and SGA 2 X 3.4(i); Remark 3.3.2
  (line 1460). The misprint "vdim(R_d)" is at line 1453 as the README says.
- 2.2: CS24 Proposition 4.1.4 (lines 1519–1533, p. 37): both displayed lines, the extension
  `𝕄(G) ⊕ 𝟙_n` with `V(0,1) = (m,1)`, and the étale sheafification of fppf extensions, as restated.
- 3.1: CS24 Theorem 5.1.13 (lines 2171–2174, p. 51): `G` flat affine commutative of finite presentation,
  square-zero `A′ ↠ A` with ideal `M`, fibre sequence `G(A′) → G(A) → Hom_R(e^*L_{G/R}, M[1])`, as restated.
- 4.3: CS24 Lemma 4.1.12 (lines 1636–1650, p. 40): hypothesis `n < dim R` present in the statement, not
  used in the proof (which uses (3.2.1.2)–(3.2.1.3) or Stacks 09Q7 and the descent spectral sequence),
  and the proof of Theorem 6.2.7 (lines 3579–3581, p. 85) applies it in degree `d = dim R`.
- 5.2: CS24 Proposition 4.2.4 and Remark 4.2.5 (lines 1701–1710, p. 41), Example 4.2.2 (lines 1694–1697):
  `𝕄(μ_{p^n}) = A_inf/p^n` with `F = Frob`, `V = ξ·Frob^{-1}`; `𝕄(ℤ/p^n)` with `F = Frob(ξ)·Frob`,
  `V = Frob^{-1}`: Convention 6 and the §5.1 Checks agree.
- 5.6: CS24 Claim 4.2.10.1 and proof (lines 1837–1848, p. 45): Katz 4.1.1 field case, `M^{F=1} ⊗ K ≅ M`,
  surjectivity of `ξ·Frob^{-1} − 1`, equivalently of `x ↦ ξx − x^p`, from algebraic closedness; Katz
  Proposition 4.1.1 (line 2310, printed p. 142) is the stated equivalence between `π_1`-representations
  and `(H, F)` with `F : φ^*H ≅ H`, whose field case is the restatement.
- 5.10: CS24 Theorem 6.1.2 and proof (lines 3459–3472, pp. 82–83): regular sequence `ξ, a_1, …, a_d` on
  `A_inf(A)`, projective dimension `≤ 1`, vanishing for `i < d + 1`; Theorem 6.1.1 (lines 3430–3456).
- 7.11: CS24 proof of Theorem 7.2.5 (lines 3768–3779, p. 90): `Br = H²(−, 𝔾_m)_tors` for `X` with an ample
  line bundle after Gabber–de Jong; de Jong, 1.1 Theorem (lines 8–11): ample invertible sheaf, EGA II
  4.5.3, "quasi-compact and separated", as restated in §7.11.
- 7.16: CS24 Theorem 7.2.8 (lines 3828–3845, pp. 91–92) with footnotes 26–27 (parafactorial after EGA IV
  21.13.7; torsion = killed by a locally constant function): (a) and (b) as restated; EGA IV 21.13.7–21.13.8
  (lines 13005–13015, printed pp. 316–317).
- 8.9, 8.10: C19 Theorem 6.2, (6.2.1), (6.2.2) and proof (lines 520–535, pp. 13–14): generic injectivity
  on every nonempty open, Mayer–Vietoris, Theorem 6.1 for the extension across codimension `≥ 2`; Theorem
  1.2 (line 45, p. 2) is the `𝔾_m` case; Lemma 3.2 (line 95) gives the torsion statement.
- 8.16: C19 Remark 6.4, (6.4.4) and footnote 5 (lines 551–563, p. 14): the exclusion of `p`-primary
  parts for imperfect height-one residue fields, Poo17 6.8.2 and 6.8.4, EGA II 7.1.7, as restated in
  §§8.13–8.17.
Also read and found as restated: CS24 Theorems 6.2.3, 6.2.4, 6.2.7, 7.1.2, 7.1.3, 7.2.1, 7.2.9, 5.2.6,
5.2.8, 5.3.5, 5.5.1, 5.5.2, Corollaries 5.2.9, 5.2.10, 5.3.7, 5.3.8, 5.4.5, 5.5.3, Lemmas 2.2.4, 3.1.1,
4.1.3, 4.1.6, 4.1.11, 4.2.6, 4.2.8, 5.4.3, 6.2.2, 7.2.7, Propositions 4.1.7, 4.1.13, 4.2.7, 4.2.9,
4.2.10, Remarks 6.2.6, 7.2.6, Examples 4.1.2, §4.1.5, §1.4 (weakly regular convention, line 298);
C19 §1.5, Lemma 2.1, Propositions 2.2–2.3, Corollary 2.4, Theorem 6.1 and proof, Remark 6.3; SGA2 XI
3.13 (printed p. 105), 3.14, X 3.4 (i) and (ii); SGA1 V 6.9, 6.10; ILO14 XVIII-A Lemma 2.2 and (2.a)
(printed p. 333); CTS87 0.5 (p. 155), Definition 1.2 (p. 157), Theorem 2.2 (pp. 161–163), Lemma 2.4
(p. 164); Poo17 6.8.1–6.8.4 (pp. 196–197); Gro66 Lemma 1.1, Proposition 1.4, Lemmas 1.6, 1.9,
Corollary 1.8 (pp. 290–293); Bégueri 2.2.1 (the standard smooth resolution); ALB23 Theorem 5.1.4
(arXiv v4; antiequivalence with torsion prismatic Dieudonné modules, `Ext¹(u^{-1}H, 𝒪_Δ)`); BS22 8.10,
7.14, 8.8; Lau13 Corollary 6.5; EGA II 4.5.3, 7.1.7; EGA IV_2 5.10.5, 6.1.2; Ces15 Lemma B.14; BC22
Lemma 2.3.2; Stacks 07DV (cached chapter).

**Adversarial table** (sampled targets, headlines, and the targets the findings touch).

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §0.1 `puncturedSpectrum` | field `K`; DVR; `k × k`; zero ring; `k⟦x,y⟧`; semilocal `R` | `J(K) = 0`, `V(0) = Spec K`, complement `∅`; `J = 𝔪`, complement `{(0)} = Spec K`; `J(k×k) = 0`, complement `∅`; `Spec 0 = ∅`; `D(x) ∪ D(y)`; `V(∩𝔪_i) = {𝔪_1,…,𝔪_n}` by prime avoidance | matches all five Checks and the API bullets | none |
| §0.1 "empty iff `dim R = 0`" | `R ≠ 0` semilocal | `V(J) = Spec R` iff every prime contains some `𝔪_i` iff every prime maximal | true; needs `R ≠ 0` (stated) | none |
| §0.2 supports | DVR, `𝔾_m`; `k[t]`, `(t)`, `𝔾_a`; `𝔸¹`, `Z = 0` | `H^0_𝔪 = ker(R^× → K^×) = 0`, `H^1_𝔪 = K^×/R^× = ℤ`; `k[t,t^{-1}]/k[t]`; `H^0_Z = ker(k[t] → k[t,t^{-1}]) = 0 ≠ k` | Checks hold | none |
| §0.4 vanishing | `k[x_1..x_d]`, origin; `Z = Spec A`, `d = 1` | `H^i_Z = 0`, `i < d`, `H^d_Z ≠ 0`; `H^0_{Spec A}(A) = A` | sharp; hypothesis needed | none |
| §0.5 Hartogs | `k[x,y]`, origin; `Z = V(x)`; doubled origin | `k[x,y]`; `k[x^{±1},y]`; two sections agreeing off `0` | (b) needs length 2; (a) needs separated | none |
| §1.1 `virtualDimension`, `IsCompleteIntersection` | `k⟦x⟧` as `k⟦x,y⟧/(y)`; `k⟦x,y⟧/(xy)`; `k⟦x,y⟧/(x,y)²`; `𝔽_p⟦x,y,z,t⟧/(x²,y²,xz−yt)`; non-regular "presentation"; `B` non-complete | `2−1 = 1 = 1−0`; `2−1 = 1 = dim`; `2−3 = −1`, `dim 0`; `μ = 3` (independent quadrics), `4−3 = 1`, `dim R = dim 𝔽_p⟦z,t⟧ = 2`, not CI; `2−0 = 2 ≠ 1` excluded by `IsRegularLocalRing`; `B̂ ↠ R̂`, `μ(IB̂) = μ(I)`, `dim B̂ = dim B` | SGA 2 XIV 5.2 covers arbitrary regular `B`; Lean set is a singleton for Noetherian `R`, `sInf` = the value | R03 (docstring) |
| §1.1 non-Noetherian `R` | rank-one valuation ring with `𝔪 = 𝔪²` | `R̂ = R/𝔪`, presentation `k ↠ k`, kernel `0 = ofList []`, so `IsCompleteIntersection R` | junk outside Noetherian; headlines assume Noetherian | R03 |
| §1.2 additivity | `R → R^{sh}`; `k⟦x⟧ → k⟦x,y⟧/(y²)`; fibre `k⟦y,z⟧/(y,z)²` | `vdim + 0`; `1 + 0 = 1`; `vdim − 1` with `dim` unchanged | matches CS24 (3.2.1.3) | none |
| §1.3 (a), (b) | twisted cubic cone; `I = (x², xy, xz) ⊂ k⟦x,y,z⟧` | CM, `dim 2`, `μ(I) = 3`, `vdim = 1 < 2`; `x̄` killed by `𝔪`, `x̄ ≠ 0` (`I ⊂ 𝔪²`), depth `0`, `vdim = 0 = dim R̃ − 3` | (b) separates only for `dim R̃ ≥ 4`, as the Check says | none |
| §1.4 (a)–(c) | `d = 1`, `f = π`; `d = 0`; shift `[d]` | `R[1/f]` a field of `cd_ℓ = 1`; linear duality; `H^{2d}_𝔪(R, μ_ℓ^{⊗d}) = ℤ/ℓ` would sit in degree `d` | twist and shift forced | none |
| §1.5 local Lefschetz | DVR, `f = π`; `f` unit; `k⟦x,y⟧`, `f = x` | `H^0_𝔪 = 0 ↪ ℤ/ℓ`; `R/(f) = 0`, claim is `H^i_𝔪 = 0`, `i < 1`; degree `2`: `0 → ℤ/ℓ(−1)` not onto, nothing claimed there | ranges exact | none |
| §1.6 étale depth | `k⟦x,y⟧/(xy)`; depth-0 rings of §1.3(b) | `H^0_𝔪(ℤ/ℓ) = 0`, `H^1_𝔪 ⊇ coker(ℤ/ℓ → (ℤ/ℓ)²) ≠ 0`; `H^0_𝔪(𝔾_a) ≠ 0`, `H^i_𝔪(ℤ/ℓ) = 0`, `i < 2` | sharp; independent of depth | none |
| §1.7 algebraization | `I = 𝔪`; `dim 4`, `d = 1` vs `dim 3`; `k⟦x,y⟧`, `I = (x)` | both sides `0`; `4 > 3` vs `3 > 3` false, matching `vdim ≥ 3`; `lim Γ(U, 𝒪/xⁿ) = k((y))⟦x⟧ ∋ Σ y^{−n²}xⁿ ∉ R[1/y] ⊇ Γ(V, 𝒪)` | bound in (a) necessary | none |
| §1.8 `zariskiNagata_*` | `k⟦x,y⟧`; `k⟦x,y⟧/(xy)`; `A_1` (`vdim 2`); 3-dim node; `𝔽_p⟦x,y,z,t⟧/(x²,y²,xz−yt)`; `f = 𝟙`; `f = ∅ ↪ X ⊔ X`; field; `k[ε]/ε²`; `k⟦x,y⟧/(x,y)²` | (a) full faithfulness, (b) is LocalPurity §2.1; `U_R` two punctured lines, disconnected, `vdim 1`; `π_1(U_R) = ℤ/2 ≠ 1`; extends by SGA 2 X 3.4(ii); `vdim 1`, no claim; equivalence; essentially surjective, not faithful; `vdim 0, 0, −1` excluded (`U_R = ∅` is not `ConnectedSpace`) | Lean hypotheses `2 ≤`, `3 ≤` exclude every degenerate case | none |
| §2.1 `𝕄` conventions | `ℤ/p^n`, `μ_{p^n}`, `α_p`; `S = Spec 𝔽_p ⊔ Spec 𝔽_p` | `(F,V) = (p·Frob, Frob^{-1})`, `(Frob, p·Frob^{-1})` (CS24 Ex. 4.1.2); `𝒪_S`, `F = V = 0`; `𝔽_p × 𝔽_p` | swapping covariant/contravariant swaps the first two | none |
| §2.2 low degrees | `ℤ/p`; `μ_p` over perfect `A`; `A = 𝔽̄_p` without `V = 1` | `A^{φ=1}`, `A/(φ−1)A`; `V − 1 = −1` invertible, both `0`, `μ_p(A) = 0`, `A^×/p = 0`; `𝔽̄_p ≠ ℤ/p` | matches CS24 4.1.4 | none |
| §2.3 pro-fppf | `ℤ/p` over `𝔽_p`; `α_p`-torsor `A[s]/(s^p)` | `φ^{-1} − 1` onto on `𝔽̄_p`, not on `𝔽_p`; non-reduced, perfection `A` | covers must be perfected | R02 (supplier of stability) |
| §2.4 key formula | `ℤ/p`; `μ_{p^n}`; `α_p` over perfect vs non-perfect | Artin–Schreier; `V − 1` invertible, `RΓ = 0`; `RΓ(S, α_p) = 0`, but `α_p`-torsors exist over `𝔽_p[t]` | perfectness needed | none |
| §3.1 deformation | `𝔾_m`, discrete `M`; `𝔾_a`; `μ_p/𝔽_p` | fibre `1 + M ≅ (M,+)` in degree `0`; `A′ → A → M[1]`; `e^*L` in degrees `−1, 0` | matches CS24 5.1.13 | none |
| §3.3 nilpotent invariance | `𝔾_m`, `k[ε]`; `α_p`, `𝔽_p[ε]` | `R^× ↠ k^×`, kernel `1 + kε`; `H^0 = 𝔽_pε`, `H^1 = R/R^p = 𝔽_pε` map onto `0` | ranges `i ≥ 1` resp. `i ≥ 2` for bijectivity | none |
| §3.4 `p`-adic continuity | `ℤ_p`, `μ_{p^n}`, `p = 2`; `𝔽_p(s)`, `μ_p`; `ℤ`, odd `p` | `ℤ_p^×/p^n`, `−1` not a square; `Br(𝔽_p(s))[p] ≠ 0`; `ℤ^×/p ⊕ Pic(ℤ)[p] = 0 ≠ ℤ_p^×/p = ℤ/p` | perfectness and `p`-henselianity needed | none |
| §3.5 excision | identity; `I = π_0A`; `ℤ_(p) → ℤ_p`, `μ_p`; `ℤ_(p) → ℚ` | trivial; `0`; `H²_𝔪 = ℤ/p` both sides (valuation mod `p`, `Pic = 0`, `Br` injective); `𝔽_p ≠ 0`, `ℤ/p ≠ 0` | support condition needed | none |
| §4.1–§4.4 char `p` | `𝔽_p⟦x⟧/(x²)`; `𝔽_p⟦x,y,z,t⟧/(x²,y²,xz−yt)`; `A_1` with `μ_2`, `p ≠ 2` | `x ∈ α_p(R)` killed by `𝔪`; `xy ≠ 0` (degree-2 span of `x², y², xz−yt` misses `xy`), `(xy)^p = 0`, `𝔪·xy = 0`; `Pic(U_R)[2] = ℤ/2 ⇒ H²_𝔪(μ_2) ≠ 0` | §6.4 computation verified | none |
| §4.3 covers | `R′ = R`; `k⟦t⟧ → k⟦t^{1/p}⟧` | tautology; tensor powers local CI of dim `1` | `n < dim R` dropped, used with `n = dim R` in CS24 6.2.7 | none |
| §5.2, §5.7 perfectoid valuation rings | rank `0` with `p ≠ 0`; `𝒪_C`, `a = p`; `μ_p` | `K = lim K/p^n = 0`, impossible, so rank `0` forces `p = 0` (perfect field); `G(𝒪_C) = G(C)`, `H^{≥1}(C) = 0`; `μ_p(K_i) = ℤ/p` or `0` by characteristic | README's "perfect if `p = 0`; otherwise `A_i[1/p]` perfectoid field" is exactly right | none |
| §5.6 Katz | `F = φ`; `F = c·φ`; `𝔽_3(t)^{perf}`, `F = t·φ` | `𝔽_p`; root of `x^{p−1} = c^{-1}`; `x² = 1/t` needs `v(x) = −1/2 ∉ ℤ[1/3]` | algebraic closedness needed | none |
| §5.10 purity | `𝔽_p`, `Z = Spec 𝔽_p`, `d = 0`; `𝒪_C`, `d = 1` | `H^0 = ℤ/p ≠ 0`, nothing asserted; `H^0_𝔪 = 0` | consistent | none |
| §6.5 `dim R` degree | DVR, `μ_p`; field, `ℤ/n`; `𝔽_p⟦x,y⟧`, `α_p` | `μ_p(R) = μ_p(K)`, `R^×/p ↪ K^×/p`, `H²_𝔪 ⊇ ℤ/p`; `U_K = ∅`, `H^0_𝔪 = ℤ/n`; `H²_𝔪(α_p) = ker(φ ∣ H²_𝔪(R))` (as `H^1_𝔪(R) = 0`), `φ` injective by Kunz | "not a field" needed; degree `d + 1` out | none |
| §7.1 global purity | `Spec k ⊔ Spec k`, `d = 1`, `ℤ/2`; smooth variety, codim `c` | `(ℤ/2)² → ℤ/2` not injective, excluded by `max(d−1,1)`; `d = c+1` gives bijective `i < c`, injective `i = c`, Check says `i < c − 1` | CS24 7.1.2 needs the correction; Check not sharp | R04 |
| §7.5–§7.7 `localPicard_*` | 3-dim node; `A_1`; regular `dim 2, 1, 0`; elliptic cone (dim 2) | `Pic(U_R) = Cl(R) = ℤ·(x,z)`, torsion free, nonzero; `Cl = ℤ/2`, depth `2`, not parafactorial; `Pic(U_R) = 0`, `Spec K`, `∅` (singleton `LineBundleClass`); `Pic(U_S)_tors` infinite, no claim at `dim 2` | Lean `(CI ∧ 4 ≤ dim) ∨ Regular` and `CI ∧ 3 ≤ dim` match CS24 7.2.1 | none |
| §7.8 CM failure | `n = 3`; `n = 2` | Veronese cone CM, `Pic(U_R) ⊇ ℤ/2`, `R^× = R^{×2}`, `H^1(R, μ_2) = 0`, class `↪ H²_𝔪(μ_2) ≠ 0` vs `2 < 3`; `A_1`, allowed | §6.2 needs CI | none |
| §7.11–§7.14 Brauer | `Spec K`; `U_{k⟦x,y,z⟧}`; Segre cone; elliptic cone `R = S^{sh}⟦x,y⟧/(xy)` | `Br(K) = H²`; quasi-affine; nontorsion classes; `Br(R) = 0`, `Br(U_R)` infinite, `dim 3` | thresholds `≥ 4`, `≥ 2` sharp (CS24 7.2.6) | none |
| §7.16–§7.17 multiplicative type | regular `dim 2`, `𝔾_m`; `A_1`; 3-dim node, `d = 3` | `Br(R) ≅ Br(U_R)`; `Pic(U_R) ≠ 0 = Pic(R)`; `H^1(R) = 0 ≠ ℤ = Pic(U_R)` | parafactoriality / factoriality needed | none |
| §8.2–§8.3 tori | `R′ = R`; `ℝ`; `ℝ⟦x,y⟧`, norm-one torus | identities; `H²(ℝ, ℤ/2) = ℤ/2`; `H^1(U_R, T) ≅ H^1(ℝ, T) = ℤ/2` | residue-field hypothesis needed | none |
| §8.4 coniveau | `Z = {x}`; Dedekind, `Z = X`; `𝔸¹` codim-one points | excision; localization sequence; dense non-closed set | filtration by closed supports (ILO14 XVIII-A 2.2) | none |
| §8.8–§8.10 generic injectivity | `𝔾_m^r`; `Spec K`; `ℙ¹_ℝ`, norm-one torus; `Spec ℤ` | holds; trivial; fails (§8.12); `⋂_p Br(ℤ_(p)) = 0` by reciprocity (`inv_∞` forced to `0`) | matches C19 6.2–6.3 | none |
| §8.11 flasque | norm-one torus of `ℂ/ℝ` | `0 → ℤ → ℤ[ℤ/2] → ℤ_sign → 0` nonsplit, `Ext¹(ℤ_sign, ℤ) = ℤ/2`; `Ext¹(ℤ_sign, ℤ[G]) = 0` | testing only `ℤ[G]` would be wrong | none |
| §8.13–§8.16 residues | `ℚ_p`; `ℂ⟦t⟧`; `k⟦t⟧`, `k` imperfect; `ℝ⟦t⟧`; `Spec ℤ`; quaternions over `ℚ` | `∂` iso `ℚ/ℤ`; `∂ = 0`; `Br(k((t)))[p] ≠ 0` with `H^1(k, ℚ/ℤ) = 0`; `ℤ/2 → (ℤ/2)² → ℤ/2` exact; kernel of `Br(ℚ) → ⊕_p ℚ/ℤ` is `0` by reciprocity; residues `1/2` at `2`, `0` elsewhere | sign fixed by Convention 8; supplier normalisation to be compared | R06 |
| §8.18 divisor | `n = 1`; swap `u, v` | trivial class; residue inverted | sign pinned by the generators | none |
| Source corrections (6) | CS24 lines 3630, 1453, 3578, 3726, 3774, 1636–1650; C19 130–146 | field counterexample for `d = 1`; `R_d`; `x_n`; `n ≥ 0`; unused `n < dim R` applied with `n = dim R` (line 3579); Giraud III 3.2.2 gives only the trivial fibre for noncommutative `G`, both uses commutative | all six confirmed | none |

## Not verifiable

- Stacks tags 09Q1, 09Q7, 0DXR, 0DX9, 0EHC, 0EJP, 023M, 09ZL, 0BLL, 0BMA, 0EY7: the cache holds only
  the Algebra chapter (tag 07DV checked there; 0913 occurs only as a page number). 0DXR, 0DX9, 0EJP,
  09ZL, 07DV, 0913 and 09Q7 are cited for the same statements by CS24 at the lines quoted above, and
  0BLL, 0BMA, 0EY7 by LocalPurity's source table; 09Q1, 0EHC and 023M are not re-checked against the
  Stacks text.
- ILO14 XVII "Théorème 0.2 of the published version": only arXiv v1 (Théorème 0.9) is cached; the
  manifest's version note records the renumbering.
- ALB23 "Theorem 5.4", "Theorem 4.44", "Lemma 4.75" are published-version numbers quoted by CS24; the
  cached arXiv v4 has Theorem 5.1.4 (checked) and different numbering for the lemmas.
- The eleven `uncertified` sources (DF84, Avr77, Aus62, Gro68, MB85, Bou78, Gab04b, BH, SGA3, SGA4,
  SGA5): cited by locator through CS24/C19 as the manifest records; settled by the brief.
- CTS87 Theorem 2.2(ii) itself (p. 161) is read only as a statement number; its proof pages 161–163 were
  not checked line by line.
- Ownership against the open roadmap pull requests was checked through `roadmaps grep` (which indexes
  all 367 heads) and the board packages index; the six board packages on other pull requests
  (AnalyticNumberTheory, AutomorphicCongruences, KatoEulerSystems, LawrenceVenkateshMethod,
  LogicAndDefinabilityInNumberTheory, VStackSheavesAndLisseCategoriesPartII) are unrelated by title and
  were not opened.

## Source issues

- **Error** in CS24 at Theorem 7.1.2, printed p. 87 (text line 3630): the source allows local rings
  regular of dimension `≥ d − 1`, which for `d = 1` admits fields, where injectivity of `H^0` fails
  (`Spec k ⊔ Spec k`); it should be regular of dimension `≥ max(d − 1, 1)`, as its proof via Theorem
  6.2.7 needs; affects a stated result.
- **Misprint** in CS24 at proof of Theorem 3.3.1(b), printed p. 35 (line 1453): the source says
  `vdim(R_d) ≥ 3`; it should be `vdim(R) ≥ 3`; affects nothing.
- **Misprint** in CS24 at proof of Theorem 6.2.7, printed p. 85 (line 3578): the source says
  `f ∈ (p, x_1, …, x_n)²`; it should be `(p, x_1, …, x_d)²`; affects nothing.
- **Misprint** in CS24 at proofs of Theorems 7.2.1 and 7.2.5, printed pp. 89–90 (lines 3726, 3774): the
  source says `n ≥ 0`; it should be `n ≥ 1`; affects nothing.
- **Misprint** in CS24 at Lemma 4.1.12, printed p. 40 (lines 1636–1642): the source carries the
  hypothesis `n < dim R`, unused in its proof and violated by the application with `n = dim R` in the
  proof of Theorem 6.2.7 (line 3579); it should state the lemma for every integer `n`; affects the proof
  (of Theorem 6.2.7, formally).
- **Gap** in C19 at Proposition 2.2, printed p. 4 (lines 130–146): the source states injectivity of
  `H^1(V, G) → H^1(V_{R′}, G)` for a smooth affine group `G` and argues through the exact sequence of
  pointed sets, which for noncommutative `G` gives only the fibre over the trivial class; it should assume
  `G` commutative, as both uses (Proposition 2.3, Corollary 2.4) do; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "abded8a", "job": "REV-PKG-PurityForFlatCohomology", "model": "fable", "worker": "fable-rev195"} -->
