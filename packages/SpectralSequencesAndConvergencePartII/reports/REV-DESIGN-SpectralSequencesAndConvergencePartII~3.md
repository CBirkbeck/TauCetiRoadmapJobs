<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/14773#issuecomment-6862938793 -->
Review (codex) of 33aeacd

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) Degree-zero Tor requires a further exactness hypothesis

   **Location.** `packages/SpectralSequencesAndConvergencePartII/design/README.md:1009`: “In degree `0` both sides are the tensor product”. Also `packages/SpectralSequencesAndConvergencePartII/design/plan.json:925`, the `degree_zero` Check. The standing hypotheses are at README lines 989–991.

   **Claim.** Exactness of tensoring with projective objects suffices for both zeroth derived tensor functors to equal the original tensor functor on arbitrary objects.

   **Witness.** `Mathlib/CategoryTheory/Abelian/LeftDerived.lean:338,359` requires `PreservesFiniteColimits F`. In the finite-module example below, both derived degree-zero values have dimension 1; the original tensor value has dimension 2.

   Here is a counterexample satisfying the stated monoidal hypotheses. Put `k = 𝔽₂`, `R = k[x,y]/(x²,y²)`, and work in the abelian category of finite-dimensional `R`-modules. With `D = Hom_k(−,k)`, transport tensor through the contravariant duality to obtain

   `U ⋆ V = D(DU ⊗_R DV)`, with unit `DR`.

   This is a symmetric biadditive monoidal structure. The coefficient of `xy` in a product gives a nondegenerate pairing on `R`: its matrix in the basis `1,x,y,xy` is the reverse identity. Thus `DR ≅ R`. The ring is local, finite projectives are free, and their duals are free. Consequently `P ⋆ −` and `− ⋆ P` are exact for every projective `P`. This category has projective resolutions, so all the hypotheses of §4.1 hold.

   Take `X = R/(xy)` and `Y = k`. Naturally `U ⋆ k ≅ soc(U)`. Therefore `X ⋆ k = span_k(x,y)` has dimension 2. The presentation `R →(×xy) R → X → 0`, after applying `− ⋆ k`, becomes `k →(0) k`, so `Tor′₀(X,k) = k`. Resolving `k` by a presentation `R² →(x,y) R → k → 0` gives `Tor₀(X,k) = X/(x,y)X = k`. Balance holds, but the additional identification with `X ⋆ k` fails. These are computations of cokernels, so no higher part of either resolution is needed.

   **Exact repair.** Replace the degree-zero Check in both files by: “If tensoring with every object in either variable preserves finite colimits, then `Tor₀ ≅ Tor′₀ ≅ ⊗` by `Functor.leftDerivedZeroIsoSelf`; in particular this holds in `ModuleCat R` for every commutative ring `R`.” Keep the balancing theorem at its existing generality. Include the dual-tensor example as a negative-control Check, or explicitly scope this Check to ordinary module tensor products.

   **Repair test.** The quotient `R → X` induces the zero map `soc(R) = k·xy → soc(X) = kx ⊕ ky`, which is not epic. Thus the counterexample fails the added right-exactness hypothesis. For ordinary tensor over `ℤ`, both degree-zero values and `(ℤ/4) ⊗ (ℤ/6)` equal `ℤ/2`, as the repaired Check requires.

One finding, P2: the degree-zero Check in §4.1 needs right exactness of tensoring with arbitrary objects. The balancing theorem itself survives this counterexample. Both findings from the previous review are repaired. This is a design review; no Lean elaboration is available in this lane.

## Verified sound

### Previous findings and changed passages

The previous review's F01 and F02 were checked individually, including their repair report. Neither was marked not actionable. No maintainer notes were supplied.

| Previous finding | Repaired passage | Verification | Status |
| --- | --- | --- | --- |
| F01, Massey index shift | README 1164–1174: “for every `m ≥ 0`, `φ` satisfies `μ_{m+1}` if and only if the induced pairing `φ′` … satisfies `μ_m`” | For the `ℤ →(×4) ℤ` couple, `μ₀(φ)` is true, `μ₁(φ)` false and `μ₀(φ′)` false. The repaired endpoint is false iff false. The converse's correction `c − k(z)` preserves `iⁿc` because `n ≥ 1` and `ik = 0`. | Repaired in README and plan, including the new Check. |
| F02, cocycle versus cochain | README 1326–1329: “a cochain `u ∈ Mⁿ` whose reduction modulo `f^r` is a cocycle has `du = f^r w`” | For `ℤ →(×p^r) ℤ`, `u = 1`, `du = p^r`, `w = 1`, and `β_r(1) = 1`. An actual cocycle would give `w = 0`. Termwise injectivity gives uniqueness and `dw = 0`. | Repaired in README and plan, including the extended Check. |

I reread the changed statements, proof routes and Checks, not just the replacement sentences. Searching the rest of both files found no remaining `μ_{n−1}` endpoint error or use of an actual cocycle to represent a nonzero higher Bockstein. The other subtractions occur with integer cohomological degrees or with `r ≥ 1`. The filtered-pairing route in §5.2 already uses a representative whose differential lies in a deeper filtration, rather than an actual cocycle.

The design has six layers, 24 targets and 87 plan Checks. All target statements, hypotheses, routes, API bullets and Checks were read. The earlier review's computed rows were usable for unchanged targets; its uncomputed summaries were not treated as evidence. The table below records the sampled targets, the headline constructions, the changed targets and R01. Related assertions are grouped by the explicit instance, rather than reproducing all 87 Checks.

### Computed adversarial pass

Here `k = 𝔽_p`, and `C_a` denotes `ℤ →(×p^a) ℤ` in cohomological degrees 0 and 1. Every assertion of equality below records the two values or the map giving the equality. Zero and identity cases were also checked throughout. The tests of primes use both 2 and 3 where applicable.

| Statement | Instances tried | Computed sides or maps | Result / change |
| --- | --- | --- | --- |
| Conventions; §1.1 total differential and flip | Unit square of copies of `ℤ`; isolated column 1 with `×2` | `d(1) = (1,1)` and `d²(1) = −1+1 = 0`; unsigned sum gives 2. Column differential is `−2`, with cokernel `ℤ/2`; flip components are `+1,−1`. | Signs distinguish the wrong total and agree with the pin. |
| §1.1 sum versus product totals | Staircase `D_p = K^{p,−p}`, `O_p = K^{p+1,−p}`, all `ℤ` | Kernel equation is `x_p − (−1)^p x_{p+1} = 0`. Finite support forces every `x_p = 0`; products allow `(1,1,−1,−1,…)`, giving `H⁰ = ℤ`. | Sum has `H⁰ = 0`, product `H⁰ = ℤ`; no conflation of the two totals. |
| §1.2 pages and sign dictionaries | Horizontal `ℤ →(×2) ℤ`; vertical `×2` in column 1 | Column `d₁ = +2`, `E₂^{0,0}=0`, `E₂^{1,0}=ℤ/2`. Row differential here is `+2`; Stacks has `−2`, conjugated by `(+1,−1)`. Native position has total degree `(2p+q+1)+(-p-1)=p+q`. | Both dictionaries checked. With `d″=(−1)^p d₂`, the anticommutator is `1−1=0`, not 2. |
| §1.3 finite convergence and weak Serre conditions | Horizontal `×2`; `ℚ → ℚ/ℤ`; zero complex | First example: `F¹H¹=ℤ/2`, `F²H¹=0`, so `gr¹=ℤ/2=E∞^{1,0}`. Second: `E₁^{0,0}=ℚ`, but `E₂^{0,0}=H⁰=ℤ`; `E₁^{1,0}=ℚ/ℤ`. Zero gives all groups 0. | All-position and page hypotheses exclude the weak-Serre counterexample. |
| §1.3 half-plane convergence | Staircase and supports `q ≥ a` or `q ≤ b` | In total degree `n`, support satisfies respectively `p ≤ n−a` or `p ≥ n−b`. Staircase row sequence gives sum abutment 0; column sequence gives product abutment `ℤ`. | Bounds and choice of filtration prevent the two erroneous opposite abutments. |
| **§1.4 comparison of totals** | Staircase projection onto column 0; identity | Projection is a column quasi-isomorphism. Product totals induce `ℤ → ℤ`, identity on the kernel generator; sum totals give `0 → ℤ`. Identity induces identity on both totals. | The product case meets the bound; the failed sum case does not. |
| §1.5 acyclic assembly and augmentation | Same staircase with exact rows; horizontal identity; injective resolution | Sum `H⁰=0`, product `H⁰=ℤ`; horizontal identity has kernel and cokernel 0; resolution augmentation induces `A → H⁰(I)=A`, identity. | Bounds are necessary; augmented route gives the claimed quasi-isomorphism. |
| **§2.1 horseshoe** | `0 → ℤ →(×2) ℤ → ℤ/2 → 0`; split sequence | Correct middle resolution has `H⁰=ℤ`; untwisted sum has `ℤ ⊕ ℤ/2`. In the split case, `α ⊕ β` induces the prescribed endpoint maps. | Twisting cannot be omitted. |
| **§2.1 relative horseshoe** | Resolutions `ℚ/ℤ →(×2) ℚ/ℤ`; shear with `h⁰=id,h¹=0` | At `(u,v)=(0,1/4)`, transported differential gives `(1/2,1/2)` versus `(0,1/2)`. The shear intertwines the differentials; the identity does not. For constant `h=id`, differential discrepancy is 0 but augmentation discrepancy is `ε₃c`. | Both the off-diagonal component and augmentation compatibility are tested. |
| §2.2 derived-functor comparison, left exactness, Leray | `F=Hom(ℤ/2,−)`, `A=ℤ`; `F=−⊗ℤ/2`; exact functor | Resolution `ℚ→ℚ/ℤ` gives `R⁰Hom=0`, `R¹Hom=ℤ/2`, equal to classical Ext. For tensor, both resolved terms are 0, so `R⁰F(ℤ)=0` whereas `F(ℤ)=ℤ/2`. Exact functor gives higher values 0. | Correct comparison and negative control for `F→R⁰F`. Acyclic resolution computes the same two groups. |
| **§2.3 Cartan–Eilenberg condition** | `K=ℤ→(×2)ℤ`, columns `ℚ→ℚ/ℤ`; `K=A→(id)A`; single object | Columnwise resolutions have horizontal `H¹=0` in both degrees, so do not resolve `H¹K=ℤ/2`. Identity complex has `Z⁰=0`, `B¹=A`, `H=0`; single object has `Z⁰=H⁰=A`, boundaries 0. | The CE laws exclude mere column resolutions; split and single-object models satisfy them. |
| **§2.4 first hypercohomology sequence** | `Hom(ℤ/2,−)` on `ℤ→(×2)ℤ`; acyclic terms; single object | `E₁^{0,1}=E₁^{1,1}=ℤ/2`, differential 0; abutment has `R¹=R²=ℤ/2`, agreeing with `Ext^{n−1}(ℤ/2,ℤ/2)`. Acyclic terms give only row 0; a single object only column 0. | Pages, total degrees and Leray collapse agree. |
| **§2.5 second hypercohomology sequence** | Same complex and functor; identity functor on the non-CE resolution | Correct `E₂^{0,1}=E₂^{1,1}=ℤ/2`, with abutment in degrees 1 and 2. Non-CE resolution instead places the identity-functor class at `(1,0)`; prescribed `R^p id(H^qK)` places it at `(0,1)`. | Same total degree alone does not determine the filtration; CE hypothesis is effective. |
| **§2.6 opposites and left-derived forms** | `K=ℤ→(×2)ℤ` in degrees `−1,0`, tensor with `ℤ/2` | Opposite complex is in degrees `0,1`, with `H⁰=op(ℤ/2)`, `H¹=0`. Tensor-derived values are `L₀=L₁=ℤ/2`; homological differential has degree `(−r,r−1)`. | Degree reversal matches the source and the native opposite equivalence. |
| **§3.1 composition criterion, both directions** | `F=G=Hom(ℤ/2,−)`, at injective `ℚ/ℤ`; identity; injective direct summand | Composite-derived `R¹=0` at the injective, but `H¹(RG RF)=Ext¹(ℤ/2,ℤ/2)=ℤ/2`. Identity gives identical derived functors. If injective `I` embeds in `J`, the embedding splits; higher `G(FI)` is a summand of higher `G(FJ)=0`, hence 0. | Counterexample excludes missing acyclicity; the split-summand argument verifies the converse of the effacement condition. |
| §3.2 complex composite sequence | Coextension along `ℤ/4→ℤ/2`, then `Hom_{ℤ/2}(ℤ/2,−)` | `R^qF(ℤ/2)=ℤ/2` for every `q≥0`; exact second functor gives `E₂^{0,q}=ℤ/2`, other columns 0; abutment `Ext^q_{ℤ/4}(ℤ/2,ℤ/2)=ℤ/2`. | Page and abutment agree; the failed pair of §3.1 would instead force `0=ℤ/2`. |
| **§3.3 low degrees and naturality** | Same coextension; exact `F`; identity transformations | Five terms are `0→0→ℤ/2→(id)ℤ/2→0→ℤ/2`; successive image/kernel values are 0, 0, `ℤ/2`, 0. For exact `F`, positive rows vanish. Identity transformations give identity on `E₂` and abutment. | Correct five-term sequence and `m=1` endpoint; low degrees are imported from base §3.6. |
| §3.4 mixed variance | Extension `ℤ→ℤ/2`, then `Hom_{ℤ/2}(−,ℤ/2)`; incorrect second functor `Hom_ℤ(−,ℤ)` | First example has `E₂^{0,0}=E₂^{0,1}=ℤ/2`, matching `Ext⁰_ℤ=Ext¹_ℤ=ℤ/2`. Incorrect pair has composite 0 but `Ext¹_ℤ(ℤ/2,ℤ)=ℤ/2`. | Projective-acyclicity hypothesis excludes the latter. |
| **§4.1 positive-degree Tor balance and Ext Check** | `ℤ/4,ℤ/6`; projective first input; `Ext¹(ℤ/2,ℤ)` | Kernels `{0,2}⊂ℤ/4` and `{0,3}⊂ℤ/6` both give `ℤ/2`. Projective resolution length 0 gives higher values 0. Projective and injective Ext resolutions both give `ℤ/2`. | Balance and imported Ext calculation agree. |
| **§4.1 degree-zero Check; R01** | Dual tensor on finite modules over `𝔽₂[x,y]/(x²,y²)` | `Tor₀(R/(xy),k)=k`, `Tor′₀(R/(xy),k)=k`; original tensor is `soc(R/(xy))=k²`. The map `soc(R)→soc(R/(xy))` is 0. | False without right exactness. R01 scopes the Check, preserving the general balance theorem. |
| **§4.2 Tor universal coefficients, including unbounded complexes** | `ℤ/2[0]` and `⊕_{n∈ℤ}ℤ/2[n]`, tensor with `ℤ/2` | First example has `E₂^{0,0}=E₂^{−1,0}=ℤ/2`, giving `H⁰=H^{−1}=ℤ/2`. In the unbounded example each total degree receives exactly two `ℤ/2` contributions, so `H^n=(ℤ/2)²`. | Half-plane route supports the stated unbounded extension beyond the bounded-above source example. |
| **§4.2 Ext forms and hereditary collapse** | Homological `ℤ→(×2)ℤ`, target `ℤ`; injective target | `Hom(ℤ/2,ℤ)=0`, `Ext¹(ℤ/2,ℤ)=ℤ/2`; direct Hom complex gives `H¹=ℤ/2`. Injective target makes every positive Ext column 0. | Contravariant degree and short-exact-sequence orientation agree with the pin. |
| §4.3 Künneth sequence | Dual numbers `R=k[ε]/ε²`, `K=L=k[0]`; unit; upper bounds `a,b` | `Tor_i(k,k)=k` for every `i≥0`, so `E₂^{p,0}=k` for all `p≤0`, and `H^{−i}=k`. Unit gives `E₂^{0,q}=H^qL`. For total degree `n`, `n−a−b≤p≤0`; for `i+j=q`, `q−b≤i≤a`. | No general two-column collapse; finite intervals justify finite filtrations for bounded-above inputs. |
| **§4.4 change of rings (Tor)** | `ℤ→ℤ/4`, `M=N=ℤ/2` | `E²_{p,q}=ℤ/2` for all `p≥0`, `q=0,1`. Abutment is `ℤ/2` only in degrees 0,1; hence `d²:(p,0)→(p−2,1)` is an isomorphism for each `p≥2`. | Nonzero differential distinguishes the asserted abutment from the raw page. |
| **§4.4 change of rings (Ext and mixed)** | `ℤ/4→ℤ/2`; `ℤ→ℤ/2`; identity ring map | Coextension gives only column 0 with every `Ext^n_{ℤ/4}=ℤ/2`; mixed form gives `ℤ/2` in degrees 0,1 only over `ℤ`. Identity map has higher extension/coextension terms 0 and leaves the usual Ext or Tor group. | All three orientations and adjunctions agree. |
| **§5.1 μ₀ iff Leibniz; derived shift** | `C₂`, `p=2`, product only in total degree 0; stupid filtration of `×2` | For `C₂`, `k(1)=2`, `d₁=0`, so `μ₀` is true. For `μ₁`, every `2c=2` has `j(c)=1` versus required 0; for the derived pairing `d₂(1·1)=1` versus 0. Stupid filtration gives `2` versus `0`, so `μ₀` is false. | Repaired shift gives false iff false; the wrong endpoint gives true iff false. |
| **§5.1 iteration and converse correction** | `C_a`, `a≥2`, primes 2,3; zero pairing; free Bockstein couple | `p^n c=p^{a−1}` has a solution only for `n≤a−1`; its reduction forces failure exactly at `n=a−1`. Derived failure is exactly `m=a−2`. Zero pairing takes `c=0`; in the free couple `p^na=0` forces `a=0`. | Both directions agree for every `m≥0`; `iⁿk=0` for positive `n` validates the boundary correction. |
| **§5.2 filtered products** | `𝔽₂[x,y]/x²`, `dx=y`, powers of `(y)`; trivial and zero filtrations | `d(x²)=2xy=0`. `d₁(xy^p)=y^{p+1}` and `d₁(xy)=y²=d₁(x)y+xd₁(y)`. Only `1` survives, giving `E₂=k=H(A)`. Trivial filtration gives `E₁=H(A)`, all later differentials 0; zero complex gives 0. | Leibniz, initial pairing and limiting pairing agree; filtration compatibility excludes arbitrary products. |
| §5.3 double-complex products | Odd `p′`, `x=1⊗b`, `y=a′⊗1`; two odd exterior generators | Correct vertical coefficient is `(−1)^{qp′}`; omitting `(−1)^{p′}` gives `(−1)^{(q+1)p′}`, its negative. Opposite orders of odd generators give `ε⊗ε` and `−ε⊗ε`. Flip discrepancy is exponent `(p+p′)(q+q′)−pq−p′q′ = pq′+p′q`. | Vertical rule, total-degree Leibniz sign and flipped pairing are mutually consistent. |
| **§6.1 exact couple and first differential** | `C₁`, `C₂`; `ℤ[0]`; `ℤ/p[0]` | For `C₁`, `k(1)=1`, `d₁(1)=+1`; for `C₂`, `k(1)=p`, `j(p)=0`. Free complex has `k=0`, pages `k`. On `ℤ/p[0]`, multiplication by `p` is 0 and not monic. | Sign and necessity of termwise injectivity checked. |
| **§6.1 general coefficient ring** | Product ring `A=ℤ×ℤ`, `f=(p,0)`, complex supported on first factor | `f` is a zero divisor on `A`, but acts as injective `×p` on each term. Quotient terms, connecting maps and `d₁` equal those over `ℤ`, in particular `d₁=+1` for `C₁`. | Correct generalisation: injectivity on terms suffices; no ring-wide non-zero-divisor assumption is necessary. |
| **§6.2 higher Bocksteins and universal coefficients** | `C_a`, `r=1,…,a+1`, primes 2,3 | `E_r⁰=E_r¹=k` for `r≤a`, then 0; `u=1`, `du=p^a`, `w=p^{a−r}`. Thus `β_r(1)=0` for `r<a`, and `β_a(1)=1`; `k(1)=p^{a−1}[1]`. | Corrected cochain condition gives the nonzero differential on exactly page `a`; stabilisation is page `a+1`. |
| **§6.2 towers and absence of finite stabilisation** | `⊕_{a≥1} C_a` | Each `E_r⁰=⊕_{a≥r}k` is nonzero, but `⋂_r p^r(⊕_a ℤ/p^a)=0`, so `Z∞⁰=E∞⁰=0`, equal to localised `H⁰=0`. | Limit page need not equal any finite page. |
| **§6.2 convergence iff, both outcomes** | Inclusion `ℤ→ℤ[1/p]`; `ℤ[0]` | Inclusion: `H¹=ℤ[1/p]/ℤ`, intersection of all `p^rH¹` is `H¹`, its `p`-torsion is `k`; `E∞⁰=k` whereas localised `H⁰=0`. Free case: obstruction 0, `gr^s=k=E∞⁰`, and intersection of positive powers in `ℤ` is 0. | The stated obstruction distinguishes failure and success, and separation distinguishes convergence from mere weak convergence. |
| **§6.2 degeneracies and Hatcher comparison** | Unit `f`; `f=0` under termwise injectivity; free, `ℤ/p`, `ℤ/p²` cohomology summands | Unit gives quotient and every page 0, graded pieces 0. For `f=0`, injectivity forces all terms 0. On page 2: a free summand gives one `k`; a `ℤ/p` summand gives 0; a `ℤ/p²` summand gives two copies in adjacent degrees. | Junk values excluded or computed; matches Proposition 3E.3, including its finite-generation hypothesis. |

The dual-tensor calculation in R01 was also checked by enumeration over `𝔽₂`: the socle of `R` has two elements, the socle of `R/(xy)` has four, and multiplication by `xy` on the former is zero. The mathematical witness above explains why those finite calculations compute the derived functors and why all the category hypotheses hold.

### Source sample and proof-route support

All 15 seeded targets were addressed. Four works remain settled as uncertified; their locators were retained, not guessed or fetched again. There are no additional unresolved source flags. Every cited work has its existing manifest key; no entry was changed. Cached page numbers were distinguished from printed page numbers, particularly for Hatcher.

| Seeded target | Source inspected at its locator | What the text supports and limits |
| --- | --- | --- |
| 1.4 Comparison of totals | stacks-012K line 3241–3315, §25, pp. 67–69; base §3.5; pinned Tau Ceti comparison | Stacks gives finite-diagonal convergence and augmentation. General comparison uses the base's theorem with the stated sum/product half-plane hypotheses; it is not claimed to be Stacks's unrestricted theorem. Weibel's supplementary locator is uncertified. |
| 2.1 Horseshoe resolutions | stacks-05QI line 3269–3448, Lemmas 18.4, 18.6, 18.7, 18.9, pp. 65–68 | Bounded-below injective complexes, lifting, homotopies, prescribed first resolution and bounds are present. The relative form is a derived route using these facts and split/injective extensions, not a quotation of Lemma 18.9. The source's misindexed proof display is recorded below. |
| 2.3 Cartan–Eilenberg resolutions | stacks-05QI line 3621–3689, §21, pp. 72–74 | Resolution conditions on terms, cycles, boundaries and cohomology; existence and split rows. This rules out the column-only model in the Check. No uniqueness up to double-complex homotopy is imported. |
| 2.4 First hypercohomology sequence | stacks-05QI line 3660–3689, Lemma 21.3, pp. 73–74; grothendieck1957 line 1226–1303, §2.4, pp. 146–147 | Termwise-derived first page and abutment under bounded-below and left-exact hypotheses. Naturality/independence uses the explicit lifts and page comparison, rather than an unsupported uniqueness assertion. |
| 2.5 Second hypercohomology sequence | Same §21 and Grothendieck §2.4 locators | Iterated-derived second page and its abutment. CE split sequences justify applying an additive functor to row cohomology. Descent from page 2 uses the second-page isomorphism and the base comparison machinery. |
| 2.6 Right exact and contravariant functors | grothendieck1957 line 1304–1308, p. 147; stacks-05QI line 3449–3478, §19, pp. 68–69 | Dualisation and projective resolutions support the route. The roadmap states its degree reversal explicitly, and native `opEquivalence` gives the claimed cohomology reversal. |
| 3.1 Composition of right derived functors | stacks-05QI line 3696–3717, Lemma 22.1, pp. 74–75; grothendieck1957 line 1330–1347, Theorem 2.4.1 and Remarks 1–2, pp. 147–148 | Injective-to-acyclic criterion and composition comparison; effacement gives the equivalent condition. The direct-summand argument above checks the reverse implication. |
| 3.3 Low degrees and naturality | grothendieck1957 line 1330–1360, Theorem 2.4.1 and Remarks, pp. 147–148; base §3.6 | Grothendieck supplies the sequence, not an independently attributed five-term theorem. The five-term and `m≥1` versions come from the base; naturality is built from the two transformations and the hypercohomology construction. |
| 4.1 Balancing Tor | weibel1994 Theorem 2.7.2, uncertified; native Tor and total-augmentation declarations | Cannot certify the textbook's theorem/page. The two projective resolutions and exactness with projective factors support balance independently. The extra degree-zero Check fails by R01. |
| 4.2 Universal coefficients | stacks-more-algebra line 7121–7134, Example 63.1, pp. 153–154; line 7413–7422, Example 65.5, p. 160; line 8115–8127, §69, p. 176 | Source tensor example is bounded above, explicitly acknowledged. The unbounded tensor claim uses the stated half-plane/K-flat route. Ext forms retain the source's cohomological bounds and derived-Hom interpretation. |
| 4.4 Change of rings | stacks-more-algebra line 7135–7140, Example 63.2, p. 154; native scalar-change adjunctions | Tor base change is present. The two Ext forms are derived from the separately stated composition/mixed-variance targets; coextension preserves injectives because restriction is exact. Supplementary textbook locators remain uncertified. |
| 5.1 Pairings of exact couples | may-primer line 249–287, §4, Proposition 4.1 and Corollary 4.2, pp. 6–7 | Massey conditions, derived pairing and Leibniz. The repaired statement supplies the positive index needed by the source's proof. Massey's original article remains uncertified. |
| 5.2 Pairings of filtered complexes | may-primer line 295–324, §4, pp. 7–8 | Filtered products induce the exact-couple conditions and page pairings. The roadmap ties the limit assertion to the base's canonical comparison; it does not identify arbitrary weak-convergence isomorphisms with products. |
| 6.1 Bockstein exact couple | may-primer line 136–150, Example 2.3, p. 4; stacks-more-algebra line 12960–13014, §97 and footnote 18, pp. 280–281 | Exact-sequence construction, Bockstein operators and localised filtration. The weaker ring hypothesis in the roadmap is justified by termwise injectivity, tested above. |
| 6.2 Pages, higher Bocksteins and limit | may-primer line 147–168, Example 2.3, p. 4; hatcher-at line 13324–13337, Proposition 3E.3, printed p. 305; base §6.2 | Higher exact sequences and finitely generated examples. General tower formulas and the explicit obstruction to weak convergence follow from the base's exact-couple towers and the roadmap's kernel/image calculation. The source's free-summand slip was not inherited. |

Further source checks covered §1.1 totalisation, §1.2 row signs, §1.3 the two weak-Serre forms, §2.2 the derived-functor definition and acyclicity, §4.3 Künneth, and the exclusion of Douady's products of spectral systems. In particular, stacks-more-algebra line 7399–7412, Lemma 65.4, p. 160 states bounded inputs; §4.3 acknowledges that and gives a bounded-above CE route with finite intervals, computed above. Stacks §26 treats abelian groups; §1.5's categorical extension has its own named convergence and exactness inputs.

### Pinned declarations and ownership

The baseline hashes agree with `lake-manifest.json`: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Searches were by construction as well as identifier. These are representative opened declarations covering the routes and the claims of native ownership; line numbers refer to these pins.

| Library file and line | Opened declaration / relevant contract |
| --- | --- |
| `Mathlib/Algebra/Homology/HomologicalBicomplex.lean:38,137,150` | Iterated complex carrier, commuting differentials and flip. This carrier does not itself impose anticommutation. |
| `Mathlib/Algebra/Homology/TotalComplex.lean:46,266,273,349` | `HasTotal`, `total`, `ιTotal`, `totalDesc`: coproduct totalisation. The object search did not find the product totalisation planned here. |
| `Mathlib/Algebra/Homology/ComplexShapeSigns.lean:158,192`; `Mathlib/Algebra/Homology/TotalComplexSymmetry.lean:57,113` | Signs of the total and `totalFlipIso`, with the unit-square calculation above. |
| `Mathlib/Algebra/Homology/Bifunctor.lean:83,124` | Bifunctor double complex and total tensor of complexes. |
| `Mathlib/Algebra/Homology/Embedding/StupidTrunc.lean:36`; `Mathlib/Algebra/Homology/Opposite.lean:300`; `Mathlib/Algebra/Homology/CochainComplexOpposite.lean:80` | Stupid truncation, `homologyOp`, `opEquivalence`; opposites reverse degrees. |
| `Mathlib/Algebra/Homology/SpectralSequence/Basic.lean:36,51` | Native spectral-sequence object and morphisms, including compatibility with the next-page identification. |
| `Mathlib/Algebra/Homology/DerivedCategory/Plus.lean:142,155,218,226` | Singles, homology functor, isomorphism detection and quotient into `D⁺`. |
| `Mathlib/Algebra/Homology/DerivedCategory/RightDerivedFunctorPlus.lean:47,96,115,156` | Derived functor on `D⁺`, its unit, computation on injectives and natural transformations. The classical comparison is not supplied by these declarations. |
| `Mathlib/CategoryTheory/Abelian/RightDerived.lean:106,110`; `Mathlib/CategoryTheory/Abelian/LeftDerived.lean:105,109,338,359` | Classical derived functors and resolution computations; the extra `PreservesFiniteColimits` hypothesis for the degree-zero left-derived isomorphism is the R01 witness. |
| `Mathlib/Algebra/Homology/HomotopyCategory/KInjective.lean:42,134`; `Mathlib/Algebra/Homology/DerivedCategory/KInjective.lean:42` | K-injectivity and bounded-below injective criterion; `Qh_map_bijective` with derived-category assumptions. |
| `Mathlib/Algebra/Homology/DerivedCategory/DerivabilityStructureInjectives.lean:61`; `Mathlib/CategoryTheory/Abelian/Injective/Resolution.lean:95,170` | Injective replacement preserving a lower bound; resolution comparison map and comparison homotopy. |
| `Mathlib/CategoryTheory/Preadditive/Injective/Basic.lean:194,196,265,280` | Injective preservation by an adjoint with mono-preserving left adjoint; enough injectives on the opposite of a category with enough projectives. |
| `Mathlib/CategoryTheory/Monoidal/Tor.lean:38,44,50,61` | Native `Tor`, `Tor′` and vanishing with projective input. Definitions require monoidal preadditivity, not right exactness in each variable. |
| `Mathlib/CategoryTheory/Abelian/Injective/Ext.lean:40`; `Mathlib/CategoryTheory/Abelian/Projective/Ext.lean:39` | The two `extEquivCohomologyClass` constructions; Ext balance is correctly a Check, not a new target. |
| `Mathlib/Algebra/Category/ModuleCat/ChangeOfRings.lean:85,399,519,658,878` | Restriction, extension, coextension and the two adjunctions; commutativity restrictions for tensor extension are retained. |
| `TauCeti/Algebra/Homology/SpectralSequence/Filtered/SpectralObject.lean:304,409,425`; `TauCeti/Algebra/Homology/SpectralSequence/Filtered/Naturality.lean:83`; `TauCeti/Algebra/Homology/SpectralSequence/Filtered/FirstPage.lean:89` | Filtered construction, page carrier, naturality and first differential. |
| `TauCeti/Algebra/Homology/SpectralSequence/Comparison.lean:32`; `TauCeti/Algebra/Homology/SpectralSequence/Bicomplex.lean:410,442,446` | Page comparison and first-quadrant row/column constructions. Their indexing is distinguished from the classical page notation here. |
| `TauCeti/Algebra/Homology/TotalComplex.lean:580,596` | Row quasi-isomorphism comparison and exact-augmentation comparison, used in the Tor balance route. |
| `TauCeti/CategoryTheory/Exact/Abelian.lean:166`; `TauCeti/CategoryTheory/Exact/Injective.lean:165,426` | Abelian conflations, injectivity comparison and the one-step injective horseshoe. Full resolution horseshoes are an extension, not a duplicate of this one-step fact. |
| `TauCeti/Algebra/Homology/Monoidal/KFlat/Basic.lean:89,222,361` | K-flat predicate, tensor preservation of quasi-isomorphisms and bounded-above flat complexes. |
| `TauCeti/Algebra/Homology/Monoidal/Homology/Cross.lean:153`; `TauCeti/Algebra/Homology/Monoidal/Homology/Kunneth/Sequence.lean:729`; `TauCeti/Algebra/Homology/UniversalCoefficient/Basic.lean:180` | Cross product, Künneth short exact sequence and the middle exactness of the universal-coefficient sequence; the latter's other required mono/epi results were checked in the same file. |

The citation resolver reported no missing cross-roadmap identifiers. Its warning that it could not check the pinned Lean packages was not treated as a successful Lean-name check; the pinned files above were opened independently. No declaration in a nonexistent `Suggested.lean` is claimed by this report. The plan's proposed API identifiers describe future work, not an implemented Lean interface.

Roadmap ownership was checked on main, the supplied board index and the given open heads using the roadmap search/show tools. No second copy of this Part II exists on main. The overlap data reports no competing head modifying this roadmap, dropped cited id, id defined only by an open revision, or conflicting renumbering; the inspected scopes did not reveal an additional owner of the generic constructions.

| Roadmap and location inspected | Ownership resolved |
| --- | --- |
| `packages/SpectralSequencesAndConvergence/design/README.md:335,367,395,446,474,559,592,628,648,672,704` | Base §§1.2–1.4, 2.1–2.2, 3.1–3.6: regularity, limits, bidegrees, boundedness, filtrations, weak/strong convergence, morphisms, finite/Serre results, comparison and edge/five-term consequences. These are imported. |
| `packages/SpectralSequencesAndConvergence/design/README.md:823,963,992,1013,1039,1083,1118,1142,1185,1293,1363` | Base §4.3, §§5.1–5.4, §§6.1–6.3, §§7.1, 7.4–7.5: canonical comparison, classical filtered pages, induced filtration, finite and sum convergence, couples/towers, filtered couple, categorical hypotheses and complete convergence. All cited sections exist; base does not consume Part II. |
| `TauCetiRoadmap/DerivedModuleAlgebra/README.md:794,955` | §0.2 owns derived tensor; §S.1 owns first-quadrant second pages and low-degree consequences. Its anticommuting convention is translated explicitly, not silently identified. |
| `TauCetiRoadmap/StableHomotopyKTheory/README.md:2618` | §7.22 supplies the exact-couple construction with its degree data; products here are additional structure. |
| `TauCetiRoadmap/ArithmeticGaloisDuality/README.md:4871,4885`, open #858 | §D7.1 owns the object composite spectral sequence, using injective CE resolutions. Part II supplies the complex extension and comparisons, and imports the object case. |
| `TauCetiRoadmap/ArithmeticStatisticsPartVIII/README.md:889`, open #1179 | §5.16 owns graded-module Tor balance, universal coefficients and base change. This design explicitly excludes that graded carrier and owns the ordinary ungraded monoidal/module forms. |
| `TauCetiRoadmap/SchemeKTheoryOperations/README.md`, open #1229, scope and §6.7 | Group-action hyperhomology and scheme K-theory application stay there; no duplicate generic hypercohomology ownership. |
| `TauCetiRoadmap/DerivedInfinityCategories/README.md`, open #2270, scope; `TauCetiRoadmap/EnhancedDerivedSheaves/README.md`, open #1630, scope | Derived enhancements and enhanced sheaf categories respectively; native ordinary derived constructions are inputs, not a competing ownership of these generic sequences. |
| `TauCetiRoadmap/AlgebraicTopology/README.md:1888` on main, and the scopes at open #1807 and #1808 | §5.1 owns singular-chain Künneth; its free-chain, bounded-below application remains there. Neither revision supplies a conflicting generic Tor construction. |
| `TauCetiRoadmap/TopologicalSheafCohomology/README.md:164`; `TauCetiRoadmap/GrothendieckEulerForms/README.md:501` | Čech hypercohomology for its covers, and finite projective exact-category resolutions, respectively. Neither duplicates the arbitrary bounded-below injective CE construction here. |
| `TauCetiRoadmap/SchemeAndStackFoundations/README.md:4186,4189,4440,4926` | Named Leray, Čech, local-to-global and Galois-covering instances resolve in §§2.2, 2.7, 2.15. |
| `TauCetiRoadmap/DGFloer/README.md:559,605`; `TauCetiRoadmap/ArithmeticLocallySymmetricSpaces/README.md:2087`, open #871 | Multiplicative Serre application and coefficient change respectively; the design compares these applications, not their ownership. |

Overlap check: read SchemeKTheoryOperations, DerivedInfinityCategories, EnhancedDerivedSheaves, AlgebraicTopology (both listed open heads and main), DerivedModuleAlgebra, TopologicalSheafCohomology and GrothendieckEulerForms; owners of the shared instances are respectively group hyperhomology—SchemeKTheoryOperations §6.7; derived enhancements—DerivedInfinityCategories; enhanced sheaf categories—EnhancedDerivedSheaves; singular-chain Künneth—AlgebraicTopology §5.1; derived tensor and first-quadrant low-degree theory—DerivedModuleAlgebra §§0.2, S.1; Čech hypercohomology—TopologicalSheafCohomology §1.4; finite projective exact-category resolutions—GrothendieckEulerForms §3.5. The generic extensions specified here remain Part II's; the results/headings closest-roadmap list is empty.

### Supply direction, principles and shape

Every `*Needs:*` line and supplier contract was read. The four named roadmap suppliers resolve: the base, StableHomotopyKTheory, DerivedModuleAlgebra and ArithmeticGaloisDuality. The declared gap list is empty. Internal prerequisites move from totals and injective computations to hypercohomology, composites and ring specialisations, and from exact-couple pairings to filtered products and Bocksteins. No upward or cyclic supply was found. The exact dependency command returned:

```text
candidate: SpectralSequencesAndConvergencePartII is not in the merge order yet; checked as if placed after ArithmeticGaloisDuality (the intake inserts it when its design is accepted)
depcheck: 240 roadmaps, 2177 edges, 0 problem(s)
```

The absence of this design from the order is not a defect. The readable base design's acceptance/order status is a human coordination fact below, not an invented supplier-gap finding.

The scope extends the base rather than replanning convergence, and retains general abelian categories and general coefficient rings with explicit exactness and boundedness assumptions. No good-prime restriction, route-specific substitute, computational algorithm, sorry'd data or `set_option` occurs in the design. R01 concerns a Check whose generality outruns its named library input. The other source-specific generalisations have named mathematical routes; the source alone is not treated as an owner of a formal prerequisite.

For shape comparison I read the main roadmaps DerivedModuleAlgebra, TopologicalSheafCohomology and GrothendieckEulerForms. This design has the required summary, scope, conventions, supplier contracts, reading paragraph, mathematical layer titles, target prose, API lists, Checks, layer examples/dependencies, consumers and references. Each definition-bearing target has at least three Checks, including examples that exclude a plausible wrong model. No target-number catalogue, local machine path, PR number, HTML anchor, LaTeX delimiter or process hand-off was found in the roadmap prose. Source-status labels remain citation information. No other package or source file was edited by this review.

### Headline acceptance test and package-only checks

The summary's headlines are: both totalisations and their page/convergence/comparison/assembly theorems; horseshoe and CE resolutions; comparison of `D⁺` and classical derived functors; the two hypercohomology sequences and opposite forms; the composition criterion and complex composite sequence with low degrees/naturality; Tor balance and universal-coefficient/Künneth/change-of-rings sequences; pairings of couples/filtered complexes/bicomplexes; and Bockstein pages, higher operators, limit and convergence.

This package currently contains a design, not a `Suggested.lean`. Accordingly there are zero sorried theorems to probe and zero declaration signatures to inspect with `#check @name`. Lean elaboration: **not available (this lane does not elaborate)**. No passing build, warning count, one-tactic success or failure is asserted.

At least the native Tor-balance theorem and comparison between `rightDerivedFunctorPlus` and `rightDerived` have their carriers at the pins and must be considered as genuine acceptance-test statements at package stage. Spectral-sequence headline signatures requiring the base's new convergence/couple infrastructure cannot be replaced by free predicates or bounded examples. The package-stage module docstring must distinguish those missing interfaces from the native carriers that already exist. There is no present Lean padding or missing module-docstring finding to raise against a design-only delivery.

### Wording, arrangement and reuse

I compared 20 passage groups against seven readable works: the 14 seeded groups with readable supporting sources, five further sections (§§1.1, 1.2, 1.3, 2.2, 4.3), and the Douady scope exclusion. The comparison covered definitions, remarks, proof routes and Checks. No distinctive prose sentence or clause-by-clause paraphrase was found to reproduce a source; common text was mathematical notation, standard names and forced hypotheses. There is no Lean docstring to compare at this stage. No source table, figure, exercise list or data set is reproduced. The small examples are serving stated discrimination tests, not copying an exercise sequence.

Counting source-key occurrences before `## References` gives: stacks-05QI 15, grothendieck1957 14, stacks-012K 11, weibel1994 11, may-primer 10, stacks-more-algebra 7, cartan-eilenberg1956 5, mccleary2001 2, hatcher-at 1, massey1954 1: 77 citation occurrences. This counts a multi-result citation once when it has one source key.

The largest source, stacks-05QI, has its contents at lines 7–44. The roadmap is not a run through its sections: roadmap §2.1 uses source §18, §2.2 uses §16, §§2.3–2.5 use §21, §2.6 uses §19 and §§3.1–3.2 use §22. Totals, ring specialisations, products and Bocksteins have different supporting sources. The dependencies force totals before hypercohomology, hypercohomology before composites, and these before the ring specialisations; pairings precede multiplicative Bocksteins. The layer scopes are the constructions these conclusions need, not renamed source chapters.

Source independence: 20 passage groups compared with 7 readable sources, no copied expression or reused source material found; largest share stacks-05QI, 15 of 77 citation occurrences; contents compared with stacks-05QI: independent. Text and contents of the four settled uncertified works were not compared.

## Not verifiable

- `weibel1994`, `mccleary2001`, `cartan-eilenberg1956` and `massey1954` are settled as uncertified. Their exact wording, theorem/page agreement, complete hypotheses and tables of contents could not be certified. Their existing keys and locators remain unchanged; no renewed source request was made. In particular, §4.1's Weibel Theorem 2.7.2 was not read.
- Lean elaboration, elaborated binder checks and executable one-tactic probes are not available in this design lane. There is no `Suggested.lean`; the native statements were assessed by reading their pinned declarations, not by claiming an elaboration result.

## Source issues

- **Misprint** in may-primer at Proposition 4.1, printed p. 7, line 267–279: the source says the condition descends from index n to n−1 without specifying a positive index; it should restrict that equivalence to n ≥ 1; affects a stated result.
- **Misprint** in may-primer at Example 2.3, printed p. 4, line 162: the source says a free integral homology summand contributes an integral summand to the mod-p page; it should contribute a copy of 𝔽_p; affects a stated result.
- **Misprint** in stacks-05QI at Lemma 18.4 proof, printed p. 65, line 3277–3283: the source says the induction residual subtracts a wrongly indexed homotopy component and uses a wrongly indexed chain-map component; it should subtract d_I^{n−1}h^n and use α^n d_K^{n−1}=d_I^{n−1}α^{n−1}; affects the proof.

- **Misprint** in stacks-05QI at Lemma 22.1 proof, printed p. 74, line 3712–3713: the source says to evaluate the comparison transformation at RF(I); it should evaluate at I[0], then identify RF(I[0]) with F(I)[0]; affects the proof.

## For the human reviewers

- `packages/SpectralSequencesAndConvergence/design/README.md` is the readable base supplier; it is not yet represented as an accepted roadmap in the inspected main/order. Its acceptance and placement must precede Part II's use of its contracts.
- Text and contents of weibel1994, mccleary2001, cartan-eilenberg1956 and massey1954 remain uncertified. Wording and arrangement comparisons against those four works were not performed; the largest citation source, stacks-05QI, was readable and compared.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "33aeacd305dcce7ac0eee21db090a0fd5d04a7de", "job": "REV-DESIGN-SpectralSequencesAndConvergencePartII~3", "model": "gpt-6-astra", "worker": "chris-6"} -->
