# Repair report: QSeriesPartitionsAndMockModularForms

## F01 (P2) — applied

Ill-typed semiring use of `PowerSeries.expand` → its explicit coefficient substitution, preserving semiring generality. The modulus-one, decimated-quadratic and two xi examples now use the missing finite-filter, coefficient and complex-algebra steps. README §4.7 and the Mathlib supplier contracts describe the substitution and ring-only expansion comparison.

Evidence: at Mathlib pin `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, `Mathlib/RingTheory/PowerSeries/Expand.lean:28` requires `CommRing`; `coeff_expand` at line 110 gives precisely the substituted coefficient formula. `Finset.filter_true_of_mem` is in `Mathlib/Data/Finset/Filter.lean:166`; the coefficient formulas are in `Mathlib/RingTheory/PowerSeries/Basic.lean:214`, line 232 and line 257. Modulo one every statistic value equals zero. The two xi values reduce to −i²=1 and 2i/2=i, respectively. The import and `partitionRank_conjugate` remain intact; full elaboration is unavailable, as specified by the brief.

## F02 (P2) — applied

Analytic Rogers–Ramanujan headline alone → two additional native finite-count headlines, `rogersRamanujan_count` and `rogersRamanujan_count_two`. Added real-bodied `IsGapTwo` and `IsPlusMinusOneMod5`, their prose-labelled README APIs, three Checks each, and two proved examples each. The second counting law includes minimum part two and residues two or three; both include size zero.

Evidence: Pak2002 line 3703 gives both generating identities; Pak2002 line 3745 identifies the first counting interpretation, and Pak2002 line 3755 specifies its second counterpart. Removing the staircases (2r−1,…,1) and (2r,…,2) gives the two gap interpretations. At the Mathlib pin, `Nat.Partition.restricted` in `Mathlib/Combinatorics/Enumerative/Partition/Basic.lean:205` is a filtered native partition finset, and `card_odds_eq_card_distincts` in `Mathlib/Combinatorics/Enumerative/Partition/Glaisher.lean:158` confirms the count-statement carrier. `Multiset.sort` in `Mathlib/Data/Multiset/Sort.lean:30` preserves multiplicity. These additions specialize native notions without replacing their carriers.

## F03 (P3) — applied differently

Missing milestones → `ramanujanOnePsiOne_hasSum` and `quintupleProduct_hasSum`, each asserting `HasSum` and absolute convergence. Added the light `ramanujanOnePsiOneTerm`, with its API, three Checks and two proved examples. The Ramanujan signature explicitly excludes denominator poles; its negative coefficient uses polynomial ratios, retaining b=0 and terminating negative tails. README names and source locators agree.

Evidence: Gasper1995 line 478 through line 496 gives the two-tail coefficient formula; Gasper1995 line 502 through line 508 gives the summation and annulus. For j=−m the coefficient ratio is the product of `(b-q^r)/(a-q^r)` for 1≤r≤m; unlike a formula involving q/b, this remains meaningful at b=0. The review's abbreviated hypothesis list needs the factor exclusions already required by README §2.5. The annulus forces z≠0 and |b/(az)|<1; the explicit exclusions ensure the other denominator products are nonzero. Gasper1995 line 608 gives the quintuple summand and both product factors. Integer powers and integer division of the even quadratic numerator preserve its signed exponent. The existing certified Gasper source entry now also records (2.1.8).

## F04 (P3) — applied differently

Unqualified source attribution for every finite-index group → explicit full-group attribution in §§8.5–8.6 and an identified finite-index extension. Fourier/kernel theory uses the local cusp-width argument of §8.4a; surjectivity uses a normal torsion-free subgroup and finite-quotient averaging. Generality, theorem targets and the existing vector-bundle supplier gap are retained.

Evidence: BruinierFunke2003 line 383 introduces the full-group abbreviation, and BruinierFunke2003 line 626 states Theorem 3.7 in that notation. However, its proof explicitly constructs surjectivity for a normal subgroup at BruinierFunke2003 line 663 through line 693, then descends at BruinierFunke2003 line 694 through line 696. Applying the same construction below an arbitrary finite-index Γ and averaging over Γ/N gives the desired extension. Averaging arbitrary Fourier data would discard noninvariant components, so §8.5 instead identifies its actual local proof. No surjectivity for arbitrary representations or weight one is introduced.

## F05 (P3) — applied

README §1.5's concatenation locator, Gasper1995 line 327 → Gasper1995 line 329. The inversion locator remains Gasper1995 line 313. No mathematical statement or Lean name changes.

Evidence: Gasper1995 line 327 introduces the exercise; Gasper1995 line 329 is its concatenation identity (ii).

## Adversarial mathematics pass

The table records direct mathematical checks, rather than Lean execution. Source-backed endpoints retain the hypotheses and ownership boundaries in the README.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| §1.1 finite products, recurrence and scalar change | n=0,1,2; q=0,1; zero ring; identity homomorphism | P₂=(1−a)(1−aq); empty value 1=0 in the zero ring; no nontriviality needed | None |
| §§1.2–1.3 reciprocal products and quotient coefficients | a=3,q=2,n=−1; denominator parameter 2 versus numerator parameter 2 | P₋₁=−2; Q₋₁([3];[2];2)=0; numerator pole excluded | None |
| §§1.4–1.6 formal products, stabilization, units, inversion and analytic limits | a=0,1; degrees 0,1,2; coefficients in characteristic two; n=2 inversion; a=q⁻¹ | Tail at zero is 1; full product at one is 0; coefficients in characteristic two are 1,1,1; zero tail cannot be divided out | None |
| §§2.1–2.3 unilateral and bilateral normalization and domains | Empty parameter lists; numerator or denominator 1; q=0; q=2,a=±1/2; j=−1 | Empty-list c₁=−1/(1−q); denominator 1 excluded; large-base radii distinguish a terminating polynomial from a nonterminating series | None |
| §2.4 binomial and Euler sums | q=0; a=0; q=1/2 through degree two | Binomial value (1−az)/(1−z); entire Euler value 1+z at base zero; inverse series begins 1+2z+(8/3)z² | None |
| §2.5 Ramanujan term and sum | j=0,−1; a=2,q=z=1/2,b=0 or q; a=b; a=q; b=1 | Constant term 1; negative term −2/3 or 0; a=b gives no annulus; the last two choices exhibit the necessary pole exclusions | New coefficient definition, examples and guarded headline |
| §§2.6–2.7 Bailey relation, transform and limits | Zero pair; normalized delta pair; a=q=0; ρ₁=aq≠0 | β₀=α₀; transformed delta pair at zero base has β=1; forbidden ρ gives a zero denominator | None |
| §§3.1–3.2 Gaussian and Schur identities | n=0,1,2; invalid signed index; Q=1,−1 | Initial data 1,1; length-two values 1+Q and 1+Q²; G(2,1)(−1)=0 without a quotient | None |
| §3.3 gap and residue predicates; both counting theorems | Empty partition; (1),(2),(3); size-four (4),(3,1),(2,2) | First counts for sizes 0–4 are 1,1,1,1,2; second are 1,0,1,1,1. Gap accepts (4),(3,1) but rejects (2,2); residue ±1 accepts only (4) among these three | Added native definitions, headlines and discriminating examples |
| §§3.3–3.5 analytic/formal products and ordinary partition adapter | q=0; degrees 0–4; scalar reduction modulo two | Rogers–Ramanujan constant values 1; ordinary counts 1,1,2,3,5; scalar change preserves the constant coefficient | None |
| §3.4 quintuple product | n=0,±1; z=1,−1; excluded z=0 or q=0 | At z=1 terms begin 2−2q−2q²; at z=−1 the paired integer terms cancel and the product has a zero factor; bilateral guards retained | Added headline with integer powers |
| §§4.1–4.3 rank, crank and weighted partitions | Empty partition; (1); (3,2,1,1); (3,3) and conjugate (2,2,2); z=−1 | Singleton rank 0, crank −1; strict-filter crank −1; conjugate ranks ±1; V₁=z+z⁻¹−1 and C₁=z⁻¹ | None |
| §§4.4–4.5 filters, dissections and equidistribution | t=1,2; zero statistic; sizes 1,4,5,6,49 | Modulus-one filter keeps every partition; zero statistic has empty residue-one fiber modulo two; size-6 rank-one count is 2; 11·15775=173525 | Repaired modulus-one proof |
| §§4.6–4.9 offsets, eta modules and prime powers | ℓ=2,3,5,7,11; r=1,2,3; δ(7,3)=243 | 24·243=17·343+1; 49 divides p(243), 343 does not; the exceptional first seven-step remains separate | None |
| §4.7 coefficient decimation and pullout | t=1,2; X,X²; constant coefficients; zero coefficient semiring; coefficient convolution at tn | U₂(X)=0, U₂(X²)=X; U₂(1+X+2X²)=1+2X. For t≠0 the contributing convolution indices are t·r and t·(n−r), giving the projection formula without subtraction | Preserved semiring statement by explicit substitution; repaired coefficient example |
| §§5.1–5.2 odd theta and eta multiplier | Two central half-integer terms; τ=i; S,T,−I | Pair gives i·exp(πiτ/4)(exp(πiz)−exp(−πiz)); derivative sign −2π; ν(S)=exp(−πi/4), ν(−I)=−i | None |
| §§5.3–5.7 error kernel, Mordell integral, R, μ and completion | x=0; u=0; ν=±1/2; unit and τ shifts | β(0)=1, E′(0)=2; h(±1/2;i)=1; R is even; μ residue −1/(2πiϑ); S-defects cancel with +(i/2)R | None |
| §§6.1–6.3 unary theta, periods and torsion | a=b=0; a=1/6; d>0 scaling; boundary a=1/2; order-two characteristics | g(0,0)=C(0,0)=0; leading g(1/6,0) coefficient 1/6; scaled xi factor −√(2d); endpoint crossing term cannot be dropped | None |
| §§7.1–7.4 indefinite cone data, kernel and transforms | Hyperbolic plane; opposite cone; equal data; two boundary vectors; odd diagonal matrix | Boundary kernel 2 or 0; equal data give zero; Q⁺ is identically zero for the boundary pair, which is outside its positive-definiteness theorem; odd diagonal shift retained | None |
| §7.5 orthogonal correction factorization | A=[−2], c=1 or 2, a=1/4,b=0 | c=2 requires two cosets; splitting 1/4+ℤ yields characteristics 1/8 and 5/8 at scale 8τ; leading minus follows from Q(c)<0 | None |
| §§8.1–8.4a modular carriers, differential operators and Fourier kernels | k=0,1,1/2; constants, y,iy,y²,log y; M=1,i,2 and one unipotent block | ∂bar y=i/2; ξ₀y=1; ξ₀(iy)=−i; Δ₀y²=−2y²; H₀(w)=exp(w); k=1 requires log y; nonunit and Jordan monodromy need complex frequencies and polynomial factors | Repaired the two xi example proofs |
| §§8.5–8.7 Weil Fourier theory, exact sequences and shadows | Rank-zero lattice; ⟨2⟩; full group and subgroup omitting central kernel; constant and polar shadows | Full-group parity may force zero; subgroup condition remains conditional; ξ₀conj(q⁻¹)=4πq⁻¹ permits polar weak shadows; averaging is over a finite quotient | Clarified full-group source versus finite-index extension |
| §§9.1–9.5 theta components, meromorphic data, residues and decomposition | m=1,l=0,1; excluded m=0; zero or constant datum; double pole with f=1+v+conj v | Leading components 1 and q^(1/4); nonzero constant fails positive-index ellipticity; mixed residue of f/v² is 1; empty poles recover theta decomposition | None |
| §§10.1–10.4 unilateral functions and Hecke/cone comparisons | q=0; third-order coefficients through q³; χ relations; seventh-order leading terms | f begins 1+q−2q²+3q³; ψ₁ retains constant 1; φ₁(−q)/q tends to −1; A₁ begins q while A₂ begins 1 | None |
| §§10.5–10.8 correction vectors and transformation matrices | Opposite fifth-order corrections; S²; seventh-order exponents | Fifth corrections sum to zero; normalized sine matrices square to identity; seventh leading exponents −1/168,47/168,143/168 agree with T phases | None |
| §§11.1–11.3 root-of-unity rank completions and residue deviations | ξ=−1,1; α=1/3; t=1,2; a lower unipotent at t=2 | ξ=−1 gives q^(−1/24)f−2C; ξ=1 has weight −1/2 and is excluded from the nontrivial-root theorem; order-three poles must cancel; t=1 deviation is zero | None |

## Checks and maintainer notes

- **Elaborate `Suggested.lean`: not available.** No Lean command was run. The four repaired proofs and all new signatures/examples were inspected against pinned source APIs, but this report makes no build-success claim. The full file, including its Tau Ceti import and `partitionRank_conjugate`, still requires elaboration in the worker's permitted build environment.
- **Dependency direction: passed**, exit code 0. Exact output:

    depcheck: 6 roadmaps, 40 edges, 0 problem(s)

  There is no UPWARD or CYCLE line.
- **Static consistency: passed.** 627 Lean lines; 15 real-bodied definitions, 53 theorem targets and 26 proved examples; all 68 named declarations occur in the README. The README identifier check returns no missing names; the six supporting gap/residue and bilateral-term API goals use prose labels, preserving their statements without adding non-headline Lean declarations. The three added definitions each have at least three README Checks and exactly two examples. No sorried data, admitted examples, `set_option`, extra Mathlib imports or forbidden inspection commands were introduced. The imports remain `Mathlib` and the individual pinned Tau Ceti conjugation module. New declarations have docstrings and sit in README layer order.
- **Formatting and manifests: passed.** `git diff --check` is clean; both TOML files parse. All 13 certified source texts are present in the legal source cache. The three uncertified and two waived entries remain settled. No new work or unread source was required; only Gasper1995's existing locator list changed. No missing-reference request is needed.
- **Ownership inspection: passed for the repaired endpoints.** Read two main-branch roadmaps for shape, the five named sibling package roadmaps for scope, and the relevant pinned partition, sort, coefficient and expansion APIs. Object searches found no existing Rogers–Ramanujan count, bilateral 1ψ1 or quintuple-product theorem in either pinned library. Native restricted partitions and sorting are consumed explicitly. The named sibling roadmaps do not own these endpoints.
- **Supplier gaps remain external requirements.** `classical-metaplectic-model` (MetaplecticAutomorphicForms §§2.4b–2.6), `analytic-elliptic-regularity` (PDE Lane E), and `vector-bundle-dolbeault` (ModularForms Layer 10B) retain matching README and top-level design slugs. This package cannot discharge their suppliers' extensions. The attribution repair does not claim those contracts have been fulfilled. No new supplier, gap or merge-order change was needed.
- **Downstream API consequence.** No name was deleted or renamed. `qSeriesDecimation_pullout` retains its semiring binder but now spells out coefficient substitution; ring consumers compare it with `PowerSeries.expand` using `PowerSeries.coeff_expand`. Added names are `ramanujanOnePsiOneTerm`, `ramanujanOnePsiOne_hasSum`, `IsGapTwo`, `IsPlusMinusOneMod5`, `rogersRamanujan_count`, `rogersRamanujan_count_two`, and `quintupleProduct_hasSum`.
- Edited only `packages/QSeriesPartitionsAndMockModularForms/README.md`, `packages/QSeriesPartitionsAndMockModularForms/Suggested.lean`, `packages/QSeriesPartitionsAndMockModularForms/sources.toml`, and this report. Metadata and design data are unchanged. No commit, push or external write was made.
