# Review of SieveMethodsAndPrimePatterns (pull request #1495 at f07c3fe)

**Verdict:** needs changes

This is a full review, because the folder changed by 185 lines since a0ce011. The gate passes on this head, and `Suggested.lean` elaborates with 44 `sorry` warnings and nothing else. There are seven findings, two of them blocking:
- R01 (P1): the deletion of §5.3a closes a supply cycle with AdelicAlgebraicGroups, and leaves strong approximation for simply connected groups without an owner at either head.
- R02 (P2): Koymans–Milovic's equidistribution of joint spin signs can be stated at the pins, but the module docstring declares it not statable.
- R03–R07 (P3): one leftover "hypotheses of §4.6" sentence, an unresolved supplier declaration name, two misattributed supplier contracts, and locator corrections.

## Previous findings

**R01 of the previous review (adelic carriers had two owners): repaired here, but the repair is incomplete across the two pull requests.**
- Repaired in this folder:
  - §5.3a, the `SieveStrongApproximation` block and its three `TauCeti.Algebra.AlgebraicGroup.*` imports are gone.
  - `README.md:133` adds "### From TauCetiRoadmap.AdelicAlgebraicGroups", citing §1.1 and §4.2.
  - The CONRAD-12, RAPINCHUK-14, PR-94, PLATONOV-69, BOREL-63 and SCHNEIDER-11 references are removed.
- Not repaired: the second half of that repair. AdelicAlgebraicGroups at the head of #792 (d2e6304, indexed after this head was pushed) still hands the same objects back to the deleted §5.3a. See R01 below.

**R02 of the previous review ("hypotheses of §4.6" wording): partly repaired.**
- Repaired: `README.md:2835` now reads "whose values are the finite evaluations stated as targets in §4.6", and `README.md:3134` reads "With the bounds M₁₀₅ > 4 and M₅ ≥ 1417255/708216 of §4.6".
- Not repaired: a third occurrence remains at `README.md:4193`. See R03.

## R01 (P1) — Strong approximation now has no owner, and this head closes a supply cycle with AdelicAlgebraicGroups

**Location.**
- `README.md:13`: "AdelicAlgebraicGroups owns … strong approximation with its proof chain (§4.2); §5.4 consumes them and restates neither."
- The same citation appears at `README.md:19`, `:135` ("§4.2 supplies the strong approximation predicate … and strong approximation for a connected semisimple simply connected group"), `:3629`, `:3714`, `:3723`, `:3824` and `:4119`.

**Claim.** AdelicAlgebraicGroups §4.2 does not state the strong approximation predicate, Borel density or the simply connected theorem. Instead it states that all three are supplied by "SieveMethodsAndPrimePatterns §5.3a", which this head deletes. So each roadmap hands the object to the other:
- this roadmap cites AdelicAlgebraicGroups §§1.1 and 4.2;
- AdelicAlgebraicGroups cites this roadmap at 15 places.

The result is a cycle, and the theorem that §5.4's primitive-pair reduction, local densities and squarefree expansion consume is planned nowhere.

**Witness.**
- AdelicAlgebraicGroups at #792, `README.md`:
  - lines 4023–4033 read "strong approximation with respect to `S` is the predicate `SieveStrongApproximation.HasStrongApproximation` … of SieveMethodsAndPrimePatterns §5.3a … *Lean:* none here";
  - lines 531–538 keep "### From TauCetiRoadmap.SieveMethodsAndPrimePatterns".
- Its `Suggested.lean:330` and `:348` still say "Supplied by SieveMethodsAndPrimePatterns: §5.3a".
- Running the dependency check on that README against the current merge order prints:
  - `UPWARD: AdelicAlgebraicGroups (#51) -> SieveMethodsAndPrimePatterns (#56) at README lines [127, 531, 4010, 4030, 4129, 4885]`
  - `CYCLE among: AdelicAlgebraicGroups, SieveMethodsAndPrimePatterns`

**Repair.** Complete the move that the previous review's first option described. The edit is in AdelicAlgebraicGroups (#792), and this pull request waits for it.
- AdelicAlgebraicGroups §4.2 states the following as its own targets:
  - the predicate, with the four properties §5.3a proved: density away from S, G(𝔸^S)=G(F)U, monotonicity in S, and the S_f=∅ double-coset consequence;
  - Borel density for S-arithmetic subgroups, together with the lattice theorem;
  - weak approximation and the simply connected theorem.
- Its `Suggested.lean` declares the predicate and `hasStrongApproximation_of_simplyConnected` under its own namespace, on its existing `AdelicPoints`, `diagonal` and `finiteProjection`. The deleted block of a0ce011 is a ready template.
- It deletes its §5.3a citations and its SieveMethodsAndPrimePatterns supplier contract.
- In this pull request's description, add #792 (AdelicAlgebraicGroups) to the "Depends on" list and the merge-order paragraph. They currently name only #1126 and #1167, although §5.4 now consumes AdelicAlgebraicGroups §§1.1 and 4.2.

**Tested.**
- A scratch copy of AdelicAlgebraicGroups' README with its citations of this roadmap removed gives `depcheck: 230 roadmaps, 2329 edges, 0 problem(s)`.
- This README gives `depcheck: 229 roadmaps, 2317 edges, 0 problem(s)`.

**Fallback.** If AdelicAlgebraicGroups will not take ownership, restore §5.3a from a0ce011, whose README also gives `0 problem(s)`. Then AdelicAlgebraicGroups must stop owning AA.1's adelic carriers, as in the previous R01.

## R02 (P2) — The joint-spin sign equidistribution is statable at the pins, but is declared not statable

**Location.**
- `Suggested.lean:28`: "The joint-spin chain and its sign-distribution endpoint lack the ideal spin and generator-domain carriers."
- `README.md:4087`, "Equidistribution of joint spin signs" (KM-21 Theorem 2), has no Lean statement.

**Claim.** The statement of KM-21 Theorem 2 needs no generator domain: that domain is used only in the proof of the Type I estimate. It needs only these:
- the quadratic residue symbol of §5.6, a product over the prime-ideal factorization;
- spin(σ,π)=(π/σ(π));
- a totally positive generator;
- Cₘ as a named hypothesis, exactly as `ElliottHalberstam` already is.

All of these have short real-bodied definitions on native carriers (`UniqueFactorizationMonoid.normalizedFactors`, `Ideal.absNorm`, `RingOfIntegers.mapAlgEquiv`, `DirichletCharacter`). The headline is therefore statable, and it is absent.

**Witness.** A scratch file elaborates under `import Mathlib` alone, with one `declaration uses sorry` and nothing else. It contains:
- `ShortCharacterConjecture m`, transcribing KM-21 line 340: real nonprincipal χ (χ²=1, χ≠1) of modulus 1<q≤Q, N≤Q^(1/m), bound C·Q^((1−δ)/m+ε);
- `residueSymbolPrime P α`: 0 on P, otherwise the sign congruent to α^((N P−1)/2), per KM-21 §2.1, line 153;
- `residueSymbol`, the product of `residueSymbolPrime` over `normalizedFactors`;
- `spin σ π := residueSymbol π (Ideal.span {RingOfIntegers.mapAlgEquiv σ π})`;
- a theorem over `[IsGalois ℚ K] [IsTotallyReal K]` that takes:
  - the hypothesis that every totally positive unit is a square;
  - S with σ⁻¹∉S;
  - `ShortCharacterConjecture (S.card * finrank ℚ K)`;
  - signs e;

  and concludes that the ratio of principal primes of norm ≤X having a totally positive generator with these spins tends to `1/2^S.card`.

**Repair.**
- Add these four declarations to `Suggested.lean` under a `SieveSpin` namespace in the Layer 5 section, with docstrings citing KM-21 Theorem 2, p.2.
- Name them in backticks in §5.6, at the quadratic ideal residue symbol adapter (line 3935), at Cₘ (line 143) and at line 4087.
- Replace the docstring sentence at `Suggested.lean:28` with: "The joint-spin coefficient sequence of KM-21 (2.4) and its Type I/II chain need the fixed modulus F and class-representative data of KM-21 §2.2; the sign-distribution endpoint is stated."

## R03 (P3) — One sentence still calls the §4.6 evaluations hypotheses

**Location.** `README.md:4193`, in the Lemma 8.1 source convention: "The numerical records (8.15) and (8.17) are the hypotheses of §4.6, stated for the Gram forms with `G_{0,j}` = 1."

**Claim.** §4.6 states these values as targets. The sentence contradicts the scope paragraph and the repaired lines 2835 and 3134.

**Witness.** `README.md:21` says each finite evaluation "is stated as a proposition about explicit numbers … and none is a hypothesis of the theorems that use it". `Suggested.lean:625` and `:629` (`maynardM_five_ge`, `four_lt_maynardM_105`) take no hypothesis.

**Repair.** Change the sentence to: "The numerical records (8.15) and (8.17) correspond to the Gram-form evaluations stated as targets in §4.6, computed with `G_{0,j}` = 1."

## R04 (P3) — `zetaFourthMoment.divisorDiagonal` is not declared by AnalyticNumberTheoryPartI

**Location.** `README.md:75`: "§3.24, `zetaFourthMoment.divisorDiagonal`, for Σ_(n≤Y)τ(n)²≪Y log³(2Y)". The same name appears at lines 2304, 2312, 2320, 2491 and 2529.

**Claim.** The cited supplier declaration does not exist where it is cited.

**Witness.**
- AnalyticNumberTheoryPartI at #1126 (979e68c):
  - its `Suggested.lean` namespace `zetaFourthMoment` declares only `asymptotic`;
  - its README §3.24 names only `zetaFourthMoment.asymptotic` (line 2931), and states the divisor-square estimate as an unnamed bullet (line 2938).
- `roadmaps grep --fixed divisorDiagonal` finds the name only in this README.

**Repair.**
- At all six lines, drop the backticked name.
- Cite instead "AnalyticNumberTheoryPartI §3.24, the divisor-square estimate Σ_(n≤X)τ(n)²=X(log X)³/π²+O(X(log X)²)".

## R05 (P3) — "Almost simple" is attributed to the wrong supplier

**Location.** `README.md:139`: "ReductiveGroups Layers 6–7a supply connected semisimple and simply connected groups, their almost simple factors and their rational points over finite fields."

**Claim.**
- ReductiveGroups on main does not mention almost simple groups or factors anywhere.
- The predicate used by every §5.4 target ("connected simply connected absolutely almost simple ℚ-group") is owned by ReductiveGroupsPartII.
- This head dropped the ReductiveGroupsPartII contract.

**Witness.**
- `TauCetiRoadmap/ReductiveGroups/README.md` on main returns no match for "almost simple" or "simple factor".
- `TauCetiRoadmap/ReductiveGroupsPartII/README.md:6371` reads "`Decomposition.IsAbsolutelyAlmostSimple` uses smooth connected normal Hopf-ideal subgroups …"; it is declared at `Suggested.lean:253` (RG2.4).

**Repair.**
- Restore "### From TauCetiRoadmap.ReductiveGroupsPartII": RG2.4 `Decomposition.IsAbsolutelyAlmostSimple` supplies absolute almost simplicity.
- Reduce the ReductiveGroups sentence to: "connected semisimple and simply connected groups (Layer 6) and their rational points over finite fields (Layer 7a)".

## R06 (P3) — Two SuccessiveMinima targets are already proved at the pinned Tau Ceti, and one Mathlib name is unqualified

**Location.**
- `README.md:119`: "SuccessiveMinima 1.2 `finite_gauge_sublevel` and 1.11 `exists_integral_minimum_flag` supply …".
- `README.md:1021`: "*Needs:* … `index_range_nsmul` …".

**Claim.**
- Both objects exist at the pinned Tau Ceti, in the file this README already cites. They should be cited there, not as roadmap targets.
- `index_range_nsmul` does not resolve: it lives in `namespace AddSubgroup`.

**Witness.** `TauCeti/Algebra/Module/ZLattice/SuccessiveMinima.lean`:
- `:300` `ZLattice.finite_setOf_gauge_le`: lattice vectors of gauge ≤r form a finite set;
- `:552` `ZLattice.exists_basis_mem_flag_of_gauge_lt_successiveMin`: a ℤ-basis whose real flags contain the strict sublevels.

`Mathlib/GroupTheory/IndexNSmul.lean:39` declares the lemma inside `namespace AddSubgroup`, and `#check @index_range_nsmul` fails.

**Repair.**
- Cite the two Tau Ceti declarations, with that file, in the SuccessiveMinima/Tau Ceti paragraph and the §0.11a *Needs*.
- Write `AddSubgroup.index_range_nsmul`.

## R07 (P3) — Locators

**KM-21 (4.3).**
- Location: `README.md:4034`, "([KM-21](#references), §4, (4.3) and properties (P1)–(P3), p.20".
- Witness: (4.3) is printed on p.18 (KM-21 line 1111); (P1)–(P3) are on p.20 (line 1196).
- Repair: "§4, (4.3), p.18, and properties (P1)–(P3), p.20".

**KHAYUTIN-19 Lemma 9.12.**
- Location: `README.md:1375`, "Lemma 9.12, pp.225–226".
- Witness: the lemma begins after the p.226 header (KHAYUTIN-19 lines 3685–3686), and its proof ends on the same page.
- Repair: "Lemma 9.12, p.226".

**KM-16RANK-published.**
- Location: `README.md:4337` lists this reference.
- Claim: no statement cites it.
- Repair: cite it where the kernel property (P3) is used (§5.6 kernel reciprocity, beside KM-21 (P1)–(P3)), or delete the entry.

## Verified sound

**Gate and dependencies.**
- My rerun of the gate on this head ends `stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, with every scanner at 0. The worker's run also has `build=0`.
- The depcheck for this README prints `depcheck: 229 roadmaps, 2317 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line. An earlier run in this session printed `234 roadmaps, 2418 edges, 0 problem(s)`.
- The cycle of R01 appears only when AdelicAlgebraicGroups' README is checked; output is quoted in R01.
- The folder holds README.md, Suggested.lean and metadata.toml. The diff outside the folder is empty.

**Lean.**
- `lake env lean Suggested.lean` exits 0 with 44 `declaration uses sorry` warnings and nothing else. That is 45 at a0ce011, less `hasStrongApproximation_of_simplyConnected`.
- I put `#check @name` for all 73 declarations in one scratch file. It elaborates, and each type matches `signatures.md` and its README statement. The `SieveGram` theorems keep `[RCLike 𝕜] [InnerProductSpace 𝕜 E] [Fintype ι]`, and no binder is lost elsewhere.
- One-tactic probe: I replaced each `sorry` by `first | (rfl; done) | (simp; done) | (norm_num; done) | (infer_instance; done) | (positivity; done) | (decide; done) | sorry`. All 44 `sorry` warnings remain.
- Every README name of this roadmap is declared (`readme-ids-missing=0`), and every Lean name is in the README.

**Library declarations opened at the pins.**
- I checked all 271 backticked library names of the README with `#check` against pinned Mathlib and Tau Ceti.
  - All resolve except `index_range_nsmul` (R06), `NumberField.Units` (a namespace, used as such), and roadmap names.
  - `TauCeti.IsSemialgebraic` exists at `Geometry/RealAlgebraic/Semialgebraic/Basic.lean:75`.
- Opened by hand:
  - Mathlib `BoundingSieve` API in `NumberTheory/SelbergSieve.lean`: `multSum` :163, `rem` :169, `siftedSum` :172, `siftedSum_le_mainSum_errSum_of_upperMoebius` :217, `upperMoebius_lambdaSquared` :251, `selbergTerms` :277, `mainSum_lambdaSquared_eq_sum_mul_sum_sq` :377;
  - Mathlib `RingOfIntegers.mapAlgEquiv` (`NumberField/Basic.lean:228`) and `IsTotallyReal` (`InfinitePlace/TotallyRealComplex.lean:48`), used in the R02 probe;
  - Tau Ceti `ZLattice.successiveMin` (:111, zero-based `sInf` of dilations), `finite_setOf_gauge_le` (:300) and `exists_basis_mem_flag_of_gauge_lt_successiveMin` (:552).
- Tau Ceti's `GeometryOfNumbers/LatticePointCount.lean` is the Lipschitz-boundary O(c^(n−1)) dilation count. It is not Davenport's projection-volume estimate, so it duplicates nothing here.
- Pinned Mathlib and Tau Ceti contain nothing on large sieves, Vaughan's identity, Bombieri–Vinogradov, Maynard, Lang–Weil, Linnik or Jutila.

**Cross-roadmap citations resolved.**
- AdelicAlgebraicGroups at #792: §1.1 (README line 954) supplies `AdelicPoints`, `IntegralModel`, `IntegralModel.globalPoints` and the schematic-closure model. §4.2 (line 3995) does not supply what is cited (R01).
- AnalyticNumberTheoryPartI at #1126:
  - §§0.10, 0.11, 0.18, 0.21, 0.26, 0.31, 0.32 and 0.34 are at lines 294–864;
  - §1.5a is at line 1037;
  - §§3.1, 3.3, 3.4, 3.22, 3.24, 3.26, 3.34 and 3.35 are at lines 2174–3133;
  - `landau_siegel_exclusion` and `smoothCount_dickman` are at `Suggested.lean:111` and `:863`.
- AnalyticNumberTheoryPartII at #1167: §5.29 is at line 1465.
- IntegralLattices Layers 0 and 3 are on main (`TauCetiRoadmap/IntegralLattices/README.md:507`, `:829`). The `overlaps.md` lead that only #1239 defines Layer 0 is false.
- ReductiveGroups Layers 6 and 7a are on main (lines 466, 690); see R05.
- `roadmaps resolve` lists no unresolved cross-roadmap citation. Its 62 Lean leads are this roadmap's own declared names, plus R04.

**Ownership against open pull requests.**
- CircleMethodThreePrimes (#1803) consumes §2.4 ("From `SieveMethodsAndPrimePatterns`, Layer 2 §2.4", its line 43).
- ArithmeticStatisticsPartV (#1175) consumes §5.6 and says this roadmap owns the residue-symbol interface (its `Suggested.lean:30–32`).
- ArithmeticStatisticsPartV sits at order line 54 and consumes this roadmap at line 56. That upward edge is its own review's finding; this roadmap cites it nowhere.
- Maynard material appears elsewhere only in a single ProbabilisticAndMetricNumberTheory mention.
- The only double or cyclic ownership is R01.

**Sources read at the seeded locators.**
- §0.5:
  - KED-ANT-11: Definition 11.6 (line 500), (11.4.1) (523), Lemma 11.7 (530), Lemma 11.8 with (log z)^(κ+1) (552–562), (11.4.2) (573), Theorem 11.9 (582);
  - KED-ANT-12: §12.2 R(x,y) (521), (12.3.1) (548), Theorem 12.2 (655).
- §0.8: KHAYUTIN-19 Lemma B.1 (6112), Remark B.2 (6129), Proposition B.3 (6154), Lemma B.4 (6177), (67) (6287), (68) (6369), Corollary B.6 (6407) and Proposition B.8 (6430). Pages are 265–271, as cited.
- §0.11a: HENK-02 Theorem 1.5 (line 109, p.3, d≥2), (1.3) (86), Lemma 2.1 (154), and (2.1)–(2.5) (145–204).
- §1.4: KHAYUTIN-19 Lemma 9.8 (3522) with (35)–(37), Lemma 9.9 (3573) with (38), Lemma 9.11 (3669) and Lemma 9.12 (3686).
- §2.2: BOMBIERI-1971 Theorem (p.401), the replacement of N by 2N or 2N+1 (line 82, p.402), the bins I_m and the sine bound (lines 100–108, p.404), and the nearest-integer L (line 118).
- §2.4: KED-ANT-18 (18.2.1) (line 515, stated for n>z), (18.2.2) (549), and Exercises 18.4.1–2 (679–688).
- §2.6: KED-chap-largesieve Lemma 15.4 (line 476).
- §2.9:
  - KED-chap-largesieve Lemma 15.1 (391), Theorem 15.5 (512, δ⁻¹+N−1), Exercises 15.4.2 and 15.4.4 (564, 584);
  - KED-ANT-16 Theorem 16.2 (401), Theorem 16.4 (485), Lemma 16.5 (516), Definition 16.6 (549), Theorem 16.7 (556) and line 565.
- §3.1: MAYNARD-2015 (1.3) (line 50, p.384), footnote 1 (85), (5.16) and (5.20) (pp.396).
- §3.2: KED-ANT-18 Definition 18.1 (355), Lemma 18.2 (373), Theorem 18.3 (429, log²Q) and Theorem 18.4 (520); KED-chap-bombieri Theorems 17.1, 17.4 and 17.5 (381, 431, 451).
- §§4.2, 4.4 and 4.5: every Maynard locator matches its printed page:
  - (2.4)–(2.5) p.387; (4.1) and Proposition 4.1 p.388; Proposition 4.2 and (4.4) p.389;
  - Lemma 5.1 p.392; (5.7)–(5.8) p.393; (5.9) p.394; Lemma 5.2 p.395; Lemma 5.3 p.398; (6.3) p.400; Lemma 6.2 p.401; Lemma 6.3 p.402; (6.19) and (6.22) p.404.
- §5.6:
  - FIMR-13 ideal symbol (p.5–6), Lemma 2.1 (line 299, p.6), Proposition 5.1 (1120, p.22) and Proposition 5.2 (1304, p.24);
  - KM-21 Theorems 1–2 (70, 88), §2.3 (2.4) (274), Conjecture Cₙ (340), (2.5)–(2.6) (370, 378) and (4.3) (1111, p.18, R07).

**Adversarial table** (exact rationals or brute force; scripts in the job's scratch directory).

| Statement (line) | Instance | Values computed | Result |
|---|---|---|---|
| §0.5 remainder mass (594) | P=6, all R_d=1 | 0, 1, 2, 3, 4 at D=1, 2, 3, 6, 7 | holds |
| §0.5 product dimension (563) | P={2}, g(2)=1/2 | [2,2): 1; [2,3): 2 | holds |
| §0.5 divisor-density tail (686) | Rankin with a=1/log z | (log z)^κ·exp(−log x/log z), against the source's (log z)^(κ+1) | holds (stronger) |
| §0.5 Eratosthenes (705) | split at d≤x | c·x^σΠ + M·x^σΠ = (c+M)·x^σΠ | holds |
| §0.8 regular primes (865) | 2952 forms: a,c∈[1,4], b∈[−4,4], D<0, ω∈[−3,3], p≤7, n≤2 | 0 mismatches with p^(n−1)(p−χ) | holds |
| §0.8 recursion R(n,m) (874) | 420 cases: p=3,5,7, five diagonal forms, u₃=1,2 | 0 mismatches; x²−y² mod 3: 5 (printed 1) | holds; corrects source |
| §0.8 uniform bound (883) | q=x²−3xy+3y², ω=−1, 2 | maximum ρ/p^(3n/2) = 1.06 ≤ 16 | holds |
| §0.8 genus sum (891) | p=3, u=u_A=ω=1, k=1, ε=−1 | 18 (formula 18, printed 9) | holds |
| §0.11a Henk (Lean 108) | [−1,1]²; minima (1,3); d=1 | 9<18; 3<6; 3=3, so d≥2 is needed | holds |
| §0.11a Davenport (Lean 138) | sheared unit square; n=1 | 4 points, volume 1, projections 1; sSup ∅ = 0, bound C | holds |
| §1.4 character Gram (1340) | (0,0) and (1,0), coefficients 1, −1 | sums 0, 0, 2, 2; total 8; energy 2 | holds |
| §1.4 curvature (1315) | A=10⁸, R=10⁻⁸, z=120 | 120⁵·10⁻⁸ = 248.832; 14400 > 10⁴ | holds |
| §1.4 fixed divisor (1484–1492) | Q=x₀²; Q=x₀; B=4096 | p vs 0; p(p²−p)=(p−1)p²; 1/2, 1/4, 1/8; 72/36² = 1/18; φ(6)/36 = 1/18; 4, 256, 16 ≤ 256^(5/6) ≈ 101.6 | holds |
| §1.4 unit congruence (1506–1508) | the three classes | Q₁ = 3u₀+r; 2u₀+1 with ρ̃(3)=3; 3u+2 | holds |
| §1.6 Goldbach factors (1574–1582) | N=6, p=5, z=5 | (1−1/p)²(1−1/(p−1)²) = 1−2/p; 2; 4/3; diagonal 3 vs 1 | holds |
| §2.2 padding (1876–1879, 1922) | H=2,3,2; L=1,1,0 | (0,0,a,b,0), (0,a,b,c,0), (0,a,b); e(−1/4)+i = 0 | holds |
| §2.2 taper width (1842) | r=Lδ∈(2/3,1] | π²/12 ≈ 0.822 ≤ 8/9 | holds |
| §2.4 Vaughan (Lean 370) | λ₂(12), λ₄(4); V=2, N=12 | log 2 + log 3; 0; B=4, mℓ=12 | holds |
| §2.6 duality (2235) | no columns, C<0 | source hypothesis true, conclusion false | C≥0 is needed and imposed |
| §2.9 sharp primitive (Lean 257) | Q=H=1, a=2+i; Q=1, H=2 | 5 = 5; 4 ≤ 4 | holds |
| §2.9 Linnik (2481) | N=16, ε=1/2 | 28 four-smooth integers ≤ 256; 511 | holds |
| §3.0 moments (2525) | Q=2, j=0,1,2; Q=3, j=1 | 2, 3, 5; 4, and 2 with (q,2)=1 | holds |
| §3.0 small conductor (Lean 424) | χ₃, x=y=3; s=2; s=12, y=10 | −log 2; 0; log 72 ≤ 2 log 10 | holds |
| §3.1 level (2576–2585) | (10,3); (5,3); window (2,3) | 1; 3/2; 2 | holds |
| §3.2 discrepancy (2618–2690) | 1_{n=2}; 1_{n=1}, q=3; δ₁*δ₁, Q=3; δ₂*δ₃ at q=5 | 0; ±1/2; 1/2; 3/4 | holds |
| §4.2 weights (2944) | k=1, F≡1, R=4 and R=2 | λ = (5/2, −2, −3/2); w₂ = 1/4, w₃ = 1; S₁ = 5/4; 2; wResidue({0,2},3) = 5; g(25) = 9 | holds |
| §4.4 (6.19) (3088) | symbolic | γ/(p−γ) = (p−1)²/(p²(p−2)); g(p)p/φ(p)² = 1−1/(p−1)² | holds |
| §4.5 clusters (Lean 567) | k=0; k=1 | ⌈0⌉ = 0; M₁ = 1 and ⌈θ/2⌉ = 1 | holds |
| §4.6 Gram values (Lean 588–630) | k=5 witness; constant witness | I = 29509/1222452000; J = 40493/838252800; ratio 1417255/708216 ≈ 2.00116; Lemma 8.1 at b=0: 1/2520; 4/3 and 105/53; 42 monomials | holds |
| §4.7 gap headlines (Lean 633–658) | against Maynard lines 83–124 | 600; 12 and 600 under EH; C·m³e^(4m); Theorem 1.2 for distinct integers, equivalent by translation | holds |
| §5.4 Lang–Weil (Lean 673) | xy over 𝔽₃; x²−2y² at p≡±3 mod 8; S={1} | 5; 1; 0 | holds |
| §5.4 local densities (3718–3721) | a²+b² at p=5, 3, 2; a at p=3 | 40/120; 0; 2/6; 6/24 | holds |
| §5.4 walks (3697, 3742–3744) | m=2, ρ=1/2, L=2; S₃ | τ = 1/2, 16/4 = 4; eigenvalues 1, 0, −1 and 1, 1/2, 0; X₁ = 6 | holds |
| §5.4 explicit bound (3810) | t=2, dim G=3, d=2, τ=1/2, C=r=3 | 216; 72040/333 ≈ 216.34 < 217; 54 and 108 | holds |
| §5.4 strong approximation needs (3723, 3824) | AdelicAlgebraicGroups §4.2 at d2e6304 | defers to the deleted §5.3a; CYCLE | R01 |
| §5.5 Chen constants (3880–3889) | as written | envelope 0.4924633 < 0.49255; integral 0.4909952; V = −0.0164726; 2.6408077 (margin 7.7·10⁻⁶); 2.6424 with 4-decimal logs; 0.6706 | holds |
| §5.5 weight (3846–3849) | N=1000: n = 11, 286, 3, 27 | 1, 0, 1/2, 1/2 | holds |
| §5.6 symbols (3957–3962) | (2/5), (4/5), (15/5); quadratic K | −1, 1, 0; split, inert and ramified 5 all give 1 | holds |
| §5.6 reciprocity (3977–3978) | (3,7); (−1,−1) | −1 = (3,7)₂(3,7)_∞; 1 = (−1)(−1) | holds |
| §5.6 cubic witness (4042) | α = 1+8t, β = 1+16σ(t) | Φ(α,β) = 1 and Φ(β,α) = −1, over the degree-1 primes of 43, 83, 13 and 29; α<0 at t₂, t₃; sign pairs (−,+), (+,−), (−,−); infinite factor −1 | holds |
| §5.6 prime bound (4082) | n=3, \|S\|=1, δ=1 | 1/(54·3·37) = 1/5994; θ/(2+θ) = 1/(12n+1) | holds |
| §5.6 equidistribution (4087) | Lean probe | elaborates, 1 sorry | R02 |
| §4.6 wording (4193) | against line 21 | "hypotheses of §4.6" vs "none is a hypothesis" | R03 |

## Not verifiable

**Texts not readable.**
- BGS-10 (§5.4) and DFI-1997 are uncertified (paywalled). FIMR-ERRATUM-2015 is uncertified.
- CHEN-73-CN, HR-SIEVE, RICHERT-1969 and KM-16RANK-published are waived.
- All of these are cited by locator only.

**Missing from the manifest.**
- LANG-WEIL-54 (Theorem 1, Lemma 1) and DAVENPORT-51 (pp.179–183, correction p.580) have no entry in the package's `sources.toml`. No open copy was found in earlier rounds (JSTOR, and a Wiley DOI returning 403).
- The manifest still lists CONRAD-12, RAPINCHUK-14, BOREL-63 and SCHNEIDER-11, which this README no longer cites. This review edits no manifest.

**Effectivity.** The effectivity of the small-conductor constants rests on the AnalyticNumberTheoryPartI §0.34 contract.

**Ownership not checked.** Ownership against open pull requests was checked by `roadmaps grep`/`show` at their heads. It was not checked against unpublished board packages.

## Source issues

- **Error** in KHAYUTIN-19 at Lemma B.4, n≤m branch, printed pp.266–267: the source gives ⌈n/2⌉p^(n−1)(1−χ) plus terms, 1 for x²−y² mod 3; it should have smooth term (p−1)(1+χ)p^(n−1), giving 5; affects a stated result.
- **Error** in KHAYUTIN-19 at Proposition B.5, equation (68), printed p.268: the source has exponent 2ϖ and a minus sign before 4ωuu_A; it should be ϖ and a plus sign, from Q=q−ωD; affects the proof.
- **Error** in KHAYUTIN-19 at Proposition B.8, factor f, printed pp.270–271: the source uses (ωu/p); it should be (−ωu/p), giving 18 rather than 9 at p=3, u=u_A=ω=1, ε=−1; affects a stated result.
- **Error** in KHAYUTIN-19 at Lemma 9.11, printed p.225: the source allows every s>0; at z=1 both products are 1 while s^deg Q→0, so s≥1 (or another factor) is needed; affects a stated result.
- **Misprint** in MAYNARD-2015 at Lemma 8.1, printed p.409: the sum defining G_{b,j} starts at r=1, so b=0 gives 0; it should start at r=0, giving 1/2520 at k=5, a=2; affects a stated result.
- **Misprint** in MAYNARD-2015 at proof of Proposition 4.2, display (4.4), printed p.389: the sum runs over j while the summand uses m; it should be summed over m; affects nothing.
- **Gap** in MAYNARD-2015 at proof of Theorem 1.1, printed p.391: admissibility is justified for primes less than k only; the prime p=k also needs it, which holds since every element exceeds k; affects the proof.
- **Misprint** in KED-ANT-12 at Theorem 12.2, second inequality: the lower bound for V⁻(z) carries the factor 1+e^(β−s)K^10; it should be 1−e^(β−s)K^10, as in the following display; affects a stated result.
- **Misprint** in HENK-02 at §1, before Conjecture 1.4, printed p.2: the source defines ⌊x⌋ as the smallest integer not less than x; it should be the largest integer not greater than x; affects nothing.
- **Gap** in BOMBIERI-1971 at p.404, definition of the bins I_m: bins are restricted to (m+1)δ≤1/2 yet said to cover every point; the final partial bin, e.g. 2/5 at δ=3/10, must be kept; affects the proof.
- **Gap** in KED-chap-largesieve at §15.2, Lemma 15.4: the source allows any real C; with no columns and C<0 the hypothesis holds and the conclusion fails, so C≥0 is needed; affects nothing.
