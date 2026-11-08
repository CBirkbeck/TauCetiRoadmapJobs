# Review of SieveMethodsAndPrimePatterns (pull request #1495 at eecdf1d)

**Verdict:** needs changes

This is a full review: the folder changed by 859 lines since 39cf901. The gate fails on one TeX hit (R03). The other findings are listed below, blocking ones first.

## Previous findings

The previous review (at 39cf901) had no findings and accepted. The two repairs it confirmed from the review before it still stand at this head:
- `README.md:45` pins Mathlib `1b1ccf4b…` and Tau Ceti `2fd255d9…`. These equal the `lake-manifest.json` revisions and the checked-out package heads.
- `README.md:1141` keeps the HB-SIEVES Lemma 3.1 locator with its stated extension, and `README.md:1153` keeps `ArithmeticFunction.sum_Ioc_mul_eq_sum_sum` and `ArithmeticFunction.sum_Ioc_mul_zeta_eq_sum`.

## R01 (P2) — Strong approximation has two owners: §5.3a and AdelicAlgebraicGroups §4.2

**Location.** `README.md:3530–3609` (§5.3a) and `README.md:13`: "This roadmap also owns … adelic points with strong approximation for simply connected semisimple groups (§5.3a)". Also `Suggested.lean:736–789` (`SieveStrongApproximation`) and the three `TauCeti.Algebra.AlgebraicGroup.*` imports at lines 4–6.

**Claim.** §5.3a re-plans the adelic points of a Hopf algebra with their evaluation topology, the strong-approximation predicate, the S-arithmetic lattice and Borel density, weak approximation and the Kneser–Platonov theorem. The open AdelicAlgebraicGroups pull request (#792) owns all of these. It does not cite this roadmap, and a roadmap on main consumes its version.

**Witness.** AdelicAlgebraicGroups at the head of #792, §4.2, "Strong approximation for semisimple groups", has *Lean:* `Approximation.hasStrongApproximation_of_simplyConnected`. Its hypothesis is the same encoding (injective Hopf maps, nonsurjective scalar map) and its Checks are the same (SL_n, definite quaternion, product). AA.1 owns the evaluation topology. Main's `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:21` takes strong approximation from AdelicAlgebraicGroups §4.2.

**Repair.**
- Delete §5.3a and the `SieveStrongApproximation` block with its three imports.
- Add `### From TauCetiRoadmap.AdelicAlgebraicGroups`: §4.2 "Strong approximation for semisimple groups", and Layer 1 for integral models and S-integral points, at the strength §5.4 uses.
- Repoint the §5.3a citations at `README.md:3620`, `3676`, `3761`, `3770` and `3871`. Drop strong approximation from the ownership sentence (line 13), from line 19 and from the module docstring's headline list.
- Remove the supplier text and references that only §5.3a uses: the ReductiveGroups paragraph (line 135), the GlobalNumberFields Layers 1/6 sentence (line 87), and CONRAD-12, RAPINCHUK-14, PR-94, PLATONOV-69, BOREL-63 and SCHNEIDER-11.

Tested: a scratch copy of the README with that supplier section passes the dependency check with `moved: SieveMethodsAndPrimePatterns moved in the merge order from #54 to #55, right after its last supplier AdelicAlgebraicGroups` and `0 problem(s)`. There is no cycle, because AdelicAlgebraicGroups cites nothing of this roadmap.

If §5.3a is kept instead, AdelicAlgebraicGroups must be changed to cite it. The CONRAD-12 locator must then also add Proposition 2.1 and Examples 2.2–2.3 (pp.2–3), which carry the topological-group and discrete-diagonal laws that Theorems 3.4/3.6 (pp.5–6) do not.

## R02 (P2) — Chen's theorems and Maynard's 12- and 600-gap theorems are stated only conditionally on small, true numerical facts

**Location.** `Suggested.lean:662–678` and `722–729`: `chen_goldbach (hU : ChenUpperEnvelope) (hL : ChenLowerConstant)`, `chen_prime_shift`, `maynardM_five_ge (h : MaynardFiveRecord)`, `frequently_nth_prime_succ_sub_le_600 (hM …) (hH : Admissible105Diam600)` and `elliottHalberstam_gaps (… hH5 : Admissible5Diam12 …)`. Also `README.md:21`: "Finite verifications and numerical records are never computed here."

**Claim.**
- The unconditional statements are statable. They were stated at 39cf901 and are the theorems the Summary promises ("Chen's prime-plus-almost-prime theorem").
- The finished roadmap would now prove only conditional versions, because the README says these propositions are "never proved here".
- Most hypotheses are small worked examples, which are welcome as Checks; the Check "{0,2,6,8,12} is admissible" was deleted.
- `MaynardFiveRecord` attributes I₅ = 29509/1222452000 to Maynard (8.17). Maynard prints only the ratio (MAYNARD-2015 line 2026).

**Witness (computed with exact rationals and copies of the Lean definitions).**
- `ChenUpperEnvelope`: the seven-term sum is 0.4924632564 < 0.49255.
- `ChenLowerConstant`: 8(log 4 − ½log 8 + V) = 2.6408077 > 2.6408.
- `MaynardFiveRecord`: I = 29509/1222452000 and ΣJ = (1417255/708216)·I.
- {0,2,6,8,12} and H₁₀₅ (MAYNARD-2015 lines 373 and 380–385) are admissible.

**Repair.**
- State `ChenUpperEnvelope`, `ChenLowerConstant`, `MaynardFiveRecord`, `Admissible5Diam12` and `Admissible105Diam600` as README targets with the values above, and restore the {0,2,6,8,12} Check.
- Drop them as hypotheses of `chen_goldbach`, `chen_prime_shift`, `maynardM_five_ge`, `elliottHalberstam_gaps` and `frequently_nth_prime_succ_sub_le_600`.
- For the k=105 certificate, choose one:
  - state `four_lt_maynardM_105` unconditionally, with the target "a rational vector on the 42 monomials has ΣJ > 4I". The certificate printed at 39cf901 gives ratio 4.000543795842… under the Lean `maynardGramI` and `maynardGramJ`.
  - or keep `MaynardCertificate105` as the one hypothesis and say in the Summary that the 600 bound is conditional on it.

## R03 (P3) — Gate failure: TeX subscript at README line 1792

**Location.** `README.md:1792`: "Apply the diagonal/off-diagonal Gram inequality of §0.4 to the tapered vectors φ_{N,L}(x_i) and f."

**Claim and witness.** The gate's `tex` scanner fails on `_{` outside a code span. My rerun of the gate on this head prints `tex=1` and `FAIL`; every other check is 0.

**Repair.** Write `φ_(N,L)(xᵢ)`, or put the expression in a code span.

## R04 (P3) — Kernel reciprocity lost its only non-degenerate Check when it moved into §5.6

**Location.** `README.md:4065–4079`, the Checks of "Kernel reciprocity for joint spins": "With α=β=3 both kernels vanish …" and "Φ(α,1)=Φ(1,α)=1".

**Claim.** Neither Check exercises the sign ε(α,β). A rule with the infinite-place factors dropped passes both. The removed supplier contract carried a witness with ε = −1.

**Witness (recomputed).** Take M=ℚ(t) with t³+t²−2t−1=0, σ(t)=t²−2, α=1+8t and β=1+16σ(t). The norms are 377=13·29 and 3569=43·83. Then Φ(α,β)=1 and Φ(β,α)=−1, with dyadic factor 1 and infinite-place factor −1, so 1=(−1)(−1).

**Repair.** Restore this example as a Check of kernel reciprocity.

## R05 (P3) — The Lang–Weil estimates this roadmap now owns are neither stated in Suggested.lean nor named as not statable

**Location.** `README.md:3622` and `3636` (§5.4), and the module docstring at `Suggested.lean:8–43`. The docstring lists the other moved-in inputs (Henk, Davenport, strong approximation) as headlines but says nothing of Lang–Weil.

**Claim.** InverseGaloisAndArithmeticFundamentalGroups (#850, its README line 296) now consumes "Lang–Weil estimate for a fixed model" from §5.4. The uniform affine estimate is statable at the pins.

**Witness.** This statement elaborates against the pinned Mathlib with `sorry` as its only warning (scratch file):

    ∃ C, ∀ k [Field k] [Fintype k] (S : Finset (MvPolynomial (Fin n) k)) e, S.card ≤ r → (∀ f ∈ S, f.totalDegree ≤ d) → (radical of the span of S over AlgebraicClosure k).IsPrime → ringKrullDim (quotient) = e → |Nat.card (zeros of S in k^n) − q^e| ≤ C q^(e−1/2)

**Repair.** State the uniform estimate in `Suggested.lean`, or name both estimates in the docstring as not statable, with the missing carrier.

## R06 (P3) — The AnalyticNumberTheoryPartI supplier contract omits §§3.3–3.4, which §5.6 consumes

**Location.** `README.md:4028` and `4036`: "sum by the norm-fibre divisor majorant of AnalyticNumberTheoryPartI §§3.3–3.4". The contract at `README.md:67–75` and the list at line 13 do not name these sections.

**Witness.** AnalyticNumberTheoryPartI at #1126 has §3.3 "Uniform coefficient bound by a divisor function" (a_K(m) ≤ d_n(m)) and §3.4 "Subpolynomial fixed-order divisor function".

**Repair.** Add §§3.3–3.4 to the AnalyticNumberTheoryPartI contract, with these two statements.

## R07 (P3) — The design's twelve gaps are not stated in the README, which owns every one of them

**Location.** `packages/SieveMethodsAndPrimePatterns/design/plan.json` declares 12 gaps:
- analytic-divisor-moments, uniform-wirsing, maximal-small-conductor, extremely-smooth-tails, curvature-uniform-lattice and subgroup-strong-approximation;
- squarefree-ring-sum-product, sl2-noncommutative-flattening, quadratic-order-conductor-counts, bounded-degree-lang-weil, jutila-unweighted-mean-square and joint-spin-proof-strengths.

`README.md` contains no `gap:` contract. Lines 17–19 say these items are owned here, in §§0.9, 0.11, 1.1, 1.4, 2.7, 3.0, 5.4 and 5.6.

**Claim.** Once announced, each gap asks a supplier for something this roadmap already provides. For example, `gap:subgroup-strong-approximation` asks AdelicAlgebraicGroups for the subgroup reduction images of §5.4, which invites a second owner.

**Repair.** Withdraw the 12 gaps from the plan, recording that the README owns them; no README change is needed. If a gap is to stay, state it as `What <Supplier> must provide (gap:<slug>): …` and delete the duplicate target here.

## Verified sound

**Gate and dependencies.**
- The worker's gate and my rerun both fail only on `tex=1` (R03). Every other scanner is 0, and `build=0` in the worker's run.
- Dependency check, verbatim: `depcheck: 236 roadmaps, 2419 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- This roadmap is `ORDER.txt` line 54, right after AnalyticNumberTheoryPartII (53). AnalyticNumberTheoryPartI is line 51.
- The folder contains only README.md, Suggested.lean and metadata.toml, and the diff outside the folder is empty.

**Lean.**
- `lake env lean Suggested.lean` exits 0 with exactly 44 `declaration uses sorry` warnings and nothing else.
- My own `#check @name` file over all 87 declarations elaborates with no error and matches `signatures.md`. Its one lead (`InfinitePoints` lacks `[NumberField F]`) is harmless, because `NumberField.InfiniteAdeleRing F` needs only `[Field F]`.
- One-tactic padding probe: I replaced every `sorry` by `first | rfl | simp | norm_num | infer_instance | positivity | sorry`. All 44 `sorry` warnings remained.
- Instance probe: inside the namespace, the topology on `AdelicPoints` and `InfinitePoints` is `rfl`-equal to `evaluationTopology`, and outside the namespace no instance exists. So `HasStrongApproximation` uses the intended topology.
- Library names: 249 `#check` lines over every backticked library name in the README; 241 elaborate at the pins. Of the other 8:
  - two belong to other roadmaps (`Decomposition.kneserTits_local` in ReductiveGroupsPartII RG2.4.4, `zetaFourthMoment.divisorDiagonal` in AnalyticNumberTheoryPartI §3.24);
  - `NumberField.Units` is a namespace;
  - five Tau Ceti names were simply not imported by my probe, and each is at its cited place: `VonMangoldt.lean:82` and `:178`, `Convolution/Basic.lean:366`, `FundamentalDiscriminant/Character.lean:38`, and `Semialgebraic/Basic.lean:75` (`TauCeti.IsSemialgebraic`).
- Tau Ceti `SemisimpleCommHopfAlgCat` encodes finite type, smooth, geometrically connected and semisimple, and `simplyConnectedSemisimpleCommHopfAlgProperty` means every central isogeny onto the group is an isomorphism. `ZLattice.successiveMin` is zero-based on `Fin (finrank ℝ E)`.

**Cross-roadmap citations resolved.**
- On main:
  - SuccessiveMinima 1.2 and 1.11, whose scope excludes lattice-point counting;
  - RealAlgebraicGeometry Layers 5–6;
  - SchemeAndStackFoundations §0.8 (`generic_fibre_spreading`, `fibre_locus_constructible`), §5.11 (`weil_bound`) and §5.12 (`bezout_inequality`);
  - ReductiveGroups Layers 6, 7 and 7a;
  - ReductiveGroupsPartII RG2.0, RG2.3 and RG2.4.4;
  - GlobalNumberFields Layers 1, 3/3C, 6 and 11;
  - ThetaSeries 2H, QuadraticFormInvariants 6C (`hilbertSymbol_eq_cohomological`), ClassFieldTheory Layer 14, Chebotarev Layer 13, Isoperimetry I2 and RiemannianGeometry R4.9.6a;
  - IntegralLattices Layers 0 and 3 (lines 507 and 829). This shows the `overlaps.md` lead is false: the tool misses level-3 headings.
- AnalyticNumberTheoryPartI (#1126): §§0.10, 0.11, 0.18, 0.21, 0.26, 0.31, 0.32, 0.34 (`landau_siegel_exclusion`, §0.34c), 1.5a (3π/2), 3.1, 3.3, 3.4, 3.22, 3.24, 3.26, 3.34 (`smoothCount_dickman`) and 3.35.
- AnalyticNumberTheoryPartII (#1167): §5.29. The contract example M=1, N=3 gives squared sums 0 and 4 against energy 2.

**Ownership of the material moved into this roadmap.** Every former owner now cites this roadmap, so each object has one owner, except strong approximation (R01):
- GeometryOfNumbersAndQuadraticArithmetic (#851, lines 221 and 248) cites §0.11a by its Lean names;
- InverseGaloisAndArithmeticFundamentalGroups (#850, line 296) cites the §5.4 fixed-model Lang–Weil estimate;
- ArithmeticStatisticsPartV (#1175, line 60) cites §5.6;
- ErdosProgressionPowers (#1336, line 108) cites §0.4;
- ArithmeticStatisticsPartIII (#1174) states only weaker fixed-model and hypersurface forms (§§2.1, 2.23) and takes Davenport's lemma through GeometryOfNumbersAndQuadraticArithmetic.

AnalyticNumberTheoryPartI §3.36b states a Selberg rough-progression bound. It is a fixed instance on its own carrier, not the general `BoundingSieve` bound of §1.3. No Suggested.lean name repeats a fully qualified name of another roadmap.

**Sources read at the locators** (seeded sample and new references).
- KED-ANT-11 Lemma 11.2 (line 411) and Definition 11.6 (line 500), for §0.3.
- KHAYUTIN-19 Definition 10.5 (line 4802, printed p.242), Proposition 10.10 (line 4950, p.245) and Remark 9.5 (p.222), for §§0.9 and 0.11.
- BSKK-23 notation and Lemma 8.2 (lines 2246–2269, p.39), for §0.10.
- HB-SIEVES, for §§1.6, 5.2 and 5.5:
  - Corollary 3.1 (line 588, p.12), Corollary 3.2 (p.14), (3.3) (line 861, p.16), (3.5)–(3.6) (pp.17–18) and Corollary 3.3 (p.21);
  - A± and (4.2) (pp.24–25), (5.1)–(5.3) (pp.30–33), Theorem 5.1 and Corollary 5.1 (pp.35–36) and the Fundamental Lemma (p.38);
  - (6.1)–(6.4) (pp.39–44), Theorem 6.1 (p.42), Chen's theorem (p.46) and (6.7) (p.47).
- KED-chap-largesieve Lemma 15.4 (line 476), for §2.6.
- KED-chap-bombieri Theorem 17.4 (line 431) and KED-ANT-18 Theorems 18.3–18.5, Corollary 18.6 and Exercises 18.4.4–18.4.5 (lines 429–670), for §3.4.
- MAYNARD-2015, for §§4.3–4.7:
  - Propositions 4.1–4.3 (pp.388–390);
  - footnote 2 and the proof of Theorem 1.4 (lines 373–385, p.390);
  - Lemma 8.1 (p.409), Lemma 8.2 (p.410) and (8.15)–(8.17) (p.412).
- SS-23 p.674 (line 44), for §4.8.
- IWA-ROSSER Theorem 1 (pp.172–173) and Theorem 4 (pp.176–177), for §5.2. Each scan page holds two printed pages.
- BENNETT-SIKSEK-2020 Theorem 7 (line 1046, p.379), for §0.4.
- HENK-02 Theorem 1.5 (line 109, p.3), (1.3) (p.2), Lemma 2.1 (p.4) and (2.1)–(2.5) (pp.3–5), for §0.11a.
- RAPINCHUK-14 Definition (p.7), Theorem 2.3 and Remark 1 (p.12), §2.6 and Lemma 2.7 (p.16), for §5.3a.
- BOREL-63 Introduction (printed p.6) and §8 (pp.26–30), for §5.3a.
- CONRAD-12 Theorems 3.4 and 3.6 and Remark 3.5 (pp.5–6); see R01 for the laws they do not carry.

**Adversarial table** (computed values; scripts in the job's scratch directory: maynard.py, chen.py, kernel.py, vaughan.py, gram.py, adm.py, LangWeil.lean).

| Statement (line) | Instance | Values computed | Result |
|---|---|---|---|
| §0.3 residue sieve (381–386) | Q={2}, Ω₂={1}; samples 0 (w=2), 1 (w=3) | sifted 2; a divisibility-only reading gives 3 | holds |
| §0.3 mixed data | Ω₂=∅, Ω₃={1}, samples −2…3 | P=3; survivors 4 of 6 | holds |
| §0.3 label size | bad {0,−2}, Q={3,5,7,11}, sample 33 | L(33)=3·5·7·11=1155 | holds |
| §0.3 density | Ω₂={1}, ν(4) | prodPrimeFactors gives 1/2; complete multiplicativity gives 1/4 | holds |
| §0.9 r_Λ (ℤ[i]) | n=1,5,25,3,9 | 1,2,3,0,1; complete multiplicativity gives r(9)=0 | holds |
| §0.10 norms | ‖T³‖ at p=2; (T over 𝔽₂, T² over 𝔽₃) | 8; 2·9=18 | holds |
| §0.10 dependence | equal Bernoulli constant terms | Pr(T divides both)=1/2, not 1/4 | holds |
| §0.10 irreducibles | 𝔽₂, j=1,2 | Π=2,1; jΠ_q(j) ≤ 2^j; Σq^(−deg) to degree 2 = 5/4 ≤ 3/2 | holds |
| §0.4 Gram family (Lean 59–80) | 3000 random ℂ-families, zero and repeated rows | max violation 0.0 for weighted, row, max-row, diag/offdiag | holds |
| §0.4 worked values | x=1, y=(1,2); two equal unit vectors | rows 3,6; 5 ≤ 6; weighted 1=1; 2 ≤ 2 | holds |
| §0.11a Henk (Lean 115) | [−1,1]²; [−1,1]×[−1/3,1/3]; d=1, [−1,1] | 9<18; 3<6; 3=3, so strictness needs d≥2 (as stated) | holds |
| §0.11a Davenport (Lean 145) | n=1 | sSup ∅=0, so the bound is C | holds |
| §0.11a Davenport | unit square under (x,y)↦(x,y+Mx) | 4 points, volume 1; the projections of E have length 1 (those of A(E) have M+1) | holds against the original E's projections |
| §1.6 interval (Lean 186) | x=y=2 | π(4)−π(2)=1 ≤ 4/log 2=5.77; loglog 6=0.583>0 | holds |
| §1.6 twin/Goldbach (Lean 192) | N=4; x=3 | count 1 ≤ 2.08C; count 1 ≤ 2.49C | holds |
| §1.6 local factors | N=6 and N=10 at p=3; p=5 | ratios 2 and 1; (4/5)²·15/16=3/5 | holds |
| §1.6 strict diagonal | support {3,5}, z=5 | 1+2=3; at z/2 only d=1; d=5 would add 2/3 | holds |
| §1.6 progression (Lean 201) | k=1, a=0 (gcd 1) | reduces to π(x) ≪ x/log x; at x=4k, log 4>0 | holds |
| §1.6 parity | n=1, 4, 12, 0 | even, even, odd (Ω=3), both weights 0 | holds |
| §2.6 duality | J=∅, I≠∅, C<0 | hypothesis 0≤0 true; conclusion 0≤C·Σ‖b‖² false | C≥0 needed, as stated |
| §3.4 variance | δ₁, x=1, Q=3 | D=±1/2 at q=3; variance 1/2 = conductor sum 1/φ(3) | holds |
| §3.4 cofactor | r=4, s=2 | φ(8)=4 against φ(4)φ(2)=2 | holds |
| §3.4 log split | L=10, Δ=1/100 and 1/2 | 0.01 ≤ 1; 10 ≤ 50; equal at ΔL=1 | holds |
| §3.4 correlation (Lean 498) | Δ=1/16, x=16, y=1, Q=2 | √3·√3=3 against √(297/8)=6.093 | holds |
| §3.4 transfer | y=2: q=2,a=1 and q=1 | discrepancies 0 and 1; li(y)→−∞ as y↓1 | holds |
| §2.4 Vaughan (Lean 383) | n<200, U,V≤11, zero cutoffs included | 28,800 cases; max error 1.8e−15 | holds |
| §2.8 Farey (Lean 366) | ℓ=m=0; ℓ=1, m=2 | 1=1; (c,h)↦(c,−ch) injective, LHS ≤ Σf₀Σf₁ | holds |
| §2.7 Jutila (Lean 302) | X=3, Y=1 | only D=−3 counts: 1 ≤ 6.37C | holds |
| §4.3 functionals | triangle; F=x on the triangle; cube constant | I=1/2, J=1/3, ratio 4/3; I=1/12, J=1/20 and 1/30; ratio 2 | holds |
| §4.3 kernel example | ∂ₓ∂ᵧ[x²y²(1−x−y)²] | fibre integrals are boundary values of ∂_y g, which vanish at x=0 and x=1−y | J=0, as stated |
| §4.3 shrink/mollify | k=4, η=1/10 | u=(1/30)⁴ gives sum 31/30>1, excluded by r<1/40; ±1/80 gives 19/20, 17/20; 7/80>0 | holds |
| §4.3 edge cases | k=0; k=1 | M₀=0 (ratio 0/I); indicator I=J=1, M₁=1 | holds |
| §4.6 simplexMoment (Lean 600) | k=5, a=2, b=0; k=1, a=0, b=1 | 1/2520 (printed formula: 0); 1/2 | holds |
| §4.6 MaynardFiveRecord (Lean 639) | exact, Lean definitions | I=29509/1222452000; ΣJ=40493/838252800=(1417255/708216)·I | true (R02) |
| §4.6 MaynardCertificate105 (Lean 646) | the 39cf901 vector, 42 monomials | I>0; ΣJ/I=4.000543795842186 | true (R02) |
| §4.6/4.7 admissible sets (Lean 653, 658) | H₁₀₅; {0,2,6,8,12}; {0,2,4} | 105 distinct in [0,600], admissible; admissible; fails at 3 | true (R02) |
| §4.5 clusters (Lean 568) | k=0; k=1; θ=1 | ⌈0⌉=0 ≤ 0; ⌈θ/2⌉=1; PrimesHaveLevel 1 is false (q∈(x/2,x] has a class with discrepancy ≥ 1/2) | holds; θ=1 vacuous but harmless |
| §4.7 first k primes | k=5 | {7,11,13,17,19} misses 0 mod 5 | holds |
| §4.8 local conditions | X²+X+2; (X, X+1); X(X+2) | always even; fails at 2; odd at n=1, 8 at n=2 | holds |
| §5.1 roughness | n=8, z=2, k=2 | 8<8 false; Ω=3 | holds |
| §5.2 F, f | s=1,2,3,4 | F=2e^γ, e^γ; f(3)=0.8233, f(4)=0.9783 | holds |
| §5.2 Rosser weights | d=2, D=8; d=D=2; d=4 | upper 0, lower −1; 0; 0 | holds |
| §5.2 lower domain | g=1/p on [D^(1/4),D), s=1 | M⁻→1−log 4=−0.386, V→1/4, f(1)=0 | restriction needed, as stated |
| §5.2 Richert threshold | r=2, 3 | 1/Λ₂=0.545>1/2; 1/Λ₃=0.361 | P₃, not P₂, near level 1/2 |
| §5.3a predicate | G_a, S_f=∅; G_m | identity of the convolution group is x↦0, so the set is F+𝔸_∞, dense iff F is dense in 𝔸_f; ℚ^×∩∏ℤ_p^×={±1} | holds |
| §5.3a theorem (Lean 780) | trivial G; SL₁(D) definite; SL₂×SL₁(D) | hS vacuous and the point space is dense; hS fails at Q=G; hS fails at the factor | holds; duplicates AdelicAlgebraicGroups (R01) |
| §5.4 counts | xy=0 over 𝔽₃; x²+y²=1; x²=2 | 5 points; p−(−1/p); 0 or 2 against Nv⁰=1 | holds |
| §5.4 Lang–Weil (R05) | candidate Lean statement | elaborates at the pins with sorry only | statable |
| §5.5 Chen weight | N=1000: n=11, 286, 3, 27 | z=1.995, N^(1/3)=10; weights 1, 0, 1/2, 1/2 | holds |
| §5.5 local factor | N=6, 10, 18 | 2C₂, (4/3)C₂, C₁₈=C₆ | holds |
| §5.5 ChenUpperEnvelope (Lean 709) | as written | 0.4924632564<0.49255; the integral 0.4909952 is ≤ the envelope; 8·0.49255=3.9404 | true (R02) |
| §5.5 ChenLowerConstant (Lean 716) | as written | V=−0.0164726271; 2.6408077>2.6408; 2.6408−1.9702=0.6706 | true (R02) |
| §5.6 ideal symbol | (2/(5)), (4/(5)), (15/(5)); (2/(5O_K)) | −1, 1, 0; 1 in split, inert and ramified cases | holds |
| §5.6 reciprocity | 3,7; −1,−1 | −1=(−1)(1); 1=(−1)(−1) | holds |
| §5.6 kernel reciprocity | cyclic cubic witness (R04) | Φ(α,β)=1, Φ(β,α)=−1, ε=−1 | holds; Check missing |
| §5.6 savings | n=3, abs S=1, δ=1 | 54·3·37=5994; (x^(−θ)+y^(−θ))xy ≤ 2(x+y)^θ(xy)^(1−θ) | holds |
| §5.6 moments | X=4, k=2; ideal (4) | Σ_(n≤4)τ²=18; τ=3, Λ=log 2 | holds |

## Not verifiable

- PR-94 (Theorems 7.8 and 7.12, pp.415 and 427) and SCHNEIDER-11 (Theorem 27.1, Corollary 29.6, Theorem 29.8): printed books with no legal open copy. Not fetched.
- PLATONOV-69 (§3.4, p.1145): mathnet.ru timed out on two fetches through the sources service.
- DAVENPORT-51 and its 1964 correction: the Wiley DOI returns HTTP 403.
- LANG-WEIL-54: the JSTOR page has no open copy.
- CHEN-73-CN, RICHERT-1969, HR-SIEVE, DFI-1997 and BGS-10 are settled as waived or uncertified, and are cited by locator only.

## Source issues

- **Misprint** in HENK-02 at §1, before Conjecture 1.4, printed p.2 (line 79): the source defines ⌊x⌋ as the smallest integer not less than x, which is the ceiling; it should be the largest integer not greater than x, as the equality for boxes and Lemma 2.1's use require; affects nothing.
- **Gap** in KED-chap-largesieve at §15.2, Lemma 15.4: the source allows any real C; with no n-indices and C<0 the hypothesis holds vacuously while the conclusion fails; C≥0 or nonempty index sets is needed; affects nothing.
- **Misprint** in MAYNARD-2015 at §8, Lemma 8.1, printed p.409 (line 1728): G_{b,j} sums from r=1, so the lemma gives 0 at b=0; it should include the r=0 term with G_{0,j}=1; affects a stated result (the lemma at b=0), not (8.17), which the corrected form reproduces exactly.
