# Review of ProbabilisticAndMetricNumberTheory (pull request #1421 at d311ebe)

**Verdict:** accepted

This is an incremental re-review of the 15 README lines changed since 2b2cf8e. `Suggested.lean` and `metadata.toml` are unchanged, and no file outside the folder changed. Both previous findings are repaired. The repairs introduce no new problem, and this report has no findings.

## Previous findings

- R01 — repaired: README:63 now reads "it is strongly continuous (`MeasureTheory.Measure.continuous_leftRegular_apply`) when G is a topological group with its Borel σ-algebra, μ is locally finite and inner regular on finite-measure sets by compact sets, and p≠∞". The definition clause adds measurable multiplication.
- R02 — repaired: README:104–106 now reads "The predicate `IsAdditive` of PNTPlus (`IwaniecKowalskiCh1.lean`, lines 43–44) is the coprime law on positive inputs alone, for an `AddZeroClass` codomain, without the clause f(1)=0. It agrees … additively cancellative". README:7171 pins revision 127b50e, and `sources.toml` records PNTPlus.

## Verified sound

**Gate, build, dependencies, elaboration.**
- The push gate, rerun on this head:
  ```text
  gate ProbabilisticAndMetricNumberTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
  ```
  The worker's gate on the same head adds `build=0`.
- The dependency check with `--movable` prints `depcheck: 238 roadmaps, 2349 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line. The merge-order positions are unchanged:

  | Roadmap | Position |
  |---|---|
  | AnalyticNumberTheoryPartI | 49 |
  | AnalyticNumberTheoryPartII | 50 |
  | AdelicAlgebraicGroups | 51 |
  | SieveMethodsAndPrimePatterns | 55 |
  | this roadmap | 60 |
  | GeometryOfNumbersAndQuadraticArithmetic | 148 |

- `lake env lean` on `Suggested.lean` exits 0 with 66 warnings, all `declaration uses sorry`, and no errors.
- The diff of `origin/main...HEAD` outside the folder is empty, and the gate agrees (outside-folder=0).
- `Suggested.lean` is byte-identical to the file of r4–r6 (sha256 3089e163…, last changed in 9c6663c). The one-tactic probe and the headline list of r4 therefore still apply.
- The worker's elaborated types, from its `#check @name` pass over all 96 declarations, flag six leads. All six are the false positives of r4–r6:
  - `torusPolynomial` needs no `Fintype d`.
  - `hΓn` (`mahler_relativelyCompact_iff`) survives as an unnamed hypothesis, `(∀ g, g ∈ Γn ↔ …) →`.
  - `ha` survives the same way in `modular_timeOne_mixing`, `homogeneous_birkhoff`, `bounded_digits_compact_orbit` and `typical_unbounded_semiorbit`.
  - `hu` survives the same way in `bounded_digits_compact_orbit` and `typical_unbounded_semiorbit`.

**Library declarations opened at the pins** (Mathlib 1b1ccf4b, Tau Ceti 2fd255d9).

Tau Ceti, `RepresentationTheory/Continuous/LeftRegular.lean`. Each clause of the new README:63 matches the pinned file:

| Pinned binders | README:63 clause |
|---|---|
| `[Group G] [MeasurableSpace G] [MeasurableMul G]` (:50) | "a group G with measurable multiplication" |
| `[NormedRing 𝕜] [NormedAddCommGroup E] [Module 𝕜 E] [IsBoundedSMul 𝕜 E]` (:50–51) | "a normed module E over a normed ring" |
| `[μ.IsMulLeftInvariant]` and `[Fact (1 ≤ p)]` (:52) | "a left-invariant μ" and "1≤p" |
| `isUnitary_leftRegular` (:94–95): `[RCLike 𝕜]`, `[InnerProductSpace 𝕜 E]`, p=2 | "unitary for p=2 when E is an inner product space over ℝ or ℂ" |
| `continuous_leftRegular_apply` (:102–103): `IsTopologicalGroup G`, `BorelSpace G`, `μ.InnerRegularCompactLTTop`, `IsLocallyFiniteMeasure μ`, `hp : p ≠ ∞` | the strong-continuity clause |

Mathlib, for the modified Check at README:6368:
- `measurableSMul_of_mul` (`MeasureTheory/Group/Arithmetic.lean`:475–476) turns `MeasurableMul G` into `MeasurableSMul G G`, and `MeasurableSMul` extends `MeasurableConstSMul` (:450–451).
- `IsMulLeftInvariant.smulInvariantMeasure` (`MeasureTheory/Group/Defs.lean`:94–96) gives `SMulInvariantMeasure G G μ`.
- So the Check's hypotheses, measurable multiplication and a left-invariant μ, are exactly what scalarLpKoopman needs for the left action of G on itself.

Mathlib, for the new Check at README:6371:
- `MeasureTheory.Measure.count_apply` (`MeasureTheory/Measure/Count.lean`:46) gives count s = s.encard for measurable s.
- `count_singleton` (:127) gives count {a} = 1.
- `InnerRegularCompactLTTop` (`MeasureTheory/Measure/Regular.lean`:336–337) is inner regularity by compact sets on measurable sets of finite measure.
- Measurable sets of finite counting measure are finite, hence compact, so counting measure on Borel ℝ satisfies that class. It fails only local finiteness.

**PNTPlus (R02).**
- The raw file `PrimeNumberTheoremAnd/IwaniecKowalskiCh1.lean` at revision 127b50e33f6033e2147921167a117af96d9ba4ea has `def IsAdditive [AddZeroClass R] (f : ArithmeticFunction R) : Prop` at line 43. Line 44 is its body, `∀ {m n : ℕ}, m ≠ 0 → n ≠ 0 → Coprime m n → f (m * n) = f m + f n`. In the cached extraction, which has a four-line header, these are PNTPlus lines 47–48.
- The repository's LICENSE at that revision is the Apache License 2.0, as README:7171 says.
- `sources.toml` lines 590–605 record PNTPlus:
  - status `certified` and licence class `open-repository`;
  - url and `fetched_from` at the pinned revision;
  - sha256 7d03e98a…, equal to the cached file;
  - locator "IsAdditive, lines 43-44", `cited_for` §0.1.
- The README's description of the predicate is exact:
  - "positive inputs" is `m ≠ 0 → n ≠ 0` on ℕ;
  - the codomain is `AddZeroClass`;
  - there is no clause f(1)=0.
- The agreement argument holds. The coprime law at (1,1) gives f(1)=f(1)+f(1)=f(1)+0, and cancellation gives f(1)=0. Conversely, this roadmap's predicate implies PNTPlus's for every additive commutative monoid.
- §0.1a (README:206) already says that f(1)=0 does not follow without cancellation, and the new sentence agrees with it.

**Seeded sample.** Two sampled targets fall in the changed passages, and both were verified at their locators.
- §0.1 "Additive functions in the native arithmetic carrier":
  - ElsholtzTao2011 lines 2179–2180, physical p.37, define additivity by the coprime law for w: ℕ→ℝ.
  - Lemma A.2 (Turán–Kubilius) is at lines 2183–2190, physical p.38, printed p.38 (line 2182).
  - Lemma A.3, with the strongly additive definition, is at lines 2211–2212, p.38.
  - The README's definition is that notion with a general additive commutative monoid as codomain. It adds f(1)=0, which is automatic for ℝ. The locators "Appendix A, additive convention and Lemma A.2, physical pp.37–38" and "Lemma A.3, defining paragraph, physical p.38" are correct.
- §4.9a "Lattice quotients, Howe–Moore and Moore ergodicity", in the changed Checks of the scalar Lᵖ pullback representations:
  - Morris2015 Example 11.1.3 is at line 9085, physical p.230, printed p.214. It defines π(h)ϕ(x)=ϕ(h⁻¹x) on L² for an invariant Radon measure. Radon includes local finiteness, which is consistent with the new Check at README:6371.
  - Ciobotaru2014 Definition 2.2 is at line 118, p.3: a strongly continuous homomorphism into the unitary group.

The other thirteen sampled targets (§§0.1a, 0.6, 0.11, 0.12, 1.2, 1.5, 2.1, 3.2, 3.7, 4.4, 4.7, 5.2, 5.3) lie outside the changed passages. None of them cites a changed sentence: the `IsAdditive` definition they build on is unchanged, and only its locator sentence moved. Following the brief, they were not re-verified this round. The README flags no locator as unverified.

**Ownership and duplication of the changed objects.**
- `roadmaps grep 'IsAdditive|leftRegular'` over main and the 466 indexed open heads finds no other roadmap that defines an additive arithmetic-function predicate. The `IsAdditive`-named hits elsewhere are other notions: `IsAdditiveGenerator` in ArtinAlgebras on main. The `leftRegular` hits elsewhere are `Rep.leftRegular` in ClassicalGroups and `Representation.leftRegular` in McKaySkewGroup, the finite-dimensional algebraic regular representation, not the Lᵖ one.
- At the pins, Mathlib's `IsAdditive` (`AlgebraicTopology/EilenbergSteenrod.lean`:214) is the homology-theory class, and Tau Ceti has only `IsAdditiveRootOrder`. No pinned library states additivity of arithmetic functions.
- PNTPlus is neither a pin nor a roadmap, so it is correctly cited as a source.
- The Lᵖ left regular representation is Tau Ceti's and is cited, not restated.

**Overlaps.** `scratch/overlaps.md` lists no other open pull request that changes this roadmap, no dropped id and no id defined only by an open revision. The citation resolver finds no unresolved citation or Lean name.

**Adversarial table.** The rows marked (r6) are carried from the previous report (PRREVIEW-ProbabilisticAndMetricNumberTheory~6) for statements this change leaves untouched; they include the rows that report carried from r4–r5. The other rows were computed this round, for every changed statement.

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| `leftRegular` contract, definition clause (README:63) | LeftRegular.lean:50–52 | MeasurableMul, NormedRing 𝕜 with bounded 𝕜-module E, IsMulLeftInvariant, 1≤p vs the README's four clauses | equal | R01 repaired |
| `leftRegular` contract, unitarity | :94–95; S₃ with counting measure, δ₁ and δ₂ | RCLike 𝕜, InnerProductSpace, p=2; ‖λ(12)δ₁‖=‖δ₂‖=1=‖δ₁‖ | equal | — |
| `leftRegular` contract, strong continuity | counting measure on Borel ℝ; Lebesgue on ℝ, p=2 | count((−ε,ε))=⊤, so not locally finite and now excluded; Lebesgue: ‖1_[t,t+1]−1_[0,1]‖₂=√(2abs(t))→0 for abs(t)≤1 | sentence true; previous counterexample excluded | R01 repaired |
| §0.1 PNTPlus comparison (README:104–106) | R=ℕ∞ with f≡⊤ on n≥1; R=ℝ; R=ℤ/2 | ℕ∞: PNTPlus holds (⊤=⊤+⊤), this roadmap fails (f(1)=⊤); ℝ: f(1)=2f(1), so f(1)=0; ℤ/2: f(1)+f(1)=0, so f(1)=0 | agreement exactly under cancellation | R02 repaired |
| §0.1 guards vs PNTPlus | m=0, n=1; m=2, n=3 | 0<0 and 0≠0 both false, so both exclude; 0<2 and 2≠0 both true | the guards coincide on ℕ | — |
| §0.1 PNTPlus locator (README:104, 7171) | raw file at 127b50e; LICENSE | line 43 `def IsAdditive [AddZeroClass R]`, line 44 the coprime law; Apache License 2.0; sha256 7d03e98a… = manifest | correct | — |
| §0.1 new Check (README:127–129) | f(0)=0, f(n)=⊤ for n≥1; pairs (1,1), (2,3), (4,9) | f(1)=⊤=⊤+⊤, f(6)=⊤=⊤+⊤, f(36)=⊤; f(1)=⊤≠0 | coprime law holds, IsAdditive fails: isolates the f(1)=0 clause (the unit Check fails both, δ(1)=1≠2) | — |
| §0.1 ElsholtzTao2011 locators | lines 2179–2180 (p.37), 2183–2190 and 2211–2212 (p.38) | coprime law for w: ℕ→ℝ; Lemma A.2 for N>2 with constant 30; strongly additive means w(pᵏ)=w(p) | support the definition at R=ℝ | — |
| §4.9a modified Check 2 (README:6368) | G=ℝ under addition, Lebesgue, p=2, t=1, f=1_[0,1] | MeasurableMul gives MeasurableConstSMul (Arithmetic.lean:450–451, 475–476); left invariance gives SMulInvariantMeasure (Defs.lean:94–96); both maps give f(·−1)=1_[1,2], ‖·‖₂=1; without the inverse 1_[−1,0] | hypotheses met, agrees, discriminating | — |
| §4.9a new Check 5 (README:6371) | counting measure on Borel ℝ, δ₀, p=2, t=1/n | count(t+s)=count(s); measurable s with count s<⊤ is finite, hence compact; count((−1/n,1/n))=⊤; ‖δ_t−δ₀‖₂=√(1+1)=√2 for every t≠0 | only local finiteness fails; discontinuous at 0; Check correct | — |
| §4.9a locators of the changed block | Morris2015 line 9085; Ciobotaru2014 line 118 | physical p.230 = printed p.214, convention ϕ(h⁻¹x), Radon measure; Def 2.2 at p.3 | correct | — |
| (r6) scalarLpKoopman = mk(g⁻¹)• (README:6361) | S₃ on {1,2,3}, counting measure, p=2; g=(12), h=(23) | mk(g⁻¹)·mk(h⁻¹)=mk(h⁻¹g⁻¹)=mk((132))=mk((gh)⁻¹); π((12))δ₁=δ₂, π((23))δ₂=δ₃, π((23)(12))δ₁=δ₃ | homomorphism, laws hold | — |
| (r6) same, degenerate | G trivial; μ=0; Gaussian on ℝ under translations | π(1)=id; Lp=0; Gaussian excluded by `SMulInvariantMeasure`, since ‖1_[0,1](·−t)‖ changes with t | OK | — |
| (r6) Check 1 (S₃) | π vs f∘(g•) vs trivial | δ₃=δ₃ for π; f∘(g•): composite δ₃, product δ₂; trivial: δ₁≠δ₂ | discriminating | — |
| (r6) a.e. formula | `smul_Lp_ae_eq`, c=mk g⁻¹ | f(mk.symm(mk g⁻¹)•·)=f(g⁻¹•·) | matches README | — |
| (r6) scalarLpKoopman_strong hypotheses | instance variables of DomAct/Continuous.lean:47–54 vs the target | R₁, Borel Y, ContinuousSMul, locally finite, InnerRegularCompactLTTop, 1≤p<∞, OpensMeasurable G | equal lists | — |
| (r6) §3.1 `dsSet` | q=0; q=1, ψ=1/2; q=3, ψ(3)=−1 | Icc 1 0=∅; [1/2,3/2]∩[0,1]=[1/2,1]; Icc(a/3+1/3, a/3−1/3)=∅ | bullets correct | — |
| (r6) §3.1 `khinchinSet` | q=0, any ψ(0); q=2, ψ=1/2 | Icc 0 0={0}; [0,1] vs 𝒜₂=[1/4,3/4] | 𝒦₀={0}, 0∈𝒦₂∖𝒜₂ | — |
| (r6) §3.1 limsup at one index | change s 0 | limsup atTop = {x : ∃ᶠ q, x∈s q}, unchanged by one index | correct | — |
| (r6) Layer 4 Dependencies | *Needs:* lines vs Dependencies paragraph | ANT II §5.3k, DAT §§0.5–0.6, Mathlib domain action, Tau Ceti fundamental domain, unitary, ZLattice, LieGroups: all named | complete | — |
| (r6) lattice_unimodular | G=ℝ, Γ=ℤ; G=SO(2), Γ={1} | ∫₀¹Σf(x+n)dx=∫_ℝf, c=1; c=1/λ(G); Δ≡1 both | OK | — |
| (r6) lattice_unimodular, Check 1 | affine group, g=(2,0), S=[1,2]×[0,1] | λ(S)=∫₁²a⁻²da=1/2; λ(Sg⁻¹)=∫_{1/2}^1a⁻²da=1=2·λ(S); Δ(g)=2 | Check correct | — |
| (r6) lattice_unimodular, mass argument | t=Δ(h)=2 | masses of [2ⁿ,2ⁿ⁺¹) all equal: total 0 or ∞, never 1 | contradiction as stated | — |
| (r6) lattice_unimodular, Check 2 | ℝ/ℤ vs ℝ/{0} | Haar probability exists vs none; Δ=1 in both | not an equivalence, correct | — |
| (r6) `lattice_invariant_probability_unique` route | ℝ/ℤ, F=[0,1) and F′=[1/2,3/2); λ′=3·Leb | μ(image [0,1/2))=1/2 via F and via F′; 3/2 ÷ 3 = 1/2 | independent of F and of the scaling of λ | — |
| (r6) same, null sets | E=ℚ/ℤ | μ(E)=0, λ(ℚ)=0 | Check correct | — |
| (r6) same, degenerate | G=ℝ, Γ={0}; G noncompact, Γ={1} | no invariant probability: vacuous | OK | — |
| (r6) same, SL₂ | F⊆ standard fundamental domain | λ(F) ≤ 2π·2/√3 ≈ 7.255, c=1/λ(F) | finite, positive | — |
| (r6) §5.3k scaling as used | ℝ/ℤ, λ=2·Leb | ν(X)=2=2·1 | follows from uniqueness | — |
| (r6) §5.3k inversion | Γg·h ↦ h⁻¹g⁻¹Γ | right invariance on Γ\G becomes left invariance on G/Γ | consistent | — |
| (r6) scalarLpKoopman, Check 4 (p≠∞) | Lebesgue on ℝ, 1_[0,1]; p=1, p=∞ | ‖1_[t,t+1]−1_[0,1]‖₁=2abs(t)→0; ‖·‖_∞=1 for t≠0 | p≠∞ needed | — |
| (r6) scalarLpKoopman, Check 3 (ℤ on the circle) | α=√2−1, k=1 | e(−0.4142) vs e(0.4142); 2α≈0.828∉ℤ | Check correct | — |
| (r6) §4.9a Koopman paragraph | X=ℝ/ℤ, p=2 | 1↦1, ‖1‖=1, 1∉L²₀; fixed vectors in L²₀: 0 | OK | — |
| (r6) ANT I contract (README:73) | D(14); counts r=1,2 | {1,2,5,10,13}; 3, 1 | names exist at the ANT I head | — |
| (r6) Ring/Finset lines | Mathlib pin | `prod_one_add` 199–200; `sum_pow_mul_eq_add_pow` 236–239 | correct | — |
| (r6) §3.4 Lemma 11.1 | k=ℓ=1 vs k=1, ℓ=2 | p^0/(1−1/p)²(1−p^(−31/30))¹⁰ vs p/(1−p^(−31/30))¹⁰ | matches KM p.288 | — |
| (r6) §0.1a IsCompletelyAdditive | Ω at 4; ω at 4; log; v_p at 0 | Ω(4)=2=1+1; ω(4)=1≠2; log 1=0; 0.factorization p=0 | Ω, log, v_p completely additive; ω not | — |
| (r6) §0.1a map_pow | f=Ω, n=2, k=0,3 | f(1)=0; Ω(8)=3 | OK | — |
| (r6) §0.1a factorization formula | n=12, f=Ω; n=1 | 3; 0 | OK | — |
| (r6) §0.1a powOfAdditive | k=1; f=0; k=0 | 1; k^0=1 | OK | — |
| (r6) §0.1a 2^ω multiplicativity | 12=4·3; 4=2·2 | 4=2·2; 2≠4 | multiplicative, not completely | — |
| (r6) §0.1a powOfAdditive_mul for Ω | 4=2·2 | 4=2·2 | completely multiplicative | — |
| (r6) §0.1a isMultiplicative_of_eq_monoidHom at 0 | m=0, n=1 | g(0)=g(0)·1 | OK | — |
| (r6) §0.2 primeDivisibilitySum | ({2,3},p) at 12, 0, 1; ({2},2) at 4 | 5; 0; 0; 2 vs 4 | OK | — |
| (r6) §0.3 divisibility, lcm | N=5,d=2; N=12,(4,6); N=5,(2,3) | 2/5, e=−1/10; 1/12; 0 vs 2/25 | OK | — |
| (r6) §0.4 moments | N=5, P={2,3}; N=6 | mean 7/5, pair −1/15; A=2, V=3, 9/5 | OK | — |
| (r6) §0.5 patterns | ({2,3},5), ({2,3},6), ({2,4},4); S={2},T={3},N=5; S=∅,T={2,3},N=6 | 0; 1/6; 1/4 vs 0; 2/5 (model 1/3); 1/3 | OK | — |
| (r6) §0.5 summed error | N=5, P={2,3} | 1/3 ≤ 9/5 | OK | — |
| (r6) §0.7 residues | N=5,d=3; N=2,d=5; A={1,2}; F=±1 | 1/5,2/5,2/5; 4/15; 6/5; 2/15; 4/15 | OK | — |
| (r6) §0.8 CRT | q=(2,3),N=5; q=(4,9),N=36; N=2 | 0, 1/5; 1/36; 17/9 | OK | — |
| (r6) §0.9 excess | D(72); means N=4,12,16; tails N=12 | 3; 1/4, 5/12, 1/2; 1/3, 1/12, 0 | OK | — |
| (r6) §0.11 Euler bounds | M=4; M=3; p=2,N=2; base 2; M=8 | 9/8; 1; 1/8; 9/4; 19/16; 5/8, 1/8, 5/32 | OK | — |
| (r6) §0.11 local term | p≥2 | 1/(p(2p−3)) ≤ 2/p² ⟺ 6 ≤ 3p | OK | — |
| (r6) §0.12 concentration | atoms 0,1; δ=1/2; Dirac | 1/2; 0 | OK | — |
| (r6) §0.13 rough comparison | N=4, y=2 | sum 1/4, TV 1/8 | OK | — |
| (r6) §1.1 ν_p | p=3, e=3,4; p=2 | 2/27, 2/27 ≤ 2/9; 0; 1/4 | OK | — |
| (r6) §1.1 M₄ | P={2,3} | 203/432 | OK | — |
| (r6) §1.3 even bound | P={2,3} | V=17/36, 3V²=289/432, diff −43/216; Q=145/1296 | OK | — |
| (r6) §1.4 cutoff | n=60,z=3,5; n=8,z=3/2; n=30,z=2 | 2,1; 0; 0,1; 2 log 2 ≤ log 30 | OK | — |
| (r6) `turan_kubilius` N=2 | f(2) | f(2)²/2 vs 30f(2)² | OK | — |
| (r6) §2.1–2.2 Checks | n•(1/2); two-sided | δ₀, δ_{1/2}; halves differ | discriminate | — |
| (r6) `weyl_polynomial` | α₂=1/2 vs √2 | 2•(1/2)=0 | hypothesis needed | — |
| (r6) `polynomial_haar_mixture` | s=0; d empty | S={0}; one point | OK | — |
| (r6) §2.6 subtorus | M=(2); M=(1,1)ᵀ | Haar; 1, 0 | OK | — |
| (r6) §2.7 Erdős–Turán | S–P Thm 1.11.2.1, s=1 | 3/(H+1); 3 | matches Lean | — |
| (r6) `starDiscrepancy` | {0}; {1/2}; ∅ | 1; 1/2; 0 | OK | — |
| (r6) §3.2 KM Lemma 5.3 | q=2,r=3,ψ=3/10 | M=9/10<1; overlap 1/6 | 2M ≥ gcd | — |
| (r6) `hausdorff_duffin_schaeffer` | f(r)=r², k=1 | 0=0 | true | — |
| (r6) `duffin_schaeffer_dimension` | all t<1 divergent; t₀ | min(⊤,1)=1; t₀ | OK | — |
| (r6) §3.9 Cantor | radii 1/16, 1/64, f=√r | 1/4, 1/8 | OK | — |
| (r6) §3.9 Lemma 7 | c=3 | 5 r_A | OK | — |
| (r6) §4.1 truncation | successor L=2; Bool flip | U=2; τ=2,1 | OK | — |
| (r6) `birkhoff_pointwise(_ergodic)` | one point; swap | 2; 1/2 | OK | — |
| (r6) §4.4 Gauss measure | (0,1]; (1/2,1] | 1; log(4/3)/log 2 | OK | — |
| (r6) §4.5 words | v_[1,2](0), v_[2,1](0) | 2/3, 1/3; det² 1 | OK | — |
| (r6) §4.6 mixing | identity; swap | 1/2 vs 1/4; no limit | OK | — |
| (r6) §4.6 density bounds | tail preimage | m(B_n) ≥ log 2·μ(B) | OK | — |
| (r6) §4.7 constants | digit 2; Lévy | log(9/8); 1.1866 vs 0.4812 | OK | — |
| (r6) §4.8 operators | L1(0); Lh; P1; P(id)(0) | π²/6; h; 1; π²/6−1 | OK | — |
| (r6) §4.9 contraction | c₁…c₄, tail, total | 1/2; 5/72; 7/216; 19/800; 1/4; 0.8756<0.9 | OK | — |
| (r6) `density_uniform_error`, `gauss_kuzmin` | n=0; a=1 | −0.4427; 1/2 vs 0.4150 | OK | — |
| (r6) `howe_moore_of_cartan` | G=ℝ, e^{it}; compact G | hypothesis fails; cocompact=⊥ | OK | — |
| (r6) `howe_moore`, `moore_ergodicity` | SU(2); S compact | vacuous; excluded | OK | — |
| (r6) `mahler_relativelyCompact_iff` | n=0,1; a_t | trivial; e^(−t) | OK | — |
| (r6) §4.9b Haar density | d₄ on [0,1]×[1,2] | 1/2; 16, 4 log 2 fail | OK | — |
| (r6) `modular_timeOne_mixing` | a₁; a_t⁻¹n_xa_t | e, e⁻¹; n_{e^(−2t)x} | OK | — |
| (r6) §4.10 conventions | t=log 2, x=1; golden x | [[2,2],[0,1/2]]; 0.618 | OK | — |
| (r6) `shortMean`, MR Check | f=1 | 3/2; difference 0 | OK | — |
| (r6) §5.1 inclusion–exclusion | {2},{3} at 6,2,1 | 1, 0, 0 | OK | — |
| (r6) `logCorrelation` | λ, x=w=2,4 | 1/(2 log 2); −1/12; 13/12 | OK | — |
| (r6) §5.2 twisted Liouville | χ₀ mod 2, x=3 | 7/6 vs 1/2 | OK | — |
| (r6) §5.1a entropy | (1/2,0,1/4,1/4) | 0.4774 + 0.5623 = (3/2) log 2 | OK | — |
| (r6) §5.3 models | R(4), R(6), S(12); N=4 | 0, ξ₂ξ₃, ζ₂²ζ₃; 3, 4 | OK | — |
| (r6) `liouville_two_point_nontrivial` | h=1, X=4 | −2; 1/2<1 | OK | — |

## Not verifiable

- These sources are waived and cited by locator only: BHV2007, Koukoulopoulos2019, Kubilius1964, RS1962, Falconer1990, PollingtonVaughan1990, Rogozin1961a, Rogozin1961b and IK2004. None of their locators is in the changed text.
- Ownership was checked against main and the 466 open heads that the roadmap tools index. That index still holds this pull request at its earlier head; this folder was read directly at d311ebe. Nothing unindexed was searched.

## Source issues

- none
