# Review of ArithmeticStatisticsPartVIII (pull request #1179 at 8a18df3)

**Verdict:** needs changes

## R01 (P1) — Supply the uniform Betti theorem instead of assuming it

**Location:** `TauCetiRoadmap/ArithmeticStatisticsPartVIII/README.md:92`: “Section 5.19 is conditional on this hypothesis”; also lines 1215, 1231, 1249, 1765 and `TauCetiRoadmap/ArithmeticStatisticsPartVIII/Suggested.lean:26`.

**Claim:** The large-q Cohen–Lenstra endpoint still assumes the uniform-in-degree Betti theorem (HS). The cited parent supplies fixed-degree comparison, not this uniform bound. No declared gap supplies it. Making the endpoint conditional does not complete the promised development.

**Witness:** Fixed-degree bounds Bₙ=n do not imply a common C² bound at i=1: C=2,n=5 gives 5>4. The parent explicitly excludes stability at `TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroups/README.md:5922`; EVW proves it at ref-37 line 1628 and line 1647.

The existing owner remains `packages/InverseGaloisAndArithmeticFundamentalGroupsPartII/design/README.md:842`, HS.5/uniform-etale-betti, with its prerequisite chain at line 844. It is position 208 in `merge-order/ORDER.txt`, after this roadmap at position 130. These passages were reopened. The numerical countermodel distinguishes quantifiers; it does not assert that C=2 is the actual Hurwitz stability constant. For any proposed finite C, choosing n>C² gives the same distinction.

**Exact repair:** Put the existing stability development and its prerequisite chain before the consuming continuation, then import HS.5/uniform-etale-betti with finite centre-free G, a rational nonidentity generating nonsplitting class, tame characteristic and coefficient prime λ>max(|G|,q,n). Move the consumer later, or coherently move the supplier chain earlier; do not duplicate it or introduce an upward dependency. Replace the free HS assumption throughout the endpoint chain with that supplied theorem.

**Repair test:** For A=C₃, G=S₃ and transposition inertia, the group has order 6, trivial centre and a generating class of size 3. The uniform supplier supplies a single C for all branch degrees, which excludes Bₙ=n. Fixed-degree comparison alone still permits it.

This carries forward previous R01. The available earlier repair record labels H01 open and expressly says that “answered” does not mean mathematical resolution; it does not mark it “not actionable in this package”. Its explanation that the repair needs a broader ordering decision is consistent with the remaining defect, not evidence that the required theorem is supplied.

## Previous findings

- R01 — not repaired: README line 92 still assumes (HS), and lines 1215, 1231 and 1249 retain that assumption. The parent explicitly supplies only fixed-degree comparison; the uniform theorem's existing owner remains later in the merge order.
- R02 — repaired: README lines 1727 and 1747 require odd target order and establish a nonbottom allowed-q filter by CRT and Dirichlet. Lines 1741 and 1759 exclude the admissible even-order example; the trivial target remains included.

## Verified sound

This is an independent AI incremental re-review of 22 changed lines since c1c3396. Only README lines 47 and 1727–1761 changed. Suggested.lean and the library pins are unchanged. The changed statements, their Checks, their source passages and the relevant supplier contracts were reopened; unchanged mathematical rows below are explicitly inherited from [the previous report][previous], rather than claimed as new computations.

**Gate and scope.** The supplied head is 8a18df34dcc283ee4afbe3b2e0f7ebcbd65abb40. Both the incremental outside-folder list and the complete diff against origin/main contain no outside-folder changes. The worktree remains clean. The root README and CONTRIBUTING were read, together with the openings and structure of the main-branch MassFormula and StandardDistributions roadmaps. No pull-request file was edited.

The gate rerun returned:

```text
gate ArithmeticStatisticsPartVIII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The explicit dependency check returned:

```text
depcheck: 205 roadmaps, 1655 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. This does not detect an unlisted prerequisite such as R01. The worker's gate also records build=0. A fresh targeted build, `lake build TauCetiRoadmap.ArithmeticStatisticsPartVIII.Suggested`, succeeded (8976 jobs), and direct `lake env lean` elaboration succeeded. Both emitted exactly five warnings, all for `sorry`, at Lean lines 63, 73, 84, 95 and 123.

**Signatures and headlines.** A fresh elaboration of a scratch copy with `#check @name` for all nine declarations succeeded. All nine types were compared with the README: the three density definitions retain their native carriers and finite/nonzero binders; first moment retains prime p and d,r≥1; second moment and variance also retain n≥2; the second moment is an unnormalized sum. Integral lifting retains closedness, full reduction and the genus-one 3-adic level-nine condition. Stable surjections retain their actual similitude and surjectivity predicates; the orbit theorem retains finite freeness, finite target, perfect alternating pairing, rank, q−1 invertibility and the generation bound. No binder or signature changed.

The README headlines remain the three density estimates; polarized concentration; spacing/model obstructions; class-group/Hurwitz counts; uniform traces; hyperelliptic monodromy and integral lifting; stable similitude orbits and rational components; uniform moments and large-q Cohen–Lenstra; Wood good/bad moments and whole profiles; LWZB and CLM moments. Five are stated in Lean. The module docstring identifies the missing geometric/counting carriers for the others, including both changed §5.22 headlines. The added elementary filter argument needs no separate acceptance-test declaration. The previous fifteen unsuccessful one-tactic padding probes and the previous absence-of-duplicate-headline assessment are carried forward because the five theorem statements, four definitions and pins are unchanged; those probes were not rerun.

**Changed mathematics.** Admissibility supplies coprimality of h=|H| and g=|Γ|. For odd h, CRT gives a≡2 (mod h), a≡1 (mod g). Thus gcd(a,hg)=1, gcd(a−1,h)=1, and hg>0. Dirichlet supplies an allowed prime above each bound. This proves nonbottomness of the exact restricted filter, not merely one allowed size. At h=g=1, a=0 modulo 1 is coprime to 1 and the same theorem applies. For even h, q(q−1) is always even, so the original domain was empty. Neither finite-level semidirect counting nor even-order group theory has been removed.

**Pinned declarations reopened.** Paths below are relative to the named library, at Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039.

| File and line at pin | Declaration | Verified contract |
|---|---|---|
| `Mathlib/Data/Nat/ModEq.lean:472` | `Nat.chineseRemainder` | For coprime natural moduli, returns an actual natural residue with both congruences. Modulus one is allowed. |
| `Mathlib/Data/Nat/ModEq.lean:482` | `Nat.chineseRemainder_lt_mul` | The representative is below the product when both moduli are nonzero; no positivity of the representative is required. |
| `Mathlib/NumberTheory/LSeries/PrimesInAP.lean:462` | `Nat.forall_exists_prime_gt_and_modEq` | For nonzero modulus and coprime residue, supplies a prime strictly above any bound in that residue class. |
| `Mathlib/NumberTheory/LSeries/PrimesInAP.lean:467` | `Nat.frequently_atTop_prime_and_modEq` | The same two hypotheses give frequent prime occurrences atTop, matching the nonbottom-filter argument. |

The new paragraph imports these results instead of creating duplicate CRT or Dirichlet targets. Local object searches for Hurwitz carriers, homological stability and CLM did not find an implementation of the missing arithmetic theorem. Unchanged pinned-library checks and their file/line witnesses remain in the previous report.

**Sources and seeded sample.** Two texts were fetched through the sources service and read in this round: the publisher's [EVW text](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n3-p01-p.pdf) and [LWZB arXiv v2](https://arxiv.org/pdf/1907.05002v2). No source material or manifest was added to the pull request.

| Seeded target(s) | Evidence used this round | Outcome |
|---|---|---|
| 5.12–5.18 | Unchanged; source-locator checks and computed adversarial rows carried from [previous report][previous], covering density, concentration, spacing, Hurwitz counts, traces, monodromy and orbits | No claim of a fresh full source review. |
| 5.19 | EVW Proposition 7.8, printed pp.769–770, ref-37 line 1628–1658; Remark 7.9, ref-37 line 1659–1665 | Uniformity is a proved theorem using stability; fixed-degree comparison is distinct. R01 remains. |
| 5.20–5.21 | Unchanged; Wood source checks and component-profile rows carried from [previous report][previous] | Previous liminf versus ordinary-limit distinctions retained. |
| 5.22, changed LWZB theorem | Definition of admissibility, p.2, ref-51 line 61–64; Theorem 1.4, p.3, line 130–144; proof pp.40–41, line 1860–1922 | Oddness repairs the empty domain; the O(1/b) proof supports the retained iterated liminf/limsup statement. |
| 5.22, changed CLM corollary | Corollary 1.5 and class-field comparison, p.4, ref-51 line 152–168 | Oddness is imposed before the numerical limit. Fixed subgroup 1 changes the index reciprocal to 1/\|H\|. |
| 5.22, inputs to both statements | Lemma 9.3 proof, pp.38–39, ref-51 line 1785–1820; Lemmas 10.2–10.3 and Theorem 10.4, pp.39–40, line 1829–1855 | The isomorphism-class normalization cancels between numerator and denominator; rounding to allowed branch degree and the finite set of q-residues remain in the route. |

All eleven seeded targets are covered by either the fresh rows or the explicitly inherited evidence. No unread source is required for the incremental changes.

**Ownership and suppliers.** `roadmaps grep` searched the indexed main/open work for uniform Betti bounds, admissible Γ-groups and radical-discriminant moments; `roadmaps show` reopened the four relevant suppliers. The board stability design was checked directly. No new carrier or foundational theory is introduced by the repair. Its added general inputs are already in Mathlib; its statistical comparison remains distinct from the parent's Hurwitz construction. Other open work without supplied files was not independently reviewed; no additional unlisted pull request was sought.

The resolver reports no unresolved cross-roadmap citations. It reports that its remote host has no pinned Lake packages, so its library-name result is not treated as validation: the four declarations above were opened locally at the actual pins. Relevant `Needs` lines and the citations through the changed proof routes and R01 were read. The broader unchanged supplier audit is inherited from the previous report.

| Reopened supplier file | Location and resolved use |
|---|---|
| `TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroups/README.md` | §IG.0.T4, line 558: separated finite-type point-count trace. §IG.5.5, lines 5911–5925: fixed-degree comparison, explicitly distinct from stability; line 6119: marked Hurwitz/extension counts. §IG.5.6, line 6279: semidirect component comparison with the q(q−1) coprimality and allowed branch residues. |
| `TauCetiRoadmap/DeligneWeightsAndPurity/README.md:2254` | §7.12 supplies compact-support weight bounds; for constant weight zero the degree-j eigenvalue bound is q^(j/2). |
| `TauCetiRoadmap/ArithmeticStatisticsPartI/README.md:2567` | Supporting constructions retains the function-field reciprocity input, split removed places and Picard quotient; these are the class-field interfaces cited by the CLM route. |
| `TauCetiRoadmap/ArithmeticStatisticsPartIV/README.md:505` | §3.5 finite moment control: δ and a finite test set depend on the desired finite set and tolerance. It supplies the distribution step, not the missing uniform geometric input. |
| `packages/InverseGaloisAndArithmeticFundamentalGroupsPartII/design/README.md:842` | HS.5/uniform-etale-betti is the existing owner of R01's missing bound; its direct dependencies are at line 844. It is not currently an earlier supplier of this roadmap. |

**Fresh adversarial computations.** The finite actions, congruences and gcds below were recomputed. Infinite asymptotic conclusions are assessed from their proofs and sources, not inferred from the finite tests.

| Statement and location | Instances | Computed values on each side | Result / change |
|---|---|---|---|
| Added CRT/Dirichlet contract (47,1727) | (h,g)=(3,2),(9,2),(5,3) | Moduli 6,18,15; residues 5,11,7 respectively; gcd(a,hg)=1 in all three; a mod h=2 and a mod g=1 | Native library hypotheses satisfied; unbounded primes, not a new theorem target. |
| Restricted-filter nonbottomness, including modulus one (1727) | (h,g)=(1,3),(1,1) | Residues 1 mod3 and 0 mod1; gcd(1,3)=gcd(0,1)=1. q=7,13 give gcd(q,3)=gcd(q−1,1)=1 | Trivial target and modulus one retained; Dirichlet proves unboundedness. |
| Even-order exclusion (1727,1741) | h=4; q=0,1,2,3 modulo4 | gcd(q(q−1),4)=4,4,2,2 respectively; never 1 | No allowed q; oddness excludes before forming limits. |
| LWZB iterated moments and positive Check (1729,1739) | Γ=C₂ acting by inversion on H=C₃; q=5,125,3125 | Fixed subgroup size1; [H:H^Γ]⁻¹=1/3. Both required gcds are 1 at each q; CRT residue5 mod6. q=2,3 fail the first gcd; q=7 fails the second | Previous R02 repaired; O(1/b) asymptotics retain endpoint1/3. |
| Even admissible action and (SZ) Check (1741) | Γ=C₃, H=F₂²; T(x,y)=(y,x+y) | T cycles (0,1)→(1,1)→(1,0)→(0,1); T³=I. T−I sends those vectors to (1,0),(0,1),(1,1). Fixed subgroup size1; all four norms (I+T+T²)v=0; four conjugate sections | Admissible even example really satisfies (SZ), but the forbidden endpoint1/4 has empty q-domain and is excluded. |
| LWZB trivial-target Check (1743) | H=1, Γ=C₃; then Γ=1; b=0,1,2 | Index reciprocal1; q=7,13 allowed. If Γ=1, admissibility forces H=1; unique extension has radical norm1=q⁰; each cumulative numerator/denominator pair is (1,1) | Ratio1, including the degree-zero slice. |
| CLM iterated moments and inversion Check (1747,1757) | Γ=C₂, H=C₃ and C₃²; q=5,125 | Fixed subgroup sizes1,1; \|H\|⁻¹=1/3,1/9. gcd(q,6)=gcd(q−1,3)=1 and gcd(q,18)=gcd(q−1,9)=1 | Correct index normalization and same nonbottom filter. For C_(ℓ^k), inversion fixes only0 because2 is a unit. |
| CLM negative Check (1759) | Γ=C₃,H=F₂² with the preceding action | Fixed subgroup0 additively; gcd(4,3)=1; formal reciprocal1/4; allowed q-set has cardinality0 | Oddness excludes it; no numerical limit asserted. |
| CLM trivial Check (1761) | H=1, Γ=1; b=0 | One map and one extension, so1/1=1=\|H\|⁻¹ | Trivial target retained. |
| Unrepaired HS quantifiers (92) | i=1,C=2,n=5; general n>C² | B₅=5 versus C²=4; general Bₙ=n>C² | R01 persists; fixed-degree estimates cannot supply uniformity. |

**Inherited adversarial computations.** The following 87 rows carry forward the values from [previous report][previous]. Each row cites that report. Parenthesized README line numbers are its c1c3396 locators, not newly asserted head line numbers. The old two §5.22 limit rows are replaced by the fresh rows above. Mentions of previous R02 in inherited controls refer to the now-repaired defect.

| Statement | Instances tried | Values computed on each side | Result / change and provenance |
|---|---|---|---|
| Standing finite-field/average conventions (31) | q=1; empty slice; trivial group | q=1 is excluded; empty finite average is 0; trivial-target surjection count is 1 | Retain; a finite empty-average convention does not repair R02's empty outer filter. [Previous report][previous]. |
| Frobenius, pairing and matrix conventions (33) | J=[[0,−1],[1,0]], h=diag(1,2); A¹/𝔽₃ | hJhᵀ=2J, det(h)=2; geometric top-cohomology trace is 3, inverse arithmetic action there gives 1/3 | Retain arithmetic multiplier q and geometric trace q. [Previous report][previous]. |
| IG-a affine-branch interface (86) | Three transpositions generating S₃; trivial cover | 3³−3=24 generating tuples; free conjugation gives 24/6=4 covers; identity boundary would give 0; trivial datum gives 1 | Retain supplied scheme, including ramified infinity. [Previous report][previous]. |
| IG-b tangential parity comparison (88) | Imaginary/real n=1; multiplier C₃ | Finite branch degrees 1 and 2; compatible fixed-fibre sizes at q=5,7 are 1 and 3; incompatible fibre is 0 | Retain infinity type and multiplier torsion. [Previous report][previous]. |
| HS uniform Betti input (90) | i=1, Bₙ=n, C=2,n=5 | Fixed-degree bound 5; required common bound C²=4 | R01; import the uniform theorem through a valid order. [Previous report][previous]. |
| Hyperelliptic relative Jacobian adapter (123) | n=1,3; ℓ=3; dual-number base change; characteristic 2 | Dimensions 0,1; rank of 3-torsion 1,9. Base-change degree remains 9. In char 2, y²=x³+x+1 has both partials 0 at (1,1) | Retain g=0 split, entire infinitesimal base, and exclusion of char 2. [Previous report][previous]. |
| GN-a congruence-lattice index (137,145) | c=e₁,d=(1,3), Q=3,2; nonprimitive 2e₁,2e₂ at Q=2 | Indices 3=9/gcd(3,3), 4=4/gcd(3,2); nonprimitive actual index 1 versus proposed 4/gcd(4,2)=2 | Retain independence/primitivity; repaired ownership stays repaired. [Previous report][previous]. |
| GN-b model rings/involutions (139,147) | Gaussian 2×2 matrix; Hamilton generators; product of two Gaussian rings | [[0,1+i],[2,0]]*= [[0,2],[1−i,0]]; (ij)*=−ij=j*i*; (i,1+i)*=(−i,1−i) | Retain conjugation, transposition and componentwise action. [Previous report][previous]. |
| GN-b positive-unit orbit cardinalities (147) | Empty product; imaginary-quadratic rank one; Gaussian rank eight; quaternion ranks 0,1 over ℚ(√2),ℚ(√5) | Counts 1,1,≥2; I₈ has norm 1, E₈ has even norms. Quaternion counts 1,1; positive central units are squares in the rank-one examples | Retain orbit count, not unit count or mass. [Previous report][previous]. |
| GN-c logarithmic bound/product rule (141,149) | Single degree-one block; two independent blocks of ranks g/2 | Factorial sum has coefficient 1/2 in g²log g; two equal blocks give coefficient 1/4. Product of two count-one blocks is 1 | Retain corrected coefficient and indexed blocks. [Previous report][previous]. |
| GN-d quaternionic genus/mass/bound (143,151) | m=0,1,2; dimension g=2m | Masses 1, abs(ζ_K(−1))/4; ratio M₂/M₁=abs(ζ_K(−3))/4. Leading term 2m²log m=(g²/2)log g−(g²/2)log2 | Retain genus mass versus free-class count and dimension factor. [Previous report][previous]. |
| Polynomial congruence (207) | f=X², x=1,h=3 in ℤ; f=0; zero ring | f(4)−f(1)=15∈(3); zero differences 0∈I | Retain all commutative rings. [Previous report][previous]. |
| First-order Taylor (223) | Same integer data; square-zero ε; characteristic 2 | 16−1−2·1·3=9∈(3)²; ε²=0 gives remainder 0; in char 2 the derivative is 0 and remainder h² | Retain derivative coefficient and I². [Previous report][previous]. |
| Primitive vectors, coefficient form, density definitions (243; Lean 44–58) | q=2 in three coordinates; q=1; empty coordinate set; d=2 binary form X²+Y² | Primitive count 7; zero vector fails over 𝔽₂. Over ZMod 1 the unique vector is primitive and density is 1. Empty coordinates give 0 primitive vectors over 𝔽₂, 1 over the zero ring. Form at (1,1) is 2; zero coefficients give 0 | Real definitions agree with Part I. q=0 has no NeZero instance for finite density; the polynomial definition alone still makes sense. [Previous report][previous]. |
| First local-density moment (239; Lean 63) | (d,n,p,r)=(1,0,2,1),(1,1,3,2),(2,2,2,2),(2,2,3,1) | Enumerated means 0,2/3,31/36,121/126; displayed formula gives exactly 0,2/3,31/36,121/126. Primitive coefficient counts 1,72,4032,728 | Retain n=0 and N−1=0 boundary; r≥1 makes denominator positive. [Previous report][previous]. |
| Two-point incidence (261) | d=1,n=1,p=3,r=2; b=e₁, second vector e₂,(1,3),e₁ | Capped minor valuations 0,1,2; primitive annihilator counts 0,0,6; formula gives 1−1,3−3,9−3 | Retain capped valuation and primitive coefficient correction. [Previous report][previous]. |
| Veronese minor valuation (277) | Degree 2, (1,0),(1,3) mod 9; equal vectors | Linear minor content 3; quadratic contents 3,9,0 have gcd 3; equal-vector content 0 capped at gcd(0,9)=9 on both sides | Retain positive degree and primitivity. [Previous report][previous]. |
| Primitive-pair minor gcd sum (295) | Seven primitive vectors of 𝔽₂³, all 49 ordered pairs | Diagonal 7 contributes 14; off-diagonal 42 contributes 42; total 56≤113 (bound) | Retain including equal pairs. [Previous report][previous]. |
| Second local-density moment (311; Lean 73) | (1,2,2,1),(2,2,2,2),(2,2,3,1),(2,3,2,1) | Exact sums 63/16≤113/8; 3584≤7232; 62504/81≤1162; 61215/64≤1412 | Retain unnormalized sum, n≥2 and p=2. [Previous report][previous]. |
| Local variance (329; Lean 84) | Same four density instances | Means of (σ−1)²: 1/16≤2; 1/6≤2; 79/567≤4/3; 1349/21824≤1 | Retain uniform constant 4. [Previous report][previous]. |
| Gradient valuation/strata (347) | Vectors (1,0),(3,0),(0,0) mod 9; f=X₀X₁ in three variables | Capped valuations 0,1,2. Zeros (1,0,0),(0,0,1) have gradients of valuations 0,2 for the same form | Retain overlapping strata; they are not a partition by coefficient vector. [Previous report][previous]. |
| High-gradient stratum bound (387) | Quadratic forms in three variables, r=1, p=2,3 | Stratum e=1 cardinalities 35≤64 and 260≤486; e=0 counts 49,624. Overlap gives 49+35=84>63 and 624+260=884>728 | Retain e≥1 and no disjointness claim. [Previous report][previous]. |
| Fixed-gradient Hensel (403) | F=3t, p=3,δ=1,A=3, m=3,4; excluded F=t²,A=0,m=2 | Counts 3,3 and normalization p^(s−1)=1. Excluded quadratic has 2 roots with valuation-one derivative mod9 but 0 lifts mod27 | Retain m≥2δ+1 and δ≤m−ℓ. [Previous report][previous]. |
| Density lower bound (419) | X₀ in three variables mod2, e=0; X₀² mod4, e=2 | Densities 3/4≥1/4; 24/16=3/2≥2^(−6)=1/64 | Retain normalized count can exceed 1. [Previous report][previous]. |
| Convex concentration (437) | g=100,ε=.99,x=(99,1); balanced three blocks; g=0 | 99²+1²=9802=(.99²+.01²)100²; 10000/3<9802; empty sum 0=0 | Retain boundary equality and nonnegative inputs. [Previous report][previous]. |
| Weighted-square concentration (455) | C=0,g=100,(k,n)=(2,50); excluded (1,100) | 2500log50≈9780.06<4950log100≈22795.59; excluded 5000log100≈23025.85 exceeds bound | Retain dominant elliptic-block exclusion; no finite test asserts the general g₀. [Previous report][previous]. |
| Model-ring concentration (473) | One imaginary-quadratic block versus two equal blocks | Leading coefficients in g²log g: 1/2 versus 1/4; threshold .495 separates them | Retain using corrected GN-c. [Previous report][previous]. |
| Quantitative unpolarized count (491) | Dimension 0; two curves over 𝔽₅ | B(5,0)=1, log B=0. y²=x³−x has 8 points, y²=x³+x has 4; thus B(5,1)≥2 | Retain prime-field scope and asymptotic constant; finite values do not estimate that constant. [Previous report][previous]. |
| Polarized concentration (509) | E^g; real-Weil B₀^m; genus 1 | h/g=1; g=2m and 2m²log m=(g²/2)log g+O(g²); every ppav of dimension 1 is elliptic, bad count 0 | Retain both stated model assumptions and dimension-two real-Weil contribution. [Previous report][previous]. |
| Kolmogorov distance/API (529) | δ₀,δ₁,η=(δ₀+δ₁)/2; identical measures | Distances 1,1/2,1/2,0; triangle inequality is equality 1=1/2+1/2 | Retain probability/Borel hypotheses and CDF equality criterion. [Previous report][previous]. |
| Normalized spacing measure/API (549) | Angles (0,0,π,π); four identical angles; one angle; empty multiset | Gaps (0,2,0,2), (0,0,0,4), (1); each has mass 1 and mean 1. Empty input has no positive N and is excluded | Retain multiplicity, cyclic gap and N/(2π) normalization. [Previous report][previous]. |
| Zero-gap mass (579) | (0,0,π,π), g=h=2; two distinct angles g=h=1 | Zero masses 1/2=2(h−1)/(2g), 0=0; four identical angles have 3/4≥1/2 | Retain h−1, allowing coincident conjugate angles. [Previous report][previous]. |
| Atom discrepancy bound (597) | μ=(δ₀+δ₁)/2,ν=δ₁; swapped μ,ν | d_K=1/2≥μ{0}=1/2 in the stated direction; swapping loses the required atom in μ | Retain support and zero-atom assumptions. [Previous report][previous]. |
| Ppav spacing discrepancy (613) | E^g with distinct eigenangles; h=990,g=1000 | Zero mass 1−1/g for E^g; general lower bound (h−1)/g=.989, tending to .99 at proportion .99 | Retain liminf claim; no finite-g .99 assertion. [Previous report][previous]. |
| Enhanced-model obstruction (631) | F₃ elliptic trace 1; F₅ trace −2; p=2 negative control | Point counts (3,15) over F₃,F₉; (8,32) over F₅,F₂₅. y²+xy=x³+x²+1 over F₂ has counts (2,8), with no odd torsion | Retain odd p; model positivity comes from the named Part VII input. [Previous report][previous]. |
| Generalized-dihedral datum/API (649) | A=C₃; A=0; nonabelian G=S₃ | Three involutions, centre 1, generated subgroup order 6. A=0 gives C₂, centre order 2 | Retain nontrivial A for centre-free Hurwitz use. [Previous report][previous]. |
| Class-group surjection pairs/API (685) | Cl=C₃,A=C₃; A=0; genus-zero class group | Two surjections give one sign orbit; trivial target gives one sign-fixed map; 0→C₃ has 0 surjections | Retain marking and trivial-target exception. [Previous report][previous]. |
| Involution quotient (725) | J=C₃⊕ℤ₃, involution (−1,+1); analogous ℓ=2 | (1+σ)J=0⊕ℤ₃, quotient C₃; at 2 the constant summand leaves ℤ/2 | Retain odd ℓ and removal of the constant direction. [Previous report][previous]. |
| Hurwitz/class-group dictionary (741) | Cl=C₃,A=C₃; three S₃ branch points; genus zero | One sign class per two surjections; total S₃ fibre 24/6=4; zero class group gives 0 nontrivial-target covers | Retain affine-branch supplied carrier and unmarked quotient. [Previous report][previous]. |
| Factor-two point count (759) | One class group C₃ mapping to C₃; A=0 | 2=2·1; trivial target gives 1≠2·1 and is outside the nontrivial-target formula | Retain explicit separate case. [Previous report][previous]. |
| Empirical primary law/API (775) | Cl=C₂×C₃,ℓ=3; one-object slice; empty slice | Primary mass at C₃=1; surjections to C₃: 2=2 after primary projection; empty finite law has mass 0, not 1 | Retain primary carrier and nonempty probability-slice hypothesis. [Previous report][previous]. |
| Upper/lower degree densities (809) | Alternate 0,1 on odd degrees; constant 1/2 | liminf=0,limsup=1; constant gives 1/2 on both sides | Retain both limits; no ordinary-limit inference. [Previous report][previous]. |
| Top component trace (831) | A¹/F₃; two rational copies; conjugate pair; one fixed plus a swapped pair; empty | Traces 3,6,0,3,0=q·(1,2,0,1,0) fixed components; total component counts 1,2,2,3,0 | Retain fixed-component trace and geometric Frobenius. [Previous report][previous]. |
| Uniform trace estimate (847) | A¹/F₁₆,C=1; zero-dimensional point; q=1 | Errors 0≤1/(4−1)=1/3, and 0; q=1 fails √q>C | Retain strict denominator condition and pure dimension. [Previous report][previous]. |
| Hyperelliptic torsion local system (873) | g=0,1,ℓ=3,levels1,2; characteristic ℓ | Ranks 1,9,81; det J=1. In characteristic ℓ an ordinary elliptic curve has only ℓ geometric ℓ-torsion points, not ℓ² | Retain invertibility and genus-zero conventions. [Previous report][previous]. |
| Geometric Jacobian cover comparison (891) | P¹; elliptic curve over algebraically closed field, A=C₃, char≠3 | Connected pointed C₃ covers: 0,8; surjections from rank-0/rank-2 ℤ₃ modules: 0,3²−1=8 | Retain pointed prime-to-characteristic comparison. [Previous report][previous]. |
| Unmarked geometric Hurwitz fibre (909) | g=1,A=C₃ | Surjections 8; quotient by sign 4; −I exchanges the members of each pair | Retain unmarked fibre; not eight labelled covers. [Previous report][previous]. |
| Boundary degeneration (927) | Compact-type chain of three elliptic curves; one loop graph | Compact-type Jacobian dimensions 1+1+1=3, torsion rank 2+2+2=6, pairing J⊕J⊕J. Loop graph has torus rank 1, unlike tree rank 0 | Retain compact type and overlapping summands. [Previous report][previous]. |
| Overlap generation (945) | Three rank-two blocks over F₃; zero middle block | Full Sp₆ order 3⁹·8·80·728=9170703360; zero-overlap product order 24²=576<Sp₄ order 51840 | Retain positive overlap; excluded case cannot generate the full group. [Previous report][previous]. |
| Mod-ℓ monodromy (961) | g=1,ℓ=3; g=0 | Full rank-two symplectic group has 24 elements; rank-zero group has 1 | Retain positive-genus theorem and separate trivial case. [Previous report][previous]. |
| Integral lifting (977; Lean 95) | Mod9 subgroup generated by [[0,1],[8,0]], [[1,7],[6,7]] | Generated order 24; reduction order 24; mod3 kernel order 1. Full SL₂(Z/9) order 648, index 27 | Retain exceptional nontrivial mod9-kernel hypothesis; full mod3 image alone fails. [Previous report][previous]. |
| Legendre inertia (997) | t=s³, local node; ℓ=3 | z²−y'²=t²/4 gives thickness 2; ramification gives thickness 6. U³ mod9=[[1,6],[0,1]], while mod3 it is I; N²=0 | Retain factor 2 and positive period convention. [Previous report][previous]. |
| Integral hyperelliptic monodromy (1013) | Genus-one, ℓ=3 Legendre element | U³−I is 0 mod3 but has nonzero entry 6 mod9 | Retain geometric input that excludes the 24-element lifting counterexample. [Previous report][previous]. |
| Odd-degree polynomial-family monodromy (1029) | n=3 and n=1; lifted affine group for n=3 | Genus (n−1)/2 is 1,0. d²=a³ is parametrized by a=u²,d=u³, giving connected G_m; target ranks 2,0 | Retain lifted group, not quotient that forgets the involution. [Previous report][previous]. |
| Finite-level monodromy (1045) | g=1,ℓ=3,m=1,2 | Target orders 24,648; level-two reduction kernel 27 | Retain full finite levels and exceptional integral input. [Previous report][previous]. |
| Similitude subsets/API (1063) | h=diag(1,2) over Z₃; multiplier 3; rank zero | hJhᵀ=2J, det=2 a unit; diag(1,3) has multiplier/determinant 3 and is not invertible. Rank-zero matrix is unique for every multiplier | Retain distinction between matrix subsets and unit-multiplier group. [Previous report][previous]. |
| Orbits/components (1085) | Sur(F₃²,F₃), q=2 | Eight nonzero row vectors form one Sp₂ orbit; their four sign classes form one orbit; fixed-orbit count 1 | Retain quotient and Frobenius-stable orbit interpretation. [Previous report][previous]. |
| Topological primary decomposition (1101) | Z₅, h=diag(6,1/3),q=2; q=1,h=I | Primary summand ranks (1,1,0); exact generalized 1-eigenspace has rank 0 although h−1 is topologically nilpotent on first coordinate. At q=1 both primary parts equal V | Retain q−1 unit and genuine topological definition. [Previous report][previous]. |
| Integral symplectic normal forms (1121) | Rank0; rank2 standard pairing; submodule Z₃(3e); form 3J | Empty basis; ω(e,f)=1 after sign choice. Quotient by 3e has C₃ torsion, so not a direct summand; det(3J)=9 nonunit despite zero radical | Retain perfectness and primitive direct summand, not mere nondegeneracy. [Previous report][previous]. |
| Killed Lagrangian (1137) | h=diag(2,1), f(x,y)=y mod3 | f∘h=f; f(e)=0; ω(e,e)=0; rank Z₃e=1=rank(V)/2 | Retain isotropic kernel summand. [Previous report][previous]. |
| Lattice-surjection transitivity (1153) | Z₃→Z/9; g=0,A=0 or C₃ | Six surjections (unit images), one GL₁ orbit; rank0 counts 1 or0 | Retain generation bound and nonempty conclusion only when possible. [Previous report][previous]. |
| Stable-surjection definition and unique orbit (1173; Lean 113,123) | g=1,A=C₃,q=2; g=0,A=0; negative q=1,g=2,A=C₃² | Stable surjections 8, orbit count1; rank0 has one map and one orbit. At q=1, quotients onto (x₁,x₂) and (x₁,y₁) induce alternating ranks 0 and2, hence distinct orbits | Retain finite target, perfect pairing and q−1 unit; zero map excluded unless A=0. [Previous report][previous]. |
| One rational component (1193) | A=C₃,g=2,q=5; q=7 excluded | Generator bound 2≥1; q−1=4 is a Z₃-unit, giving one orbit/component. At7, q−1=6 is nonunit | Retain roots-of-unity restriction. [Previous report][previous]. |
| Uniform function-field moment (1211) | A=0; C=1,B=5,q=121 | Trivial moment1, error0; trace/count normalization gives error ≤(121/120)(1/10)+1/120=131/1200≤5/11 | Arithmetic estimate passes; R01 supplies uniform C. [Previous report][previous]. |
| Large-q Cohen–Lenstra (1227) | ℓ=3,A=0,C₃ | Aut orders1,2; predicted masses c₃≈.5601260779, c₃/2≈.2800630390 | Retain upper/lower densities; conditional chain still subject to R01. [Previous report][previous]. |
| Positive proportions (1245) | ℓ=3, trivial and nontrivial 3-primary parts | Indivisible proportion c₃≈.5601260779; divisible complement≈.4398739221, both positive | Retain correct complement; R01. [Previous report][previous]. |
| Eventual-degree large-q filter (1263) | E(n,q)=n/(n+q); modulus0,2,3 | q-then-n limits0, reversed limits1. Modulus0 allows no q; modulus2 forces odd q; modulus3 allows unbounded q=2^k | Retain nonzero modulus and stated order of quantifiers. [Previous report][previous]. |
| Imaginary per-component moment (1291) | n=2,q=5, one component | Branch degree3; denominator125−25=100; leading numerator125; ratio5/4=q/(q−1)→1 | Retain degree2n−1 and fixed-degree error. [Previous report][previous]. |
| Real per-component moment (1309) | n=2,q=5, one component | Branch degree4; denominator625−125=500; leading numerator625; ratio5/4→1 | Retain degree2n, not 2n+1. [Previous report][previous]. |
| Imaginary normalized nonabelian moment (1325) | G=C₃; G=C₃² with multiplier C₃ | Aut factor2 gives1/2; multiplier torsion at q=5,7 is1,3 and is divided out before the limit | Retain varying normalization. [Previous report][previous]. |
| Real normalized nonabelian moment (1341) | G=C₃,F=S₃ | Outside class size3, automorphism factor2; unrigid moment1/(3·2)=1/6 | Retain good-type and real twist factors. [Previous report][previous]. |
| Stable parity count (1359) | N=2,d=4, ε=(0,0), N₀=0,1; odd d=3 | Counts3=choose(3,1),1=choose(1,1),0; with ε=(1,1),N₀=1,d=4 count2 | Retain nonnegative/even residual guards before natural subtraction. [Previous report][previous]. |
| Many parity vectors (1381) | N=2,N₀=0, imaginary ε=(1,0),d=2n−1; real ε=0,d=2n | Counts n and n+1; for n=1 values1,2 | Retain n^(N−1) lower growth on surviving parities. [Previous report][previous]. |
| Bad-type lower bound (1401) | N=2 and one surviving parity; normalized component contribution | At degree2n−1 stable contribution n·1, so any w<1 works eventually for the leading profile; fixed q-error tends to0 at fixed n | Retain eventual-degree liminf; no ordinary fixed-degree limit follows. [Previous report][previous]. |
| Real rigidification bound (1417) | Good type S₃ over kernel C₃ | Exactly3 outside twists per relevant surjection; bound≤3 is equality | Retain c(F) upper bound for the bad-type transfer, not equality for all bad types. [Previous report][previous]. |
| Bad-type normalization transfer (1435) | Rigid leading contribution n, automorphism factor2, twist bound3 | Imaginary unrigid contribution n/2; real lower bound n/6 | Retain positive fixed factors and direction of inequality. [Previous report][previous]. |
| Printed bad-type limit assertion as a proposition (1453) | E(n,q)=n^(N−1); alternating q-profile1,3 for fixed n | First has normalized limit1; alternating profile has liminf1,limsup3 and no ordinary limit | Retain as separate proposition/criterion, not a theorem from a liminf bound. [Previous report][previous]. |
| Whole component profile/API (1485) | Fixed-degree component counts2,5,0; M(q)=2 | Total profile(2+5+0)/2=7/2; all component counts finite, including zero slices | Retain whole sum, not stable terms alone. [Previous report][previous]. |
| Boundary remainder/API (1515) | Same profile with stable contribution5 and boundary2 | Whole7/2=stable5/2+boundary1; boundary nonnegative; absent boundary gives0 | Retain exact decomposition; do not infer vanishing of boundary from fixed degree. [Previous report][previous]. |
| Complete stable component sum (1553) | N=2,N₀=0,d=4, surviving ε=0, M=3; previous nonzero boundary | Three stable vectors each contribute3; normalized stable sum9/3=3. Adding boundary2/M yields3+2/3, not3 | Retain all surviving parities and boundary addend. [Previous report][previous]. |
| Moment minus profile (1589) | B=2,K=1,q=9; profile2, pure leading count | Bound 2(1/3+1/9)/(1−1/9)=1; leading normalization gives moment9/4, difference1/4≤1 | Retain fixed-degree O(q^(−1/2)) and denominator. [Previous report][previous]. |
| Ordinary limit iff eventual profile constancy (1605) | Finite profile values{1,3}; eventually1; profiles1+1/q as excluded infinite range | Recurrent1,3 forbid a limit; eventual1 plus vanishing error tends1. Infinite range1+1/q tends1 without eventual constancy | Retain finiteness of profile range and nonbottom filter. [Previous report][previous]. |
| Recurrent-profile liminf/limsup (1625) | Values1,3 both recurring; add error1/q | Lower1, upper3; additive error limit0 changes neither | Retain recurrence, not all values attained finitely often. [Previous report][previous]. |
| Stable-orthant generating series (1645) | N=1,N₀=1, even parity; N=2,N₀=0,even parity | First series X²+X⁴+… times(1−X²)=X²; second coefficient of X⁴ is3=choose(3,1) | Retain parity shift and denominator power. [Previous report][previous]. |
| Semidirect surjection bijection (1669) | G=S₃,H=C₃,Γ=C₂ inversion; Γ=1,H=C₃ | Six quotient-labelled surjections =1 choice ρ·1 kernel·3 sections·2 identifications; Γ=1 gives2 automorphisms on both sides | Retain actual quotient maps and section data. [Previous report][previous]. |
| Coprime sections (1687) | Γ=C₂,H=C₃ inversion/trivial action; Γ=C₃,H=F₂² action T | Section counts3=[3:1],1=[3:3],4=[4:1]; coprime abelian conjugacy holds | Retain action-sensitive index; last case witnesses R02's admissible even target. [Previous report][previous]. |
| Unramified extension normalization (1707) | H=1,Γ=S₃; x³−4x+1 | One Γ-isomorphism class has6 raw quotient maps; centre/order factor1/6 recovers1. Cubic discriminant256−27=229, positive nonsquare; no rational root±1 | Retain factor and split-infinity example. [Previous report][previous]. |

## Not verifiable

- The unchanged supplementary Silverman, *The Arithmetic of Elliptic Curves*, Chapter V Theorem 1.1 locator remains uncertified, as recorded in the previous report. It is outside the changed passages; no new request for that text was made. The previous report verified the mathematical Hasse-bound input against its pinned Tau Ceti declaration.
- The inherited source and adversarial rows are evidence from the preceding full review, not a fresh re-execution of its entire audit. The present review independently checks the changed claims, R01 and R02, the relevant supplier passages, and the build/signatures.
- The five Lean headlines remain admitted. Passing elaboration is evidence about their types, not a formal proof. There are no unresolved source fetches in the incremental scope.

## Source issues

The ref-51 entries were rechecked in this round. Other entries are carried unchanged from the previous report's source audit; no additional source error was discovered.

- **Misprint** in ref-46 at Lemma 5.6, arXiv v1 p.55: the source says the coefficient stratum itself is bounded by a number; it should be its cardinality that is bounded; affects nothing.
- **Error** in ref-45 at (51)–(56), arXiv v1 pp.30–33: the source says the factorial contribution has leading coefficient one in degree times rank-squared log-rank; it should be one half, as follows from (39); affects a stated result.
- **Misprint** in ref-45 at Lemma 5.9 proof, arXiv v1 p.32: the source says the feasible box has side ε and k(k+1) extreme points; it should have side εg and k(k−1) extreme points in the nondegenerate case; affects the proof.
- **Error** in ref-45 at Corollary 5.14 proof, arXiv v1 p.34: the source says an elliptic factor of multiplicity h gives zero-gap mass at least h/g; it should be at least (h−1)/g, with the same asymptotic conclusion; affects the proof.
- **Error** in ref-45 at Lemma 5.19, arXiv v1 p.36: the source says the claimed prime-to-p torsion obstruction holds for every prime p; it should exclude p=2, where an elliptic curve has point counts 2 and 8; affects a stated result.
- **Gap** in ref-48 at Corollary 3.5 proof, author final p.14: the source says full mod-ℓ symplectic image suffices for the integral lift in its entire stated range; it should supply the extra genus-one ℓ=3 level-nine kernel argument; affects the proof.
- **Misprint** in ref-37 at introduction, printed p.730: the source says the predicted probability of class number indivisible by three is one minus the Euler product; it should be the Euler product itself; affects nothing.
- **Misprint** in ref-37 at deduction of Theorem 8.8, printed p.777: the source says the distribution is on the entire class group; it should be on its ℓ-primary part; affects nothing.
- **Error** in ref-37 at proof of Theorem 8.8, printed p.779: the source says the unmarked Hurwitz fibre is the set of labelled surjections; it should be surjections modulo sign, consistently with Proposition 8.7; affects the proof.
- **Misprint** in ref-37 at proof of Lemma 8.9, printed p.782: the source says the basis-vector condition has index exceeding g; it should have index exceeding k among the remaining basis vectors; affects nothing.
- **Gap** in ref-50 at Theorem 4.8 bad-type argument, arXiv v2 pp.23–25: the source says the fixed-degree ordinary large-q limits have the claimed growth; it should establish existence separately, since the argument only bounds liminf; affects a stated result.
- **Misprint** in ref-50 at real case of Theorem 4.8 proof, arXiv v2 p.25: the source says the component dimension has exponent sum of multiplicities plus one; it should be the sum of multiplicities; affects the proof.
- **Error** in ref-51 at Lemma 9.3, arXiv v2 pp.38–39: the source says the isomorphism-class sum equals the raw-surjection count divided only by the section index; it should include the additional factor order-of-centre divided by order-of-Γ; affects a stated result.
- **Gap** in ref-51 at proof of Theorem 1.4, arXiv v2 p.41: the source says the O(1/b) comparison establishes an inner q-limit for each large fixed b; it should conclude the iterated liminf/limsup assertion unless inner convergence is established; affects a stated result.
- **Error** in ref-51 at Theorem 1.4/Corollary 1.5, arXiv v2 pp.3–4: the source says the numerical q-limits apply to every finite admissible target; it should require odd target order, since even admissible targets have no allowed q; affects a stated result.

[previous]: packages/ArithmeticStatisticsPartVIII/reports/PRREVIEW-ArithmeticStatisticsPartVIII~4.md
