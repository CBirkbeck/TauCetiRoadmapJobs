# Review of NoncommutativeGeometry (pull request #1143 at c19d9aa)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/NoncommutativeGeometry/README.md` and `Suggested.lean`. The head is the one r26 read.

There are four findings: one P2 and three P3.
- One P2 is carried: ownership of `A_θ` is shared with OperatorKTheory #866.
- One P3 is carried: the pull-request description no longer matches this head.
- Two P3s are new:
  - N5's summability hypothesis is narrower than the theorem it cites.
  - One N4 Check value is misrounded.

## R01 (P2) — `A_θ` has two owners: N6 here and OperatorKTheory 7.4 in #866

Carried from r26 R01 (first raised in r20). Not repaired.

**Location.**
- README 50–56: "N6 alone owns the rotation C*-algebra `A_θ=C(𝕋)⋊_αℤ` for every real θ … its faithful tracial state `τ=∫_𝕋∘E`, which OperatorKTheory's Pimsner–Voiculescu computation consumes".
- README 1831: "OperatorKTheory 7.4 consumes N6's rotation C*-algebra A_θ".

**Claim.** N6 is the only owner of `A_θ`, its presentation and τ.

**Witness.** OperatorKTheory #866 is still at 1377338a. Its `TauCetiRoadmap/OperatorKTheory/README.md`:
- 1783–1784 defines `A_θ` and "the canonical trace `τ=HaarIntegral∘E` using D2's expectation";
- 1796–1798 proves its universal presentation and the faithfulness of τ;
- 2324–2326 says NoncommutativeGeometry consumes "K7's rotation algebras with their K-groups", although this README consumes nothing from OperatorKTheory.

**Repair.** This roadmap is on main, so it is earlier than #866 and may not cite it. The README already takes the only admissible direction.
- State in the description that #866 merges after this pull request.
- #866 replaces 1783–1784 and 1796–1798 by a citation of NoncommutativeGeometry N6, and rewrites 2324–2326 as consumption of N6.
- **Test:** afterwards, `roadmaps grep --fixed 'τ=HaarIntegral∘E'` and `roadmaps grep --fixed "K7's rotation algebras"` return nothing.

## R02 (P3) — N5's Hochschild-class theorem assumes weak-trace-class summability; the CRSZ theorem it cites needs only the logarithmic ideal

New.

**Location.** README 1379–1380: "For integer n≥1 of the module's parity, initially invertible D, assume D⁻¹∈L^(n,∞), F=sign D, and the preceding regularity and bounded commutators."

**Claim.** The theorem "for every dilation-invariant ω", citing Carey–Rennie–Sukochev–Zanin (CRSZ) Theorem 16, is stated only when |D|⁻ⁿ lies in the weak trace class S_(1,∞).

**Witness.**
- CRSZ Theorem 16(b) (carey-rennie-sukochev-zanin line 508) assumes only that (1+D²)^(−p/2) is in M_(1,∞) (Definition 13(d), line 453). M_(1,∞) is the logarithmic ideal, N4's L^(1,∞).
- CRSZ presents this case as its main advance (lines 53–55).
- N4's block-diagonal Check operator lies in L^(1,∞)∖S_(1,∞). Taken as |D|⁻¹ with n=1, it meets CRSZ 16(b) but not N5.

**Repair.**
- Assume `(1+D²)^(−n/2)∈L^(1,∞)`, N4's logarithmic ideal (CRSZ Definition 13(d)), in place of D⁻¹∈L^(n,∞).
- Derive [F,π(a)]∈S_q for every q>n from `μ_j≤σ_j/j=O(log j/j)` and the regularity, so that N3's character exists in degree n.
- Keep D⁻¹∈L^(n,∞) as a special case among the Checks; the circle `D=diag(k+1/2)` and N7's Fourier triple satisfy it.
- **Test:** the block-diagonal operator is now covered: σ_N≤(k+2)² while (j+1)μ_j=2k at j=2N_k−1.

## R03 (P3) — The description still describes an earlier head

Carried from r26 R02 (first raised in r20). Partly repaired: the merge-order block now reads "`NoncommutativeGeometry`: **this pull request** → #1187 (pin bump)", and the line naming #864 is gone.

**Location.** The pull-request description.

**Claim.** The description still says:
- "Only the NCG README changes; Suggested.lean, topic and dependency pins are unchanged";
- "K5's fixed swapped reduction x×_K5 y";
- "N2 retains [Algebraic K-theory #1142] as its A0–A3 supplier";
- "[Smooth Banach #1145] … supplies generic SB8 analytic results to N6";
- that N1.Tensor is the "sole early supplier" of these tensors, "including their universal property";
- "GitHub build passed for submitted head `84190a1e…`".

**Witness.**
- `git diff --stat origin/main...HEAD` shows 147 changed lines in `Suggested.lean`. Main's file declared `CyclicTwoCocycle`, `torusTwoCocycle`, `SpectralTriple` and others; this head declares only `bijective_matrixExtension`.
- README 1664–1669 writes `x⊠_u y` and `x⊠_s y`, with no K5.
- AlgebraicKTheory is not on main, and no *Needs:* line names it.
- README 104–106: SmoothBanachRepresentations Layer 8's "generic inverse closure is not an input here".
- README 494 and 576 consume the pinned `CompletedProjectiveTensorProduct.liftEquiv`.

**Repair.** Rewrite these sentences for this head:
- `Suggested.lean` now states only `bijective_matrixExtension`;
- N7 has the two reductions x⊠_u y and x⊠_s y;
- N2 consumes the pinned `ExactK0` and `AlgebraicK1` and no AlgebraicKTheory section;
- N6 consumes nothing from SmoothBanachRepresentations Layer 8;
- N1.Tensor consumes Tau Ceti's completed tensor and universal property, and adds the cross property, coherence, Fréchet completeness and the Banach comparison.

Drop the build report for 84190a1e, and add the #866 order from R01.

## R04 (P3) — N4 additivity Check misrounds 2H_N

New.

**Location.** README 1242: "at N=10⁶ the first is 28.786 and `σ_N(S+T)` is 27.399".

**Claim.** 2H_N at N=10⁶ equals 28.786 to three decimals.

**Witness.** H_(10⁶)=14.3927267, so 2H_N=28.785453, which rounds to 28.785. The other values in the Check recompute correctly: σ_N(S+T)=2H_(5·10⁵)=27.39916, and the means are 2.0836 and 1.9832.

**Repair.** Replace 28.786 by 28.785. The inequality 28.785>27.399 and the means 2.084 and 1.983 are unchanged.

## Previous findings

- r26 R01 — **not repaired.** README 50–56 still reads "N6 alone owns the rotation C*-algebra `A_θ=C(𝕋)⋊_αℤ`". #866 is unchanged at 1377338a, with "τ=HaarIntegral∘E" at 1784 and "K7's rotation algebras" at 2326. Carried as R01.
- r26 R02 — **partly repaired.** The merge-order block now orders #1187 after this pull request, and #864 is no longer named. The description still reads "Only the NCG README changes; Suggested.lean, topic and dependency pins are unchanged". Carried as R03.

## Verified sound

**Gate, dependency check and build.**
- The gate, rerun at c19d9aa against `origin/main`, reports every scanner 0 and `OK`. The worker's run adds `build=0`.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/NoncommutativeGeometry'` is empty.
- `PROGRESS.md`, `STATUS.md` and `metadata.toml` are on main and unchanged; 140 roadmaps on main carry the first two.
- The dependency check (`--movable`) prints `depcheck: 235 roadmaps, 2268 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
  - Every *Needs:* supplier is on main: BanachAlgebras, OperatorTheory/OperatorIdeals and SelfAdjointSpectralTheory, NoncommutativeIntegration, VonNeumannAlgebras, HilbertModules, BanachSpaceTheory and OperatorAlgebraDynamics.
  - IndexTheory, OperatorKTheory, AlgebraicKTheory, SmoothBanachRepresentations, PadicLocalLanglandsForGL2Qp and LocallyAnalyticDistributions are named only as owners of excluded objects, never as suppliers.
- `lake env lean` on `TauCetiRoadmap/NoncommutativeGeometry/Suggested.lean` exits 0. The only warning is `declaration uses sorry` at 64:8.

**`Suggested.lean`.**
- `#check @…bijective_matrixExtension` elaborates to: ∀ R with `[CommRing R] [Algebra ℚ R]`, A with `[Ring A] [Algebra R A]`, M with `[AddCommGroup M] [Module R M]`, ι with `[Fintype ι] [DecidableEq ι] [Nonempty ι]`, and n, `Function.Bijective (matrixExtension M ι n)`. This is README 691–696 exactly. No binder is lost, and it needs no change.
- One-tactic probe, run on a scratch copy: `first | simp | exact?` fails ("`exact?` could not close the goal"). The pin has only cochain-level injectivity, `matrixCochainExtension_injective` (`RingTheory/CyclicCohomology/Matrix.lean`:292), so the theorem is not padding.
- Headlines: the README's Summary lists six; one is stated here.
  - Stated: matrix Morita invariance (N1).
  - Named as not statable in the module docstring:
    - the N3 index theorem: the pins have no trace on trace-class operators;
    - the N5 Hochschild class;
    - N6's HP^even(𝒜_θ)≃ℂ² and the Diophantine Hochschild dimensions;
    - N7's Heisenberg index and (θ,1).
  - I checked the missing carriers at the pins:
    - the only `def trace` is `Contour.Cycle.trace`, alongside `LinearMap.trace`;
    - `SmoothNoncommutativeTorus` occurs only in `NoncommutativeGeometry/SmoothTorus/Basic.lean`, with no topology and no `Derivation`.
  - The two pinned headlines the docstring names exist: `UniversalForms.cycleCocycle_trace` (`…/UniversalDifferential/Cycle.lean`:305) and `traceDerivationPairCocycle` (`…/CyclicCohomology/Derivation.lean`:209).

**Library declarations opened at the pins.**
- A script resolved all 136 backticked identifiers of the README; every one is found.
- I read these by hand:
  - `cyclicCohomology.matrixExtension` (`Matrix.lean`:497) and `matrixCochainExtension_single` (`Matrix.lean`:275, the corner left inverse);
  - `quasiIsoAt_cyclicCochainComplexToTotal` (`Bicomplex.lean`:781; its hypothesis `IsUnit ((q:R)+1)` holds over a ℚ-algebra);
  - `dixmierTrace` (`OperatorIdeal/Family/DixmierTrace.lean`:91: junk value 0 off L^(1,∞), `dixmierTrace_modulus` at 226);
  - `GeneralizedLimit` (`GeneralizedLimit.lean`:76, extends limits), `IsDilationInvariant` (177), `map_dilate` (189) and `dilate f k n = f (n / k)` (`Topology/ContinuousMap/Bounded/Normed.lean`:244), so N4's step `n↦m(2⌊n/2⌋)` is the pinned dilation by 2;
  - `kyFanGauge_add_kyFanGauge_le` (`ApproximationNumber/Positive.lean`);
  - `rotation_apply_apply` (`Action/ContinuousMap.lean`:76: `f((exp t)⁻¹ z)`), `groupMultiplier_mul_coefficientMultiplier` (`CrossedProduct/Multiplier.lean`:258) and `of_injective` (`CrossedProduct/Full.lean`:335: inner regular μ and a faithful ρ);
  - the smooth-torus `twist` (`SmoothTorus/Basic.lean`:180, `𝐞(θ y₂ z₁)`) and `U₁`, `U₂` (542, 548);
  - the bounded coboundary formula (`Normed/Algebra/HochschildCohomology/Coboundary.lean`), the `dualAction` convention (`Normed/Module/Dual/Bimodule.lean`), the dual-bimodule currying `(xφx′)(y)=φ(x′yx)` (`RingTheory/HochschildCohomology/Dual.lean`) and the compact-resolvent conventions `R(z)=(z−D)⁻¹`, `K=R(i)*R(i)` (`LinearPMap/CompactResolvent.lean`);
  - the completed-tensor `map_id`/`map_comp` (`Projective/Completion.lean`:156, 167), `liftEquiv` (`UniversalProperty.lean`:122) and `reindex_refl`/`reindex_trans`/`map_comp_reindex` (`Reindex/Completion.lean`:90, 97, 111);
  - Mathlib's `exists_dual_vector''` (`Analysis/Normed/Module/HahnBanach.lean`:85), `CStarModule A A` with inner product `y * star x` (`Analysis/CStarAlgebra/Module/Constructions.lean`:79–80) and the GNS inner product `f (star a * b)` (`Analysis/CStarAlgebra/GelfandNaimarkSegal.lean`:82).

**Cross-roadmap citations resolved: 34, on main unless marked.**
- BanachAlgebras: A2 (Layer 2, cycles at 520–521) and A6 (6.1, 1379–1395, `Hⁿ=Zⁿ/Bⁿ`, the same coboundary sign).
- OperatorIdeals: OI-A17 (150), A20 (156), A22 (159), A30 (196), B29 (349) and B30 (350).
- SelfAdjointSpectralTheory: Part E (1186).
- NoncommutativeIntegration: §1.3 (286), §1.4 (321; log-submajorization with `f=log` gives N3's product inequality), §1.5 (360), §1.6 (406) and §2.1 (453).
- VonNeumannAlgebras: V4.Core (972).
- HilbertModules: H1 (126, 141–142), H2 (229–233), H3 (286–291) and H6 (705).
- BanachSpaceTheory: B4 (239 and its `PiTensorProduct` comparison).
- OperatorAlgebraDynamics: D1 (148, universal property at 205), D2 (221; ℤ generator formulas, full=reduced and the expectation) and D4 (333).
- The same ids exist at the open revisions #1137, #1041 and #1149.
- Open-PR deferrals:
  - SmoothBanachRepresentations §7.2a and Layer 8 (#1145 scope);
  - LocallyAnalyticDistributions §0.0;
  - PadicLocalLanglandsForGL2Qp §0.1;
  - LocallyConvexDuality Layer 5;
  - CompactQuantumMetricSpaces (#1155, 76–81);
  - HeisenbergImprimitivity (#1149, 221–223 and 877), which consumes N6–N7 and leaves 7.5 to OperatorKTheory.

**Ownership and overlaps.**
- The overlap check lists no dropped id and no revision-only id.
- Lean names dropped from main's file (`torusTwoCocycle`, `CyclicTwoCocycle`, `NormalizedEvenCycle`, `positiveProjection`, `SpectralTriple`) are cited nowhere.
- Matrix Morita invariance of Connes' cyclic cohomology has no other owner. KTheoryFiniteLocalFields #1281 and CyclicHomologyLieHomologyAndQuasiFreeAlgebras #2037 build derived and homological cyclic homology, and #2037 names N1 as a neighbour.
- #1187 is ordered in the description.
- The only double ownership is R01.

**Sources: seeded sample of 15 locators, all verified in the cached texts.**
1. Connes III.1, Propositions 3–4, pp. 190–191 (connes94 lines 6905–6950): forced unitization; cycles, closed graded traces and cyclic cocycles are equivalent.
2. III.1, Lemma 14, p. 198 (7274–7278), with Corollary 13's `(m+m′)!/(m!m′!)` (7258), which gives `S^mτ(1,…,1)=m!`.
3. III.1, Theorem 26, p. 208 (7650–7656): the SBI triangle.
4. III.3, Proposition 3, proof, pp. 230–231 (8531–8550): the smooth path `U_t` and the vanishing derivative.
5. III.2, Proposition 5(a)–(b), p. 217 (7980–7983), with the Diophantine condition (7978) and Theorem 7 (7998–8008).
6. IV, introduction, Definition 3, p. 296 (11135–11142): p≥1 and the Hölder corollary.
7. IV.1, p. 299 (11240–11252): Tr′ and Proposition 1.
8. IV.1, Proposition 2, p. 300 (11282–11284): `τ_(m+2)=−2/(m+2)·Sτ_m`. N3's λ_n has ratio `λ_(n+2)/λ_n=−(n+2)/2`, which matches.
9. IV.2, Definition 2, p. 312 (11754–11762), with condition (γ) on p. 311 (11720).
10. IV.2, Proposition 4, p. 313 (11789–11793).
11. IV, Appendix C, p. 453 (17381–17404): `sup N^(1/p−1)σ_N`. The constants p/(p−1) and 1 recompute.
12. Connes 1985, Part I, Appendix 2, Proposition 5, journal p. 91 (connes85 lines 1802–1808).
13. Connes 1985, Part II, p. 94 (1880–1889): complex algebras and complex-valued cochains.
14. Fack–Kosaki, Theorem 4.2(ii), p. 286 (fack-kosaki line 607). Theorem 4.9(iii) is on p. 295 (871).
15. Grothendieck, Chapter I, n° 1, Théorème 1, p. 76 (grothendieck52 lines 153–172), with the completed product, products and sums on p. 77 (180–212).

I also checked Connes 1985, Corollary 24, p. 113 (connes85 2592–2594), the headline's locator. No locator in the README is flagged as unverified.

**Adversarial pass.** Values were computed in pure-Python scratch scripts.

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `bijective_matrixExtension` | ℚ against M₂(ℚ), n=0, 1; ι=∅; R=0 | `HC⁰`: 1 vs 1 (φ↦φ∘Tr); `HC¹`: 0 vs 0 (c=−c on ℚ; M₂(ℚ) separable); ι=∅: `HC⁰(A;M)≠0` vs `HC⁰(0;M)=0`, so `Nonempty` is needed; R=0 forces M=0, 0 vs 0 | true | none |
| N1.Tensor: cross norm and Banach comparison | ℓ¹₂⊗ℓ¹₂, `u=e₀⊗e₀+e₀⊗e₁+e₁⊗e₀−e₁⊗e₁` | projective norm 4; injective norm 2 over ℝ, 2.828427=2√2 over ℂ | true | none |
| N1.Cyclic: S normalization | shuffles of two pairs; ∏[2k,2] at q=−1 | signs +,−,+,+,−,+, sum 2 (unsigned 6); products 1, 2, 6, 24, 120 = m! | true | none |
| N1.Cyclic: coboundary and currying signs | M₂(ℂ), e₁₂, e₂₁, φ=a₁₁ | `(b Tr)=0`; `(bφ)=1`; opposite actions give −1 | true | none |
| N1.Cyclic: cyclic sign | ψ on the circle, 4096-point sum | ψ(z⁻¹,z)=1.0; ψ(z,z⁻¹)=−1.0 | true | none |
| N2: pairing constants | m=0..5; k=0..4 | `c_(2m)(−1)^m(2m)!/m!=1/m!` exactly; odd identity holds for each k; `(1/((1+i)√π))²=−0.159155i=1/(2πi)` | true | none |
| N2: Bott class | z=0.3−0.7i and 1.2+0.5i | Tr(p dp∧dp)=0.8011537i vs 0.8011537i, and 0.276392i vs 0.276392i; pairing +1; 1−p gives −1 | true | none |
| N3: Hardy calibration | ℓ²(ℤ) truncated at ±50 | [F,z] nonzero only at e₋₁↦2e₀; τ₁=2; λ₁=−0.886227(1+i); pairing −1 = ind(PzP); Connes' printed λ₁ gives +1 | true | none (Source issues) |
| N3: Schatten Checks | S=diag(2,1), T=[[1,1],[0,1]]; weighted shifts | μ(T)=(1.618, 0.618); μ(ST)=(2.9208, 0.6847); Hölder 4≤5 and 2=2; ‖S+T‖ at 1/2: 9>5; p-th powers 3=3; ζ(1.1)=10.5844 | true | none |
| N3: doubling and sine | F=1/2; F∈{±1, 3} | F′²=I, trace 0; wrong-sign off-diagonal 0.866; sin(3π/2)=−1; (F/3)²−1=−0.889 | true | none |
| N4: additivity Check | N=10⁶ | 2H_N=28.78545 (README 28.786); σ_N(S+T)=27.39916; means 2.0836 and 1.9832 | value misrounded | R04 |
| N4: non-measurable operator | recursion to k=60 | r alternates 0.666667 and 0.833333; M alternates 0.743683 and 0.756317, against 2/3+(log 2)/9=0.7437 and 5/6−(log 2)/9=0.7563 | true | none |
| N4: L^(1,∞)∖S_(1,∞) | k=1..5 | N_k=2, 4, 16, 256, 65536; (j+1)μ_j=2k; σ bounds 7, 12, 19, 28, 39 ≤ (k+2)²=9, 16, 25, 36, 49 | true | none |
| N5: bounded transform | D=diag(0,1,−1) | F_D=(0, 0.707107, −0.707107); 1−F²=(1, 0.5, 0.5); (D−i)⁻¹=(i, 0.5+0.5i, −0.5+0.5i); squared moduli (1, 0.5, 0.5) | true | none |
| N5: circle and absolute value | D=diag(k+½), M=10⁶ | σ_(2M)(\|D\|⁻¹)=31.558, ratio 2.1751, tending to 2 as 2 log M+O(1); positive-part mean 1.1421, tending to 1, so D⁻¹ gives 1−1=0 | true | none |
| N5: hypothesis against CRSZ 16(b) | N4's block operator as \|D\|⁻¹ | in L^(1,∞) (σ_N≤(k+2)²) but (j+1)μ_j=2k is unbounded | narrower than the source | R02 |
| N6: multiplier, trace, rotation | θ=1/2, m=n=1; θ=1/4 | both orders give e(−1/2)=−1; a↦a_(0,1) gives e(−θ) vs 1; rotation e(θ)=i vs e(−θ)=−i | true | none |
| N6: projection replacement | random non-self-adjoint idempotent in M₃(ℂ), ‖e−e*‖=1.696 | ez−ze=0; p²−p=0; p*−p=0; ep=p; pe=e; ss⁻¹=1; ses⁻¹=p; Tr e=Tr p=2 | true | none |
| N7: Fourier triple | mode (3,−2); R=200, 800 | D²/4π²=13·I; D⁺ entry 18.85+12.57i=2π(m−in); multiplicities 2, 8, 8, 16, 24; lattice ratios 0.14616 and 0.14853, tending to 0.15915 | true | none |
| N7: Hardy product | random entries; W=(σ₁−σ₂)/√2 | Tr₂(σ₃[D,a][D,b])=0.0827+3.5892i=2i(x₁y₂−x₂y₁); Wσ₁W=−σ₂, Wσ₂W=−σ₁, Wσ₃W=−σ₃ (errors 0); ((1+i)√π)²/(2πi)=1; (−1)(2i)/(4π)=1/(2πi) | true | none |
| N7: odd modules and Heisenberg | θ=0.3137, k=5; s=0.81, θ=0.37 | V₊Se₅=0.73836−0.67441i=e(θ)SV₊e₅; SV₋=e(θ)V₋S; ν_j(U_j)=1; chiral operator on the Gaussian gives 0; c₁=1 | true | none |
| CRSZ bullet: 2-torus | R=60, 150 | ½Tr(γF…)=12.565932i, 12.566301i, against 4π=12.566371; the Fγ order gives −12.566301i | true | none (Source issues) |
| `A_θ` ownership | #866 at 1377338a | lines 1783–1784, 1796–1798, 2324–2326 | two owners | R01 |

## Not verifiable

- None. Every locator in the sample, and every other locator a finding touches, was read in the cached texts. The published CRSZ (J. Spectral Theory 6) was not read; the README cites the arXiv v1 numbering it uses.

## Source issues

- **Error** in connes94 at IV.1, Definition 3 with Proposition 4, pp. 302–303: the source pairs the odd coefficient √(2i)Γ(n/2+1) with III.3's factor 1/√(2i). On the Hardy module this gives +1, but Proposition 0.2's index of PzP is −1. It should be −√(2i)Γ(n/2+1) in the odd case; affects a stated result.
- **Error** in carey-rennie-sukochev-zanin at Definition 15 (with Theorem 16), p. 9: the source says the character is half the trace of F, then Γ, then the commutators; it should have Γ before F, since the printed order gives −4πi against the Dixmier side 4πi on the 2-torus for p=2; affects a stated result.
- **Misprint** in carey-rennie-sukochev-zanin at Definition 2, p. 4: the source says a dilation-invariant extended limit is a state on l∞ invariant under every σ_k; it should also require vanishing on c₀, which excludes evaluation at index 0; affects nothing.
