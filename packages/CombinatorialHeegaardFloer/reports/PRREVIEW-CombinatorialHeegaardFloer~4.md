# Review of CombinatorialHeegaardFloer (pull request #2545 at cc2fe8d)

**Verdict:** needs changes

**Summary.** Changes are needed for one finding. In §3.9 the target that the grid polytope bounds the Thurston norm of the link complement has no locator. Nothing supplies the norm. The cited book proves combinatorially only the bound for the collapsed Alexander grading against surfaces bounded by the link. It states the full polytope–norm relation without proof and attributes it to Ozsváth–Szabó's holomorphic argument. Every finding and small correction of the previous review is repaired. There are two small corrections, about missing or misattributed locators, and one format note. One fact about how Layer 3 is arranged against the book is left to the human reviewers.

## R01 (P2) — The §3.9 target that the grid polytope bounds the Thurston norm has no source, no supplier for the norm, and no known proof without holomorphic curves

An implementer of §3.9 has no route to this statement inside the roadmap. Its only published proof uses the holomorphic theory, which Layer 3's opening (lines 389–394) says is "needed for nothing here" and which HeegaardFloer owns downstream. The norm it bounds is not supplied either.

The sentence (lines 695–696) reads "Prove that the grid polytope bounds the Thurston norm of the link complement, as a bound and not as detection". It carries no locator, and the *Needs:* line (698–699) names no Thurston norm. In the book, the relation between the grid polytope and the dual Thurston polytope is Theorem 11.9.9 (OSSBOOK line 9067). The authors state it without proof (line 9066) and attribute it to Ozsváth–Szabó, *Link Floer homology and the Thurston norm* (J. Amer. Math. Soc. 21, 2008), whose proof is holomorphic. What the book proves combinatorially is Proposition 11.7.1 (line 8673). If `F` is an oriented surface with `∂F = L` and no sphere components, then every multi-grading `h` with `GĤ(L, h) ≠ 0` has `h₁ + ⋯ + h_ℓ ≤ (ℓ − χ(F))/2`. That is the bound in the single direction `(1, …, 1)`. A bound in finitely many directions does not give the bound for every class, because both the support function of the polytope and the norm are only convex. For the norm itself, GeometricTopology §5.4.1 on main owns the integral surface minimum on `H₂(N, ∂N; ℤ)`. It leaves the real seminorm to GeometricTopology, Part II (its README lines 208 and 6098–6102).

The smallest repair is to state the bound the source proves: "for every oriented surface `F ⊂ S³` with `∂F = L` and no sphere components, `h₁ + ⋯ + h_ℓ ≤ (ℓ − χ(F))/2` whenever `GĤ(L, h) ≠ 0`, in particular `≤ g(L) + ℓ − 1` (Ozsváth–Stipsicz–Szabó, Proposition 11.7.1)". GeometricTopology §4.3 (Seifert surfaces and the genus of links) would then go on the *Needs:* line. If the full polytope bound is wanted, it belongs beside HeegaardFloer §8.3, with Theorem 11.9.9 and Ozsváth–Szabó (2008), citing GeometricTopology §5.4.1 for the norm. If a combinatorial proof of the full bound is known, cite it with its locator.

## C01 — Several statements carry no locator, and §5.4's twisted refinement cites the wrong paper

A reader cannot check these claims at their source. The pull request description also says the book is cited "at each claim", which these gaps contradict. Each item says what to cite.

- §1.4, the filtered definitions and the restriction to graded pieces: OSSBOOK Definitions 13.1.1–13.1.9 (lines 10296–10433) and the remark after Definition 13.1.6 (line 10395).
- §3.8, the three symmetries of `GĤ`: Propositions 7.1.1 and 7.1.2 (lines 5294, 5327). The README's mirror formula is their composite. Reversal invariance is in the proof of 7.1.1 (line 5296), and `τ(m(K)) = −τ(K)` is Corollary 7.4.5 (line 5631).
- §3.9, the skein exact sequence: Theorems 9.1.1–9.1.2 (lines 6341, 6355). Thinness of alternating knots: Theorem 10.3.1 (line 7711).
- §3.11, Chekanov's `m(5₂)` pair: Proposition 12.4.1 (line 9664).
- §5.4, the twisted refinement: OSS09 §9, Definition 9.2 and Theorem 9.4 (OSS09 lines 3319, 3334). The paper cited there, arXiv:1301.0480, is the sign-assignment paper.

## C02 — §2.3 cites the book for two proofs it does not give

§2.3 cites §11.5 for the independence of `Δ_L` from the presentation and Theorem 11.5.3 for Torres's symmetry. The book defers the first to Lickorish (its reference [119], Theorem 6.1; OSSBOOK line 8372), and also its Proposition 11.5.2 (line 8386). It states the second without proof, citing Torres, *On the Alexander polynomial*, Ann. of Math. 57 (1953) (lines 8398–8401). The derivation the book suggests runs through grid homology (Corollary 11.4.3 with Theorem 11.6.1), which would make a Layer 2 target wait for §3.9. Would you cite Lickorish, Theorem 6.1, and Torres (1953) for the two proofs, or name the route, for instance Fox calculus?

## N01 — "This package has no absolute gradings" (Layer 5 opening, line 1119) reads as process vocabulary; "This layer" says the same.

<details><summary>What was checked</summary>

Automatic checks: all pass on this head, a rerun gives the same result, and nothing outside the folder changes. The check that every supplier the README cites comes earlier in the merge order, and that no two roadmaps cite each other, read 200 roadmaps and 2195 supplier edges and found no problem: no supplier is cited upward and there is no cycle.

Earlier findings, all repaired:

- R01 (basepoint count): §5.3 (lines 1178–1185) now defines the class of the pair, as OSS09 Definitions 1.1 and 6.13 do.
- R02 (multivariable `Δ_L`): it is now a §2.3 target (lines 335–346).
- R03 (convenient diagrams): §5.5 (lines 1227–1231) defines `HF̂_st(Y)` through `Y₁ # n(S¹ × S²)`, and the Examples (1244–1247) call the genus-one values classes of diagrams.
- R04 (stabilization): the correction now rises by ½ (lines 438–441).
- C01 (OSS12): the exponents are cited there (lines 915–917, 1531–1533).
- C02 (§1.3 uniqueness): it is now this roadmap's own target, with its proof (lines 205–208).
- C03: every listed locator was added.
- C04: the "follows the book" wording is gone.
- C05: the Tau Ceti lemma is now cited for its consequence only.
- C06: the normal form is a §3.10 target, with KhovanovHomology K7 on its *Needs:* line.
- C07: the shared clause is gone.
- C08: the two pinned restatements were deleted, and the description records it.

Not verifiable: locators outside the sample in Ozsváth–Szabó–Thurston (arXiv:math/0611841), Gallais (arXiv:0706.0089), Juhász–Thurston–Zemke (arXiv:1210.4996) and arXiv:1301.0480 were not opened.

</details>

## Verified sound

Adversarial table. The source ids are the cache keys; MOS+06 is Manolescu–Ozsváth–Szabó–Thurston, arXiv:math/0610559v2, read from arXiv this round.

| # | Statement | Instances tried | Values computed (one side / other) | Result | Change |
|---|---|---|---|---|---|
| 1 | §1.4 filtered homotopy (sample) | `C = 𝔽a ⊕ 𝔽b`, `∂b = a`, `F₀ = 𝔽a` | `H(C) = 0`; `gr` pieces `𝔽a`, `𝔽b` with `∂ = 0`, `H(gr) = 𝔽²`; matches OSSBOOK Defs 13.1.1–13.1.9 | holds; no locator | C01 |
| 2 | §3.1 Checks (sample) | states differing in two points; `2 × 2` grid | torus: two rectangles x→y, planar at most one; two states, each 1×1 square marked, `∂̃ = 0` | holds | none |
| 3 | §3.2 link gradings (sample) | 2 components; stabilization | `(n−1)/2` vs `(n−2)/2` differ by ½ (eq. 8.2, Lemma 8.2.1, line 5711); `(n−ℓ)/2 → (n+1−ℓ)/2` | holds | none |
| 4 | §3.3 link `GĈ` (sample) | `2 × 2` unknot | Def 8.2.7 (5776), Prop 8.2.9 (5793); `GĤ = 𝔽_(0,0)`, `GH̃ = W`; blocking nothing gives `𝔽[U]` | holds | none |
| 5 | §3.4 Euler characteristics (sample) | unknot `n = 2, 3`; trefoil `n = 5` | Prop 4.7.5 (3537), Thm 4.7.6 (3558); `1−t⁻¹`, `(1−t⁻¹)²`; `(1−t⁻¹)⁴(t−1+t⁻¹)`; `χ(GĤ) = 1` | holds | none |
| 6 | §3.9 link branches (sample) | two-component unlink; `ℓ = 1` substitution | Thm 11.6.1 (8600) gives the README's three formulas; MOS+06 Thm 6.1 (2712) two branches; unlink `0`; substitution `t^½−t^−½ ≠ 1` | holds | none |
| 7 | §3.9 skein, thinness (sample) | right trefoil; figure-eight | Thm 10.3.1 (7711): `M − A = σ/2 = −1` on `(0,1),(−1,0),(−2,−1)`; rank `5 = |Δ(−1)|` | holds; no locators | C01 |
| 8 | §3.9 Thurston-norm bound | `α = (1,…,1)` vs general `α` | Prop 11.7.1 (8673): `Σhᵢ ≤ (ℓ−χ(F))/2` only; Thm 11.9.9 (9067) stated without proof, holomorphic; no supplier | unsupported | R01 |
| 9 | §3.10 normal form, slice bound (sample) | Euler count; `T_{3,4}`; figure-eight | B.5.1 (16985) matches; `b + d − (b+2g+d) = −2g`; `τ = 3 = g`; `τ = 0 < g_s = 1`; Thm 8.1.1 (5668) | holds | none |
| 10 | §4.1 blow-up weights (sample) | `ε = −1`, general odd `ε`; zero-framed vertex | Nem07 3.4.2 (429): `χ_k(π_*z) + a(a+1)/2`; `χ_{k′}(mE) = m(m−ε)/2`; band, `H₀ = 𝔽₂[U]` | holds | none |
| 11 | §4.1 negative control | `[[−1,1],[1,−1]]`, `k = (−1,−1)` | `χ = (a+b+t²)/2 = t(t+1)/2 + b`, unbounded below; `H₀ = 𝔽₂[U,U⁻¹]` vs `𝔽₂[U]` | consistent | none |
| 12 | §4.2 model (sample) | genus-one `(−1)`, `K = −E`; genus zero | `χ = x(x−1)/2`, segment `0 + M¹(0) = 1`; `T⁺₀ ⊕ T₀(1)` = Nem07 Ex 4.2.4 (582); `x(x+1)/2`, `H⁰_red = 0` | holds | none |
| 13 | §4.5 comparisons (sample) | zero-framed vertex, `K = 0` | native `H₀ = 𝔽₂[U]`, `H₁ = 0`; `[K,E]`: `v* = 0`, faces cancel, both `𝔽₂[U]`; `x ↦ K₀ + 2Qx` constant at `Q = 0` | holds | none |
| 14 | §4.6 identity (sample) | general `l`; `E₈` | `(k+2l)² = k² + 4k(l) + 4l² = k² − 8χ_k(l)` (Nem07 376); `K = 0`, max `2`, without `|V|` `0` | holds | none |
| 15 | §4.7 Seifert data (sample) | `Σ(2,3,5)` | `3/2 = [2,2]`, `5/4 = [2,2,2,2]`; `e = −2 + 59/30 = −1/30`; flipped `b`: `2 + 59/30`; 8 vertices | holds | none |
| 16 | §5.1 data (sample) | `S¹ × S²`, basepoint in bigon / annulus | OSS09 §3 (509–515): `k` curves, `k−g+1` points, so `g+b−1`; periodic `2B₂ + A ≥ 0` / `B₁ − B₂` | holds | none |
| 17 | §5.2 nice calculus (sample) | Tau Ceti `hatDomains` | `{D ≥ 0, n_w = 0, μ = 1}` (HatDifferential.lean 111) = OSS09 Prop 6.10 (1848); Thm 6.11 needs no admissibility; Def 4.2: `4g−4` points | holds | none |
| 18 | §5.3 class (old R01) | `[𝔽,1]`, `[𝔽²,1]` | OSS09 Def 1.1 (63), Def 6.13 (2163); class fixed by `dim V/2^b`: `½ ≠ 1`; Thm 7.1 (2179) | repaired | none |
| 19 | §5.5 `HF̂_st(Y)` (sample, old R03) | `S¹ × S²`; genus-one lens space | Def 1.2 (76), Thm 5.2 (891), Thm 8.2 (3227); `Y₁ = S³`, `n = 1`; genus one never convenient | repaired | none |
| 20 | §2.3 multivariable `Δ_L` (old R02) | Hopf link; two-component unlink | `π₁ = ℤ²`, `H₁(X∞) = 0`, `Δ = 1`, `(t−1)·1 ≐ t^½−t^−½`; unlink module `Λ` free, `Δ = 0` | holds; proofs deferred | C02 |
| 21 | §1.3 uniqueness (old C02) | `𝔽[U]/U²` vs `𝔽_(0,0) ⊕ 𝔽_(−2,−1)` | same series; `UM/U²M` at `(−2,−1)`: dimension 1 vs 0 | holds | none |
| 22 | §3.8 symmetries | left trefoil | 7.1.2 then 7.1.1: `GĤ_M(m(K),A) ≅ GĤ_{−M}(K,−A)`; `(2,1) ↦ (−2,−1)`; `(2,1) ↔ (0,−1)` | holds; no locator | C01 |
| 23 | `bigradedUnblockedHomologyIsomorphic_of_movesTo` | probes; `G′ = G` | pinned Alexander-graded term: type mismatch; `simp` leaves `∃`; reflexivity example elaborates; Thm 5.3.1 (4427) | real target | none |
| 24 | `simplyBlockedHomology_equiv_of_movesTo` | probe; any `i, i′` | `simp` leaves `∃`; Cor 4.6.17 (3374) independence of `i`; `CharP K 2` excludes the zero ring | holds | none |
| 25 | `natAbs_tau_le_unknottingNumber` | probe; trefoil | `simp` no progress; Cor 6.1.8 (4754); `|τ| = 1 = u` | holds | none |
| 26 | `unknottingNumber_toGridLink_torusLink` | `(0,q)`, `(1,2)`, `(2,3)`, `(1,1)` | `0`, `1`, `3`; `(1,1)` excluded (gcd 2, `u = ⊤`, `pq/2 = 0`); `simp`, `rfl` fail | holds | none |
| 27 | `nonempty_latticeChainHomology_blowUpVertex` | `oneVertexPlumbing w`, `ε = ±1`; probe | both `𝔽₂[U]` in degree 0; `simp` unsolved | holds | none |
| 28 | `nonempty_latticeChainHomology_blowUpEdge` | edge lift; probe | `π*` adds `(xᵢ + xⱼ)E_new`, orthogonal to `E_new`; `Iso.refl` mismatch; source leaves this case to the reader | holds | none |

- Source locators checked against the texts: OSSBOOK 41, OSS09 24, Nem07 15, OSS12 1, Zem21 1, MOS+06 2.
- Tau Ceti declarations opened at the pin: `unblockedHomologyIsomorphic_of_movesTo`, `tau_eq_of_movesTo` (Grid/Homology/Invariance.lean 99, 111); `UnblockedHomologyIsomorphic` (KnotAlexander.lean 98); `bigradedUnblockedHomologyGrading` (Homology/Bigraded.lean 84); `W`, `IsStablyEquiv` (Bigraded/Stabilization.lean 98, 172); `hatDomains`, `hatCoefficient`, `hatDifferential` (Heegaard/HatDifferential.lean 111, 159, 223); `IsNice` (Nice.lean 92).
- More Tau Ceti: the `S¹ × S²` lemmas (CircleTimesSphere.lean 272, 310, 423); the lens-space lemmas (LensSpace/Diagram.lean 381, 394, 411); `sliceGenus` (Slice/Genus.lean 303), `KnotCobordism` (Cobordism.lean 149); the torus `τ` and unknotting lemmas; `HeegaardSplitting` (Splitting.lean 77).
- Mathlib at the pin: `MvPolynomial.uniqueFactorizationMonoid` (RingTheory/Polynomial/UniqueFactorization.lean 128) and `UniqueFactorizationMonoid.of_isLocalization` (GroupTheory/MonoidLocalization/UniqueFactorization.lean 79). Neither Mathlib nor Tau Ceti has a filtered-homotopy carrier.
- Cross-roadmap citations resolved on main 1b7b481:
  - GeometricTopology §§4.1–4.4, 4.7.1 (`u`, line 4297), 5.1 (5906), 5.4.1 (6085), 6.2 (6301) and 8.2 (7175, Milnor uniqueness);
  - MorseTheory Layers 1–2 (515, 612) and KhovanovHomology K7 (786);
  - HeegaardFloer §§6.1, 7.0, 7.6 and 8.1–8.3 (3585–4792).

  Other roadmaps cite this one by lane name, and the headings keep the lane names.
- Elaboration: `lake env lean` on a copy of the file, with `#check @` for all seven declarations and nine probes. The original part gives only the six `sorry` warnings, every one-tactic probe fails, and the reflexivity example elaborates. The elaborated types match the README, every binder is explicit, and nothing changed.
- Pull request text: it matches the head (43 Checks, about 175 Tau Ceti names, the four added grid imports, the new targets and the suppliers), apart from "at each claim" (C01).
- Overlap check: read RibbonKnots (#2339), HeegaardFloer (#2477 and main), GeometricTopology (#1797, #1791 and main) and KhovanovHomology (main). Each shared object has one owner:
  - Cromwell's theorem and the grid-link map: this roadmap's Layer 2 (GeometricTopology #1797 line 1669 cites it).
  - The connected-sum adapter and the Mazur-satellite `τ` formulas: GeometricTopology.
  - The reconciliations: HeegaardFloer §8.
  - Link-cobordism movies: KhovanovHomology K7.
  - The integral Thurston norm: GeometricTopology §5.4.1, used without citation (R01).
  - The multivariable Alexander polynomial, the normal form of knot cobordisms and filtered homotopy equivalence: this roadmap only.

  RibbonKnots shares nothing.

Source independence: 22 passages compared with 6 sources (OSSBOOK, OSS09, Nem07, OSS12, Zem21, MOS+06). No wording is shared beyond forced formulas, standard terms and one-line definitions; the §3.10 normal form and the §5.3 relation restate theorems that can be written one way only. The largest share is OSSBOOK, about 45 of about 115 locators (Nem07 about 35). Contents compared with OSSBOOK: Layer 3 runs parallel to Chapters 3–15 but not one to one, and the order of §§3.1–3.7 is forced by their *Needs:* lines; independent.

Research link: Layer 3 proves combinatorially the invariance and `τ` bounds of Manolescu–Ozsváth–Szabó–Thurston (2007) and Sarkar (2011), which yield Kronheimer–Mrowka's (1993) Milnor-conjecture theorem. Layer 4 is Némethi's lattice cohomology (2008), which Zemke (2021) identifies with `HF⁻`. Layer 5 is Ozsváth–Stipsicz–Szabó's stable `HF̂` (2009). This rests on the README and the sources read.

## Not verifiable

- Nothing in the sample. OSSBOOK was read from the authors' copy on an author page; OSS09, OSS12, Zem21, Nem07 and MOS+06 were read on arXiv.
- Locators outside the sample in Ozsváth–Szabó–Thurston (arXiv:math/0611841), Gallais (arXiv:0706.0089), Juhász–Thurston–Zemke (arXiv:1210.4996) and arXiv:1301.0480 were not opened.

## Source issues

- **Gap** in Nem07 at Proposition 3.4.2, printed page 9: the source treats the blow-up at a smooth point and leaves the blow-up at an intersection point to the reader; it should give the retraction for the total transform adding `(x_i0 + x_j0)E_new`; affects the proof.
- **Misprint** in Nem07 at Proposition 3.3.4, printed page 8: the displayed inequality subtracts `χ_{k_r}(−x_i)`; it should be `χ_{k_r}(−y_i)`, as the next line of the proof uses; affects nothing.

## For the human reviewers

- Arrangement: Layer 3's thirteen sections take the scope of OSSBOOK Chapters 3–15 in nearly the book's order. The exceptions are §3.9 (Chapters 9–11) before §3.10 (Chapter 8), and §3.12 (Chapter 15) before §3.13 (Chapters 13–14). The README no longer says it follows the book. I judged this below a finding: the map is not one to one, and §§3.1–3.7 are forced by their *Needs:* lines.
