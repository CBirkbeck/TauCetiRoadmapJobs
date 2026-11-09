# Review of SchubertGeometry (pull request #1224 at 79a11f9)

**Verdict:** needs changes

Incremental re-review of the 30 lines changed since df1359a: three README bullets or sentences in S4.2, S4.3 and S4.4, and the S3/S4 items of the `Suggested.lean` docstring. The intermediate commit c339e23c, whose statements were removed again at this head, is read as the tested repair.

## R01 (P2) — The branch still builds at Tau Ceti a91d3aa, so README and Lean disagree about the pin and the S4 headlines stay unstated

**Location:** `TauCetiRoadmap/SchubertGeometry/Suggested.lean:18–27`: “S4's operator-stability and generation theorems (S4.2, S4.3) are statable on the Lakshmibai–Seshadri encodings `TauCeti.LSPath` … none of which the Tau Ceti revision this folder's manifest pins has.” `README.md:3`: “consumed from the pinned Tau Ceti”. `README.md:16`: “already in the pinned Tau Ceti”. The From Tau Ceti contract runs over lines 225–336.

**Claim:** The README's supplier contract cites dozens of `TauCeti.LSPath`, `TauCeti.PLPath`, `TauCeti.NormalCrystal` and Demazure declarations as present at the pin. The docstring says the pin has none of them. Both cannot hold at one pin.

The pull request does not change `lake-manifest.json`, so after merging, the folder builds at main's Tau Ceti `2fd255d`. At that pin the docstring sentence is false, and the S4.2, S4.3 and S4.4 headlines are statable but absent. Commit c339e23c stated all four theorems. This head removed them because the branch pin cannot build them, and rewrote the sentence that the previous repair asked to delete.

**Witness:** `lake-manifest.json` pins Tau Ceti `a91d3aa`, where no file mentions `LSPath`, `PLPath`, `NormalCrystal` or `dotAlternatization`. Main pins `2fd255d`, which has `LSPath/Basic.lean:217` (`toPLPath`), `LSPath/RootOperator.lean:662` (`lower`) and `Denominator/Integral.lean:209` (`dotAlternatization`). `git merge-tree --write-tree origin/main HEAD` exits 0.

**Repair:** This is for the worker or a human: a README/Lean repair round cannot move the pin.

1. Merge origin/main into the branch. The merge is conflict-free, and afterwards `lake-manifest.json` pins Tau Ceti `2fd255d` and Mathlib `1b1ccf4b`.
2. Restore the folder as of c339e23c (`git checkout c339e23c -- TauCetiRoadmap/SchubertGeometry`). Its `Suggested.lean` states four theorems:
   - `exists_toPLPath_eq_of_lower_eq_some`
   - `exists_toPLPath_eq_of_raise_eq_some`
   - `reflTransGen_lower_toPLPath_straight`
   - `weylDenominator_mul_finsum_single_eq_dotAlternatization`

   They use the hypothesis pattern of `TauCeti.LSPath.forall_raise_eq_none_iff` (`LSPath/Highest.lean:73–78`), and its README names them in S4.2–S4.4.

   Its docstring lists as missing only the crystal structure on `TauCeti.LSPath`, which the component and tensor theorems need. That is true at `2fd255d`: no `Crystal/` file mentions `LSPath`, and README lines 333–336 say the same.

This also repairs R02.

**Retest:** At `2fd255d`, every name the four statements use exists and gets the binders it needs; see the "Repair" rows of the table. I could not elaborate them there, because this job runs Lean only in the pull request's worktree at its own pin. After the merge, `lake env lean TauCetiRoadmap/SchubertGeometry/Suggested.lean` should report only `sorry` warnings, and the gate's build should pass.

## R02 (P3) — The new S4 docstring item places `TauCeti.weylDenominator` in a file it is not in and calls it absent from the branch pin

**Location:** `TauCetiRoadmap/SchubertGeometry/Suggested.lean:21–27`: “`TauCeti.weylDenominator` and `RootPairing.dotAlternatization`; … These carriers live in … `TauCeti/LinearAlgebra/RootSystem/Weyl/Denominator/Integral.lean`, none of which the Tau Ceti revision this folder's manifest pins has.”

**Claim:** `TauCeti.weylDenominator` is defined in `Denominator/Basic.lean` at both pins, and README line 167 says so. Only `RootPairing.dotAlternatization` is in `Integral.lean`. The S4.4 headline is still unstatable at the branch pin because of `dotAlternatization` and `LSPath`, but the location claim is wrong.

**Witness:** At the branch pin `a91d3aa`, `Weyl/Denominator/` holds `Basic.lean`, `Identity.lean` and `Reflection.lean`, and `Basic.lean:72` defines `weylDenominator`. At `2fd255d` it is the same `Basic.lean:72`, and `Integral.lean:209` defines `dotAlternatization`.

**Repair:** R01's repair replaces this item with c339e23c's docstring, which makes no location claim. If the item stays, write “`TauCeti.weylDenominator` (`Denominator/Basic.lean`) and `RootPairing.dotAlternatization` (`Denominator/Integral.lean`)” and say that only the latter is missing at the pin. Tested on the refuting instance: `Basic.lean:72` at `a91d3aa` matches the corrected wording.

## Previous findings

- R01 — not repaired: `lake-manifest.json` still pins Tau Ceti `a91d3aa`. `Suggested.lean` declares nothing, and line 27 reads “none of which the Tau Ceti revision this folder's manifest pins has.” The four S4 theorems stated at c339e23c were removed at 79a11f9. Now R01.

## Verified sound

**Scope and gate.**
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/SchubertGeometry'` is empty. Since df1359a, `README.md` changed by 6 lines and `Suggested.lean` by 24, matching the folder diff in `changes.md`.
- My run of the gate on 79a11f9 reports every check at 0 and `OK`. The worker's run also reports `build=0`.
- The dependency check printed `depcheck: 238 roadmaps, 2353 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- `lake env lean TauCetiRoadmap/SchubertGeometry/Suggested.lean`, run from the worktree, exits 0 with no output in about 20 s.
- The file has one module docstring, `import Mathlib`, an empty `namespace TauCetiRoadmap.SchubertGeometry` and no declaration. So there is nothing to probe with one tactic, no `#check @name` signature to compare, no sorry'd data, no `set_option` and no fully qualified name that can collide.
- The changed lines contain no LaTeX delimiter, `lemma`, pull-request number, process word or machine path.

**Changed README passages.**
- S4.2, third bullet: the added clause “for any realization whose height forms agree with the simple coroots on the lattice” is the hypothesis `hF : ∀ i m, F i (f m) = P.coroot' i m` of the native `TauCeti.LSPath.forall_raise_eq_none_iff` (`Highest.lean:73–78` at `2fd255d`). Stability under any such realization follows from the stability in `X⊗ℚ` (Littelmann1995 Corollary 2(a), line 520, p. 512) through the native naturality `TauCeti.PLPath.lower_map` and `raise_map` (`LinearMap.lean:71,80`). Injectivity is not needed; see the table.
- S4.3, third bullet: Littelmann1995 Corollary 3 (line 524, p. 512) says that for dominant λ every LS path is `f_{α₁}⋯f_{α_r}π_λ`, and the bullet says exactly that on realized paths.
- S4.4, inserted clause: Theorem 9.1 (line 815, p. 520) is about `Char M_π = Σ e^{η(1)}` (line 814), a sum over endpoints only, so the statement needs no crystal structure. Lemma 4.5(a) (line 483, p. 511) puts `η(1)` in `X`, so `wt π` exists. An injective realization makes it unique. The table shows that injectivity is necessary.
- The README's own statement that the native files do not put a crystal structure on `TauCeti.LSPath` (lines 333–336) holds at `2fd255d`: no file under `RepresentationTheory/Crystal/` mentions `LSPath`.

**Seeded sample (where it meets the change).** For S4.2, Littelmann1995 Proposition 4.7 starts at line 502 (p. 511) and its parts a) and b) end at line 517 (p. 512). Corollary 2 is at line 520 (p. 512). This matches the README's “Proposition 4.7 and Corollary 2, pp. 511–512”: hypotheses are dominance, the L-S path condition and a simple root. For S4.3, “Corollary 3, p. 512” is line 524. For S4.4, “Theorem 9.1, p. 520” is line 815, with ρ fixed at line 811 as stated. Page markers are printed page minus 497 (marker 14 is printed p. 511, line 464).

**Library declarations opened.**
- At `2fd255d`:
  - `LSPath/Basic.lean:217` (`toPLPath`), `:234` (`straight`), `:390` (`finite`, a `Finite` instance, so c339e23c's `∑ᶠ` is the right sum)
  - `LSPath/PLPath.lean:464` (`endpoint`)
  - `LSPath/RootOperator.lean:662,671` (`lower`, `raise`; explicit form and vector)
  - `LSPath/Highest.lean:73`
  - `LSPath/Realization.lean:96` (`toPLPath_injective`: injective on Wλ, no common ray)
  - `LSPath/LinearMap.lean:71,80`
  - `Denominator/Basic.lean:62–72` (`weylDenominator`, needs `[CharZero R] [Finite ι]`)
  - `Denominator/Integral.lean:139,203,209` (`dotAlternatization`, needs `[P.IsReduced]` and `[Fintype P.weylGroup]`)
  - `Chamber.lean:141` (`RootPairing.dominantChamber`)
  - `Crystal/Character.lean:38` (`formalCharacter = Σ_{x:B} single (wt x) 1` in `ℤ[X]`)
- At `a91d3aa`: `Weyl/` has no `Demazure/`; `Denominator/` holds `Basic`, `Identity`, `Reflection`; `RepresentationTheory/` has no `LSPath/` or `Crystal/`.

**Ownership and cross-roadmap citations.**
- `roadmaps grep 'LSPath|dotAlternatization|PLPath\.lower' --lean-only` matches only this folder, and `TauCeti\.LSPath` appears in no other README on main or at any open head. So S4's operator-stability, generation and character statements have no second owner, and c339e23c's names collide with nothing.
- `scratch/overlaps.md`: no open pull request changes this roadmap, and no id is dropped in either direction. The closest in vocabulary (ReductiveGroups revisions, SpringerResolutionAndCharacteristicCycles) are unchanged from the previous review.
- The five leads of `scratch/citations.md` (BrionFlags, KnutsonBottSamelson, KnutsonDemazure, SerreGAGA, KnutsonSymplectic) are source ids of the manifest, not roadmaps, so they are not findings.
- The changed lines cite no roadmap.

**Adversarial table.** Rows tagged (r10) are carried from the previous report for statements the diff leaves untouched, with the values computed there (r10 carried the r8/r9 rows). Rows without a tag were computed this round.

| Statement | Instances | Values computed on each side | Result |
|---|---|---|---|
| **S4.2 bullet 3 (changed)** | SL₂ shape 2, f(mω)=m∈ℚ, F=id; GL₂ λ=(1,0), f(x,y)=x−y (not injective), F=id; SL₂ shape 2 with F=2·id | f₁(straight): H=2t, t₀=0, t₁=1/2, s(2)=2−F(2)·f(α)=−2; path (−2,2) at breaks 0,1/2,1, endpoint 0 = realization of (s₁,1;0,1/2,1). GL₂: H=t, s(1)=1−1·2=−1=f(0,1), the straight encoding of direction s₁, so injectivity is not needed. F=2·id: t₁=1/4, s(2)=2−4·2=−6, velocity −6∉{±2}: not a realized encoding, so the clause is necessary | pass |
| **S4.3 bullet 3 (changed)** | GL₃ λ=e₁ (W_λ=⟨s₂⟩); λ=0; SL₂ λ=−ω | Directions e,s₁,s₂s₁, endpoints e₁,e₂,e₃, reached by 0,1,2 lowerings (f₁, then f₂); f₂ on straight e₁ undefined since ⟨e₁,α₂∨⟩=0. λ=0: one encoding, reflexive case. λ=−ω: straight has H=−t, e₁ defined, not highest, so “dominant” is needed | pass |
| **S4.4 inserted clause (changed)** | PGL₂ X=ℤα, f(α)=2; GL₂ λ=(1,0), f(x,y)=x−y; empty root system | PGL₂: realized endpoints 2,0,−2, wt α,0,−α; Δ·Σ=e^α−e^{−2α}=J(e^α). GL₂ with wt(straight)=(2,1) (also f-preimage of 1): Δ·Σ contains e^{(2,1)}, but J=e^{(1,0)}−e^{(−1,2)}; correct wt (1,0),(0,1): e^{(1,0)}+e^{(0,1)}−e^{(0,1)}−e^{(−1,2)}=J, so injectivity is necessary. Empty: Δ=1, J(e^λ)=e^λ, one encoding | pass |
| **Docstring S3 item (changed)** | branch pin a91d3aa; main pin 2fd255d | a91d3aa `Weyl/`: no `Demazure/`. 2fd255d: `Demazure/{Basic,Braid,LongestElement,Parabolic}.lean`. True at the branch pin, false after the merge | R01 |
| **Docstring S4 item (changed)** | both pins | a91d3aa: 0 files mention LSPath/PLPath/NormalCrystal/dotAlternatization, but `weylDenominator` is at `Basic.lean:72`. 2fd255d: all present. Crystal on LSPath: absent at both, so that clause is true | R01, R02 |
| Repair: stability (c339e23c) | λ=0; ι empty; SL₂ shape 2 | λ=0: realized path constant 0, H≡0, lower = none, vacuous. ι empty: no `i : b.support`, vacuous. SL₂: as row 1. Binders: `[Field 𝕜] [LinearOrder 𝕜] [IsStrictOrderedRing 𝕜]`, `hlam`, `hF` as at `Highest.lean:73–76` | pass (read) |
| Repair: generation (c339e23c) | λ=0; GL₃ e₁ | `ReflTransGen` reflexive at λ=0; GL₃ chain straight→f₁→f₂ realized in any hF-realization by `lower_map` | pass (read) |
| Repair: character (c339e23c) | λ=0; PGL₂ α; ι empty | Δ·1=Δ=J(1) (Weyl denominator identity); PGL₂ as row 3; ι empty: 1·e^λ=e^λ. Instances: `[P.IsReduced]` in scope, `[Fintype P.weylGroup]` in signature, `[CharZero ℤ]`, `[Finite ι]` | pass (read) |
| S1.0 canonical line | GL₂ over ℤ, Borel scheme ℙ¹ | det(End E)=O; 0→Lie B→End E→Hom(L,E/L)→0 with L=O(−1), E/L=O(1): Hom=O(2); det(Lie B)*=O(2), degree 2; weight-one line degree 1 | pass (r10) |
| S1.0 Borel of ℍ | adjoint group of (−1,−1)/ℝ | conic x²+y²+z²=0, norm form of pure quaternions; no real point, ℙ¹ over ℂ | pass (r10) |
| S1.0 cells | GL₃/𝔽₂; ℙ² | lengths 0,1,1,2,2,3: 1+2+2+4+4+8=21=168/8; 1+2+4=7 | pass (r10) |
| S1.1 incidence | rank 3, ranks (1,2); k[ε] | ℙ²×ℙ²* dim 4, flag dim 3; F₁→E/F₂ sends e₁+εe₃ to ε·ē₃≠0 | pass (r10) |
| S1.3 pivots | Gr(2,4): (1,2),(1,3),(3,4); N=0 | Σ(p_i−i)=0,1,4; λ=(2,2),(2,1),(0,0), 4−|λ| agrees; rank 0 point, rank 1 empty | pass (r10) |
| S1.5 Gram | columns (u_{1..r}; u_{r+1..m}, f_{r+1..m}; f_{1..r}) | blocks (1,3)=I_r, (3,1)=−I_r, (2,2)=J₀ | pass (r10) |
| S1.5 product/inverse | r=s=1, Y=(1,2), Y′=(3,4), Z=5, Z′=6 | YᵀJ₀Y′=4−6=−2; product ((4,6),9), reversed sign 13; Z+(−Zᵀ)−YᵀJ₀Y=0 | pass (r10) |
| S1.5 conjugation | l=diag(A,D,A^{−T}) | (1,2) block AYᵀDᵀJ₀ by DᵀJ₀D=J₀; (2,3) DYAᵀ; (1,3) AZAᵀ | pass (r10) |
| S1.5 dimension | m=2: r=1,2,3 | 3, 3, empty; (1+3)+(2+1)=7, (4+0)+(0+3)=7, 10−7=3 | pass (r10) |
| S2.3 weights | Q=i; Q=ii | β=±α_i; fibres λ, s_iλ; δ(ii)=s_i; sections ε↦e,s_i,s_i,e | pass (r10) |
| S2.5 kernel | SU₂×U₁→U₂ | {(I,1),(−I,−1)}, size 2 | pass (r10) |
| S3.1 sign | SL₂, λ=1; GL₂ det | degree ⟨λ,α∨⟩=1; det restricts to degree 0 | pass (r10) |
| S3.2 dual weight | B− acting on ev_e | (b·ev_e)(f)=λ(b)⁻¹f(e): weight −λ | pass (r10) |
| S3.3 D_i strings | m=0,−1,−2 | e^λ; 0; −e^{λ+α} (augmentations 1,0,−1) | pass (r10) |
| S3.3 Δ_i=ιD_iι | m≤0, m=1, m≥2 | Σ_{j=0}^{−m}e^{λ+jα}; 0; −Σ_{j=1}^{m−1}e^{λ−jα}; s_iN=−e^{−α}N | pass (r10) |
| S3.6 word 121 | χ₀=e^{(0,5,7)} | augmentations 1,6,33,81 | pass (r10) |
| S3.6 coefficient formula | 46 weights | 1+min{2,a,b,c,7−a,7−b,7−c}=χ₃; histogram 21/15/10; (4,4,4)↦3 | pass (r10) |
| S3.6 word 212 | ψ₁..ψ₃ | 1,3,21,81; ψ₃=χ₃; S₃-invariant | pass (r10) |
| S3.6 Gelfand–Tsetlin | 7≥u≥5≥v≥0, u≥w≥v | 81 patterns, equal to χ₃ coefficientwise | pass (r10) |
| S3.4 longest word | D₁D₂D₁e^{(7,5,0)} | equals χ₃ | pass (r10) |
| S4.1 shift obstruction | φ(1/2)=1/4, χ=(1,1) | (3/4,1/2): x−2y=−1/4; canonical (1,1/2): 0 | pass (r10) |
| S4.2 lowering | SL₂ shape 2 | straight→(s₁,1;0,1/2,1), endpoint 0→(s₁;0,1), endpoint −2 | pass (r10) |
| S4.2 central path | GL₂ (t,t) | height 0; strings 0 | pass (r10) |
| S4.3 connectedness route | τ₀≠e | some ⟨τ₀λ,α_i∨⟩<0 ⇒ e_i defined; top of string has first direction s_iτ₀<τ₀ | pass (r10) |
| S4.3 bond 2 | a=1/2, 1/3 | 2·(1/2)=1; 2·(1/3)=2/3; three encodings; break 1/3 gives five | pass (r10) |
| S4.3 bond sign vs CFL | x>y=s_βx | −⟨xλ,β∨⟩=⟨yλ,β∨⟩ agrees with CFL | pass (r10) |
| S4.3 transport laws | T(λ,χ;σ) | composite types match T(λ,χ+ψ;σ); inverse T(λ+χ,−χ;σ+χ) | pass (r10) |
| S4.4 PGL₂ | X=ℤα, λ=α | (1−e^{−α})(e^α+1+e^{−α})=e^α−e^{−2α}=J(e^α); e^{α/2}∉ℤ[ℤα] | pass (r10) |
| S4.4 SL₂ | X=ℤω, λ=ω | e^ω−e^{−3ω}=J(e^ω); ×e^ω: e^{2ω}−e^{−2ω} | pass (r10) |
| S4.4 λ=0 | nonempty W | J(1)=Δ ⇒ char B(0)=1; unshifted alternant gives 0 | pass (r10) |
| S4.4 ρ−wρ | w=s_i | ρ−s_iρ=α_i | pass (r10) |
| S4.4 domain step | ℤ[X], X free | Δ≠0 in a Laurent ring ⇒ char=D_{w₀}(e^λ) | pass (r10) |
| S4.4 adjoint | sl₃ matrix units | [E₁₂,E₂₁]=H₁; [E₁₃,E₃₁]=H₁+H₂; determinants 1,1,−1 | pass (r10) |
| S5.1 trace | char 2, k[x] | Tr(1)=0, Tr(x)=1, Tr(x³)=x; σ(x²)=x | pass (r10) |
| S5.2 ideals | σ=Tr(x·) | σ(x·x^a)∈(x) for odd a; σ(x²)=x∉(x²) | pass (r10) |
| S5.3 kernel | SL₂→PGL₂, char 2 | μ₂=k[u]/((u−1)²), nonreduced | pass (r10) |
| S5.5 mixed union | ℙ¹, Y={0,∞}, λ=0 | H⁰(O_Y)=k², H¹(I_Y)=H¹(O(−2))=k | pass (r10) |
| S5.7 Q=ii | L=O(−2) | H⁰=0, H¹=k both sides | pass (r10) |
| S6.4 SL₂ | degree 2 | three products vs 4; at [1:0] only x² survives | pass (r10) |
| S7.1 covers | GL₃, ω₁, w=s₁s₂ | v=s₁: coefficient 0; v=s₂: β=α₁+α₂, coefficient 1 | pass (r10) |
| S7.1 non-cover | w=s₂s₁ | v=s₂: coefficient 1; v=s₁: bond 1 | pass (r10) |
| S7.1 bond sign | v=ws_β<w | −⟨wλ,γ∨⟩=⟨λ,β∨⟩ | pass (r10) |
| S7.1 ρ | w=s₁s₂, λ=ρ | 1 on X(s₁), 2 on X(s₂) | pass (r10) |
| S7.2 cone | Gr(2,4), X_(1) | p₂₄=0 ⇒ X_(2)∪X_(1,1); dims 3 and 1 | pass (r10) |
| S8.1 classes | ℙ¹; Gr(2,4) | [O_e]=[O]−[O(−1)], χ=1; rank 6 | pass (r10) |
| S8.2 | SL₂, t=[O(−1)] | (1−t)²=0 ⇒ [O(1)]=2−t | pass (r10) |
| S8.3 | SL₂, z | 1⊗z: z, z⁻¹; z⊗1: z, z | pass (r10) |
| S8.4 | PGL₂ | [O(2)]=1+2u; image misses u | pass (r10) |
| S8.5 | ℙ¹ | χ(O)=1, χ(O(−1))=0, χ(O(−2))=−1 | pass (r10) |
| S9.0 base change | ℙ¹ over ℂ[t] | H⁰=0, H¹=A/t; at t=0 H⁰=ℂ | pass (r10) |
| S9.0 dual numbers | Spec ℂ[ε]/(ε²) | H⁰ basis 1,ε both sides | pass (r10) |
| S9.5 | GL₂ (t,0) | f: endpoint (0,1); +(1,1): (2,1) | pass (r10) |
| S9.6 | SU₂; SU₃ | ℝP²: ℤ,0,ℤ/2; χ=1, 1 | pass (r10) |
| S9.7 Kähler form | J_flag=sign(α(p))J_α | B(v,w)/|α(p)|>0 | pass (r10) |
| S9.7 gradient | g=ω(·,J·) | grad f_X=JX_O; indices 2ℓ(w) | pass (r10) |
| S9.7 ℙ¹ | regular; central X | 1+q², χ=2; constant height | pass (r10) |
| S9.8 | SL₂/B−; torus | O(1), degree +1 | pass (r10) |
| Worked: incidence flag | v=(a,b,c), ω | trace v∧ω; dim 8, weights (2,1,0) | pass (r10) |
| Worked: blowup 121 | V=k³, P₀ | C=ℙ(P₀) codim 2; E=ℙ¹×ℙ¹; rs=1 | pass (r10) |
| Worked: fixed plane | n=4, k₀=2 | 3=min(2,2)+1 | pass (r10) |
| Contract: tie rule | native `lower_mul` | on p iff ε(q)<φ(p) | agree (r10) |
| Contract: Demazure longest | native | Δ·D_{w₀}f=Σ sgn(w)e^{−(ρ−wρ)}w(f) | agree (r10) |
| S4.7 bullet 1, index test | GL₃, λ=e₁, six w | 1,2,1,2,3,3 sections both sides | pass (r10) |
| S4.7 bullet 1, W vs W/W_κ | τ₀=s₂,u=s₁s₂; τ₀=s₁s₂,u=s₂s₁ | ≤ both ways; ≰ both ways | pass (r10) |
| S4.7 bullet 2, weights | w=s₁ | weights e₁, e₂ both sides | pass (r10) |
| S4.7 bullet 2, w₀ | π(1)∈{−e₃,−e₂,−e₁} | e₁,e₂,e₃ = weights of ∇(e₁) | pass (r10) |
| S4.7 bullet 3, partial flags | λ=e₁, W_P=⟨s₂⟩ | θ(W_P)=W_κ | pass (r10) |
| S4.7 bullet 3, descent | λ=ρ, W_P=⟨s₂⟩ | ⟨ρ,α₂∨⟩=1≠0, excluded | pass (r10) |
| S4.7 Check 1 | GL₃ λ=e₁ | right e₁; wrong −e₁, e₃, −e₃ | pass (r10) |
| S4.7 Check 2 | w=w₀ | weights e₁,e₂,e₃ | pass (r10) |
| S4.7 Check 3 | w=s₂ | one section of weight e₁; untransported 2 | pass (r10) |
| S4.7 degenerate | λ=0; rank 0 | weight 0; weight λ | pass (r10) |

**Remark on untouched text (no change requested here):** the closing sentence of “How to read the build” (README line 437), “Suggested.lean lists the headline theorems and the carriers missing at the pins”, becomes accurate once R01's repair lands. No other untouched passage depends on the changed lines.

## Not verifiable

- I did not elaborate the c339e23c statements at Tau Ceti `2fd255d`. This job runs Lean only in the pull request's worktree, which is pinned to `a91d3aa`, where they cannot elaborate. I checked them by reading the native signatures listed above.
- Steinberg1975, Pittie1972, Jantzen and MehtaRamanathan1985 are uncertified and cited by locator only; I read no text of them.
- The seeded-sample targets S1.0, S1.3, S3.3, S3.5, S4.7, S5.1, S5.3, S7.1, S7.2, S7.3, S8.2, S8.5, S9.1 and S9.5 are in text the diff leaves untouched. Their locators were read in the reviews at 39437f2 and aab273f and not re-read this round.
- LLM Proposition 14: the OCR reading “w>τ₁” against the README's “initial direction at most w” is unchanged from the previous report.

## Source issues

- none
