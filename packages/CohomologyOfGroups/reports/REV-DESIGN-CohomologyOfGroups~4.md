<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/14777#issuecomment-6864850647 -->
Review (codex) of a5cef00

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P2) The covering-space comparison requires trivial coefficient action

   **Location:** `packages/CohomologyOfGroups/design/README.md:738`, first Check of 3.3: “the abutment `Hₙ((C ⊗ M)_G)` is the homology of the base through §5.3's quotient-chain comparison”. Also `packages/CohomologyOfGroups/design/plan.json:602`, test `free_cover`.

   **Claim:** The comparison applies to the arbitrary representation `M` in 3.3. The cited supplier only supplies the comparison with constant coefficients. A nontrivial deck-group action on `M` changes the coefficient system on the base.

   **Witness:** For the double circle cover and sign ℤ[C₂]-module, quotient chains have boundary −2: `(H₀,H₁)=(ℤ/2,0)`, versus `(ℤ,ℤ)` on the constant-coefficient base. `TauCetiRoadmap/AlgebraicTopology/README.md:1968` on main explicitly specifies constant coefficients.

   **Exact repair:** Keep 3.3's theorem for every representation. Replace this Check, in both files, by: “For a surjective finite regular cover `E → B` with deck group `G`, and a `k`-module `M` with trivial `G`-action, AlgebraicTopology §5.3 identifies `(C_*(E;k) ⊗ M)_G` with `C_*(B;M)`. The abutment and second page are those of its Cartan–Leray sequence.” Add the sign-module double cover as a negative-control Check; do not claim that §5.3 supplies a general local-coefficient comparison.

   **Repair tested:** Use `E = ℝ/2ℤ`, `B = ℝ/ℤ`, deck generator `t(x)=x+1`. The equivariant cellular complex has one free ℤ[C₂]-generator in each of degrees 1 and 0 and differential `t−1`. After tensoring with the sign module and taking diagonal coinvariants it becomes `ℤ →−2 ℤ`. With trivial action the differential becomes 0, so both quotient and base have `H₀=H₁=ℤ`. Thus the proposed hypothesis excludes exactly the failed comparison, while the algebraic theorem still computes the twisted example correctly. The cellular model gives the same homology as the singular-chain formulation of the Check.

One finding, P2. Both preceding findings are repaired. The remaining defect is a coefficient hypothesis in a covering-space comparison Check, not the general algebraic free-complex theorem. The design and source manifest were not modified.

## Verified sound

### Previous findings checked first

| Round-3 finding | Status | Repaired passage and verification |
|---|---|---|
| F01, primality in 8.2 | Repaired | README 1573: “for a prime `p` (`Nat.Prime p`), a finite group `P` with `IsPGroup p P`”. The plan includes `Nat.Prime p` at line 2010. The order-21 negative control occurs at README 1590 and plan 2045. Fresh enumeration gives element-order counts `{1:1,3:14,7:6}` and subgroup-size counts `{1:1,3:7,7:1,21:1}`; all abelian subgroups are cyclic but the whole group is not. The prime hypothesis excludes it. |
| F02, quaternion cup-periodicity ownership | Repaired | README 99–102 imports “the invertibility of cup product with that class in Tate cohomology”; README 1659–1660 calls it “the imported period class”. Plan `pPeriod_quaternion`, line 2157, is a Check, not an API theorem. K3BlochGroups §5.2 at its open head explicitly owns the quaternion class and invertible cup product. |

Neither repair was marked not actionable. The changed Summary, ownership paragraph, supplier contract, 8.2, 8.4, Layer 8 Examples/Dependencies and corresponding plan entries were examined. The added MilneCFT locator was checked against the cached text. Searches for the repaired patterns covered every `IsPGroup`/prime hypothesis and every quaternion/period-class occurrence. Sections 7.2, 8.4 and 8.5 explicitly require a prime where relevant. Section 8.3 remains the general orientation-character exact-sequence theorem; 8.4 retains the comparison with the named native cyclic character class, not a second quaternion construction.

The repaired supplier derivation is valid: if `u∪v=1` in degrees 4 and −4, graded commutativity has sign `(−1)^(−16)=1`, so `v∪u=1`; associativity and the unit give inverse maps on every coefficient module. For Q₈ these maps take `1∈Ĥ⁰=ℤ/8` to the degree-four generator. For `M=𝔽₂`, dimensions in degrees 0–7 are `1,2,2,1,1,2,2,1`, consistent with the same period. The Layer 8 sequence has alternating integral ranks `1−8+16−16+8−1=0` and trivial actions at both ends.

### Coverage and adversarial calculations

Read all eight layers and their statements, APIs, Checks, proof routes and Needs lines; compared all 41 plan statements and hypothesis lists with the README. The plan contains ten definitions, three constructions, twenty-eight theorem targets and 135 Checks, with at least three Checks per target. The preceding review's computed rows are retained only for unchanged mathematics; they are not treated as certification of changed passages or of supplier heads. The table below includes the fifteen seeded targets, headline families, repairs and R01. Rows marked **retained** use the preceding round's explicit numerical computations after checking their statements are unchanged. Other rows give calculations checked this round. All rings and modules in the examples have the actions stated; zero coefficients give zero on both sides, and over the zero ring every module is zero.

| Statement | Instances tried | Computed values on both sides | Result / change |
|---|---|---|---|
| 1.1 conjugation | `C₃ ◁ S₃`, coefficients `𝔽₃`; `H=⟨(12)⟩`, `g=(123)` | Transposition acts by `−1` on `Hom(C₃,𝔽₃)`; invariant subspace is 0. `gHg⁻¹=⟨(23)⟩`, whereas `g⁻¹Hg=⟨(13)⟩`. | Cochain inverse and coefficient action match the claimed direction. |
| 1.2 quotient action | `2ℤ/4 ◁ ℤ/4`, sign ℤ | `H₀(N,ℤ)=ℤ`; quotient generator acts by `−1`, versus `+1` if coefficient action is omitted. For `N=1`, degree zero is `M`; for `N=G`, quotient action is trivial. | Sound; retained computed control. |
| 1.3 additivity | `C₂`, infinite and empty families of trivial ℤ | `H₁(C₂,⊕ℤ)=⊕ℤ/2`; `H²(C₂,∏ℤ)=∏ℤ/2`; empty cases 0. Identity on `ℤ^(ℕ)` has infinitely many nonzero coordinate maps, outside `⊕ Hom(ℤ^(ℕ),ℤ)`. | Correct sum/product distinction; retained. |
| 1.4 permutation modules | `C₂` acting on `C₂ ⊔ pt` | `H₀=ℤ⊕ℤ`, `H₁=0⊕ℤ/2`, by the two stabilizers. Summing over points would give degree-zero rank 3. | Sound; retained. |
| 1.5 discrete comparison | `G=ℤ`, trivial ℤ; discrete versus profinite-induced topology | Discrete `H¹_cont=Hom(ℤ,ℤ)=ℤ`; continuous homomorphisms for the profinite-induced topology have finite-index kernel and are 0. `G=1`: degree zero `M`, higher degrees 0. | Discreteness and natural degree-one sign are substantive; retained. |
| 2.1 hyperhomology | `S₃`, complex `ℤ[S₃/C₃]→ℤ` | Hyperhomology in degrees 0,1,2 is `0,ℤ/2,ℤ/3`; naive coinvariant complex is `ℤ →id ℤ`, with all homology 0. | Derived construction distinguished; retained. |
| 2.2 exact sequences | `C₃`, `0→ℤ →3 ℤ→𝔽₃→0` in degree zero | Connecting map `H¹(C₃,𝔽₃)=ℤ/3 → H²(C₃,ℤ)=ℤ/3` sends 1 to 1. For `G=1`, degree-zero sequence is `0→ℤ →3 ℤ→𝔽₃→0` and all higher terms vanish. | Correct direction and exactness. |
| 2.3 two pages | Same `S₃` complex | At `q=0`, first-page map is `id_ℤ`; at `q=1`, it is `ℤ/3→ℤ/2=0`. Survivors give `H₁=ℤ/2`, `H₂=ℤ/3`, agreeing with the shifted sign-module computation. | Correct page order, differential and finite-degree convergence. |
| 3.1 flat/projective hypotheses | Exact three-term complex over `ℤ/4` tensored with `ℤ/2`; telescope over ℤ | Tensor differentials become `(0,id)`, producing extra `H₂=ℤ/2`. Dual telescope equation with right side `(1,0,1,0,…)` forces `a₀=−1/3∈ℤ₂`, not ℤ. | Separate flatness and projectivity hypotheses exclude separate failures; retained. |
| 3.2 orbit sequence | Reflected versus freely rotated two-edge circle, `C₂`, ℤ | Reflection: `E¹_(0,q)=(ℤ/2)²` for positive odd q, `E¹_(1,q)=0` there, hence these survive. Rotation: positive-q terms 0; degree-zero row `ℤ →0 ℤ`, yielding `H₀=H₁=ℤ`, higher groups 0. | Stabilizers and action matter; no finiteness of the orbit set is inserted. |
| 3.3 algebraic free complexes | Cyclic resolution of `C₃`; nonfree `ℤ[0]` | Free coinvariant differentials alternate `0,3`, hence `H₁=ℤ/3`, `H₂=0`. Nonfree naive degree-one homology is 0, but hyperhomology is `ℤ/3`. | Main theorem sound. |
| 3.3 covering Check | Double cover `ℝ/2ℤ→ℝ/ℤ`, sign ℤ and trivial ℤ | Sign: quotient differential `−2`, `(H₀,H₁)=(ℤ/2,0)`; constant base `(ℤ,ℤ)`. Trivial action: quotient differential 0, `(ℤ,ℤ)` on both sides. | R01: require trivial action in this comparison Check. |
| 3.4–3.5 tree sequence | Single vertex; translation action on the line, sign and trivial ℤ | Point: `0→0→ℤ →id ℤ→0`. Line: `t⁻¹−1=−2` for sign action, yielding `H₁=0`, `H₀=ℤ/2`; trivial action gives 0 and `H₁=H₀=ℤ`. | Endpoint difference and coefficient transport agree. |
| 3.6 splittings | `C₄ *_(C₂) C₆`; `BS(1,2)`; free rank two with sign action | Abelianization quotient by `(−2,3)` is `ℤ/12`. HNN maps are `−1` in degree one, 0 in degree zero, yielding `H₁=ℤ`. Sign free-group boundary `(-2,-2)` has kernel ℤ, whereas each cyclic factor has `H₁=0`. | Degree-one exception and HNN direction hold; retained. |
| 4.1 cup | Coordinate classes on ℤ²; `C₂` with `𝔽₂`; omitted action on `ℤ[ℤ]` | On the torus cycle, `x∪y=1−0=1`, `y∪x=0−1=−1`. The mod-2 degree-one square takes value 1. Omitting the coefficient action gives differential `2(t−1)` at `(1,1,1)`. | Correct sign and equivariant formula. |
| 4.2 connecting signs | `C₃×ℤ`, degree-one x and mod-3 y | With `v=x∪δy`, `δ(x∪y)=−v=2v`; thus `x∪δy=−δ(x∪y)=v`. Wrong sign would assert `1=2 mod3`. | Split coinduction fixes uniqueness; retained. |
| 4.3–4.4 identities/diagonal | ℤ², `C₂` mod2, trivial group | Odd products on ℤ² evaluate as `1,−1`; mod2 square is 1. A degree-zero diagonal lifting the augmentation has augmentation 1; zero diagonal has 0. | Anticommutativity and lifting condition distinguish wrong models; retained. |
| 4.5 projection | `1≤C₃`, degree-zero integers 2 and 5; index one | `cor(2·5)=30=(3·2)·5`; at index one both sides are 10. | Index normalization correct; retained. |
| 4.6 evaluation/cap | Torus cycle; `C₂` over `𝔽₂`; degree zero | Evaluations of `x∪y,y∪x` are `1,−1`; mod2 degree-one generator pairs with homology generator to 1. Degree zero is `μ(x⊗n)` in coinvariants. | Compatible with adjunction and the supplier's homogeneous evaluation. |
| 4.7 comparisons | `C₂`, ℤ and `𝔽₂` | Ordinary and Tate positive-degree squares both nonzero mod2; `H⁰(C₂,ℤ)=ℤ → Ĥ⁰=ℤ/2` sends 1 to 1 and 2 to 0. | Correct quotient at the boundary; retained. |
| 5.1 homological Künneth | `C₂²`, integral and field coefficients | `H₂=ℤ/2`; `H₃=(ℤ/2)³` consists of two tensor terms and one Tor term. Mod p dimensions in degrees 0,1,2 are `1,2,3`. | Tor term cannot be dropped; retained. |
| 5.2 universal coefficients | `C₂`, `A=𝔽₂` over ℤ; field | `H₂=0⊕Tor(ℤ/2,𝔽₂)=𝔽₂`; `H²=Ext¹(ℤ/2,𝔽₂)=𝔽₂`, Hom term 0. Over a field both correction terms vanish. | Directions, degree shift and ring hypothesis agree. |
| 5.3 cohomological cross product | ℤ×ℤ; two infinite-rank free abelian groups over ℚ | Shuffle evaluation `1−0=1=1·1`. Matrix `δ_ij` defines an infinite-rank bilinear form, outside finite sums of decomposable tensors. | One-factor finite-dimensionality excludes failure of surjectivity; retained. |
| 5.4 Pontryagin ring | ℤ², ℚ, `C₂` | Exterior ranks for ℤ²: `1,2,1,0`; `H₁(ℚ,ℤ)=ℚ`, `H₂=0`. For `C₂`, `Λ³=0` while `H₃=ℤ/2`. In mod2 homology, degree-one Pontryagin square has coefficient `binom(2,1)=0`. | Torsion-free and integral degree bounds are genuine; no odd-square inference from signs alone. |
| 6.1 filtration | `C₂`, N=1 or N=G, mod2; `C₂<C₄`; zero module | For N=1, `C̄ⁿ=𝔽₂` and `A_j` contains nonzero degree j for all j≥1. For N=G, `A₁=0` although all `C̄ⁿ=𝔽₂`. For `C₂<C₄` in degree one, dimensions of `A₁,A*₁` are 2 and 1. Zero module gives all terms 0. | Global-zero dichotomy and page-only comparison remain correct. |
| 6.2 convergence coordinates | Classical `(p,q)=(0,0),(2,0),(0,2),(1,2)` | Native coordinates `(1,−1),(5,−3),(3,−1),(5,−2)`; native stabilization pages `3,4,5,5`. Upper terms are `A₂¹,A₅³,A₄³,A₅⁴=0`; lower quotients by `A_(−1),A₀,A_(−3),A_(−2)` are 0. | Both actual pinned stabilization hypotheses hold; no global filtration bound needed. |
| 6.2 cohomological HS | `C₃◁S₃`, `𝔽₃` | Positive quotient cohomology vanishes. Actions in kernel degrees 0–4 are `+1,−1,−1,+1,+1`, giving abutment dimensions `1,0,0,1,1`. | Correct quotient action and collapse. |
| 6.3 homological HS | Split `C₂→C₂²→C₂` versus nonsplit `C₂→C₄→C₂`, mod2 | Both E² pages have dimension 1 at every bidegree. Split abutment dimension is `n+1`; nonsplit is 1 in every degree, so its differential cannot vanish. | Extension is not lost; retained. |
| 6.4 edges | `C₂<C₄`, `𝔽₂`, degree one; N=1,G | Inflation sends the nonzero quotient character to the nonzero character of C₄, hence is an isomorphism; restriction evaluates that character at 2 and is 0. N=1 gives identity inflation; N=G gives identity restriction. | Four edge directions agree with variance and the source. |
| 6.5 multiplicativity | `G=ℤ²`, N second factor, x from Q, y from N | First-N restriction gives `y∪x ↦ +xy`, `x∪y ↦ −xy`; the twist `(-1)^(p q')` gives respectively `+1,−1`. | The competing twist would reverse both values; retained. |
| 6.6 transgression | `C₃<C₉`, residues 0,1,2 and mod3 coefficients | `f(3a+r)=a` has `df(2,1)=−1=2`; extension carry is +1. Split extension gives 0. | `d₂=−c∪` and the pinned lift convention agree. |
| 6.7 low degrees | `C₂<C₄`, integral coefficients, m=2 | Exact portion `0→ℤ/2 →×2 ℤ/4 →mod2 ℤ/2→0`. Homological inclusion sends 1 mod2 to 2 mod4. With mod2 coefficients `H¹(N)≠0` and inflation in degree two is 0. | Vanishing hypothesis excludes failure of injectivity; retained. |
| 6.8 Hopf | Cyclic presentation; ℤ²; free group | `F=ℤ,R=mℤ`: intersection with `[F,F]=0` gives 0=`H₂(C_m,ℤ)`. For ℤ² the quotient is ℤ generated by `[a,b]`; R=1 gives 0. | Wrong quotient omitting the intersection gives `mℤ`, so is excluded; retained. |
| 6.9 finite/profinite | `C₃<C₉`; N=G | Both lifts have coboundary −carry, value 2 mod3 at `(2,1)`; for N=G both targets are `H²(1,−)=0`. | The finite section is continuous; retained. |
| 7.1 double cosets | `H=K=C₂≤S₃`; `C₃◁S₃` | Double-coset sizes 2 and 4, degree-zero summands `1+2=3`. In positive mod2 degree, `id+0=id`. On integral `H²(C₃)`, normal conjugate sum is `1+(−1)=0`. | Correct inverses and finite-index normalization. |
| 7.2 stable elements | `S₃` at 3; twisted permutation module for `C₂×S₃` | 3-primary parts of `H²,H⁴` are `0,ℤ/3`. Twisted example: normalizer invariants dimension 3, stable subspace dimension 2; fusion sends `e₃` to `e₂`. | Trivial action is required for the abelian-Sylow simplification; retained. |
| 8.1 Tate duality | `C₂`, M=ℤ and M=ℤ/2 | `Ĥ⁰(ℚ/ℤ)=0=Hom(Ĥ⁻¹(ℤ),ℚ/ℤ)`; `Ĥ¹(ℚ/ℤ)=ℤ/2=Hom(Ĥ⁻²(ℤ),ℚ/ℤ)`. For nonfree M, integral dual is 0 but dual of `Ĥ⁰(M)` is ℤ/2. | Correct shifts; freeness cannot be erased. |
| 8.2 classification repair | p=21 semidirect product; Q₈,Q₁₆,D₈,C₉ | Order21 enumeration above; `21` fails primality. Q₈ has three cyclic order-four subgroups; in Q₁₆ a noncyclic abelian candidate would require `x^i y` commuting with x, but it inverts x. D₈ contains C₂². C₉ is cyclic. | Both directions survive prime and trivial-group controls. |
| 8.3 exact-sequence periodicity | Sign sequence for C₂; norm sequence for C₃ | `Ĥ⁰(C₂,ℤ)=ℤ/2=Ĥ¹(C₂,ℤ_sgn)`; `Ĥ¹(C₂,ℤ)=0=Ĥ²(C₂,ℤ_sgn)`. Two sign twists are trivial. C₃ norm class sends `1 mod3` to a degree-two generator. | Twisted period and all coefficients retained. |
| 8.4 cyclic and imported quaternion periods | C₄, C₆, Q₈, group 1 | C₄ class acts by `1→1 mod4`; wrong class `2δχ` gives `1→2`, not onto. C₆ has primary periods 2 at 2 and 3. Q₈ has `Ĥ²=(ℤ/2)²`, `Ĥ⁴=ℤ/8`; period 4. Group 1 has zero Tate groups and the unique isomorphisms. | Named character excludes rescaling; quaternion result imported. |
| 8.5 periodicity equivalences | 1, S₃,A₄,SL₂(𝔽₉); p not dividing order | Group 1: all Tate groups 0, u=0 works. S₃ period 4. A₄ contains C₂². SL₂(𝔽₉) has order720 and Sylow3=C₃², so fails. For coprime p, all primary groups are 0 and all primary conditions hold. | No prime-to-order or trivial-group exception is lost; retained. |

### Seeded source verification

The five readable texts were read in the supplied legal cache. No new source was fetched. The eight manifest keys cover all cited works. All entries marked uncertified or waived were respected; they were neither silently certified nor requested again. The term “supports” below distinguishes a source's statement from an extension justified by the design's named inputs.

| Seeded target | Locator inspected | Result |
|---|---|---|
| 1.1 Conjugation | HS53 Ch. I §2 corollary, p.113, lines154–160; quotient action lines345–354; Loh19 Prop.3.2.13, p.124, lines5322–5353 | Correct inverse on cochain arguments, coefficient action, and inner triviality. Löh states both variances. Extension over k uses the same k-linear maps. |
| 2.2 Long exact sequences | CE56 Ch.XVII | Settled unreadable. Independently, coefficientwise functions and direct sums are exact in modules; each total degree has finitely many terms. This supports the construction, not certification of CE56's locator. |
| 2.3 Two spectral sequences | HS53 Ch.I §5 Lemma1, p.115, line246; Lemma2/Prop.5, p.116, lines273–288 | Pages correct. Source treats the cochain bicomplex; Prop.5 has coefficientwise acyclicity. The design uses DerivedModuleAlgebra for general bicomplex convergence and applies the extra identification only with acyclicity. |
| 3.2 Orbit sequence | Brown82 Ch.VII; HS53 Ch.I §4, p.114 | Brown unavailable. HS53 supplies the bicomplex, not the monomial stabilizer formula. That formula follows from the explicitly named additivity, twisted Shapiro and two-page targets. |
| 3.5 Tree sequences | SerreArbres II §2.8 Prop.13 and Remark1, p.169, lines5170–5184; preceding chain sequence p.168, lines5140–5166 | Correct direct sums versus products, arbitrary coefficients and terminal-minus-initial maps. The k-linear version tensors the split integral tree sequence. |
| 4.1 Cochain cup | HS53 Ch.II §1 pp.118–119, lines389–400; MilneCFT II Prop.1.38, p.73, lines3459–3484 | Formula, action on the second factor and Leibniz sign agree. The ring-linear extension preserves them. |
| 4.6 Cap/evaluation | Brown82 Ch.V | Settled unreadable. Native chain differential and contragredient action independently give evaluation without sign. IntegralIwasawaTheoryPartII §0.7 supplies exactly the ℂ_p specialization. |
| 5.2 Universal coefficients | Loh19 Cor.3.2.21, p.135, lines5841–5851; Outlook3.2.26, p.138, lines5985–5994 | Homological statement is integral; cohomological result is an outlook, not a full theorem there. The wider hereditary-ring form is supported by the named pinned chain-complex constructions and projective cycles/boundaries, not by pretending the outlook states that generality. |
| 5.4 Pontryagin ring | Brown82 Ch.V | Settled unreadable; no historical locator certified. The algebraic routes and torsion/degree controls above were checked. |
| 6.1 Normalized filtration | HS53 Ch.II §1 pp.118–121, lines368–419 | Normalization, both filtrations, multiplicativity of A and E₁ comparison agree. The added global-bound dichotomy follows by the delta-cochain example; it is not ascribed to a source theorem. |
| 6.2 Cohomological HS | HS53 Ch.II Thm.1 p.121, lines489–491; Thm.2/Prop.3 p.125, lines654–679; Ch.I Prop.7 p.117, lines341–354 | Restriction on A* representatives, shuffle correction on A, `(−1)^q d` and E₂ agree. Pinned stabilization, not an unsupported global bound, supplies convergence. |
| 6.4 Edges | HS53 Ch.III §1, p.126, lines711–719 | Coherent inflation and restriction factorizations. Homological analogue is derived by naturality and the declared homological edge contract. |
| 7.1 Double cosets | Brown82 Ch.III §§8–9 | Settled unreadable. Native continuous Mackey was inspected for the finite comparison; degree-zero and S₃ calculations check directions independently. |
| 8.1 Tate duality | Brown82 Ch.VI §7; CE56 Ch.XII | Both unreadable. Divisible dual, integer shifts, free integral dual and dimension-shifting route were examined without claiming source certification. |
| 8.2 p-group classification | Loh19 Cor.1.6.18–19 p.53, lines2399–2436; Outlook1.6.20 p.54, lines2437–2456; Brown82 IV §4 | Primality now explicit in both files. Löh gives the odd-prime result and the 2-group classification discussion; Brown remains unreadable. |

The additional unverified locators in plan targets 1.3, 3.1, 4.4 and 8.5 are all Brown82; the remaining such targets are in the table. They retain their settled status. SwanPPeriod60 remains waived. The new 8.4 citation is accurate: MilneCFT II Prop.3.4/Remark3.5, p.81, lines3793–3822, gives generator-dependent two-periodicity and states its cup-character description without proof, exactly as the design acknowledges. Hutchinson13 lines494–504 gives the homological period criterion and Swan formulas; the minimum convention is fixed explicitly in the design.

### Library, ownership and supplier audit

The plan's baselines agree with `lake-manifest.json`: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Declaration searches covered the 79 distinct library prerequisites in the plan, then the README references. Citation resolution with the pinned package directory reports no missing cross-roadmap citations and no missing Lean names. Its first invocation without that directory did not check external Lean names; the second did. Existence alone was not treated as proof of a supplier's generality.

Pinned source openings included the following. Paths are relative to the respective library repositories.

| Declarations opened at the pin | Relevant contract |
|---|---|
| `Mathlib/RepresentationTheory/Homological/GroupCohomology/Basic.lean:183,202,210`; `GroupHomology/Basic.lean:125,226,246,254` under the same prefix | Native cohomology/homology, Ext/Tor and resolution comparisons. Homological differential starts with `ρ(g₀⁻¹)`; this is consistent with contragredient evaluation, not an extra inversion of the representation. |
| `Mathlib/RepresentationTheory/Homological/GroupCohomology/Functoriality.lean:141,522,566`; `GroupHomology/Functoriality.lean:157,543,818,850,864` | Compatible-pair variance, coefficient complexes, inflation, inclusion-induced corestriction, coinflation and the existing degree-one tail. |
| `Mathlib/RepresentationTheory/Homological/GroupCohomology/Shapiro.lean:58`; `GroupHomology/Shapiro.lean:65`; `Mathlib/RepresentationTheory/Invariants.lean:263`; `Coinvariants.lean:442` | Shapiro and degree-zero quotient actions exist already. |
| `Mathlib/RepresentationTheory/Homological/TateCohomology/Basic.lean:146,233`; `ContCohomology/Basic.lean:113,131` | Integer Tate carrier, positive-degree comparison, continuous homogeneous carrier. Positive comparison excludes degree zero. |
| `Mathlib/GroupTheory/PGroup.lean:45`; `SpecificGroups/Quaternion.lean:51`; `Sylow.lean:54`; `HNNExtension.lean:52` | `IsPGroup` means elementwise annihilation by powers, without primality. Quaternion parameter n gives order4n; native HNN uses `t a t⁻¹=φ(a)`. |
| `Mathlib/AlgebraicTopology/DoldKan/HomotopyEquivalence.lean:81`; `AlternatingFaceMapComplex.lean:263` | Existing normalized Moore deformation retract and inclusion are inputs, not new machinery here. |
| `TauCeti/RepresentationTheory/Homological/GroupCohomology/Corestriction.lean:136,187`; `InflationRestriction.lean:139`; `Sylow.lean:58`; `GroupHomology/Transfer/Basic.lean:79` | Finite-index corestriction, connecting compatibility, vanishing-dependent inflation–restriction, prime-primary Sylow detection and transfer. |
| `TauCeti/RepresentationTheory/Homological/TateCohomology/Cup/Product.lean:131`; `Associativity.lean:214`; `GradedComm.lean:168`; `Unit.lean:56`; `Corestriction.lean:178`; `Restriction/AllDegrees.lean:141`, with the same Cup prefix | Existing all-degree product, associator/braiding, unit, projection and restriction. These justify the repaired quaternion import on every module. |
| `TauCeti/RepresentationTheory/Homological/TateCohomology/Cup/Delta.lean:242,443`; `Cup/Cyclic.lean:146`; `Character.lean:65`; `Periodic.lean:302` | Flat/split connecting interfaces, named-character degree-zero cup comparison, character class and resolution periodicity. The named-class all-degree comparison is genuinely stronger than the displayed pinned cup theorem. |
| `TauCeti/RepresentationTheory/Homological/ContCohomology/Transgression.lean:147,702,779`; `GroupCohomologyIso/Basic.lean:492,557`; `FiniteQuotient/AllDegreeColimit.lean:402`; `Cup/Cohomology.lean:169` under the same ContCohomology prefix | Lift predicate, continuous transgression/exactness, discrete low-degree comparisons, finite-quotient colimit and continuous cup. Discrete comparison needs the carrier conversion stated in 1.5. |
| `TauCeti/Algebra/Homology/SpectralSequence/Filtered/SpectralObject.lean:304,409,425`; `FirstPage.lean:89`; `Stabilization.lean:83`; `Naturality.lean:83`; `Convergence.lean:51`; `TauCeti/Algebra/Homology/SpectralObject/Abutment.lean:92` | First-page index translation, degreewise stabilization, abutment graded piece and naturality. Explicit substitution in the table checks both stabilization hypotheses. |
| `TauCeti/Algebra/Homology/SpectralSequence/Bicomplex.lean:410,442`; `TotalComplex.lean:596` under Algebra/Homology | Homological row/column sequences and exact augmented-row total comparison. |
| `TauCeti/Algebra/Homology/Monoidal/Homology/Kunneth/Basic.lean:112`; `Sequence.lean:729,792`; `TauCeti/Algebra/Homology/UniversalCoefficient/Basic.lean:121,153,180` | Künneth map, short exact sequence, splitting and Ext-to-homology maps. Over global dimension≤1, submodules of projectives are projective, supplying the cycle/boundary hypotheses. |
| `TauCeti/RepresentationTheory/Induction/Permutation.lean:166,339`; `DimensionShift.lean:83`; `TauCeti/RepresentationTheory/Homological/GroupHomology/Induced.lean:49`; `DirectedUnion.lean:113,132` | Induction/permutation projection, coinduced dimension shift, positive-degree induced acyclicity, directed-union surjectivity and vanishing. The full colimit identification remains SchemeKTheoryOperations' input. |
| `TauCeti/Combinatorics/Graph/Serre/Basic.lean:178`; `Tree.lean:47` | Connected includes a nonempty vertex set; tree means connected and acyclic. The empty graph is not accidentally a tree. |

Object searches used the pinned libraries, main, the board package index and the open-head roadmap tools. They covered group (co)homology, hyperhomology, cup/cap, Tate duality/periodicity, Pontryagin products, Hopf's formula and stabilizer sequences. Broad searches were followed by an enlarged-limit focused search so that the default result limit did not hide later roadmaps. Topological Pontryagin rings of loop spaces are different objects from homology of discrete abelian groups. No second copy of this roadmap exists on main; the supplied overlap file has no conflicting head, dropped cited id or unnamed open-revision dependency.

All cross-roadmap citations were resolved anew. The following are README locators at main or the indicated open head; tool metadata headers are not counted.

| Supplier | Location and conclusion |
|---|---|
| DerivedModuleAlgebra, main | `TauCetiRoadmap/DerivedModuleAlgebra/README.md:955`, §S.1. Cohomological pages, convergence, edges, low-degree and extended sequences; homological pages/convergence at991–1000. The missing homological edge/five-term package is the declared gap, not drift. |
| ProfiniteCohomology, main | `TauCetiRoadmap/ProfiniteCohomology/README.md:1140,1155,1571,1770,2622,2763,3519`: §§3.1–3.2,5.5,6.4,10.1,10.5 and Layer12 supply the precise low-degree models, transgression, Mackey, colimit and cups. |
| ClassFieldTheory, main | `TauCetiRoadmap/ClassFieldTheory/README.md:778`, §0.1. Tate interface, subgroupwise cohomological triviality and arbitrary-rank Nakayama–Rim. Arithmetic class formations remain there. |
| FreeGroupsAndLimitGroups, main | `TauCetiRoadmap/FreeGroupsAndLimitGroups/README.md:385,773,803,863,875,906,937`: §§2.2,4.1–4.2,4.5–4.8. Free graph groups, one-edge identifications, nonempty trees, stabilizers and modular amalgam. Stable-letter convention matches. |
| AlgebraicTopology, main | `TauCetiRoadmap/AlgebraicTopology/README.md:1273,1294,1305,1945,2005,4458`: cellular chains, finite regular-cover comparison, torus homology and sphere-action obstruction. Its constant-coefficient restriction at1968 is the witness for R01. |
| SchemeKTheoryOperations, #1229 | `TauCetiRoadmap/SchemeKTheoryOperations/README.md:2548,2554,2582`, §6.7. Integral nonnegative hyperhomology, both pages and directed-union identification. Present 2.1–2.3 extend coefficients and add cohomology; 3.2 adds monomial characters. |
| K3BlochGroups, #1430 | `TauCetiRoadmap/K3BlochGroups/README.md:1191,1867–1870`, §§4.1,5.2. Integral bounded-below reindexing, localized stable elements, integral duality, quaternion resolution and invertible period class, Swan periods. The repaired contract imports these. |
| MappingClassGroupsAndCanonicalRepresentations, #2266 | `TauCetiRoadmap/MappingClassGroupsAndCanonicalRepresentations/README.md:847–875`, §1.1. Discrete cohomological HS existence/naturality, degree-one lift, five-term exactness. Present 6.2 supplies a filtered realization rather than claiming first ownership of existence. |
| IntegralIwasawaTheoryPartII, #2267 | `TauCetiRoadmap/IntegralIwasawaTheoryPartII/README.md:273–278`, §0.7. ℂ_p evaluation with contragredient action. Present 4.6 compares its general pairing to that specialization. |
| InductionRestrictionPartII, #1154 | `TauCetiRoadmap/InductionRestrictionPartII/README.md:312–359`, RS.0.1. Central-extension five-term theorem, not the arbitrary presentation Hopf formula. |
| StableHomotopyKTheory, main | `TauCetiRoadmap/StableHomotopyKTheory/README.md:1336–1347`, §3.29. Perfect-group universal-central-extension kernel comparison; distinct from general 6.8. |
| ModularCurvesPartII, #913 | `TauCetiRoadmap/ModularCurvesPartII/README.md:3935–3937`, §15.4. Modular amalgam sequence; present 3.6 treats arbitrary amalgams. |

Closest-roadmap scopes were read at their heads: ArithmeticGaloisDuality (#858) owns compact/continuous coefficients and arithmetic duality; HomologicalStabilityOfGeneralLinearGroups (#2036) owns frame actions and stability, importing integral hyperhomology; ProfiniteCohomologyPartII (#1839) owns Massey products and unipotent lifting. None is a second owner of the general discrete arbitrary-coefficient constructions here. Main's DerivedModuleAlgebra, ProfiniteCohomology and ClassFieldTheory also provided the house-shape comparisons.

Overlap check: read K3BlochGroups, ArithmeticGaloisDuality, HomologicalStabilityOfGeneralLinearGroups, IntegralIwasawaTheoryPartII, ProfiniteCohomologyPartII, ProfiniteCohomology, DerivedModuleAlgebra and ClassFieldTheory; the results/headings list is empty. Quaternion/Swan periods and localized stable elements belong to K3BlochGroups; ℂ_p evaluation to IntegralIwasawaTheoryPartII; profinite operations to ProfiniteCohomology; generic bicomplex spectral sequences to DerivedModuleAlgebra; the Tate interface to ClassFieldTheory and pinned Tau Ceti; integral hyperhomology used by the closest roadmaps to SchemeKTheoryOperations, with K3BlochGroups' reindexing. The wider discrete constructions belong here. No duplicate owner remains from the preceding findings.

### Supplier order and gap

Every Needs line and supplier citation was read. Plan prerequisite parsing found zero forward target edges. The dependency command returned:

```text
candidate: CohomologyOfGroups is not in the merge order yet; checked as if placed after IntegralIwasawaTheoryPartII (the intake inserts it when its design is accepted)
depcheck: 240 roadmaps, 2179 edges, 0 problem(s)
```

There is no UPWARD or CYCLE. The candidate placement is expected for a design. The homological-low-degree gap has the same slug in README285 and the plan's top-level gaps list, with DerivedModuleAlgebra §S.1 as owner. It specifies first-quadrant homological edge maps and their five-term exact sequence, with directions and hypotheses. This is a coherent minimal contract; it asks for no duplicate supplied object. Its present absence is not a finding. A later acceptance should retain that condition.

### Shape, principles and package obligations

The README has the prescribed summary, scope, conventions, contracts, build explanation, eight mathematical layers, Examples/Dependencies and references. Definitions have prose API lists and at least three discriminating Checks. Statements carry hypotheses and locators; settled unreadable locators remain explicitly uncertified in the plan/manifest. No new route-specific shortcut, selected-prime restriction, computational algorithm, source-based layer heading, copied-source arrangement, machine path, pull-request narrative, HTML anchor, sorry'd data or `set_option` was found in the design. R01 is the one missing coefficient hypothesis found in the prose comparisons.

The seven explicit end-theorem families are Hochschild–Serre (6.2–6.7), tree sequences (3.5), Künneth (5.1), double cosets (7.1), stable elements (7.2), Tate duality (8.1) and periodicity (8.5). Hyper(co)homology, cup/cap, Pontryagin, Hopf, cyclic cup periodicity and orientation-character periodicity are also promised in the Summary and have named targets. No promise is represented by an arbitrary conclusion-valued hypothesis.

This is a design, not a package. There is no `Suggested.lean`. Elaboration is **not available (this lane does not elaborate)**. The one-tactic probe therefore has zero sorried declarations to examine; the binder `#check` audit, imports, module docstring, statable-headline coverage, warnings and external-formalization adaptation checks have no Lean file to operate on. No passing elaboration or package acceptance is claimed. The plan's proposed declaration names are not treated as declarations in a nonexistent file. Backticked actual library names were resolved at the pins.

### Wording, arrangement and reuse

Compared 22 passages against five readable sources: the ten readable or partly readable sampled targets (1.1,2.3,3.2,3.5,4.1,5.2,6.1,6.2,6.4,8.2), plus 1.2,1.5,3.4,4.2,4.3,4.5,5.1,5.3,6.5,6.6,8.3,8.4. This includes definitions, theorem prose and proof routes from different layers. Shared material was mathematical notation, standard terminology and short necessary hypotheses; no copied sentence, clause-by-clause rewriting, translated passage, table, figure or exercise-list reuse was identified. Brown82/CE56 wording was not available to compare.

Counting each source-key occurrence before References gives 99 citations: HS53 34, Loh19 21, Brown82 14, Hutchinson13 12, MilneCFT 9, SerreArbres 4, CE56 3, SwanPPeriod60 2. HS53 is the largest share. Its outline at HS53 lines22–42 and the actual chapter divisions were compared with the roadmap: Chapters I–III (general methods, direct filtration, applications) do not map one-to-one to the eight layers. In Layer6, 6.1 supplies 6.2; 6.2–6.3 supply 6.4; products/filtration supply 6.5; those supply 6.6 and 6.7. These dependencies force the relevant order. Trees, products of groups, finite-index formulas and periodicity have their own mathematical scopes; no source chapter sequence supplies the organization.

Source independence: 22 passages compared with 5 readable sources; no copied expression or reused table/figure/list identified. Largest share HS53, 34 of 99 source-key occurrences; its outline and contents were read and compared: independent. Brown82 and CE56 wording was unavailable; SwanPPeriod60 was waived.

## Not verifiable

- Brown82 and CE56 remain settled uncertified sources. Their theorem numbering, pages, exact source hypotheses and wording cannot be certified from the unavailable texts. No new request was made.
- SwanPPeriod60 remains waived. Hutchinson13's secondary statement and the named supplier were read; the original proof and expression were not.
- Elaboration is **not available (this lane does not elaborate)**. There is no `Suggested.lean`, so no executable padding probe, binder audit, headline signature check or warning count exists for this design.

## Source issues

- **Misprint** in Hutchinson13 at Corollary3.3 proof, printed p.12, line518: the source says the relevant odd degrees are 3 modulo 3; it should be 3 modulo 4; affects the proof.
- **Misprint** in Loh19 at Corollary3.2.23 proof, printed p.136, lines5903,5908,5927: the source says both tensor factors use the resolution of G; it should be the resolutions of G and H; affects the proof.
- **Misprint** in Loh19 at Example3.2.24, printed p.137, lines5954–5955: the source says integral homology of ℤ² vanishes from degree two; it should be from degree three, with degree two ℤ; affects a stated result.
- **Misprint** in Loh19 at Example3.2.25 conclusion, printed p.138, lines5976–5980: the source says integral coefficients and dimension n; it should be coefficients 𝔽_p and dimension n+1; affects a stated result.
- **Misprint** in Loh19 at Theorem3.2.18 proof, printed p.130, line5643: the source says the (2,0) term uses first homology of the quotient; it should be second homology of the quotient; affects the proof.

## For the human reviewers

- Brown82 and CE56 in `packages/CohomologyOfGroups/sources.toml` remain uncertified; their expression was not inspected. SwanPPeriod60 is waived. HS53, the most-cited source, was readable including its organization. No new scope or licence uncertainty was observed.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "a5cef0007d573ad6621721e908ec7f91060524f7", "job": "REV-DESIGN-CohomologyOfGroups~4", "model": "gpt-6-astra", "worker": "chris-9"} -->
