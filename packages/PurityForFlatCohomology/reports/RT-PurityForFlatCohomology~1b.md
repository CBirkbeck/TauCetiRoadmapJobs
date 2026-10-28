<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2153#issuecomment-6411324205 -->
Red team round 1 pass b (claude) of 84e8f65

Verdict: accepted

1. **F01** (P3) Page of [CS24] Theorem 5.1.13

   Location: README §3.1 (line 960), "([CS24] Theorem 5.1.13, p. 51)". Claim: the theorem is on p. 51. Witness: CS24 line 2171 (the statement) lies after the page-52 marker at CS24 line 2143; the page-51 marker is at line 2099. Repair: "p. 52".

2. **F02** (P3) Page of [CS24] Corollary 5.4.5

   Location: README §3.5 (lines 1057–1058), "([CS24] Corollary 5.4.5, p. 67)". Claim: p. 67. Witness: CS24 line 2832 (the statement) follows the page-68 marker at line 2830; Theorem 5.4.4 (line 2816) is on p. 67, the corollary is not. Repair: "pp. 67–68" or "p. 68".

3. **F03** (P3) DerivedModuleAlgebra §0.4 is cited by a namespace, not a declaration

   Location: README line 294, "§0.4 `Algebra.CotangentComplex`". Claim: a declaration of that name in DerivedModuleAlgebra §0.4. Witness: DerivedModuleAlgebra on main, §0.4 (README lines 815 ff.) names `Algebra.CotangentComplex.standardResolution`, `Algebra.CotangentComplex.differentials`, `Algebra.CotangentComplex.PolynomialResolution.comparison`; `Algebra.CotangentComplex` alone occurs nowhere. Repair: "§0.4 `Algebra.CotangentComplex.standardResolution` (the full cotangent complex)" (or cite the section without a name).

4. **F04** (P3) Two owners for the complete-intersection predicate

   Location: README lines 52–54 ("This roadmap owns … complete intersections as a predicate on local rings"); §1.1 "Define `IsCompleteIntersection R`". Claim: this roadmap owns the predicate. Witness: DerivedDeRhamCohomology (merge order line 20, earlier) §0.19 defines "complete intersection at 𝔫" for local homomorphisms through Cohen factorizations, and §0.21 states "locally a complete-intersection ring (each completed local ring is a quotient of a regular local ring by a regular sequence)" with `DerivedDeRham.absoluteCompleteIntersection`; Convention 2 of this README already cites DDR §0.21 for the definition. The Lean definition is legitimate (needed to state the headlines against the pins), but the Scope claims ownership of an object an earlier supplier states. Repair: in Scope replace "complete intersections as a predicate on local rings (used only for Noetherian ones)" by "the Lean restatement `IsCompleteIntersection` of DerivedDeRhamCohomology §0.19's absolute case, used only for Noetherian rings"; add to §1.1's API: "`IsCompleteIntersection R` iff `ℤ_(p) → R` is complete intersection at `𝔪` in the sense of DerivedDeRhamCohomology §0.19 (a Cohen factorization of `ℤ_(p) → R̂` is a Cohen presentation; gap:complete-intersection-presentations makes the choice irrelevant)".

5. **F05** (P3) "Owned here and imported by later roadmaps" states a planned move as a present fact

   Location: README lines 111–129 ("each of those roadmaps imports it from the section named rather than planning it") and lines 2296–2309. Claim: the four later roadmaps import these objects from here. Witness at their heads (read-only; the ownership move itself is the maintainer's decision and is not decided here):
   - PrismaticCohomologyPartIII (#1070) §6.0 constructs `Prismatic.FlatCohomology.perfectDieudonneComparison`, `pContinuity` and `excision` itself; its *Needs* cite PrismaticCohomology §2.0, SchemeAndStackFoundations and DerivedModuleAlgebra, never PurityForFlatCohomology.
   - SchemeAndStackFoundationsPartII (board design) §0.1 defines ind-fppf maps, §0.3 the pro-fppf site, §1.2 Gabber's Brauer comparison with an ample bundle, Layers 2–3 animated group points, supports and deformation; its scope paragraph (design line 9) attributes the perfect-base Dieudonné comparison, V−1 sequence and pro-fppf comparison to PrismaticCohomologyPartIII §6.0.
   - DeformationAndDerivedPatchingAlgebra (#1034) §3.4 defines "absolute local complete intersection" itself and §6.9 states `localCI_parafactorial`; it contains nothing on the virtual dimension, on §1.3's three-generated ideals (no Burch/Kohn), nor on factoriality beyond §6.9 — so the clause "the counterexamples of §1.3" (line 124) does not describe that head (the round-2 P3).
   - EtaleDualityAndPerverseSheavesPartII (board design) has "Layer EQ.7: Local purity and the local Lefschetz theorem" (design line 1033), consistent with the claim.
   Repair (wording only): "each of those roadmaps is to import it from the section named instead of planning it; at their current heads they still plan it" and in "Downstream consumers": "each is to import".

6. **F06** (P3) Layer 0 Examples: "amounts to" states half of an equivalence

   Location: README lines 549–551, "the vanishing of `H^2_𝔪(R, μ_p)` amounts to surjectivity of `H^1(R, μ_p) → H^1(U_R, μ_p)`". Claim: equivalence. Witness: the §0.2 sequence `H^1(R) → H^1(U_R) → H^2_𝔪 → H^2(R, μ_p) → H^2(U_R, μ_p)`; surjectivity of the first map gives only `H^2_𝔪 ↪ H^2(R, μ_p)`, which is nonzero for `k = ℝ`, `p = 2` (`Br(ℝ)[2] = ℤ/2 ⊂ H^2(ℝ⟦x,y⟧, μ_2)`). The example's conclusion is still true (§6.5 gives `H^2_𝔪 = 0` for regular `R` of dimension 2). Repair: "the vanishing of `H^2_𝔪(R, μ_p)` is surjectivity of `H^1(R, μ_p) → H^1(U_R, μ_p)` together with injectivity of `H^2(R, μ_p) → H^2(U_R, μ_p)`; the former needs `Pic(U_R)[p] = 0` (§7.7)".

Pass a: no pass-a report exists on the pull request at the time of this pass; the first comment is the pass-a brief (job RT-PurityForFlatCohomology~1a), not a report. There are therefore no pass-a findings to confirm or refute. The round-2 review's three P3 notes are addressed under R05 and under "Verified sound".

Files reviewed in full: `packages/PurityForFlatCohomology/README.md` (2404 lines, 77 targets, 247 Checks), `packages/PurityForFlatCohomology/Suggested.lean` (157 lines, 9 declarations), `sources.toml`, `design/plan.json` (gaps list), `metadata.toml`. Checkout confirmed at the pull request head 84e8f65 before reading.

## Verified sound

Counts: declarations read 9 of 9 (every binder read by hand; there is no `variable` block, so no section binder can be lost; the `#check` elaboration audit was not run because this pass may run no Lean — see "Not verifiable"); targets read 77 of 77; Checks tested 247 (all, see the table); source locators verified 118 (CS24 54 statements/pages, C19 22, SGA2 9, EGA IV₄ 6, Stacks 8, ILO14 5, Poonen 4, CTS87 5, others 5); cross-roadmap citations resolved 94 (26 SchemeAndStackFoundations sections + 28 named declarations, LocalPurity 4+4, ModularCurves 1+2, EtaleCohomologyFoundations 2+1, DerivedModuleAlgebra 5, EnhancedDerivedSheaves 4, PerfectoidSpaces 10+6, LefschetzPencils 1, DerivedDeRham 3+3, PerfectoidQuotients 3+4, PrismaticCohomology 1+7, PrismaticCohomologyPartII 1, FiniteFlatGroups 3+2, ArithmeticGaloisDuality 1, PurityOfBranchLocus 1+3, PerfectoidQuotientsPartII design 10): every section heading and every named declaration exists at main, at the open head or in the board design, except R03.

Policy: `git diff --stat origin/main...HEAD` touches only `packages/PurityForFlatCohomology/` (README, Suggested.lean, design/plan.json gaps, metadata, reports, sources.toml). No `lemma` declaration, no `set_option`, no pull-request number or process word in README or docstrings; `theorem` throughout; single `import Mathlib` plus `TauCeti.AlgebraicGeometry.LineBundle.Class` (exists at the Tau Ceti pin). Dependency check (run from the board checkout, `--movable`):

    depcheck: 56 roadmaps, 650 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. `roadmaps resolve` lead "PerfectoidQuotientsPartII §§Q5.2" is a false positive: the roadmap is a board design at merge-order line 64 and `### Q5.2` exists (design line 109).

Gaps: the five slugs in `design/plan.json` (`prismatic-dieudonne-perfectoid` → PrismaticCohomologyPartII Layer 4; `complete-intersection-presentations`, `flat-local-complete-intersection`, `ci-defect-additivity` → DerivedDeRhamCohomology §§0.21/0.19/0.21; `regular-tower-tilt` → PerfectoidQuotientsPartII §Q10.1) each appear exactly once as `gap:<slug>` in the README under the supplier's contract. Precision and minimality: PrismaticCohomologyPartII #1065 Layer 4 ("Absolute prismatic cohomology and Cartier–Witt geometry") contains no Dieudonné theory (the only "Dieudonné" occurrence is the ALB23 reference); DerivedDeRhamCohomology #868 nowhere mentions Stacks 09Q1/09Q7 or Avramov 1977 Prop. 3.6; §Q10.1 gives the towers but not the tilt computation. All three DDR gaps have explicit hypotheses.

Pinned libraries (read at Mathlib 6b7abb3c, Tau Ceti a91d3aaf): `Scheme.fppfTopology` (Sites/Fpqc.lean line 53, abbrev), `etaleTopology`/`smallEtaleTopology` (Sites/Etale.lean), `GrothendieckTopology.over` (Sites/Over.lean), `Sheaf.H` (SheafCohomology/Basic.lean line 56) and `cohomologyPresheaf` (line 84; it requires `HasSheafify J AddCommGrpCat.{v}` with `v` the morphism universe, as the module docstring says), ExactSequences.lean and MayerVietoris.lean present, `localCohomology`, `IsRegularLocalRing` (RegularLocalRing/Defs.lean; only Defs and Polynomial exist, so no Auslander–Buchsbaum factoriality: §7.4 is not a Mathlib duplicate), `Submodule.spanFinrank = (spanRank p).toNat` (SpanRank.lean line 66: 0 for infinitely generated, as the README says), `AdicCompletion/Algebra.lean`, `PreGaloisCategory.functorToContAction` (Galois/Equivalence.lean), `IsStableUnderBaseChange.inf` (MorphismProperty/Limits.lean line 406), `IsAzumaya`, `Module.IsReflexive`, `PreTilt`, `fontaineTheta`, `BrauerGroup` only over fields (BrauerGroup/Defs.lean, CSA over a field) so no Brauer group of a ring or scheme; no file under AlgebraicGeometry mentions a finite-étale Galois category or fibre functor; no graded-ring instance on a quotient by a homogeneous ideal (GradedAlgebra has no quotient file). Tau Ceti: `LineBundleClass X` (Class.lean line 50) is the set of isomorphism classes of invertible sheaves with the tensor `CommGroup` — the Picard group; `FiniteLocallyFreeCommAffineGroupSchemeCat`, `MultiplicativeTypeAffineGroupSchemeCat`, `TorusAffineGroupSchemeCat`, `HopfAlgebra.pointsFppfSheaf` exist at the cited files. So each "not statable" reason in the module docstring that can be checked by grep holds, and no statable headline is missing: the four stated ones are exactly CS24 3.3.1(a)(b) minus the π₁ clauses and 7.2.1's two clauses.

Ownership against open pull requests (`roadmaps grep --lean-only`, index of 2026-10-26, 367 pull requests): no other `Suggested.lean` declares `virtualDimension`, `CohenPresentation`, `IsCompleteIntersection` or `finiteEtalePullback`; `puncturedSpectrum` exists on main in LocalPurity (local case, `(Spec (.of A)).Opens`) and LocalPurity also has `finiteEtale := @IsFinite ⊓ @Etale` and `FEt.pullback`; this roadmap's `puncturedSpectrum` (semilocal, Jacobson radical) and `finiteEtalePullback` restate them because a roadmap's `Suggested.lean` may not import another roadmap's module, and the README says so (§0.1 "agrees with the LocalPurity carrier", §1.8 "the restriction functor of LocalPurity §1.1"). Ownership against the open pull requests whose files the brief does not give was not checked beyond the index grep.

Suggested.lean declarations (section, context, values computed):

| Declaration | Context | Instances and values | Result |
|---|---|---|---|
| `puncturedSpectrum R` | `[CommRing R]`, `(Spec (.of R)).Opens`, carrier `V(Ring.jacobson R)ᶜ` | field: `J = 0`, `V(0) = Spec`, carrier ∅; DVR: `J = 𝔪`, carrier `{(0)} = Spec K`; `k⟦x,y⟧`: `D(x) ∪ D(y)`; `k × k`: `J = 0`, ∅; zero ring: ∅, `ringKrullDim = ⊥`; local `R`: `Spec ∖ {closedPoint}` = LocalPurity's carrier | sound |
| `CohenPresentation R` | `[CommRing R] [IsLocalRing R]`; `ring : Type u`, `IsRegularLocalRing ring`, surjection onto `AdicCompletion (maximalIdeal R) R` | `k⟦x,y⟧ → k⟦x⟧`, kernel `(y)`; `k⟦x,y⟧/(xy) → k⟦x,y⟧/(xy)` excluded by the regularity field; non-complete `B` is equivalent to `B̂` (`dim B̂ = dim B`, `μ(IB̂) = μ(I)` by faithful flatness) | sound |
| `IsCompleteIntersection R` | ∃ presentation and `rs : List P.ring` weakly regular with `ker = ofList rs` | `k⟦x,y⟧/(xy)`: `rs = [xy]`; `k⟦x,y⟧/(x,y)²`: no presentation has regular kernel (`vdim = −1 < 0 = dim`); regular `R`: `rs = []`; rank-one valuation ring with `𝔪 = 𝔪²`: `R̂ = R/𝔪`, holds with `rs = []` (junk, excluded by `[IsNoetherianRing R]` on every theorem) | sound; see R04 |
| `virtualDimension R` | `sInf {μ(𝔪_B) − μ(ker)} : ℤ` | `k⟦x_1..x_n⟧`: `n`; `k⟦x⟧` as `k⟦x,y⟧/(y)`: `2 − 1 = 1`; `(x,y)²`: `2 − 3 = −1`; `𝔽_p⟦x,y,z,t⟧/(x²,y²,xz−yt)`: `4 − 3 = 1 < 2 = dim`; set is a singleton by SGA2 XIV 5.2 (line 7398–7402: `dim B − q` independent of `B`); empty set: `sInf ∅ = 0`, unused | sound |
| `finiteEtalePullback f` | `Over.pullback (IsFinite ⊓ Etale) ⊤ f` with `IsStableUnderBaseChange.inf` | `f = 𝟙`: identity up to iso; empty open: essentially surjective, not faithful on `X ⊔ X` | sound |
| `zariskiNagata_full_faithful_connected` | `[IsNoetherianRing R] (h : 2 ≤ vdim)` → `Full ∧ Faithful ∧ ConnectedSpace U` | = CS24 3.3.1(a) (line 1420–1422) without the π₁ clause; regular dim 2: holds; `k⟦x,y⟧/(xy)`: `vdim 1`, `U` disconnected (no claim); `A_1`: `vdim 2`, (a) holds, (b) fails (`π₁(U) = ℤ/2`) | sound |
| `zariskiNagata_isEquivalence` | `3 ≤ vdim` → `IsEquivalence` | = 3.3.1(b) (line 1423–1424); node `xy − zw`, `vdim 3`: SGA2 X 3.4(ii) (line 3392) | sound |
| `localPicard_torsion_eq_one` | `IsCompleteIntersection R`, `3 ≤ ringKrullDim R`, `IsOfFinOrder x` → `x = 1` | = CS24 7.2.1 first clause (line 3707–3708); node: `Pic(U) ≅ ℤ` torsion free; elliptic cone dim 2: infinite torsion, excluded | sound |
| `localPicard_subsingleton` | `(CI ∧ 4 ≤ dim) ∨ IsRegularLocalRing R` → `Subsingleton (LineBundleClass U)` | = 7.2.1 second clause (line 3709–3710); field: `U = ∅`; DVR: `U = Spec K`, `Pic = 0`; `k⟦x_1..x_5⟧/(x_1x_2 − x_3x_4)`: `Pic(U) = 0` though `Cl(R) = ℤ` | sound |

Adversarial pass (one row per target; "=" means the statement agrees with the cited source line; every Check of the section was recomputed):

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| Conv. 1 | CS24 line 297–299 | EGA regular sequences, no nonzero-quotient condition | = |
| Conv. 6, §2.1, §5.1 | `ℤ/pⁿ`, `μ_{pⁿ}`, `ξ = p` | `𝕄(ℤ/pⁿ)`: `FV = φ(ξ)φφ⁻¹ = φ(ξ)`, `VF = φ⁻¹(φ(ξ)φx) = ξx`; `𝕄(μ_{pⁿ})`: `FV = φ(ξφ⁻¹x) = φ(ξ)x`; perfect: `𝕄(ℤ/p)^{V=1} = A^{φ=1} = ℤ/p(A)`, `𝕄(μ_p)`: `V = 0`, `V−1 = −1`, complex 0 = `μ_p(A)`; swapping conventions would give `(ℤ/p)(A) = 0` | = CS24 lines 1495–1499, 1694–1697 |
| §0.1 | see declaration table; finite `R → R′` | `V(J(R)R′)` = primes over maximal ideals = maximal ideals of `R′` (integrality) | sound |
| §0.2 | DVR `𝔾_m`; `Z = ∅, X`; `k[t],(t)`; `𝔸¹, Z = 0` | `H⁰_𝔪 = ker(R^× → K^×) = 0`, `H¹_𝔪 = K^×/R^× = ℤ`; `0`, `H^i`; `k[t,t⁻¹]/k[t]`; `ker(k[t] → k[t,t⁻¹]) = 0 ≠ k` | sound |
| §0.3 | `Z_0 = X_0`, `∅`; `μ_n` over `k^s` | absolute; `0 = 0`; `H¹(k^s, μ_n) = 0 = colim k′^×/n` | sound |
| §0.4 | `k[x_1..x_d]`, origin; `Z = Spec A`; `A_inf` | Koszul of `(xⁿ)` acyclic below `d`, `H^d_Z ≠ 0`; `H⁰_Z = A ≠ 0`; `ξ, ã_1..ã_d` regular; Stacks 07DV (line 7566–7572) proof uses only nonzerodivisor facts, so the weak form holds | sound |
| §0.5 | = CS24 7.2.7 (line 3796–3802); `k[x,y]`; `V(x) ⊂ 𝔸²`; doubled origin | `Γ = k[x,y]`; `k[x^±,y] ≠ k[x,y]`; two maps agree off `0` | sound |
| Layer 0 Ex. | `k⟦x,y⟧`, `μ_p`; DVR | `H⁰_𝔪 = H¹_𝔪 = 0`; `coker(R^×/p → K^×/p) = ℤ/p ↪ H²_𝔪` | R06 (wording) |
| §1.1 | see declaration table | SGA2 XIV 5.2–5.4 (lines 7398–7465) = (3.2.1.1)–(3.2.1.2) (CS24 line 1328–1331) | sound |
| §1.2 | `R → R^{sh}`; `k⟦x⟧ → k⟦x,y⟧/(y²)`; fibre `(y,z)²` | `0 + v`; `1 = 1 + 0`; `−1`; CS24 (3.2.1.3) line 1333–1335 | sound |
| §1.3 | twisted cubic cone; `(x²,xy,xz)`; Kohn | `4 − 3 = 1 < 2`; depth 0, `3 − 3 = 0`; Koh72 Thm A (line 28–30) on `k`: `pd(R̃/I) = pd k = dim R̃`, A–B gives depth 0 | sound |
| §1.4 | `d = 1`, `d = 0`, shift | ILO XV 1.2.4 (line 10362–10364) affine `U ⊂ X` strictly local quasi-excellent dim `d`; `cd = 1`; linear duality; `H^{2d}_𝔪(μ^{⊗d}) = ℤ/ℓ`; ILO XVI 3.1.1 (line 11520), XVII 0.9 (line 12220) | sound |
| §1.5 | = CS24 3.2.3 (line 1356–1360); DVR `f = π`; `f` unit; `k⟦x,y⟧`, `f = x` | `0 ↪ ℤ/ℓ`; `R/(f) = 0`; degree 2: `0 → ℤ/ℓ(−1)` not onto | sound |
| §1.6 | = CS24 3.2.4 (line 1381–1383); `xy`; dévissage | `vdim 1`, `H¹_𝔪 ≠ 0` (two components); `vdim(R_1), vdim(R_2), vdim(R_{12}) ≥ vdim R + 1`; closed Mayer–Vietoris exact | sound |
| §1.7 | Stacks 0DXR (line 1678–1688), 0DX9 (224–226), 0EJP (3399–3408); dim 4/3; `I = 𝔪`; `Σ y^{−n²}xⁿ` | hypotheses as stated (closure in `X`); `4 > 3`, `3 > 3` fails; both sides 0; pole orders `n²` beat the linear bound on `D(g)` | sound |
| §1.8 | see declaration table; CS24 line 1427–1459 route | `n ≤ dim R̃ − 2` (resp. `− 3`) gives codimension ≥ 2 (resp. 3) | sound |
| §2.2 | `ℤ/p`; `μ_p`; `𝔽̄_p` | Hom from `𝟙_n`: `V(m) = m`, `Fm = pm` automatic; `V − 1 = −1`; `𝔽̄_p ≠ ℤ/p` | = CS24 4.1.4 (line 1519–1523) |
| §2.3 | `ℤ/p` over `𝔽_p`; `A[s]/(s^p)`; fpqc | `φ⁻¹ − 1` onto `𝔽̄_p` not `𝔽_p`; perfection `A`; pro-fppf ⊂ fpqc; CS24 §4.1.5 (line 1540–1545) | sound |
| §2.4 | = CS24 4.1.8–4.1.9 (line 1567–1594); `ℤ/p`; `μ_{pⁿ}`; `α_p` | Artin–Schreier; `pφ⁻¹ − 1` invertible, `RΓ = 0` (Frobenius makes `H^i(A,𝔾_m)` uniquely `p`-divisible); `−1` | sound |
| §3.1 | = CS24 5.1.13 (line 2171–2174); `𝔾_m`; `𝔾_a`; `μ_p/𝔽_p` | `1 + M`; `A′ → A → M[1]`; `e^*L`: `t^p ↦ pt^{p−1}dt = 0`, degrees −1, 0 | R01 (page) |
| §3.2 | = CS24 5.2.4, 5.2.6 (line 2318–2326); `μ_n` | `Res_{ℤ/n}𝔾_m = 𝔾_m^n`, `ζ ↦ (ζ^i)`; CS24 line 319–320 cites Bég80 2.2.1 | sound |
| §3.3 | = CS24 5.2.8–5.2.10 (line 2356–2383); `k[ε]`; `𝔽_p[ε]`, `α_p` | kernel `1 + kε`; `H⁰ = H¹ = 𝔽_pε → 0`: bijective only `i ≥ 2` | sound |
| §3.4 | = CS24 5.3.5, 5.3.7, 5.3.8 (lines 2444–2446, 2537–2541, 2560–2565); `ℤ_p`; `𝔽_p(s)`; `ℤ` odd `p` | `lim (ℤ/p^m)^×/pⁿ`, `−1` at `p = 2`; `Br[p] ≠ 0`, `H^{≥3} = 0`; `0 ≠ ℤ/p` | sound |
| §3.5 | = CS24 5.4.4–5.4.5 (lines 2816–2820, 2832–2833); identity; `I = π_0A`; `ℤ_(p)`; `ℤ_(p) → ℚ` | trivial; 0; `ℤ/p` both; `𝔽_p` vs `0`, `H²_{(p)} ≠ 0 = 0` | R02 (page) |
| §3.6 | = CS24 5.5.2–5.5.3 (lines 2893–2895, 2939–2942); fppf cover; `ℤ_(p) → ℤ_p` | fppf descent; recovers §3.5 | sound |
| §4.1 | `𝔽_p⟦x,y⟧`; `𝔽_p⟦x⟧/(x²)`; `xy` | `H⁰_𝔪 = H¹_𝔪 = 0`; `x` killed by `𝔪`; `(xy)^p = x^py^p = 0`, `𝔪·xy = 0`, `xy ∉ I` (every monomial of `I` divisible by `x², y², xz, yt`) | sound |
| §4.2 | = CS24 4.1.11 (line 1605–1610); `m = 0`; `(x², xy)` | identity; `xA/(x²,xy) ≅ k` not free over `k⟦y⟧` | sound |
| §4.3 | = CS24 4.1.12 (line 1636–1642) minus `n < dim R`; `R′ = R`; `k⟦t⟧ → k⟦t^{1/p}⟧` | the proof (line 1643–1650) uses only the descent spectral sequence; Thm 6.2.7's proof (line 3576–3580) applies it at `n = d`: correction confirmed | sound |
| §4.4 | = CS24 4.1.13 (line 1651–1653); `A_1` char `p ≠ 2` | `B′ = A/(g)` is CI and finite over `R`, so parameters of `R` are `B′`-regular, hence `R_∞`-regular; `W(R_∞)/p = R_∞`; `Pic(U)[2] = ℤ/2 ⇒ H²_𝔪(μ_2) ≠ 0` | sound |
| §5.2 | = CS24 4.2.4–4.2.5 (line 1701–1710); `𝒪_C` | torsor has a `C`-point, extends by properness | sound |
| §5.3 | = CS24 4.2.6–4.2.7 (line 1717–1748) | `A_inf/ξⁿ` iterated extension of `A′`; `p`-torsion-freeness of `W(A′^♭)` | sound |
| §5.4 | = CS24 4.2.8 (line 1764–1767); `⊕R_i`; `R/J` | not onto `∏`; `∏ R_i/J_i` | sound |
| §5.5 | = CS24 4.2.9 (line 1768); `I = ∅`; `μ_{pⁿ}` | zero ring; `∏ A_inf(A_i)/pⁿ` | sound |
| §5.6 | Kat73 4.1.1 (line 2310–2313) field case; `F = φ`, `cφ`, `tφ` on `𝔽_3(t)^{perf}` | `𝔽_p`; `x^{p−1} = c⁻¹`; `x² = 1/t` needs `v(x) = −1/2 ∉ ℤ[1/3]`; `ξx − x^p = c` solvable over `K = K̄` | sound |
| §5.7 | = CS24 4.2.10 (line 1778–1791, rank ≤ 1), 2.2.4 (line 774–777); `𝒪_C`, `a = p`; `μ_p`; infinite `I` | `H^j(C) = 0`; `μ_p(K_i) = ℤ/p` or `0` by characteristic; components `βI`; char-`p` factors perfect, mixed-char `A_i[1/p]` perfectoid field | sound |
| §5.8 | = CS24 5.5.1 (line 2849–2852); `ℤ_p⟨t⟩` | `(A/p)_red = 𝔽_p[t]` not perfect | sound |
| §5.9, §5.10 | = CS24 6.1.1 (line 3430), 6.1.2 (line 3459–3462); `d = 0`; tower | `ξ, ã` regular as `A_inf/ξ = A`; `H⁰(𝔽_p, ℤ/p) = ℤ/p`; `𝒪_C`: `RΓ_𝔪 = 0` | sound |
| §6.1 | = CS24 6.2.2 (line 3480–3483); `ℚ_p/ℤ_p` | classical completion `0`, derived `ℤ_p[1]` | sound |
| §6.2 | = CS24 6.2.3 (line 3491–3498), footnote 25 (line 3542–3546); regular dim 2; `W(k)⟦x,y⟧/(p − xy)` | `i < 2` | sound |
| §6.3, §6.4 | = CS24 6.2.4 (line 3540–3541), 6.2.6 (line 3562–3564); `(x,y)²` | `vdim −1`, `U = ∅`, `H⁰_𝔪(ℤ/p) = ℤ/p` | sound |
| §6.5 | = CS24 6.2.7 (line 3566–3568, "not a field"); DVR `μ_p`; field; `α_p`; regular tower | `H⁰_𝔪 = H¹_𝔪 = 0` by integral closedness, `H²_𝔪 ⊇ ℤ/p`; `ℤ/n(K)`, `K^×/K^{×p}`; `H²_𝔪(α_p) = ker(F)` on basis `x^{−a}y^{−b}`, injective; `V` divides negative exponents by `p`, no fixed vector | sound |
| §7.1 | = CS24 7.1.2 (line 3630–3636) with `max(d−1,1)`; `Spec k ⊔ Spec k`, `d = 1`; `𝔾_m`, `Z = {1}`, `c = 1` | `(ℤ/2)² → ℤ/2` not injective (source error, confirmed); `ℤ/p·[t] ↪ (ℤ/p)²` injective not onto | sound |
| §7.2 | CS24 line 3684–3686; `Rⁿ`; `(x,y)` on `A_1`; DVR; `M = 0` | `Hom(j_*𝒪_Y, j_*𝒪_Y) ≅ (j_*𝒪_Y)^{⊕r}` is exactly what Aus62 1.3 is invoked for; reflexivity is automatic for `r ≥ 1` (`Hom(M,M) = (M ⊗ M^*)^*`) | sound (Aus62 uncertified) |
| §7.3 | = CS24 7.1.3 (line 3664–3668); `ℤ/n`; `α_p`; `μ_2` on `A_1` | purity; extends; `ℂ⟦x,y⟧` over `U_{A_1}` does not extend | sound |
| §7.4 | SGA2 XI 3.13(i) (line 3755); DVR; `A_1` | `xz = y²`; stably free of rank one is free | sound |
| §7.5 | EGA IV₄ 21.13.7–9 (line 13005–13024), 21.13.12.1 (line 13184–13192, zero-dimensional closed fibre), SGA2 XI 3.6–3.7 (line 3636–3653); DVR; `A_1`; node | `Γ(U) = K`; `Cl = ℤ/2`; `(x,z)` nontrivial | sound |
| §7.6 | SGA2 XI 3.13(ii) (line 3757); node; `k⟦x_1..x_5⟧/(x_1x_2 − x_3x_4)` | not parafactorial; parafactorial with `Cl = ℤ` | sound |
| §7.7 | see declaration table; CS24 7.2.4 (line 3758–3763) | elliptic cone: infinite torsion in dim 2 | sound |
| §7.8 | = CS24 7.2.2 (line 3727–3732); `n = 3`; `n = 2` | units of `R` are squares (`σ(v) = −v` forces `v(0) = 0`); Veronese cone; `A_1` | sound |
| §7.9 | = CS24 7.2.3 (line 3737–3739), SGA2 XII 3.7 (line 4319–4321); quadric; plane cubic | `ℤ²/ℤ`; infinite torsion | sound |
| §7.10 | Gro66 1.4, 1.8 (line 129–133, 161–163, pp. 292–293), C19 3.2 (line 248–251); DVR; `𝔸²_ℂ`; field | `Br(R) ↪ Br(K)`; torsion; `H^i(K,𝔾_m)` torsion | sound |
| §7.11 | dJ02 (line 8–11): ample ⇒ quasi-compact separated; field; punctured `k⟦x,y,z⟧`; Segre cone | classical; quasi-affine; nontorsion excluded | sound |
| §7.12 | `k⟦x,y⟧`; syzygy on `k⟦x,y,z⟧`; `A_1` | `j_*E` reflexive of depth 2 = dim ⇒ free; not free; `(x,y)` | sound |
| §7.13, §7.14 | = CS24 7.2.5 (line 3765–3767), 7.2.6 (line 3780–3785) | `Br(W(k)⟦x,y,z⟧) = Br(k)`; `S^{sh}⟦x,y⟧/(xy)` CI of dim 3; Segre: dim 4, nontorsion only | sound |
| §7.15 | `μ_n`, `𝔾_m`, `𝔾_a`; norm torus; `α_p` | `D(ℤ/n)`, `D(ℤ)`; no characters; `ℤ_sign`; dual `α_p` not étale | sound |
| §7.16, §7.17 | = CS24 7.2.8 (line 3828–3845), 7.2.9 (line 3871–3878); regular dim 2; node, `d = 3` | `Br(R) ≅ Br(U_R)`; `H¹(R) = 0`, `Pic(U) = ℤ`; `H^i_Z` torsion via `H^{≥1}(X,𝔾_m) = 0` and §7.16(a) | sound |
| §8.1 | C19 5.3 (line 464–465); `k⟦x,y⟧`; `W(k̄)⟦x,y,z⟧` | `H²(R, μ_n) ↪ Br(R)[n] = 0`; `H³_𝔪 = 0` for `d ≥ 3` | sound |
| §8.2 | C19 2.1–2.4 (line 111–182), A.1 (line 568–570), A.2; `R′ = R`; fields; `R′ ⊗ R′` | Prop 2.2's proof (line 136–146) controls only the fibre over the trivial class for noncommutative `G` (the twisted `^P X` lives over `V`, not `R`): correction confirmed; `𝔽_q`, `ℂ((t))`, `ℚ_p^{unr}` yes, `ℝ` no; C19 line 182 | sound |
| §8.3 | C19 1.4 (line 87–89); `ℤ_p⟦x⟧`; `ℝ⟦x,y⟧` | `H²(U) = Br(𝔽_p) = 0`; `H¹(ℝ,T) = ℝ^×/ℝ_{>0} = ℤ/2` | sound |
| §8.4 | ILO XVIII-A Lemma 2.2 (line 16269); closed point; Dedekind; `𝔸¹` | excision; localization; codim-1 set not closed | sound |
| §8.5–8.7 | C19 6.1 (line 493–496), 1.1 (line 30–32); dim 2 strictly henselian; `V(x) ⊂ 𝔸²`; `𝔸²_ℂ ∖ 0` | `H^q_𝔪(𝔾_m) = 0`, `q ≤ 3`, from `Γ`-iso, `Pic(U) = 0`, `H²(U) = 0`, `H^{≥1}(R) = 0`; `H¹_Z = ℤ`; `Br′` unchanged | sound |
| §8.8–8.10 | C19 6.2 (line 520–526), 1.2 (line 45–46); `𝔾_m^r`; `ℙ¹_ℝ`; `Res 𝔾_m`; `Spec ℤ` | Shapiro; fails; holds; `⋂_p Br(ℤ_(p)) = 0` by the sum formula | sound |
| §8.11 | CTS87 Def 1.2 (line 378–382, p. 157), Thm 2.2(ii) (line 505–513, p. 161); `ℤ_sign` | `Ext¹(ℤ_sign, ℤ) = H¹(ℤ/2, ℤ_sign) = ℤ/2`; `Ext¹(ℤ_sign, ℤ[G]) = 0` | sound |
| §8.12 | C19 6.3 (line 545–550), CTS87 Lemma 2.4 (line 605, p. 164) | `H¹(ℝ,T) = ℤ/2`; over `ℂ` the class dies | sound |
| §8.13 | Poo17 6.8.1 proof (line 8105–8112, p. 196), 6.8.2 (line 8125–8128); `ℚ_p`; imperfect `k((t))`; `Br(ℚ) → Br(ℚ_p)` | `Br(K^{unr}) = 0`; `Br[p] ≠ 0`; (b) via `H³_𝔪` excision (Tor-vanishing by flatness of `𝒪̂`) | sound |
| §8.14, §8.15 | C19 6.4 (line 551–554); `ℤ_p`; `ℂ⟦t⟧`; `ℝ⟦t⟧`; `𝔽_q⟦t⟧` | `∂` iso; `0`; `ℤ/2 → (ℤ/2)² → ℤ/2`; `(L/K, Frob_q^{±1}, t)` residues `±χ`, inverse classes; AGD §R02.2.4 exists (#858 line 1444) | sound |
| §8.16, §8.17 | C19 (6.4.4) and footnote 5 (line 557–562), Poo17 6.8.3 (line 8139–8146, p. 197), EGA II 7.1.7 (line 5519); `Spec ℤ`; `ℤ_p⟦x⟧` | README's caveat is C19's (weaker than Poonen's), justified by C19 Thm 1.2 which has none; `𝔽_p((x))` imperfect, `(x)` has residue `ℚ_p` | sound |
| §8.18 | cyclic algebra, residue along `x = 0`; `n = 1` | Kummer class of `y` in `ℂ(y)^×/n`, nonzero; trivial | sound (DF84 uncertified) |
| Worked ex. 1–5 | node; `vdim 1` ring; `ℤ_p⟦x⟧`; `𝒪_C`; quaternions over `ℚ` | as in the rows above; `(−1,−1)_ℚ` has residue `1/2` at 2 only | sound |

## Not verifiable

- The `#check @name` elaboration audit and the claim that `HasSheafify (Scheme.fppfTopology.over (Spec R)) AddCommGrpCat.{u}` fails to synthesize at the pin: this pass may run no Lean. The signatures were compared by hand (no `variable` block; all binders explicit) and the universe constraint of `cohomologyPresheaf` was read at SheafCohomology/Basic.lean lines 70–90, which is consistent with the docstring.
- Uncertified sources cited by locator only (Aus62 Theorem 1.3, Avr77 Proposition 3.6, Gro68 Brauer III 6.1 b) and 2.1, MB85 Lemme 2, Bou78 IV 5.1 and V 4.9, Gab04b Conjectures 2–3, BH 2.3.1, SGA 3 IX 1.1/2.11 and X 4.5, SGA 4 V 6.4 and VII 5.7, SGA 5 I (4.2.2), DF84 Remark 3): the statements were checked against the way CS24/C19 invoke them (CS24 lines 3684–3686, 3711, 3770–3772, 3785, 1363, 1371, 1379; C19 line 28), not against the texts.
- Published-numbering claims (ILO XVII Théorème 0.2 = arXiv 0.9; ALB23 Theorem 5.4 = arXiv 5.1.4): only the arXiv items were read (ILO line 12220, ALB23 line 3145).
- CS24 line 1453 "vdim(R_d)": the extraction may be an OCR artefact; the package's reading as a misprint for `vdim(R)` is consistent with the proof but not certain.
- The π₁ clauses of CS24 3.3.1 and the global Picard statement (Cor. 7.2.3) could not be re-probed in Lean; their absence from Mathlib at the pin was checked by grep only (no Galois-category file under AlgebraicGeometry; no graded quotient instance).

## Source issues

- **Error** in CS24 at Theorem 7.1.2, printed page 87: the regular alternative allows local rings of dimension `d − 1 = 0`, i.e. fields, when `d = 1`, and then `H^0(X, G) → H^0(X ∖ Z, G)` need not be injective (`X = Spec k ⊔ Spec k`, `Z` one point); it should read "regular of dimension `≥ max(d − 1, 1)`" (the proof uses Theorem 6.2.7, which excludes fields); affects a stated result (already recorded by the package).
- **Gap** in CS24 at proof of Theorem 6.2.7, printed page 85: it applies Lemma 4.1.12 with `n = dim R` although the lemma assumes `n < dim R`; it should either drop that hypothesis from the lemma (its proof never uses it) or cite the lemma's proof; affects the proof (already recorded by the package).
- **Misprint** in CS24 at proof of Theorem 6.2.7, printed page 85: `f ∈ (p, x_1, …, x_n)²` names an undefined `n`; it should be `(p, x_1, …, x_d)²`; affects nothing.
- **Misprint** in CS24 at proofs of Theorems 7.2.1 and 7.2.5, printed pages 89 and 90: "for some `n ≥ 0`" and "for `n ≥ 0`" include `n = 0`, for which `μ_0` and `Br[0]` are meaningless; it should be `n ≥ 1`; affects nothing.
- **Misprint** in CS24 at proof of Theorem 3.3.1(b), printed page 35: "`vdim(R_d) ≥ 3`" names an undefined ring; it should be `vdim(R) ≥ 3`; affects nothing (OCR-uncertain, see above).
- **Gap** in C19 at Proposition 2.2, printed page 4: for a noncommutative smooth affine `G` the argument controls only the fibre of `H^1(V, G) → H^1(V_{R′}, G)` over the trivial class (twisting by a torsor over `V` destroys hypotheses (1)–(2), which are over `R`); it should assume `G` commutative or state triviality of that fibre; affects the proof only (both uses, Proposition 2.3 and Corollary 2.4, have commutative `G`; already recorded by the package).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "84e8f65", "job": "RT-PurityForFlatCohomology~1b", "model": "fable", "worker": "fable-rt215"} -->
