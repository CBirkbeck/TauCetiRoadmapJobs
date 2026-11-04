<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1073#issuecomment-6400906700 -->
Red team round 2 pass b (claude) of 108b271

Verdict: needs changes

1. **F01** (P2) the stable configuration diagonal is statable at the pins and absent

   **Location.** `packages/AlgebraicTopologyPartII/Suggested.lean:13–15` ("Arrangement purity, the compact-support form of the configuration trace formula, configuration multiplicities and the stable diagonal lack the étale/compact-support configuration cohomology representation"); README:3 ("The endpoints here are the stable configuration diagonal and double-loop Betti identity"); README:512 (§3.5).

   **Claim.** §3.5, one of the two named endpoints of the configuration strand, cannot be stated against the pins.

   **Witness.** The statement of §3.5 is topological: it concerns H_c^*(PConf_m(ℂ),ℚ) with its S_m-action, and ℚ-coefficients. The roadmap's own convention (README:417, "Reindex compact degree a=m+i only after duality") converts compact degree b to ordinary degree 2m−b by Poincaré duality on the complex manifold PConf_m(ℂ); the S_m-action is holomorphic, so the duality is equivariant, and T=V^{⊗m}⊗sgn^{ε_n} is self-dual, so dim((H_c^{b}⊗T)^{S_m})=dim((H^{2m−b}⊗T)^{S_m}). With b=mn−m−j the ordinary degree is j−m(n−3). The invariants' dimension is the character average (1/m!)∑_σ N^{c(σ)}sgn(σ)^{ε_n}Tr(σ|H^{j−m(n−3)}), which is exactly the carrier already used by `configurationTraceFormula` (`Suggested.lean:63–78`: `TopCat.singularCohomology`, `configurationPermutation`, `LinearMap.trace`, `Equiv.Perm.fullCycleType`), plus `Equiv.Perm.sign` and `doubleLoopFactor`. The étale representation and the compact-support groups are the proof route (§§2.4, 3.3–3.4), not the statement. Instances of the ordinary form against the product: (n,N,j,d)=(4,1,1,1): m=0 gives H¹(pt)=0, m=1 gives 1·Tr(id|H⁰(ℂ))·1=1, sum 1; coefficient of t in (1+t) is 1. (4,2,2,2): m=1 gives H¹(ℂ)=0; m=2 gives (1/2)[2²·1·1 + 2¹·(−1)·1]=1 (swap acts trivially on H⁰ and sgn^{ε₄}=sgn); coefficient of t² in (1+t)²(1+t³) is 1. (5,1,2,1): m=1, ε₅=0, H⁰(ℂ): 1; coefficient of t² in (1−t²)⁻¹(1+t⁵) is 1.

   **Repair.** Add to `Suggested.lean` after `doubleLoopBetti` (n=s+4, n−3=s+1, ε_n=(s+5) mod 2), and add the ordinary-degree form (degree j−m(n−3) after duality) as a sentence of README §3.5 naming the theorem:

   ```lean
   /-- The stable configuration diagonal in ordinary cohomology (BS Corollary 7.5 after Poincaré
   duality on PConf_m(ℂ)): for n = s+4 and d(n−3) ≥ j, the sum over m ≤ d of the multiplicities of
   V^{⊗m}⊗sgn^{ε_n} in H^{j−m(n−3)}(PConf_m(ℂ),ℚ) is the degree-j coefficient of the double-loop
   product. All cohomology groups are finite dimensional. -/
   theorem stableConfigurationDiagonal (s N j d : ℕ) (hd : j ≤ d * (s + 1)) :
       (∀ m a : ℕ, FiniteDimensional ℚ
         ((TopCat.of (orderedConfiguration m)).singularCohomology
           (ModuleCat.of ℚ ℚ) ℚ (ModuleCat.of ℚ ℚ) a)) ∧
       (∑ m ∈ Finset.range (d + 1),
         if m * (s + 1) ≤ j then
           (m.factorial : ℚ)⁻¹ * ∑ σ : Equiv.Perm (Fin m),
             (N : ℚ) ^ σ.fullCycleType.card * ((Equiv.Perm.sign σ : ℤ) : ℚ) ^ ((s + 5) % 2) *
               LinearMap.trace ℚ _
                 (TopCat.singularCohomologyMap (R := ModuleCat.of ℚ ℚ) (k := ℚ)
                   (M := ModuleCat.of ℚ ℚ) (TopCat.ofHom (configurationPermutation m σ⁻¹))
                   (j - m * (s + 1))).hom
         else 0) =
       PowerSeries.coeff j
         (∏ r ∈ Finset.range j, doubleLoopFactor (s + 4) N (r + 1) (by omega) (by omega)) := by
     sorry
   ```

   Then shorten the module docstring's first bullet to the parts that are genuinely not statable (arrangement purity over 𝔽̄_q and the compact-support forms of §§2.4, 3.4), and list `stableConfigurationDiagonal` in README §3.5 and in the Layer 3 dependencies. Tested on the three instances above (1=1 in each); the truncated subtraction is guarded by the `if`, and for m(n−3)>j the term is zero on both sides. Not built here (see below): the repair worker must elaborate it.

2. **F02** (P3) `phamStrongRetraction` carries an unnecessary `2 ≤ n`

   **Location.** `packages/AlgebraicTopologyPartII/Suggested.lean:184` (`(hn : 2 ≤ n)`); README:708 ("For n≥2").

   **Claim.** The retraction theorem needs n≥2.

   **Witness.** At n=0 the fibre `{z : Fin 0 → ℂ // ∑ i, z i ^ k i = 1}` is empty (the empty sum is 0), so `r`, the relative homotopy and the equivariance clause exist trivially. At n=1, X={z : z^{k}=1}=μ_k and S=X (every z^{k}=1 is real and nonnegative), so r=id, H constant, equivariance holds. PHAM line 118–122 works in n+1≥1 variables without a lower bound. Pham's construction (hyperplane ∑u_i=1 retracted onto the simplex, lifted through u_i=z_i^{k_i} with principal roots of ratios that avoid the negative axis) does not use n≥2.

   **Repair.** Delete `(hn : 2 ≤ n)` from `phamStrongRetraction` and write "For n≥0" at README:708 for the retraction sentence, keeping n≥2 only for the bouquet count where §5.2 needs two factors. Tested at n=1, k=(3): X=S=μ₃, r=id.

3. **F03** (P3) the n≥2 restriction of `tameFibreBouquet` is attributed to the source, which does not state it

   **Location.** README:578 ("the headline retains the source's n≥2 range for connected fibres"); `packages/AlgebraicTopologyPartII/Suggested.lean:127` (`(hn : 2 ≤ n)`).

   **Claim.** Broughton's Theorem 1.2 is stated for at least two variables.

   **Witness.** BROUGHTON line 115–117 states Theorem 1.2 for a tame F:ℂ^{n+1}→ℂ and every c, with no lower bound on n; lines 46, 71, 93 carry no standing assumption. The Lean statement is true at n=1 with the native carrier: `sphereBouquet 0 N x` is N+1 points, and for f of degree k with s distinct roots of f−a one has μ=k−1, μᵃ=k−s, so N+1=s, the number of points of the fibre. It is false at n=0 (junk `n−1=0`: for constant f≠a the fibre is empty while the bouquet of one S⁰ has two points), so the correct bound is n≥1.

   **Repair.** Either weaken `hn` to `1 ≤ n` (and README:561, :578 to n≥1, with the n=1 instance f=z^k, a≠0: k points, as a Check), or keep n≥2 and replace the clause at :578 by "the headline restricts to n≥2, where the fibres are connected; the source's statement has no such bound". Tested at n=1, f=z³, a=1: three points on both sides; at n=1, f=z³, a=0: μ=2, μ⁰=2, one point on both sides.

Round 2. Every round-1 finding was re-checked at this head first (table below), then the full pass was run again over the whole of `packages/AlgebraicTopologyPartII/README.md` (1537 lines) and `packages/AlgebraicTopologyPartII/Suggested.lean` (196 lines), with fresh attention to statability of the headline endpoints, gap minimality against the suppliers' current text, ownership against the board package that consumes Layers 6–16, and the sign, parity and degree conventions. One new P2 and two P3 findings; no round-1 finding is re-raised.

## Round-1 findings at this head

| Id | Severity | Status at 108b271 | Witness |
|---|---|---|---|
| a-F01 | P2 | repaired | `Suggested.lean:184–194` `phamStrongRetraction`: native fibre/skeleton subtypes, `r.comp (phamInclusion k) = id`, `ContinuousMap.HomotopyRel … (Set.range (phamInclusion k))`, coordinatewise root-of-unity equivariance; README:710 names it. `HomotopyRel` is `Mathlib/Topology/Homotopy/Basic.lean:541` at the pin. |
| a-F02 | P2 | repaired | README:708 "family of positive integers k_i≥1"; Lean binders `(k : Fin n → ℕ) (hk : ∀ i, 1 ≤ k i)`; Checks at README:725–727 (K₂,₃ gives 2 circles; k=(1,3) gives 0; scaling by t^(−1/k_i)). PHAM line 124 has the indexed family. |
| a-F03 | P1 | repaired | README:74 and :1058 cite SchemeAndStackFoundations §2.5 `cohomology_filtered_colimits` (main, `README.md:3402`) with its actual hypotheses (finite coverings in `Cov`, Čech fibre products in `B`, cofinality, terminal object); the local specialization is an owned target in §11.1 and in the *Needs* lines :1074, :1126. |
| a-F04 | P3 | repaired | README:514 uses the upper bound a>2m; Check :519 computes (4,2,0): a=6>4 and (4,1,1): a=2=2m retained. |
| a-F05 | P2 | repaired | README:450 "This section constructs only the integral factorization sequence"; :473 §3.2 proves divisibility and identification with `eulerExponent`; :495 §3.3 *Needs* "§3.2 for identification". (Cosmetic residue: §3.1's *Needs* at :469 still lists the Möbius lemma that §3.1 no longer uses.) |
| a-F06 | P3 | repaired | README:733 cites PHAM lines 204–221 and §§5.2–5.3; BS Lemma 7.2 is gone from §5.4. PHAM line 207 is the deformation-retraction lemma. |
| a-F07 | P2 | repaired | README:1402 "positive even integer n"; Check :1408 gives n=0: H¹=ℤ/2, H²=0. |
| a-F08 | P3 | repaired | README:1381–1383: fixed-sheet model (H²(G,ℤ(1)²)=0, Bockstein (1,1)), exchanged-sheet model (Q(1)=ℤ trivial, a=1, upstairs H³=0), n=1. Both models recomputed below and agree. |
| b-F01 | P2 | repaired (settled as "not actionable": supplier obligation) | README:162 declares `gap:steenrod-conjugated-real-pushforward` on MotivesAndAlgebraicCycles §7.6b; §12.2 at :1142 consumes it; `design/plan.json` `gaps` carries the same slug and sentence. Cycle check: `roadmaps grep` finds no roadmap on main or at any open head citing AlgebraicTopologyPartII; MotivesAndAlgebraicCycles (head 79b02f6, `README.md:1395`) owns Theorem 1.21; BW line 1127 derives it from Proposition 1.22 (BW lines 1130–1148), which the gap asks for verbatim in its own words. One owner, no back-edge. Not re-raised. |
| b-F02 | P3 | repaired | README:76 contract is on a ringed space (SchemeAndStackFoundations §2.23 carrier, main `README.md:4558`); README:164 adds the semialgebraic-site extension as a MotivesAndAlgebraicCycles §7.6a gap; §14.4 at :1306 consumes it. |
| b-F03 | P3 | repaired | README:371 Layer 1 owns the action law; :124 gap sentence ends with the exposed left action; the "consumed API" list :131–135 no longer states it. |
| b-F04 | P3 | repaired | `sources.toml` has 17 entries matching the 17 References; no SULLIVAN. |
| b-F05 | P3 | repaired | README:12 and :657 cite StableHomotopyKTheory §4.6 for the predicates (head 00bfbf7, `README.md:1484–1486` defines `IsHomotopyAssocHSpace`, `IsHomotopyCommHSpace`); the double-loop instance is owned in §4.6 here. |
| b-F06 | P3 | repaired | README:1206 "d≥0"; Checks :1212–1215 (d=0, ℙ¹, ℙ²). The ℙ¹ values are recomputed below from the Leray spectral sequence of S²→S²×_G EG and agree. §13.1 keeps d≥2 (:1193). |
| b-F07 | P3 | repaired | README:605 "SERRE lines 2623–2700, 2852"; cache line 2623 opens §3 on scan page 69 whose header reads 492, line 2700 is Proposition 3 on scan page 71 (header 494), line 2852 is Corollary 2 on scan page 75 (header 498). |
| b-F08 | P3 | repaired | README:1052–1056 state the uniform affine-family triviality target with quantifiers (ambient dimension, equation count, degree, ℚ-definable parameter space, finite partition over the real algebraic numbers, fibre-preserving trivializations, dimension refinement, transfer to every real closed extension), BCR Theorem 9.3.2 uncertified, and *Needs* :1074 names it. |
| b-F09 | P3 | repaired differently | No sentence in README:160–345 begins with "Prove", "Construct", "Set", "Define" or "Build"; the blocks read "§7.6b contract supplies …". The interface-law bullet lists were kept as consumer specifications; that is consistent with the gap sentences and introduces no second owner. |

No repair introduced an error I could find. The round-1 source issues on BS Lemma 7.6 (n=3) and B19 Lemma 7.3 (sign) were re-derived independently and stand (see Source issues).

## Verified sound

Counts: 19 Lean declarations read (14 definitions/abbreviations, 5 admitted theorems); 58 numbered README targets and 16 bold supplier-contract targets read in full (Layers 1–16, every line); 69 source line locators opened in the cache (PHAM 3, SERRE 3 with page headers, BW 41, BS 6, B19 5, BROUGHTON 2, CEF 2, GM 3, EP 2, MATHER 1, MILNOR-STASHEFF 2); 46 sibling citations resolved at the head or main named in the brief; 20 pinned declarations read at the manifest pins (Mathlib 6b7abb3, Tau Ceti a91d3aa); 61 README Checks recomputed (table below); 14 declared gaps compared with `design/plan.json` (byte-identical supplier, section and needs) and with the suppliers' current text.

Dependency check, run on this head: `depcheck: 55 roadmaps, 618 edges, 0 problem(s)` — no UPWARD, CYCLE or moved line. `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere (main a8132fb, 366 open pull requests).

Ownership. No roadmap on main or at an open head cites AlgebraicTopologyPartII. The board package RealSurfacePeriodIndex (design stage, head 875bca4, `packages/RealSurfacePeriodIndex/design/README.md:78–80`) imports equivariant Betti cohomology, fixed-locus decompositions, twisted Bocksteins, sign local systems, trace sequences, circle extensions, Ehresmann and stratified transport and the double-cover chase from this roadmap (AT2.6–AT2.16) and owns only Benoist's double covers, Noether–Lefschetz loci and the induction; it is a consumer, not a second owner. (Maintainer note, not a finding: it cites node ids `AT2.6/free-descent` and `AT2.8/equivariant-gysin`, which this package now consumes from MotivesAndAlgebraicCycles §§7.6a–7.6b; that design will need repointing.) No roadmap states tame polynomials, the configuration trace formula, the double-loop product, Fermat joins, γ_X, the corrected localization sequence, the trace-quotient lift or the circle extension.

Supplier citations resolved (section exists where cited, hypotheses match): MotivesAndAlgebraicCycles §7.6a (head 79b02f6 line 1382: loci, sites, equivariant cohomology with supports and twists, real-closed extension invariance, comparison over ℝ, norm/restriction, real-complex sequences, Hochschild–Serre) and §7.6b (line 1393: dualizing complexes, traces, Poincaré duality with orientation sheaf, equivariant purity, mod-two and integral decompositions, Steenrod squares, Theorems 1.18 and 1.21) — its Checks fix the same conventions as this README (H_G¹(ℤ(1))=ℤ/2, complex shift 2c/twist c versus real shift c); SchemeAndStackFoundations §§0.1, 0.2, 0.7, 2.5 (`cohomology_filtered_colimits`, main line 3402, with finite coverings, Čech products in `B`, cofinality and the terminal-object specialization exactly as README:1058 states), 2.7, 2.19, 2.23 (`forget_injective`, `coind_injective`, main lines 4570–4571; ringed-space carrier); StableHomotopyKTheory §3.36, §3.37 (path-connected H-space, finite-type rational homology, primitives; the free graded-commutative Hopf form is not there, so the declared gap is minimal), §4.6; EtaleDualityAndPerverseSheaves §§3.5–3.8, §4.7 (hypersurface primitive rank ((d−1)^{m+2}+(−1)^m(d−1))/d, which gives (3⁵−3)/4=60), §6.5 (Fujiwara–Varshavsky with open U⊂X and the compact-support Frobenius trace import at its line 7123, so the affine PConf_m is covered); InverseGaloisAndArithmeticFundamentalGroups §IG.5.1 (Hausdorff T, unit-difference discriminant open, S_n-torsor including n=0,1; no action formula, so Layer 1's ownership of the formula is right); ComplexComparisonPartII §C−1.1; QWittVectors §1.4a (on the open head; the roadmap is in the merge order at position 85, before this one at 126); SmoothBundlesConnections §B1 item 5 (Ehresmann for proper surjective submersions, connected base); CharacteristicClasses §C2 item 3 (e(TM)[M]=χ) and §C3 item 2 (w₁ orientation-cover class, w_n=e mod 2); TangentialBordism §B4 item 3 (Wu classes, w(TM)=Sq(v)); AlgebraicTopology Stages 2–8 and Stage 5 item 5 (Serre spectral sequence); MorseNovikov N6 (Lefschetz formula for diffeomorphisms of closed connected manifolds, nonorientable included); AffineMorseLefschetz A2, A3, A4.1 (compact semialgebraic triangulation compatible with a finite family, dimension API, over ℝ — so the real-closed gap asks for what is missing); RealAnalyticGeometry §R2.1; RealAlgebraicGeometry Layers 3, 6; DifferentialGeometry Layers 2, 3, 10 (10.2 Sard); GeometricTopology Layer 1. All thirteen roadmaps not on main are open pull requests adding new folders or are earlier in the merge order.

Gaps: all 14 have a named supplier and a section that exists; none asks for what MotivesAndAlgebraicCycles §§7.6a–7.6b, SchemeAndStackFoundations §§2.5/2.23, StableHomotopyKTheory §3.37, AffineMorseLefschetz A4.1 or InverseGalois §IG.5.1 already state (checked sentence by sentence against the texts above); each `needs` names its hypotheses.

Pinned declarations (file:line at the pins): `ContinuousMap.HomotopyRel` (`Mathlib/Topology/Homotopy/Basic.lean:541`, fixes every point of S at every time); `PowerSeries.binomialSeries` (`Mathlib/RingTheory/PowerSeries/Binomial.lean:47`, coefficients `Ring.choose r n`, so (1+X)^r; `Int.instBinomialRing` at `Mathlib/RingTheory/Binomial.lean:258`); `PowerSeries.subst` (`Mathlib/RingTheory/PowerSeries/Substitution.lean:157`; the substituted series has zero constant term since r(n−2)−1≥1 for n≥4, r≥1, so no junk value enters); `GenLoop` and the `Ω^` notation (`Mathlib/Topology/Homotopy/HomotopyGroup.lean:97,100`), `HomotopyGroup.group` (:547); `TauCeti.WedgeSum` (`TauCeti/Topology/WedgeSum.lean:72`, `base` :86); `TopCat.singularCohomology` (`TauCeti/AlgebraicTopology/Cohomology/Basic.lean:94`, arguments (R k M) X n) and `singularCohomologyMap` (:100); `Equiv.Perm.fullCycleType` (`TauCeti/GroupTheory/Perm/Partition.lean:96`, `cycleType + replicate (card − support.card) 1`); `TauCeti.FiniteField.fullCycleType_eq_map_natDegree_normalizedFactors` (`TauCeti/FieldTheory/GaloisGroups/FrobeniusOrbits.lean:106`, hypotheses `Squarefree g` and `π x = x ^ card F`); `HomotopyGroup.zerothHomotopyEquiv`, `.loopSpaceEquiv`, `.piLoopSpaceMulEquiv` (`TauCeti/Topology/Homotopy/HomotopyGroup/LoopSpace.lean:210,264,321`); `TauCeti.IsSemialgebraic` (`TauCeti/Geometry/RealAlgebraic/Semialgebraic/Basic.lean:68`, `[CommRing R] [LinearOrder R]`, no compatibility axiom). Neither pinned library has a topological join (so the §5.2/§5.3 join identification is rightly listed as not statable).

Policy: the pull request changes only `packages/AlgebraicTopologyPartII/`; no pull-request number, process word, `lemma`, `set_option`, `#eval`, `True` placeholder, sorry'd data or machine path in README, Lean or manifest; one `import Mathlib` and three Tau Ceti modules that exist at the pin; every Lean name appears in the README and every own backticked README name is declared; every numbered target has a locator; no computational algorithm.

Declaration table (section; binders; instances with the values computed on each side):

| Declaration | Binders/instances | Instances tried, values | Result |
|---|---|---|---|
| `orderedConfiguration m` (§2.4) | subtype of `Fin m → ℂ` | m=0 one empty map; m=2: (0,1) in, (0,0) out | sound |
| `configurationPermutation m σ` (§2.4) | `z.val ∘ σ.symm` | σ=(123), τ=(12), x=(a,b,c): σ·(τ·x)=(c,b,a)=(στ)·x; with σ in place of σ⁻¹: (a,c,b) | left action as README:30 |
| `configurationTraceFormula F m χ` (§2.4) | `[Field F] [Fintype F]`, χ on multisets, finsum over monic squarefree, range (m+1) | χ=sgn, m=2: left q(q−1)/2−(q²−q)/2=0; right ⟨sgn,H⁰⟩=⟨sgn,H¹⟩=0 (swap acts trivially on H¹(ℂ×ℂ*)) so 0. χ=sgn, m=3 at q=2: 0−2+2=0, at q=3: 1−9+8=0, matching ∏_P(1−U^{deg P})=1−qU having no U^m term for m≥2. χ=indicator of type (2), m=2: left (q²−q)/2; right q²/2−q/2 | sound; trace of σ⁻¹-pullback equals the character since S_m-characters are real |
| `eulerExponent n N r` (§3.1–3.2) | ℤ, divisors of r, integer division | r=0: ∅ sum, 0/0=0; (n odd,N=2): 2,−3,2; (n even,N=2): −2,−1,−2; divisibility holds in every case tried (necklace identity) | sound |
| `unitSphere s`, `sphereBouquet s N x` (§4.3–4.4) | `Metric.sphere 0 1` in ℝ^{s+1}; `WedgeSum` | s=0: {±1}; N=0: singleton; N=2, s=2: H² rank 2 (not smash) | sound |
| `IsTame f` (§4.1) | compact K, critical set in interior, ε-bound off K | z₁: K=∅, ε=1; constant, n≥1: critical set ℂⁿ not inside a compact interior, not tame; x²y−x at (t,1/(2t)): gradient (0,t²)→0, not tame; xy: ‖∇f‖=‖z‖, tame with K the unit ball; n=0 constant: tame (K=univ) | equals BROUGHTON Definition 3.1 (line 354) |
| `jacobianAlgebra`, `milnorNumber`, `fiberMilnorNumber` (§4.2) | quotient by span of partials; `maxGenEigenspace` of `Algebra.lmul` | xy: J=ℂ, μ=1, μ⁰=1, μᵃ=0 (a≠0); x³−y² (cusp): J=⟨1,x⟩, μ=2, f≡0 on J so μ⁰=2; x³−3x+y²: μ=2, μ^{±2}=1; ℂ[t]/t³ with t²: generalized 0-space 3 versus kernel 2 | distinguishes the Tjurina model |
| `polynomialFiber`, `tameFibreBouquet` (§4.2) | `2 ≤ n`, `IsTame`, every a, `x : unitSphere (n−1)` | xy, a≠0: ℂ*≃S¹, one circle = 1−0; a=0: two lines through 0, contractible = 1−1; cusp, a=0: {y²=x³}≅ℂ, 2−2=0 spheres; a≠0: smooth affine cubic ≃ S¹∨S¹, 2−0=2; n=1, z³, a=1: 3 points = wedge of 2 copies of S⁰ (S03) | sound for n≥1 |
| `rationalBouquetRanks s N k x Y y hY` (§4.5) | n=s+3, degree k+2, `(s+1) ∣ (k+1)`, `(−1)^k·e_r` with r=(k+1)/(s+1) | S²∨S² (s=0,N=2): k=0,1,2 → 2,3,2 (two Hopf + one Whitehead at k=1; weight-3 words 2 at k=2); r=4: −e₄=(16−4)/4=3 = L₄(2) with no extra class since 2·1 even; r=6: −e₆=(64+8−4−2)/6=11 = L₆(2)+L₃(2)=9+2 with the extra class from the even sphere S⁴ of the weight-3 words; S³ (s=1,N=1): k=1 → 1, k=0,2 → 0 | sound; sign (−1)^k=(−1)^{rk−1} |
| `doubleLoopFactor n N r` (§5.1) | `4 ≤ n`, `0 < r`, subst of C((−1)^{r(n−2)})·X^{r(n−2)−1} into (1+X)^{−e_r} | gives (1+(−1)^{r(n−2)}t^{r(n−2)−1})^{−e_r}=(1−(−t)^{r(n−2)−1})^{−e_r}; n=4,N=1: 1+t; n=5,N=1: (1−t²)⁻¹, 1+t⁵; parity rule: generator in degree m=rk−1 gives exponent (−1)^{m+1}·rank=−e_r | sound |
| `doubleLoopBetti s N j x Y y hY` (§5.1) | n=s+4, `Ω^(Fin 2) Y y`, product over r≤j | factor r>j starts in degree ≥2j+1>j; S³: 1+t (Ω²S³≃_ℚ S¹); S⁴: ℚ[y₂]⊗Λ(z₅); N=0: 1,0,0,…; unpointed equivalence suffices since ev:Map(S²,Y)→Y is a Hurewicz fibration and Y is path-connected | sound |
| `fermatFiber`, `phamSkeleton`, `phamInclusion` (§5.3) | `∑ z i ^ k i = 1`; powers real and ≥0 | k=(2,2): (1,0) in both; (√2,i): powers (2,−1), fibre only; n=2,k=(0,0): sum 2, empty; n=0: empty | sound |
| `phamStrongRetraction n hn k hk` (§5.3) | `2 ≤ n`, `∀ i, 1 ≤ k i`, HomotopyRel, root-of-unity equivariance | two-stage retraction (imaginary part to 0, then x↦x⁺/∑x⁺) preserves u_i=0, ratios u_i(t)/u_i avoid the negative axis and have modulus ≤1, so principal k_i-th roots lift continuously and equivariantly; skeleton points have u∈Δ and are fixed; n=1: X=S=μ_k (S02) | true for every n≥0 |

README targets recomputed (one row per statement, values on each side):

| Target | Instances, values | Result |
|---|---|---|
| §2.1 support ranges | PConf₂≅ℂ×ℂ*: ordinary 1,1 in degrees 0,1; compact 1,1 in 4,3 = [m+1,2m] | agrees |
| §2.3 character | m=2,N=2: id 4, swap 2s_n; m=N=0: 0⁰=1 | agrees |
| §2.4 both forms | ordinary ∑_a(−1)^a q^{m−a}⟨χ,H^a⟩; compact degree b=2m−a, i=m−a gives (−1)^{m−i}q^i⟨χ,H_c^{m+i}⟩ with equivariant duality | the two displays agree |
| §3.1 factorization | 1+s_nNT: N=1 even n: e₁=−1 only; odd n: e₁=1,e₂=−1 ((1−T²)/(1−T)=1+T) | agrees |
| §3.2 Möbius | −r e_r=∑_{d|r}μ(r/d)((−1)^nN)^d (BS line 2243) equals README's divisor form | agrees |
| §3.3 Euler product | ∏_P(1+cU^{deg P}) with 1+cT=∏_r(1−T^r)^{−e_r} and ∏_P(1−T^{deg P})=1−qT gives ∏_r(1−qU^r)^{−e_r} | derived |
| §3.4 multiplicities | m=1: N on both sides (s_n·s_nN); m=2,N=1, n even: (H_c^{3},H_c^{4})⊗sgn invariants 0,0 versus (1−qU)¹ having no U²; n odd: 1,1 versus [qU²]=−1·(−1), [q²U²]=1 | agrees; sign (−1)^{mn+i}=(−1)^j as BS line 2329 |
| §3.5 diagonal | (4,1,1,1): 1=1; (4,2,2,2): 1=1; (5,1,2,1): 1=1; (4,1,2,2): 0=0; BS line 2322 assumes d(n−3)>j, the README's d(n−3)≥j also forces (d+1)(n−3)>j so truncation is exact | agrees; statable (S01) |
| §4.1 leading-part criterion | ∑z_iᵏ−1, k≥2: smooth Fermat hypersurface, tame | agrees |
| §4.3 Hilton counts | N=2: L₁,L₂,L₃=2,1,2; weight-2 sphere for S² is S³ | agrees |
| §4.4 spheres | S²: ranks at 2,3; S³: at 3 only (SERRE lines 2700, 2852) | agrees |
| §4.6 double-loop algebra | pt: ℚ; S³: Λ(x₁); S⁴: ℚ[y₂]⊗Λ(z₅); S²: π₀Ω²=ℤ excluded | agrees |
| §5.2 joins | K₂,₂: 1 circle; K₂,₃: 6−5+1=2; three 2-point sets: S² | agrees |
| §5.4 connectivity | n=5,k=2: S⁴, π₂=π₃=0; n=4: π₃(S³)=ℤ | agrees |
| §7.2–7.3 | H¹(G,ℤ(1))=ℤ/2, H¹(G,ℤ)=0; u_q=1,−1,−1,1 intertwines σ−1/1+σ with 1−σ/1+σ; trivial ℤ: ℤ,0,𝔽₂; sign: 0,𝔽₂,0 | agrees |
| §7.5 parity isomorphism | j odd: H^q(G,ℤ(j))=𝔽₂ exactly for q odd, so H_G^i=⊕_{p≡i−1}H^p and reduction is an isomorphism; j even: the q=0 term H^i(Y;ℤ)→H^i(Y;𝔽₂) is not an isomorphism unless i>dim Y | hypothesis exact |
| §7.6 Bockstein | Sq¹(a_pω^{k−p})=Sq¹(a_p)ω^{k−p}+(k−p)a_pω^{k−p+1} gives b_i=β(a_{i−1})+(k−i)a_i; point: β(ω^k)=kω^{k+1} | agrees |
| §8.5 Borel | pt, s=1: RP¹ has H¹=ℤ, H¹(C₂,ℤ)=0 | strict i<s |
| §9.2 γ | RP²: (1+a+a²)(1+a)=1 mod a³ | agrees |
| §9.4 parity | purity shifts the support twist by d, so an odd twist on X(R) needs j≡d−1 (BW line 722) | agrees |
| §9.5 window | BW line 751–754: 0≤p<i−d, p≡i−j; d=2,i=4,j=1: {1} | agrees |
| §10.2 | BW line 829–832: profinite completion of H_G^i(pair;M) dual to the torsion group H_G^{2d−i}(U,Hom(M,ℚ/ℤ(d))) | agrees |
| §10.3 corrected sequence on ℙ¹ | H_G^0(pair)=0, H_G^0(U)=𝔽₂→H⁰(RP¹)=𝔽₂ iso; H_G^1(pair)=0; H_G^2(pair)=𝔽₂ (from H_G^1(RP¹)=𝔽₂² modulo ω and the injective restriction H_G^2(ℂP¹)=𝔽₂²→𝔽₂²); u₂:H¹(RP¹)→H_G^2(pair) iso; H_G^3(pair)=0 | exact with the stated windows |
| §10.4 | BW line 904: deg(zγ⁻¹); RP²: deg(a(1+a))=1 versus deg(a)=0 | agrees |
| §11.1 | 𝔾_m: H¹(ℂ*)=ℤ so i>d strict; family z²=t: fibre counts 2,1,2 at −1,0,1 | agrees |
| §11.2–11.3 hypotheses | BW lines 951–953 (smooth ample hypersurface, X(R)=∅, i>d+1 / i=d+1), 971–976 (i≥d+1, p≥1 surjectivity in parity i−j) | match |
| §11.5 | 𝔾_m, 𝔽₂: restriction matrix [[1,0],[1,1]], relative H²=0; BW line 1012–1014 "at least when M is torsion" | agrees |
| §12.3 surfaces | RP²: w₁²=1=χ; torus 0=0; Klein bottle: w₁=(1,1) on diag(1,1), square 0=χ mod 2 | agrees |
| §13.1 | BW line 1659–1660: H^{2d−2}_G(X(C),ℤ(d−1))₀≅H^{2d−2}_G(U,ℤ(d−1)) | agrees |
| §13.2 at d=1 | Leray spectral sequence of S²→S²×_GEG: H_G^2(S²;ℤ)=E^{2,0}=𝔽₂; H_G^2(S²;ℤ(1))=E^{0,2}=ℤ (c₁); H_G^1(S²;ℤ(1))=𝔽₂ and H_G^3(S²;ℤ(1))≅H_G^3(S¹;ℤ(1))=𝔽₂ from the pair sequence; cup-ω maps ℤ→𝔽₂ (kernel 2ℤ = norm image), 𝔽₂→𝔽₂, 𝔽₂→𝔽₂ | agrees; BW lines 1871–1886 use only odd order, 2ω=0, (1.7), H^{2d}=ℤ and a real point |
| §13.3 | even traces 1−1+1−1=0; b₃=60; invariant rank 30 | agrees |
| §14.1–14.3 | connected double cover of S¹: monodromy −1, e≠0, β_L(1)=e; branch point of z²: Tr=×2, cone ℤ/2; punctured disc sign system H⁰=0, H¹=ℤ/2 | agrees |
| §14.4 | ℤ: H¹=0,H²=𝔽₂; ℤ(1): 𝔽₂,0; ℤ[G]: 0,0 | agrees |
| §15.1–15.2 | B19 line 1386: ψ(a)=(∑a_j−na_i)_i; n=2: ψ[(1,0)]=(−1,1); n=4: (−3,1,1,1), trace 0, reduction diagonal 1 | agrees |
| §15.3 lifting models | fixed sheets, n=2: H²(G,ℤ(1)²)=0, β(ω²)=(ω³,ω³)≠0, no lift; exchanged sheets: Q=ℤ(1), Q(1)=ℤ, H²(G,ℤ)=𝔽₂→H²(G,𝔽₂) iso, a=1, H³(G,ℤ[G])=0 | agrees |
| §15.4 sign | (1,−φ)∘(Tr,π)=0; p*ã=red(p*η)−red(diag φζ)=red(p*η−ψζ) since ψ≡diag∘φ mod n | minus sign correct (source says plus) |
| §15.5 | sign differentials −2,0,−2: H¹=A/2A ∋1, H²=A[2] ∋n/2; reductions 1 and n/2 mod 2: n=2,4,6 give 1,1,1 and 1,0,1 | agrees |
| §15.6 stalks | n=2 one regular stalk: (𝔽₂⊕ℤ)/⟨(1,2)⟩≅ℤ/4, kernel {0,(1,0)}, exact; n=4 two regular stalks: Q(1)^G/(1+σ)Q(1)=ℤ/2 generated by w=[(1,0,1,0)] (diag=2w−p−q), and E=⟨(1,0),(0,w)⟩/((0,p)=(0,q)=(1,0), 2(0,w)=0)≅𝔽₂² | agrees |
| §16.3 | 2ℤ⊂ℤ: rational isomorphism, index 2 | agrees |

Headline coverage: the stated theorems are the trace formula, tame bouquet, bouquet ranks, double-loop Betti product and the Pham retraction; the stable configuration diagonal is statable and absent (S01); the rest of the module docstring's list was checked carrier by carrier (no étale cohomology with Frobenius, no topological join, no free graded-commutative algebra on a graded space, no semialgebraic site, no Stiefel–Whitney classes, no equivariant sheaf cohomology at the pins) and is correct. No declaration is padding: every definition is used by an admitted theorem, no Check is mirrored, no boundary theorem or example is present.

## Not verifiable

- Lean: not built. No checkout on this host carries both pins with object files (the board and content checkouts have no `.lake`; the only built Tau Ceti clone is at a later commit and toolchain), and the brief forbids builds. The `#check @name` comparison of elaborated types with the README was therefore not run here; the binders were compared by reading the pinned sources, and the round-1 repair report records an elaboration at the pins with five `sorry` warnings and no error. The S01 repair text must be elaborated by the repair worker.
- HILTON Theorem A and Corollary 4.10, DIMCA Lemma 4, BRUMFIEL pp.163–169, SCHEIDERER Corollary 18.11, BCR Theorem 9.3.2: uncertified locators, not read; the claims attributed to them (basic-product decomposition and Witt count, equivariant Ehresmann, semialgebraic fixed-point trace, relative affine torsion vanishing, Hardt triviality) are standard and consistent with the certified texts cited beside them. KRASNOV Theorem 2.1: waived.
- EP Theorem 4.1 and 4.7 are cited with arXiv-internal pages; the published numbering was not checked.
- The full proofs of BROUGHTON §4 (deformation estimates) and MATHER §11 (control data) were not re-derived; OCR damage in both texts leaves some displayed formulas unreadable.
- Ownership against open pull requests was checked by object with `roadmaps grep` across main and all 366 open heads and against the board package RealSurfacePeriodIndex; the other board designs were not read.

## Source issues

- **Error** in BS at Lemma 7.6, printed pp.944–945: the source asserts the double-loop Betti product for every n>2; at n=3 the first factor has exponent r(n−2)−1=0, so the product is not even defined, and Ω²(∨S²) has infinitely many components; it should require n≥4; affects a stated result.
- **Error** in B19 at Lemma 7.3, printed pp.98–99: the source writes the integral lift as p*η plus ψ(ζ); since (7.2) uses (1,−φ) and ψ reduces modulo n to diag∘φ, it should be p*η minus ψ(ζ); affects a stated result.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "108b271", "job": "RT-AlgebraicTopologyPartII~2b", "model": "fable", "worker": "fable-rt56"} -->

<!-- tauceti-roadmap-review {"agent": "claude", "head": "108b271", "job": "RT-AlgebraicTopologyPartII~2b", "model": "fable", "worker": "fable-rt56"} -->
