<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/14773#issuecomment-6861735333 -->
Review (codex) of c590ef8

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) Give the derivation equivalence its positive-index hypothesis

   **Location:** `packages/SpectralSequencesAndConvergencePartII/design/README.md:1166`, “under `μ_0`, `φ` satisfies `μ_n` if and only if the induced pairing `φ′` of the derived couples satisfies `μ_{n−1}`”; also `packages/SpectralSequencesAndConvergencePartII/design/plan.json:1119` and `:1142`.

   **Claim:** The equivalence uses the preceding range `n ≥ 0`. At zero it refers to an undefined negative-index condition; interpreting subtraction on natural numbers instead makes it false.

   **Witness:** For the Bockstein couple of `ℤ →(×4) ℤ`, modulo 2, multiply degree-zero classes and set all other products to zero. Then `d₁=0`, but `d₂(1·1)=1` whereas `d₂(1)·1+1·d₂(1)=0`.

   **Exact repair:** Replace the equivalence, in the README and both plan occurrences, by “For every `m ≥ 0`, assuming `μ_0`, the pairing `φ` satisfies `μ_{m+1}` if and only if its derived pairing satisfies `μ_m`.” Equivalently, explicitly restrict the existing formulation to `n ≥ 1`. Keep the definition of `μ_n` for all `n ≥ 0`. Add the witness as a negative-control Check.

   **Repair tested:** In the witness, `μ_0(φ)` holds, `μ_1(φ)` fails, and `μ_0(φ′)` fails. Thus the repaired `m=0` equivalence has values false ↔ false; it no longer asserts true ↔ false. In the bigraded couple, the product is the usual `𝔽₂` product whenever both total degrees are zero, for every pair of filtration indices. The page-two differential has bidegree `(2,−1)`, so the displayed comparison is well typed. The zero pairing satisfies both sides for every `m`. The source itself leaves the positive-index restriction implicit: may-primer line 267–279, Proposition 4.1, p. 7. This is a new finding, not a re-raised settled finding.

2. **F02** (P3) A higher Bockstein representative is a cochain

   **Location:** `packages/SpectralSequencesAndConvergencePartII/design/README.md:1313`, “a cocycle `u` of `M` with `du = f^r w`”.

   **Claim:** This step is the representative calculation for arbitrary higher Bocksteins. Requiring `u` itself to be a cocycle restricts it to zero Bocksteins: termwise injectivity of `f` then forces `w=0`.

   **Witness:** For `M=(ℤ →(×4) ℤ)`, `f=2`, `r=2`, the representative `u=1` has `du=4`, `w=1` and `β₂(u mod 4)=1 mod 2`. It is not a cocycle of `M`.

   **Exact repair:** Write “a cochain `u ∈ Mⁿ` whose reduction modulo `f^r` is a cocycle, so that `du=f^r w` for a unique `w ∈ Mⁿ⁺¹`”. Keep the two following formulas. This is a prose correction to the route, not a change to the headline theorem.

   **Repair tested:** The corrected representative includes `u=1` above and yields `d₂[1]=[1]`. Termwise injectivity also gives `dw=0` from `f^r dw=d²u=0`; thus `[w]` in the next formula is defined. For an actual cocycle it still gives `w=0` and zero Bockstein.

Two findings: one P2 and one P3. The eight previous findings are repaired. This is a design review: there is no `Suggested.lean`, and elaboration is **not available (this lane does not elaborate)**. No design or source-manifest entry was changed.

## Previous findings, checked individually

All locations in this table are in `packages/SpectralSequencesAndConvergencePartII/design/README.md` unless the plan is named. Each quotation is from the repaired design.

| Earlier id | Status | Repaired passage and verification |
| --- | --- | --- |
| F01 | Repaired | Lines 435–438: “contains `′E_r^{p,q}` for all `p, q` and some `r`”; alternatively “from which every position of total degree `n` stabilises”. For `ℚ → ℚ/ℤ`, page 1 includes `ℚ/ℤ ∉ P`; page 2 includes `ℤ ∉ P`. Neither repaired hypothesis holds. The new Check and plan 1.3 agree with stacks-012K line 3289–3290. |
| F02 | Repaired | Lines 620–629: “exactly when `h` is a chain map”; “the transported differential … `(2u − 2v, 2v)` against `(2u, 2v)`”. With `u=0,v=1/4`, these are `(1/2,1/2)` and `(0,1/2)`. With `h=id` in both degrees they agree, but the augmentation moves. The plan Check agrees. |
| F03 | Repaired | Lines 588–607 name `CochainComplex.isKInjective_of_injective`, `CochainComplex.IsKInjective.Qh_map_bijective` and `TauCeti.ExactStructure.exists_conflation_of_conflation_of_injective`. Lines 210–224 and 246–255 give the corresponding contracts. The pinned declarations below supply exactly these lifting, homotopy and one-step statements. The plan prerequisites were updated too. |
| F04 | Repaired | Lines 266–267 add “§4.3 … through which weak convergence … is read in 5.2”; lines 282–284 add “§7.4, for its class of categories only”. Lines 457–458 and plan 1.3 now list the same base inputs, including §§3.2 and 7.4. Section 6.1 also now names base §5.1. |
| F05 | Repaired | Lines 916–917: “base §3.6, first quadrant, applied to the sequence of 3.2”. Grothendieck's theorem is now identified as the source of that spectral sequence, not of its five-term consequence. Base §3.6 actually supplies the consequence. Plan 3.3 agrees. |
| F06 | Repaired | Lines 414–420: “`d′ = d₁`, `d″ = (−1)^p d₂`”. On the unit square, the two compositions sum to `1−1=0`; the untwisted interpretation gives `2`. This matches DerivedModuleAlgebra §S.1, lines 957–965 on main. Scope, supplier contract, Examples and plan use the same dictionary. |
| F07 | Repaired | Lines 75–79 name “ArithmeticStatisticsPartVIII, §5.16” and its “own graded carrier”; lines 1361–1366 say only that other roadmaps “state these sequences, or instances of them, for their own use.” The promised revisions are gone. The cited graded Tor subsection exists at the open head. The repair report correctly rejects the old review's ordering rationale: the gate's candidate placement is earlier than those consumers. |
| F08 | Repaired | Lines 1316–1318 use “`D^{s,n−s}` … `Hⁿ(M)` for every `s`” and its quotient, rather than an undefined `A^s`. For `M=ℤ[0]`, `f=p`, the quotient is `ℤ/p`; for `Hⁿ=ℤ/p^a`, it is zero. |

No previous finding was marked non-actionable and then silently re-raised. No maintainer notes were supplied. I searched the rest of the design for the repaired patterns: the arbitrary-page one-antidiagonal Serre inference, the omitted sign dictionary, ambiguous `A^s`, attribution of five-term sequences to Théorème 2.4.1, and promises to change consumers do not recur. The additional cochain/cocycle problem is R02.

## Verified sound

The review covered the complete README and the 24 plan targets, their APIs and 86 plan Checks (the README combines the two contravariant-Ext compatibility Checks into one bullet). All six layers have Examples and Dependencies. The definition/construction sections have API statements and at least three Checks. The mathematics is general abelian-category or module theory, not a route-specific restriction or an algorithm. The Part II boundary explicitly imports convergence theory and the first-quadrant/object special cases from their owners. No copied prose, unowned new carrier, `set_option`, sorry'd data or process instructions were found in the design.

The prior review's computed rows were used for unchanged non-sampled material only. The repaired passages, all 15 seeded targets, and the headline results were checked again. The following compact table records the numerical or algebraic comparisons; it is not an assertion that examples alone prove the theorems. “Base” below means `packages/SpectralSequencesAndConvergence/design/README.md`.

### Adversarial mathematics

| Statement | Instances tried | Computed sides | Result / change |
| --- | --- | --- | --- |
| 1.1 totals and signs | Unit square over ℤ; column 1 with `×2`; zero complex | `D(1)=(1,1)`, `D²=−1+1=0`; unsigned `D²=2`. Column 1 total has differential `−2`, cokernel `ℤ/2`; zero totals have all terms 0. | Pass. |
| 1.1 sum versus product | Staircase `D_p=K^{p,−p}`, `O_p=K^{p+1,−p}` | `D(x)_p=x_p−(−1)^p x_{p+1}`. Finite-support kernel is 0 and every finite-support output has a finite-support preimage; product kernel is `ℤ·(1,1,−1,−1,…)`. Thus `H⁰=0` versus `ℤ`. | Pass; comparison need not be a quasi-isomorphism. |
| 1.2 filtrations/pages | Horizontal `ℤ →2 ℤ`; column-sign example; repaired dictionary | `′d₁=2`, `′E₂^{0,0}=0`, `′E₂^{1,0}=ℤ/2`. For column 1, flipped `″d₁=+2`, Stacks row convention `−2`; components `+1,−1` conjugate them. `gr_I^p` and the shifted column both have term `K^{p,n−p}` and differential `(−1)^p d₂`. | Pass, including F06. |
| 1.3 finite convergence/Serre | `ℚ → ℚ/ℤ`, `P=ℚ`-vector spaces; horizontal `×2` | First example: `E₁^{0,0}=ℚ`, `E₁^{1,0}=ℚ/ℤ`, `E₂^{0,0}=H⁰=ℤ`. Second: `H¹=F¹H¹=ℤ/2`, `F²H¹=0`. Taking the weak Serre class of finite groups works on all of page 2. | Repaired quantifiers exclude the first counterexample. |
| 1.3 half-plane convergence | Staircase; upper/lower support; zero | Row sequence on sum: `E₁=0`, `H=0`; column sequence on product: `E₁^{0,0}=ℤ`, `H⁰=ℤ`. For fixed n, `q≥a` gives `p≤n−a`; `q≤b` gives `p≥n−b`. Zero complex gives 0 on every page and abutment. | Pass with the stated regularity and category hypotheses. |
| 1.4 comparison | Staircase projection to column 0; identity | Product `H⁰`: `ℤ → ℤ`, generator sent to 1, an isomorphism; sum `H⁰`: `0 → ℤ`, not one. Identity induces identity on all terms. | Pass; hypotheses separate the totals. |
| 1.5 assembly/augmentation | Staircase; its flip; `ℤ →id ℤ`; object resolution | Exact rows give sum cohomology 0; flipped staircase has exact columns and sum cohomology 0, but product `H⁰=ℤ`. Identity differential has kernel and cokernel 0. Augmented resolution has `H⁰=A` and higher H=0. | Pass; row/column and opposite conventions agree. |
| 2.1 horseshoes and repaired route | `0→ℤ →2 ℤ→ℤ/2→0`; transported split example | Untwisted middle has `H⁰=ℤ⊕ℤ/2`, not ℤ; horseshoe middle has ℤ. Transport commutator is `(hd₃−d₁h)v`; for `h⁰=id,h¹=0` it is `−2v`. Homotopies on an augmentation `A[0]→I` have target `I⁻¹=0`, hence do not change it. | Pass, including F02/F03. |
| 2.2 derived comparison, truncation, acyclicity | `F=Hom(ℤ/2,−)`, `A=ℤ`; additive `F=−⊗ℤ/2`; injective resolution | First: `R⁰F=0`, `R¹F=ℤ/2`, from `F(ℚ)=0`, `F(ℚ/ℤ)=ℤ/2`. Second: derived degree zero is `ker(0→0)=0`, while `F(ℤ)=ℤ/2`. Injective terms have higher derived values 0. Shifting A by `−a` moves the lowest possible nonzero degree to a. | Pass; left exactness is not silently assumed for additive F. |
| 2.3 Cartan–Eilenberg condition | Two columns `ℚ→ℚ/ℤ`, horizontal `×2`; identity complex | Horizontal degree-one cohomology in each row is `ℚ/2ℚ=0`, `(ℚ/ℤ)/2=0`, unlike `H¹(K)=ℤ/2`; hence the candidate is excluded. Identity columns resolve cycles 0, boundaries A and cohomology 0. | Pass; columns alone do not determine the required object. |
| 2.4 first hypercohomology | `Hom(ℤ/2,−)` on `ℤ →2 ℤ`; object; acyclic terms | `′E₁^{0,1}=′E₁^{1,1}=ℤ/2`, `′d₁=0`; `R¹F(K)=R²F(K)=ℤ/2`. Object has only column 0. F-acyclic terms leave only row 0, with abutment `Hⁿ(FK)`. | Pass; native `Hom.comm` fixes later page maps. |
| 2.5 second hypercohomology | Same example; non-CE columns with `F=id` | `″E₂^{0,1}=″E₂^{1,1}=ℤ/2`, giving total degrees 1,2. Non-CE resolution puts `ℤ/2` at `(1,0)`, whereas the prescribed page puts it at `(0,1)`. | Pass; CE hypothesis excludes wrong filtration. |
| 2.6 duality/indexing | `K=(ℤ →2 ℤ)` in −1,0, tensor ℤ/2 | Opposite complex in 0,1 has `H⁰=op ℤ/2`, `H¹=0`; tensor resolution has differential 0 and `L₀=L₁=ℤ/2`. Reversing cohomological degrees gives differential bidegree `(−r,r−1)`. | Pass. |
| 3.1 composition criterion | Both functors `Hom(ℤ/2,−)` at ℚ/ℤ; identity F | `R¹(GF)(ℚ/ℤ)=0`, but `H¹(RG(RF(ℚ/ℤ)))=ℤ/2`. For identity F, both composites give RG. If an injective I embeds in an acyclic-image M, the embedding splits and `R^qG(FI)` is a summand of 0. | Pass in both directions. |
| 3.2 complex sequence | Coextension along `ℤ/4→ℤ/2`, followed by `Hom_{ℤ/2}(ℤ/2,−)` | Injective resolution has maps ×2, inducing zero on Hom; `R^qF(ℤ/2)=ℤ/2` for all q≥0. `E₂^{0,q}=ℤ/2`, other columns 0; abutment `Ext^q_{ℤ/4}(ℤ/2,ℤ/2)=ℤ/2`. | Pass; object case is the cited supplier. |
| 3.3 low degrees/naturality | Same example, m=1; identity transformations | Five-term sequence is `0→0→ℤ/2 →id ℤ/2→0→ℤ/2`. Exact F has rows q>0 equal to 0, so the edge isomorphism holds in every degree. Identity transformations induce identity maps. | Pass; corrected source attribution. |
| 3.4 mixed variance | `ℤ→ℤ/2`, tensor then dual over ℤ/2; dual over ℤ as negative control | First gives `E₂^{0,0}=E₂^{0,1}=ℤ/2`, abutment Ext over ℤ in degrees 0,1. With `Hom(−,ℤ)`, composite is 0 but `Ext¹(ℤ/2,ℤ)=ℤ/2`; projective-image acyclicity fails. | Pass. |
| 4.1 Tor balance | ℤ/4, ℤ/6; degree 0; projective input; zero ring | `ker(6:ℤ/4→ℤ/4)={0,2}≅ℤ/2`, `ker(4:ℤ/6→ℤ/6)={0,3}≅ℤ/2`. Degree 0 is tensor on both sides. Higher Tor with a projective input is 0; every module over the zero ring is 0. | Pass; both tensor-exactness hypotheses are used by the two augmentations. |
| 4.2 universal coefficients | Derived square of ℤ/2; unbounded sum of shifts; contravariant Ext | `E₂^{0,0}=E₂^{−1,0}=ℤ/2`, abutment `H⁰=H⁻¹=ℤ/2`. Sum of all shifts gives `Hⁿ=(ℤ/2)²`. For `Hom(ℤ →2 ℤ,ℤ)`, `H¹=ℤ/2=Ext¹(ℤ/2,ℤ)` and degree-zero Hom is 0. | Pass; the unbounded Tor form uses the sum half-plane theorem. |
| 4.3 Künneth/edge | Dual numbers `R=k[ε]/ε²`, K=L=k; unit R; finite bounds | `Tor_i(k,k)=k` for every i≥0, so `E₂^{−i,0}=H⁻ⁱ(k⊗ᴸk)=k`; R gives only column 0. If upper bounds are a,b, total degree n allows `n−a−b≤p≤0`, and `q−b≤i≤a`: finite sets. | Pass; finite diagonals do not mean finitely many columns globally. |
| 4.4 change of rings | `ℤ→ℤ/4`, M=N=ℤ/2; identity ring map | `E²_{p,q}=ℤ/2` for p≥0,q=0,1. Abutment is ℤ/2 in degrees 0,1 and 0 above. Thus `d²:E²_{p,0}→E²_{p−2,1}` is an isomorphism for p≥2. Identity map has only one row/column. | Pass. |
| 5.1 derivation condition | Stupid-filtration ×2 example; Bockstein ×4 example | First has `d₁(1·1)=2`, Leibniz side 0, so μ₀ fails. Second has d₁=0, μ₀ true; d₂(1·1)=1 and Leibniz side 0, so derived μ₀ false. μ₁ fails because `2c=2` in ℤ/4 forces `j(c)=1`, while required right side is 0. | R01: require n≥1. Repaired first equivalence is false ↔ false. |
| 5.2 filtered pairings | `𝔽₂[x,y]/x²`, dx=y, y-adic filtration; trivial filtration | `d(x²)=2xy=0`; `d₁(xy^p)=y^{p+1}`, `d₁(xy)=y²`. Homology and E₂ are 𝔽₂ in degree 0. Trivial filtration gives `E₁=H(A)`, every later differential 0. | Pass; no field hypothesis needed for a pairing. |
| 5.3 double-complex products | Components of total Leibniz; odd exterior generators | Vertical components give `(−1)^{p+p′}d₂(xy)=(−1)^p d₂(x)y+(−1)^{p+q+p′}x d₂(y)`, exactly the stated rule. Products of the two degree-one generators are `+ε⊗ε` and `−ε⊗ε`. Flip exponent is `(p+p′)(q+q′)−pq−p′q′=pq′+p′q`. | Pass by direct computation; cited book unread. |
| 6.1 exact couple | ×p and ×p² complexes; ℤ/p[0] | For ×p: `k(1)=[1]`, `d₁=+1`. For ×p²: `k(1)=[p]`, reduction 0, so d₁=0. On ℤ/p[0], multiplication by p is 0, not injective. | Pass; negative control is excluded. |
| 6.2 higher Bockstein and stabilisation | `M=(ℤ →p^a ℤ)`, p=2 or 3 | `E_s⁰=E_s¹=ℤ/p` for s≤a; d_a=+1; later pages 0. `H¹=ℤ/p^a`, `H̄¹=0`; bound a+1 matches. For a=2, `u=1`, `du=p²`, `w=1`, `β₂=1 mod p`. | Headline passes; route needs R02. |
| 6.2 limit/convergence, both directions | Direct sum over a≥1; `ℤ→ℤ[1/p]`; ℤ[0]; f a unit or zero | Sum: every `E_r⁰=⊕_{a≥r}ℤ/p≠0`, but intersection is 0 and `E∞⁰=0`. Inclusion: H¹ is p-divisible, intersection with p-torsion is ℤ/p; `E∞⁰=ℤ/p`, abutment 0. ℤ[0]: `gr^s=ℤ/p=ker k/B∞`. Unit f: E=0 and gr=0; f=0 forces M=0. | Pass; precise criterion distinguishes weak convergence failure, not merely non-stabilisation. |

The convention checks were also compared with suppliers: the base's classical-to-native position `(2p+q+1,−p−1)` has total degree p+q and filtration p; its exact-couple maps have degrees `(−1,1),(0,0),(1,0)`, giving d_r of degree `(r,1−r)`. DerivedModuleAlgebra's anticommuting square and TopologicalSheafCohomology's commuting square both give total square zero after the stated transport. No division by an unchecked scalar is used: the higher-Bockstein division is uniqueness through an injective multiplication map.

### Seeded sources and hypotheses

All source text was read from the supplied legal cache; the manifest has one entry for each of the eleven cited works. No fetch or manifest change was needed. Uncertified entries were left settled. Printed pages below come from the cached page headings, not the PDF viewer's offset.

| Seeded target | Text read at locator | Outcome |
| --- | --- | --- |
| 1.1 | stacks-012K line 3400–3409, Lemma 26.3 proof, p.71 | Product differential matches. The source's surrounding theorem is about abelian groups and additional exactness; the roadmap imports only the formula and gives its own preadditive construction. |
| 1.2 | stacks-012K line 3241–3265, Lemma 25.1, p.67; grothendieck1957 line 1226–1235, (2.4.1), p.146 | Pages and hypotheses match; the row sign difference is expressly conjugated. |
| 1.3 | stacks-012K line 3284–3291, Lemma 25.3, p.68 | Finite-antidiagonal clause and repaired all-position weak Serre clause match. Half-plane clauses are derived through base §§5.4,7.5; weibel1994 remains unread. |
| 1.5 | stacks-012K line 3293–3315, Lemma 25.4, pp.68–69; line 3354–3358, Lemma 26.1, p.69; line 3433–3438, Lemma 26.4, p.71 | Augmentation directions match. General abelian-category half-plane cases have an explicit route through the base, rather than treating the source's abelian-group proof as general. |
| 2.2 | stacks-05QI line 2872–3011, Lemmas 16.1,16.3,16.4,16.6,16.7 and Definition 16.2, pp.57–60 | Additivity, left-exactness qualifications, boundedness and truncation direction agree. The native/classical comparison is separately routed through the two pinned constructions. |
| 2.5 | stacks-05QI line 3655–3689, Lemma 21.3, pp.73–74; grothendieck1957 line 1291–1299, p.147 | Second page and acyclic-resolution variant supported. F-acyclic cycles and boundaries make the requisite short exact sequences stay exact after F. |
| 2.6 | stacks-05QI line 3449–3478, §19, pp.68–69; grothendieck1957 line 1304–1308, p.147 | Enough projectives and opposite-category passage present; index reversal recomputed above. |
| 3.1 | stacks-05QI line 3696–3717, Lemma 22.1, p.74; grothendieck1957 line 1338–1342, Remarque 1, p.148 | Direction of t and both acyclicity criteria agree. The exact-left-adjoint sufficient condition follows from the pinned injective-preservation result. |
| 3.2 | stacks-05QI line 3718–3730, Lemma 22.2, pp.74–75; grothendieck1957 line 1309–1337 and 1343–1347, p.148; line 1506–1529, Proposition 2.5.4, p.152 | Complex sequence, object case and computation via resolving/acyclic complexes supported. |
| 3.3 | grothendieck1957 line 1330–1337, Théorème 2.4.1, p.148; base §3.6, lines 704–746 | The source theorem is now correctly only the existence locator. Base states the five-term and higher vanishing-strip consequences. |
| 4.1 | weibel1994 Theorem 2.7.2, uncertified | Not text-certified. Both augmentation maps, naturality route and projective-flatness hypotheses checked directly against the pins. |
| 5.1 | may-primer line 249–287, Proposition 4.1 and Corollary 4.2, pp.6–7 | Formula matches; positive-index omission is R01. massey1954 remains uncertified. |
| 5.2 | may-primer line 295–324, pp.7–8 | Pairings over a commutative ring do not require a Künneth isomorphism; source explicitly distinguishes that stronger assertion. Canonical convergence comparison used for the abutment. |
| 5.3 | cartan-eilenberg1956 Ch.XV, uncertified | Not text-certified; both Leibniz signs and the flip sign independently computed. |
| 6.2 | may-primer line 147–168, Example 2.3, p.4; hatcher-at line 13330–13337, Proposition 3E.3, p.305; base §§6.1–6.2 | Higher UCT and finite-type Bockstein rules agree, apart from the source misprint listed below. General f-torsion calculations are supplied in the roadmap's route. |

Further wording and mathematical comparisons: 2.1 against stacks-05QI line 3269–3448; 2.3 against line 3621–3654; 2.4 against line 3655–3681; 4.2 against stacks-more-algebra line 7121–7140 and 8115–8127; 4.3 against line 7399–7422; 6.1 against line 12960–13014; the total-sign convention against stacks-012K line 2154–2164 and grothendieck1957 line 1266–1268; the excluded spectral-system products against douady1959 line 143–166. The Stacks Künneth theorem is explicitly bounded; the design explains its bounded-above extension using finite diagonals. The Stacks Bockstein passage assumes f is a nonzerodivisor of the ring; the design's more general assumption is injectivity on the complex terms, which suffices for its exact sequences and localization embedding.

### Pinned libraries and object ownership

Pins in `lake-manifest.json` agree with the plan: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Searches used objects and hypotheses, including double complexes, product totals, Cartan–Eilenberg resolutions, horseshoes, Tor balance, hypercohomology, derived-functor comparison and Bockstein spectral sequences. The README's supplier identifiers were located at these pins, not inferred from the resolver (which says it cannot inspect the pinned libraries).

| Native input opened | Pinned file and declaration line | What it supplies / boundary |
| --- | --- | --- |
| Double-complex carrier, flip | `Mathlib/Algebra/Homology/HomologicalBicomplex.lean:38`, `:150` | A complex of complexes; commuting differentials, no boundedness condition. |
| Sum total, summand maps, descent, map | `Mathlib/Algebra/Homology/TotalComplex.lean:46`, `:266`, `:273`, `:349`, `:412` | `HasTotal` is the coproduct existence condition, not a convergence assumption. |
| Total and flip signs | `Mathlib/Algebra/Homology/ComplexShapeSigns.lean:156`, `:349`; `TotalComplexSymmetry.lean:113` | Horizontal sign 1, vertical sign `(−1)^p`, flip `(−1)^{pq}`. |
| Bifunctor, truncation, opposite | `Mathlib/Algebra/Homology/Bifunctor.lean:83`, `:124`; `Embedding/StupidTrunc.lean:36`; `Opposite.lean:300`; `CochainComplexOpposite.lean:80` | Native constructions used, not new carriers. |
| Spectral-sequence carrier/morphisms | `Mathlib/Algebra/Homology/SpectralSequence/Basic.lean:36`, `:51`; `TauCeti/Algebra/Homology/SpectralSequence/Comparison.lean:32` | `Hom.comm` determines the next page map; a pagewise isomorphism propagates. No convergence data is part of the native carrier. |
| Derived category plus | `Mathlib/Algebra/Homology/DerivedCategory/TStructure.lean:201`; `DerivedCategory/Plus.lean:142`, `:194`, `:218`, `:226` | Native bounded-below category, single and homology functors, localization. |
| RF and transformations | `Mathlib/Algebra/Homology/DerivedCategory/RightDerivedFunctorPlus.lean:47`, `:96`, `:109`, `:128`, `:156` | RF, unit, unit isomorphism on injectives, universal property and natural transformations. |
| Classical derived functors | `Mathlib/CategoryTheory/Abelian/RightDerived.lean:106`, `:110`; `LeftDerived.lean:105`, `:109`, `:359` | Comparison isomorphisms from a chosen resolution; degree-zero left-derived identification. RightDerived's documentation at lines 39–46 does not provide the comparison with RF on D⁺. |
| K-injective lifting | `Mathlib/Algebra/Homology/HomotopyCategory/KInjective.lean:134`; `DerivedCategory/KInjective.lean:42`; `DerivedCategory/DerivabilityStructureInjectives.lean:61` | Explicit lower bound, termwise injectivity; bijection after localization; replacements preserving the lower bound. |
| Object-resolution lifting | `Mathlib/CategoryTheory/Abelian/Injective/Resolution.lean:95`, `:170` | `desc`, `descHomotopy`, indexed by ℕ. |
| Injective preservation/opposites | `Mathlib/CategoryTheory/Preadditive/Injective/Basic.lean:196`, `:265`, `:280` | Adjoint preservation with exactness hypothesis, enough injectives in the opposite category. |
| Tor / Ext | `Mathlib/CategoryTheory/Monoidal/Tor.lean:44`, `:50`, `:61`; `Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean:118`; `Mathlib/CategoryTheory/Abelian/Projective/Ext.lean:39`, `Injective/Ext.lean:40` | Tor derives the second variable, Tor′ the first. Ext already has both resolution calculations; the README uses them as Checks. |
| Scalar change | `Mathlib/Algebra/Category/ModuleCat/ChangeOfRings.lean:519`, `:658`, `:878` | Coextension adjunction over arbitrary rings; the cited tensor extension adjunction is for commutative rings. |
| Native filtered sequence | `TauCeti/Algebra/Homology/SpectralSequence/Filtered/SpectralObject.lean:304`, `:409`, `:425`; `Filtered/Naturality.lean:83`; `Filtered/FirstPage.lean:89` | Filtration functor, spectral sequence, first-page identification and differential. |
| First-quadrant bicomplexes | `TauCeti/Algebra/Homology/SpectralSequence/Bicomplex.lean:410`, `:442`, `:446`; `TauCeti/Algebra/Homology/TotalComplex.lean:580`, `:596` | Both sequences and row augmentation/comparison for ℕ-indexed chain bicomplexes. |
| Exact structure/horseshoe | `TauCeti/CategoryTheory/Exact/Abelian.lean:124`, `:166`; `Exact/Injective.lean:165`, `:426` | Abelian conflations, injective identification, one-step horseshoe. It does not supply the entire relative resolution theorem. |
| K-flat and tensor comparisons | `TauCeti/Algebra/Homology/Monoidal/KFlat/Basic.lean:89`, `:222`, `:361` | K-flat predicate, tensoring a quasi-isomorphism and bounded-above flat criterion. |
| Cross product, Künneth, UCT | `TauCeti/Algebra/Homology/Monoidal/Homology/Cross.lean:153`; `Kunneth/Sequence.lean:729`; `TauCeti/Algebra/Homology/UniversalCoefficient/Basic.lean:180` | Existing cross product and short-exact/middle-exactness results, with projective cycle/splitting conditions; the README's hereditary-ring projective-complex Checks meet them. |

The object search did not locate an existing product-total construction on arbitrary double complexes, generic Cartan–Eilenberg resolutions, Tor/Tor′ balancing, the RF/classical comparison, or generic higher Bockstein spectral sequences at these pins. Specialized complete-resolution horseshoes, mixed-complex product totals, first-order Bocksteins and sheaf Leray theorems are different objects or the explicitly retained special cases. No duplicate fully qualified Lean declaration is introduced: this is a design with no Lean declarations.

`roadmaps grep` and `roadmaps show` were used against main and indexed open heads. The closest scopes read were DerivedModuleAlgebra, TopologicalSheafCohomology and GrothendieckEulerForms on main, and SchemeKTheoryOperations (#1229), DerivedInfinityCategories (#2270), EnhancedDerivedSheaves (#1630), and both AlgebraicTopology revision heads (#1807, #1808). The latter two are revisions: supplier citations were resolved on main, rather than adopting their new numbering. The results/headings closest list is empty. The extra product-total matches in DerivedDeRhamCohomology and RefinedTraceMethods concern their descent and mixed-complex models, not ownership of the general double-complex construction here. Generic derived ∞-categories and enhanced sheaf categories are likewise not reconstructed by this design.

Resolved cross-roadmap objects:

- DerivedModuleAlgebra main §0.2, `TauCetiRoadmap/DerivedModuleAlgebra/README.md:794`, supplies the unbounded module derived tensor with its flat model; §S.1 at `:955` supplies the first-quadrant sequence and low-degree consequences. The newly added sign dictionary matches its lines 957–965.
- StableHomotopyKTheory §7.22, `TauCetiRoadmap/StableHomotopyKTheory/README.md:2618`, supplies the bigraded exact-couple carrier and derived couple, with the degrees used here.
- ArithmeticGaloisDuality #858, §D7.1's *Derived composite spectral sequence*, `TauCetiRoadmap/ArithmeticGaloisDuality/README.md:4871`, supplies the object case; lines 4885–4891 specify exactly the injective/Cartan–Eilenberg construction assumed in the contract.
- ArithmeticStatisticsPartVIII §5.16, `TauCetiRoadmap/ArithmeticStatisticsPartVIII/README.md:889`, owns the graded, possibly noncommutative Tor balance and sequences. Its hypotheses and internal grading differ from the ungraded commutative-ring specializations here. It is an ownership exclusion, not an upward prerequisite.
- SchemeKTheoryOperations #1229 §6.7 owns the group hyperhomology application; its native bicomplex supplier row is at `TauCetiRoadmap/SchemeKTheoryOperations/README.md:56`. TopologicalSheafCohomology main §1.4 at `:164` owns the cover/refinement and Čech-derived comparisons, with its two filtrations. Neither generic group homology nor Čech comparison is replanned here.
- AlgebraicTopology main §5.1, `TauCetiRoadmap/AlgebraicTopology/README.md:1888`, owns the singular-chain Künneth sequence. DGFloer Layer 1 item 2, `TauCetiRoadmap/DGFloer/README.md:559`, owns the local-system and product-filtered Serre construction; its Leibniz and abutment clauses occur at lines 605–614. These remain application-specific constructions.
- SchemeAndStackFoundations main §§2.2,2.7,2.15 resolve at `TauCetiRoadmap/SchemeAndStackFoundations/README.md:4186`, `:4435`, `:4926`, including the four named Leray, Čech, supported and Galois-covering sequences. ArithmeticLocallySymmetricSpaces ALS.1.7 at `TauCetiRoadmap/ArithmeticLocallySymmetricSpaces/README.md:2087` supplies the arithmetic coefficient-change instance with its finite-projectivity hypothesis.
- All twenty base sections in the plan exist in the board design: §§1.3–1.4,2.1–2.2,3.1–3.6,4.3,5.1–5.4,6.1–6.3,7.4–7.5. In particular, §4.3 distinguishes the canonical subquotient comparison from an arbitrary isomorphism, and §7.5 includes the regularity and half-plane conditions actually used here.

The supplied overlap file reports no conflicting head, dropped cited id, revision-only cited id or second copy. Current reads confirm the cited ownership boundaries; no new overlap finding arose. No missing package claim was made without reading the board-package index.

Overlap check: read SchemeKTheoryOperations, DerivedInfinityCategories, EnhancedDerivedSheaves, AlgebraicTopology (main and both listed revision heads), DerivedModuleAlgebra, TopologicalSheafCohomology, GrothendieckEulerForms; owners of shared special cases are SchemeKTheoryOperations §6.7 (group hyperhomology), AlgebraicTopology §5.1 (singular Künneth), DerivedModuleAlgebra §§0.2,S.1 (derived tensor and first-quadrant double complexes), TopologicalSheafCohomology §1.4 (Čech hypercohomology); GrothendieckEulerForms supplies exact-category infrastructure through Tau Ceti; no competing generic owner found in DerivedInfinityCategories or EnhancedDerivedSheaves.

### Supplier order, shape and headline acceptance tests

The dependency command specified in the brief produced:

```text
candidate: SpectralSequencesAndConvergencePartII is not in the merge order yet; checked as if placed after ArithmeticGaloisDuality (the intake inserts it when its design is accepted)
depcheck: 240 roadmaps, 2177 edges, 0 problem(s)
```

No UPWARD or CYCLE line. All 24 target-level Needs lists and six layer dependency summaries were read. Internal build order follows the declared prerequisites: 1.3 uses total/filtration constructions; 2.3 uses 2.1; 2.4–2.5 use 1.3 and 2.2–2.3; 3.1–3.3 use the hypercohomology theory; 4.3 uses 2.6 and 4.1; 4.4 uses Layers 3–4; 5.3 uses 1.1–1.2 and 5.2; 6.2 uses 6.1 and 5.2 for products. There are no declared gaps. The base's pending board status is reported to humans below; the gate does not establish its acceptance or merge order.

Main-branch shape examples read were DerivedModuleAlgebra, TopologicalSheafCohomology and GrothendieckEulerForms. This design has the requested opening, ownership, conventions, exact contracts, build paragraph, mathematical layers, prose APIs, Checks, Examples, Dependencies, consumers and references. Its own construction names in the README are mathematical notation, not a list of undeclared advertised Lean identifiers. The plan is an API catalogue, as appropriate for design; it is not presented as `Suggested.lean`. No LaTeX delimiters, machine paths, PR numbers or hand-off directives occur in the README.

Headline results from the Summary are: the totalisation/convergence/comparison and acyclic assembly theorems; horseshoe and Cartan–Eilenberg resolutions; the native/classical derived-functor comparison; the two hypercohomology sequences and their duals; the composition criterion and complex Grothendieck sequence; Tor balance; universal-coefficient, Künneth and change-of-rings sequences; pairings and Leibniz rules; and higher Bocksteins with limit-page and convergence calculations. These are all explicit targets in the plan. Tor balance and the native/classical derived-functor comparison are statable with the pinned carriers; the package must state them rather than provide boundary-case substitutes. No package-stage omission is asserted against this design.

Lean form, import/header check, elaborated binder comparison and one-tactic probe: **not available (this lane does not elaborate)**. There is no `Suggested.lean` and therefore zero sorried theorems to probe. This is not a passing Lean build and does not certify a future package's signatures or absence of padding.

### Wording, arrangement and reuse

Twenty-one passage comparisons were made across the seven readable works: the thirteen text-readable sampled sections, six additional sections listed above, the convention paragraph, and the Douady exclusion. Formula/hypothesis lists agree where the mathematics forces them; no distinctive copied prose or clause-by-clause translation was identified. No table, figure, source exercise list or external formalization was reused.

Counting explicit source-key citation occurrences in the README before References gives 77: stacks-05QI 15, grothendieck1957 14, stacks-012K 11, weibel1994 11, may-primer 10, stacks-more-algebra 7, cartan-eilenberg1956 5, mccleary2001 2, hatcher-at 1, massey1954 1. The largest source's contents were read at stacks-05QI line 7–44. The relevant mapping is 2.1 ↔ §18, 2.2 ↔ §16, 2.3–2.5 ↔ §21, 2.6 ↔ §19, 3.1–3.2 ↔ §22. This is not a run in source order. The distinct totalisation, ring applications, products and Bockstein layers serve the stated end theorems and draw on other sources. The dependencies above explain the ordering within each construction; no source-chapter heading or claim to follow a source's arrangement appears.

Source independence: 21 passages compared with 7 readable sources, no copied expression identified; largest share stacks-05QI, 15 of 77 explicit citation occurrences; contents compared with stacks-05QI: independent. Text and contents comparisons against weibel1994, mccleary2001, cartan-eilenberg1956 and massey1954 were not possible because those entries are settled as uncertified.

## Not verifiable

- The text of weibel1994, mccleary2001, cartan-eilenberg1956 and massey1954 was not available legally in this lane. Their existing uncertified status is settled; none was fetched again or placed in a missing-reference request. In particular, 4.1 and 5.3 have mathematical checks but not source-text certification, and the Weibel locator for the lifting clause of 2.3 remains unverified.
- The base is presently readable as `packages/SpectralSequencesAndConvergence/design/README.md`, not as an admitted supplier on main or in the merge order. Its statements were checked; its future acceptance and order were not certified by this review.
- Lean elaboration, warning output, `#check` binder comparison, one-tactic padding checks and future headline coverage cannot be tested without a package `Suggested.lean`; this lane does not elaborate.
- Ownership checks cover the main repository, the board files and the tool's indexed open heads. They do not certify later changes to those heads.

## Source issues

- **Misprint** in may-primer at Proposition 4.1, printed p.7 (line 267–268): the source says the derivation equivalence with index n−1 without restricting n; it should be stated for n≥1; affects a stated result.
- **Misprint** in may-primer at Example 2.3, printed p.4 (line 162): the source says a free integral summand contributes ℤ on every mod-p Bockstein page; it should be 𝔽_p on every page; affects a stated result.

## For the human reviewers

- **Order:** The base `SpectralSequencesAndConvergence` is a board design. It must be accepted and placed before this Part II; the clean gate output does not check that pending supplier.
- **Not tested:** Four settled uncertified works—Weibel, McCleary, Cartan–Eilenberg and Massey—could not be compared for wording or arrangement. The largest citation source, stacks-05QI, was readable and its contents were compared.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "c590ef8dd1e90dd8114c467de2aadce0cc830c79", "job": "REV-DESIGN-SpectralSequencesAndConvergencePartII~2", "model": "gpt-6-astra", "worker": "chris-10"} -->
