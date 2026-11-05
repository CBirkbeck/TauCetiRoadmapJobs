# Review of LatticePackingsAndPerfectForms (pull request #1723 at 74904bb)

**Verdict:** needs changes

## R01 (P1) — A real form need not have a spanning norm shell

**Location:** TauCetiRoadmap/LatticePackingsAndPerfectForms/README.md:1015–1018: “the same finiteness argument on a spanning finite shell otherwise”.

**Claim:** The proposed proof of automorphism finiteness for arbitrary real forms assumes such a shell exists. It need not exist, even in rank two.

**Witness:** Take A = [[1,√2/10],[√2/10,√3]]. Its determinant is √3−1/50 > 0. Independence of 1,√2,√3 over ℚ forces equal-norm integral vectors to differ only by sign. Every nonzero shell spans one dimension.

**Repair:** Use a finite bounded-norm sublevel containing a lattice basis, rather than a single shell. Automorphisms permute that sublevel faithfully. For this A, the sublevel A[x] ≤ √3 contains e₁,e₂, has five elements {0,±e₁,±e₂}, and spans dimension two. Add this irrational-Gram negative control; the theorem itself remains valid.

## R02 (P1) — The bcc worked example has the wrong dual scaling

**Location:** TauCetiRoadmap/LatticePackingsAndPerfectForms/README.md:1776: “twice the dual of `A₃`”.

**Claim:** The displayed Gram matrix is identified with twice the dual of the normalization of A₃ in the preceding row.

**Witness:** A₃ has determinant 4 and dual minimum 3/4. The displayed bcc matrix has determinant 128 and minimum 6. Doubling the dual Gram gives determinant 2; doubling lengths gives determinant 16. Neither gives 128.

**Repair:** Say “the dual of A₃ with its bilinear form multiplied by 8” (lengths multiplied by √8). Then determinant = 8³/4 = 128 and minimum = 8·3/4 = 6, matching both entries. Explicitly, with A₃ as in the table below, U=[[-1,0,0],[-1,0,1],[0,-1,1]] has determinant −1 and Uᵀ(8A₃⁻¹)U equals the displayed matrix. Keep the displayed Gram, density and covering values, which use this scale.

## R03 (P2) — Statable classification and tensor headlines are omitted

**Location:** TauCetiRoadmap/LatticePackingsAndPerfectForms/Suggested.lean:27–32: “not statable at the pins” and “need their specified representative families”; README.md:1159–1163 and 1627–1630.

**Claim:** The docstring treats the rank-4–8 perfect-class counts and Kitaoka's minimum theorem as unavailable statements. Existing matrix, quotient and minimum carriers suffice to state these headlines without constructing representative families or the lattice tensor object.

**Witness:** Scratch elaboration succeeded for `Nat.card (Set.range fun A : {A : PosDefForm 4 // A.IsPerfect} => Quot.mk Similar A.1) = 2`, and for tensor-minimum equality with C's Gram constrained to the reindexed Kronecker product.

**Repair:** Add the five class-count signatures (2,3,7,33,10916) on the existing perfect similarity quotient. State Kitaoka's theorem for integral positive definite A,B and C satisfying C = A ⊗ₖ B in coordinates, with rank A ≤ 43. This is the form-side theorem already promised in §7.1, not an arbitrary predicate or a weakened bound. The scratch statements compile under the defaults; A₂ ⊗ A₂ gives minimum 4 = 2·2, and rank four gives two perfect classes. Revise the docstring's unstatability claims accordingly.

## R04 (P2) — The discriminant quadratic map changes convention silently

**Location:** TauCetiRoadmap/LatticePackingsAndPerfectForms/README.md:1707–1708: “`q_L(x) = x²/m mod 2`”; compare the native-carrier contract at 229–230 and §7.4.

**Claim:** The rank-one explanation identifies q_L with full norm modulo 2ℤ, although the selected Tau Ceti quadratic map and IntegralLattices §1D use half norm modulo ℤ.

**Witness:** For Gram [8], the dual generator is e/8. TauCeti/LinearAlgebra/IntegralLattice/Discriminant/Quadratic.lean:126–132 gives q(e/8)=1/16 in ℚ/ℤ; the prose gives 1/8 in ℚ/2ℤ, a different codomain and value.

**Repair:** Write the native formula q(x)=x²/(2m) modulo ℤ. Alternatively explicitly introduce the divide-by-two isomorphism ℚ/2ℤ → ℚ/ℤ and transport the formula. The corrected value is 1/16 for [8]; preservation still says u² ≡ 1 modulo 16, giving {1,7} and index 1. The final rank-one index formula is not refuted.

## R05 (P2) — The sphere probability claim needs a radius hypothesis

**Location:** TauCetiRoadmap/LatticePackingsAndPerfectForms/README.md:1253–1255: “Define the normalized sphere measure `σ_r` on `sphere 0 r` and prove it is a probability measure”; also 208–210.

**Claim:** No restriction on r accompanies the claim that the scaled unit-sphere measure is a probability measure on sphere 0 r.

**Witness:** In E=ℝ, r=−1 gives sphere 0 r=∅. Scaling the unit-sphere probability by −1 still gives masses 1/2 at −1 and 1, and gives mass 0 to the asserted sphere.

**Repair:** Require r ≥ 0 for this measure/support statement, or r > 0 consistently with §5.4 and the Lean moment theorem. If keeping r=0, state that its pushforward is the point mass at zero. For r=1 the support is {±1}, mass 1; r=−1 is excluded. Add both controls. Lean's nonempty design predicate does not itself create a negative-radius counterexample to its existing theorems.

## R06 (P2) — Degree-zero weighted theta is only a scalar multiple

**Location:** TauCetiRoadmap/LatticePackingsAndPerfectForms/README.md:1390–1391: “For `d = 0` this is Theta Series' `Θ_L`”.

**Claim:** Arbitrary homogeneous degree-zero P is identified with the constant polynomial 1.

**Witness:** On E₈ take P=2. It is homogeneous of degree zero and Gram harmonic. The zero-vector coefficient of Θ_{L,P} is 2, whereas that of Θ_L is 1.

**Repair:** State Θ_{L,c}=c·Θ_L and specialize the equality to P=1. The zero coefficients are then 2=2·1 for P=2 and 1=1 for P=1. Keep the positive-degree cusp theorem unchanged.

## R07 (P2) — The Venkov vanishing range is sufficient, not exact

**Location:** TauCetiRoadmap/LatticePackingsAndPerfectForms/README.md:1419–1421: “`< m + 1` exactly in the stated range of `d`”.

**Claim:** The dimension inequality is asserted to hold precisely for the even degrees through t.

**Witness:** For n=24, m=1, t=11, take d=14. Weight 26 has dim S₂₆ = dim M₁₄ = 1 < 2=m+1, although 14>11. Venkov Remark 16.5 explicitly records degree t+3 vanishing.

**Repair:** Replace “exactly” by “throughout”, or state the extra isolated vanishing degrees separately. The existing proof for d=2,4,6,8,10 uses dimensions 0,1,1,1,1, all <2; d=14 is now compatible with the statement. This does not raise the design strength to 14, since degree 12 need not vanish.

## R08 (P3) — Exact source locators are still missing or incorrect

**Location:** TauCetiRoadmap/LatticePackingsAndPerfectForms/README.md:1530: “(Bhargava, §5, p.36)”; also §§4.3–4.4, 5.5 and 7.1–7.2.

**Claim:** The minimality locator is wrong, and several new theorem/API assertions still have only a bibliography entry, broad chapter, or no source locator. The successful repair of the Venkov locators does not complete the source requirement.

**Witness:** bhargava2000 lines 1710–1718 puts the nine minimality witnesses in §6(iii), printed p.31. Its §5 starts on p.30. The opened paper places the nine-number implication at §6(ii), p.31.

**Repair:** Cite §6(ii)–(iii), p.31 for the nine-number criterion and minimality; specify the source/version and theorem or section plus printed page for every other kept claim. For extremality, the readable Ash §4 corollary, p.1052 is available; for the §4.11 sign inequalities include CKMRV Appendix A, not just §§2–4. Do not invent locators for unread books. The diagonal form (1,2,5,5) at the corrected Bhargava locator misses precisely 15, agreeing with the roadmap's check.

## R09 (P3) — Repair the remaining supplier locators

**Location:** TauCetiRoadmap/LatticePackingsAndPerfectForms/README.md:772 and Suggested.lean:227: “Mahler compactness, GoN 4.5.2”; README.md:92,318,1182 also mislocate root data.

**Claim:** These occurrences contradict the otherwise corrected supplier contracts. They name the right existing owners but the wrong sections.

**Witness:** GeometryOfNumbersAndQuadraticArithmetic §4.5.2 defines critical determinants; §4.5.8 states Mahler compactness. IntegralLattices §6C classifies small-rank unimodular lattices; §6G gives the 240-root count. §§6A–6C do not construct all D₅,E₆,E₇ root lattices.

**Repair:** Change both Mahler references to §4.5.8, the E₈ root-count references to IntegralLattices §6G or ThetaSeries §8B, and the root-lattice input to Completed/IntegralLattices Layer 5 and the pinned ADE modules. No supplier gap or new construction is needed. The consumed values remain 240 for E₈ and determinants 4,3,2 for D₅,E₆,E₇; the compactness input still requires a positive minimum cutoff.

## R10 (P3) — Some definitions still lack discriminating Checks

**Location:** TauCetiRoadmap/LatticePackingsAndPerfectForms/README.md:628 and 1143–1147: the Bergé–Martinet check uses only I₂; all neighbour checks use ranks zero or one.

**Claim:** Three bullets for a subsection do not supply three discriminating checks for each definition. A constant-one Bergé–Martinet invariant and a neighbour operation returning its input pass these local checks.

**Witness:** For diag(1,1,4), γ=4^(−1/3), γ(dual)=4^(−2/3), so γ′=1/2, not 1. For A₂ and N=[[0,−1],[−1,0]], the genuine step is 2, yielding [[2,−1],[−1,2]], not A₂.

**Repair:** Add the Bergé–Martinet controls diag(1,1,4)→1/2 and A₂→2/√3, alongside I₂→1. Add the rank-two neighbour control: zero-span dimension 2, admissible interval [0,2], endpoint determinant 3 and minimum 2, new minimal vectors ±(1,1). Retain the low-rank controls. Audit the other bundled definitions against the same per-definition rule.

## R11 (P3) — A computational decidability deliverable remains

**Location:** TauCetiRoadmap/LatticePackingsAndPerfectForms/README.md:1461–1462: “Prove `Represents` is decidable in principle”.

**Claim:** This still asks for a decision procedure from finite norm bounds, although the repaired scope promises mathematical representation theorems and excludes executable procedures.

**Witness:** The stated justification is finite vector search using a “1.1 box bound”; the paragraph makes decidability a deliverable, rather than using a small calculation as a Check.

**Repair:** Delete that deliverable and retain the native representation-number equivalence and mathematical finiteness assertions. Keep finite examples: ℤ³ does not represent 7, while ℤ⁴ represents it by (2,1,1,1). Remove the stale “perfect-form certificates” phrase at 1168 as well; §4.10 now states mathematical completeness.

## R12 (P3) — The density-knowl error attribution remains unsupported

**Location:** TauCetiRoadmap/LatticePackingsAndPerfectForms/README.md:177–179: “The LMFDB knowl `lattice.density` writes ‘minimum `2ρ`’”.

**Claim:** The same attribution challenged in the previous review remains, without an identifiable historical version.

**Witness:** lmfdb-density lines 90–92 in the readable cached knowl define density as occupied fraction and contain no such formula. This round's live retry yielded only a CAPTCHA, not supporting text.

**Repair:** Delete the attribution, or cite a verifiable historical version containing it. Keep the independent control: E₈ gives π⁴/384 using radius √2/2, versus π⁴/24>1 using radius 1. This correction does not change the density definition.

## Verified sound

Full review of the 1,858-line README and 708-line Lean file. Helpers only located text; the mathematics and verdict are my own. Computations test instances, not general proofs.

**Previous review, finding by finding.** Locations below refer to the new README unless marked Lean. Quoted fragments identify the actual repair. There was no readable separate repair report declaring findings not actionable.

| Previous finding | New passage | Assessment and recomputed control |
| --- | --- | --- |
| R01 empty completeness family | §4.10 “nonempty finite family”; Lean 376 `hne : s.Nonempty` | Repaired. Empty family is excluded; {[1]} gives maximum 1. |
| R02 wrong harmonic metric | §5.4 “Σᵢⱼ (A⁻¹)ᵢⱼ ∂ᵢ∂ⱼP” | Repaired. E₈ polynomial X₀²−X₇² has Laplacian 4; X₀²−2X₇² has Laplacian and shell sum 0. |
| R03 inverse action | §0.5 “U⁻¹ A⁻¹ U⁻ᵀ” | Repaired. Shear of I₂ has inverse [[2,−1],[−1,1]] on both sides. |
| R04 Minkowski exponent | §1.7 “(min A)^(n/2)” | Repaired. [4] gives 4≤4, not 8≤4. |
| R05 noncompact reduced slice | §1.9 “η > 0”; §2.2 “0 < ε < γₙ” | Repaired. diag(1/t,t) is cut down to t≤1/η. |
| R06 rank-increasing escalation | §6.2 “Its rank may equal rank L or rank L + 1” | Repaired. 2ℤ⁴+ℤe₁ has rank 4 and index 2 over 2ℤ⁴. |
| R07 negative squared radii | §0.4 “for t ≥ 0”; §1.1 “C < 0” | Repaired. Negative squared-norm sublevel is empty, not the radius-zero singleton. R05 above is a different radius/support claim. |
| R08 zero tensor vector | §7.2 “nonzero w” | Repaired. w=2 gives Gram [4]; w=0 excluded. |
| R09 rank-zero overclaims | §§0.1,1.4,3.2,4.1,4.2,4.9,5.3 “positive rank” / “n > 0” | Repaired. Empty minimal shell and density 1 remain total conventions; geometric and positive-coefficient conclusions are guarded. |
| R10 Hermite range | §2.1 “contains 1” | Repaired. diag(1,4) has γ=1/2 but γ₂≥1. |
| R11 supplier drift | contracts cite “4.5.8”; §3.3 uses independent minima witnesses | Partly repaired. Main nonexistent inputs removed; residual wrong locators are R09 above. |
| R12 excluded proof machinery | §3.4 “deep-hole classification”; §4.11 “Cohn–Elkies”; §6.4 “For every ... quaternary form Q” | Repaired as ownership. Lower bound 4 and owned upper bound 4 now meet for Leech; anisotropic valuation bounds are explicit in the representation route. Source limits remain below. |
| R13 build gate | Lean 1 `module` | Repaired. Gate passes; direct elaboration emits only 46 sorry warnings. |
| R14 rank-one neighbour | §4.9 “For n ≥ 2”; “minimum min P” | Repaired. [1] has step 0; A₂ has the genuine step 2 computed below. |
| R15 generic harmonic duplication | §5.4 “Consume GeometryOfNumbersAndQuadraticArithmetic §4.3” | Repaired. Gram adapter and complex-parameter continuation remain new; τ=i gives phase −i in degree one. |
| R16 duplicate discriminant carriers | §7.4 “use FiniteBilinearModule.Isometry”; native induced maps | Repaired structurally; explicit nondegeneracy retained. The newly identified convention mismatch is R04 above. |
| R17 missing γ₅,γ₆,γ₇ | Lean 244–255 adds the three signatures | These three are repaired: 32/4=8,64/3,128/2=64. Headline inventory still incomplete for the different results in R03. |
| R18 invalid commutation | §4.4 “Thus QA, not Q, commutes” | Repaired. For A₂, QA=6I; UQ≠QU remains a correct control. |
| R19 old Lean padding | norm/ball API and value controls deleted | Repaired. All 46 remaining admitted statements resisted the three elementary tactic probes. |
| R20 shape and Checks | Summary, contracts, Examples/Dependencies and declaration docstrings added | Largely repaired; per-definition discriminating coverage still needs R10. |
| R21 source locators | §5.6 “Theorem 16.1, p.59”; §5.7 “Theorem 16.4, p.61 ... p.62” | Partly repaired. These Venkov locations are correct; R08 identifies remaining gaps. |
| R22 computation scope | §4.10 “mathematical classification”; §6.4 “not a certificate format” | Partly repaired. Large certificate deliverables removed; R11 remains. |
| R23 knowl attribution | conventions still say “minimum 2ρ” | Not repaired; R12 above. |

**Principles, build and signatures.** Exact head verified; outside-folder diff is empty and the worktree is unchanged. No copied source passages, sorry-valued data, set_option, foreign roadmap imports, admitted examples or route-specific prime exclusions were found. This extends the real-form/geometric direction while consuming the integral and scalar-theta work; no wholesale re-planning was found. The supplied gate output is:

```text
gate LatticePackingsAndPerfectForms: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

The required dependency check was rerun and returned:

```text
depcheck: 204 roadmaps, 1605 edges, 0 problem(s)
```

No UPWARD/CYCLE lines or declared gaps. Needs lines were checked; §6.4's table abbreviates its explicit prose inputs. Residual locators are R09.

Direct `lake env lean` elaboration passed. A separate scratch copy appended `#check @name` for all 106 declarations and also passed. I compared the elaborated types with the README: positive rank, evenness, unimodularity, nondegeneracy, shell equality/nonemptiness and the finite-family nonemptiness remain where required. The scanner's one suspected lost binder, finite dimension on `polynomialsOfDegreeLE`, is harmless: that algebraic span uses only the inner-product structure. Its finiteness theorem, unlike its definition, needs finite dimension. No signature repair was made to the PR.

Each of the 46 admitted theorems was tried on a scratch copy with `simp`, `rfl`, and `infer_instance`; all 46 still failed to close. I also inspected native counterparts for a single-lemma closure, distinguishing the real-form adapters from integral-lattice results. No additional proved padding witness was found. The existing `stdLattice_eq_span` is a proved infrastructure identity used to construct the required lattice instances, not an admitted headline. The separate two-signature probe for R03 succeeded with only sorry warnings.

**Headline inventory.** Headlines: Minkowski/Hermite bounds; Mordell and Hermite attainment; sharp constants and critical-form classifications in ranks1–8,24; Voronoi fundamental domains, deep holes and covering bounds including Leech; extremality, perfect/eutactic finiteness, neighbour completeness and class counts; moments, strong perfection, harmonic Fourier/theta and Venkov; rank≤3 nonuniversality, 15/290; Kitaoka tensor minima/decomposition; discriminant-image and rank-one indices. The main analytic, geometric, design, universality and index signatures are present. Rank-one values are appropriately README checks. The docstring names missing Leech construction and tensor/classification carriers, but R03 demonstrates that the latter two claimed obstacles do not justify omission. No arbitrary-Prop stand-in was found.

**Computed adversarial pass.** A₂=[[2,1],[1,2]], A₃=[[2,1,0],[1,2,1],[0,1,2]], B=[[2,1],[1,3]], U=[[1,1],[0,1]]. Q(A) denotes Σxxᵀ over shortest vectors. Exact shell searches use |xᵢ|²≤c(A⁻¹)ᵢᵢ. E₈ moments use its112 vectors ±eᵢ±eⱼ and128 half-integral even-sign roots. Finite representation searches are not universality proofs; classification counts are source checks, not re-enumerations.

| Statement / API | Instances | Computed values on both sides | Result / repair |
| --- | --- | --- | --- |
| 0.4 real-model / sphere-shell comparison | A₂, t=−1,0,2 | squared shell cards 0,1,6; sphere cards 1,1,6 | Pass: t≥0 guard excludes −1; both valid comparisons agree |
| 0.5 inverse action | I₂,U | (UᵀU)⁻¹=[[2,−1],[−1,1]]=U⁻¹U⁻ᵀ; det=1 | Pass: inverse transpose repaired |
| 0.5 dual-model comparison | A=[4] | dual coordinates (1/4)ℤ map by A to ℤ; both generator lengths 1/2 | Pass: corrected source and target |
| 1.2 minimum_eq_min; kissing comparison | ⟨2⟩, A₂, zero lattice | minimum pairs (2,2),(2,2),(0,0); kissing pairs (2,2),(6,6),(0,0) | Pass; — |
| 1.2 first successive minimum is a length | [4] | λ₁=2; min=4=λ₁²; identifying min with λ₁ would give 4≠2 | Pass; — |
| 1.4 packingRadius | [4], A₂, rank 0 | 1,√2/2,0 = √min/2 in each case | Pass; — |
| 1.4 unitBallVolume/library volume comparison | n=0,1,2,3,4,8,24 | 1,2,π,4π/3,π²/2,π⁴/24,π¹²/12! from the Gamma formula | Pass; — |
| 1.4 centerDensity and density | A₂,4A₂ | δ=1/(2√3) on both; Δ=π/√12 on both | Pass; — |
| 1.4 density_of_similar | I₂,4UᵀU | min1→4,√det1→4; δ1/4→1/4; Δπ/4→π/4 | Pass; — |
| 1.4 packing disjointness/fundamental fraction | [4], F of length2 | open intervals radius1 are disjoint; occupied measure2 / covolume2 = density1 | Pass; — |
| 1.4 rank-zero density convention | n=0 | open-ball occupied fraction=0; total density=0⁰/1=1 | Pass: volume interpretation now assumes n>0 |
| 1.4 density_pos and density_le_one | [4], A₂, E₈ | 1;0.906899682;0.253669508 are positive and ≤1 | Pass; — |
| 1.5 hermite; latticeHermite bridge | A₂,3A₂ | 2/√3 = 6/√27; lattice minimum/determinant gives same value | Pass; — |
| 1.5 centerDensity_eq_hermite | A₂ and rank 0 | (γ/4)^1=1/(2√3); rank0:0⁰=1=δ | Pass; — |
| 1.5 Bergé–Martinet invariant | diag(1,4) | γ(A)=γ(A⁻¹)=1/2; γ′=1/2≤γ₂=2/√3 | Pass; — |
| 1.7 hermite_le_minkowski | [4],A₂ | 1≤1;2/√3≈1.1547≤4/π≈1.2732 | Pass; — |
| 1.7 equivalent Minkowski bound | [4] | min^(n/2)V₁=2·2=4=2√det | Pass: exponent repaired |
| 1.8 projection bound | A₂ projecting off e₁ | projected min=3/2=(3/4)·2; det projection=3/2=det A₂/min | Pass; — |
| 1.8 hermite_le_pow and equality | A₂,I₂ | 2/√3=√(4/3);1<√(4/3) | Pass; — |
| 2.1 range and lower bound | diag(1,4),I₂ | range members 1/2 and1;1/2<1≤γ₂ | Pass: only the supremum is bounded below by1 |
| 2.1 one_le / upper bound on γ | n=1,2,3 | 1≤1≤1;1≤2/√3≤2/√3;1≤2^(1/3)≤4/3 | Pass; — |
| 2.1 Mordell inequality | n=2,3,4 | 1≤1;2^(1/3)≤4/3;2≤2 (γ₄²=γ₃³) | Pass; — |
| 2.2 attainment and critical ⇒ extreme | A₂/√3 | det1; min2/√3=γ₂; same Hermite value as A₂ | Pass; — |
| 2.3 γ₁ | [a],a>0 | min/det=a/a=1 | Pass: value kept in README, omitted from Lean |
| 2.3 γ₂² | A₂ | min²/det=4/3=γ₂² | Pass; — |
| 2.3 γ₃³ and reduction determinant | A₃ | a=b=c=2; det4=abc/2;min³/det=8/4=2 | Pass; — |
| 3.1 fundamental domain / cell volume | [4],A₂ | cell lengths/areas 2,√3 = covolumes2,√3; adjacent overlaps are boundary sets | Pass; — |
| 3.2 coveringRadius; deep holes exist | [4],I₂ | μ=1 at coordinate1/2; μ=√2/2 at (1/2,1/2) | Pass; — |
| 3.2 packing≤covering / equality | [4],I₂,n=0 | 1=1;1/2<√2/2;0=0 | Pass: equality iff rank1 now restricted to positive rank |
| 3.2 coveringDensity ≥1 | [4],I₂ | Θ=1 andπ/2≈1.5708≥1 | Pass; — |
| 3.3 successive-minima covering bounds | diag(1,4) | λ=(1,2), μ=√5/2;1≤√5/2≤3/2≤2 | Pass: independent vectors suffice; no integral-basis assertion |
| 3.4 covering radii / densities | ℤ³,A₂,A₃,D₄,E₈,Leech | μ=√3/2,√(2/3),1,1,1,√2; Θ=π√3/2,2π/√27,2π/3,π²/4,π⁴/24,2¹²π¹²/12! | Formula values agree; Leech deep-hole primary text unread |
| 3.4 covering constant | n=1,2 | Θ₁=1 from [a]; hexagonal candidate2π/√27≈1.2092≥1 | Lower-bound sanity check only |
| 4.1 rank-one matrices / perfection | I₂,A₂,n=0 | outer span dimensions2<3,3=3,0=0 | Pass: n=0 exception now explicit |
| 4.2 IsEutactic; positive coefficients | A₂,B | Q(A₂)=[[4,−2],[−2,4]], A₂⁻¹=Q/6; B shortest vectors span dimension1, so no inverse representation | Pass; — |
| 4.2 IsStronglyEutactic; coefficient trace | A₂,I₂ | c=2/(6·2)=1/6, trace2=6·(1/6)·2; I₂ c=1/2 | Pass; — |
| 4.2 strong ⇒ eutactic ⇒ well-rounded | A₂ | positive six coefficients1/6; inverse rank2; shortest span rank2 | Pass; — |
| 4.2 inner-product identity | A₂,v=e₁ | 2 = (1/6)(4+4+1+1+1+1) | Pass; — |
| 4.2 coefficient scaling | 3A₂ | c goes1/6→1/18; inverse goesA₂⁻¹→A₂⁻¹/3 | Pass; — |
| 4.4 automorphism moment operator | A₂,Q,U=[[-1,−1],[0,1]] | UQ=[[-2,−2],[-2,4]];QU=[[-4,−6],[2,6]];QA=6I | Pass: route uses QA, not Q |
| 4.5 isExtreme_iff, both directions | A₂,I₂,B,rank0 | A₂:T↔T∧T;I₂:F↔F∧T;B:F↔F∧F;rank0:T↔T∧T | Pass; — |
| 4.6 finite_perfect_quotient | n=1,2 | one class represented by[1], one byA₂; finite cardinalities1,1 | Pass; — |
| 4.7 eutactic similarity finiteness | n=1,2 | one rank-one class; square and hexagonal rank-two classes:1,2 | Pass: general finiteness in Ash Th3 after normalization |
| 1.9 / 2.2 compactness cutoff | diag(1/t,t),η>0 | det=1,min=1/t;min≥η iff t≤1/η | Pass: positive cutoff added |
| 4.9 Ryshkov vertices | n=1,0 | R₁=[1,∞),vertex minimum1;R₀={empty},minimum0 | Pass: characterization is for positive rank |
| 4.9 facet/step rank-one exception | P=[1],N=[1] | zero span dimension0=1−1;admissible set{0};step0 | Pass: no positive-step assertion in rank1 |
| 4.9 isPerfect_voronoiNeighbour / min preservation | same rank-one instance | returned P is perfect; min1=1 | Lean weak conclusions pass; do not establish distinct adjacency |
| 4.10 classification counts | ranks1–8 | 1,1,1,2,3,7,33,10916; independent source table agrees for2–8 | Source comparison; enumeration not rerun |
| 4.10 γ₄⁴ andγ₈⁸ | D₄,E₈ | 2⁴/4=4;2⁸/1=256 | Pass; — |
| 4.10 γ₅,γ₆,γ₇ | D₅,E₆,E₇ | 2⁵/4=8;2⁶/3=64/3;2⁷/2=64 | Pass: all three signatures now present |
| 4.11 sharp rank24 bound | Leech min4,det1;auxiliary r2,f0=fhat0=1 | γ=4; δ=1≤(2/2)²⁴·1/1=1 | Pass: both lower and owned upper inputs present |
| 5.2 isSphericalDesign_iff_moments | I₂ minimal vectors,r=1,a=e₁ | j0:4=4;j1:2=4/2;j2:2≠3·4/(2·4)=3/2 | 3-design passes,5-design fails |
| 5.3 strongly eutactic iff2-design | A₂,B | both true forA₂;both false forB;rank0 strong eutaxy true but design false | Pass: positive rank explicitly retained |
| 5.3 strongly perfect⇒perfect; strictness | A₂,A₃ | A₂ fourth moment36=36; A₃ fourth moment40≠192/5, despite perfectness | Pass; — |
| 5.4 laplacian / IsHarmonic | 1,X₀,X₀²,X₀²−X₁² | 0,0,2,0; nonharmonic square excluded | Pass; — |
| 5.4 Fischer decomposition import | n=3,d=2;X₀² | dimension6−1=5;X₀²=(X₀²−R²/3)+R²/3;Laplacians0+2 | Pass: imported from GoN4.3, not re-planned |
| 5.4 harmonic criterion negative control | I₂ roots;P=x⁴−6x²y²+y⁴ | ΔP=0; shell sum4≠0, so not4-design | Pass; — |
| 5.5 Fourier phase | n=1,P=x,τ=i | transform −iξe^(−πξ²);atξ=1 value−i e^(−π), matching τ⁻¹ | Pass; — |
| 5.5 degree-two/degree-zero factors | n=2,P=x²−y²,τ=i;P=1,τ=2i | factors−1 and1/2; formula gives i⁻²=−1 and2⁻¹=1/2 | Pass; — |
| 5.5 complex continuation route | τ=1+i;s=1−i | Re s=1>0;1/√s is non-real | Pass: holomorphic continuation now replaces invalid real substitution |
| 5.6 harmonicTheta / summability | A=[1],P=1,τ=i | zero term1, first pair2e^(−π); sum≈1.0864348 finite; τ=−i would grow and is excluded | Pass; — |
| 5.6 Gram harmonic cusp hypothesis | E₈,P=X₀²−X₇² | ordinary Δ=0;Gram Δ=4;shell sum120;dimS₆=0 | Pass: corrected hypothesis rejects P |
| 5.6 repaired metric control | E₈,P=X₀²−2X₇² | Δ_A=2·4−4·2=0; q coefficient240−2·120=0 | Pass: Gram-metric definition excludes false example |
| 5.6 constant/odd-degree controls | E₈,P=1 or linear P | constant theta has q⁰ coefficient1, so not cusp; odd P cancels in ± pairs to0 | d>0 and harmonic hypotheses matter |
| 5.7 Venkov strengths | (m,r)=(0,1),(0,2),(1,0) | n=8,16,24;min=2,2,4;t=7,3,11; n=0 would require min2 but actual0 | Pass; — |
| 5.7 E₈ shell moments | norm-two root a | 2nd120=120;4th144=144;6th240=240;8th624≠480 | 7-design, not8 |
| 5.7 E₈⊕E₈ nonexample | a a root of first factor | 4th sum144;16D sphere prediction3·480·4·4/(16·18)=80 | Not4-design; t=3 consistent |
| 5.7 vanishing-order route | n=24,d=2,4,6,8,10 | weights14,16,18,20,22 have cusp dimensions0,1,1,1,1; required vanishing order2 exceeds each | Pass; — |
| 6.1 Represents / IsUniversal | ℤ³,ℤ⁴ | rℤ³(7)=0;rℤ⁴(7)>0 via(2,1,1,1); rank0 r(1)=0 | Pass; — |
| 6.1 IsHalfUniversal | 2I₄,A₂ | half norm of2I₄ is sum four squares; A₂ half norms miss2 | Pass; — |
| 6.1 representation monotonicity/sums | 2ℤ⊂ℤ;⟨1⟩⊕⟨2⟩ | 4 represented in both;1+2=3 represented by(1,1) | Pass; — |
| 6.1 universal minimum/splitting | ℤ⁴ | min1; e₁ norm1; orthogonal complementℤ³; ranks4=1+3 | Pass; — |
| 6.1 no rank≤3 universality | zero lattice,ℤ,ℤ²,ℤ³ | miss1,2,3,7 respectively; squares mod8 are0,1,4, no three sum to7 | Instances pass; general route uses local theory |
| 6.2 truant/escalation | 2ℤ⁴⊂ℤ⁴,v=e₁ | truant1;rank4→4;index2 | Pass: same-rank escalation now allowed |
| 6.3 15 theorem, both truth values | ⟨1,2,5,10⟩ and⟨1,2,5,5⟩ | first passes all9 criteria and misses0 integers<300;second passes8 but misses15, sole miss<2000 | Pass; — |
| 6.4 290 theorem / factor of two | 2I₄,A₂ | 2I₄ represents2m for all m by four squares; A₂ fails m=2 since norm4 absent; criterion has29 entries | Pass; — |
| 7.1 tensor rank/determinant/Gram | A₂⊗A₂ | rank2·2=4; Gram[[4,2,2,1],[2,4,1,2],[2,1,4,2],[1,2,2,4]]; det81=3²·3² | Pass; — |
| 7.1 pure-tensor pairing | e₁⊗e₂,e₂⊗e₁ inA₂⊗A₂ | pairing1=1·1; self pairing4=2·2 | Pass; — |
| 7.1 positive/even/unit/swap/associate API | ⟨1⟩,⟨2⟩,⟨3⟩ | products[2],[6],[6]; odd×even norm2 even; all positive; zero-rank determinant1 | Pass; — |
| 7.1 dual/determinant | ⟨2⟩⊗⟨3⟩ | dual carrier(1/6)ℤ = (1/2)ℤ⊗(1/3)ℤ inℚ; determinant6;discriminant order6 | Interpret duals as rational submodules |
| 7.2 min inequality / rank-one equality | ⟨2⟩⊗A₂ | min4=2·2, hence≤; rank-zero factor gives0=0 | Pass; — |
| 7.2 Kitaoka / shortest tensors | A₂⊗A₂ | min4=2·2;36 shortest ordered pairs modulo simultaneous sign give18 vectors | Rank2 instance passes; general source unavailable |
| 7.2 scaled tensor sublattice | L₁=[1],w=0,2 | w0:ranks0 vs1;w2:both rank1,Gram4 | Pass: w≠0 excludes mismatch |
| 7.2 orthogonal factors | L₂=I₂,w₁=e₁,w₂=e₂ | cross pairings0; tensor decomposes as orthogonal copies with scale1,1 | Pass; — |
| 7.4 native discriminant isometries | Gram[8] | bilinear residues{1,3,5,7};quadratic{1,7};orders4,2 | Pass: native carriers and maps used |
| 7.5 fvIndexBilinear versus fvIndex | ⟨8⟩ | bilinear index4/2=2; quadratic index2/2=1 | Pass; — |
| 7.5 fvIndex_rankOne odd cases | m=5,15 | residues{1,4} and{1,4,11,14};indices2/2=1,4/2=2 | Pass; — |
| 7.5 fvIndex_rankOne even cases | m=8,12 | residues{1,7} and{1,5,7,11} modulo2m condition;indices1,2 | Pass; — |
| 7.5 unimodular index / isometry invariance | E₈;⟨12⟩ basis sign reversal | trivial discriminant:1/1=1; sign reversal leaves4/2=2 | Pass; — |
| 0.3 FormSpace norm / inner product / lattice | A₂,e₁+e₂; [4] | norm²6=eval6; length of lattice generator2; covolume2=√4 | Pass: volume is Gram-metric Haar volume |
| 0.3 lattice discreteness/fullness | A₂,n=0 | integer basis span ranks2,0; shortest nonzero length√2; zero-dimensional covolume1 | Pass; rank zero discrete singleton |
| 0.4 real-model isometry | Gram[4],generator e | native squared norm4=coordinate squared norm4; shell norm4 has2 points in each model | Pass; supplier retains squared norm |
| 0.5 orthogonal sum / scaling | [2]⊕[3], scale4 | Gram diag(2,3),det6; scaled determinant96=4²·6 | Pass |
| 1.6 integral Hermite / minima comparisons | [4],A₂ | native minima4,2 equal real minima4,2; first length2 squares to4 | Pass: length versus squared norm kept distinct |
| 1.8 induction projection | I₂,A₂ | projected minimum1 and3/2; lower bounds3/4 and3/2 | Pass; equality attained by A₂ |
| 1.9 reduced-Gram bound | I₂,[[2,1],[1,3]] | 2|a₁₂|≤a₁₁ gives0≤1,2≤2; diagonal ordering1≤1,2≤3 | Pass |
| 1.9 compact slice negative control | diag(1/t,t),t=1,4 | determinant1;minimum1,1/4;largest entry1,4 | Without η no compactness; repaired cutoff η=1/2 excludes t4 |
| 2.1 monotonicity | n=1,2,3 | γ=1,2/√3≈1.1547,2^(1/3)≈1.2599 | Ordered values agree |
| 2.1 total n=0 convention | empty matrix | hermite=0/1=0;hermiteConstant0=1 by separate branch | Pass; no n0 attainment claim |
| 2.3 critical uniqueness | rank1 and binary | every[a] hasγ1;A₂ hasγ²4/3, I₂ hasγ²1 | Low-rank control; general uniqueness from cited classification |
| 3.1 cell inequality / symmetry | [4],coordinate x=1/2,3/4 | at1/2 distances²1=1;at3/4 distances²9/4>1/4 | Boundary included, exterior excluded |
| 3.1 translates and null overlaps | [4] | cell coordinate intervals[−1/2,1/2] and[1/2,3/2] intersect in one point;length measure0 | Pass: measurable fundamental domain, not disjoint closed tiling |
| 3.2 deep hole / extreme-point reduction | I₂,x=(3/2,1/2) | distance√(1/2);subtract(1,0) gives vertex(1/2,1/2) with same distance | Pass |
| 3.2 total covering at rank0 | singleton | inf distance0,sup0;point0 is an extreme point and deep hole | Pass |
| 3.4 covering scaling | [1],[4] | μ1/2→1;Θ2·(1/2)/1=1 and2·1/2=1 | Pass |
| 4.1 uniqueness from shell / equal minimum | A₂,2A₂ | identical six shell coordinates but minima2,4;equal-minimum hypothesis rejects comparison | Pass: necessary normalization |
| 4.1 kissing lower bound | A₂,D₄,E₈ | 6=2·3;24≥4·5=20;240≥8·9=72 | Pass |
| 4.1 rationality up to similarity | √2·A₂ | scale1/√2 gives integral A₂;min2√2→2 | Pass |
| 4.3 local maxima / density equivalence | I₂,A(t),t=1/4 | γ(I₂)=1;γ(A(t))=4/√15>1;δ likewise1/4→1/√15 | I₂ rejected in both formulations |
| 4.4 faithful finite set | irrational matrix in R01 | each shell span1;bounded sublevel size5,span2 | Fails stated shell route; use sublevel |
| 4.9 rank-two facet | P=A₂,N=[[0,−1],[−1,0]] | N[e₁]=N[e₂]=0,N[e₁−e₂]=2;zero outer-span dimension2=3−1 | Positive facet control |
| 4.9 genuine neighbour / reverse | same P,N | admissible t=[0,2];Q=[[2,−1],[−1,2]],det3,min2;reverse normal−N givesP at2 | Pass; add README Check R10 |
| 4.10 completeness nonemptiness | s=∅ and{[1]} | ∅ has0 representatives and fails hne;singleton has1 and represents every rank1 class | Old vacuity repaired |
| 4.10 class-count headlines | source Table1, ranks4–8 | counts2,3,7,33,10916 versus absent five Lean statements | R03; counts source-checked, enumeration not repeated |
| 4.11 Cohn–Elkies denominator/sign | n1,f=(1−x²)e^(−πx²),r1 | f0=1,fhat0=1−1/(2π)>0;δℤ=1/2≤0.5946398756 | Pass; fhat=(1−1/(2π)+ξ²)e^(−πξ²)≥0 |
| 4.11 auxiliary scaling | same f and3f | f0/fhat0 equals3f0/(3fhat0);both bounds0.5946398756 | Normalization-invariant bound |
| 4.11 Leech auxiliary roots | source f at radius2 | f(2)=0;f0=fhat0=1;r/2=1 | Endpoint sign agrees; source constructs the function |
| 5.1 polynomial span | E=ℝ,t0,1,2 | dimensions1,2,3;basis1,x,x²;constant2 belongs at degree0 | Pass |
| 5.1 measure support | E=ℝ,r=−1,0,1 | sphere masses0,1,1 under scaled-unit measure;claimed probability-on-sphere fails at−1 | R05 |
| 5.1 design nonemptiness / lowering | {±1},{1},∅ | averages of x:0,1,undefined-by-nonempty; sphere average0 | First passes all degrees, others fail appropriate conditions |
| 5.1 antipodal upgrade | I₂ unit axes | moments1st=3rd=0;second2=2;fourth2≠3/2 | 2-design upgrades to3, not4 |
| 5.2 j=0 moment | nonempty X of4 points,k0 | sum1=4;empty products=1,RHS4 | Correct j0 boundary |
| 5.3 strong perfection strictness | D₄ vs A₃,root test vector | fourth moments48=48 versus40≠192/5 | D₄ passes;A₃ perfect but not4-design |
| 5.4 Gram Laplacian rescaling | diag(1,4),P=X₀²−X₁² andX₀²−4X₁² | Laplacians3/2 and0 | Distinguishes ordinary from metric harmonicity |
| 5.5 Fourier metric/volume | A=[4],P=1,τ=i,ξ=0 | ∫e^(−4πx²)·2dx=1=predicted factor | A missing Haar scaling would give1/2 |
| 5.6 degree-zero scalar | E₈,P=2 versus1 | q⁰ coefficients2 versus1;correct2Θ_L has2 | R06 |
| 5.7 extra vanishing degree | n24,m1,d14 | weight26,dimS26=1<2 despite14>11 | R07; sufficient range remains valid |
| 5.7 natural subtraction / shells | r0,1,2; j0 | 11−4r=11,7,3; j0 excluded byhj,empty shell excluded byhne | No underflow or vacuous shell theorem |
| 6.1 represents zero / positive universality | zero lattice andℤ⁴ | r(0)=1 in both; r_zero(1)=0, r_ℤ⁴(1)=8 | Positive-m restriction distinguishes universal from zero lattice |
| 6.2 rank-zero first truant | zero lattice | least missed positive integer1;adjoining norm1 gives[1] of rank1 | Pass |
| 6.2 finite escalation | [1],truant2 | integral inner producta satisfies a²<2; a=−1,0,1,three possibilities before equivalence | Finite rank-increasing case; same-rank case separately admitted |
| 6.4 all-prime coefficient bounds | sum four squares, m3,5 | a_f=0;a_E=32≥24 and48≥40 | Eisenstein lower bound and cusp bound compatible |
| 6.4 anisotropic valuation control | sum four squares,m4,16,64 | a_E=24,24,24 whilem=4,16,64 | Positive uniform linear bound needs bounded 2-valuation; roadmap includes it |
| 7.1 parity / zero-rank tensor | [2]⊗[3];rank0⊗rank2 | norm of generator6 even;zero-rankdet1=1²·det(B)⁰ | Pass under standing positivity |
| 7.3 decomposition predicate | ℤ⁴,A₂, A₂⊗D₄,E₈ | ranks4=2·2;prime2 cannotfactor;rank8 both butdet1296≠1 | Rank-one factor excluded;det obstruction works |
| 7.4 discriminant-map identity/composition | Gram[8],identity and−identity | residues1,7;7²≡1 mod16;identity1 maps to1 | Native functorial action agrees |
| 7.5 native quadratic value | Gram[8],dual generator | q_native=1/16 modℤ versusfullnorm1/8 mod2ℤ | R04: divide-by-two adapter or native formula |
| worked bcc row | displayed matrix versus dualA₃ | determinants128 versus1/4;minimum6 versus3/4;ratios8³ and8 | R02: Gram scale8 |
| Bergé–Martinet definition | diag(1,1,4),A₂,I₂ | √(4^(−1/3)4^(−2/3))=1/2;A₂ gives2/√3;I₂ gives1 | Add discriminating Checks R10 |
| R08 source/minimality witness | diag(1,2,5,5),integers1≤m<2000 | represented count1998;sole missing value15;correctsource§6(iii),p31 | Locator repair agrees with computed instance |
| R12 density attribution control | E₈,min2,det1 | correctπ⁴/384≈0.25367;wrongπ⁴/24≈4.05871>1 | Keep control,remove unsupported source allegation |
| Source normalization: Ash / DSV finiteness wording | rank-one forms [a],a>0 | every [a] is perfect and eutactic; GL₁(ℤ) fixes a; scaling identifies all a | Infinitely many unscaled orbits, one similarity class; source issues below |
| Source domain covariance in DSV | B=A₂,P=U,A=PᵀBP=[[2,3],[3,6]] | actual generators e₁,(−1,1),(2,−1) have nonpositive off-diagonal outer entries; claimed P-domain contains(1,1)(1,1)ᵀ with entry1 | Use P⁻¹ Dom(B) P⁻ᵀ; source issue below |

143 selected computed rows cover the 15 sampled targets, headline families and mathematical findings; routine API rows are omitted for length. Source/policy findings have textual witnesses above.


**Seeded source sample: all 15 targets addressed.** No README target was marked unverified. All works were attempted through the sources service; no manifest was edited. Unread books remain uncertified.

| Seeded target | Text / locator read | Result |
| --- | --- | --- |
| 0.4 real model | ThetaSeries §2D, README:516–533; §2G:545–560; native norm and Gram declarations below | Supplier constructs the rational-to-real model and compares squared norms. The t≥0 sphere comparison and negative-shell exception agree. No external theorem locator is given in this subsection. |
| 1.4 packing density | dsv2007 lines 52–58, arXiv v3 p.2; PDF formula visually checked; Mathlib volume/fundamental-domain APIs | Minimum is squared norm; δ=(γ/4)^(n/2), Δ=Vₙδ. Rank-zero volume interpretation is excluded. The alleged knowl formula is unsupported (R12). |
| 1.5 covolume / Hermite | dsv2007 lines 52–58, p.2; TauCeti PosDef/Covolume.lean:120 | γ=min/det^(1/n); covolume²=det for an isometric full real realization. This supports the normalization, not an unread Bergé–Martinet extremal theory. |
| 1.6 integral comparison | TauCeti PosDef/Hermite.lean:81; PosDef/SuccessiveMinima.lean:45,103 | Native minima are natural squared norms indexed by Fin(rank); real successive minima are lengths. [4] gives 4 versus 2 before squaring. No integral theorem is being newly restated in Lean. |
| 1.7 Minkowski bound | Mathlib MeasureTheory/Group/GeometryOfNumbers.lean:65; VolumeOfBalls.lean:343 | Finite-dimensional real normed space, Borel Haar measure, countable lattice/fundamental domain, convex symmetric body, strict volume inequality. Taking the open ball and contraposing gives the displayed non-strict bound. Cassels text unavailable. |
| 2.1 Hermite constants / Mordell | martinet2003 line 462, author-hosted contents: Chapter 2 §2.3 starts p.41 | Chapter locator confirmed only. Mordell's theorem/hypotheses were not read from the book; explicit n=2,3,4 values and bounds were recomputed. |
| 3.4 covering values | Conway–Sloane Chapter 23 cited; supplier GoN §4.4.2 and explicit low-rank calculations | Book unavailable. Radius/density normalizations pass the table. Leech deep-hole classification, number/types of holes and its proof are not source-certified. |
| 4.3 extreme forms | dsv2007 lines 69–71, p.2; ash1977 lines 520–527, §4 corollary, p.1052 | Local-Hermite-maximum convention and perfect/eutactic criterion agree. Positive scaling explains the non-strict rank-one maximum. |
| 4.4 automorphisms / eutaxy | TauCeti PosDef/Finite.lean:140; IntegralLattices §§2C,6G | Native integral finiteness checked; direct QA computation validates the irreducibility argument. No external exact locator is provided for the real-form argument; its spanning-shell input is false (R01). |
| 4.11 Leech bound | cohnelkies2003 lines 212–252, Theorem 3.1, p.694; ckmrv2017 lines 60–75, Theorem 1.2, p.1018; lines 527–548 and 634–680, §4/Appendix A | Fourier sign, positive radius, positivity/normalization and scalar ratio agree. Source radius-one formulation rescales to r. CKMRV constructs f0=fhat0=1 with sign radius2; its Fourier eigenfunctions and Appendix inequalities supply the promised input. |
| 5.5 harmonic Gaussian | GoN §4.3, README:1710–1724; ThetaSeries Layer 1:476–482 | Positive-real-parameter identity is supplied; complex continuation is owned here. At τ=i the multipliers are −i and −1 for degrees1,2. Stein–Weiss text unavailable, so that bibliographic locator remains uncertified. |
| 5.6 harmonic theta | venkov2001 lines 8251–8259, Theorem16.1, printed p.59 | Even unimodular lattice and homogeneous metric-harmonic polynomial; positive degree gives a cusp form. Corrected Gram metric agrees. Degree-zero scalar assertion needs R06. |
| 5.7 Venkov | venkov2001 lines 8394–8400, Theorem16.4, p.61; lines8550–8592, equation(16.6) and proof, p.62; Remark16.5 lines8401–8408 | The theorem names the minimal shell; the proof annihilates every positive shell coefficient, supporting the all-shell extension. Strengths11,7,3 agree. The proof's extra degree t+3 explains R07. |
| 6.2 truant / escalation | bhargava2000 lines1437–1458, §2, pp.27–28; lines1460–1479, §3 | Source permits adjoining a truant-norm vector without rank increase. The singular augmented Gram is handled by quotienting its radical; integral pairing bounds are finite. |
| 7.1 tensor product | Mathlib BilinearForm/TensorProduct.lean:108–119; Matrix/Kronecker.lean:402–405 | Pure-tensor form and determinant identities agree. Rank, parity and dual identities checked on explicit factors, including zero rank under standing positivity. Kitaoka Chapter7 remains unread. |

Additional opened text: dsv2007 Table1 and Theorem1.1, lines87–107, preprint p.3 support the counts 2,3,7,33,10916 (without rerunning the classification). Ash Theorem3, lines528–541, p.1052 supports eutactic finiteness on the normalized section; its literal missing scaling is recorded below. Bhargava §6(ii)–(iii), lines1703–1718, p.31 supports the nine-number test and minimality. The Bhargava–Hanke institutional preprint Theorems1–3, lines16–29, p.1 was also visually read to resolve extraction glyphs: the exact 29 integers agree with Lean. Its integer-coefficient quadratic form becomes the half norm of an even integral bilinear lattice by doubling the Gram convention.

Hanke's equation(4.8), lines708–722, p.367 gives integral-weight cusp bounds; Theorem5.7(b), lines963–981, p.373 retains the anisotropic part and the product over good primes with χ(p)=−1. Restricting anisotropic valuations yields the C_E(Q,B)m form in §6.4, rather than silently discarding those primes. The roadmap owns the needed local reductions and terminal representation arguments. Their complete future proofs have not been supplied by a source citation alone.

cohnkumar2009 lines70–74 gives optimality/uniqueness (Theorems9.3/11.7). festiveniani lines109–120, §2.1 p.3 uses full norm modulo2ℤ, explaining R04's adapter. spherepackinglean lines324–382 contains the external dimension24 theorem and magic-function/rigidity imports; compatibility with these pins was not tested.

**Pinned library audit.** Pins: Mathlib f6090c7095e1e56b3464c1daba5f24631f1290d2; Tau Ceti 358314d4ab97483df4fc4cb8adcc02e74a8d9f5a. Object searches covered forms, lattice fullness/discreteness, Gram matrices, shells/minima, covolumes, harmonic polynomials/Fourier, tensor forms and finite discriminant isometries. These 24 file/line entries were opened at the pins; paths are relative to the respective library repository.

| File:line | Native content and boundary |
| --- | --- |
| Mathlib/LinearAlgebra/Matrix/PosDef.lean:164 | Matrix.PosDef includes Hermitian symmetry and positivity on nonzero finite-support vectors; the finite real-matrix specialization includes rank zero. |
| Mathlib/Algebra/Module/ZLattice/Covolume.lean:125 | covolume_eq_det concerns coordinate-space volume and a discrete full lattice with an integral basis; Gram-metric volume needs the adapter. |
| Mathlib/MeasureTheory/Group/GeometryOfNumbers.lean:65 | Minkowski strict-volume theorem with convexity, symmetry, Haar measure and fundamental domain. |
| Mathlib/MeasureTheory/Measure/Lebesgue/VolumeOfBalls.lean:343 | InnerProductSpace.volume_ball has Nontrivial and finite-dimensional hypotheses; the zero-dimensional convention is handled separately. |
| Mathlib/MeasureTheory/Constructions/HaarToSphere.lean:51 | toSphere is a measure on the unit sphere; mass n·volume(ball), not automatically a probability. Lines87–103 supply positive finite mass in positive dimension. |
| Mathlib/LinearAlgebra/BilinearForm/TensorProduct.lean:108 | tensorDistrib is heterobasic; tensorDistrib_tmul at115 gives scalar multiplication, specializing to the product formula over ℚ. |
| Mathlib/LinearAlgebra/Matrix/Kronecker.lean:402 | det_kronecker with finite indices and a commutative ring; exponents are the opposite factor's rank. |
| Mathlib/NumberTheory/ModularForms/LevelOne/DimensionFormula.lean:146 | Odd-weight level-one modular forms vanish. |
| Mathlib/NumberTheory/ModularForms/LevelOne/DimensionFormula.lean:155 | CuspForm.rank_eq_zero_of_weight_lt_twelve. |
| Mathlib/NumberTheory/ModularForms/LevelOne/DimensionFormula.lean:160 | Weight12 cusp rank one; discriminantEquiv shifts weight by12. |
| TauCeti/LinearAlgebra/IntegralLattice/Basic.lean:63 | Full finitely generated integral symmetric lattice; positive definiteness and nondegeneracy are extra hypotheses. |
| TauCeti/LinearAlgebra/IntegralLattice/Norm.lean:94 | integralNorm is the bilinear self-pairing, without dividing by2. |
| TauCeti/LinearAlgebra/IntegralLattice/PosDef/Minimum.lean:81 | Natural-number minimum; zero-carrier convention at94; least positive attained value under nontriviality at123. |
| TauCeti/LinearAlgebra/IntegralLattice/PosDef/RepresentationNumber.lean:73 | Shell cardinality uses Set.ncard; finiteness is needed to infer representation from nonzero cardinality. The roadmap's applications assume positive definiteness. |
| TauCeti/LinearAlgebra/IntegralLattice/PosDef/Finite.lean:140 | IsPosDef.finite_isometry, with positive-definite codomain; the proof uses finite norm sets for basis images. |
| TauCeti/LinearAlgebra/IntegralLattice/PosDef/Covolume.lean:120 | covolume_range_sq_eq_determinant requires inner-product preservation and full real span. |
| TauCeti/LinearAlgebra/IntegralLattice/PosDef/Hermite.lean:81 | Integral Hermite inequality exists now; real forms are the new generality here. |
| TauCeti/LinearAlgebra/IntegralLattice/PosDef/SuccessiveMinima.lean:45 | Integral squared minima indexed by Fin(finrank); first-minimum comparison at103 retains a positive-rank index. |
| TauCeti/LinearAlgebra/IntegralLattice/Discriminant/Bilinear.lean:193 | Existing induced bilinear isometry for a nondegenerate lattice. |
| TauCeti/LinearAlgebra/IntegralLattice/Discriminant/Quadratic.lean:126 | discriminantQuadraticMap_mk is half norm moduloℤ; native induced quadratic isometry at232. |
| TauCeti/LinearAlgebra/FiniteBilinearModule/Basic.lean:262 | Isometry is an additive equivalence preserving the pairing. |
| TauCeti/LinearAlgebra/IntegralLattice/RankOne.lean:98 | Native rankOne parameter m gives Gram2m, distinguished from the theorem's Gram-entry parameter. |
| TauCeti/LinearAlgebra/IntegralLattice/RootLattice/TypeE.lean:111 | Native E₆ carrier; related E₇/E₈ definitions and E₈ minimum theorem at744 exist. Root-count target is not yet a pinned declaration. |
| TauCeti/NumberTheory/ModularForms/LevelOne/GradedRing.lean:746 | mvPolynomialEquivModularForms identifies the full graded level-one ring with ℂ[X₀,X₁] evaluated at E₄,E₆. |

The 16 scanner leads resolve to five own theorem names, two module/planned-module references, the supplier's E₈ kissing target (R09), and eight database labels/fields; none establishes a missing library declaration.

**Ownership and supplier order.** Read main IntegralLattices, ThetaSeries and SuccessiveMinima for shape. Object searches used `roadmaps grep`/`roadmaps show`, main, supplied open checkouts and board packages. Period/coefficient-lattice tensor hits describe different objects. No competing owner or duplicate fully qualified name was found for the new geometric targets. Resolved contracts:

| Supplier and repository-relative location | Resolved input / convention |
| --- | --- |
| TauCetiRoadmap/IntegralLattices/README.md:562,609,619,642 | §0F unimodular splitting; §§1C–1D finite discriminant iff nondegenerate and half-norm ℚ/ℤ refinement; §1G finite-module isometries. |
| TauCetiRoadmap/IntegralLattices/README.md:772–817 | §§2A–2G bounded norms, minima/shells, automorphism finiteness, covolume, integral bounds, successive minima and reduction. These are consumed, not re-planned. |
| TauCetiRoadmap/IntegralLattices/README.md:1273,1652–1689 | §4A genera; §§6B–6G even-unimodular existence, small-rank/reference constructions, E₈ model comparison and root-group count. §6E alone does not classify all rank24 lattices. |
| Completed/IntegralLattices/README.md:162,227,258,350 | Existing carrier, dual/discriminant and finite-form theory; Layer5 native ADE construction and half-norm values. R09 repoints the root input here. |
| TauCetiRoadmap/ThetaSeries/README.md:432–482 | Layer1 lattice Poisson/summability and Gaussian Fourier transform use the negative Fourier phase. |
| TauCetiRoadmap/ThetaSeries/README.md:516,545 | §§2D/2G rational-to-real model and squared-norm shells, including the zero shell. |
| TauCetiRoadmap/ThetaSeries/README.md:675–701,949,970 | Level-one even-unimodular theta theory/graded ring; §§8B/8D E₈ count240 and Leech count196560. Harmonic weights are new here. |
| TauCetiRoadmap/Rank24LatticeConstructions/README.md:312–375 | Layer6 Leech construction, evenness/unimodularity, no roots, minimum4; ambient form dot/2 is tracked before conversion to the geometric norm. |
| TauCetiRoadmap/SuccessiveMinima/README.md:307,488,658 | §1.1 real minima with index guards; §1.5 independent real-basis witnesses, not necessarily an integral basis; §2.1.4 lower second theorem. |
| TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md:460,1710–1724 | Earlier open new roadmap: §1.3 upper second theorem; §4.3 generic Laplacian, Fischer/sphere decomposition and real-parameter harmonic Fourier identity. Only Gram adaptation and complex continuation are owned here. |
| TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md:1894,2029,2069,2145,2166 | §§4.4.1–4.4.2 packing/covering; §4.5.1 StarBody does not itself impose boundedness; §4.5.8 Mahler assumes n≥2 and a positive shortest-length cutoff; §§5.1.2/5.1.4 LLL background. |
| TauCetiRoadmap/ModularForms/README.md:305,327,436,583,618,638 | Eisenstein/cusp decomposition, vanishing order/dimension, Hecke recurrences, bad-prime eigenvalues and new/old-form inputs to §6.4. |
| TauCetiRoadmap/WeightsInEtaleCohomology/README.md:694–719 | Earlier open new roadmap §6.1 supplies good-prime Ramanujan bounds, all complex embeddings, weight≥2. Bad primes remain explicitly supplied by ModularForms. |
| TauCetiRoadmap/GlobalQuadraticForms/README.md:443,694 | §§4.4/6.1 Hilbert reciprocity and rational local-global representation. These are not mistaken for an integral representation theorem. |
| TauCetiRoadmap/OrthogonalTamagawaAndLatticeMass/README.md:525–553 | Supplied open head §4 owns rank16/24 orders and mass exhaustion, consuming E₈ order from IntegralLattices §6G. No mass/class-number proof is newly planned here. |
| TauCetiRoadmap/SiegelModularForms/README.md:120,400,1276 | Supplied open head explicitly leaves degree-one harmonic theta/design/Venkov here and compares its higher-degree theory at g=1. It is a downstream scope boundary, not a supplier edge here. |
| TauCetiRoadmap/HalfIntegralWeightModularForms/README.md:11,716; TauCetiRoadmap/QuaternionArithmetic/README.md:46,632 | Odd-rank theta and ternary Clifford/order theory are distinct scope boundaries; neither is imported upward. |

These 17 rows use main for existing roadmaps and open heads for new ones. No ownership was moved upward; sources were not treated as supplier contracts.

## Not verifiable

- **martinet2003:** the author-hosted preface/contents was readable; the full Springer book was not. Chapter2 §2.3 at p.41 and Chapter3 §3.4 at p.78 are confirmed from contents, not their proofs/hypotheses. Mordell, reduction, eutactic finiteness alternatives and other book-dependent assertions remain uncertified from this source.
- **conwaysloane1999; cassels1971:** the sources service reached paywalled publisher material and marked these uncertified. In particular, Conway–Sloane Chapter23's Leech deep-hole classification was not read. No request to bypass a paywall or reopen a settled uncertified source was made.
- **kitaoka1993:** Cambridge book landing page only; Chapter7's rank≤43 theorem and precise hypotheses remain uncertified. The example checks do not certify it.
- **steinweiss1971; gruber1987:** bibliographic service searches yielded no readable legal full text for the cited harmonic Fourier and covering-bound chapters. Supplier formulations and explicit examples were checked instead, without claiming the book locators were verified.
- **schuermann2009; voronoi1908:** AMS landing page / bibliographic searches did not provide the required legal text. Full Ryshkov-neighbour and original Voronoi proof passages were not certified. The readable DSV/Ash statements provide independent checks of some endpoints, not every proof detail.
- **lmfdb-density:** the prior cached knowl is readable; a fresh request returns CAPTCHA. No claim is made about unseen historical versions. The large LMFDB record labels, automorphism-order table entries and stored decimal values were not independently fetched or recomputed as a database audit.
- External sphere-packing code was not tested at the pins. Venkov locators refer to the version read, printed pp.59–62, without assuming another edition's numbering.

Five unresolved texts remain in the missing-reference file. Recovered texts are not requested again. The seven blocking findings have independently checkable witnesses.

## Source issues

- **Misprint** in ckmrv2017 at Theorem1.2, printed p.1018: the source says the Schwartz function has codomain ℝⁿ; it should be scalar-valued in ℝ; affects a stated result.
- **Misprint** in ckmrv2017 at the paragraph after Theorem1.2, printed p.1018: the source says to optimize the bound from Theorem1.1; it should be the bound from Theorem1.2; affects nothing.
- **Misprint** in ash1977 at Theorem3, printed p.1052: the source says there are finitely many Γ-orbits of perfect and eutactic points in the entire cone; it should be ℝ₊Γ-orbits, or Γ-orbits on the normalized boundary section; affects a stated result.
- **Error** in dsv2007 at §1, preprint p.2: the source says A=PᵀBP implies Dom(A)=P Dom(B) Pᵀ; it should be Dom(A)=P⁻¹ Dom(B) P⁻ᵀ; affects a stated result.
- **Misprint** in dsv2007 at §1, preprint p.2: the source says finitely many arithmetically inequivalent perfect forms exist in each dimension without normalizing scale; it should quotient by positive scaling as well, or fix the minimum; affects a stated result.
