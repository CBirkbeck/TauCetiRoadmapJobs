# PORT-ProetaleCohomologyOfPAdicCurvesAndTowers

- Branch: `roadmap/proetale-cohomology-of-p-adic-curves-and-towers`, from main `45f58db`.
- Head commit: `41dab207` (*ProetaleCohomologyOfPAdicCurvesAndTowers: roadmap (README, Suggested.lean, metadata)*), which adds only `TauCetiRoadmap/ProetaleCohomologyOfPAdicCurvesAndTowers/{README.md,Suggested.lean,metadata.toml}`.
- Build: `lake build TauCetiRoadmap.ProetaleCohomologyOfPAdicCurvesAndTowers.Suggested` ends with `Build completed successfully (18336 jobs).` It gives **1 warning**: `Suggested.lean:121:8: declaration uses 'sorry'`, on `generalizedSteinberg_isIrreducible`. The file now starts with `module`. That clears the Lake warning the package file triggered (`imports 'Mathlib' … consider adding 'module'`).
- Gate: `gate ProetaleCohomologyOfPAdicCurvesAndTowers: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Dependency check (`gate --depcheck … --movable`): `depcheck: 225 roadmaps, 2008 edges, 0 problem(s)`. There are no UPWARD, CYCLE or `moved:` lines.

## Which package was ported

The brief points to `packages/ProetaleCohomologyOfPAdicCurvesAndTowers/` in this worker's board checkout. That copy is the **original submission** (`fc09883b`; README 912 lines, Lean file with `flagSubspace`). Its `review.json` is the round-2 review (`needs_changes`, 15 blocking).

Package reviews ran up to round 7 (`reports/REV-PKG-…~7.md`), and the repairs up to round 8. Those repairs live only on the board's package pull request. The round-8 repair is commit `db295a02` (`FIX-PKG-…~8: … 4 of 4 findings applied`), with a README of 1013 lines. It answers every finding of rounds 2–7, including the round-7 review's four. **I ported `db295a02`**, read from the round-8 fixer's board checkout (read-only).

Porting the board's main copy would have reintroduced every finding repaired since round 2. I found no record of a review accepting round 8. The worker should confirm that `db295a02` is the version meant for porting.

## Draft pull request body

This pull request adds the roadmap *Pro-étale cohomology of p-adic curves, Drinfeld half-spaces and the rank-two Drinfeld tower*, which builds the p-adic pro-étale cohomology of smooth p-adic analytic curves, of semistable Stein spaces in every dimension, of the Drinfeld half-spaces `Ω^d` and of the rank-two Drinfeld tower over an arbitrary finite extension `F/ℚ_p`. From the semistable geometry of curves (skeleta, triangulations and their patterns of shorts, legs and ghost circles), log rigid Hyodo–Kato and crystalline cohomology, the local Fontaine–Messing comparison, `A_inf`-cohomology and the Lubin–Tate and Drinfeld towers of the supplier roadmaps, it proves the fundamental diagrams relating `H¹_proét(Y, ℚ_p(1))` of affinoid, overconvergent, Stein and proper curves to de Rham and Hyodo–Kato cohomology, the symbol description of `H¹_ét(Y, ℤ_ℓ(1))` for every `ℓ`, the combinatorial filtrations and the similarity of ℓ-adic and Hyodo–Kato Weil–Deligne actions, the Jacobian period isomorphism, the `G_K`-equivariant diagram of a semistable Stein space, the cohomology of `Ω^d` in every coefficient theory as duals of generalized Steinberg representations (including integral p-adic étale cohomology and Dat's compactly supported ℓ-adic complex), and, for the rank-two Drinfeld tower, equivariant semistable models, Hyodo–Kato and de Rham multiplicities, the multiplicity form of the fundamental diagram, the finite copresentation of mod `p^k` cohomology and its non-admissibility for `F ≠ ℚ_p`. These are the geometric inputs that the p-adic local Langlands roadmaps (PadicLocalLanglandsForGL2QpPartII, ScholzeFunctorAndModpCohomologyOfTheLubinTateTower) and Thorne's level-raising route read off the towers, proved here once for every `F` rather than re-derived at `F = ℚ_p`. `Suggested.lean` states the one headline statable at the pins, the irreducibility of the generalized Steinberg representations `Sp_J(A)` of `GL_{d+1}(K)` over coefficient fields of characteristic `0` or `p`, formed on Tau Ceti's standard parabolic subgroups `TauCeti.TitsSystem.standardParabolic` of `TauCeti.glTitsSystem`; its docstring lists the other headlines and the carriers they lack.

## Dependencies that are still pull requests

**Open pull requests**, all earlier in the merge order:
- ClassicalAdicEtaleCohomology
- CrystallineCohomology
- CohomologyComparisonsPartII
- AInfCohomology
- CohomologyComparisons
- CstConjectureForDaggerVarieties
- PrismaticCohomologyPartIII
- LocallyAnalyticDistributions
- PadicPeriodRings
- PadicHodgeTheory
- VectorBundlesAndIsocrystals
- PadicDifferentialEquationsAndRigidCohomology
- EndoscopicTransferAndUnitaryTraceComparison
- HilbertModularVarietiesAndShimuraCurves
- TropicalAndBerkovichArithmetic
- AbelianSchemesAndArithmeticModuli
- SmoothRepresentationsOfLocalGroups
- PadicLocalLanglandsForGL2Qp
- GL2AutomorphicRepresentationsAndTransfer
- FiniteFlatGroupsAndIntegralPadicHodgeTheory
- **ColemanIntegrationPartII** (new in this port, merge-order line 236)

**Neither on main nor an open pull request:**
- **ModpRepresentationsOfGL2OverLocalFields** (merge-order line 266, just before this roadmap at 267). It exists only as a board package. Its cited sections §§0.3–0.5, 0.7, 2.4 and 2.6 were checked there, and `roadmaps resolve` reports it as found nowhere.

**On main:**
- AdicEtaleGeometry
- AdicSpacesPartIII
- AdicSpacesPartIV
- EnhancedDerivedSheaves
- StableReduction
- JacobianChallenge
- ReductiveGroupsPartII

No cited id is dropped by an open pull request (`overlaps.md`: none). Nothing cited is defined only by an open revision.

## What moved from the Lean file to the README

The package's `Suggested.lean` held no padding: one headline, the definitions it needs, and two proved lemmas those definitions use. Nothing mathematical had to move.

The changes are supplier replacements:
- **`parabolic` and `parabolic_mono` are deleted** from both files. The pinned Tau Ceti already has the standard parabolic `P_J = B W_J B` of `GL_{d+1}(K)`:
  - `TauCeti.glTitsSystem` (`TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Diagonal/TitsSystem.lean:195`): upper triangular `B`, simple reflections the adjacent transpositions;
  - `TauCeti.TitsSystem.standardParabolic` (`TauCeti/GroupTheory/TitsSystem/Parabolic/Basic.lean:48`), with `standardParabolic_monotone` (line 80), `standardParabolic_empty` and `standardParabolic_univ`.
- The index of `steinbergRelations`, `steinbergRelations_le_comap`, `generalizedSteinberg` and `generalizedSteinberg_isIrreducible` is now `J : Set (glTitsSystem K d).simple`, in place of `Set (Fin d)`.
- The definitions carry `[Nontrivial Kˣ]`, which `glTitsSystem` requires. The theorem carries it too; it holds for every `K` of characteristic `0`, and both the docstring and the README say so.
- **README §0.3 is rewritten for this carrier:**
  - the `parabolic` API bullet is replaced by one on functoriality in `J`;
  - the three Checks on standard flags are replaced by three on the Tits-system parabolics: `d = 1`; rank zero; and the `d = 2` indexing dictionary (the README's `s_i` is Tau Ceti's index `i − 1`).
- **Conventions:** gains the 0-based/1-based dictionary with a witness.
- **§0.4(a):** names the Tits system.
- **Supplier contracts:** the Mathlib `Module.Basis.flag`/`Pi.basisFun`/stabilizer bullet is removed, and the Tau Ceti declarations are listed with file and line.

### `#check @name` comparison

I ran this mechanically: `scratch/sig/SigCheck.lean`, a copy of the module with `#check @…` appended, elaborated once with `lake env lean`. The elaborated types are:
- `translation (G) [Group G] [TopologicalSpace G] [IsTopologicalGroup G] (H) (A) [CommRing A] : Representation A G (LocallyConstant (G ⧸ H) A)`;
- `steinbergRelations (K) [Field K] [Nontrivial Kˣ] [TopologicalSpace K] [IsTopologicalRing K] (A) [CommRing A] (d) (J : Set ↑(glTitsSystem K d).simple) : Submodule A (LocallyConstant (GL (Fin (d + 1)) K ⧸ (glTitsSystem K d).standardParabolic J) A)`;
- `generalizedSteinberg` has the same binders and the quotient representation;
- `steinbergRelations_le_comap` has the same binders plus `g`;
- `generalizedSteinberg_isIrreducible ∀ (p) [Fact p.Prime] (K) [NontriviallyNormedField K] [NormedAlgebra ℚ_[p] K] [FiniteDimensional ℚ_[p] K] [Nontrivial Kˣ] (A) [Field A], CharZero A ∨ CharP A p → ∀ d (J), (generalizedSteinberg K A d J).IsIrreducible`.

No binder is dropped, and each type matches its README statement. The only change from the package signatures is the index type of `J` and the added `[Nontrivial Kˣ]`.

I also elaborated an `example` showing `(glTitsSystem K d).standardParabolic ∅ = upperTriangularGroup (Fin (d + 1)) K`. Every Tau Ceti and Mathlib name cited in the supplier contracts was `#check`ed, with one exception: `TauCeti.simple_GL2Steinberg`, whose module `CharacterTable/GL2/Boundary` has no built olean in the shared cache. It was confirmed by grep at `Boundary.lean:101`.

## Supplier replacements and duplication removals

Each item was checked by object at the pins, on main, and at the open heads (the 218 checkouts listed, plus `roadmaps show` for the suppliers not among them).

1. **Standard parabolics** → Tau Ceti `glTitsSystem` / `TitsSystem.standardParabolic` (above).
2. **§0.2, the compact-graph case of `N_µ` being an isomorphism.** For `L = ℚ` this is the harmonic decomposition `C¹ = Harm_ℓ ⊕ im d` of **ColemanIntegrationPartII §1.2** (finite graphs, loops and parallel edges, positive rational lengths, characteristic `0`), which is earlier in the merge order. §0.2 now imports it and tensors with `L`; the sign of its differential and its divergence over darts were checked against `∂`, `∂^*`. Added to Scope, supplier contracts, `*Needs:*` and Layer 0 Dependencies. The rest of §0.1–0.2 is kept, and Scope says how it differs: legs, locally finite infinite graphs, `H¹_c` and its dual.
3. **§6.7, `A_inf{i}`.** It was defined ad hoc as `μ^{−1}A_inf(1)`. It now cites the Breuil–Kisin twist of **AInfCohomology Layer AI.0:integral** (*Intrinsic Breuil–Kisin twist*), whose cyclotomic trivialization is that same formula. Added to Scope, contracts, `*Needs:*` and the Layer 6 Dependencies.
4. **§7.4 against PadicLocalLanglandsForGL2Qp §6.9(iii).** That roadmap states `H¹_dR(Σ_n)^ρ ≅ M_dR^* ⊗ π^*` for `GL₂(ℚ_p)` at large finite level with trivial central character, together with the `Π^an_ℒ` identification. Scope now records §7.4 as a kept variant, in one clause: every finite `F`, infinite level, every central character, and the Hyodo–Kato structure. No deletion: the base roadmap does not state the general case.
5. **Near misses recorded, not suppliers:**
   - `TauCeti.coind` (smooth coinduction: an additive subgroup with right translation and no `Representation`);
   - `SimpleGraph.FirstCohomology` (simple graphs: no loops, parallel edges or legs);
   - `TauCeti.AdicSpace` and Tau Ceti dagger algebras (no étale or pro-étale site or cohomology).
6. **Checked with no conflict:**
   - generalized Steinberg: SmoothRepresentationsOfLocalGroups owns the complex `St_G` and the Zelevinsky `L(Δ)`; CongruenceSpectralGap only cites them;
   - Schneider–Stuhler and Iovita–Spiess: no other owner;
   - Drinfeld half-space cohomology: HilbertModularVarietiesAndShimuraCurves owns only the model at `d = 1`, which is imported;
   - fundamental diagrams: CstConjectureForDaggerVarieties is imported and compared;
   - `X^r_st`: VectorBundlesAndIsocrystals has only the finite-dimensional example, which is imported;
   - Lubin–Tate components: no other owner; ScholzeFunctor imports §7.1;
   - Dat's complex: EndoscopicTransferAndUnitaryTraceComparison §12.12 is the tower compact-support complex of Dat's Lubin–Tate paper. It is a different object, cited for conventions;
   - syntomic regulators (PadicHodgeRegulators, ColemanIntegrationPartII): K-theory regulators, different objects;
   - cohomologically profinite sheaves, Jacobian universal covers, ℓ-adic/Hyodo–Kato similarity: no other owner.

No declaration of `Suggested.lean` shares a fully qualified name with a declaration in a roadmap I can read; all live in `TauCetiRoadmap.ProetaleCohomologyOfPAdicCurvesAndTowers`.

## Fixes from the upstream read-through

- **References:** the sentence pointing to `sources.toml` "in this folder" was false in the content repository, since the manifest is not ported. It now says that locators refer to the listed arXiv versions, the Numdam copies (DAT06, GK07) and the published GK05-RT.
- **Tau Ceti carriers:** the Lean docstring and the README said Tau Ceti has no rigid curves or dagger material. It has `TauCeti.AdicSpace` and dagger algebras. Both texts now say exactly what is missing: étale and pro-étale sites and cohomology, de Rham cohomology of rigid curves, Hyodo–Kato cohomology, `B_cris^+`/`B_st^+` and dagger spaces.
- **§7.5:** one "Check" only said that PadicLocalLanglandsForGL2QpPartII §4.1 consumes the diagram. That roadmap is a board package and later in the merge order, and the statement is not a test. The consumer note stays in Downstream consumers. It is replaced by a computed Check: `O_D^×` acts trivially on `M_0` and `JL(M)^{O_D^×} = 0` for supercuspidal `M`, so the level-zero `[M]`-part vanishes.
- **§7.7:** it had two Checks. I added a third, that finite presentation is not admissibility: consistency with §7.8(f) for `F ≠ ℚ_p`, and with CDN23 Théorème 4.1 for `F = ℚ_p`, `p > 2`.
- **Supplier contracts:** sections used in `*Needs:*` but missing from the contracts were added:
  - ClassicalAdicEtaleCohomology §1.4 (Kummer sequence), Layer 8 and §9.1;
  - PadicDifferentialEquationsAndRigidCohomology §§RD.4.34, RD.4.38;
  - SmoothRepresentationsOfLocalGroups SR.0d;
  - AdicSpacesPartIII Layer F0;
  - FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.2.20, R07.2.25–R07.2.26, R07.2.28, which had no contract at all.

  Each was checked at its head.
- **Headings:** the two generic supplier headings ("From the tower, half-plane and skeleton suppliers", "From the representation-theoretic suppliers") are renamed to the `From TauCetiRoadmap.<X>` form.
- **Timelessness:** "the relation is the standard one and is kept" (Conventions) and "the hypothesis in (c) is kept" (§6.10) are reworded.

Every other citation was checked at its current head: each roadmap, section heading and named subsection (e.g. CrystallineCohomology §CR.4.7 *Slope decomposition on the existing isocrystal carrier*, LocallyAnalyticDistributions §0.CR.6.6's four named targets, VectorBundlesAndIsocrystals Layer 5's three). The contracts of CohomologyComparisons §§4.5 and 4.9a, PadicHodgeTheory §0.6, AInfCohomology §AI.1.2 and CohomologyComparisonsPartII §4.4 were read and agree with what the README assumes of them.

## Adversarial mathematics pass

One row per statement. The values are recomputed here.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Lean `generalizedSteinberg_isIrreducible` | `d = 0`; `J = univ`; `d = 1, J = ∅`; `A` of char `ℓ ≠ p` | `d = 0`: `simple = range (Fin 0) = ∅`, `P_∅ = upperTriangularGroup (Fin 1) = GL₁`, `G ⧸ ⊤` a point, relations `⨆_∅ = ⊥`, `Sp = A`, simple. `J = univ`: `P = ⊤`, `Sp = A`. `d = 1, J = ∅`: `LC(ℙ¹(K), A)/A`, Steinberg. Char `ℓ` with `q ≡ −1 mod ℓ`: Steinberg reducible, excluded by `hA` | holds on all instances | binder `[Nontrivial Kˣ]` added for the Tau Ceti carrier (true: `−1 ≠ 1` in char `0`) |
| `standardParabolic` = README's `P_J` | `d = 1`: `[[a,b],[0,c]]`, `[[1,0],[1,1]]`; `d = 2`, `J = {k=0}` vs `{k=1}` | `e₀ ↦ ae₀ ∈ Ke₀`; `e₀ ↦ e₀+e₁ ∉ Ke₀`; `J={0}`: stabilizer of `Ke₀+Ke₁`, `X_J` = planes of `K³` = `𝓗`, `Sp_1 = LC(𝓗)/A` (matches §0.5 at `r=1`); `J={1}`: line `Ke₀`, `X = ℙ²(K)`, `Sp_{{2}}` | upper triangular `B`; indexing pinned | §0.3 Checks rewritten with these values |
| `translation` is a representation | `G = S₃`, `g=(12)`, `h=(23)`, `x = gh`, `f = 1_{e}` | `f(g⁻¹x)`: product and composite both `f(1) = 1`; `f(gx)`: product `f((gh)²) = 0`, composite `f(h²) = 1` | left action pinned | none |
| `steinbergRelations` stable, functorial in `J` | `J ⊂ J′`, `s ∉ J′` | `X_J → X_{J′∪{s}}` factors through `X_{J∪{s}}`, `s ∉ J` | relations map into relations; induced `Sp_{J′} → Sp_J` | new API bullet |
| §0.1 graph cohomology | loop; one vertex two legs; one leg; tree; `𝔽₂²` coefficients | loop `∂=0`, `H¹=H¹_c=L`; two legs `∂x = (−x,−x)`, `H¹_c = L²/diag ≅ L`, `H¹_c^* = {φ₁+φ₂=0}`, sequence `0→0→L→L²→L→0→0`; `|M₂(𝔽₂)| = 16` vs `|L| = 4` | as stated | none |
| §0.2 `N_µ` | loop length `µ`; segment with 2+2 legs; `ℓ=µ` harmonic | loop: `×µ`; segment: `H¹ = 0`, `rank H¹_c^* = 5 − 2 = 3`, `N_µ = 0`; dart divergence of `µφ` with weights `1/µ` = `∂^*φ` | iso for compact `Γ` = Coleman §1.2 at `k = ℚ` | compact case imported from ColemanIntegrationPartII |
| §0.3 congruence invariants | `d=1`, `K=ℚ_2` | `Γ(ϖ)`-orbits on `ℙ¹(K)` = fibres over `ℙ¹(𝔽_2)`, `3` orbits, rank `3−1 = 2 = q`; cocycle `g·f−f ∈ A` forced `0` (upper unipotent shifts the `[0:1]`-fibre, fixes the `[1:0]`-fibre to level `ϖ³`) | rank `q` | none |
| §0.5 presentation | `r=1,d=1`; `r=2,d=1`; `r=0` | three vectors in a 2-dim dual space dependent, `Sp_2 = 0`; `f(H,H) = 0` from cocycle at `H₀=H₁=H₂`; `r=0` constants | as stated | none |
| Conventions `Nφ = pφN` on `u` | `φ(u) = pu`, `N(u) = −1` | `N(φu) = −p`, `pφ(Nu) = −p` | consistent | none |
| Conventions WD group law | `Φ = diag(1, q)`, `Ne₁ = e₀`, `q = 2` | `NΦe₁ = 2e₀ = qΦNe₁`; `ΦNΦ⁻¹e₁ = ½e₀`; law `p^{−deg}` | consistent | wording only |
| §1.3 `X^r_st` | `C̆(−1)`, `C̆`, ordinary elliptic | `(B^+)^{φ=1} = ℚ_p`; `(B^+)^{φ=p} → C`, kernel `ℚ_p t`; Dimension `(1,1)+(0,1) = (1,2)` | as stated | none |
| §1.4 scaling | `e = 2`, `N_raw e₁ = 2e₀` | `D_p(e₁+ue₀) = 0`; `A₂ ↦ e₁+2ue₀`, `D_raw = 0`; wrong `e₁+4ue₀` gives `D_p = −3e₀`; `D_raw A_e = eA_e D_p` on `f(u)⊗m`: both `f(eu)⊗N_raw m − ef′(eu)⊗m` | as stated | none |
| §1.4 unit factor and sign | `p=3`, `ϖ=12`, `a=4` | `log_3 4 = 3 − 9/2 + 9 − …`, `v_3 = 1`; `ι_ϖ(eu−ℓ_a) = ι_p(u) − log_K a`; `ι^{(p)}` via `ϖ=12` equals `ι^3`; wrong sign gives `ι^3(e₁ + 2log_3 4·e₀)` | as stated | none |
| §1.4 independence | `ϖ → ϖw` | `log a′ = log a + e log w`; `exp(e log w N_p)exp(−log a′ N_p) = exp(−log a N_p)` | independent | none |
| §2.3 non-separated comparison | `ω = Σ p^n T^{p^n−1}dT` on the annulus | coefficients `p^n → 0`; primitive needs `a_{p^n} = 1` (diverges on `|T|=1`); partial sums exact | `[ω] ≠ 0`, `0` in `H¹_dR^sep` | none |
| §3.3 signs of `Cone(1−φ/p)[−1]` | Mathlib cone and shift; closed disc, `f = 1+pT` | `Syn^n = A^n ⊕ B^{n−1}`, `d(x,y) = (dx, −(1−φ/p)x − dy)`; `dy = (φ/p)x − x` gives `0`; other sign leaves constant term `2p` | as stated | none |
| §3.3 `H⁰_syn` at `p = 2` | `t/2` | `t ∈ F¹`, `t^{p−1} = t ∈ pA_cris`, `φ(t/2) = 2·(t/2)` | lattice contains `t/2` | none |
| §4.6 similarity | `y² + y = x³` over `𝔽₂` | points `(0,0),(0,1),∞`: `#E = 3`, `a = 0`; untwisted `X²+2`, twisted `X²+½` | twist needed on both sides | none |
| §4.7 proper diagram | ordinary, supersingular, `g = 0` | `Σ(1−r_i,1)`: `(1,2)` both; `H¹(O)`: `(1,0)`; kernel `(0,2) = V_p` | as stated | none |
| §4.8 good-reduction comparison | `E₀: y² = x³ − x`, `p = 5` | discriminant `−16·4·(−1)³ = 64`, unit at `5` | example valid | none |
| §5.1 chain model of `𝔸¹` | node `C_m ∩ C_{m+1}` | `X₁X₂ = ϖ^{m+1}T·ϖ^{−m}T^{−1} = ϖ`; both in `[|ϖ|,1]` on the annulus | semistable | none |
| §5.3 lattice | `p = 2, r = 2` | `a = 2`, `p^a a! = 8` | `(1/8)ℤ_2(2)` | none |
| §5.4 point | `Spf O_K`, `r = 1` | `θ: (B_cris^+)^{φ=p} → C`, kernel `ℚ_p t`: `H⁰ = ℚ_p(1)`, `H¹ = 0`; `u` has `φu = pu`, `θι_ϖ(u) = 0` | `N = 0` needed | none |
| §6.1 model | `d = 2` | `#ℙ²(𝔽_q) = q²+q+1` points blown up | as stated | none |
| §6.3 `N = 0` | `H^s`, `φ^f = q^s` | `Nφ^f = qφ^f N` gives `q^s N = q^{s+1} N`, so `N = 0` | as stated | none |
| §6.7 non-semistable model | `y² = x³ + p`, `p ≥ 5` | singular point needs `2y = 3x² = 0`, so `x = y = 0`, so `p = 0` | smooth generic fibre, cusp special fibre | none |
| §6.8 three-point relation | `ω_{01}+ω_{12}−ω_{02}` | residues `(1,−1,0)+(0,1,−1)−(1,0,−1) = 0` | not free | none |
| §6.10 Dat | `d = 1` | `H¹_c = π_∅ = St`, `H²_c = π_Δ(−1) = Λ(−1)` | as stated | wording only |
| Layer 7 level dictionary | `q = 2` | `|(O_D/ϖ)^×| = (q²−1)q² = 12`, `|𝔽_4^×| = 3`, `|Ǧ_1/Ǧ_2| = 4` | `M_1 ≠ M_{Dr,1}` | none |
| Layer 7 absolute irreducibility | `φe₁ = e₂`, `φe₂ = pe₁` | char poly `X² − p`, irreducible over `ℚ_p`, splits over `ℚ_p(√p)` | negative control valid | none |
| §7.1 central test | `F = ℚ_3`, `(3I₂, 3)` | `det = 9`, `Nrd = 9`, translation `9·9⁻¹ = 1`; unsigned `81` | `Nrd^{−1}` | none |
| §7.5 level zero | `M_0`, supercuspidal `M` | `JL(M)^{O_D^×}` is `Ǧ`-stable, so it is `0` or all; all would make `dim JL(M) = 1` | `[M]`-part `0` at level `0` | new Check replacing a consumer note |
| §7.7 finite copresentation vs admissibility | `F ≠ ℚ_p, n > 0` vs `F = ℚ_p, p > 2` | §7.8(f): not admissible; CDN23 Th. 4.1: admissible of finite length | independent conditions | new Check |

The two worked examples recomputed in Layer 0 also hold:
- `ℚ_2` tree valency `3`, invariants rank `2`;
- Tate curve `v_2(q) = 3`, `N_µ = 3` on `L`.

## Unresolved

- **Source version** (above): the worker should confirm that the round-8 repair `db295a02` is the accepted package. The board's `review.json` is from round 2.
- **ModpRepresentationsOfGL2OverLocalFields** is cited for §§0.3–0.5, 0.7, 2.4, 2.6. It is earlier in the merge order but neither on main nor an open pull request, and its section numbers were checked only in the board package.
- **Consumer direction**, carried over from the round-8 repair report. ModularityAndLanglandsExtensionsPartII asks CompletedCohomologyAndLocalGlobalCompatibility §0.7 (gap `drinfeld-steinberg-detection`) for Thorne inputs that rest on §6.10 here. CompletedCohomologyAndLocalGlobalCompatibility is earlier in the merge order than this roadmap, so that request points upward. It is outside this folder; Downstream consumers here names only ModularityAndLanglandsExtensionsPartII.
- **Ownership against open pull requests** was checked against the 218 checkouts listed in the brief and, for the suppliers outside that list, their heads via `roadmaps show`. The roughly 230 other open pull requests were not searched file by file. The `roadmaps grep` tool timed out on full-text patterns; local greps over the listed checkouts, main and the supplier heads were used instead.
- **Suspicious passages:** none found in the package, reviews or supplier texts.


Pull request: #2287 (roadmap/proetale-cohomology-of-p-adic-curves-and-towers at 41dab20)
