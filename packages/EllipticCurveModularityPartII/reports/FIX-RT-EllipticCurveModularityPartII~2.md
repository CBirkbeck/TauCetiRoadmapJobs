# Repair report: EllipticCurveModularityPartII

The two reviews are identified below as r2a and r2b. Their overlapping claims share repairs, with a separate verdict for every finding. Changes are confined to this report, README.md, Suggested.lean, sources.toml and the top-level gaps list of design/plan.json in packages/EllipticCurveModularityPartII.

# Review r2a

## F01 (P1) — not actionable in this package: supplier-owned prerequisites

Source-only inputs → explicit split-cartan-rational-points and cuspidal-divisor-torsion gaps, identically recorded in README and plan. §§6.10 and 6.8 consume them; §6.5 also uses cusp torsion. BPR2013 line 55 and DarmonMerel2001 line 761 verify the inputs. Delivering these general theorems requires the named earlier owners; this package can specify their contracts, not edit their roadmaps.

## F02 (P2) — applied differently

“Integrality not statable” → lemos_integral_j on native elliptic curves and geometric torsion. The real-bodied ImageInNonsplitCartanNormalizer uses a quadratic field subring, as in r2b/F01, rather than the proposed cyclic-subgroup signature. README §6.1 supplies its cyclic characterization and three discriminating Checks. Lemos2017 line 136 verifies the full containment theorem without non-CM or p>37 restrictions.

## F03 (P2) — applied

Weight two and prime-power ideals → all nonnegative weights, positive levels, characters, number fields and ideals, including coefficient zero. README §4.2 gives the one-form theorem and its two-form consequence; §4.3 applies it modulo four. ComputationalNumberTheory §3.4 remains the imported level-one specialization. Kraus1997 lines 1060–1081 support the generality; constant, Δ and composite-ideal Checks were added.

## F04 (P2) — applied

Constructing the newspace operator again → consuming ModularForms Layer 6. README §6.3 owns only comparison with arithmetic quotient pullback and descent of invariant differentials. Scope, exact contracts and dependencies name Layer 6. The r=5,p=11 normalization is 1; r=p=5 fails exact divisibility. ModularForms README lines 679–706 verify ownership.

## F05 (P2) — applied

Compound/vague needs → atomic conductor, reduction, oddness, classification, residual-newform, modular-conductor, mixed-curve, Jacobian, newform-quotient and isogeny-degree contracts. All consumers and matching plan entries changed. The exceptional-image exclusion uses p>17, supported by Mazur1978 lines 68–75. Integral winding comparison now names its pullback, lattice and ramification hypothesis; separate missing inputs are treated in F01, F11 and F12.

## F06 (P1) — applied

Coefficient integrality as the conjugation supplier → ModularForms Layer 8G's conjugate forms, character transport and orbit size. Scope, contracts, §§2.2, 3.1–3.2 and dependencies changed. Layer 4 supplies the bad-prime coefficients used by the same proof. ModularForms README lines 935–963 verify 8G; Kraus1997 lines 299–305 and 321–348 show both inputs in the argument.

## F07 (P2) — applied

Forward-consuming target order → prerequisites before consumers inside the same six layers. Independent dimension/majorant, Sturm/matrix, geometric comparison and predicate paragraphs were separated without new mathematical targets. Native torsion definitions also precede Layer 5's conclusions. Separate Needs lines identify winding, period, coefficient-support and cotangent inputs. The internal edge audit below records the resulting order; the macro dependency gate also passes.

## F08 (P3) — applied

Rational points fixed by every action → the nonrational two-torsion of y²=x³−2. README §5.1 computes σP₀=P₁, τP₁=P₂, (στ)P₀=P₁ and (τσ)P₀=P₂. Scalar controls give 3P_i=P_i and 0P_i=0 modulo two. The native adapter already had the correct action, so Suggested.lean needs no Check declarations.

## F09 (P2) — applied

Missing acceptance theorem → rationality_of_small_prime_coefficients on HeckeRing.GL2.Newform, with trivial character and the exact native q-expansion. README §3.1 names it. N>0 and the inclusive inequality 6q≤μ(N) are explicit. Kraus1997 lines 295–305 verify the statement and its conjugation/Sturm proof inputs; the level-11 Check includes coefficients zero through four.

## F10 (P3) — applied

Unlocated Chebotarev/perfectness inputs → Chebotarev Layer 10 and Matrix.SL2.commutator_eq_top, in exact contracts and their consumers. Perfectness is also named in the winding-boundary argument. README §§4.5 and 6.16 compute S₃ densities 3/6 and 2/6, and the F₅ witness 2²=4≠1. The pinned theorem is in Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean:804.

## F11 (P2) — applied

Unspecified semistable comparison → optimal-quotient-cotangents with source, target, exact sequence, semistability and e<q−1. The winding contract retains its separate modular-differential identification and pullback, with the same ramification restriction. README §6.7 applies exactness before reduction. Mazur1978 lines 356–383 verify both the theorem and its characteristic-two counterexample; Checks compare 1<22 with the false inequality 1<1.

## F12 (P1) — not actionable in this package: supplier-owned coordinate and point theorems

Generic j maps → five-level-j-coordinates and rational-isogeny-j-tables gaps, with identical plan entries. README §§6.15 and 6.17 consume them. Lemos2017 lines 197–202 and 231–243 verify the explicit formulas and exhaustive tables. Rescaling t↦2t changes the displayed formula; the full level-11 table retains its CM point. Proving these inputs belongs to ModularCurvesPartII.

## F13 (P2) — applied

Missing acceptance theorem → integral_sturm_congruence on modFormCharSpace, with an actual modular form and every coefficient tied to an integer-ring sequence by a fixed complex embedding. README §4.2 names the theorem and its difference-form consequence. Kraus1997 line 1060 supplies the locator. No new integral-lattice stand-in or admitted data was introduced.

# Review r2b

## F01 (P2) — applied

The same integrality omission as r2a/F02, plus the missing proper-image headline, is repaired by the shared native field-subring predicate, lemos_integral_j and nonsplit_of_not_surjective. README §§6.1, 6.10 and 6.11 match their hypotheses. The module docstring reserves missing-carrier explanations for correspondence, winding quotient and formal immersion. Lemos2017 lines 136 and 223 verify the two statements.

## F02 (P2) — applied differently

The shared atomic-contract repair is recorded under r2a/F05; every affected Needs/dependency reference was repointed. The suggested p>37 exceptional-image contract was strengthened to the source-supported p>17 statement, rather than retaining an application restriction. Mazur1978 lines 68–75 give this stronger range. The all-degree and non-CM prime-degree isogeny contracts are also separate.

## F03 (P3) — applied

Re-export-only Nebentypus/TrivialNebentypus imports → the defining Basic and DiamondOperators modules; Newform is additionally imported for the new rationality headline. README identifies cuspFormCharSpace in DiamondOperators and the Hom identity in Hom/Basic. The pinned definitions are Basic:202, DiamondOperators:279 and Hom/Basic:325. Elaboration succeeds with the new imports.

## F04 (P3) — applied

Search-status prose → mathematical section topics. All “locator unavailable” parentheticals and the sentence about unverified identifiers were deleted from the README contracts and every matching plan section. The contracts now specify the required mathematics without asserting an existing supplier section. No other plan key changed.

## F05 (P3) — applied

Shared example values → explicit newDimension Checks in §1.3, including the Γ₁(13) dimension-two negative control, and torsionModule scalar Checks in §5.1. Values are 0,1,0,3,1 at levels 1,11,13,35,30; on killed-by-two points, scalars 3 and 0 act as 1 and 0. These stay entirely in README; no acceptance padding was added.

# Verification outcomes

- Suggested.lean elaboration, run from the pinned content worktree with the requested lake env lean command: **exit 0**, exactly **10** declaration-uses-sorry warnings and no errors. Every imported object file was present; no module build was needed. The file has 218 lines, 21 declarations, ten admitted headline theorems and eleven supporting declarations with real bodies.
- A scratch copy containing the complete file followed by `#check @name` for **all 21 declarations** elaborated from the same worktree: **exit 0**, ten expected sorry warnings. Every elaborated type was compared with its README statement. No binder was lost. The four new theorem signatures explicitly retain level nonzeroness, character, coefficient binding, prime, isogeny, non-CM and prime-range hypotheses as appropriate; the new predicate retains ellipticity and primality. No old binder needed changing. One initial scratch invocation outside the pinned worktree failed with “no default toolchain configured”; the corrected invocation above succeeded without changing any configuration.
- Dependency check, with the supplied merge order and `--movable`: **exit 0**, exact output:

```text
depcheck: 34 roadmaps, 313 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line.

- Citation resolution against main and the indexed heads: no unresolved cross-roadmap citations and no unresolved own Lean names. The resolver does not inspect pinned external library names in this checkout; those names were independently located at the pins, as recorded below.
- Structural comparison: **27** gap entries match README supplier, slug, needs and section after removing Markdown code-span delimiters; every other top-level plan value equals the original. There are eight unique source keys, with original provenance retained. Kenku1982 remains the settled uncertified source; no source request was reopened.
- The computed mathematical probes completed with exit 0. They include exact rational dimension computations at all levels 1 through 1500, signed-divisor j-sets, noncommuting action labels, F₁₂₁ multiplication and all constrained modulo-four subgroups. They test the stated boundaries; the admitted universal theorems remain roadmap targets.
- Formatting gate failure **tex=4 → tex=0**: added inline code spans around the fibre-product expression in Exact supplier contracts, the endomorphism and finite-field expressions in §6.1, and the quotient expression in §6.3. The installed gate notation scanners report exactly `latex=0 tex=0`; no mathematical text or Lean signature changed. All other files and the finding verdicts were preserved.
- After this formatting repair, Suggested.lean elaboration again returned **exit 0**, with the same **10** expected sorry warnings. The required dependency command again returned **exit 0** and exactly `depcheck: 34 roadmaps, 313 edges, 0 problem(s)`, with no UPWARD or CYCLE line. All 27 supplier contracts still agree with the plan after Markdown normalization.
- An additional whole-worktree gate invocation returned **exit 1**, reporting two missing files under TauCetiRoadmap/EllipticCurveModularityPartII because this checkout stores the package under packages/EllipticCurveModularityPartII. Its notation scanners were therefore run directly on the actual README, with the zero counts above. No commit, push, issue/PR edit, merge-order change or tooling edit was performed.

# Internal supply audit

The six layers are unchanged. The prerequisite edges checked inside them are:

| Consumer | Earlier inputs |
| --- | --- |
| §1.3 dimension comparison | §1.1 local terms and §1.2 arithmetic expression |
| §1.4 bound | §§1.1–1.3 |
| §§1.5–1.10 thresholds | §§1.3–1.4 and the preceding threshold definitions |
| §1.11 majorants | §§1.4–1.10 |
| §4.3 finite recognition | §4.1 filters and §4.2 integral congruence |
| §4.4 trace transfer | §4.3 and Layers 1–3 |
| §4.6 isogeny repair | §4.5 matrix selection and named suppliers |
| §4.7 realization | §§4.4, 4.6 and Layer 3 |
| §§5.4–5.5 irreducibility | §5.1 predicates, §5.2 exclusions and §5.3 kernels |
| §6.4 correspondence | §6.3 exact-divisor differential comparison |
| §6.5 winding nonvanishing | §§6.3–6.4 and named suppliers |
| §6.6 rank-zero quotient | §§6.4–6.5 and rank-zero contract |
| §6.7 coefficient support / cotangents | §§6.3–6.6 and the explicit cotangent contract |
| §6.8 formal immersion / torsion | §§6.6–6.7 and cusp torsion |
| §6.9 away-p integrality | §6.8 and torsion specialization |
| §6.11 integral j | §§6.2, 6.9; proper-image corollary additionally §6.10 |
| §6.14 finite j-sets | §6.12 numerators and §6.13 arithmetic |
| §6.15 integral-j characterization | §§6.12–6.14 and coordinate contract |
| §6.17 finite-j image bounds | §§6.14–6.16 and rational-j tables |
| §6.18 Lemos | §§6.10–6.11, 6.15–6.17 and prime-degree contracts |

The finite-j theorem's non-CM hypothesis was made unambiguous on the entire union, including the integral sets. Otherwise j=1728, which occurs at level 2, would contradict it. No new theorem was added for that clarification. The small-coefficient proof also explicitly checks q≠ℓ before using Frobenius: g⁺≥1 gives F♯>μ/6≥q and ℓ>F♯.

# Adversarial mathematics record

Each row names a statement or a defining/API law. Values are computed in the indicated instance; supplier rows test the contract's boundary without claiming that its owner has implemented it. All 47 numbered subsections, every Lean declaration, the defining API laws and the standing conventions are covered.

| Statement | Instances tried; values computed on the two sides | Result | Change |
| --- | --- | --- | --- |
| Arithmetic Frobenius convention | y²=x³−x/F₅: point count 8, a₅=6−8=−2; characteristic polynomial T²+2T+5, reciprocal polynomial 1+2T+5T² | Trace and determinant agree; inverse Frobenius would have determinant 1/5 | Convention retained |
| Γ₀ index convention | μ(1,2,3,4,11,13,16,30,35,44)=(1,3,4,6,12,14,24,72,48,72) | Product and subgroup-index normalizations agree | Retained |
| Deletion/residual levels | Multiplicative q≠ℓ with v_q(Δ)=ℓ: elliptic/deletion/residual exponents 1/0/0; additive coefficient prime: positive/positive/0 | Levels cannot be identified without the stated reduction alternative | Atomic contracts |
| Geometric cyclic kernel convention | C₂×C₂ has order 4 and exponent 2; C₄ has order and exponent 4; a stable C₅ has order 5 without five rational points | Degree alone and rational generators give wrong predicates | Retained |
| Nonsplit normalizer convention | p=11: field 121, units 120, normalizer 240; p=2: units 3, normalizer 6 | Index is 2 in both nonsplit cases | Native predicate added |
| Strict thresholds / real division | N=11: μ/6=2 and F♯≈5.828; N=1: μ/6=1/6 and F♯=1 | Integer division or a non-strict cutoff changes the test | Retained |
| Winding orientation and scale | exp(2πiz): W=i/(2π), 2πiW=−1; reversed path gives +1 | Scalar and orientation pinned | Reused in all comparisons |
| §1.1 localTerms, exponent zero | p=0,1,2,4 and e=0 all give (1,1,1,1,1) | Identity branch precedes primality | Retained |
| §1.1 localTerms, junk bases | p=0,1,4 and e=1 all give (0,0,0,0,0) | Nonprime positive-exponent law agrees | Retained |
| §1.1 localTerms, prime table | (2,2)→(1/4,0,−1,1,0); (3,2)→(5/9,1,1,−1,0); (2,3)→(3/8,0,1,0,0) | All five coordinates agree | Retained |
| §1.1 exponent thresholds | (2,4)→(3/8,1,0,0,0); (3,3)→(16/27,0,0,1,0) | Natural subtraction is used only after its branch threshold | Retained |
| §1.2 martinValue / empty product | N=0→0; N=1 gives 1/12−1/2−1/4−1/3+1=0 | Junk level and empty-product value agree with definition | Retained |
| §1.2 arithmetic formula | N=11,13,30,35 gives 1,0,1,3, respectively | Formula agrees with independent genus/oldform convolution | Retained |
| §1.3 newDimension / dimension_comparison | Native trivial-character dimensions at 1,11,13,30,35 are 0,1,0,1,3, matching martinValue | Positive-level comparison has the correct carrier | Own Checks added |
| §1.3 character restriction | At N=13, Γ₁ dimension is 1+84/12−12/2=2, while Γ₀ dimension is 0 | Full Γ₁ newspace is a wrong model | Negative control added |
| §1.4 martin_bound, both directions | N=11:12=12; N=35:36=36; N=30:12<31; N=1:0<2 | Equality holds at the exceptional composite and designated primes, not all levels | Bound named at its statement |
| §§1.2–1.4 general finite probe | For every 1≤N≤1500, expression equals old/new genus convolution; 12g≤N+1; equality iff N=35 or prime N≡11 mod 12 | All 1500 exact comparisons agree | No formula change |
| §§1.5, 1.8 sharpF definition | F♯(1)=1; F♯(11)=3+2√2≈5.828427; F♯(35)=(1+√8)⁶≈3148.634919 | Actual dimension, rather than a supplied number, fixes the exponent | Earlier dimension input |
| §1.8 sharpF lower bound / zero dimension | g⁺(1,2,3,4)=0 gives base⁰=1 in each case; at 11 the value exceeds 1 | No 0⁰ or sign problem, since base>1 | Retained in prose |
| §§1.6, 1.9 sharpG definition | lcm(1,4)=4, lcm(4,4)=4 give G♯=4; at 11, lcm=44 gives 13+4√3≈19.928203 | Correct least-common-multiple level | Earlier inputs |
| §1.9 divisibility API | 4∣4 gives μ(4)=6 and (√1+1)²=4; using 4N=16 gives (√4+1)²=9 | Divisibility specialization and wrong-level control distinguish | Retained |
| §§1.7, 1.10 sharpH / order iff | At 11, H♯=G♯≈19.928>F♯; at 35, H♯=F♯≈3148.635>G♯≈62.856; H♯(1)=H♯(4)=4 | Both max branches; ℓ=7 fails the H test at 11 and ℓ=23 passes both tests | Retained |
| §1.11 majorant comparison | At 11 F_K=9 and G_K=169; at 1 F_K=F♯=1 despite √(1/6)>1/6; μ(lcm(N,4))≥6 | Small-level exception and square-root comparison agree | Moved after thresholds |
| §2.1 norm_bound | K=ℚ, I=(5), x=B=5: 5≤5≤5; x=0 would give 5≤0; unit ideal contracts to (1), not (5) | Nonzero element and prime-above conditions exclude wrong cases | Retained |
| §2.1 all-embedding hypothesis | K=ℚ(√2), ℓ=2, I=(√2), x=√2: embeddings ±√2 have absolute value √2; norm absolute value 2=(√2)² | Both embeddings, not a single selected one, contribute | Retained |
| §2.2 removed-prime gap and exponent | p=2: p+1−2√p=3−2√2≈0.171573>0; M₀=11 gives exponent 2 and bound 3+2√2≈5.828 | Norm element cannot vanish; primes ℓ≥7 excluded in this instance | Orbit-size supplier added |
| §3.1 rationality_of_small_prime_coefficients | N=11 gives μ/6=2, so only prime 2 is tested; a₀,…,a₄=0,1,−2,−1,2 and a₄=(−2)²−2=2 | Bound, normalization and n=0 conclusion agree | Headline added |
| §3.1 empty small-prime test | N=1 gives dimension 0 and no normalized form with a₁=1 | Empty test produces no fictitious newform | Retained |
| §§2.2, 3.1–3.2 Galois orbit input | In ℚ(√2), √2 and −√2 are two distinct coefficient values; rational level-11 form has one value and orbit size 1 | Degree 2 requires two occurring eigensystems; integrality alone does not provide them | 8G imported |
| §3.2 small-coefficient proof | At N=11, q=2<ℓ=7; F♯≈5.828>μ/6=2. At q∣N, coefficients 0,1,−1 are all integers | The Frobenius prime differs from ℓ; bad coefficients are separately integral | Missing proof restrictions stated |
| §3.3 exact-conductor realization | Degree d=1 at level 11 gives conductor 11¹=11; d=2 would give 11²=121; level 1 has dimension 0 | Rationality is essential for the elliptic quotient | Split quotient/residual/conductor inputs |
| §4.1 filters, p=2 | (2,0,3)→(1−3X+2X²,1); (2,1,3)→(1−3X,1); (2,2,0)→(1,1) | Three 2-adic branches differ | Retained |
| §4.1 filters, odd/junk branch | (3,0,a)→(1,1); (3,1,−1)→(1,1−5X); (3,2,0)→(1,1−4X+3X²) | Three complementary branches agree with source | Retained |
| §4.1 constants and base change | Over ℤ both constants are 1; modulo 2, 1−3X+2X² becomes 1+X; in the zero ring 1=0 | Ring-homomorphism API includes small characteristic and the zero ring | Retained |
| §4.1 operator direction | R₂(q+2q²)=q²+2q⁴; R₂²(q+2q²)=q⁴+2q⁸ | X² represents R₄, not twice R₂ | Retained |
| §4.2 integral_sturm_congruence, weight zero | k=0,N=1 bound 0; constant 1 has a₀=1∉(2); zero form has a₀=0∈(2) | Constant coefficient must be tested | General headline added |
| §4.2 positive-weight boundary | Δ at k=12,N=1 has a₀=0,a₁=1; 12·1≤12 is true and 1∉(2) | Testing only coefficient zero would fail | Check added |
| §4.2 arbitrary ideals / difference form | In ℤ, 6∈(6), 1∉(6); every integer lies in (1), while only 0 lies in (0). a_n(f−g)=a_n(f)−a_n(g) | Composite, unit and zero ideals and both-form formulation agree | Weight/ideal restriction removed |
| §4.3 finite mod-four recognition | At N=11 the cutoff is μ(44)/6=12 and eligible primes are 3,5,7; the bad prime 11 has a₁₁=1, giving (11+1)(1−1)=0 mod 4 | Both filtered-form conditions are accounted for | General congruence input precedes use |
| §4.4 trace transfer | At N=11, 4√7≈10.583005<G♯≈19.928203; the removed-prime bound (√7+1)²≈13.291503<G♯ | Both good-trace and removed-prime gaps fit the threshold | Check attached to transfer |
| §4.5 matrix selection | All 24 admissible matrices modulo 4 generate 86 constrained subgroups including the trivial group; 19 contain an odd upper-right entry, and all 19 have lower-left entries 0 | Exact subgroup calculation agrees with the selection statement | Reordered before repair |
| §4.5 closure negative control | g=[[1,1],[0,1]], h=[[1,0],[2,1]] have det(1−g)=det(1−h)=0; det(1−gh)=2 mod 4 | Individual element conditions without subgroup closure fail | Check added |
| §4.5 Chebotarev use | S₃ transpositions:3/6=1/2; 3-cycles:2/6=1/3 | Both conjugacy classes occur with positive density | Exact supplier added |
| §4.6 two-isogeny repair | Identity:degree 1, kernel order 1; quotient by C₂:degree 2, kernel order 2; odd ℓ has gcd(2,ℓ)=1, whereas gcd(2,2)=2 | Odd torsion transport, not 2-torsion invariance | Check moved to repair |
| §4.7 full-two realization | At N=11, ℓ=23 exceeds H♯≈19.928 and both F♯ and G♯; ℓ=7 exceeds only F♯ | Maximum supplies exactly both strict conditions | Inputs now earlier |
| §4.8 local level adapter | Good ℓ gives coefficient-prime exponents 0/0; multiplicative v_ℓΔ=ℓ gives deletion/residual 0/0; additive ℓ gives positive/0 | Additive coefficient primes obstruct equality | Explicit local contracts |
| §5.1 GeometricTorsion | n=1:one point; n=2:four points over ℚ̄; n=0:every point satisfies 0P=0 | Neither rational torsion nor a universal rank-two claim is substituted | Checks retained |
| §5.1 torsionModule | For P_i=(ζⁱα,0), 2P_i=0; 3 mod 2=1 gives P_i and 0 mod 2 gives 0; killed-by-one group has one point | Actual integer action modulo n | Scalar Checks added |
| §5.1 torsionRepresentation | σP₀=P₁, τP₁=P₂; (στ)P₀=P₁, (τσ)P₀=P₂; identity sends P₀ to P₀ | Trivial and reversed actions fail | Noncommuting witness added |
| §5.1 FullRationalTwo | y²=x³−x has rational killed-by-two cardinality 4; y²=x³−2x has 2; y²=x³+x+1 has 1 | Predicate values true,false,false | Native definition precedes consumers |
| §5.1 RationalTwo | The same curves have respectively 3,1,0 nonzero rational two-points | Predicate values true,true,false; full implies rational | Retained |
| §5.1 isomorphism API | (x,y)↦(4x,8y) maps y²=x³−x to y²=x³−16x, taking roots −1,0,1 to −4,0,4 | Both rationality predicates retain cardinality 4 | Retained |
| §5.2 cyclic exclusions | 4·5=20,4·7=28,2·11=22 absent from degree list; 4·3=12 and 2·7=14 present | Correct two ranges and their lower boundaries | Atomic degree input |
| §5.3 coprime cyclic kernels | C₂×C₁₁ has order/exponent 22; C₄×C₅ has order/exponent 20; C₂²×C₅ has order 20 but exponent 10 | Genuine cyclic-four construction is necessary | Retained |
| §5.3 dual-kernel test | For distinct T,T′ of order 2, a point R mapping under the dual to P′∉T is not killed by 2; the composite kernel has order 4, so R has order 4 | Kernel is C₄ rather than C₂² | Source route retained |
| §5.4 full_two_irreducible | ℓ=5 would force degree 20; ℓ=7 degree 28; both excluded. At ℓ=3 degree 12 is allowed | Complete ℓ≥5 range agrees | Headline remains unchanged |
| §5.5 rational_two_irreducible | ℓ=11 would force degree 22, excluded; ℓ=7 gives allowed degree 14 | Range cannot be lowered uniformly to 7 | Headline remains unchanged |
| §§5.4–5.5 absolute upgrade | At ℓ=5 complex conjugation has eigenvalues 1,4, distinct; in a quadratic-field multiplication model an involution has eigenvalues both 1 or both −1 | Irreducible non-absolute field-multiplication image contradicts oddness | Two oddness contracts |
| §6.1 NonCM | At j=1728 the geometric automorphism (x,y)↦(−x,iy) has order 4; integer-scalar automorphisms only ±1. At j=0 the geometric automorphism has order 3 | Both CM cases fail NonCM | Native predicates moved earlier |
| §6.1 geometric versus rational endomorphisms | i∉ℚ but i∈ℚ̄; j(11a1)=−122023936/161051 is nonintegral | Rational endomorphisms alone would misclassify CM; nonintegral j excludes CM | Retained |
| §6.1 HasCyclicIsogeny | Identity:degree/kernel 1/1, cyclic; rational two-quotient:2/2, cyclic; [2]:degree 4, kernel order 4 and exponent 2 | Identity is allowed by definition but excluded by final n>1 | Retained |
| §6.1 Cartan field predicate | In F₁₁[u]/(u²−2), multiplication matrices [[a,2b],[b,a]] form a field of size 121; units=120, normalizer=240 | Positive instance normalizes the required field | Real-bodied predicate added |
| §6.1 Cartan wrong models | Full GL₂(F₁₁):13200>240; scalar subring:11≠121; diagonal ring:121 elements but diag(1,0)diag(0,1)=0 | Full image, smaller field and split algebra fail the respective laws | Three Checks added |
| §6.1 split-normalizer alternative | Split normalizer at 11 has order 200 and 200∤240 | It cannot normalize another quadratic field either | Corrected discrimination |
| §6.1 cyclic characterization | Generator of order 120 cannot have order dividing 10 or 110; its degree-two minimal polynomial is irreducible. Field units have order 120 | Both characterizations determine the same nonsplit Cartan | Equivalence explained |
| §6.1 conjugation direction | ρ(σ)ρ(σ⁻¹)=1; applying both inclusions gives ρ(σ)Cρ(σ⁻¹)=C | One-way membership law implies normalization, not a larger semigroup condition | API stated |
| §6.2 potential good reduction | At p=11, local p inertia would require 10∣2, false; q=23 gives q²=1 mod 11; q=2 gives q²=4≠1 | Potentially multiplicative primes have exactly the stated restriction | Native convention reused |
| §6.3 exact divisor | r=5,p=11:rp²=605, gcd(121,5)=1 and (√121)⁰=1; r=p=5:gcd(25,5)=5 | Operator import retains exact-divisor hypothesis and normalization | Duplicate construction deleted |
| §6.4 old/new correspondence | r=1 gives dim J₀(r)=0; r=11 gives dim J₀(r)=1. At r=11,p=17, old pull-push is a positive-degree multiple of a nonzero pullback | General new-to-new statement does not imply old vanishing in full target | Qualification retained beside correspondence |
| §6.5 winding period, two terms | Coefficients 1,2 give W=i/(2π)+2i/(4π)=i/π and normalized period −2; coefficients 1,−2 give W=0 and period 0 | Frequency division and cancellation both matter | Period target separated |
| §6.5 winding boundary | r=2,p=11:D has order 11≠1; at p=3 its order is 1 and PSL₂(F₃)≃A₄ has quotient C₃ | Nonzero boundary requires the stated prime range | Exact perfectness/cusp inputs added |
| §6.6 nonzero rank-zero quotient | dim A≥1 but rank A(ℚ)=0; the zero quotient has dim 0, rank 0 and zero differentials | Rank zero alone does not ensure the needed nonzero quotient | Nonvanishing now earlier |
| §6.7 coefficient support | q=23,r=5:level-r weight-two dimension 0, so the descended differential equals 0; zero original differential has every a_n=0 | Supports the stated descent test without inventing a positive-dimensional lower space | Explicit model/comparison inputs |
| §6.7 cotangent lattice reduction | For q=23,e=1:1<22; ranks in 0→O→O²→O→0 are 1,2,1 and remain 1,2,1 modulo q. For q=2,e=1:1<1 is false | Free cokernel preserves injection only under the theorem's valid hypotheses | Exact cotangent gap |
| §6.7 zero-map control | Zero quotient has cotangent dimension 0; cusp cotangent has dimension 1; image rank 0<1 | It cannot provide a formal immersion | Retained |
| §6.8 formal immersion hypotheses | p=11 first q=23≡1; p=17 first q=67≡−1; bounds 21 and 33 exceed 13, hence q∤rp in all five cases | Smooth good local model and e=1<q−1 apply | Exact preceding comparisons |
| §6.8 cusp-torsion descent | In C₆ with generator u, 2u has order 3 and 3·2u=0; generally mσu=mu and hmu=0 | Both the cusp-torsion multiplier and rational-point annihilator are needed | Contract named and arithmetic shown |
| §6.9 denominator exclusion | At p=11 a denominator prime q=23 would give torsion u(P) reducing to 0; injectivity gives u(P)=0, same value as cusp; formal immersion then forces the same section | Contradicts noncuspidality; q=2 fails the cusp congruence | Inputs retained explicitly |
| §6.10 nonsplit_of_not_surjective | p=41 absent from non-CM prime-isogeny list; split quotient X₀⁺(41²) admits no rational noncuspidal non-CM point; exceptional bound 41>17 holds | Borel, split and exceptional alternatives are excluded | Native headline added |
| §6.10 determinant alternative | |SL₂(F₄₁)|·40=41·40²·42=2755200=|GL₂(F₄₁)| | Containing SL₂ with full determinant cannot be proper | Explicit proof input |
| §6.11 lemos_integral_j | E:y²=x³−x,r=2,p=11 has j=1728∈ℤ and nonsplit containment; 11a1 has j=−122023936/161051∉ℤ | CM positive example is included; nonintegral negative example cannot meet all hypotheses | Full containment headline added |
| §6.11 prime ranges | p=11,17 are outside {2,3,5,7,13}; p=13 is inside; 37<37 is false | Integrality does not acquire the proper-image theorem's stronger range | Corrected docstring |
| §6.12 numerator API | r=2,3,5,7,13 give degrees 3,4,6,8,14; leading coefficient 1; constants 4096,729,125,49,13. At r=11 polynomial 0, degree 0, constant 0 | No prime-level formula is asserted at junk r | Retained |
| §6.13 integral-parameter theorem | f=(T+16)³:t=−16→0, t=8→1728; both divide 4096. For t=1/2 value is 35937/4, not integral | Positive and negative divisors and a nonintegral parameter discriminate | Before finite sets |
| §6.13 degree and denominator controls | f=T+1,t=1/2 gives 3∈ℤ but t∉ℤ; t=0 has total quotient 0 but no modular interpretation | Degree≥2 and nonzero t are essential | Retained |
| §6.14 finite-set membership/cardinality | Signed divisor counts 26,14,8,6,4 yield distinct-value counts 25,13,8,6,4; at r=11 no witnesses and empty set | Exact quotient and duplicate removal agree in both membership directions | Earlier definitions |
| §6.14 finite-set values | r=2 includes 0,1728; r=5 includes 64; r=13 gives {−39091613782464,576,2101248,2045023375454208} | Values match all four displayed factorized integers | Recomputed |
| §6.15 fixed modular coordinate | r=2,t=8 gives 1728; u=2t=16 gives 2048 under the wrong unrescaled formula, but correct j remains 1728 | A generic genus-zero coordinate does not certify these numerators | Exact coordinate gap |
| §6.15 exhaustive j-tables | Level 11 gives −24729001,−32768,−121; level 17 gives −297756989/2,−882216989/131072; level 37 gives −162677523113838677,−9317 | Seven rational values, six after CM exclusion; table includes both fractions | Exact table gap |
| §6.16 twist invariance | At p=5, a=2 has a²=4≠1; χ²=1 leaves det unchanged; SL₂ plus 4 determinant values has order 120·4=480=|GL₂(F₅)| | Perfectness and determinant prove both implications; twisting twice is identity | Exact library input |
| §6.16 small-field boundary | In F₃ the nonzero elements 1,2 both square to 1 | Pinned perfectness witness is unavailable, as required by p≥5 | Check added |
| §6.17 finite-j image theorem | j=1728 belongs to integral set at level 2, but at p=43 its CM image lies in a normalizer of order 2(43²−1)=3696<|GL₂(F₄₃)|=3337488 | CM must be excluded from the entire union | Hypothesis clarified |
| §6.18 lemos_surjectivity | Nontrivial n=14 has prime divisors 2,7 in the non-CM list; n=1 fails 1<n; p=37 fails 37<p; j=0,1728 fail NonCM | All boundary exclusions agree with the final native theorem | Final name and inputs retained |

## Supplier-contract probes

| Statement | Instances tried; values computed on the two sides | Result | Change |
| --- | --- | --- | --- |
| elliptic-modularity | Level-11 rational form has a₂=−2, equal to the elliptic trace; level 1 has weight-two dimension 0 | Exact conductor and all good traces are required | Existing gap retained |
| optimized-weight-two-lift | ℓ=5 satisfies ℓ≥5; ℓ=3 does not; conductor N(E[ℓ]) has v_ℓ=0 | Optimized level cannot be arbitrary deletion level | Existing gap retained |
| deletion-level-lowering | At q∥M with ord_qΔ=ℓ, M/M₀ has q-exponent 1; unramified residual trace is ±(q+1), not a good-reduction Hasse trace | Removed-prime and good-prime congruences remain distinct | Existing gap retained |
| elliptic-conductor-and-weight | At additive ℓ=11, v₁₁(M)>0 but v₁₁(N(E[11]))=0 | Three native invariants must be distinguished | Split definition contract |
| residual-conductor-away-from-ell | q≠5 multiplicative with ord_qΔ=5: arithmetic exponent 1, residual 0; with ord_qΔ=1:both 1 | Exact exception stated | Split comparison contract |
| weight-two-reduction-alternative | ℓ=11, weight 2: good gives v₁₁(M)=0, multiplicative gives 1 with 11∣ord₁₁Δ; additive exponent≥2 is excluded | Not asserted for arbitrary additive torsion or ℓ=5,7 | Split local contract |
| complex-conjugation-on-torsion | At 5 eigenvalues 1,4 multiply to 4=−1; at 2 eigenvalues 1,1 coincide | Oddness hypothesis matters | Split contract |
| odd-irreducible-absolutely-irreducible | In a quadratic field, solutions of x²=1 for odd ℓ are ±1 and act as scalar ±I; diag(1,−1) has distinct eigenvalues | Nonabsolute irreducible quadratic-field model is excluded | Split contract |
| dickson-classification | At p=11 nonsplit normalizer has 240 elements and does not contain SL₂ of order 1320 | Cartan-normalizer alternative differs from containing SL₂ | Exact classification |
| serre-inertia-exceptional-bound | p=19 gives 19>17; p=17 gives false strict inequality; all final p>37 satisfy it | Stronger source range preserved | Exact exceptional exclusion |
| newform-residual-representation | q=5,c₅=−2 gives T²+2T+5; modulo 7 constant term is 5, trace is 5 | Arithmetic Frobenius normalization preserved | Residual theorem split |
| modular-abelian-conductor | N=11,d=1→11; d=2→121 | Coefficient degree changes conductor | Conductor theorem split |
| coefficient-bound | y²=x³−x at 5 gives |a₅|=2≤2√5≈4.472136 | Good-prime all-embedding bound, not a bad-prime estimate | Existing gap retained |
| mixed-modular-curves | r=5,p=11 has gcd 1; q=23 has gcd(q,6rp)=1; r=p=5 has gcd 5 | Both level coprimality and smooth-model hypotheses visible | Geometry contract split |
| mixed-modular-jacobians | r=1 old Jacobian dimension 0; r=11 dimension 1; prime-to-p Hecke index n=2 at p=11 has gcd 1 | General Jacobian functor alone supplies no modular pull-push map | Hecke/Jacobian contract split |
| newform-quotient | Rational f at level 11 gives coefficient-field degree 1 and an elliptic quotient of dimension 1; degree 2 gives dimension 2 instead | Rational primitive hypothesis is needed | Quotient contract split |
| five-level-j-coordinates | f₂(8)/8=1728 but f₂(16)/16=2048; coordinate rescaling changes the expression | Fixed coordinate normalization required | New gap |
| rational-isogeny-j-tables | Full table cardinalities at 11,17,37 are 3,2,2; non-CM cardinalities 2,2,2 | Classification is stronger than the existence of a j map | New gap |
| split-cartan-rational-points | p=41,m=2 gives allowed exclusion; p=13 fails p≠13 and m=1 fails m>1 | Exact range is not silently enlarged | New gap |
| chen-isogeny | r=5,p=11 gives exact divisor 121 of 605; r=11 old dimension 1 prevents full-target vanishing | General p-new to p-new form retained | Existing contract retained |
| integral-winding-comparison | One term gives normalized period −1; two terms 1,2 give −2; q=23,e=1 satisfies 1<22 | Pullback and saturation carry explicit ramification and normalization | Precision repair |
| cuspidal-divisor-torsion | At level 1 a degree-zero cusp divisor is 0 of order 1; in C₆, m=2,h=3 gives hmu=6u=0 | Torsion descent needs the cusp theorem separately from rank zero | New gap |
| modular-rank-zero | A nonzero quotient can have dimension 1 or 2 and rank 0; zero quotient has dimension 0 and rank 0 | Rank zero in all coefficient degrees does not supply nonvanishing | Existing gap retained |
| cyclic-isogeny-degrees | Degrees 12,14 in the list; 20,22,28 absent | Composite theorem is needed, independently of prime theorem | All-degree contract separated |
| noncm-prime-isogeny-degrees | Prime 37 included; primes 41,43 absent in non-CM list; 43 remains in unrestricted list | CM and non-CM lists are not interchangeable | Refinement separated |
| neron-torsion-specialization | q=23,e=1:1<22; q=2,e=1:1<1 false | Full torsion, including q-primary torsion, uses the strict hypothesis | Existing gap retained |
| optimal-quotient-cotangents | q=23 reduced ranks 1→2→1 remain exact; q=2 counterexample has reduced injection rank 0 | Map and ramification restriction are indispensable | New exact contract |

# Sources, pins and ownership

All mathematical source text used was read in the supplied legal cache. No additional source was fetched or copied into the repository. The relevant locator groups are:

| Source | Locators read and used |
| --- | --- |
| Kraus1997 | Lines 210–212 (weight-two local alternative); 240, 270, 279 (thresholds); 249, 284 (realizations); 295–305 (finite-prime rationality); 321–348 (bad primes, q≠ℓ and coefficient-field degree); 397–441 (matrix and isogeny argument); 1060–1081 (all-weight/all-ideal Sturm); 1082–1108 (filtered criterion and elliptic corollary); 1149–1154 (filters). |
| Martin2003 | Lines 69–90 (dimension expression and local factors); 113–114 (sharp bound and equality); 747–846 (local estimates and bound proof). The preprint v1 numbering is retained. |
| BS2020 | Lines 165–207 (deletion level and norm bound); 221–239 (numerical majorants); 287–308 and 331–343 (two-torsion applications). |
| Mazur1978 | Lines 35–40 (prime isogenies), 68–75 (exceptional images excluded for p>17), 356–383 (cotangent exactness and its characteristic-two failure), 992–1061 (non-CM isogeny input). |
| Lemos2017 | Lines 136–184 (containment integrality and local reduction), 197–202 (rational j tables), 223–226 (proper-image theorem), 231–260 (fixed numerators and integral parameters), 325–351 (Chen/old-part comparison), 355–388 (five-level quotient and formal immersion). Locators use v2. |
| DarmonMerel2001 | Lines 506–538 (old image, boundary and order-p divisor); 590–685 (winding quotient, normalized differential and nonvanishing); 725–771 (cotangent argument, cusp torsion and specialization). Locators use the author copy. |
| BPR2013 | Lines 55–56, Theorem 1.1, p. 2 (split-Cartan rational points). |
| Kenku1982 | pp. 199–201; settled uncertified, cited by locator only. No claim of reading its paywalled text. |

The nearby source error Lemos2017 line 194 is not used: the asserted rank-zero Jacobian at level 37 is unnecessary for importing the independently specified exhaustive j-table. The boundary probes do not reproduce its proof. Periods use the explicitly computed orientation, not the sign in the source's raw-integral shorthand.

The content main revision is 82e5289b. The pinned revisions are Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Pinned declaration checks include:

| Declaration/object | Pinned file and locator; mathematical boundary |
| --- | --- |
| WeierstrassCurve.j | Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean:388; its body is inverse discriminant times c₄³ on the elliptic carrier. The headline retains IsElliptic. |
| TauCeti.cuspFormsNew | TauCeti/NumberTheory/ModularForms/Newforms/Basic.lean:202; it is the Γ₁ newspace, so the trivial-character intersection is retained. |
| cuspFormCharSpace / modFormCharSpace | TauCeti/NumberTheory/ModularForms/DiamondOperators.lean:279,315; these are simultaneous diamond eigenspaces, not arbitrary functions. |
| HeckeRing.GL2.Newform | TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:104; membership in the newspace and coefficient-one normalization extend the good-Hecke eigenform carrier. Bad-prime arithmetic is consumed separately. |
| UpperHalfPlane.qExpansion | Mathlib/NumberTheory/ModularForms/QExpansion.lean:171; the new headline coefficient sequence is tied to this expansion at every n. |
| WeierstrassCurve.torsionGaloisAction | TauCeti/AlgebraicGeometry/EllipticCurve/Affine/Point/Galois.lean:64; the coordinate comparison is at line 85. It restricts the actual point action, with σ after τ for στ. |
| AddSubgroup.torsionBy / torsionBy.zmodModule | Mathlib/Algebra/Module/Torsion/Basic.lean:972,1010; killed-by-n points and their integer action modulo n. This definition does not assert finite rank when n=0. |
| AddMonoidHom.toZModLinearMap | Mathlib/Algebra/Module/ZMod.lean:81; the adapter preserves the additive function. |
| Representation.IsIrreducible | Mathlib/RepresentationTheory/Irreducible.lean:29; the simple-subrepresentation condition includes nontriviality. |
| Isogeny degree / Hom identity | TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Degree.lean:99 and Hom/Basic.lean:325; the latter provides the monoid-with-zero identity used by NonCM; Hom/Add supplies integer addition. Kernel and base-change definitions were read in Kernel and BaseChange/Basic. |
| Algebra.norm_eq_prod_embeddings / AlgHom.card | Mathlib/RingTheory/Norm/Transitivity.lean:261 and FieldTheory/PrimitiveElement.lean:360; finite separability is supplied by NumberField, and all embeddings are used. |
| Matrix.SL2.commutator_eq_top | Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean:804; hypotheses are a≠0 and a²≠1, witnessed at 5 by a=2. |
| CoefficientField / numberField_CoefficientField | TauCeti/NumberTheory/ModularForms/Newforms/Fields.lean:48 and NumberField.lean:157; the number-field theorem retains weight at least two. |
| Ideal.ramificationGroup / finite locally free group scheme category | TauCeti/RingTheory/Ideal/RamificationGroup.lean and TauCeti/AlgebraicGeometry/AffineGroupScheme/CartierDuality/FiniteLocallyFree.lean; these provide the generic carriers, not the missing elliptic conductor/weight comparisons. |

Cross-roadmap locators were resolved in the actual main copies: ModularForms Layers 3, 4, 6, 8, 8G and 10; EllipticCurves Layers 1–5 including 4.5b; ModularCurves Layers 1A and 1D; StableReduction Layer 5; JacobianChallenge Layers D–F; Chebotarev Layer 10. ComputationalNumberTheory §3.4 and the downstream ErdosProgressionPowers §1.1 were read at the supplied heads. The three shape references read before editing were ModularForms, Chebotarev and ComputationalNumberTheory.

Ownership was searched by mathematical object through roadmaps grep, main/Completed, board packages and all 33 specifically supplied open-head folders, including their Lean files. The HeegnerPointEulerSystems §6.9 statement is an ordinary residual-hypothesis rank-zero formula over a quadratic field, not the unconditional all-degree rational rank-zero input required here; the EulerSystemsAndKolyvaginSystems gap remains. Searches against open heads whose files were not supplied were not independently checked; index matches were treated only as leads and no such head became a claimed supplier section. KatoEulerSystems is not imported through an unprovided head.

This package owns the effective comparisons extending EllipticCurveModularity, the arbitrary-level/ideal congruence extension beyond ComputationalNumberTheory §3.4, and the special five-level arguments and uniform-image end theorems. It does not reclaim general modular curves, rational-point classifications, Atkin–Lehner operators, cusp torsion or Néron cotangent exactness. The new Cartan predicate merely specializes native torsion endomorphisms to make the two existing headlines statable; it builds no general Cartan carrier. No declaration was given another roadmap's fully qualified name.

# Maintainer consequences

All sixteen original Lean names remain. Added names are rationality_of_small_prime_coefficients, integral_sturm_congruence, ImageInNonsplitCartanNormalizer, nonsplit_of_not_surjective and lemos_integral_j. Internal subsection numbers changed in Layers 1, 4, 5 and 6; the supply table above gives the resulting locators. Any outside prose citing old subsection numbers needs to follow the target by its title. No external file was changed.

Earlier suppliers have explicit missing requirements: the split-Cartan rational-point exclusion, cusp-divisor torsion, fixed genus-zero coordinates, exhaustive rational j-tables and optimal-quotient cotangents. These are gap declarations, not invented implemented supplier theorems. Their delivery and any edits to their owners remain outside this package. The previous human ownership decision involving the later ErdosProgressionPowers roadmap was not reopened. No merge-order decision is needed from this repair's dependency output.
