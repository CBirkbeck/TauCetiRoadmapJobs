<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13086#issuecomment-6786459087 -->
Red team round 1 pass a (codex) of e8dde6d

Verdict: needs_changes

1. **F01** (P3) The density locator is part (iii), not part (ii)

   **Location:** packages/VectorBundlesAndIsocrystalsPartII/README.md:242; packages/VectorBundlesAndIsocrystalsPartII/sources.toml:154. “Colmez12, Théorème 3.1(ii), pp. 116–117”.

   **Claim:** Part (ii) is the density/completion theorem used by §0.8.

   **Witness:** Colmez12 line 294 is OCR-misnumbered. The original printed p. 117 visibly labels density (iii); the preceding part (ii) identifies quotients of integer subrings.

   **Exact repair text:** Replace “Théorème 3.1(ii), pp. 116–117” with “Théorème 3.1(iii), p. 117” in the README and the Colmez12 manifest locator. The original PDF was visually checked; reducing modulo t still gives the intended dense inclusion of algebraic constants in C.

2. **F02** (P3) The pro-étale target changes its coefficient sheaf

   **Location:** packages/VectorBundlesAndIsocrystalsPartII/README.md:696–698. “H¹_proet(Sp(C{X}), O)” and “pro-étale `O`-cohomology”.

   **Claim:** These groups are the completed-coefficient groups constructed in §3.4.

   **Witness:** README:624–626 explicitly uses `Ô`. LeBras18 lines 490–512 distinguishes the completed additive sheaf and computes its higher direct images. Writing ordinary `O` silently changes the coefficient object.

   **Exact repair text:** In both formulas and the proof route of §3.8, replace `O` by `Ô`; add “Here `Ô = (lim_n O⁺/p^n)[1/p]` is the completed pro-étale structure sheaf used in §3.4.” Keep the same sheaf in its Checks. On the normalized disc class the repaired identification gives `[ψ_1] ↦ 1`; the translation-invariant subspace is `C` inside `C{X}·ψ_1`, exactly as in §3.4.

3. **F03** (P3) A definition Check only repeats torsion notation

   **Location:** packages/VectorBundlesAndIsocrystalsPartII/README.md:758. “`W[t^d]` is `Submodule.torsionBy W (t^d)` with its induced topology.”

   **Claim:** This is one of the three discriminating Checks for reasonable period models in §4.2.

   **Witness:** The sentence restates the notation fixed in the supplier table, README:69; it tests neither completeness, topological type, uniform exponent nor the independently recorded countable-type property.

   **Exact repair text:** Replace that Check with: “For an uncountable index set `I`, `c₀(I,C)`, with `t` acting by zero, is a reasonable Banach `B₁`-model without countable type. A countably generated subspace is supported on a countable union of countable supports; a unit vector outside that union has distance 1 from its closure. Thus §4.2 includes this model, whereas §4.1 does not.” Here the torsion exponent is 1, completeness holds, and the countable-type flag is false. This supplies the missing discriminator without narrowing §4.2.

4. **F04** (P3) Several Checks merely repeat a definition, theorem or scope restriction

   **Location:** packages/VectorBundlesAndIsocrystalsPartII/README.md:328, 477, 561, 678, 737, 816, 999–1000, 1066, 1099, 1178. For example: “Pointwise exactness is left-heart exactness, including non-classical quotients.”

   **Claim:** These bullets supply mathematical tests of the surrounding constructions.

   **Witness:** README:477 repeats README:459; README:737 repeats README:720; README:1099 repeats the contravariant construction at README:1080. The other listed bullets assert well-definedness, consequences or exclusions without an instance that discriminates between constructions.

   **Exact repair text:** Move these bullets into the preceding API/proof prose, rather than counting them as Checks. Most affected sections still have at least three concrete Checks. For §4.5 replace its last Check with “For the trivial action on `C`, the constant function `f(h)=1` on `ℤ_p` is continuous but fails the cocycle law: at `(0,0)` the two sides are 1 and 2. In contrast `f(h)=h` satisfies it and lies in the single Banach step `C`.” For §6.7 replace its last Check with “For `W=ℚ_p² ⊕ (C/ℚ_p)³`, the ranks of `(h,Ext¹)` are `(2,3)` and the height is `2−3=−1`; the formula reads `2=−1+3`.” These computations hold also at `p=2`, since the coefficients have characteristic zero.

5. **F05** (P2) Reasonable model carriers are introduced after the theorems using them

   **Location:** packages/VectorBundlesAndIsocrystalsPartII/README.md:495–507, 720–746. “strict exact sequences of reasonable models of the same type”.

   **Claim:** §§2.5–2.6 can be constructed using only their listed earlier inputs, before the definitions of reasonable models in §§4.1–4.2.

   **Witness:** §2.6 uses §4.2's model class; §4.2 lists §2.7 as an input; §2.7 lists §2.6. The roadmap-level dependency check does not examine this internal forward reference.

   **Exact repair text:** At the start of §2.5, introduce the topology-only definitions presently in the first sentences of §§4.1–4.2: the separable C-space class, the unrestricted B_m-model class, the countable-type flag, and the common Fréchet/compact-type branch. Define these from LocallyAnalyticDistributions §§0.0–0.2 before mentioning their completed realizations. Change §§4.1–4.2 to reuse these definitions and prove their realization properties; retain their section ids and Checks. Use §2.6's existing dependency on §2.5 for these carriers. Do not import a realization or a tensor-exactness theorem into the carrier definition. The nonseparable test `c₀(I,C)` must remain in the B₁-model class and outside the separable C-space class; the diagonal injection must remain admissible as a Pair presentation without becoming strict.

## Verified sound

Read all 1,205 README lines and all 106 Suggested.lean lines. There are **62 numbered targets**, **3 Lean declarations** (one necessary structure and two theorem signatures), and **224 Check bullets** including the two convention blocks. The README has no additional bold mathematical targets: its bold text is the Summary and Checks labels. All 62 target blocks and all 224 Checks were examined; the computed instances are recorded below. R03–R04 separate explanatory bullets from discriminating tests. No false headline theorem or padding theorem was established in this pass.

The headline inventory is: Fontaine full faithfulness (§0.2, separately for `C` and finite-length periods), the almost-representation structure theorem (§0.5), arithmetic Yoneda comparison and duality (§§1.2, 1.5), the fundamental extension theorem (§1.8), the disc extension isomorphism (§3.7), reasonable period/Pair comparisons (§§4.15–4.16), reasonable qBC full faithfulness (§5.4), and the height–rank formula (§6.7). The two statable arithmetic headlines occur in Lean. Its docstring identifies the missing arithmetic categories/Ext, period actions/topologies, sympathetic site/left heart/TVS/Pair/qBC, and VS period carriers preventing the remaining headlines. The intermediate comparisons use those same missing carriers. No substitute predicate or weakened stand-in was found.

The declared `gap:G-HOM` has the same slug, named supplier and uniform-in-Λ factorization contract in the README and design/plan.json. It is genuinely stronger than the parent's torsion-source vanishing. Conclusions using it remain conditional on that contract; its current absence from the supplier is not a finding.

The mechanical dependency check returned exactly:

```text
depcheck: 236 roadmaps, 2141 edges, 0 problem(s)
```

No UPWARD or CYCLE line occurred. The package diff against origin/main contains only this package's README, Suggested.lean, sources.toml and two earlier repair reports. No Lean build or Git mutation was run. There are no prohibited imports, `set_option`, sorry-valued data, `lemma` declarations or duplicate fully qualified Lean names in the material searched.

### Lean declaration and binder audit

The supplied elaborated signatures were compared with the file and prose. There are no section-variable blocks: the necessary hypotheses are explicit. This was a read-only signature audit, not a new elaboration run.

| Declaration / section | Actual variable and instance context | Computed instances and both sides | Result / change |
| --- | --- | --- | --- |
| `SemilinearRep`, Suggested.lean:46; conventions | Prime `p`; arbitrary intermediate `K⊂PadicAlgCl p`; `W : Type u`, additive group, `C`-module, topology. Group action is a monoid map into additive endomorphisms, with semilinearity and joint continuity. No finite-dimensional or module-topology constraint is claimed for this structure itself. | `W=0`: action and both sides of scalar law are 0. Standard `W=C`, identity σ: `cw=cw`. At `p=2`, σ(i)=−i: standard action gives −i on both sides at `(c,w)=(i,1)`; trivial action gives i versus −i and is rejected. At `p=3`, σ(ζ₃)=ζ₃² similarly rejects the trivial action. | Fields determine the intended action; invertibility follows from the group source. Keep. |
| `semilinearRep_equivariant_map_smul`, Suggested.lean:62; §0.2 | Prime `p`; finite-dimensional `K/ℚ_p`; both `Wᵢ` finite-dimensional `C`-modules with `IsModuleTopology`; semilinear representations; continuous additive equivariant `f`; arbitrary `c,w`. No unstated topology or finiteness binder is needed. | `W₁=0`: 0=0. `W₁=W₂=C`, `f=p·`: `p(cw)=c(pw)`. For twists `C→C(1)`, both sides are 0. Multiplication by `a∉K` fails equivariance since σ(a)≠a. | Continuous additive maps are ℚ_p-linear by rational density. No library result assumes only these hypotheses and already concludes C-linearity. Keep. |
| `fundamental_extension_surjective`, Suggested.lean:85; §1.8 | Prime `p`; finite `K`; complete normed ℚ_p-space `E`; jointly continuous action by continuous linear endomorphisms; finite-dimensional submodule `V`; module-topological `C`-module `W` with finrank 1; continuous additive surjection `q` with kernel exactly `V`, equivariant; continuous linear equivariant η with unequal ranges. | `E=ℚ_p^h⊕C`, `q=pr₂`, `η(v,c)=g(v)+c`: image C, image(V)=g(V), kernel graph of −g, dimension h=h. `h=0, η=id`: image C, kernel0, 0=0. `η(v,c)=g(v)`: equal ranges, fails hypothesis, kernel contains C. `W=C(1),V=0`: η=0 and unequal-range hypothesis false. `E=U₁,V=ℚ_pt`: image C, kernel dimension1=1. | `finrank=1` forces finite dimensionality; equivariance and the kernel equation imply V-stability. No lost binder; keep. |

### Computed README instances

The following uses `B=B_dR⁺`, `D=B_dR`, `B_m=B/t^m`, and `Q=c₀/Tc₀` for `T(x)_n=p^n x_n`. In every use of Q, `y=(p^n)` has would-be preimage `(1,1,…)∉c₀`; thus `[y]≠0`, while `closure(Tc₀)=c₀` and the separated quotient is 0. “Pass” means the recorded instances agree, not that a finite test proves the theorem. Same-type, finite-`K` and countability restrictions are retained throughout.

| Statement / location | Instances and computed values on each side | Result / change |
| --- | --- | --- |
| Conventions: semilinearity, prime and topology, README:23–41 | Identity action law cw=cw; conjugation sends i→−i at p=2 and ζ₃→ζ₃² at p=3. Trivial action instead gives i versus −i. `Hom_G(C(1),C)=0` versus underlying `Hom_C=C`. | Pass; zero ring and p=1 are excluded by field/prime hypotheses. |
| Conventions: height, t′, twist, Euler and pushout signs, README:43–55 | Heights of ℚ_p,C,C/ℚ_p are 1,0,−1 in both presentations. `exp(log(−u))=u` for u in the principal-unit part over ℚ₃; `exp(log5)=5` over ℚ₂. The two composite terms are both t′γz−t′z. `(tc,−c)` maps to tc−tc=0; wrong plus gives 2tc. For K=ℚ_p, Euler 1−2+0=−1, unsigned 3≠−1. | Pass, including p=2 (2≠0). |
| §0.1 strict Banach category, README:132 | Zero Hom sets are singletons. Split ℚ_p→ℚ_p²→ℚ_p has kernel/image ℚ_p. In logχ extension a fixed lift of 1 would require logχ(g)=0 for every g, false on an open cyclotomic subgroup. Diagonal T has kernel0 but dense nonclosed image, so is not an inflation. Finite permutation representations of S₃ and cyclic groups retain ordinary finite-dimensional exactness. | Pass. |
| §0.2 full faithfulness, README:153 | Source0 gives Hom0=0; C→C gives K=K; C→C(1) gives0=0; B₁→B₂ gives0=0 equivariantly, whereas without Galois equivariance the map 1↦t is nonzero. | Pass. |
| §0.3 analytic extensions, README:168 | Split `V⊕C` has Dimension `(1,h)` and analytic projection; η=0 is analytic with image0≠C; V=0,W=C(1) gives zero map to C. | Pass; analyticity does not assume surjectivity. |
| §0.4 almost presentations, README:182 | ℚ_p: d=0, ht=1−0=1; C: d=1, ht0; C/ℚ_p: d=1, ht=0−1=−1. C⊕ℚ_p alternative finite modifications give1−0=2−1=1, not2+1=3. | Pass. |
| §0.5 abelianness/Dimension, README:200 | ℚ_p→C→C/ℚ_p: dimensions1=0+1, heights0=1−1. C(1)→B₂→C:2=1+1 and0=0+0. Identity has zero kernel/cokernel of Dimension(0,0). | Pass. |
| §0.6 finite-length periods, README:214 | B₂ length2 gives(2,0); C(1) and C both(1,0), yet both directional equivariant Hom groups0. Zero has length0 and(0,0); ℚ_p has(0,1) and cannot be that period module. | Pass. |
| §0.7 general-base scalar rigidity, README:226 | id↔1; multiplication by p evaluated at1 is p≠0. For a∉K, equivariance at1 gives a versus σ(a)≠a. These tests use the fixed-field condition, not a finite residue field. | Pass. |
| §0.8 density, README:240 | Mod t, closure(K̄)=C but closure(K)=K≠C. In B₂, t≠0 while θ(t)=0, separating density in B₂ from residue-field density. | Mathematical tests pass; locator R01. |
| §0.9 period Hom, README:252 | j=0 gives K; j=1 gives0. N=1,k=1 gives K, not K² from the two graded pieces. Hom(B₁,B₂)=0; End(B₁)=K contains id; torsion→D is0. | Pass. |
| §1.1 almost splitting, README:281 | B₂ extension has nonzero class in K but quotienting kernel by ℚ_pt gives splitting via U₁/ℚ_pt. ℚ_p→C→C/ℚ_p becomes0→0→C/ℚ_p→C/ℚ_p→0. Quotienting the logχ extension by its entire finite kernel similarly gives an identity quotient. | Pass in both directions on these examples. |
| §1.2 Yoneda comparison, README:295 | Degree0 End(C) is K on both sides. B₂ gives a nonzero degree1 class on both sides. Degree2(ℚ_p,ℚ_p(1)) is ℚ_p→ℚ_p, with invariant1↦1. | Pass; no degree≤1 truncation. |
| §1.3 generalized invariants, README:309 | W=0 gives(0,0); C gives(K,0); B₂ gives(K,Kt′) with t′:K≅Kt′. Nilpotent t²=0 does not require division on B₂. For two cyclotomic lifts u,−u, χ⁽¹⁾ equals u in both cases. | Pass; non-test bullet R04. |
| §1.4 Ext complex, README:331 | C gives H⁰,H¹,H²=(K,K,0); C(1) gives(0,K,K). B₂ at γ(t′)=5t′,z=1 gives correct composite0; using 5 instead of1/5 gives(1−25)t′=−24t′≠0. | Pass. |
| §1.5 Euler and duality, README:345 | K-degree r: 1−(r+1)+0=−r=−r·1·1. H²(ℚ_p(1))=ℚ_p pairs with H⁰(ℚ_p)=ℚ_p. C→C(j): dimensions (1,1,0) for j0, (0,1,1) for j1, all0 otherwise; alternating sum0 in each case. | Pass. |
| §1.6 period Ext table, README:359 | (k,j)=(1,0): K-dimensions(1,1,0); (1,1):(0,1,1); (2,1):(0,0,0). In each case alternating sum0. | Pass. |
| §1.7 longer-target vanishing, README:373 | (N,i,j)=(0,1,2): Hom=Ext¹=0. At i=j=1 identity survives; N=1,i=j=1 has nonzero inclusion C→t⁻¹B/tB. Both are excluded. | Pass. |
| §1.8 fundamental extension, README:387 | For η=(g,1), ker is graph(−g), dimension h=h, image C. For η=(g,0), image(E)=image(V) and kernel includes infinite-dimensional C. For U₁→C, ker=ℚ_pt dimension1. | Pass; see full Lean binder row. |
| §1.9 realization, README:402 | Finite V gives constant V; C gives V₁. End_G(C)=K versus End_BC(V₁)=C, so forgetting the action is not full. Twisted C(1) action at i or cyclotomic5 differs from trivial action. | Pass. |
| §2.1 boundedness/localization, README:433 | [0→C] gives quotient C, bounded unit ball; [C→C] gives0. Diagonal Pair gives Q≠0 but separated quotient0. A bicartesian identity comparison induces id_C, preserving the unit ball. | Pass. |
| §2.2 pointwise exact structure, README:445 | V₁→V₁²→V₁ evaluates at Λ to kernel Λ and quotient Λ. Pullback along0 has middle Λ and quotient0. Dense T has nonzero left-heart cokernel Q. | Pass. |
| §2.3 TVS, README:457 | Zero functor has bounded image{0}; V₁ sends the spectral unit ball into the spectral unit ball for every algebra map (bound1). Dense T gives Q≠0, separated quotient0. | Pass for construction; R04 removes repeated exactness statement. |
| §2.4 classical BC embedding, README:479 | C/ℚ_p evaluates to that Banach quotient with height−1; constant ℚ_p evaluates to ℚ_p for every Λ; V₁(C)=C and0(C)=0. | Pass. |
| §2.5 completion, README:493 | B_m completes to B_m; c₀₀ completes to c₀ with y=(p^n) in completion but not finite support;0 completes to0. | Pass. |
| §2.6 period base change, README:505 | Λ=C gives singleton basis and c₀({*},M)=M. Coordinatewise T still has kernel0 and the same y has no preimage in c₀. Split C→C²→C becomes Λ→Λ²→Λ, quotient Λ. | Pass on tested complete models; ordering repair R05. |
| §2.7 period Modules, README:517 | 0 realizes0; B_m realizes B_m(Λ). In the balanced tensor b⊗1=1⊗b; at m=2,b=t this equality distinguishes the balanced relation. In ⊕_{m≥1}B_m, t^N kills no summand B_{N+1}; hence no common exponent. Finite B₂ agrees with parent length2 model. | Pass. |
| §2.8 Pairs, README:541 | [M→M]=0; [0→B_m]=B_m; [c₀→c₀] via T has Q≠0, while closure quotient0. | Pass; scope-only Check R04. |
| §3.1 disc/characters, README:573 | a0 gives E=1,χ=1,ψ=0. At p2, exp(X) has coefficients 1/n! not tending to0, while exp(4X) does. Translation0 is kernel H. First geometric generator has ψ₁=1/3 at p3 and1/4 at p2, not1. | Pass. |
| §3.2 perfectoid cover, README:596 | p3,n0: normalized reduction Y₀³=X; p2,n0: Y₀²+Y₀=X. The predecessor at n0 is X. In (exp(2X)−1)/2, coefficient at X^(2^r) has valuation0 for every r, so the odd-prime series fails at2. | Pass. |
| §3.3 two-adic character, README:610 | ψ₁=1 implies ψ₂=2 and ψ₂/2=1. v₂(2^(2^r)/(2^r)!)=1; v₂(4^n/n!)=n+s₂(n)→∞. Division by2 multiplies the bound by2. | Pass. |
| §3.4 normed tower descent, README:622 | At p3 and k=0,1,2,3,6,9 valuations0,1,2,2,4,5; at p2,k=0,…,4 valuations0,2,3,5,5. A(0)=1, (A−1)(0)=0. Zero cocycle gives λ0; ψ₁ gives λ=(1/p)/(1/p)=1, at2 (1/4)/(1/4)=1. First-level constant/geometric/total degrees p3:(6,3,18), p2:(2,2,4). Inverse γ−1 norm is √3≤3 or2≤2. For root(1+cX), boundary norm p^(−p/(p−1)) gives binomial coefficient norms p^(−s_p(k)/(p−1)), nonvanishing along k=p^r. | Numerical/normalization tests pass. Full normed descent is a proof obligation; see Not verifiable. |
| §3.5 analytic cocycle primitive, README:644 | Constant c gives δ(−c)=c. YZ gives δ(X²/2)=YZ. For k=p, binom(p,1)=p and valuation1; for k=p², i=p gives valuation1. Bad choice i=k at k=p gives no mixed coefficient. | Pass, including required denominator2. |
| §3.6 additive lifts, README:658 | Split V₁²: λ_v=0, rank0. B₂: λ_v=v, hence rank1 for v≠0. At v0 every extension has rank0 although B₂ nonsplit, so nonzero-v hypothesis is essential. | Pass; repeated theorem Check R04. |
| §3.7 disc Ext, README:680 | Split class0, framed B₂ class1. Pushout by c=p gives class p≠1 and by0 gives0. Arithmetic C→C(1) Ext=K differs from TVS Ext=C. | Pass. |
| §3.8 translation invariants, README:694 | ψ₀−0ψ₁=0; ψ₁−ψ₁=0; at p2 ψ₂−2ψ₁=0. Translation by1 sends X to X+1≠X, so invariants of C{X} are constants C, not all C{X}. | R02: specify Ô consistently. |
| §4.1 reasonable C-spaces, README:718 | 0 admits both types; c₀(ℕ,C) has dense finite-support span and is Banach. Its infinite unit-vector family is not compactoid; the infinite-dimensional Banach is not compact type. c₀(ℕ,Λ) is its realization. | Pass; definitional Check R04. |
| §4.2 reasonable B_m-models, README:740 | B_m^r has uniform exponent m. Unbounded union of torsion layers contains elements not killed by each t^N. For uncountable I, c₀(I,C) is Banach, killed by t, but any countably generated span misses a unit vector at distance1. | R03 supplies third discriminator; R05 moves the carrier before its use. |
| §4.3 reasonable Pairs/type, README:761 | [M=id→M]=0; [C→C²] gives C; dense diagonal gives Q≠0 versus separated0. A genuinely Frechet-only model and compact-type-only model have no common branch. | Pass; type is a retained hypothesis. |
| §4.4 normalized pushout, README:782 | w0 gives split0. m=d=1,W=C,w1 gives B₂ and parameter1: relation(t,−1) maps0. W=B₂,d1,w=t gives t mod tB₂=0, despite t≠0. w and w+tw′ have equal residue classes. | Pass. |
| §4.5 compact-type cocycles, README:804 | Zero cocycle has image{0} in every step. Finite H gives finitely many values, so max of their stage indices works. For S₃ on C³, coboundary g↦g(e₁)−e₁ takes only0,e₂−e₁,e₃−e₁. Trivial-action constant1 gives cocycle law1≠2 at(0,0). | Last example is replacement Check R04. |
| §4.6 separable compact-type extensions, README:818 | Split C→C²→C yields bidual dimensions1,2,1 and identity bidual maps. Zero ends force middle0 and lift space0. Coordinate evaluation e₁* on c₀ has norm1, extending its restriction to Ce₁; no universal norm-preserving Hahn–Banach claim is made. | Pass; source hypotheses do not supply general nonseparable extensions over C. |
| §4.7 B₁ Hom/Ext, README:830 | W=C gives(C,C) with normalized class1; W0 gives(0,0); W=c₀ gives null-sequence parameter space, y=(p^n) admitted and(1,1,…) excluded. | Pass. |
| §4.8 all separable Frechet, README:844 | Product C^ℕ admits(1,1,…), normed c₀ rejects it and admits(p^n); zero inverse system has lim0 and lim¹0. | Pass on samples; all-Frechet extension is explicitly owned here. |
| §4.9 no countable-type restriction, README:856 | W=B₃,d2: W[t²]=tB₃ length2, W/t²W=B₂ length2. Uncountable c₀(I,C) gives W in both degrees at d=m=1 despite no countable dense span. Zero gives0→0. | Pass on samples; nonseparable base case is explicitly owned. |
| §4.10 torsion-source comparison, README:868 | W=B₃,d2: Hom=tB₃ and Ext=B₂, lengths2. d≥3 gives W in both places. d0 gives ker1=0 and coker1=0, matching Hom/Ext(0,W)=0. | Pass; m=0 is conventionally zero, not an allowed nonzero period model. |
| §4.11 constant source, README:882 | W=C: Hom=C,Ext¹0. Arithmetic H¹(G_K,ℚ_p) has dimension[K:ℚ_p]+1>0, so categories differ. For diagonal Pair Hom(ℚ_p,P)=Q≠0 though Hausdorff quotient0. | Pass. |
| §4.12 Pair torsion Hom, README:896 | [0→B₃],d2 gives tB₃. [tB₂→B₂],d1 gives C. Diagonal B₁-Pair is t-killed, hence its t-torsion is all Q≠0. | Pass. |
| §4.13 U_d Hom/Ext, README:910 | d1,W=C: Hom=C,Ext¹0; connecting C→C is1↦1, cokernel0. d0 is ℚ_p with same values. Replacing Ext¹ by W would give C≠0. | Pass; source Lemma4.24 is corrected. |
| §4.14 linear additive lifts, README:924 | c0 gives0=0; c=p gives ℓ_v(px)=pℓ_v(x)=ℓ_pv(x); c=−1 gives −ℓ_v(x) on both sides. For a nonunit c, (1+c)x−x=cx, so the unit identity and additivity recover the same equality. H-invariant descent makes changing lifts add0. | Pass. |
| §4.15 Module comparisons, README:938 | C,C: all three Hom groups C and all three Ext¹ groups C, class1 matched. Split C² has section c↦(0,c), extended to Λ by the same formula; arbitrary discontinuous algebraic sections do not define completed tensor maps. | Pass. |
| §4.16 Pair full faithfulness, README:952 | Module pairs recover preceding Hom. Dense Q-Pair has nonzero id since [y] maps to[y]≠0. [0→B₁]→[0→B₂] has Hom=tB₂≅C in all three categories, unlike arithmetic Hom0. | Pass. |
| §5.1 filtered qBC, README:976 | Zero has all pieces0, ht0. ℚ_p has only negative piece and ht1. c₀ Module has only middle piece, ht0 and infinite C-dimension. C/ℚ_p has positive piece and ht−1. Direct sum ℚ_p⊕C⊕C/ℚ_p has outer heights1−1=0. | Pass; two explanatory Checks moved by R04. |
| §5.2 positive/Pair orthogonality, README:1002 | C/ℚ_p→C restricts C→C on Hom by1↦1, so kernel0. At x≠∞, t_x is a unit on B_m, so restriction has kernel0. Replacing positive source by C gives nonzero id. At B₂ with θ(v)≠0, v is a unit, hence no nonzero t²-torsion value is killed. | Pass. |
| §5.3 intrinsic filtration, README:1017 | Pure Pair: outer pieces0. ℚ_p⊕B₁⊕(U₁/ℚ_pt_x), x≠∞: positive U₁/ℚ_pt_x, middle B₁, negative ℚ_p. Identity transports each piece to itself; largest-negative quotient kernel equals first two summands. | Pass. |
| §5.4 qBC full faithfulness, README:1031 | Pure Pair reduces to equal Hom groups of§4.16. Classical ℚ_p has End ℚ_p on both sides. Multiplication by p on C/ℚ_p is invertible with inverse1/p, preserving height−1. | Pass. |
| §5.5 dense locally analytic inclusion, README:1045 | For J=id, cokernel0. For LA→C⁰, dense proper image gives nonzero left-heart X but Hausdorff quotient0. Hom(X,ℚ_p)=0 since restriction Mes→D is injective (LA is dense in C⁰). Connecting distribution δ′ maps to its nonzero class modulo measures; an actual measure maps0. The locally analytic functions equal to x/p^n on p^nℤ_p and0 elsewhere have sup norm≤1 but derivative p^(−n) at0, proving δ′ is not a measure. | Pass; scope-only Check R04. |
| §6.1 h, README:1078 | h0=0, h(ℚ_p^r)=D^r for r0,1,2, h(B_m)=0, h(C/ℚ_p)=0 despite ht−1. Identity on ℚ_p evaluates to1; scalar p induces multiplication p on D by precomposition. | Pass conditional on declared G-HOM; repeated variance Check R04. |
| §6.2 period sheaf comparison, README:1102 | (ℚ_p,V₁) Ext¹0→0; (V₁,V₁) Hom and Ext¹ C→C; boundary of framed B₂ sends1→1 rather than0. | Sample normalization passes; bridge itself is a named construction/proof obligation. |
| §6.3 inverse limit, README:1114 | m1 gives Hom=C,Ext¹0. B₂→B₁ surjects with kernel tC≠0. Compatible period tower has lim Hom=B and lim¹0 by surjective reduction; zero tower gives all0. | Pass. |
| §6.4 localized Ext, README:1126 | ℚ_p lattice Ext¹0 gives colim0. V₁ lattice Ext¹=C with zero transition gives colim0, not C. C/ℚ_p gives localized rank1. | Pass on basic sources; all-source pseudocoherence remains a proof obligation. |
| §6.5 basic VS Ext, README:1138 | Hom(V₁,B)=0; Hom(V₁,t⁻¹V₁)=C; boundary C→Ext¹(V₁,B)=C sends1→1. Exactness makes next transition0. Ext¹(ℚ_p,V₁)=0. | Pass. |
| §6.6 nonpositive vanishing, README:1152 | W=C and ℚ_p give Ext¹0. Split ℚ_p→ℚ_p⊕C→C yields0→0→D→D→0, map id. C/ℚ_p gives rank1 and lies outside the curvature hypothesis. | Pass. |
| §6.7 height–rank, README:1166 | ℚ_p gives1=1+0; C gives0=0+0; C/ℚ_p gives0=−1+1. For ℚ_p²⊕(C/ℚ_p)³,2=(2−3)+3. Zero gives0=0+0. | Pass; R04 replaces proof-comment Check by the mixed example. |

### Source and locator audit

All **10 source records** were accessible in the supplied legal cache. The table records **35 locator groups** opened against the cited versions; ranges group adjacent statements, rather than counting each repetition as a new locator. All **62 target locator bundles** were compared with these texts. This certifies the identity and content of the cited passages, not new arguments extending them. In particular, the new comparisons and extensions explicitly owned in §§3.4, 4.8–4.9 and 6.2–6.4 are not attributed to stronger source theorems than the passages actually contain. The incorrect pinpoint is R01. Printed/preprint pagination conventions in sources.toml were retained.

| Source and locator group | Readable witness | Outcome |
| --- | --- | --- |
| CN25 §2.1, Theorem 2.1, p.9 | CN25 lines 383–399 | Banach category and finite-K full faithfulness. |
| CN25 §2.2.1, Remarks 2.3–2.4, pp.9–10 | CN25 lines 400–427 | Almost presentations, signed Dimension and finite-period comparison. |
| CN25 Proposition 2.5 and Theorem 2.6, p.10 | CN25 lines 428–439 | All-degree comparison, finiteness, Euler characteristic and duality. |
| CN25 Proposition 2.7 and (2.8), p.10 | CN25 lines 440–453 | Twisted complex; inverse character verified. |
| CN25 Corollary 2.9 and Lemma 2.10, pp.10–11 | CN25 lines 455–487 | Longer truncation vanishing and Ext table. Source range typo listed below. |
| CN25 Propositions 2.13–2.14, pp.11–12 | CN25 lines 489–550 | General-base scalar, density and period Hom claims. |
| CN25 Corollary 3.18 and proof, p.18 | CN25 lines 828–842 | Parent torsion-source vanishing and boundedness use; general BC bounded factorization remains the declared G-HOM contract. |
| CN25 Lemma 3.26 and Proposition 3.27, pp.19–20 | CN25 lines 912–954 | VS Ext vanishing and height–rank sign. |
| CN25 Definition 4.1 and Remarks 4.2–4.3, pp.20–21 | CN25 lines 960–991 | Uniform boundedness, BC topologies and left-heart presentations. |
| CN25 Definitions 4.4–4.7, Remark 4.8, pp.21–22 | CN25 lines 992–1052 | Modules/Pairs/qBC, countable base-change basis, dense-quotient example. |
| CN25 Lemma 4.9, p.23 | CN25 lines 1070–1082; original PDF p.23 visually inspected | Odd-prime formula; dyadic issue below. The printed recurrence DOES contain the +1: extraction merges it with the subscript, so that is not a source misprint. |
| CN25 Proposition 4.10 and Lemma 4.11, pp.23–24 | CN25 lines 1083–1154 | Disc class, additive lifts and bounded correction. |
| CN25 Lemma 4.13, Remark 4.14, p.24–25 | CN25 lines 1155–1184; original PDF p.24 inspected | Bounded primitive and nonzero-v splitting; constant/index slips below. |
| CN25 Remark 4.15, p.25 | CN25 lines 1185–1192 | Translation-invariant interpretation; completed coefficient must be explicit (R02). |
| CN25 Remark 4.17 and Proposition 4.18, pp.25–26 | CN25 lines 1200–1248 | Pushout and separable comparison; sign and all-Frechet proof issue below. |
| CN25 Lemma 4.19 and Remark 4.20, p.26 | CN25 lines 1249–1265 | Profinite cocycles, isometric stages and broader period models. |
| CN25 Remark 4.21 and Proposition 4.22, pp.26–27 | CN25 lines 1266–1338 | Period pushout and torsion-source comparisons; nonseparable base-case issue below. |
| CN25 Lemmas 4.23–4.24, pp.27–28 | CN25 lines 1339–1418 | Pair Hom and U_d comparison; actual proof gives Ext¹=0. |
| CN25 Propositions 4.25–4.27, pp.28–30 | CN25 lines 1419–1499 | Orthogonality, intrinsic filtration and Module comparison. |
| CN25 Lemma 4.29, Theorem 4.30 and Corollary 4.31, pp.30–31 | CN25 lines 1500–1595 | Additive lift linearity, Pair and qBC full faithfulness. |
| CN25 Appendix A, Propositions A.1, A.3–A.4, Remark A.6, pp.58–59 | CN25 lines 2873–2948 | Splitting/extension hypotheses and strict-versus-left-heart distinction. |
| Fontaine03 §§1.2–1.4, Theorems A–D, pp.289–292 | Fontaine03 lines 165–300 | Finite-K standing hypothesis, semilinear carriers and arithmetic endpoints. |
| Fontaine03 §§2.1, 2.3, 2.5; Theorem 2.14, pp.296,306,308–311 | Fontaine03 lines 475–510, 814–849, 987–1088 | Finite-character correction, generalized invariants and actual differentials. |
| Fontaine03 §3.3, pp.321–328 | Fontaine03 lines 1506–1815 | Primary full-faithfulness route, not a theorem about bare continuous maps. |
| Fontaine03 Theorem 4.1, Propositions 4.2 and 4.4, pp.329,333,337–340 | Fontaine03 lines 1816–1825, 1974–1988, 2138–2158, 2294–2310 | One-dimensional semilinear quotient and analytic realization; kernel has dimension of V. |
| Fontaine03 §5.1 and Propositions 6.4–6.5, pp.341–345, 357–358 | Fontaine03 lines 2317–2460, 2960–3005 | Structure theorem and extension comparison. |
| FF18 preface Theorem 2.25, Remark 2.26, Proposition 2.28, pp.21–23 | FF18 lines 948–1017; original p.23 inspected | Fundamental theorem and analytification; signed Euler correction needed in source. |
| FF18 §5.5.1, printed pp.212–214 (ownership boundary) | FF18 lines 8584–8668 | Generic HN formalism belongs to the parent; no new HN construction here. Additional printed slips are listed below. |
| Colmez02 Propositions 5.20 and 5.23, pp.30–32 | Colmez02 lines 1278–1376 | Closure and translation lifting. |
| Colmez02 Theorem 10.5, Proposition 10.18 and Remark 10.19, pp.76–77,82–83 | Colmez02 lines 3320–3360, 3613–3635 | Additive correspondences and bounded primitive. |
| Schneiders99 Corollaries 1.2.20–1.2.22, pp.24–25 | Schneiders99 lines 820–878 | The localization statement is Corollary 1.2.21. |
| Fontaine04 Proposition 6.2 and proof, pp.107,111 | Fontaine04 lines 4274–4291, 4396–4424 | General-base scalar endomorphisms. |
| Colmez12 Theorem 3.1, pp.116–117 | Colmez12 lines 278–301; original p.117 inspected | Density is part (iii), despite OCR labeling it (ii); R01. |
| LeBras18 Theorem 4.1, pp.26–28; TVS25 Definition 3.32, Theorem 4.1, Corollary 4.7, Lemma 4.21 and Corollary 4.25, pp.23–31 | LeBras18 lines 1170–1237; TVS25 lines 1054–1085, 1165–1188, 1288–1315, 1341–1385 | Sheaf/enriched comparison inputs; neither is silently identified with the original VS category. |
| AnschutzLeBras25 Theorems 3.1, 3.2, Corollary 3.8, Theorem 3.9 and Corollary 3.11, pp.3671–3681 | AnschutzLeBras25 lines 818–848, 972–1030, 1169–1188 | Mac Lane/Breen computations, pseudocoherence argument and curve-side full faithfulness. Original-VS transport remains §6.2's obligation. |

### Supplier, pin and ownership audit

Checked **10 cross-roadmap supplier groups**, listed below, against main when present there and the current open content otherwise. The overlap report's closest vocabulary matches were read as leads. Object searches used `roadmaps grep`, the pinned source trees and the board package tree. They found the parent owning classical BC, the period suppliers owning period carriers/actions, and this package owning the named arithmetic and topological extensions. CstConjectureForDaggerVarieties consumes these objects rather than defining a competing class; RelativeFarguesFontainePartII uses the parent's geometric BC objects. No double ownership of the three Lean names was found. No unprovided open checkout was treated as verified.

| Supplier group | Resolved contract and witness |
| --- | --- |
| VectorBundlesAndIsocrystals, Layer 5 | All 18 named headings in the parent supplier paragraph exist, from *Sympathetic Vector Spaces* through *Nonpositive curvature extension criterion*. In TauCetiRoadmap/VectorBundlesAndIsocrystals/README.md, *Artinian property of BC* is at line1526, *VS Hom vanishing from torsion period modules* at1570, and the extension criterion at1618. Countability and curvature conventions agree; ℚ_p is negative, C/ℚ_p positive. G-HOM asks for the extra uniform BC-source factorization only. |
| PadicPeriodRings §§1.1–1.2,1.5,2,4.1–4.3 | Actual completion action, finite-K fixed field and general-base period/fixed-twist contracts were read. The action is not credited to Mathlib's bare completion map. |
| PadicHodgeTheory §4.4 | The semilinear C-representation extension of Sen theory is explicitly included in TauCetiRoadmap/PadicHodgeTheory/README.md:895; this is not limited to rational representations. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P7.2 | Labelled rational Sen operators exist with their finite-coefficient hypotheses; the package preserves that restriction. |
| LocallyAnalyticDistributions §§0.0–0.3, Layer 1 | TauCetiRoadmap/LocallyAnalyticDistributions/README.md:892,940,1098,1126,1136 distinguish general locally convex/left-heart theory, countable-type functional extension, conditional inverse limits, and finite-K compact-type extension theory. This does not already supply the C/nonseparable extensions owned here. |
| ArithmeticGaloisRepresentations §1.1 | TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:779–799 supplies finite-dimensional continuous representations and jointly continuous actions; it does not supply the Banach ambient category. |
| ArithmeticGaloisDuality §§R02.1.3,D7.4 | TauCetiRoadmap/ArithmeticGaloisDuality/README.md:700–730 and5392 onward supply rationalization and local Tate duality. Finite extensions of ℚ_p are covered. Discrete Hochschild–Serre is explicitly not used for period descent. |
| PerfectoidSpaces P1,P3,P6 | Main's perfectoid criterion, almost purity and pro-étale presentation calculus exist. No P6-only claim of the normed disc theorem is made. |
| PerfectoidTowers §P9.6 | TauCetiRoadmap/PerfectoidTowers/README.md:2460 onward states the tower comparisons with discretely valued smooth base and derived-limit conditions. §3.4 applies them to the ℚ_p tower before base change, and keeps the separate inflation/decompletion obligations. |
| AlgebraicVectorBundles, Scope and Layers1–2 | Main's TauCetiRoadmap/AlgebraicVectorBundles/README.md:27,390,472 supplies module-sheaf pullback and flat/internal-Hom comparisons at the stated hypotheses. This package does not reconstruct them. |

The **19 rows of pinned-library supplier tables** were opened (17 Mathlib, 2 Tau Ceti), including both declarations in the PadicAlgCl/PadicComplex row. Their file locators exist at the stated pins. `TopModuleCat` alone imposes neither Hausdorffness nor completeness; `BDeRhamPlus`/`BDeRham` supply commutative-ring carriers, not the period topology/action; abelian Ext comparison needs `HasExt` and an exact functor. Those limitations are correctly recorded in the package.

For the one-tactic/duplication probe, the near-match `ContinuousSemilinearMapClass` in Mathlib/Topology/Algebra/Module/ContinuousLinearMap/Basic.lean:79 already assumes semilinearity; it cannot prove that a merely additive equivariant map is C-linear. `SemilinearIsometryClass` in Mathlib/Analysis/Normed/Operator/LinearIsometry.lean:67 additionally assumes isometry and semilinearity. Intermediate-field dimension lemmas and generic fully faithful functors likewise do not prove Fontaine's result. Mathlib/LinearAlgebra/Dimension/Free.lean:284 (`Module.finite_of_finrank_eq_succ`) confirms that the rank-one premise in the second theorem rules out infinite-dimensional W. The completion, p-adic field and norm near-matches do not prove the fundamental extension theorem.

## Not verifiable

- No Lean process was run: the brief requires a read-only pass and forbids Lean builds. The supplied elaborated signatures were inspected, but this report is not an independent elaboration certificate.
- Finite instance checks and source matching do not independently establish the full norm-controlled completed-cover/inflation/decompletion argument in §3.4, the general Frechet/nonseparable extensions of §§4.8–4.9, or the original-VS-to-v-sheaf and filtered-Ext comparisons of §§6.2–6.4. These are explicit owned targets, not silently supplied theorems. No counterexample to their stated generality was found; the source limitations are recorded above and below.
- G-HOM is a declared, precise supplier gap. Uniform factorization for every BC source has not yet been supplied and is not certified by its torsion-source predecessor.
- No publication correction was checked beyond the source versions named in sources.toml. Source issues below concern those exact legal copies. OCR errors are not registered as errors of the printed source.
- Ownership was checked against the supplied open heads and indexed object searches, not against unpublished work or additional open checkouts absent from the brief. There were no inaccessible cited texts requiring a new reference request.

## Source issues

- **Misprint** in FF18 at Remark 2.24(i), printed p.21 (FF18 line 940): the source says cohomology vanishes in degrees at least two; it should be degrees greater than two, since H²(G_K,ℚ_p(1))=ℚ_p; affects a stated result.
- **Misprint** in FF18 at Proposition 2.28(i), printed p.23 (FF18 line 1016): the source says the unsigned sum of Ext dimensions equals the signed height product; it should be the alternating sum with factor (−1)^i; affects a stated result.
- **Misprint** in Fontaine03 at §1.2, printed p.289 (Fontaine03 lines 194–197): the source says a strict full subcategory need only have kernels and cokernels in the ambient category; it should be closed under those kernels and cokernels itself; affects a stated result.
- **Misprint** in CN25 at proof of Lemma 2.10, printed p.11 (CN25 line 479): the source says the nonzero W_(1) range is 0≤j≤j−1; it should be 0≤j≤k−1; affects the proof.
- **Misprint** in CN25 at Remark 4.3, printed p.21 (CN25 line 971): the source says Schneiders Corollary 1.2.20 supplies the left-heart localization; it should be Corollary 1.2.21; affects the proof.
- **Error** in CN25 at Lemma 4.9 and proof, printed p.23 (CN25 lines 1070–1081): the source says the exp(pX) closed-disc computation works at every prime; it should be restricted there to odd p, with the exp(4X) Artin–Schreier normalization at p=2; affects the proof.
- **Misprint** in CN25 at proof of Lemma 4.13, printed p.24 (CN25 line 1157): the source says to add the constant cocycle to its primitive; it should be subtracted, because the displayed coboundary sends a constant c to −c; affects the proof.
- **Error** in CN25 at proof of Lemma 4.13, printed p.24 (CN25 lines 1166–1168): the source says to choose i=p^v_p(k) among the mixed coefficient indices; it should be i=p^(v_p(k)−1) when p divides k, keeping i<k even for p-powers; affects the proof.
- **Misprint** in CN25 at proof of Lemma 4.13, printed p.24 (CN25 line 1167): the source says the coefficient used after choosing i is b_(i,k−1); it should be b_(i,k−i); affects the proof.
- **Misprint** in CN25 at Remarks 4.17 and 4.21, printed pp.25,27 (CN25 lines 1215,1282): the source says the framed pushout kills the pair with two positive components; it should be the relation (t^d c,−cw) for the displayed positive endpoint maps; affects a stated result.
- **Gap** in CN25 at Proposition 4.18, printed p.26 (CN25 lines 1238–1248): the source says the comparison holds for all reasonable Frechet targets; it should include an argument for nonnuclear Frechet targets beyond the nuclear inverse-limit case proved there; affects the proof.
- **Misprint** in CN25 at proof of Lemma 4.19, printed p.26 (CN25 line 1253): the source says the sum defining U_n repeats B_n in every summand; it should use B_i in the i-th summand; affects the proof.
- **Gap** in CN25 at Proposition 4.22, printed p.27 (CN25 lines 1291–1298): the source says the unrestricted B₁ base case follows from Proposition 4.18; it should supply the nonseparable Banach/Frechet base case, since Proposition 4.18 assumes countable type; affects the proof.
- **Misprint** in CN25 at Lemma 4.24(i), printed p.28 (CN25 lines 1375–1378): the source says Ext¹_TVS(U_d,W) identifies with W; it should be zero, as its proof concludes at CN25 lines 1414–1415; affects a stated result.
- **Misprint** in FF18 at §5.5.1, printed p.212 (FF18 line 8613): the source says the strict image of u:X→Y is a subobject of X; it should be a subobject of Y; affects a stated result.
- **Misprint** in FF18 at Theorem 5.5.3, printed p.213 (FF18 lines 8637–8639): the source says the subobject contributes coordinates (degree,rank) to the HN polygon; it should be (rank,degree), matching the polygon's slope and horizontal multiplicity convention; affects a stated result.
- **Misprint** in FF18 at Definition 5.5.5, printed p.214 (FF18 lines 8664–8665): the source says every nonzero strict subobject must have smaller slope; it should exclude the whole object, which otherwise imposes µ(X)<µ(X); affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "e8dde6d40630181eb688112978700fb83530b5f8", "job": "RT-VectorBundlesAndIsocrystalsPartII~1a", "model": "gpt-6-astra", "worker": "chris-3"} -->
