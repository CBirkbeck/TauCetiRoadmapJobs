# Review of GroupTheoreticMatrixMultiplication (pull request #3129 at bfce385)

**Verdict:** accepted

**Summary.** Accepted: no statement, Check or route step was found false, and every headline theorem of the README is stated in `Suggested.lean` at the README's generality. All locators into Cohn–Umans and Cohn–Kleinberg–Szegedy–Umans were read at the text and agree; the locators into Bläser's survey could not be read through the sources service. There are two small corrections (the form in which Cohn–Umans state Theorem 4.1; `IsAlgClosed` in Layer 3 is not needed) and three format notes, none blocking. Two points are left for the human reviewers: the unread survey, and the unpublished preprint named in the scope section.

## C01 — Cohn–Umans' Theorem 4.1 is stated with the pseudo-exponent, not in the form of 2.4

In 2.4 (`TauCetiRoadmap/GroupTheoreticMatrixMultiplication/README.md`, lines 326–328) the bound `(n m p)^(ω/3) ≤ ∑ d i^ω` is cited to "Cohn–Umans, Theorem 4.1, p. 5" with the only qualifier "all over `ℂ`". A reader who opens that theorem finds `|G|^(ω/α) ≤ ∑ dᵢ^ω` for the pseudo-exponent `α` (CohnUmans2003 lines 456–460); the form with an arbitrary realization is Cohn–Kleinberg–Szegedy–Umans, Theorem 1.8 (CKSU2005 lines 231–232), which the same sentence already cites. The two are equivalent (a realization has `n m p ≤ |G|^(3/α)`), so nothing stated is affected.

The smallest change follows what 1.1 already does for Lemma 3.1: add "in the form `|G|^(ω/α) ≤ ∑ dᵢ^ω` for the pseudo-exponent of the Remarks" after the Cohn–Umans locator.

## C02 — The hypothesis that `F` is algebraically closed is not needed in 3.1 and 3.2

Layer 2 is stated "over every field" with a presentation as data, but 3.1 and 3.2 (`le_index_of_isMulCommutative`, `sum_cube_lt`) add `[IsAlgClosed F]`, and the remark of 3.2 inherits it. A presentation `e : F[G] ≃ₐ[F] Π i, Mat_{d i}(F)` base-changes to the algebraic closure `K` of `F`: `K ⊗_F F[G] ≅ K[G]` and `K ⊗_F Π i, Mat_{d i}(F) ≅ Π i, Mat_{d i}(K)` (finite product), so `K[G]` has a presentation with the same block sizes `d`, and 3.1 over `K` gives `d i ≤ A.index`. Hence both statements hold over every field that admits a presentation, which is the generality of 2.4. (A field with a presentation is a splitting field for `G`; the hypothesis only looks necessary because Schur's lemma is applied to the restriction to `A`, which need not split over `F`.)

The statements as written are true, so this does not block. Would the author either drop `[IsAlgClosed F]` from the two theorems and add the base-change step to the route of 3.1 (with Mathlib's `MonoidAlgebra` scalar-extension and `Matrix` base-change equivalences in the *Needs:* line), or keep the signatures and say in one sentence in 3.1 that the general case follows by base change and is not stated?

## N01 — The product law of 1.1 has a locator in the two primary sources as well

The clause "`G × H` realizes `⟨n n', m m', p p'⟩`" (README line 103) cites only Bläser, Lemma 10.2. It is also the special case stated after Lemma 2.2 in Cohn–Umans, p. 4 (CohnUmans2003 lines 316–318) and Lemma 1.5, p. 3 of Cohn–Kleinberg–Szegedy–Umans (CKSU2005 lines 211–213); adding one of them gives the clause a primary locator.

## N02 — The heading of 3.2 is the title of §2 of Cohn–Kleinberg–Szegedy–Umans

"Beating the sum of the cubes" (README heading 3.2, the third headline of the Summary, and the docstring of `sum_cube_lt`) is word for word the title of §2 of the source (CKSU2005 line 238). Six words are no copying of substance, but a heading of the roadmap's own, for instance "The cube sum of the block sizes for the second construction", would keep the section named by its mathematics and not by the source's section.

## N03 — "(main)" in the scope section is a process word

"RepresentationTheory/CharacterTheory (main) §2.1" (README line 487) dates the sentence; "RepresentationTheory/CharacterTheory §2.1" says the same.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 `IsTPP`, right quotients | `S₃`: `S={1}`, `T={1,(2 3)}`, `U={(1 2),(1 2 3)}` | right: `Q(U)={1,(1 3)}`, property holds; left-quotient variant: `(2 3)·(2 3)=1`, fails | Check true, separates the variants | none |
| 1.1 `realizes_spec`, rotation and transposition | all `22³=10648` triples of subsets of `S₃` of size ≤ 2 | `6301` have the property; `(T,U,S)` and `(U,T,S)` have it in all `6301`; `0` failures | true | none |
| 1.1 counting `(nmp)² < \|G\|³` | trivial group `⟨1,1,1⟩`; `S₃` sets of size ≤ 3; `C₂`: `S={1},T={g},U={1,g}` | `1<1` false, so `nmp>1` needed; max `nmp=8`, `64<216`; `s⁻¹t=g∈Q(U)`; translates `s⁻¹qt` disjoint from `s⁻¹t` in all `S₃` cases | true; route correct where the source's step is not | none |
| 1.1 abelian clause | `S₃` `⟨2,2,2⟩`; `C₆`; `n m p = 0` | `8>6` so commutativity needed; `C₆` max `6`; `0 ≤ \|G\|` | true | none |
| 1.1 `realizes_of_normal` | route recomputed by hand; `n'=0`; infinite `G` | reduction mod `N` gives `t'ᵢ=tᵢ`, then `s'ᵢ=sᵢ`; `\|SᵢTᵢ\|=\|Sᵢ\|\|Tᵢ\|`; empty sets vacuous | true; matches Cohn–Umans Lemma 2.2 | none |
| 1.2 `fixCoord_isTPP` | `n=0,1,2,3,4`; triple `(H₀,H₀,H₁)` at `n=3` | points `0,1,3,6,10`; orders `1,1,2,12,288` = `∏(j+1)!`; property holds `n≤4`; control fails (`h·h⁻¹·1`) | true | none |
| 1.3 `cksuSet_isTPP` | `n=0,…,5`; `n=2` with `a=0` allowed | `n=0`: all three values `0`; orders `2,128,1458,8192,31250`; sizes `0,4,12,24,40`; property holds `n≤5`; control: `z·z·1=1`, fails | true | none |
| 1.3 route, two `z` | cases `(1,1,0)`, `(1,0,1)`, `(0,1,1)` by hand | components `x₀+y₁+x₂`, `y₀+x₁+x₂`, `x₀+x₁+y₂`; lone coordinate `a'₀`, `a'₂`, `a'₁` respectively, nonzero | route correct | none |
| 2.1 `groupTensor`, `mmTensor` conventions | index reading of `mmTensor`; `[ab=c]` variant in `S₃` | `mod(x0)=div(x1)`, `mod(x1)=div(x2)`, `mod(x2)=div(x0)` is `((i,j),(j,k),(k,i))`; `[ab=c]` needs `(s⁻¹u)²=1`, false for two transpositions | cyclic form consistent; Check true | none |
| 2.2 `restrictLE_mmTensor_groupTensor` | `n=0`; general coordinate | `n=0`: empty arrays equal; coordinate `[s_i⁻¹t_j t_j'⁻¹u_k u_k'⁻¹s_i'=1]`, conjugate by `s_i`: property for `(T,U,S)` | true over every field | none |
| 2.3 `groupTensor_equiv_sum` | `q=0`; block `d i=0`; `S₃` over `ℚ` | `q=0`: no presentation (`F[G]≠0`), vacuous; zero block adds dimension `0`; `1+1+4=6`; `T_A=(Mᵀ,Mᵀ,M⁻¹)·T_B` rederived | true | none |
| 2.4 `rpow_le_sum_rpow` | `nmp=0`; `d i=0`; `S₃` `⟨2,2,2⟩`; junk `sInf` | `0^(ω/3)=0`; `0^ω=0`; `2^ω ≤ 2+2^ω`; `τ=3,C=1` in the set and `τ≥2` forced, so `ω` a true infimum | true; route steps rechecked (`r^k=r·(N^(k−1))^(log_N r)`) | none |
| 3.1 `le_index_of_isMulCommutative` | `S₃`, `A=A₃`; `A=S₃`; `d i=0`; infinite `G`; non-closed `F` | `2≤2`; `2≤1` false so commutativity needed; `0≤index`; vacuous; holds by base change to the closure | true; hypothesis `IsAlgClosed` not needed (C02) | C02 |
| 3.2 `sum_cube_lt` | `n=0,1,2,3,4,5` | `n=0` vacuous; `n=1`: `2≤4`; `n=2`: `16+28·8=240≤256`; `n=3`: `54+351·8=2862≤2916`; `13824<16384`; `62500<64000`; difference `3n²−9n+1>0` | true; classes `k(k+3)/2=44,405` | none |
| Remark of 3.2 | `n=5` | `40^ω ≤ 2^(ω−1)·5⁶`; `20^ω ≤ 7812.5 < 8000`; `20^2.81≈4528<7812.5`, `log₂7≈2.8074` | true | none |
| Remark of 2.4 (pseudo-exponent) | Cohn–Umans Definition 3.1, Lemma 3.1 | minimum of `3 log\|G\|/log(nmp)`, `3` for the trivial group, in `(2,3]`, `3` if abelian | agrees with source | none |
| 2.4 citation (C01) | Cohn–Umans Theorem 4.1 against CKSU Theorem 1.8 | source: `\|G\|^(ω/α) ≤ ∑dᵢ^ω`; README: `(nmp)^(ω/3) ≤ ∑dᵢ^ω` | equivalent, form not noted | C01 |

- Source locators checked against the text: 18 (10 into Cohn–Umans, 8 into Cohn–Kleinberg–Szegedy–Umans), all correct in number, page and content; 10 into Bläser not read.
- Library declarations opened at the pins by `#check`: 11 Tau Ceti (the 9 of the supplier contracts with the stated instance hypotheses, `TauCeti.structureConstant`, `TauCeti.productOneTriples` with `z * y * x = 1`) and 24 Mathlib names of the *Needs:* lines; all exist as described.
- Cross-roadmap citations resolved: AsymptoticSpectra 3.1 and 3.3 at the head of its open pull request (`isStrassenPreorder_restrictLE` with `2 ≤ Fintype.card ι`, `abstractRank_restrictLE`, `matMulExponent_spec`, `abstractRank`); the nine copied declarations agree with it outside docstrings; RepresentationTheory/CharacterTheory §2.1 on main.
- Dependency check: `depcheck: 122 roadmaps, 1385 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean`: 9 `sorry` warnings, nothing else; `import Mathlib` only, no `set_option`, no sorry'd data. Elaborated signatures compared with the README statements: all nine agree; `tensorRank` does not take `[DecidableEq ι]`, as in the supplier's copy, with no effect.
- One-tactic probe (`rfl`, `simp`, `infer_instance`, `trivial`) on a copy of the file: none of the nine theorems closes.
- Automatic checks: all passed at this head. No change outside the roadmap folder.
- Headline theorems (2.4, 2.2, 2.3, 1.2, 1.3, 3.1, 3.2, with 1.1): all statable and stated.

Overlap check: read BilinearComplexityAndBorderRank, AsymptoticSpectra, RepresentationTheory/CharacterTheory; nothing shared. BilinearComplexityAndBorderRank owns the rectangular tensors and Schönhage's inequality and lists the group-theoretic approach as not treated; AsymptoticSpectra owns `CoordTensor`, restriction, rank and `ω`, which are copied here as definitions and cited for their theorems; the square lower bound is a route step in both this roadmap and BilinearComplexityAndBorderRank and a target of neither. Searching the open heads and main for the triple product property, group tensors and Cohn–Umans found no other owner.

Source independence: 12 passages compared with 2 sources (CohnUmans2003, CKSU2005), none shared beyond one six-word section title (N02); largest share CohnUmans2003 and Bläser, 10 of 28 locators each; contents compared with CohnUmans2003: independent (Layer 1 draws on its §2 and §3 and on CKSU §2, Layer 2 on its §2 and §4, Layer 3 on CKSU); Bläser's text and table of contents could not be read.

Research link: Layers 1–2 are the framework of Cohn–Umans (2003) and its bound (their Theorem 4.1); 1.3 and Layer 3 are the first group proving `ω < 3`, from Cohn–Kleinberg–Szegedy–Umans (2005), whose later sections (simultaneous triple product property, `ω < 2.41`) build on it. Rests on the two papers as read.

## Not verifiable

- The ten locators into Bläser, *Fast matrix multiplication* (Definition 10.1, Lemmas 10.2 and 10.5, Theorems 10.3 and 10.7, Examples 10.6 and 10.10): the sources service found no copy on a host it can classify (it tried the DOI's landing page at the journal). Every statement they support is also supported by a locator into the two papers read, except the product law (N01), which those papers state too.
- The scope section's sentence about the preprint *The matrix multiplication exponent is nine fourths* and its repository: not opened; the roadmap states none of its results.

## Source issues

- **Error** in CohnUmans2003 at the proof of Lemma 3.1, printed page 4 (441 of the proceedings): the source says the image of `(x, y) ↦ x⁻¹y` on `S₁ × S₂` meets `Q(S₃)` only in the identity; it should be that the translates `x⁻¹ q y` for a fixed `q ≠ 1` in `Q(S₃)` avoid that image (in `C₂ = {1, g}` with `S₁ = {1}`, `S₂ = {g}`, `S₃ = C₂` the image is `{g} ⊆ Q(S₃)`); affects the proof.

## For the human reviewers

- **Not tested.** Bläser's survey carries 10 of the 28 source locators (tied with Cohn–Umans for the largest share); its text and table of contents were not read, so wording and arrangement were not compared with it.
- **Licence.** The scope section (README lines 504–507) names an unpublished 2026 preprint and its public repository as recalling this background; the README says nothing rests on it. The preprint and repository were not opened.
