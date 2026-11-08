# Review of HeckeStacksAndLocalShtukasPartII (pull request #1844 at 236bae3)

**Verdict:** accepted

Incremental re-review of the 10 lines changed since e1a397e (6 insertions, 4 deletions, all in `TauCetiRoadmap/HeckeStacksAndLocalShtukasPartII/README.md`; nothing outside the folder). Both findings of the previous review are repaired, the two new Checks compute correctly against their sources and against the roadmap's own definitions, the gate passes, the dependency check is clean and the unchanged `Suggested.lean` elaborates with only its two `sorry` warnings. No finding remains.

## Previous findings

- R01 — repaired: §0.6 (README line 485) now has a third Check, the superbasic slope-1/2 class of GL₂ with b the shift of §2.3 acting on the determinant components of X_μ(b) with κ_G(b)=1=μ^♮ unchanged; §7.5 (line 1774) has a third Check, GL₂ with J=∅, x=1, w=t^(1,0), b=diag(ϖ,1), where the matching torus class (1,0) has Levi locus T(L)/T(O_L)≅ℤ² whose image is all of X_w(b) and the class (0,1) has empty locus. Both are verified below; neither introduced a new problem.
- R02 — repaired: the four citations at lines 333, 498, 787 and 797 now read "BunGAndNewtonStrata §1.15, defect of a σ-class"; the doubled phrase occurs 0 times; the heading at the BunGAndNewtonStrata head is `### 1.15 Defect of a sigma class` (its README line 569).

## Verified sound

**The changed passages.** The diff touches only §0.6 (one Check, line 485), §7.5 (one Check, line 1774) and the four §1.15 labels. Nothing cites the new Checks (Checks are never cited), and the sections they sit in (§0.6, §7.5) carry the same statements, Needs lines and locators as at e1a397e. The new text contains no process words, no pull-request numbers, no LaTeX and no local paths.

**§0.6 third Check, read against vie06 §2 (lines 75–99, PDF pp. 2–3) and the README's §2.3 (lines 691–699).** The superbasic representative is b(e_i)=e_(i+m) with e_(i+h)=ϖe_i (vie06 line 80–81; README line 693–694); for (m,h)=(1,2) this is b e₁=e₂, b e₂=ϖe₁, the matrix with rows (0,ϖ),(1,0), determinant −ϖ of valuation 1, entries in F so σ(b)=b and b⁻¹bσ(b)=b gives b∈J_b(F). J(F) is the multiplicative group of a central simple algebra over F (vie06 line 96–97); for slope 1/2 in GL₂ it is the quaternion division algebra. Components of the affine Grassmannian are indexed by v(det g) (line 89–90), an element g∈J(F) with v(det g)=i maps X_μ(b)_j isomorphically onto X_μ(b)_(j+i) (line 98), and the valuation-0 subgroup acts on X_μ(b)_0 (line 99). With i=1 this is exactly the Check's transport of the determinant-zero component onto the determinant-one component. κ_(GL₂)(b)=v(det b)=1 and μ=(1,0) has μ^♮=1 in π₁(GL₂)=ℤ; Σμ_i=1=m is vie06's nonemptiness condition (line 82). The obstruction depends on b only, as stated.

**§7.5 third Check, read against ghn15 §3.3 (lines 390–401, PDF p. 10), he14 Theorem 4.8 and proof (lines 610–626, PDF p. 16 = printed 382, continuing to 383) and the README's own definition at §7.1 (line 1612).** ghn15's condition (2) for a (J,w,δ)-alcove is U_a∩ˣI⊆U_a∩I for a∈w(Φ⁺−Φ⁺_J), with ˣI=xIx⁻¹ (line 390–396); the README's "(xN_Jx⁻¹)∩(wIw⁻¹)⊂(xN_Jx⁻¹)∩I" is the same condition with the roles of the letters swapped as the README's Conventions say. For w=t^(1,0)=diag(ϖ,1) (the README's convention, Conventions line 141) conjugation wUw⁻¹ sends U_(e₁−e₂)(c) to U_(e₁−e₂)(ϖc) and U_(e₂−e₁)(c) to U_(e₂−e₁)(ϖ⁻¹c). With x=1, J=∅ and Φ⁺={e₁−e₂}: ϖ·(I∩U_(e₁−e₂))⊆I∩U_(e₁−e₂) whether that group is U(O_L) or U(ϖO_L), so the (∅,1,σ) condition holds; with x=s, the root set is {e₂−e₁} and ϖ⁻¹·(I∩U_(e₂−e₁))⊄I∩U_(e₂−e₁), so the (∅,s,σ) condition fails although condition (1) holds (s t^(1,0) s = t^(0,1) ∈ W̃_∅). This agrees with the §7.1 Check at line 1659. Levi locus: for t=diag(ϖ^a u, ϖ^c v) with units u,v, t⁻¹ b σ(t)=b·diag(u⁻¹σ(u), v⁻¹σ(v)) ∈ b·T(O_L)=I_M ẇ σ(I_M), so every t∈T(L)/T(O_L)≅ℤ² lies in the locus; the comparison g_M↦g_M I gives the points t^νI, ν∈ℤ². he14 Theorem 4.8: for w̃ of minimal length in its δ-class and f(w̃)=f(b), dim X_w̃(b)=ℓ(w̃)−〈ν̄_b,2ρ〉 and J_b\X_w̃(b) is the orbit space of k^(ℓ−〈ν̄_b,2ρ〉) under a finite torus (line 610–613); here ℓ=1, 〈(1,0),2ρ〉=1, so the dimension is 0 and X_w(b) is one J_b(F)-orbit; the proof (line 622–626) gives g∈J_ẋ P with P=I for J=∅. J_b for b=diag(ϖ,1) is the centralizer of the regular Newton point (1,0), that is T, so X_w(b)=T(F)I/I≅T(F)/T(O_F)≅ℤ², equal to the image. The non-matching class: t⁻¹diag(1,ϖ)σ(t)∈diag(1,ϖ)T(O_L), and diag(1,ϖ)T(O_L)≠diag(ϖ,1)T(O_L), so the locus is empty. The matching condition κ_T(b_M)=κ_T(x⁻¹wσ(x))=κ_T(diag(ϖ,1))=(1,0) is §7.5's (line 1753–1754). §1.1's Check (dimension 0 for t^(1,0)) agrees. The closing sentence's "cover indexed by the whole B(T)-fibre" is read as the API's index-set claim (each listed class contributes an image carrying its invariants): the class (0,1) contributes nothing, which is what the Levi κ condition removes.

**Gate and build.** The worker's gate at 236bae3: every check passed (`build=0`, `depcheck=0`, `statement-hygiene=0`, `outside-folder=0`, `readme-ids-missing=0`). `lake env lean` on `Suggested.lean` at this head: exit 0, the two `declaration uses sorry` warnings (lines 122 and 132) and nothing else. `git diff --stat origin/main...HEAD` outside the folder is empty. `Suggested.lean` is byte-identical to the copy the previous review read (empty diff e1a397e..HEAD on that file), so the previous review's `#check @name` comparison of all seven declarations with the README, and its one-tactic probe (neither theorem closes), stand; the worker's signature listing at this head shows the same seven types with no lost binder.

**Dependency check**, exact output:

```text
depcheck: 239 roadmaps, 2427 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line.

**Supplier citations touched by the diff, resolved at the current heads.** BunGAndNewtonStrata at its open head: `### 1.13 Algebraic sigma-centralizer` (line 524), `### 1.15 Defect of a sigma class` (569), `### 1.45 Newton comparison for a Levi representative` (1061). The overlap tool lists no pull request changing this roadmap, no dropped id and no revision-only id; the citation resolver lists no cross-roadmap citation found nowhere (its three Lean-name leads are this roadmap's own declarations, all in `Suggested.lean`).

**Adversarial pass.** Rows for statements the diff leaves untouched are carried from the previous review (marked "r2"); the two changed Checks have new rows with their values.

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §0.6 third Check (new) | GL₂, (m,h)=(1,2), μ=(1,0), b: e₁↦e₂, e₂↦ϖe₁ | matrix rows (0,ϖ),(1,0); det=−ϖ, v=1; σ(b)=b, b⁻¹bσ(b)=b so b∈J_b(F); v(det bg)=1+v(det g); κ_G(b)=1, μ^♮=1, Σμ_i=1=m; valuation-0 elements: v(det jg)=v(det g) | holds; vie06 lines 80–82, 89–99 |
| §7.5 third Check, alcove condition (new) | w=diag(ϖ,1), x∈{1,s}, J=∅ | wU_(e₁−e₂)(c)w⁻¹=U_(e₁−e₂)(ϖc), wU_(e₂−e₁)(c)w⁻¹=U_(e₂−e₁)(ϖ⁻¹c); x=1: ϖ(I∩U)⊆I∩U; x=s: ϖ⁻¹(I∩U_(−α))⊄I∩U_(−α); condition (1): t^(1,0), t^(0,1)∈W̃_∅ | holds; ghn15 lines 392–396; agrees with §7.1 Check line 1659 |
| §7.5 third Check, loci and cover (new) | b_M=diag(ϖ,1) and diag(1,ϖ); t=diag(ϖ^a u,ϖ^c v) | t⁻¹bσ(t)=b·diag(u⁻¹σu,v⁻¹σv)∈bT(O_L): locus ℤ²; t⁻¹diag(1,ϖ)σ(t)∈diag(1,ϖ)T(O_L)≠diag(ϖ,1)T(O_L): locus ∅; dim X_w(b)=1−1=0; X_w(b)=T(F)/T(O_F)≅ℤ²=image; κ_T(diag(ϖ,1))=(1,0) matches | holds; he14 lines 610–626; §1.1 Check agrees |
| §1.15 label (R02) | the four citations | 0 doubled phrases; 4 citations read "defect of a σ-class"; heading at the supplier head line 569 | repaired |
| §2.1 residue basis, normalization, type (r2) | h=2,m=1,A=ℕ; h=1; empty set; A=1+ℕ | B={0,1}, sum 1=h(h−1)/2, type (0,1); h=1: B={0}, A=ℕ; ∅ has no h-element basis; 1+ℕ has sum 3, normalization ℕ | holds |
| §2.2 Example 3.5 (r2) | h=5,m=4, B={−2,−1,2,5,6}, φ(−1)=0 | φ on −2..11: 0,0,0,1,2,2,1,1,2,3,3,2; initial values {0,0,2,2,0}=μ; jump(−1)=1>φ(−1) | noncyclic as claimed |
| §2.5 bound and attainment (r2) | (2,1,(0,1)), (3,4,(0,0,4)), (5,4,(0,0,0,2,2)), (4,5,(0,0,2,3)) | V=∅, bound 0; V={(5,6),(5,7),(5,10)}, 6=6; V={(4,6),(4,7),(5,6),(5,7)}, 8≤8; V={(3,4),(3,5),(3,6),(3,9)}, 8=8 | holds; vie06 Examples 5.4–5.5 |
| §2.5 equality fails for a non-dominant type (r2) | (4,5), type (0,2,0,3) | B={−2,0,3,5}, V={(3,4),(5,6),(5,8)}, 6<8 | negative control holds |
| §2.5 ρ, defect, formula (r2) | increasing convention, ν=(m/h,…) | ρ_k=(2k−1−h)/2, 〈ρ,ν〉=0, def=h−1; (3,4,(0,0,4)): 4/3+8/3−1=3 | Lean right side is 2d |
| Lean `ExtendedSemiModule` degenerate inputs (r2) | h=1; h=0 | h=1: B={0}, A=ℕ, V=∅, bound 0, cyclic; h=0 excluded by 0<h | no vacuity |
| finiteness of V (r2) | general (A,φ) | φ(b_r+kh)≥k bounds k; tails leave no φ(b) strictly between | the Finite conjunct is a theorem |
| Conventions: alcove image of s t^(nα∨) (r2) | split adjoint A₁, base alcove (−1,0) | t^(nα∨): (−2n−1,−2n); s: (2n,2n+1); ℓ=2n+1, η=s, d_w(1)=n+1 | holds |
| §0.2 virtual dimension (r2) | GL₂, w=b=t^(1,0); slope-1/2 basic, w=s t^(1,0) | (1+0−0)/2−1/2=0; (2+1−1)/2−0=1 | holds |
| §0.3 shrunkenness vs λ≥2ρ∨ (r2) | adjoint A₂, λ=6ω₁∨ | λ−2ρ∨=2α₁∨≥_ℤ0 but 〈α₂,λ〉=0 | not shrunken |
| §1.2–1.4 reduction and advantage (r2) | affine A₁, w=s₀s₁s₀, b=1, [t^(α∨)] | endpoints s₁ (dim 1), s₁s₀ (−∞); (3+1+0)/2=2; at [t^(α∨)]: (3+2+1)/2−2=1 | all seven Checks agree |
| §3.1 root-slope sum (r2) | GL₂, ν_M=(a,b), a−b=±2 | min(2,0)=0; min(−2,0)=−2=〈(½,−½),(−2,2)〉 | holds |
| §3.4 Levi fibre (r2) | GL₂, M=T, μ=(1,0), b=diag(1,t), μ_M=(0,1) | d=0; 〈ρ,ν_M−ν_G〉=−1, 〈2ρ_N,ν_M〉=−1; fibre 0 | holds |
| §3.6 norm order (r2) | degree 3, b=(1,U,V) | UV=[[2,1],[1,1]] vs VU=[[1,1],[1,2]] | README convention consistent |
| §3.8 spherical values (r2) | GL₂, μ=(1,0) basic; μ=(1,−1), b=1; b=1, μ=(1,0) | ½−½=0; 1−0=1; κ mismatch 0≠1, locus empty | holds |
| §4.3 fundamental representative (r2) | GL₂, y=t^(1,0); t^(0,1); τ; s | quotient O/ϖO, dim 1=〈2ρ,(1,0)〉; dim 1; dim 0; Ad(ṡ)σ(I) opposite Iwahori | holds |
| §4.3 codimensions (r2) | GL₂, w=s t^(1,0) | c=1; c=0; 5−4=9−8=1, 6−4=10−8=2 | holds |
| §4.6 chain length (r2) | GL₂, (1,0) over (½,½) | (1+1)/2=1; dims 1 and 1 | holds; mv20 lines 434–437 |
| §4.7 cordiality (r2) | GL₂, x=s, λ=(1,0) | 2−1=1=〈(1,0),(1,−1)〉−0 | holds |
| §5.1 double flat (r2) | adjoint A₁, λ=2ω∨, ω∨; unitary A₂, λ=ρ∨, ω₁∨ | λ^♭♭=0; ω∨; ω₂∨−_dom ω₁∨=ω₁∨, gap α₁∨; ω₂∨ | holds |
| §5.2 factorization (r2) | unitary A₂, x=y=s₁, λ=ρ∨ | w₁w₂=t^(α₂∨)=s₁t^(ρ∨)s₁; lengths 2+2=4=1+4−1; a=s₂ | holds |
| §5.1/8.2 shrunkenness of the unitary example (r2) | w=s₁t^(ρ∨)s₁ | values α₁:(0,1), α₂:(−3,−2), θ:(−2,−1) | shrunken |
| §6.2–6.3 fibre bounds (r2) | A₁; unitary A₂ | N₁=N₂=0; N₁=0, N₂=1; (6−4)/2=1=N₁+N₂ | holds |
| §7.4 basic seed (r2) | A₁, a=s, γ=α∨ | T_(s₁s₀s₁)≡zT_(s₀s₁)+T_(s₀), coefficient 1 of degree 0, dim (3+1+0)/2=2 | holds |
| §7.4 route independent of shrunkenness (r2) | split PGL₃, w=s₁s₂t^(ω₁∨) | a t^γ=s₂s₁t^(ω₁∨) not shrunken; he14 Prop 11.6 still gives the coefficient | holds |
| §8.1 hypothesis on λ^♦ (r2) | Res_(E/F)PGL₂, λ=(α∨,0), b=1 | λ−ν_b fails the printed hypothesis, λ^♦−ν_b=(α∨/2,α∨/2) passes | the weaker hypothesis is what the proof uses |
| §8.3 basic specialization (r2) | adjoint A₂, w=w₀, λ=0; A₁, s t^(nα∨) | (3+3−0)/2=3; (2n+2)/2=n+1 | holds |
| §8.4 range (r2) | adjoint A₁, λ=α∨, b=1 | (λ^♭♭)^♦=0≥ν_b; gap 2ρ∨; dimension 2 | holds |
| §0.6 transport direction (r2) | S₃, b=(12), h=(123) | b′=(23); (hg)⁻¹b′(hg)=g⁻¹bg; with h⁻¹: g⁻¹(13)g≠g⁻¹bg | holds |
| §7.5 matching classes (r2) | GL₂, M=T, w=t^(1,0), b=diag(ϖ,1) | fibre {(1,0),(0,1)}; κ_T(x⁻¹wσ(x))=(1,0) selects one; dim 1−1=0 | holds |
| Supplier sign convention (r2) | GL₂ | README t^(1,0)=diag(ϖ,1); RG2.4 `length_translation_gl2` labels diag(ϖ⁻¹,1) as (1,0) | transport λ↦−λ correct |
| GS0 §0.39 bounds (r2) | u=v=s | ordinary (1+1−0)/2=1, Demazure 1+1−1=1 | matches §§6.1, 6.3 |

**What the diff does not touch and was not redone.** The seeded sample (15 targets), the supplier resolution over every cited roadmap, the pinned-declaration list, the declared gaps and the ownership grep were verified at e1a397e in the previous review and none of the sampled targets, supplier citations or declarations changed in this diff (only the §1.15 label, resolved again above).

## Not verifiable

- None. Both sources the new Checks cite (vie06, he14) and the definition they rely on (ghn15 §3.3) are in the cache and were read at the lines quoted.

## Source issues

- none
