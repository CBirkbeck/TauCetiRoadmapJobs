# ArithmeticKTheory human-review response

## H01 (CBirkbeck) — applied

The universal PID connectivity claim and the manuscript-based rank-four/Bökstedt argument are replaced by the published component complex for every PID, integer rank-subquotient connectivity, Soulé’s finite-2-group Steinberg input and the odd-primary rank differential at `TauCetiRoadmap/ArithmeticKTheory/README.md:3580`; the dyadic vanishing uses §6.4’s independent 2-rank formula, and References now distinguishes the published version (rognes-k4 line 294, line 321, line 330 and line 342; rognes-weibel line 2308). The non-Euclidean PID negative control is retained explicitly: Hutchinson’s disconnected graph gives H₁(D(R²))≠0 through the common-basis comparison (hutchinson-ge2 line 370 and line 474; miller-patzt-wilson line 60, line 1811 and line 1886).

## H02 (CBirkbeck) — applied differently

The implicit finite CW conclusion from ALS.2.4 is replaced by arithmeticBordificationFiniteCW at `TauCetiRoadmap/ArithmeticKTheory/README.md:886`: smooth rounding and a collar supply a proper function 1/t, relative Morse approximation leaves the end critical-free, and MorseTheory M1–M3 supplies a finite cell model before projectiveArithmeticDuality. This keeps unconditional Steinberg and Quillen finiteness, uses ALS.2.2–ALS.2.3/ALS.5a.1 rather than its conditional triangulation theorem, and leaves general triangulation with GeometricTopology’s existing owner (putman-studenmund line 301 and line 335).

## H03 (CBirkbeck) — applied

The unsigned identification is replaced by ord_v(u)=−Multiplicative.toAdd(Set.unitValuation S F u v), transported through Set.unitEquivUnitsInteger and the finite-support interface, at `TauCetiRoadmap/ArithmeticKTheory/README.md:664`; the comparison square now includes negation and pairs it with inverse ideal classes. At the pins the native uniformizer exponent is −1, so p and p⁻¹ have positive orders 1 and −1, while ±1 has order zero (`TauCeti/RingTheory/DedekindDomain/SInteger/Unit.lean:104`; `Mathlib/RingTheory/DedekindDomain/AdicValuation.lean:188`).

## H04 (CBirkbeck) — applied

“Hyperbolic sum” is replaced by “metabolic orthogonal sum” at `TauCetiRoadmap/ArithmeticKTheory/README.md:1278`. The added witness computes ℤ(1,1) as a primitive Lagrangian of diag(1,−1), while its self-pairing 1 on (1,0) excludes an integral isometry with the hyperbolic plane, whose self-pairings are 2ab.

## H05 (CBirkbeck) — applied

The nonblocking ownership suggestion is made explicit in the supplier contract at `TauCetiRoadmap/ArithmeticKTheory/README.md:362` and the application at `TauCetiRoadmap/ArithmeticKTheory/README.md:1607`: periodicEtaleK, etaleKComparison, etaleDescentFiltration and quillenLichtenbaumField come from KTheoryFiniteLocalFields §6.5a. The arithmetic target extends that supplied field filtration to S-integer bases, preserving the existing ownership boundary and coefficient hypotheses.

## Evidence and ownership

The four numbered corrections are H01–H04; H05 records the additional explicit-export suggestion in the review’s ownership paragraph. The comment contains no unanswered question. The “checked and found sound” observations introduce no additional requested corrections.

The main checkout and origin/main are bec24dbffe94c53eb5b648bfa4179472febd5c4d. Supplier contracts were resolved against that main or the indexed heads of new roadmap pull requests, including ArithmeticLocallySymmetricSpaces at 7dca7ea, KTheoryLowDegrees at d7c04da, KTheoryFiniteLocalFields at afe02e8 and CyclotomicClassGroupsAndStickelberger at 9c9a49a. MorseTheory, GeometricTopology, ClassifyingSpaces, AlgebraicTopology and GeneralizedCohomology were read on main; revisions of existing roadmaps were not substituted for main. HomotopySpheres is a new roadmap at fb7c47e: Stage 9, item 2 is the owner of the fourth stable stem used in the replacement proof. Its computation is consumed, not planned again.

Object searches covered the main roadmaps, the board’s packages, the indexed open roadmap heads and all 32 supplied sibling roadmap folders. General Waldhausen/S constructions remain with GeneralAlgebraicKTheory and StableHomotopyKTheory; the arithmetic rank/component filtration and integer Steinberg homology have no separate owner in those searches and remain here. The finite CW target is an arithmetic application of the existing Morse and collar theories; no generic triangulation or Morse theorem was duplicated, no supplier request was created, and no ownership was moved from a later roadmap. There is no new Lean declaration or fully qualified name collision.

The source key rognes-k4 is reused for the published author-hosted PDF, whose numbering and argument differ from the 1993 manuscript. The legal arXiv copies for hutchinson-ge2 (v5) and miller-patzt-wilson (v2) were read at the cited locators. The updated manifest is staged in scratch as sources.toml because the package manifest is outside the two permitted repository edits; no source text was copied into the repository or report, and no reference request remains outstanding. The separate Soulé paper is not relied on as an independently read source: the input is restated exactly as used in the published Rognes proof at rognes-k4 line 330.

| Source locator | Mathematical evidence |
| --- | --- |
| rognes-k4 line 200 | W_c is free of rank (c−1)! in degree 2c−2, with the symmetric-group action retained. |
| rognes-k4 line 294 and line 303 | The component complex and group-homology spectral sequence hold for PIDs without the rejected stable-building connectivity claim. |
| rognes-k4 line 316 and line 321 | Integer Steinberg coinvariants vanish; the resulting connectivity concerns rank subquotients. |
| rognes-k4 line 330 | The SL₄ Steinberg homology is zero modulo finite 2-groups and removes the odd degree-four term. |
| rognes-k4 line 339 and line 342 | The rank differential kills the two order-three entries; the spectrum homology computation follows. |
| rognes-k4 line 347 | Fourth-stem vanishing supplies the odd-primary K₄ conclusion separately from dyadic input. |
| rognes-weibel line 2283 and line 2308 | The positive-degree real dyadic table has s+u−1 cyclic factors in degree four. |
| hutchinson-ge2 line 370 and line 474 | Graph components are GE₂ cosets; the stated imaginary quadratic PID is not GE₂. |
| miller-patzt-wilson line 60, line 1811 and line 1886 | Stable rank cofibers and the iterated-building/common-basis comparisons identify the rank-two reduced homology obstruction. |
| putman-studenmund line 301 and line 335 | The arithmetic bordification is smooth, contractible and cocompact, and a free finite cellular quotient supplies the required integral resolution. |

The native definitions were checked at Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. IsDedekindDomain includes IsDomain (`Mathlib/RingTheory/DedekindDomain/Basic.lean:149`); Set.integer imposes valuation ≤1 outside S and Set.unit equality to 1 there (`Mathlib/RingTheory/DedekindDomain/SInteger.lean:65`, `:108`), so neither imposes a finite-S condition. The unit equivalence has the direction S.unit F→(S.integer F)ˣ at `:124`; the adapter uses its inverse. SmoothPartitionOfUnity.exists_isSubordinate requires the Hausdorff and sigma-compact manifold hypotheses at `Mathlib/Geometry/Manifold/PartitionOfUnity.lean:550`, satisfied by the second-countable arithmetic quotient manifolds.

## Computed adversarial pass

The table records each added or changed mathematical statement and its dependent interfaces, including all four retained Lean declarations; computations are diagnostics, while the source locators above certify the deep inputs. Unchanged arithmetic tables and the Gaussian/golden presentation data were searched for the repaired patterns, not represented as newly recomputed from scratch.

| Statement | Instances tried | Computed values on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| Positive K₁ order convention | p=2,3,5 and p⁻¹ | Native exponents −1,1; negation gives 1,−1 | Compatible | Explicit negation in Conventions and §2.2 |
| Unit-carrier transport | u=p and u=−1 in ℚ, S={p} | u and its image are the same rational elements; orders 1 and 0 | Compatible | Use the inverse of the supplied equivalence |
| Signed valuation homomorphism | p²·p⁻¹=p | 2+(−1)=1; native −2+1=−1 | Additive | Explicit homomorphism and square |
| Finite-support factorization | u=2/3, S={2,3,5} | Positive tuple (1,−1,0); support {2,3} | Finite direct sum | Retain support before product-to-sum conversion |
| S-enlargement | 2/3, {2,3}⊆{2,3,5} | (1,−1) maps to (1,−1,0) | Compatible | Named naturality requirement |
| Unit-valuation kernel | S=∅; units ±1 over ℤ | Codomain 0; both orders 0 | Exact at units | Native kernel reused |
| Inverse class arrow | Formal class c of order three and e_v | Positive generator maps to c⁻¹=c²; native −e_v maps to the same c⁻¹ | Square commutes | Sign on lattice and inverse on classes both explicit |
| Exactness at valuation lattice | ℚ, S={p} | {±pⁿ}→ℤ has image ℤ, class group 0 | Exact | Preserve supplied kernel and quotient |
| K₂ boundary convention retained | ℤ_(5), pairs (5,2),(2,5) | β=2,3; inverse tame symbol=3,2 | Consistent across layers | No K₂ renormalization |
| Arithmetic finite CW target | Rank one, F=ℚ, Γ=1 | Model point: C₀=ℤ, higher chains 0; H₀=ℤ | Finite classifier | New prerequisite before duality |
| Empty-boundary branch | Rank one, real quadratic neat units Γ≅ℤ | Circle: C₀=C₁=ℤ, d₁=0, H₀=H₁=ℤ | Finite classifier | Compact Morse branch explicit |
| Collar exhaustion | t=1/2,1/8 | f=2,8 and df/dt=−4,−64 | No critical point at the end | Proper function 1/t |
| Properness and large sublevel | a=4 on the fixed collar | f≤4 iff t≥1/4; complement stays away from t=0 | Compact sublevel | a positive and 1/a inside collar |
| Collar deformation | a=4; t=1/8,1/4,1/2 | Endpoints max(t,1/4)=1/4,1/4,1/2; f=4,4,2 | Retracts and fixes sublevel | Explicit deformation formula |
| Relative Morse approximation | Fixed end t≤ε, compact remaining region | End df=−1/t²≠0; end critical count 0 | Only finitely many interior critical points | Consume M3 then M1 |
| Finite cell construction | Interval minimum and circle height model | One 0-cell gives H₀=ℤ; circle 0/1 cells give H₀=H₁=ℤ | Matches compact sublevels | Consume M2 |
| Free lifted resolution | Γ=ℤ, circle universal cover | d₁=g−1; augmentation quotient ℤ; kernel at positive degree 0 | Exact free resolution | Cover-lifting comparison retained |
| Finite-cover law | Twofold circle cover | Two vertices/two edges, d₁ rank 1; H₀=H₁=ℤ | Finite after pullback | Explicit finite-cover API |
| Finite-cover law, nonabelian quotient | S₃ regular cover of a two-loop classifier | 6 vertices,12 edges; d₁ rank 5; H₁ rank 12−5=7 | Cell orbits and cover degree agree | Keep actual lifted action |
| Freeness hypothesis | Point quotient with stabilizer C_p | Quotient has only H₀; H^(2j)(C_p;𝔽_p)=𝔽_p for every j | Negative control | Retain torsion-free/neat requirement |
| Projective duality orientation | F=ℚ, m=2,3; det diag(−1,1,…) | χ^(m−1)=−1,+1; d=1,3 | Sign depends on parity | Finite model supplied independently |
| Untwisted Steinberg finiteness | Rank-one real quadratic Γ=ℤ | St₁=ℤ, twist χ⁰=1; H₀=H₁=ℤ, higher 0 | Integral finite generation | Correct prerequisite chain |
| Finite-index descent | Rank-one ℚ units C₂ with St₁=ℤ | H₀=ℤ, H₁=ℤ/2, H₂=0 | Integral finite generation includes torsion | No inversion of stabilizer orders |
| Stable rank condition | R=0 and R=ℤ | At 0, split R²→R exists with 2>1; over ℤ tensoring with ℚ forbids it | Zero ring excluded | Use published rank condition |
| Rank filtration colimit | ℤ finite projectives | Rank-one projectives free; free K₀=K₀=ℤ | Full arithmetic K-spectrum | General filtration retained |
| Component degree convention | m=1,2,3,4 | Degrees [0], [1,2], [2,3,4], [3,4,5,6] | No truncated subtraction | General PID complex replaces false bound |
| Stable-apartment ranks | c=1,2,3,4 | (c−1)!=1,1,2,6; degrees 0,2,4,6 | Correct degree and rank | Full induced action retained |
| Tensor degree identity | m=4 and c=1,2 | Σ(rank V_j−1)+(2c−2)=3,4=m+c−2 | Correct indexing | Component quotient comparisons explicit |
| General PID negative control | R=ℤ[(1+√−19)/2], m=2 | Graph has at least two components; H̃₀ has a nonzero difference class; H₁(D)≠0 | Old 1-connectivity assertion false | No universal D-connectivity theorem |
| Integer Steinberg coinvariants | m=2, apartment class a | Three-line relation gives a=a+a, hence a=0; swap also gives 2a=0 | H₀ coinvariants 0 | Integer-specific homology input |
| Rank-subquotient connectivity | m=2,4,5 over ℤ | Homology vanishes in degrees ≤1,≤3,≤4 respectively | Applies to homotopy orbits | Distinguish cofiber from stable building |
| SL₄→GL₄ odd comparison | Determinant quotient C₂; trivial or sign module | Higher C₂ homology after inverting 2 is 0; finite 2-group tensor ℤ[1/2]=0 | Odd H₁ term 0 | Soulé input and determinant quotient explicit |
| Rank differential | ℤ/3→ℤ/3, x↦x | Kernel=0, cokernel=0; zero map would leave both ℤ/3 | Discriminating | Actual d₁ required |
| Odd spectrum homology | Degrees 0,1,2,3,4 | ℤ[1/2],0,0,0,0; H₃(K;ℤ)=ℤ/2 becomes 0 | Correct localization of homology | Replace integral manuscript table |
| Sphere-unit comparison | Degree four after inverting 2 | Relative Hurewicz gives surjection 0=π₄S⊗ℤ[1/2]→K₄⊗ℤ[1/2] | Odd group 0 | Published proof with owned sphere input |
| Dyadic rank formula | ℚ, s=1,u=0; n=4 | s+u−1=0; a finite ℤ/4 factor would give rank 1 | Dyadic group 0 | Use §6.4 rather than rank-four connectivity |
| K₄ assembly | Finite rank-zero K₄, all primary parts | Odd part 0 and dyadic part 0 give order 1 | K₄(ℤ)=0 | No Vandiver or zeta premise |
| Localization negative control | ℤ→ℤ[1/2] | K₄ orders 1 and 2²−1=3 | Integral vanishing does not extend to localizations | Keep §8.2 control |
| Metabolic Lagrangian | diag(1,−1), L=ℤ(1,1) | B((1,1),(a,b))=a−b; L⊥=L; primitive quotient ℤ | Metabolic | Correct terminology |
| Integral hyperbolic obstruction | diag(1,−1) and [[0,1],[1,0]] | Self-pairings include 1 in first, only 2ab in second | No integral isometry | Add parity witness |
| Signature normalization | ⟨1⟩,⟨−1⟩ and orthogonal sum | 1,−1,1+(−1)=0 | Signature assertion unchanged | Describe metabolic sum |
| Inverting-two contrast | Over ℤ[1/2], u=(1,1),v=(1/2,−1/2) | B(u,u)=B(v,v)=0, B(u,v)=1; determinant of basis −1 | Hyperbolic after scalar extension | Do not conflate integral and dyadic-inverted forms |
| Golden signature witness retained | ⟨1⟩ and ⟨ε⟩ | (1,1),(1,−1); determinant −2 | Rank 2, index 2 possible | No assertion of surjectivity |
| Field comparison ownership/range | cd_ℓF=2 and n=1,0 | n≥d−1 holds at 1; injective boundary is n=d−2=0 | Same field range | Name supplied exports |
| Field comparison excluded case | F=ℝ,ℓ=2 | H^j(C₂;𝔽₂)=𝔽₂ for every j, so cd₂ is infinite | Real correction still required | Keep §5.4 branch |
| sUnitSubmonoid definition | ℤ, S=∅ or {(2)} | Units {±1} or {±2ⁿ:n≥0} in ℤ; 1 in, 0 out, 3 out for S={(2)} | Native carrier and support agree | Lean type unchanged |
| Localization iff, both directions | M=⟨2⟩, S={(2)}; M={1} with same S | First meets (2), giving ℤ[1/2]; second misses (2), giving ℤ≠ℤ[1/2] | Both directions discriminate | Lean type unchanged |
| Localization iff, total/field cases | R field, S=∅; M containing 0 | First has no height-one conditions and integer ring R; second violates M≤sUnitSubmonoid | Degeneracies accounted for | Lean type unchanged |
| Torsion class-group localization | ℤ[√−5], nonprincipal p=(2,1+√−5) | [p]²=1 and p²=(2); inverting 2 meets p | Does not assume a principal p | Lean type unchanged |
| Infinite-S torsion consequence | ℤ, S all primes | Candidate monoid ℤ∖{0}; localization ℚ | Arbitrary S retained | No finite-S binder introduced |
| Bernoulli headline | (p,k)=(3,1),(3,2),(3,3),(5,5),(7,7) | B_(2k)/k=1/6,−1/60,1/126,1/66,1/6; numerator residues 1,2,1,1,1 | Nondivisibility includes p∣k | Lean type unchanged |
| Bernoulli k=0 exclusion | p=3,k=0, total division | B₀/0=0, numerator 0 divisible by 3 | Would be false without k≥1 | Explicit hk retained |

## Elaborated signatures

A scratch file containing the exact final module and `#check @name` for each of its four declarations elaborated successfully once after the docstring change. Comparison with README §§1.1/7.2 and the supplied pre-edit types found no changed type and no missing binder: the Dedekind, field, algebra and fraction-ring instances remain explicit; the torsion hypothesis remains explicit; the Bernoulli theorem retains primality, oddness, class-number nondivisibility and k≥1. Suggested.lean changes only its explanation that the arithmetic finite CW headline lacks the arithmetic bordification and quotient carriers at the pins; it adds no substitute signature.

## Verification outcomes

`lake build TauCetiRoadmap.ArithmeticKTheory.Suggested` exited 0, with exactly three expected “declaration uses sorry” warnings at `TauCetiRoadmap/ArithmeticKTheory/Suggested.lean:47`, `:53` and `:66`, and no errors. Its exact completion line was:

```text
Build completed successfully (8976 jobs).
```

The scratch signature elaboration exited 0, and the post-commit citation check found no missing cross-roadmap citations or roadmap declaration names. Its external-library lookup was unavailable in that invocation; the actual pin inspection and successful elaboration described above provide that evidence separately.

The dependency check exited 0 with this exact output, and emitted no UPWARD, CYCLE or moved line:

```text
depcheck: 33 roadmaps, 301 edges, 0 problem(s)
```

The first full gate had only dirty=2 for the two authorized uncommitted files; after committing, the required full gate exited 0 with this exact summary:

```text
gate ArithmeticKTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

Commit: 3d10f785ff5a08d0bc10388a62f694325e75507a, “ArithmeticKTheory: review repairs (published K4 proof, finite CW input, signed valuation, metabolic form)”. Only TauCetiRoadmap/ArithmeticKTheory/README.md and TauCetiRoadmap/ArithmeticKTheory/Suggested.lean changed; the worktree is clean. No push, pull-request edit, issue edit or comment was made.
