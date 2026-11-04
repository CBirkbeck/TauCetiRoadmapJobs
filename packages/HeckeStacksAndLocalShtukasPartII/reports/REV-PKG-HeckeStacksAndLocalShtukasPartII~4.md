<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1138#issuecomment-6403561512 -->
Review (claude) of a96277d

Verdict: accepted
Conditional on the announced gaps: `unipotent-linearization`, `demazure-product`, `twisted-redmin`, `straight-finite-parabolic`, `finite-coxeter-basic-class`, `parabolic-root-length`, `dominant-subtraction`, `superbasic-classification`, `newton-poset-length`, `newton-cell-strong-purity`, `newton-cell-greatest`, `levi-intersection-dimension`, `twisted-affine-cocenter`

1. **F01** (P3) ham17 Corollary 2.7 is on PDF page 6, not 5

   **Location.** `packages/HeckeStacksAndLocalShtukasPartII/sources.toml`, the `ham17` entry, `locator = "Definition 2.1(3), arXiv v3, PDF p. 4; Corollary 2.7, PDF p. 5"`; `packages/HeckeStacksAndLocalShtukasPartII/README.md:1811` (References, ham17): “Corollary 2.7, PDF p. 5”.

   **Claim.** Corollary 2.7 of ham17 is on PDF page 5.

   **Witness.** ham17 line 240 is the `=== page 6 ===` marker; Corollary 2.7 (topological strong purity over a Noetherian base) begins at ham17 line 260. Definition 2.1(3) at ham17 line 182 is on PDF page 4, as cited.

   **Exact repair.** Replace “Corollary 2.7, PDF p. 5” by “Corollary 2.7, PDF p. 6” in both places; correct the existing `ham17` entry in place, no new key. While there, delete the stray “.;” after “pp. 471–472” in the `zhu17` manifest locator. The gap contract itself (gap:newton-cell-strong-purity) cites only Definition 2.1(3), PDF p. 4, which is correct and unchanged.

2. **F02** (P3) he21 `cited_for` omits §0.4 and §0.5

   **Location.** `packages/HeckeStacksAndLocalShtukasPartII/sources.toml`, `he21` entry, `cited_for` list.

   **Claim.** The `cited_for` list records every README section that cites he21.

   **Witness.** `README.md:353` (§0.4) cites “he21, Theorem 4.4, p. 7”; `README.md:435` (§0.5) cites “he21, §§1.5 and 2.2, pp. 3–5”. Neither “§0.4” nor “§0.5” is in the he21 `cited_for` list (it starts at “§0.1”, “§0.2”, “§0.3”, “§0.6”). A script comparing every `(source id, section)` pair in the README against the manifest found these two pairs and no other omission across the 15 sources.

   **Exact repair.** Add “§0.4” and “§0.5” to the he21 `cited_for` list, in place.

Two findings, both P3 (a locator and a manifest bookkeeping slip). No P1 or P2 finding. The acceptance is conditional on the thirteen declared supplier gaps listed at the end of the Verified sound section.

## Verified sound

### Previous findings, checked one by one

The round-3 review had five findings; the repair report marked all five applied. Each was checked against the current text and its witness recomputed.

| Finding | Repaired passage (quoted) | Verification | Status |
|---|---|---|---|
| F01 (P1), pointwise functor on nonreduced algebras | `README.md:341–346`: “define X_≤μ(b) and X_μ(b) in equal characteristic as the reductions of the scheme-theoretic pullbacks … These field-point criteria do not specify the functors on arbitrary nonreduced algebras.” Perfect branch keeps Zhu’s pointwise functor. New Check at `:377`. | Witness recomputed: R=k[ε]/ε², g=1+εt⁻¹E₁₂, σ(g)=1+ε^q t⁻¹E₁₂=1, g⁻¹=1−εt⁻¹E₁₂, so r₁(g)=1−εt⁻¹E₁₂∉GL₂(R[[t]]); gK≠K since the lattice contains εt⁻¹e₁; every geometric fibre is the base point. zhu17 line 2114 restricts to perfect R; he14 line 208–211 gives the k-point condition. §0.5 (`:399`), §3.5 (`:881–886`, API `:899–903`, Check `:907`) and §3.6 (`:926`) carry the same reduced/perfect distinction. | Repaired |
| F02 (P2), cyclicity | `README.md:644`: “The extended semi-module is cyclic if and only if equality holds in the upper bound at every a∈A; general extended semi-modules need not satisfy this equality.” New Check `:655`. | vie06 line 137–138 (inequality, equality only when all b≥a lie in A), line 146 (cyclic definition), lines 152–163 (Example 3.5). Recomputed the example: B={−2,−1,2,5,6}, ΣB=10=5·4/2; A∌1; φ(−2)=0, φ(2)=0, φ(5)=2, φ(4)=2, φ(−1)=0, initial multiset (0,0,0,2,2)=μ; upper bound at −1 is 1 (3,−2∈A, −7∉A); φ(3)=1, φ(6)=1 agree with Figure 1; successor of −1 is 6 since φ(4)=2≠φ(−1)+1. | Repaired |
| F03 (P3), §3.4 API and third Check | `README.md:862–867`: membership iff nonempty intersection with matching integral κ_M, finiteness via positions with G-dominant representative ≤_ℤμ, d=−∞ for the empty intersection, K_M-orbit invariance. Third Check `:873`. | ham15 line 162–165 (Definition 2.5), 173–176 (Lemma 2.6, S_M(μ)⊂Σ(μ)_{M-dom}), 178–185 (Definition 2.7 and k_M invariance), 200–202 (fibre formula). Recomputed: n(u)diag(1,t)=[[1,ut],[0,t]] has gcd valuation min(0,v(u)+1), so position (1,0) iff u∈t⁻¹k[[t]]; cosets are u mod t⁻¹O, hence one point, d=0; ⟨ρ,ν_M−ν_G⟩=⟨(½,−½),(−1,1)⟩=−1; ⟨2ρ_N,ν_M⟩=⟨(1,−1),(0,1)⟩=−1; fibre 0−1+1=0; at μ_M=(2,−1) the entry t⁻¹ forbids position (1,0). Torus ADLV is discrete, G-ADLV has dimension ⟨ρ,(1,0)−(1,0)⟩=0, consistent. | Repaired |
| F04 (P3), locators | `:280` “equation (2.1) and the subsequent unnumbered definitions, p. 5”; `:1064` “pp. 1026–1028”; `:1501` “ghn15, §3.3, PDF p. 10; he21, §6.1, p. 13”; manifest ghn15 “§3.3 and Theorem 3.3.1, pp. 10–11”. | he21 line 201 is (2.1), line 208 unnumbered, both on p. 5; vie14 Proposition 5.5 at line 713 (PDF 18 = printed 1026), Corollary 5.6 at line 768 (printed 1028); ghn15 §3.3 heading at line 390 (PDF p. 10); he21 §6.1 at line 488 (p. 13). | Repaired |
| F05 (P3), “repaired” wording | `:1280`: “the lower-bound difference is ω₁∨+ω₂∨=α₁∨+α₂∨.” | Whole-README search for “repaired” finds no occurrence. In A₂, α₁∨+α₂∨=(2ω₁∨−ω₂∨)+(−ω₁∨+2ω₂∨)=ω₁∨+ω₂∨. | Repaired |

The repaired pattern of F01 (a geometric-point criterion presented as the functor) was searched for in the rest of the package: §§0.4, 0.5, 3.5, 3.6, 6.1 and 6.2 now say “geometric field points”, “reduction” or “perfect pullback” wherever a point criterion is used; §7.5 says “The image-cover statement asserts surjectivity on geometric points; dimensions are compared only after the bounded morphism … as in §0.5.” The F02 pattern (an unconditional equality that the source states only under a hypothesis) was searched for in §§2.1–2.5: the cyclic attainment in §2.4 and §2.5 carries “cyclic” explicitly. No further instance was found.

### Principles

No route-specific shortcut: the Conventions (`:49–52`) say “No theorem is restricted to a set of good primes”, p=2,3 are included, and every target whose initial proof is in the tame equal-characteristic setting names the transfer (§0.5 general flag realization). No re-planning: the base roadmap at its head `#1252` (HS0–HS4) mentions affine Deligne–Lusztig varieties only in a reference entry (line 2609 of its README); its layers are Hecke stacks, local shtuka towers and cohomology. Suppliers all precede this roadmap in the merge order (gate output below). No copied passage was found (the sampled statements are paraphrases with locators). No algorithm. `Suggested.lean` has one `import Mathlib`, one module docstring, the namespace, and no declaration, hence no sorry’d data and no `set_option`.

### Seeded source sample

All 15 sampled targets were read at their locators in the cached legal texts. There are no author-flagged unverified locators. No fetch was needed; no manifest key was added.

| Target | Source lines read | Outcome |
|---|---|---|
| 0.1 | he21 lines 190–192 (X_w(b)={gI: g⁻¹bσ(g)∈IwI}); he14 lines 208–211 (Definition 1.1, p. 372) | Statement and k-point condition agree; subgroup double-coset descent is the only group theory needed. |
| 0.4 | he14 lines 208–212; zhu17 lines 2109–2118 ((3.1.1)–(3.1.2), p. 455, perfect R), 1005–1016 (Lemma 1.22, p. 428); he21 line 283 (Theorem 4.4, p. 7); he14 lines 859–868 (§7.1, pp. 389–390) | Reduced classical pullback and perfect pointwise functor are distinguished as the sources require; hyperspecial agreement and parahoric variant supported. |
| 0.5 | he14 lines 171–212 (§§1.1–1.3, pp. 371–372; locally of finite type, finite-dimensional); zhu17 lines 2721–2788 (Definition A.13, Proposition A.15, Corollary A.16, pp. 471–472) | Dimension via deperfection, universal homeomorphism invariance and pfp models supported; the tame hypothesis p∤|π₁(G_der)| (he14 line 175) is retained as the initial case. |
| 1.4 | he21 lines 242–250 (§3.3, p. 6) | Definition of ⇒_σ, equivalence with the implication form, transitivity agree; the stated consequence of length-preserving equivalence follows from Proposition 3.3(1) at line 237. |
| 2.2 | vie06 lines 132–163 (Definition 3.4, Example 3.5, PDF pp. 3–4), 164–199 (Lemmas 3.6–3.8) | Definition, cyclicity, finiteness and the example agree (recomputed above). |
| 3.1 | zhu17 lines 2163–2182 (§3.1.2, pp. 456–457), 3094–3113 (A.3.4, pp. 480–481, geometric Frobenius σ_x); ghkr06 lines 835–843 (Proposition 5.3.1, PDF p. 19), 910–926 ((5.3.4), N[i] by δ_N-height, PDF pp. 20–21), 1223–1226 (Lemma 5.4.3, PDF p. 27) | Formula Σ_{α∈R_N} min(⟨α,ν⟩,0)=⟨ρ,ν−ν_dom⟩ and surjectivity agree; filtration contract matches (5.3.4); trace convention is geometric. |
| 3.6 | zhu17 lines 2224–2257 (reduction, Lemma 3.5, pp. 458–459), 2262–2277 (Lemma 3.7) | Norm Nm b=b_{τ₀}σ(b_{τ₁})⋯, ρ-pairing, Newton and defect identities agree. Zhu prints τ_i=σ^iτ₀ (line 2226); with (σx)_τ=σ(x_{σ⁻¹τ}) the displayed norm needs τ_i=σ^{−i}τ₀, as the README states and records as a misprint. |
| 3.7 | zhu17 lines 1168–1187 (Proposition 2.3, p. 432), 2283–2295 (proof of Proposition 3.3, pp. 459–460) | Fibre bound ≤⟨ρ,|μ•|−λ⟩ over the λ-stratum and equality at the top endpoint agree. |
| 4.1 | he21 lines 278–284 (Theorem 4.4, p. 7); he14 lines 877–899 (Theorem 7.1, pp. 389–390) | Criterion κ(b)=κ(t^λ), ν_b≤λ^♦ agrees; he14’s basic-Levi formulation is the source of he21’s reformulation. |
| 4.7 | he21 lines 273–274 (Theorem 4.2), 285–293 (proof, p. 7), 296–302 (§4.4, p. 8) | [b_{xt^λ}]=[t^λ], def 0, ℓ(xt^λ)−ℓη=ℓt^λ=⟨λ^♦,2ρ⟩; rotation to σ⁻¹(y)w_St^λ with η unchanged. |
| 6.2 | he21 lines 411–431 (X₁–X₃), 447–461 (X₄, X₅, pp. 11–12) | Five chain spaces, both restrictions, both forgetful maps, N₁ and N₂ agree with the README table. |
| 7.3 | he21 lines 499–507 (§6.2, p. 13); ghn15 lines 529–534 (η₂, η_δ), 543–549 (Lemma 3.6.3), 553–566 (Proposition 3.6.4), PDF pp. 14–15 | ghn15’s conjugator is η₂(x), the left finite factor (x in he21’s notation); he21 prints σ⁻¹(y). README uses x, correctly. |
| 8.2 | he21 lines 480–482 (Theorem 6.1), 509–525 (§6.3, pp. 13–14) | Lower bound via ⇒_σ and Theorems 4.1–4.2, upper bound Theorem 2.1 (line 210). |
| 8.3 | ghn15 lines 111–122 (δ-connected, Theorem B, PDF p. 3), 570–582 (Proposition 3.6.5); he15 lines 1482–1485 (Theorem 2.27, p. 37), 1552–1556 (Theorem 2.31, p. 39); he14 lines 1311–1327 (Theorem 12.1, p. 401) | Basic criterion needs no strict gap; λ=0 forces w=w₀ by the strip argument; dimension from he14 12.1 plus the general upper bound. |
| 8.4 | he21 lines 529–537 (§6.4 and Corollary 6.4, p. 14) | Source hypothesis λ≥ν_b+2ρ∨; README’s λ^♦≥ν_b+2ρ∨ is implied by it, and the proof (averaging the double-flat lower bound) goes through under the weaker form. |

### Adversarial calculations

Conventions: dim ∅=−∞, α∨=2ω∨ in adjoint A₁, matrices act on columns. “Keep” means the computed instance satisfies the stated hypotheses and conclusion.

| Statement | Instances | Values on the two sides | Result | Change |
|---|---|---|---|---|
| §0.4 reduced graph pullback vs pointwise | GL₂, R=k[ε]/ε², b=1, μ=0, g=1+εt⁻¹E₁₂; g=1 | σ(g)=1, r(g)=1−εt⁻¹E₁₂ with t⁻¹-coefficient −ε≠0; every geometric fibre position 0; r(1)=1 | Pointwise criterion admits g, graph condition rejects it | Keep (F01 verified) |
| §0.4 exact vs bounded | G_m b=ϖ, μ=0; GL₂ b=1, μ=(1,−1) | κ: 1≠0 gives ∅ with numerical value 0; identity point has position 0≤μ, ≠μ | Distinct loci | Keep |
| §0.4 forgetting I→K | GL₂, standard σ-stable lattice | X_s(1) fibre P¹∖P¹(𝔽_q), dim 1; X_1(1) fibre q+1 points, dim 0 | Not an isomorphism | Keep |
| §0.5 dimension | (A¹)^perf; split torus b=1, μ=0; empty mismatch | 1=1; infinite discrete set of dim 0; −∞ | No finite-component axiom | Keep |
| §1.4 ⇒_σ from ≈_σ | ℓw=ℓv, dim X_w=dim X_v for all b | 0 ≥ (ℓηw−ℓηv)/2 iff ℓηw≤ℓηv | Direction correct | Keep |
| §2.2 cyclic vs noncyclic | (2,1), A=ℕ; (5,4), B={−2,−1,2,5,6} | φ(0)=0=⌊1/2⌋, φ(1)=1 equal bounds; φ(−1)=0<1 | Characterization discriminates | Keep (F02 verified) |
| §2.5 superbasic formula | (2,1),(0,1); (2,1),(−1,2); (3,4),(0,0,4); (5,4),(0,0,0,2,2) | ½−½=0; 3/2−½=1; 4−1=3; ⟨ρ,μ⟩=6, 6−2=4 and |V|=4 | Bound attained | Keep |
| §3.1 Lang correction | GL₂ upper N, ν_M=(a,b), a−b=±2 | min(2,0)=0=⟨ρ,ν−ν_dom⟩; min(−2,0)=−2=⟨(½,−½),(0,2)−(2,0)⟩ | Sign fixed | Keep |
| §3.4 fibre formula | GL₂ M=T, μ=(1,0), b=diag(1,t), μ_M=(0,1); μ_M=(2,−1) | d=0, −1, −(−1): total 0; omit first term: 1; empty position d=−∞ | Both corrections needed | Keep (F03 verified) |
| §3.6 embedding cycle | degree 3, b=(1,U,V) | (σx)_τ=σ(x_{σ⁻¹τ}) forces τ_i=σ^{−i}τ₀; UV=[[2,1],[1,1]]≠VU=[[1,1],[1,2]], also mod 2 | Cycle detectable | Keep |
| §3.7 endpoint bounds | GL₂ bounds (1,0),(1,0) | top (2,0): fibre dim 0; (1,1): P¹, dim 1=⟨ρ,(1,−1)⟩ | Exact endpoint required | Keep |
| §4.1 bounded criterion | λ′≤_ℤλ | κ(t^λ′)=κ(t^λ); λ′^♦≤λ^♦ so ν_b≤λ′^♦ implies ν_b≤λ^♦ | Necessity on lower strata, sufficiency on top | Keep |
| §4.3 cell dimensions | GL₂ w=st^{(1,0)}, n=1,2, dilatation coordinate c=ϖc′ | dim I/I_n=4n; basic 5−4=9−8=1=1+0; ordinary 6−4=10−8=2=1+1; c=1,0 | Consistent with §4.6 | Keep |
| §4.7 cordiality | GL₂ x=s, λ=(1,0) | ℓw=2, ℓη=1, ⟨(1,0),(1,−1)⟩−0=1; 2−1=1 | Cordial | Keep |
| §5.1 double flat | A₁ y=s, λ=2ω∨ and ω∨; unitary A₂ λ=ρ∨, y=s₁ | 2ω∨−ω∨−ω∨=0; least dominant in ω∨+Q∨ above 0 is ω∨; η_J∨=dominant rep of −ω₂∨=ω₁∨, ω₂∨−_domω₁∨=ω₁∨ (ω₁∨+ω₁∨−ω₂∨=α₁∨) | Values as stated | Keep |
| §5.1 conditional upper bound | ρ_J∨+η_J∨∈Q∨ | dominant element of Q∨ is a nonnegative integral coroot sum, so λ is feasible, λ^♭♭≤_ℤλ | Hypothesis necessary (unitary example has λ−λ^♭♭=ω₂∨∉Q∨) | Keep |
| §5.2 factorization | A₁ x=y=s, λ=2ω∨; unitary A₂ x=y=s₁, λ=ρ∨ | w₁=st^{ω∨} (alcove (−1,0)→(1,2), length 2), w₂=t^{ω∨}s (fixes base alcove, length 0), product t^{−2ω∨}; A₂: β=ω₂∨+s₂ω₂∨=2ω₂∨−α₂∨=ω₁∨, w₁=t^{ω₂∨} (ℓ=2), w₂=t^{−ω₁∨+ω₂∨} (|−1|+|1|+|0|=2), product t^{α₂∨} (1+2+1=4=2+2), a=s₂*s₂=s₂ | Lengths additive, Demazure not ordinary product | Keep |
| §6.2–6.3 chain dimensions | same two instances | A₁: ℓB=0, ℓw₁=2, ℓ(x′y′t^γ)=2, N₁=N₂=0, d_w−d_{at^γ}=(2+0−2−0)/2=0; A₂: ℓB=2−1=1, N₁=(1+2−3)/2=0, N₂=1+1−1=1, (4+2−3−1)/2=1 | N₁+N₂ equals virtual difference | Keep |
| §7.1/§7.3 conjugator | w=xt^λy; ghn15 x=vε^μw | x⁻¹wσ(x)=t^λyσ(x)=t^λσ(σ⁻¹(y)x)=t^λσ(η); ghn15 v⁻¹xδ(v)=ε^μwδ(v)=ε^μδ(η_δ) | x, not σ⁻¹(y) | Keep |
| §7.3 with averaged gap | λ^♦−ν_b∈Σℚ>0α∨, b′∈[b]∩M_J | ν_b−ν^M_{b′}∈Σℚ≥0α∨, so λ^♦−ν^M_{b′} has positive coefficient outside J, not in Q_J∨⊗ℚ | Averaged hypothesis suffices and is implied by he21’s | Keep |
| §7.4 seed | A₁ a=s, γ=α∨; he14 11.6 with J=S, y=1 | T_{s₁s₀s₁}≡zT_{s₀s₁}+T_{s₀}, coefficient 1 of degree 0, (3+1+0)/2=2; exponent ℓa−ℓc≥0 since c is twisted Coxeter | Matches he14 line 1248 | Keep |
| §7.5 twisted quotient | G_m, q=2, ζ³=1, σ(ζ)=ζ² | (1,1)~(ζ,ζ⁻¹σ(ζ))=(ζ,ζ); image ζ·ζ·ζ⁻²=1; untwisted (ζ,1) maps to ζ⁻¹≠1 | Twist necessary | Keep |
| §8.1–8.2 rank one | PGL₂ b=1, w=st^{nα∨} | alcove (2n,2n+1) shrunken, η=s, ℓ=2n+1, dim n+1; n=1,2 give 2,3; pure translation has η=1, empty | Both directions | Keep |
| §8.2 unitary | A₂ x=y=s₁, λ=ρ∨, b=1 | λ^♦=ρ∨, (λ^♭♭)^♦=ρ∨/2≥0, κ=0, supp_σ(s₂s₁)=S, (4+2−0)/2=3 | Dimension 3 | Keep |
| §8.3 λ=0 | A₂ w=w₀; w∈W₀ general | shrunken iff w⁻¹α<0 for all α>0 iff w=w₀; (3+3−0)/2=3 | Finite DL variety | Keep |
| §8.4 range | 2ρ∨−ρ_J∨−η_J∨ | ⟨·,α_s⟩=2−{0,1}−{0,1}≥0, dominant, so in ℚ≥0 coroot cone; (λ^♭♭)^♦≥λ^♦−2ρ∨≥ν_b; strict gap from 2ρ∨ | Generalized hypothesis sound | Keep |
| Gap: parabolic-root-length | A₂ w=w₀, y=s₁s₂ | inversions of y⁻¹=s₂s₁: {α₁, α₁+α₂}; ℓ(w₀s₁s₂)=1=3−2 | Matches gh10 Lemma 2.6.1 | Keep |
| Gap: finite-coxeter-basic-class | A₁, τ=1, μ=0 and α∨ | s₁ and s₀=t^{α∨}s₁ are minimal, length 1, not conjugate in the infinite dihedral W_a | One (J,c) cannot serve both inputs | Keep (source issue below) |

### Library, ownership and supplier audit

Pins from `lake-manifest.json`: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Opened at the pin: `Mathlib/GroupTheory/DoubleCoset.lean:37` (`doubleCoset`, arbitrary sets), `:44` (`mem_doubleCoset`), `:51` (`doubleCoset_eq_of_mem`, subgroups); `Mathlib/GroupTheory/Coset/Defs.lean:66`, `:71` (`leftRel`, `leftRel_apply`); `Mathlib/Data/Finset/Defs.lean:75`; `TauCeti/GroupTheory/DoubleCoset/Basic.lean:100` (`mul_mem_doubleCoset_iff`, hypothesis b∈H); `TauCeti/GroupTheory/Coxeter/Parabolic.lean:101`, `:233`, `:280`, `:330`; `TauCeti/LinearAlgebra/RootSystem/Inversions/Basic.lean:50`; `TauCeti/LinearAlgebra/RootSystem/Inversions/Length.lean:148`, `:172`, with the standing hypotheses at `:82–85` (finite index type, characteristic-zero domain, crystallographic, reduced). Each matches the README’s description, including what it lacks (no normality, no cancellation equality).

Ownership: `roadmaps grep` over main and the 367 indexed open heads for “affine Deligne”, “cordial element”, “semi-module”, “Demazure product” and “shrunken” found, outside this package, only reference-list entries (BunGAndNewtonStrata lines 2540–2560, ReductiveGroupsPartII lines 7267–7269, GeometricSatakeAndFusion lines 2283–2295, HeckeStacksAndLocalShtukas line 2609), GS0’s mention of a Demazure product it attributes to RG2.4 (GS line 973; RG2.4 at head `#785` has no Demazure product, only Chevalley–Demazure group schemes), and main’s SchubertGeometry, whose Demazure material is operators and characters on finite flag varieties, not the affine Demazure product. No roadmap owns these ADLV constructions. The board package index was read; no listed board package concerns ADLVs. Open pull requests without files were not checked beyond the indexed heads.

Supplier citations, each resolved at the current head or on main: ReductiveGroupsPartII (`#785`) RG2.0.4 (line 853), RG2.1.4 apartment (2138), RG2.1.5 (2447), RG2.3 parahoric-subgroup (4290), associated-parahorics (4533), lang-theorem (5204), lang-for-pro-algebraic-groups (5223), RG2.4 iwahori-weyl-group (5536), length-and-bruhat-order (5657), affine-tits-system (5714), kottwitz-quotient (5749), simple-cell-multiplication (5818), translation-length-formula (6105, states ℓ(xt^λ)=ℓx+ℓt^λ with its own chamber), dominant-normal-form (6128), dominant-coinvariant-cocharacters (6 mentions), iwahori-bruhat-decomposition (431). BunGAndNewtonStrata (`#1241`) §§0.5, 0.6, 1.7, 1.8, 1.10, 1.11, 1.13, 1.15, 1.18, 1.21, 1.27, 1.30, 1.43, 1.45 at lines 177–1313 with the cited anchor names. GeometricSatakeAndFusion (`#1235`) GS0 “Witt bounds, determinant lines and projective models” (526), perfect-model-and-etale-comparison (771), equal-characteristic-schubert-models (783), parahoric-ind-projectivity (401), flag-incidence-correspondences (969), flag-convolution-fibres (993, lower bounds (ℓu+ℓv−ℓuv)/2 and ℓu+ℓv−ℓ(u*v)), GS1 semi-infinite-affineness (1075, split group, dimension ⟨ρ,μ+λ⟩ when nonempty), GS2 convolution-diagram (1418), rational-special-fibre-convolution (1455, fibre ≤⟨ρ,Σμ_i−λ⟩). SchemeAndStackFoundations on main: §0.7 (line 755, `fibre_dimension_formula` at 785), §0.9 (848), §§0.23–0.26 (1475–1640), Layer 1 (2044). TraceFormula (`#196`) Layer 11 (381), `EllAdicRealization` (45). SmoothRepresentationsOfLocalGroups (`#785`) SR.1.5 iwahori-matsumoto (1504; split G, (T_s−q)(T_s+1)=0, no cocenter). RootSystems on main, Layers 3, 4, 6 (README lines 274, 296, 356). RootSystemsPartII RS2.1 integral-order at `packages/RootSystemsPartII/design/README.md:38`; the resolver lead for RS2.1 is a false positive for a board design. HeckeStacksAndLocalShtukas (`#1252`) HS0–HS4 at lines 238–2245.

Gaps: the 13 slugs, suppliers and `needs` sentences in `design/plan.json` match the README contracts exactly after whitespace normalization (two multi-line contracts compared by script). Every `gap:` slug used in a Needs line is declared and every declared slug is used. Minimality checked against the suppliers at their heads: BunGAndNewtonStrata contains no “superbasic”, no chain-length, strong-purity or generic-cell statement; RG2.3 has no parabolic unipotent filtration N[i]; RootSystemsPartII’s design (lines 594–602) routes dominant subtraction, Demazure products and affine reduction to a separate proposed continuation and states no such target; SR.1.5 has no cocenter; GS1’s semi-infinite result is for the split Borel case. No gap has supplier `none`.

Dependency gate, run as prescribed with `--movable`, exited 0:

```text
depcheck: 56 roadmaps, 639 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line.

### Shape, Lean and headlines

Every section with a definition (API list) has at least three Checks: counts 5, 4, 4, 8, 4 (§§0.1–0.5), 4 (§1.4), 5, 5, 4 (§§2.1–2.3), 3, 5 (§§3.4–3.5), 4, 3, 4 (§§4.2–4.4), 9, 5 (§§5.1–5.2), 4, 4 (§§6.1–6.2), 5, 3 (§§7.1, 7.5). Every target has a locator and a Needs line (47 of 47); every layer ends with Examples and Dependencies. No process words, pull-request numbers, LaTeX delimiters, machine paths or “optional/deferred” wording were found; the word “Lemma” occurs only inside source citations.

`lake env lean` on `Suggested.lean` from the content checkout exited 0 with empty output in 26 s; the file imports only Mathlib, so no Tau Ceti module build was needed. Outside comments the file consists of `import Mathlib`, the namespace and its end: zero declarations, zero `sorry`, zero `set_option`, so the `#check @name` comparison and the one-tactic probe have no entries and nothing is padding. The headline theorems listed at `README.md:232–237` (minimal-class and reduction theorems, dimension equals class-polynomial degree, superbasic charts, Lang and Levi comparisons, norm and iterated spherical dimensions, spherical nonemptiness, virtual upper bound, generic Newton dimension and cordial saturation, translation-family cordiality, two-correspondence reduction, Levi obstruction and basic seed, the shrunken criterion with its basic and large-translation specializations) are each named in the module docstring with the missing carrier (affine flag moduli and their ADLV loci, lattice-moduli strata, admissible loop spaces, torsor affine Grassmannians with Frobenius-graph pullbacks, Newton-stratified Iwahori cells, flag-incidence moduli, Kottwitz-set interface). None is statable at the pins with only simple definitions: Mathlib’s `Scheme` and `WittVector.Isocrystal` carry no reductive-group affine Grassmannian or ADLV, and a set of cosets cannot carry the dimension statements. No stand-in is stated.

Declared supplier gaps this acceptance is conditional on: unipotent-linearization, demazure-product, twisted-redmin, straight-finite-parabolic, finite-coxeter-basic-class, parabolic-root-length, dominant-subtraction, superbasic-classification, newton-poset-length, newton-cell-strong-purity, newton-cell-greatest, levi-intersection-dimension, twisted-affine-cocenter.

## Not verifiable

- Ownership against open pull requests whose files the brief does not give was checked only through the indexed heads reachable by `roadmaps grep` and `roadmaps show`; pull requests outside that index were not inspected.
- The cited theorems’ internal proofs were not re-derived beyond the steps the package restates; in particular he14 Proposition 11.7 is checked as a statement and its He–Yang reference was not opened.
- The declared supplier extensions are contracts; their future implementations were not assessed.

## Source issues

- **Misprint** in he21 at §6.2, p. 13: the source says the alcove conjugator is σ⁻¹(y); it should be the left normal-form factor x, since ghn15 Lemma 3.6.3 uses η₂, the left finite factor, and x⁻¹wσ(x)=t^λσ(η_σ(w)); affects the proof.
- **Misprint** in zhu17 at §3.1.3, p. 458: the source says τ_i=σ^iτ₀; it should be τ_i=σ^{−i}τ₀ for the displayed norm b_{τ₀}σ(b_{τ₁})⋯ to be the ordered norm, since (σb)_τ=σ(b_{σ⁻¹τ}); affects the proof.
- **Misprint** in zhu17 at (3.1.3), p. 455, and Theorem 3.1, p. 456: the source says the dimension expression holds without qualification; it should be restricted to nonempty loci, since GL₂, b=1, μ=(1,0) is empty by κ while the expression is 1/2; affects a stated result.
- **Error** in he14 at Proposition 11.7, p. 400: the source says one pair (J,c) serves every allowed μ and every δ-Coxeter w; it should let (J,c) depend on the input, since in affine A₁ with τ=1 the inputs μ=0 and μ=α∨ reach the non-conjugate minima s₁ and s₀; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "a96277dfe30db2f950f7adf6a6475fbb0f4eb2b9", "job": "REV-PKG-HeckeStacksAndLocalShtukasPartII~4", "model": "fable", "worker": "chris-i"} -->
