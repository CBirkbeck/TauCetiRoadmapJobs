# Review of BoundsOnCodes (pull request #2563 at ca816da)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement was recomputed in its degenerate cases (empty and one-letter alphabets, length 0, dimension 0, the zero code, an infinite field, `d = 0`, `δ ≤ 1` and `δ > n` in the BCH bound) and none fails; every number printed in a Check was recomputed and agrees; every locator was read against the cited draft and supports its statement with the qualifications the README already makes. There are no small corrections and one format note, not blocking. Two points are left for the human reviewers: the only source with locators is an open draft textbook under a Creative Commons licence that forbids commercial use and derivatives, and the remaining attributions carry no locator.

## N01 — The summary's Delsarte bullet uses the normalised `A_i`, which is not defined for the empty code

The fourth headline bullet of the summary (line 27) says "for every code" of `∑_i A_i K_k(i)`, while 5.1 (line 525) proves the inequality for the count of ordered pairs and only then divides by `|C|`. For the empty code `A_i` is `0/0`, so the sentence is exact only in the form 5.1 states. Would "the Krawtchouk transform of the number of ordered pairs of its words at each distance" (or "for every nonempty code") suit?

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 `card_hammingBall` | (q,n,t) = (2,7,1), (2,23,3), (3,11,2), (3,2,5), (1,n,t), n = 0, q = 0 | 8; 2048; 243; 9 = 3²; 1 = one word; 1 = one word; q = 0, n ≥ 1: no centre, formula 1 | holds; vacuous at q = 0, n ≥ 1 as the Check says | none |
| 1.2 `card_mul_hammingBallVolume_le` | `{000,111}` t=1; all of `𝔽₂²` t=1 without separation; q=0 n≥1; q=0 n=0 | 2·4 = 8 ≤ 8; 4·3 = 12 > 4 (separation needed); 0·1 ≤ 0; at most 1·1 ≤ 0⁰ = 1 | holds | none |
| 1.2 `card_mul_hammingBallVolume_eq_iff` | repetition n=3,4,5; q=1 with C empty and C full; q=0, n≥1 | 8=8 perfect; 10<16 not perfect; 32=32 perfect; 0≠1 and not perfect, 1=1 perfect; 0=0 and vacuously perfect | both directions agree | none |
| 1.3 `exists_card_mul_hammingBallVolume_ge` | (2,7,2); r ≥ n; r = 0; q=0 n≥1; q=0 n=0 | V=29, needs at least 5 words; V=qⁿ, one word; whole space; 0 ≤ 0; 1 ≤ 1·1 with the one word | holds | none |
| 1.4 `exists_linearCode_finrank_eq` | q=2,n=7,r=2,k=2,3; k=0; k>n; n=0,k=1; infinite F n=0 k=1 | 87<128 yes; 203≥128 no; 0<qⁿ zero code; q^k−1 ≥ qⁿ fails; q−1<1 fails; 0<1 but no line in F⁰ (`Finite` needed) | holds; route counts (q^k−1)·q^((k−1)n)·V < q^(kn) | none |
| 2.1 Hamming codes (4 theorems) | (q,r) = (2,3), (3,2), (2,2), r=1, r=0; all-nonzero-columns variant | 7 points, [7,4,3], 16·8=128; 4 points, [4,2,3], 9·9=81; [3,1,3]; one point, zero code, d=0, perfect; empty, 0+0=0; variant gives d=2 | holds; `2 ≤ r` needed and present for d = 3 | none |
| 2.2 `isPerfect_punctureAt_binaryGolay` | n=23, t=3; n=24 control | 4096·2048 = 2²³, d=7>6; 4096·2325 < 2²⁴ | holds from the two pinned theorems and 1.2 | none |
| 2.3 ternary Golay (2 theorems) | n=11, t=2 | d = 6−1 = 5 > 4; 729·243 = 177147 = 3¹¹ | holds; pinned puncturing lemmas need d ≥ 2, have 6 | none |
| 3.1 `card_le_pow_of_nontrivial`, `finrank_add_hammingMinDist_le` | repetition, even-weight, n=1; zero code; n=0; one word over empty alphabet n=0 | 2 ≤ 2¹; 2^(n−1) ≤ 2^(n−1); 0+0<2; 0+0 ≤ n+1; 0 ≤ 1; 1 > 0¹ (two words needed) | holds | none |
| 3.2 `card_le_plotkin` | (q,n,d) = (2,3,2); (3,3,3); (2,4,2); q=1; q=0; n=0; d>n | 4/(4−3)=4 attained; 9/3=3 attained; hypothesis 4<4 fails; d/d=1; forces n≥1, 0 ≤ 0/n; 1 ≤ 1; ratio ≥ 1 | holds | none |
| 3.3 `sum_ceil_div_pow_le` | [7,4,3], [7,3,4], [23,12,7], [24,12,8]; k=0; infinite F | 7; 7; 22 ≤ 23; 23 ≤ 24; empty sum; terms i≥1 are ⌈d/0⌉ = 0, sum = d ≤ n | holds; residual-code route checked step by step | none |
| 4.1 `IsMDS`, information sets, dual | zero code; Fⁿ n≥1; n=0; repetition/even-weight pair; k=0 | 0+0≠n+1; n+1; 0≠1; n+1 and (n−1)+2; ∅ is an information set but code not MDS | both hypotheses (k ≥ 1, k < n) needed and present | none |
| 4.2 `finrank_grsCode`, `isMDS_grsCode` | 𝔽₃ points (0,1,2) k=2; points (0,0,1); v=(1,1,0), k=1; k>n; k=0 | 9 words d=2; word (0,0,1) weight 1<2; (c,c,0) weight 2<3; whole space; zero | holds with injective `a`, nonzero `v`, 1 ≤ k ≤ n | none |
| 4.3 `euclideanDual_grsCode` | 𝔽₅ all points; k=0; k≥n; n=0 | ∏_{j≠i}(a_i−a_j) = −1, u = −1/v; ⊤ = GRS(n); ⊥ = GRS(0) since n−k = 0; both sides trivial | holds for every k with truncated n − k | none |
| 4.4 `le_hammingNorm_of_isPrimitiveRoot` | 𝔽₈ b=1 δ=3; β=1 n=3 over 𝔽₇; n=0; n=1; δ≤1; δ>n | weight ≥ 3; (1,6,0) sums to 0, weight 2<3 without primitivity; no nonzero c; c₀=0 contradiction; δ ≤ 1 ≤ wt; n consecutive checks force c=0 | holds | none |
| 5.1 `sum_distanceDistribution_mul_krawtchouk_nonneg` | Hamming [7,4,3]; `{00,01}` k=2 and indices swapped; q=0; q=1; k=0 | (256,0,0,0,1792,0,0,0); 2−2 = 0 versus 2−4 = −2; n=0 only, value 0 or 1; \|C\|·C(n,k)·0^k ≥ 0; \|C\|² | holds; index order of the pinned `krawtchouk q n k i` fixed by the witness | none |
| 5.2 `card_mul_le_of_krawtchouk` | binary f = K₀+K₁/(2d−n); q=0, n=1, f=(1,2), empty code; d=0; d>n; q=0 n=0 nonempty | 2d/(2d−n) = Plotkin; f(0) = −1, 0 ≤ −1 false (nonempty needed); f(0) ≤ 0 < f₀ contradictory; f₀ ≤ f(0); f₀ ≤ f₀ | holds | none |
| Conventions: Krawtchouk values | K₂(0), K₂(1), K₀(2), K₁(2) for n=2, q=2; K₁(0), K₁(1) for n=1, q=0 | 1, −1, 1, −2; −1, −1; equal to the pinned definition's sum | agrees with the pinned definition | none |
| Summary, Delsarte bullet (N01) | empty code | normalised A_i = 0/0; pair count 0 gives 0 ≥ 0 | wording only | format note |

- Source locators read against the text: all of them (22 citing passages, one source, the version the README names: August 2025, 566 pages); printed pages agree in every case.
- Library declarations opened at the pins: 49 (21 Mathlib, 28 Tau Ceti), each in the file the supplier contracts name; the hypotheses of the puncturing, minimum-distance and dual-dimension lemmas match the README's descriptions. Seven further Mathlib names (`Fintype.card_pi`, `Fintype.ofFinite`, `Fintype.equivFin`, `Matrix.vecMul`, `Matrix.mulVec`, `Matrix.rank`, `Lagrange.interpolate`) were not opened one by one.
- Cross-roadmap statements resolved: 3 (AlgebraicCodingTheory's exclusion of general bounds and Reed–Solomon and BCH codes; MathematicalStatisticsNonparametric 2.3; BanachSpaceTheory's Krawtchouk use); none is a supplier.
- Dependency check: `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`; no UPWARD or CYCLE line. Suppliers are Mathlib and Tau Ceti only. The automatic checks all passed.
- Elaboration of `TauCetiRoadmap/BoundsOnCodes/Suggested.lean`: 24 `sorry` warnings, nothing else; no `set_option`, no sorry'd data, imports as required. Every elaborated signature was compared with its README statement: same hypotheses and generality; the binders the definitions drop (`Finite F` on `HammingPoint`, `Fintype ι` on `grsCode`) are not needed by them.
- One-tactic probe (`rfl`, `simp`, `simp` with the definitions unfolded, `infer_instance`) on a separate copy: closes none of the 24 theorems. No padding found by reading either.
- Headline theorems (sphere-packing with its equality case, both Gilbert–Varshamov bounds, perfection of the Hamming and Golay codes, Singleton, Plotkin, Griesmer, MDS characterisation and duality, GRS dimension, MDS property and dual, BCH bound, Delsarte's inequalities, linear-programming bound): all stated in `Suggested.lean`. The pull request's title and description agree with the head (24 theorems, 7 definitions, 2 instances, four Tau Ceti imports, a new roadmap).
- Overlap check: read AlgebraicCodingTheory, Rank24LatticeConstructions, CoboundaryExpansion; nothing shared. Also read MathematicalStatisticsNonparametric 2.3 (owns Tsybakov's binary packing with the Hoeffding ball estimate; 1.3 here is the exact general bound and restates nothing of it) and the open LinearAlgebraMethodInCombinatorics (excludes codes and the linear-programming bound). No object of this roadmap exists in the pinned Mathlib or Tau Ceti.

Source independence: 11 passages compared with 1 source (GRS), none shared; largest share GRS, all locators; contents compared with GRS: independent (Layer 1 draws on its §1.7, §3.3 and §4.2, Layer 2 on §2.4, Layer 3 on §4.3–4.4 and exercises, Layer 4 on Ch. 5 with MDS codes before Reed–Solomon codes, Layer 5 on §8.2; the routes of 1.3, 1.4 and 3.1 differ from the source's proofs).

Research link: Layer 5's dual linear-programming bound (Delsarte, 1972–73, per the README's references) is what GRS §8.2.1 starts from to derive the McEliece–Rodemich–Rumsey–Welch bound, which the README names as out of scope. Rests on the README and on GRS.

## Not verifiable

- The attributions without locators (Golay, Hamming, Gilbert, Varshamov, Singleton, Plotkin, Griesmer, Reed and Solomon, Bose and Ray-Chaudhuri, Hocquenghem, Delsarte, MacWilliams and Sloane for the duality of MDS codes): no locator is given, so nothing was checked against those texts; the statements themselves were verified by computation.
- Ownership against the open pull requests was checked by searching their READMEs for the objects by their usual names (Reed–Solomon, Singleton, sphere-packing, Griesmer, Plotkin, Varshamov, Delsarte, perfect code, MDS, BCH, Hamming code, linear-programming bound); a roadmap that states one of these under another name would not have been found.

## Source issues

- **Error** in GRS at Exercise 2.21, part 3, printed page 49: the source asks for distance 3 of the q-ary Hamming code for every r ≥ 1; it should be r ≥ 2, since for r = 1 the code is the zero code of length 1; affects a stated result.
- **Misprint** in GRS at §8.2.1, printed page 165: the inequalities to be multiplied by the coefficients are cited through an unresolved reference mark; it should be (8.8); affects nothing.

## For the human reviewers

- **Licence.** The only source with locators (GRS) is an open draft book on an author's page, marked Creative Commons BY-NC-ND 3.0 on its page iii. The README states its results in its own words and reproduces no table or list from it.
- **Scope.** That source is a draft textbook, not a refereed publication; the other attributions (`TauCetiRoadmap/BoundsOnCodes/README.md`, lines 715–722) are by author and year, without locators. The results are the classical bounds of coding theory.
