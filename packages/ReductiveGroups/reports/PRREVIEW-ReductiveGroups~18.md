# Review of ReductiveGroups (pull request #1676 at 83157e1)

**Verdict:** needs changes

The previous review's six findings are all repaired at this head (the disposition table is under **Verified sound**). The full re-review found one locator defect in the new Layer 6A text and nothing else.

## R01 (P3) — The McNinch locator for the Levi-complement definition names §1.1, which is on page 1; the cited page 6 is §3.1

**Location:** `TauCetiRoadmap/ReductiveGroups/README.md:1179`, "`O(Q) → O(G)/J = O(L)` is an isomorphism (McNinch §1.1, p. 6; …)"; the same locator in `TauCetiRoadmap/ReductiveGroups/Suggested.lean:195`, "(McNinch, Levi decompositions of a linear algebraic group, §1.1, p. 6)", and in the References entry `README.md:3702`, "§1.1, p. 6; (3.2.1), p. 7".

**Claim:** In the cited text (arXiv:1007.2777v1, the version in the sources cache), §1.1 "Linear groups" is on page 1, where a Levi factor is only described informally as a complement to the unipotent radical. The definition the roadmap relies on (a closed `k`-subgroup `M` with `M ⋉ R → G` an isomorphism, so that `G → G/R` restricts to an isomorphism `M → G/R`) and the remark that linear algebraic groups in characteristic zero always have a Levi decomposition, with conjugacy of any two Levi factors under the unipotent radical, are both in §3.1 "Definitions and first remarks" on page 6.

**Witness:** `mcninch` line 29 (§1.1, under the page-1 marker at line 4); `mcninch` lines 236–243 (the Definition, under the page-6 marker at line 230) and lines 244–252 (the characteristic-zero existence and conjugacy remark). The second locator, (3.2.1) on page 7, is correct: `mcninch` line 280, under the page-7 marker at line 278, and Remark (a) at line 282 names `SL₂` over `W₂`.

**Repair:** Replace "§1.1, p. 6" by "§3.1, p. 6" in the three places (README lines 1179 and 3702, `Suggested.lean` line 195). Tested on the text: §3.1 contains the definition and the characteristic-zero statement the roadmap uses; §1.1 contains neither. The section list "§§2.2–2.3, 3.1, 4.1, 4.3–4.5 and 5.1–5.2" at README line 1298 and in the References is correct (`mcninch` lines 138, 169, 236, 330, 399, 421, 448, 485, 507).

## Verified sound

**Disposition of the previous review's findings.** The head changed by 1716 lines since 72e4141 (`changes.md`: 55 insertions, 1661 deletions).

| Previous finding | Passage at this head | Disposition |
|---|---|---|
| R01 (P2), companion files with admitted data | The folder now holds `README.md`, `Suggested.lean`, `STATUS.md`, `PROGRESS.md`, `metadata.toml`; the eight companion `.lean` files are deleted in the diff against `origin/main` (and `SpecialLinearCoordinateTargets.lean` no longer exists). `STATUS.md`, `PROGRESS.md` and `metadata.toml` are byte-identical to main. | Repaired. |
| R02 (P2), Levi complement statable but absent | `Suggested.lean:187–206` states `exists_levi_complement` with `[CharZero k]`, `Algebra.Smooth k H`, geometric connectedness, `∃ J : HopfIdeal k H, Function.Bijective ((mkₐ k J.toIdeal).comp (unipotentRadicalDefiningIdeal H).coinvariants.val)`; README 1175–1181 names it; the module docstring (lines 23–24) lists it. | Repaired (the locator inside it is R01 here). |
| R03 (P3), Kummer sequences at n = 0 | README 1003–1005: "for `n ≥ 1` the exact sequence … (at `n = 0` neither sequence is exact, while `D(ℤ/0) = D(ℤ) = 𝔾_m` still holds)". | Repaired. |
| R04 (P3), one-tactic padding in companions | The three declarations were in deleted files. | Repaired. |
| R05 (P3), docstring silent on 7c–7f and 9E | `Suggested.lean:52–61` names the missing carriers: an `F`-stable parabolic with `F`-stable Levi of a finite-field form (and that `TauCeti.Cocharacter.leviDecompositionMulEquiv` carries no Frobenius datum), and an `𝔽_q′`-structure whose Frobenius is a power of the endomorphism (and what `TauCeti.Bialgebra.iterateFrobeniusPoints` gives instead). Both pinned names exist (`Dynamic/LeviDecomposition/Basic.lean:194`, `Frobenius/Points.lean:66`). | Repaired. |
| R06 (P3), second owners in later roadmaps | README 26–32 states, one clause each, that ReductiveGroupsPartII RG2.3.7, IntegralHeckeAndGaloisDeterminants §0.7, ComplexComparisonPartII C-1.1 and AdelicAlgebraicGroups AA.3.1 restate the objects of Layers 7a, 1.1, 3A.5 and 6A and are consumers; Downstream consumers 3669–3675 says the same for the first two. | Repaired; the four citations resolved below. |

**Scope, gate and build.** Checked head 83157e1ccb527abe3779e6adc3eb23c1906af112. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ReductiveGroups'` is empty. The folder diff against main: README.md (+2448 lines), Suggested.lean rewritten, seven companion files deleted. Worktree clean. The worker's gate reports every check zero (set_option, blob, latex, prnum, sorry-data, sorry-examples, stray-files, depcheck, build). I reran `lake env lean TauCetiRoadmap/ReductiveGroups/Suggested.lean` from the worktree: exit 0, exactly the **12 `sorry` warnings** (lines 121, 130, 141, 150, 160, 181, 198, 214, 227, 249, 297, 303), nothing else. Pins: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` (the worktree's `lake-manifest.json`, lines 8 and 18); every library name below was also found at the content checkout's pin `358314d4`.

Dependency check on the README as submitted (`--movable`):

```text
depcheck: 203 roadmaps, 1660 edges, 0 problem(s)
```

No UPWARD or CYCLE line. (The previous head gave 1656 edges; the four new edges are the scope clauses' citations, all of roadmaps that cite this one as a supplier.)

**Elaborated signatures.** `#check @name` for all 25 declarations of `Suggested.lean` and 9 pinned names in a scratch file importing the built module (`SignatureCheck18.lean`, exit 0). Each elaborated type matches its README statement: the five orbit headlines carry `IsAlgClosed k`, `IsAffine G.left`, `Smooth G.hom`, `QuasiCompact G.hom`, `LocallyOfFiniteType X.hom`, `QuasiCompact X.hom`, `IsSeparated X.hom` and a rational point (or `Nonempty (Points X)`); `linearlyReductive_of_reductive` carries `CharZero k`; `exists_levi_complement` carries `CharZero k`, `Algebra.Smooth k ↑H.obj` and `geometricallyConnectedCommHopfAlgProperty k H.obj` and concludes `∃ J, Function.Bijective ⇑((Ideal.Quotient.mkₐ k J.toIdeal).comp H.unipotentRadicalDefiningIdeal.coinvariants.val)`; the Borel headline quantifies over `I J : HopfIdeal k H` with both `IsBorelOverAlgClosed` hypotheses; `lang_surjective` carries `[Finite k]`, smoothness, geometric connectedness, `[IsAlgClosed K]`, `F : K →ₐ[k] K` and `∀ a, F a = a ^ Nat.card k`; `exists_coordinatePresentation` is for every `n`; `permutation_nonsplit` has `2 ≤ n`; `plane_braid` is for every `n`. No binder was lost. One note, not a finding: in `exists_levi_complement` the hypothesis `Algebra.Smooth k H` is implied by `CharZero k` through the pinned Cartier theorem `TauCeti.smoothCommHopfAlgProperty_of_charZero` (`Smooth/CharZero.lean:148`); it is harmless and keeps the statement's shape parallel to `lang_surjective`, where smoothness is a real hypothesis.

**Padding probe.** A copy of `Suggested.lean` with each `sorry` replaced by `first | rfl | simp | infer_instance | sorry` (`Probe18.lean`): six statements fell through to `sorry` (lines 121, 141, 150, 160, 214, 297) and six were only rewritten by `simp` and left as unsolved goals (138, 184, 205, 234, 258, 305); for the Levi headline `simp` only unfolded the composite to `⇑(Ideal.Quotient.mk J.toIdeal) ∘ Subtype.val`. No declaration closes in one tactic; the eleven definitions all have real bodies and each is used by a stated headline.

**Seeded source sample.** Texts read from the sources cache: Jantzen, *Representations of Algebraic Groups I*, MPI preprint 85-9 (`jantzen`; printed page = PDF page − 5), Conrad, *Reductive Group Schemes* (`conrad`; printed = PDF), and McNinch (`mcninch`, arXiv v1 as cited). No manifest edited.

| Target | Locator checked | Lines | Result |
|---|---|---|---|
| 1.1 action/comodule dictionary | Jantzen §2.8, printed pp. 36–38 | `jantzen` 1100–1136 | Comodule map by evaluation at the universal point `id_{k[G]}`; formula (1) recovers the action of every `g ∈ G(A)` on `M ⊗ A`; the categories of `G`-modules and `k[G]`-comodules are equivalent for arbitrary `k`-modules `M`. Supports the target as written. |
| 1.1 enough injectives | Jantzen §3.9, printed p. 60 | `jantzen` 1688–1707 | Flat subgroup scheme; embed `M` in an injective `k`-module `I`; `I ⊗ k[G]` is injective; no hypothesis on `M`. Supports the target. |
| 1.1 Hochschild complex and derived invariants | Jantzen §§4.14–4.16, printed pp. 77–79 | `jantzen` 2102–2156 | `Cⁿ = M ⊗ k[G]^{⊗n}`; `C•(G,k[G])` exact above degree 0 with kernel `k` in degree 0; Proposition 4.16 identifies the complex's cohomology with `H•(G,M)`. Supports the target. |
| 1.1 induction and reciprocity | Jantzen §§3.3–3.7, printed pp. 52–57 | `jantzen` 1507–1645 | `ind_H^G M = (M ⊗ k[G])^H`, functions with `((g,h)f)(x) = h f(g⁻¹xh)`; the README's equalizer for an arbitrary Hopf map is its own generalisation and says so. Supports the subgroup form. |
| 8.1 split data | Conrad Definition 5.1.1, printed p. 136 | `conrad` 5651–5668 | Non-empty base, `T ≃ D_S(M)`, roots and coroots constant sections, root spaces free of rank one; disconnected bases allowed. Matches §8.1 including the "both lattices" clause. |
| 8.2 pinnings | Conrad Definition 6.1.1 and Remark 6.1.2, printed pp. 186–187 | `conrad` 7725–7751 | Positive system plus trivialising sections `X_a` of the simple root lines; on a disconnected base a Borel containing `T` need not come from a constant `Φ⁺`. Matches §8.2 and its fourth Check. |
| 6A Levi complement (new) | McNinch §3.1, p. 6; (3.2.1), p. 7 | `mcninch` 236–252, 280–283 | Definition and characteristic-zero existence are at §3.1 (R01: the README says §1.1); (3.2.1) and its Remark (a) support the `SL₂(W₂)` negative control. |

Locators opened in earlier rounds and unchanged at this head (Milne 2017, Conrad–Feng, Dudas–Michel, SGA 1 XII, Frenkel–Kac, Gros–Kaneda, Birman–Brendle, Riche) were not re-read; their theorem numbers and pages in the README are unchanged.

**Headline inventory.** End theorems named by the README: the three-way dictionary and Tannakian transport (Layers 0–1); rational cohomology and cotensor induction (1.1); locally closed reduced orbits, strict boundary dimension, closed orbits (3A); classical topology and complex Lie-group dictionary (3A.5); Jordan, tori, unipotent structure (4–5); characteristic-zero linear reductivity (6) and Levi complements (6A); Matsushima (6B); Borel conjugacy, root data, parabolics, Bruhat coordinates (7, 7C); Lang, fixed-coset lifting, Harish–Chandra, Mackey, common-Levi independence, Gassmann (7a–7f); split data and pinnings (8); integral PBW, Chevalley–Demazure, special isogenies, distributions (9A–9C); classification and pseudo-reductive examples (9D); Lang–Steinberg (9E); highest weights, Steinberg module, contraction, Peter–Weyl (10); plane braids, Weyl arrangements, spectral monodromy (11); the SL coordinate presentation. `Suggested.lean` states the five orbit headlines, linear reductivity, the Levi complement, Borel conjugacy, Lang, the SL presentation, the plane-braid equivalence and nonsplitting; its docstring names a missing carrier for every other endpoint (Layers 0–1, 3/6B, 4–5/7/9D, 7c–7f, 9E, 9, 10, 11, 3A.5). No statable headline is absent; none is forced through a stand-in.

**Adversarial calculations.** One row per statement, values recomputed this round on both sides; a passing instance is evidence about that instance only.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 0: convolution is the group law | 𝔾_a, f(t)=a, g(t)=b | (f∗g)(t)=a+b from Δt=t⊗1+1⊗t; pointwise product gives ab | Pass |
| 0: points need not commute | GL₂(ℤ), [[1,1],[0,1]], [[1,0],[1,1]] | products [[2,1],[1,1]] and [[1,1],[1,2]] | Pass |
| 0: fppf quotient is not pointwise | 𝔾_m/μ₂ over ℚ, class of 2 | no rational square root; (√2)²=2 over ℚ(√2) | Pass |
| 1: faithfulness needs the antipode term | 𝔾_m standard character | t generates k[t]; with t⁻¹ it generates k[t,t⁻¹] | Pass |
| 1: μ_p faithful on GL₁ | characteristic p | t⁻¹=t^(p−1); μ_p(k̄)={1} | Pass |
| 1.1: invariants as equalizer | ℤ[t,t⁻¹], weights 0 and 1 | ker(ρ−id⊗1)=ℤ for weight 0, 0 for weight 1 | Pass |
| 1.1: d⁰, d¹ on the weight-one line | 1↦1⊗t | d⁰(1)=1⊗(t−1); d¹(t−1)=t⊗(t−1)−(t⊗t−1⊗1)+(t−1)⊗1=0 | Pass |
| 1.1: trivial group complex | H=ℤ | d⁰=0, d¹=id, d²=0 (alternating sums of 2, 3, 4 identities) | Pass |
| 1.1: nonflat coefficients | M=ℤ/2 | H⁰=ℤ/2, H¹=ker(id)=0, H²=0 | Pass |
| 1.1: cofree ≠ injective | cofree ℤ | 2ℤ→ℤ, 2↦1 needs f(1)=1/2 | Pass |
| 1.1: cotensor induction ranks | 1⊂C₂; C₂⊂S₃ | ranks 2 and 3 = indices | Pass |
| 1.1: nonsurjective Hopf map | ℤ→ℤ[t,t⁻¹] | induction = invariants: weight one 0, trivial ℤ | Pass |
| 1.1: Jantzen's convention | f(gh)=h⁻¹f(g) vs F(hg)=hF(g) | antipode g↦g⁻¹ intertwines; evaluation at 1 fixed | Pass (source read) |
| 2: bracket and adjoint | GL₂ | [E₁₂,E₂₁]=diag(1,−1); Ad(diag(t,1))E₁₂=tE₁₂ | Pass |
| 2: tangent of nonsmooth groups | μ_p; Frobenius of 𝔾_a; SL₂ in char 2 | (1+ε)^p=1 so tangent 1 at dim 0; dFrob=0; tr I=2=0 | Pass |
| 3: Hopf ideal of μ_n | (tⁿ−1) | Δ(tⁿ−1)=(tⁿ−1)⊗tⁿ+1⊗(tⁿ−1); ε=0; S=−t⁻ⁿ(tⁿ−1); ε(t−2)=−1 | Pass |
| 3: components of μ₃/ℚ | t=1, t²+t+1=0 | 2 components, 3 geometric points | Pass |
| 3A: 𝔾_m on ℙ¹ | x=[1:1] | orbit ℙ¹∖{0,∞}, dim 1; boundary two points, dim 0<1 | Pass; headline instance |
| 3A: trivial action on dual numbers | Spec k[ε]/ε² | reduced model Spec k (length 1 vs 2); empty boundary ⊥<0 | Pass |
| 3A: disconnected group | constant S₃ on itself | 6 points, dim 0, boundary ⊥ | Pass |
| 3A: empty X | no rational point | `Nonempty (Points X)` fails; nothing asserted | Pass |
| 3A: 𝔾_a on 𝔸² | (x,y)↦(x+ay,y) | closed orbits of dimensions 1 and 0 coexist | Pass |
| 3A: GL₂ on 𝔸² | x≠0 | boundary {0}, 0<2; ℙ¹ transitive | Pass |
| 3A.5: separated/proper/étale | doubled line; ℙ¹(ℂ) vs 𝔸¹(ℂ); z↦z² | two origins share punctured neighbourhoods; 1,2,3,… escapes; derivative 2 at 1, 0 at 0 | Pass |
| 4: Jordan decomposition | [[2,1],[0,2]]/ℚ; 𝔽₂(a) | s=2I, u=[[1,1/2],[0,1]]; det 0 in char 2; x²−a=(x−√a)² needs √a | Pass |
| 4: Kummer at n=0,1,2 | multiplication by n | n=0: ker=ℤ≠0, image of t⁰ is {1}; n=1: identities; n=2: cokernel ℤ/2, kernel μ₂ fppf-surjective | Pass (repaired) |
| 4: character/cocharacter pairing | t↦tᵃ, t↦tᵇ | composite t↦t^(ab) | Pass |
| 4: nonsplit torus | x²+y²=1 over ℝ | X*=ℤ with conjugation −1 | Pass |
| 5: unipotence by comodules | μ_p, α_p | k_t has no fixed vector though μ_p(k̄)={1}; α_p unipotent nonsmooth | Pass |
| 5: character test one-way | SL₂, diag(2,1/2)−I | invertible; no nontrivial characters | Pass |
| 5: radical ideals | 𝔾_a, SL₂ | ideal 0 (radical 𝔾_a); augmentation ideal (radical 1) | Pass |
| 5P: exponential denominators | X=E₁₂+E₂₃ | X²=E₁₃, exp X=I+X+E₁₃/2; fails over 𝔽₂ | Pass |
| 6: SL_p in char p | centre | Z=μ_p, ring k[ε]/(ε^p), reduced neutral part 1; R(SL_p)=1 | Pass |
| 6: SL₂ not linearly reductive in char p | R_p | ⟨x^p,y^p⟩ has no complement | Pass |
| 6: ℤ/p in char p | regular representation | k[x]/(x^p−1)=k[u]/(u^p) indecomposable | Pass |
| 6A: Levi statement, trivial group | H=k | I_u=0, coinvariants k, J=0, composite k→k bijective | Pass; headline instance |
| 6A: Levi statement, 𝔾_a | k[t] | I_u=0, coinvariants = constants k, J=(t), composite k→k[t]/(t)=k bijective | Pass; headline instance |
| 6A: Levi statement, 𝔾_m | k[t,t⁻¹] | I_u=(t−1), coinvariants = all of H, J=0, composite identity | Pass; headline instance |
| 6A: Levi statement, 𝔾_a⋊𝔾_m | weight-one action | I_u = ideal of the 𝔾_a factor, coinvariants k[t,t⁻¹], J = ideal of 𝔾_a, composite identity on k[t,t⁻¹] | Pass; headline instance |
| 6A: composite bijective ⇔ Levi complement | general G | bijective ⇒ L≅Q as group schemes; inverse of L×R_u→G is g↦(s(q(g)), s(q(g))⁻¹g) with ker(G(A)→Q(A))=R_u(A) | Pass |
| 6A: wrong models excluded | J=⊤; J=augmentation ideal; J=I_u | ⊤ is not a Hopf ideal (ε(I)=0 fails); L=1 gives k↞O(Q) injective only when Q=1; L=R_u gives O(Q)→O(R_u) killing the torus coordinates of 𝔾_a⋊𝔾_m | Pass |
| 6A: characteristic hypothesis | SL₂(W₂) over 𝔽_p | McNinch (3.2.1): no Levi decomposition; `CharZero` excludes it | Pass (source read) |
| 6A: 1-cocycles of 𝔾_m on weight-one 𝔾_a | a(ts)=a(t)+ta(s) | a_n=0 for n∉{0,1}, a_0=−a_1, a(t)=c(t−1) = coboundary | Pass |
| 6A: nonunique conjugators | L×𝔾_a | every u centralizes L; U(k)/C_U(L)(k) one element | Pass |
| 6B: 𝔾_m/μ₂; GL₂/O₂ | ℂ[t,t⁻¹]^{±1}; g=diag(2,1), h=swap | =ℂ[t²,t⁻²]; ggᵀ=(gh)(gh)ᵀ=diag(4,1), (gh)ᵀ(gh)=diag(1,4) | Pass |
| 6B: SL₂/N⁺ | invariants k[a,c] | quotient 𝔸²∖{0}≠Spec k[a,c] | Pass |
| 7: Borel conjugacy | w=[[0,1],[−1,0]] | w[[a,b],[0,d]]w⁻¹=[[d,0],[−b,a]] | Pass; headline instance |
| 7: Borel headline for nonsmooth/disconnected G | G_red°, constant S₃ | Borels of G are those of G_red°; S₃ has one Borel | Pass |
| 7: root data of SL₂, PGL₂ | T=diag(t,t⁻¹) | α=2e, α∨ primitive; PGL₂: α primitive, α∨=2y | Pass |
| 7C: rank-one identity | a=b=1 | x_α(1)x_{−α}(1)=[[2,1],[1,1]]=[[1,0],[1/2,1]]·[[2,1],[0,1/2]] | Pass |
| 7C: Weyl representative | n_α(1) | [[1,1],[0,1]][[1,0],[−1,1]][[1,1],[0,1]]=[[0,1],[−1,0]] | Pass |
| 7C: A_w, I_w, H_w in A₂ | w=s₁; w=s₁s₂ | A={α₂,α₁+α₂}, I={α₁}; A_{s₁s₂}={α₂}, [x_{α₁},x_{α₂}] has an x_{α₁+α₂} term so H_w not normal | Pass |
| 7a: Lang values | 𝔾_a/𝔽₂, θ²+θ+1=0; 𝔾_m; SL₂; q=3 | θ²−θ=1; θ⁻¹θ²=θ, θθ⁻²=θ²; u(θ)⁻¹F(u(θ))=u(1); η³−η=−2η=η | Pass; headline instance |
| 7a: disconnected control; non-algebraic K | constant C₂; T^q−T−a | F=id, image {1}; degree q≥2 has a root | Pass |
| 7a: fixed-coset lifting needs the hypothesis | J={±1}, q odd, a^(q−1)=−1 | Lang map of J is x^(q−1)=1, misses −1; coset {a,−a} σ-stable, no fixed point | Pass |
| 7a: SL₂(𝔽_q) counts | B⁺ | q(q²−1), q(q−1), q+1 | Pass |
| 7b: common-torus hypothesis | GL₂, P=B⁺, Q=uB⁻u⁻¹ | L∩M = scalars (dim 1); P∩Q=uTu⁻¹ (dim 2) | Pass |
| 7c/7d: induced dimensions; Mackey for T | GL₂(𝔽_q); S₃⊃C₂ | q+1; 3=3·1; *R∘R(θ)=θ⊕θ^w | Pass |
| 7e: Weyl twist | GL₂(𝔽₃), t=diag(2,1), w=swap | wtw⁻¹=diag(1,2); second columns of tw, wt are (2,0),(1,0) | Pass |
| 7f: fixed-coset identity | S₃, H=⟨(12)⟩, g=(12); g=1 | g fixes H, swaps (13)H,(23)H: 1·2=2·1; |G/H||H|=|G| | Pass |
| 7f: GL₃(𝔽₂) | P, Q | orders 168, 24, index 7, nonconjugate | Pass |
| 8.1: tori; SL₂/PGL₂; nonsmooth centre; disconnected base | r=0,1; A₁; SL₂/𝔽₂; Spec(k₁×k₂) | X=Y=0 or ℤ; root index 2 vs 1; μ₂ of length 2; Conrad Ex. 5.1.2 (3) fails for PGL₂×𝔾_m ⊔ GL₂ | Pass; sample |
| 8.2: pinning generator; torus; Borel on k×k | SL₂ over ℤ/4, ℚ; empty Δ; B⁺,B⁻ | tangent E₁₂ vs 2E₁₂; one empty family; signs (+,−) not constant (Remark 6.1.2) | Pass; sample |
| 9A: cocycle values | A₂, α₁<α₂ | ε(α₁+α₂,−α₁−α₂)=(−1)^(1·(−1))=−1; ε(α₂,α₁)=−1; ε(α₁,α₂)=1 | Pass |
| 9A: cocycle identity | a=(1,0),b=(0,1),c=(1,0) | ε(a,b)ε(a+b,c)=1·(−1); ε(b,c)ε(a,b+c)=(−1)·1 | Pass |
| 9A: commutator; inverse | ε(a,b)ε(b,a); (a,s)⁻¹ | =(−1)^(a₁b₂+a₂b₁)=(−1)^(B(a,b)); (−a,sε(a,−a)) | Pass |
| 9A: folded Cartan matrices | A₃ O={1,3},P={2}; A₄; D₄ triality | d_O=2, C_{O,P}=−2, C_{P,O}=−1: [[2,−2],[−1,2]]; d_{O₂}=1, c=2: [[2,−1],[−2,2]]; C_{O,P}=−3: [[2,−3],[−1,2]] | Pass |
| 9A: fixed dimensions | D₄ triality; E₆; identity | 12+2=14; 48+4=52; 24+4=28 | Pass |
| 9A: A₂ exchange frame | e,f,h | [e,f]=H_α+H_β=h; [h,e]=(2−1)x_α+(−1+2)x_β=e; (2h,e,2f) sl₂ triple, index 4 | Pass |
| 9A: order-three γY | [[0,−1],[1,−1]] | det(γY−I)=3, Smith (1,3); kernel over 𝔽₃ spanned by (1,2)=(1,−1) | Pass |
| 9A: Kostant relations | sl₂ | E⁽¹⁾E⁽¹⁾=2E⁽²⁾; a=b=1 gives EF=FE+H | Pass |
| 9B.1: SL₂ big cell; charts over ℤ/4, ℤ | g=[[a,b],[c,d]]; [[2,1],[3,2]] | u₋(c/a)diag(a,a⁻¹)u₊(b/a) has entry (1+bc)/a=d; (a,c)=(1) but 2,3 non-units | Pass |
| 9B.2: SL₂→PGL₂ | diag(2,1) | λ²·2=1 has no rational solution; kernel μ₂ of length 2 in char 2 | Pass |
| 9B: special isogeny B₂ | τ* | α↦β↦2α, β↦2α↦2β | Pass |
| 9C: distributions of 𝔾_m; Frobenius on Dist(SL₂) | binom(H,2) on weight 3; p | 3; E⁽ᵖ⁾↦E⁽¹⁾, E⁽¹⁾↦0, kernel dimension p³ | Pass |
| 9D: forms of 𝔾_m over ℝ; Res_{K/k}𝔾_m | H¹(ℤ/2,ℤ/2); K=k(a^{1/p}) | ℤ/2; dimension p, kernel dimension p−1 | Pass |
| 9E: Steinberg endomorphisms | τ^(2m+1) in Sp₄/𝔽₂; identity | square = Frob_{2^(2m+1)}; identity excluded | Pass |
| 10A.1: contraction | weights p and 1; p=2 tensor | binom(p,p)=1; binom(1,p)=0; weight 2 contracts to weight 1 | Pass |
| 10B: Steinberg module | SL₂, p=2,3; PGL₂ | dimensions 2=2¹, 3=3¹; ρ=α/2∉ℤα | Pass |
| 10C: Lucas digits | p=3,n=4; p=2,n=2 | (v−tu)⁴=v⁴−tuv³−t³u³v+t⁴u⁴ in char 3: socle misses x²y²; y²↦span(x²,y²), xy generates R₂ | Pass |
| 10D: torsor charts; global functions | s_a, s_c | s_a·n(−1/(ac))=[[a,−1/c],[c,0]]=s_c; u_c−u_a=(ad−bc)/(ac)=1/(ac); k[a,c]_a∩k[a,c]_c=k[a,c] | Pass |
| 11A: left action | σ=(012), z=(0,1,2) | (σ·z)_i=z_{σ⁻¹i}=(2,0,1); `permute` uses `z.1 (σ⁻¹ i)` | Pass |
| 11A: degenerate n; nonsplitting | n=0,1,2 | π₁=1,1,ℤ; B₂=ℤ→S₂: 2m=0 and m odd impossible | Pass; headline instance |
| 11B/C/E: A₁ arrangement; regular vs regular semisimple; projectors | ℂ*/±1; [[0,1],[0,0]], I; diag(1,3) | z↦z², π₁=ℤ; centralizers ℂ*×ℂ and GL₂; P₁=diag(1,0), P₂=diag(0,1) | Pass |
| SL presentation | n=0,1,2 | relations 0, x−1, ad−bc−1; over ℤ/4, [[1,1],[0,1]]⁻¹ has entry −1=3 | Pass; headline instance |

**Pinned-library audit.** Declarations opened at the pin (paths relative to the Tau Ceti repository): `Unipotent/Radical/Construction.lean:72–84` (`unipotentRadicalDefiningIdeal` is a chosen maximal `IsUnipotentRadicalCandidate`, i.e. it cuts out a connected normal smooth unipotent closed subgroup); `HopfIdeal/Coinvariants/Basic.lean:92` (`coinvariants : HopfIdeal R H → Subalgebra R H`); `Smooth/CharZero.lean:148` (Cartier); `Dynamic/LeviDecomposition/Basic.lean:194`, `Frobenius/Points.lean:66`, `Frobenius/FixedPoints.lean:174` (the names the docstring cites); `Borel/Basic.lean`, `Reductive/Basic.lean`, `LinearlyReductive.lean`, `Connected/CommHopfAlgCat.lean`, `FunctorOfPoints.lean`, `HopfIdeal/Conjugation.lean`, `SpecialLinear/Basic.lean`, `GeneralLinear/StandardComodule.lean`, `GroupTheory/SpecificGroups/Braid/Basic.lean` (as in the previous round; the `#check` run confirms all nine pinned names elaborate).

**Supplier and ownership audit.** Every `*Needs:*` line and supplier citation was read against the layer order; the dependency check is clean. Cross-roadmap citations resolved: on main, SchemeAndStackFoundations §§0.3, 0.7, 0.8, 1.1, 1.5, 1.13–1.15, 2.6, 4.12; ModularCurves §§0E–0F; RootSystems Layers 1–6; LieHighestWeight Layers 3–4 and 7; LieGroups Layers 2, 7, 8; SmoothBundlesConnections B1.0, B1.1, B1.4; InductionRestriction Layer 2.1 (`Gassmann.almostConjugate_iff_permutation_equiv`, the resolver's one non-local lead, at its README); GroebnerGeometry G5; AlgebraicVectorBundles; AlgebraicTopology; DGFloer Layer 1.2; ReflectionInvariantTheory; IntegralLattices; ReductiveGroupsPartII RG2.3.7 (main README line 5201, `Lang.lang_surjective`). At open heads: IntegralHeckeAndGaloisDeterminants §0.7 (its README 1114–1160 contains "Rational cohomology of a flat affine group scheme" and names this roadmap's layers 6A and 10B as consumers at line 77); ComplexComparisonPartII C-1.1 (README 724–803: classical topology on `X(ℂ)`, gluing, smooth charts); AdelicAlgebraicGroups AA.3.1 (README 2442–2452: "Algebraic Levi decompositions", existence for `char F = 0` and geometrically connected `P`, citing Borel §1.13; its supplier contract cites ReductiveGroups layers 6–7 for Levi decompositions). All four are consumers of this roadmap, as the scope clauses say; none is cited as a supplier. The resolver's 23 leads are the 22 `Suggested.lean` names plus that Gassmann name; none is a missing dependency. Ownership of the objects this round touches was searched by object over the roadmap index (440 open pull requests): the characteristic-zero Levi complement (this folder, AdelicAlgebraicGroups AA.3.1 as above, and the sibling pull request revising this same folder); Lang's theorem, rational cohomology and the classical topology (as in R06 of the previous round, now recorded in Scope). The sibling pull request #1332 still declares the same `TauCetiRoadmap.ReductiveGroups` namespace; which revision proceeds is a human decision already recorded there.

**Shape and principles.** RootSystems, ReflectionInvariantTheory and Completed/EffectiveBounds were consulted as shape examples. Layer 6A ends with Examples and Dependencies; each definition in the seeded sections has an API list and at least three discriminating Checks; the README has no LaTeX delimiters, process words, round labels or pull-request numbers of this repository. No route-specific shortcut, re-planned roadmap, copied passage, algorithm, `set_option`, sorry'd data or edit outside the folder was found. `Suggested.lean` imports `Mathlib` once and ten existing `TauCeti.*` modules; `attribute [local instance] CategoryTheory.Over.cartesianMonoidalCategory` is an instance attribute, not an option.

## Not verifiable

- Conrad–Feng Appendix F (Proposition F.5.10, Theorem F.3.7), Brieskorn Proposition 1 (p. 25), Salvetti, Callegaro, Fox–Neuwirth, Fadell–Neuwirth, SGA 3 Exposé XIX, Jantzen's 2003 edition, Waterhouse, Borel, Springer, Carter, Serre, Lang 1956, Steinberg 1968, Howlett–Lehrer, Dipper–Du, Gassmann and Conrad–Gabber–Prasad were not read this round; they are cited by locator only (paywalled or not fetched). None is in the seeded sample.
- Ownership against open pull requests whose files this brief does not give was checked only through the roadmap index, not by reading their checkouts.

## Source issues

- none
