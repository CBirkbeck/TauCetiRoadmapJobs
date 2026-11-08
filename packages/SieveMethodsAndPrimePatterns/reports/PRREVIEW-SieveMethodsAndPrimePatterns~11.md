# Review of SieveMethodsAndPrimePatterns (pull request #1495 at 593232d)

**Verdict:** needs changes

This is an incremental re-review of the 80 lines that changed since 8111bc5.
- R01 and R02 are blocking, but neither needs another edit in this folder. This README now claims ownership and lists the consumers. The other two roadmaps (#1178 and #1174) have not yet dropped their own versions of the same objects, and their repairs go there.
- R03–R06 are P3, and each is a one-line edit.

## R01 (P2) — ArithmeticStatisticsPartVII still owns the Hilbert inequality and the sharp large sieves (previous R01, partly repaired)

**Location.** `README.md:4128`: "ArithmeticStatisticsPartVII, in its multiplicative large sieve: the separated Hilbert inequality with constant π/δ, `SieveTaper.sharp_additive_largeSieve` for 0<δ≤1 and `SieveApplications.sharp_primitive_largeSieve` (§2.9)."

**Claim.** This folder has done its half of the repair:
- §2.9 is stated as the owner;
- the sharp additive sieve is widened to 0<δ≤1 (`Suggested.lean:227`, `hδ' : δ ≤ 1`);
- ArithmeticStatisticsPartVII is listed as a consumer.

ArithmeticStatisticsPartVII itself is unchanged. It still owns all three inequalities and says that this roadmap consumes them. Each roadmap therefore still hands the same objects to the other, and the consumer line above is not yet true.

**Witness.** ArithmeticStatisticsPartVII at #1178 (head 661d52f):
- `README.md:18`: its target "owns the Montgomery–Vaughan Hilbert inequality … the sharp additive large sieve … `0<δ≤1`, and the sharp primitive-character large sieve";
- `README.md:2538`: "SieveMethodsAndPrimePatterns §2.9 consumes" them;
- it proves all three at `:1036`.

**Repair.** No change in this folder. In #1178:
- replace the ownership sentences at `README.md:18` and `:2538` with a citation of SieveMethodsAndPrimePatterns §2.9 (the separated Hilbert inequality, `SieveTaper.sharp_additive_largeSieve` for 0<δ≤1, and `SieveApplications.sharp_primitive_largeSieve`);
- drop the three proofs from its multiplicative-large-sieve target (`:1036`).

Ownership stays here because this roadmap is at `ORDER.txt` line 55 and ArithmeticStatisticsPartVII at line 142.

**Tested.** The cited statements cover what #1178 states (`:1034`: N≥1, real Q≥1).
- A real Q reduces to ⌊Q⌋, because the q-sum is unchanged and ⌊Q⌋²≤Q².
- At δ=1, with one frequency 0 and a=(1,1), both sides of `sharp_additive_largeSieve` equal 4.

## R02 (P2) — ArithmeticStatisticsPartIII still proves degree-uniform Lang–Weil itself (previous R02, partly repaired)

**Location.** `README.md:4129`: "ArithmeticStatisticsPartIII, in its degree-uniform hypersurface smooth points (§2.23): `SieveLangWeil.lang_weil_uniform` (§5.4), for the affine cone of the hypersurface and for its singular cone, leaving only the removal of the singular locus."

**Claim.** This folder now names ArithmeticStatisticsPartIII and InverseGaloisAndArithmeticFundamentalGroups as consumers of §5.4. ArithmeticStatisticsPartIII is unchanged: it still proves degree-uniform Lang–Weil from scratch and never cites this roadmap. Two roadmaps therefore plan the same theorem, and the consumer line is not yet true.

**Witness.** ArithmeticStatisticsPartIII at #1174 (head 0a63762), `README.md:2082`: "Prove degree-uniform Lang–Weil by induction on dimension: the curve case uses the genus bound and the curve Weil estimate". "SieveMethodsAndPrimePatterns" occurs nowhere in that README.

**Repair.** No change in this folder. In #1174, in the §2.23 target *Degree-uniform hypersurface smooth points*:
- cite `SieveLangWeil.lang_weil_uniform` (SieveMethodsAndPrimePatterns §5.4) for the affine cone and for the singular cone;
- keep only the passage to projective points and the removal of the singular locus;
- drop the induction from the proof and its inputs from the *Needs:* line at `:2084`.

Ownership stays here (`ORDER.txt` line 55, against line 111).

**Tested.** The reduction of the previous report still matches #1174's bound `#H_smooth(F_q) ≥ q^(n−1) − C(n,d)(q^(n−3/2)+q^(n−2))`.
- For a geometrically integral degree-d form in n+1 variables, the affine cone satisfies `|#cone(𝔽_q) − qⁿ| ≤ C q^(n−1/2)`. So `#H(𝔽_q) = (#cone − 1)/(q − 1) = q^(n−1) + O(q^(n−3/2))`.
- The singular cone is cut out by n+2 equations and has dimension at most n−1. So it has at most `C q^(n−1)` affine points, which is `O(q^(n−2))` projective points.

## R03 (P3) — DAVENPORT-51 and LANG-WEIL-54 still have no manifest entry (previous R04, partly repaired)

**Location.**
- References: `README.md:4340` (DAVENPORT-51) and `:4342` (LANG-WEIL-54).
- Citations: `:1039`, `:3586` and `:3602`.

**Claim.** The rest of the previous repair is done:
- IEANTN is deleted;
- PNT-PLUS is pinned at commit 127b50e and recorded in the manifest;
- LANG-WEIL-54 now carries its DOI.

The two journal articles are still cited with no `sources.toml` entry.

**Witness.** `packages/SieveMethodsAndPrimePatterns/sources.toml` has 39 ids, including `PNT-PLUS` but neither `DAVENPORT-51` nor `LANG-WEIL-54`.

**Repair.** Record both through `sources fetch`, as `uncertified` where the publisher copy is paywalled:
- DAVENPORT-51: DOI 10.1112/jlms/s1-26.3.179, locator "the theorem, pp.179–183; correction, p.580", cited for 0.11a;
- LANG-WEIL-54: DOI 10.2307/2372655, locator "Theorem 1 and Lemma 1", cited for 5.4.

**Tested.** Crossref resolves 10.2307/2372655 to Lang and Weil, "Number of Points of Varieties in Finite Fields", Amer. J. Math. 76(4), 1954, starting at p.819, which matches the README entry.

## R04 (P3) — ErdosProgressionPowers cites the two Gram declarations that this head deletes

**Location.**
- `Suggested.lean`: `SieveGram.sum_norm_inner_sq_le_max_row` and `SieveGram.sum_norm_inner_sq_le_of_diag_offdiag` are deleted.
- `README.md:4131`: "ErdosProgressionPowers (Layer 3): `SieveGram.sum_norm_inner_sq_le_of_row_le` and the diagonal/off-diagonal Gram inequality (§0.4)."

**Claim.** The repair for the previous R05 introduced this; that repair did not check who cited the two names. ErdosProgressionPowers cites both, by their fully qualified names, as supplier declarations, so both citations now point at nothing. Neither README says what replaces them.

**Witness.** ErdosProgressionPowers at #1336 (head 3e1048c), `README.md:699–704`: "the maximum-row form `SieveGram.sum_norm_inner_sq_le_max_row` … the diagonal/off-diagonal form `SieveGram.sum_norm_inner_sq_le_of_diag_offdiag` … The names lie in the namespace `TauCetiRoadmap.SieveMethodsAndPrimePatterns`".

**Repair.**
- In #1336, `README.md:699–704`: cite the two forms as SieveMethodsAndPrimePatterns §0.4 *Maximum-row Gram inequality* and *Diagonal/off-diagonal Gram inequality*, README targets without Lean names. Keep `SieveGram.sum_norm_inner_sq_le_of_row_le`.
- Here, rewrite `README.md:4131` as: "ErdosProgressionPowers (Layer 3): `SieveGram.sum_norm_inner_sq_le_of_row_le`, and the maximum-row and diagonal/off-diagonal Gram inequalities of §0.4, which have no Lean declaration."
  - This line gives the old → new mapping.
  - It does not put a deleted name in backticks, so the gate's README-name check still passes.

**Tested.** ErdosProgressionPowers §3.3 (#1336 `README.md:1532`) applies the diagonal/off-diagonal form. That form follows from `sum_norm_inner_sq_le_of_row_le` with C=D+O. For example, at x=1 and y=(1,2): D=4, O=2, and the left side is 5≤6.

## R05 (P3) — ExplicitPrimeCounting does not take the Hilbert inequality or the sharp additive and primitive sieves

**Location.** `README.md:4128`: "ExplicitZetaBounds and ExplicitPrimeCounting take the same §2.9 statements, and ExplicitPrimeCounting also the prime count in a residue class, `SieveDistribution.primeCountAP` (§3.1)."

**Claim.** From §2.9, ExplicitPrimeCounting takes only the large sieve for forbidden residues, and it says that sieve is not an input of its §0.1. It takes none of the three statements this sentence attributes to it.

**Witness.** ExplicitPrimeCounting at #1945 (head 08b5094), `README.md:463–472`. Its whole contract with this roadmap is:
- "§2.9 the large sieve for forbidden residues";
- "§3.1 `SieveDistribution.primeCountAP` … for the agreement lemma of §0.6 only".

**Repair.** Replace the sentence with: "ExplicitZetaBounds takes the same §2.9 statements. ExplicitPrimeCounting takes the large sieve for forbidden residues (§2.9) and `SieveDistribution.primeCountAP` (§3.1)."

**Tested.** ExplicitZetaBounds at #1954, `README.md:374–378`, takes exactly the three statements: `sharp_additive_largeSieve`, `sharp_primitive_largeSieve` and the Hilbert inequality.

## R06 (P3) — The new single-frequency case of the sharp additive sieve uses inputs that its *Needs:* line omits

**Location.**
- `README.md:2421`: "For 1/2<δ≤1 there is at most one frequency, and Cauchy–Schwarz gives …"
- `README.md:2429`: "*Needs:* Layer 2 §2.6 squared finite large-sieve duality; Layer 2 `SieveTaper.additive_largeSieve`; Layer 2 §2.9 separated hilbert inequality."

**Claim.** The added case relies on two facts that the *Needs:* line does not list: that there is at most one label, and Cauchy–Schwarz over N terms. Someone who proves only this case cannot tell from the line where those facts come from.

**Witness.**
- The at-most-one-label lemma is §2.2 *Cardinality above the circle diameter* (`README.md:1931`), from Mathlib `AddCircle.norm_le_half_period` (`Mathlib/Analysis/Normed/Group/AddCircle.lean:94`).
- Cauchy–Schwarz over N terms is Mathlib `sq_sum_le_card_mul_sum_sq` (`Mathlib/Algebra/Order/Chebyshev.lean:143`), applied after `norm_sum_le` (`Mathlib/Analysis/Normed/Group/Basic.lean:799`).

**Repair.** Append to `README.md:2429`: "Layer 2 §2.2 cardinality above the circle diameter; Mathlib `norm_sum_le`; Mathlib `sq_sum_le_card_mul_sum_sq`."

**Tested.** Take x=0, N=3, a=(1,1,1) and δ=0.6. The left side is 9 = N·Σ|a_j|², and the right side is (2+1/0.6)·3 = 11.

## Previous findings

- R01 — partly repaired: `README.md:4128` lists ArithmeticStatisticsPartVII as a consumer of §2.9, and `Suggested.lean:227` reads `hδ' : δ ≤ 1`. But #1178 `README.md:18` still says its target "owns" all three inequalities. Re-raised as R01.
- R02 — partly repaired: `README.md:4129` names ArithmeticStatisticsPartIII (§2.23) and InverseGaloisAndArithmeticFundamentalGroups (IG.2.5, IG.2.7) as consumers. But #1174 `README.md:2082` still proves degree-uniform Lang–Weil by induction. Re-raised as R02.
- R03 — repaired: `README.md:1083` now reads "`Σ_(1≤d<z,(d,k)=1) μ(d)²/φ(d) ≥ (φ(k)/k) log z`", located at "(HB-SIEVES, proof of Corollary 3.1, (3.2), p.13)". PNT-PLUS is described as the k=1 case with cutoff d²≤level, at commit 127b50e.
- R04 — partly repaired: IEANTN is deleted, PNT-PLUS is pinned at commit 127b50e and recorded in `sources.toml`, and `README.md:4342` gives the LANG-WEIL-54 DOI. DAVENPORT-51 and LANG-WEIL-54 still have no manifest entry. Re-raised as R03.
- R05 — repaired: both declarations are deleted. `README.md:500` "**Maximum-row Gram inequality.** If I is nonempty, …" and `:512` keep the targets without Lean names, and the docstring lists two Gram headlines. The deletion broke a consumer citation, which is new finding R04.

## Verified sound

**Gate, dependencies, build.**
- My rerun of the gate on this head prints every scanner at 0, ending `depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's gate (`gate.md`) adds `build=0`.
- The dependency check prints `depcheck: 238 roadmaps, 2349 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- `lake env lean Suggested.lean` exits 0 with 43 `declaration uses 'sorry'` warnings and nothing else. The previous head had 45; the two deleted declarations account for the difference.
- The diff outside the folder is empty. The folder holds README.md, Suggested.lean and metadata.toml.

**Lean form.**
- I ran `#check @…` in a scratch copy:
  - `SieveTaper.sharp_additive_largeSieve` elaborates with `1 ≤ H`, `0 < δ`, `δ ≤ 1`, separation `δ ≤ ‖(x i − x j : UnitAddCircle)‖` for `i ≠ j`, and constant `↑H − 1 + 1/δ`;
  - `sharp_primitive_largeSieve` and `sum_norm_inner_sq_le_of_row_le` keep `1 ≤ Q`, `1 ≤ H`, `[RCLike 𝕜] [InnerProductSpace 𝕜 E] [Fintype ι]`.
  - These match README §2.9 and §0.4.
- One-tactic probe: each `sorry` was replaced by `first | (rfl; done) | (simp; done) | (norm_num; done) | (positivity; done) | (infer_instance; done) | (decide; done) | sorry`. All 43 `sorry` warnings remain, so no declaration is padding.
- There is no `set_option`, no `lemma` and no sorry'd data. The imports are unchanged.
- The docstring's headline list matches the declarations.

**Library declarations opened at the Mathlib pin.**
- `AddCircle.norm_le_half_period` (`Analysis/Normed/Group/AddCircle.lean:94`, ‖x‖≤|p|/2).
- `UnitAddCircle` (`Topology/Instances/AddCircle/Real.lean:51`).
- `Real.fourierChar` (`Analysis/Complex/Circle.lean:221`; `fourierChar_apply` :232 gives exp(2πix)).
- `norm_sum_le` (`Analysis/Normed/Group/Basic.lean:799`).
- `sq_sum_le_card_mul_sum_sq` (`Algebra/Order/Chebyshev.lean:143`).

The widened theorem is true at the pin: two distinct labels force δ≤1/2 by `norm_le_half_period`, so for 1/2<δ≤1 there is at most one frequency and Cauchy–Schwarz applies.

**Changed locators read at the source.**
- HB-SIEVES:
  - lines 600–687: H_k(z) has cutoff d<z; the squarefree-kernel identity and the splitting by l=(d,k) are on pp.12–13; (3.2) is on p.13 with constant one.
  - lines 885 and 902: (3.5) is on p.17 and (3.6) on p.18.
- KED-chap-largesieve:
  - line 514: Theorem 15.5 is stated for δ∈(0,1/2];
  - line 527: the proof gives δ⁻¹+N;
  - lines 564–584: Exercise 15.4.2 is the Hilbert bound and Exercise 15.4.4 (Cohen) is the −1 improvement.
- KED-ANT-18: Theorem 18.5 is at line 630, and Exercise 18.4.4 ("prove Theorem 18.5", line 702) is under Exercises 18.4 at line 677.
- KED-chap-bombieri: Theorem 17.4 is at line 431, with Q=x(log x)^(−B), consistent with §3.4's Q≤x/(log x)^B.
- PNT-PLUS at 127b50e:
  - lines 368–370: `selbergBoundingSum_ge_sum_div` assumes that every prime ≤ level divides P and that ν is completely multiplicative, nonnegative and <1 on P. With `BoundingSieve.nu_pos_of_prime`, ν cannot vanish at a prime of k below the level, as `README.md:1085` says.
  - lines 500–511: its specialisation `boundingSum_ge_log` gives log(level)/2.
- The manifest entry PNT-PLUS records that commit, sha256 02267a31…, and status certified.

**Seeded sample.** None of the 15 sampled targets (0.6, 0.8, 0.9, 0.10, 0.11a, 1.4, 2.5, 3.0, 3.1, 3.2, 4.1, 4.6, 4.8, 5.1, 5.5) lies in a changed passage. Under the incremental rule they are not re-read; the review at 8111bc5 read 0.8, 1.4 and 3.1 at their sources.

**Cross-roadmap citations resolved.** I checked each Downstream consumers line against the consumer's README at its open head (heads confirmed with `gh pr view`):
- ExplicitZetaBounds (#1954, :374–378, §2.9).
- ExplicitPrimeCounting (#1945, :463–472; see R05).
- ArithmeticStatisticsPartIII (#1174, §2.23 at :2074).
- InverseGaloisAndArithmeticFundamentalGroups (#850, :303–307, IG.2.5 and IG.2.7, §5.4).
- GeometryOfNumbersAndQuadraticArithmetic (#851, :233–262, §0.11a).
- ErdosProgressionPowers (#1336, :110, :695–704, :1532; see R04).
- CircleMethodThreePrimes (#1803, :91–97: `vaughan_identity`, incomplete logarithm λ_V, §2.4).
- ArithmeticStatisticsPartV (#1175, :61, :2128–2146: quadratic ideal residue symbol, C_d, joint-spin prime bound, §5.6).
- ArithmeticDirichletSeriesPartII (#1415, :123, :1313, τ_k, §1.1).
- ExplicitMultiplicativeFunctions (#1946, :132, :200, :417–422, §§0.5 and 1.1).

The cited sections match this README:
- §3.1 is at :2568 and defines `SieveDistribution.primeCountAP` (`Suggested.lean:382`);
- §5.4 is at :3570, §5.6 at :3944, §0.11a at :1002 and §2.4 at :2041.

**Adversarial table, changed statements (computed this round).**

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §1.1 uniform lower bound, constant 1 | (k,z)=(1,2),(2,3),(6,4),(1,3),(4,4),(2,4),(30,8) | sums 1,1,1,2,3/2,3/2,7/6 against 0.693,0.549,0.462,1.099,0.693,0.693,0.555 | holds |
| §1.1, exhaustive | k≤120, z=n+1 with n<400 (the worst z for a strict cutoff) | least slack 0.307, at (k,z)=(1,2) | holds with c=1 |
| §1.1 proof route | k=1, z=3: Σ_(rad n<3) 1/n; k=2, z=4: H₁(4)=H₂(4)+H₂(2) | 2=2; 2.5=1.5+1 ≤ (2/1)·1.5=3 | the splitting identity is right |
| §0.4 maximum-row (README only) | x=1, y=(1,2); two equal unit vectors | rows 3,6: 5≤6; 2≤2 | holds |
| §0.4 diagonal/off-diagonal (README only) | x=1, y=(1,2); empty family with D=−1, O=0 | D=4, O=2: 5≤6; 0≤−‖x‖² fails | holds; D+O≥0 is needed |
| §2.9 `sharp_additive_largeSieve`, δ≤1 | δ=1, one point 0, a=(1,1); same with δ=2; points 0 and 1/2, δ=1/2, H=1 | 4≤4; 4>3; 2≤2 | holds; δ≤1 is sharp |
| same, random | 3000 random δ-separated families, H≤8, at most 6 points, δ∈(0.02,1] | least slack 0.00026>0 | holds |
| same, equispaced | R points r/R with δ=1/R, a=1: (R,H)=(2,2),(3,3),(4,1),(4,4),(5,7) | 4≤6, 9≤15, 4≤4, 16≤28, 55≤77 | holds |
| §2.9 `sharp_primitive_largeSieve`, route at Q=1 | H=2, a=(1,1); H=1, a=2+i; Q=2 | 4≤4 (δ=Q⁻²=1); 5=5; δ=1/4, constant H+3 | holds |
| §2.9 forbidden residues | Q=2, 3 | δ=1/4, 1/9 ≤ 1/4 | holds |
| §3.4 Barban–Davenport–Halberstam locator | Theorem 17.4 against README hypotheses | Q=x(log x)^(−B) against Q≤x/(log x)^B | consistent |

**Adversarial table, carried forward from the review at 8111bc5 (statements untouched by the diff).**

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 0.1 Legendre identity | support 1..10, P=6; support {0,1,2,3,6} | S=3=10−5−3+1; S=1=5−3−3+2 | holds |
| 0.1 remainder cutoff | P=6, c(2)=1, c(3)=−1, R₂=R₃=1 | errSum=2 | holds |
| 0.2 finite family | n(10−n), 2≤n≤8 | 4 labels {16,21,24,25}, multSum(1)=7 | holds |
| 0.3 residue sieve | Q={2,3}, Ω₂=∅, Ω₃={1}, samples −2..3 | P=3, S=4 | holds |
| 0.4 `selberg_weighted_inner` | x=1, y=(1,2); y=1/2 with squared denominators | 1/3+4/6=1; 4>1 | holds |
| 0.4 `sum_norm_inner_sq_le_of_row_le` | same data; two equal unit vectors | 5≤6; 2≤2 | holds |
| 0.5 `remainderMass` | P=6, every R_d=1, D=1,2,3,6,7 | 0,1,2,3,4 | holds |
| 0.6 `discriminantValue` | (5,2),(8,2),(8,3),(−3,2),(−7,2) | −1,0,−1,−1,1 | Kronecker values |
| 0.7 ρ, ρ̃, θ_Q | Q=x₀ at 9; Q=0 at 4; Q=2 at 2,4 | 9/9; 16/0; ρ̃(2)=4, ρ̃(4)=0; θ=5/3 | holds |
| 0.8 conics | x²−y² mod 3; B.8 at p=3, u=u_A=ω=1, k=1, ε=−1 | 5 (source 1); 18 (source 9) | README corrections right |
| 0.9 ℤ[i] counts | r(5), r(25), r(3), r(9) | 2, 3, 0, 1 | holds |
| 1.2 `fundamental_estimate` | κ=1, K=2, u=10 and 20 | δ=1024 and 0.04649 | holds |
| 1.3 Selberg weights | P=6, ν(2)=1/2, ν(3)=1/3, z=4 | G=5/2, λ=(1,−4/5,−3/5,0), main sum 2/5 | holds |
| 1.4 character Gram Check | (0,0),(1,0) with ±1, moduli 1,2 | total 8, energy 2 | holds |
| 1.5 BSKK v_p | ℓ=11 | ⌈1.5+2log 11⌉=7 ≤ 3log 11≈7.19 | holds |
| 1.6 `prime_interval_upper` | y=2 | right side ≥5.77, left side ≤2 | holds |
| 2.2 taper | δ=1/2, L=2; δ=3/10, L=3 | 3.645≤4; 6.046≤6.667 | holds |
| 2.4 `vaughan_identity` | n=12, U=V=2; n=4, U=V=1; n=0 | Λ(12)=0; Λ(4)=log 2; 0=0 | holds |
| 2.7 Jutila, `prime_quadratic_bilinear` | X=3, Y=1; X=12, Y=1; K=4, L=9 | 1; 9; 30≤36 | holds |
| 2.8 Farey | p=2, ℓ=1, m=2 | 2≤4 | holds |
| 2.9 Linnik | N=16, ε=1/2 | 28 smooth numbers, 511 | holds |
| 3.0 `small_conductor_maximal` | χ mod 3, x=y=3, s=1 and s=2 | −log 2; 0 | holds |
| 3.1 `PrimesHaveLevel` | discrepancy(10,3), discrepancy(5,3) | 1, 3/2 | holds |
| 3.2 convolution | δ₂*δ₃ at q=5 | 3/4 | holds |
| 3.4 variance and correlation | point mass at 1, Q=3; Δ=1/16, x=16, y=1, Q=2 | 1/2; 3 against 6.093 | holds |
| 4.3 M_k | k=1; triangle; F=x on the triangle | M₁=1; 4/3; I=1/12, J=1/20 and 1/30 | holds |
| 4.6 `maynardM_five_ge` | k=5 witness | J/I=1417255/708216≈2.001162 | holds |
| 4.6 `four_lt_maynardM_105` | 42 monomials | ratio ≈4.0020698>4 | holds |
| 4.5 `infinite_many_primes_of_level` | k=0; k=1 | M₀=0; M₁=1 | holds |
| 5.2 linear sieve and Rosser | F(1), f(3); Λ₂, Λ₃ | 2e^γ, 2e^γ·log 2/3; 1.834, 2.772 | holds |
| 5.3 Cₘ Check | χ mod 3 on (0,2] and (1,3] | 0 and −1 | holds |
| 5.6 spins, kernel reciprocity | 3−t at σ and σ²; α=1+8t, β=1+16σ(t) | −1, 1; Φ(α,β)=1, Φ(β,α)=−1 | holds |
| `joint_spin_sign_equidistribution` | S=∅ | limit 1 | holds |
| `lattice_count_lt_successive_minima` | unit square; d=1 | 9<18; 3=3, so d≥2 is needed | holds |
| `lang_weil_uniform` | x²−2y², p≡±3 mod 8; e=0 | 1 point against p; a geometric point is rational | holds |

**Remarks on text the diff leaves untouched (no change requested).**
- InverseGaloisAndArithmeticFundamentalGroups, ArithmeticStatisticsPartV and ErdosProgressionPowers are at `ORDER.txt` lines 52–54, just above this roadmap (55), although they consume it. Their own submissions move them; this roadmap's dependency check is clean.
- ExplicitMultiplicativeFunctions (#1946, :422) quotes the §1.1 uniform bound with an unnamed constant c, and ExplicitZetaBounds (#1954, :377) quotes `sharp_additive_largeSieve` for 0<δ≤1/2. Both are implied by the statements here.
- The overlaps lead "IntegralLattices Layer 0 only at #1797" is a false positive: main 12ed9bd has `TauCetiRoadmap/IntegralLattices/README.md:536` (Layer 0) and `:744` (Layer 3).

## Not verifiable

- DAVENPORT-51 and LANG-WEIL-54: journal articles behind publisher paywalls, not in the sources cache. Only the LANG-WEIL-54 DOI was checked, through Crossref metadata (R03).
- Not re-requested, because their status is settled; they are cited by locator:
  - FIMR-ERRATUM-2015, BGS-10, DFI-1997 and SCHNEIDER-11 (settled uncertified);
  - CHEN-73-CN, HR-SIEVE, HR-1974, RICHERT-1969, KM-16RANK-published and KM-KERNEL-PUBLISHED (settled waived).
- Ownership against open pull requests was checked only for the objects the diff touches: the §0.4 Gram inequalities, §1.1, §2.9, §5.4 and the consumers named in the new Downstream consumers list.

## Source issues

- **Misprint** in HB-SIEVES at the Brun–Titchmarsh Theorem (3.6), p.18: the source says the bound holds for x ≥ 4φ(k); it should be x ≥ 4k, the range its derivation on p.17 assumes; affects a stated result.
