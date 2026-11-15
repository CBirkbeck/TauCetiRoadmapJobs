# Review of LocalGaloisDeformationRings (pull request #923 at e41a82c)

**Verdict:** accepted

Incremental re-review of the 145 lines changed since `e8e7f63`, and of the pull request's title and description against this head. No finding. The gate passes.

## Previous findings

- R01 — repaired: `README.md:3908` "`PotentialAutomorphyInfrastructure`, in its supplier contracts, consumes §§1.6, 1.12–1.13, 2.15, 3.7, 6.24 and 7.1–7.6"; the PadicLocalLanglandsForGL2Qp sentence is gone; `3319` cites 2.15 instead of `PA.3`.
- R02 — repaired: `README.md:1985` lists (i)–(iv) with hypotheses; `1990` "Case (iv) is not among the cases of the cited proof, and the same count applies to it".
- R03 — repaired: `README.md:1996` "it fails for every characteristic-zero field `E`: `Ω_{E[[X]]/E}` has fibre dimension at most one at `X=0` and infinite generic rank, so it is not projective"; `Algebra.FormallySmooth` left the `*Needs:*` of 764 and 962.
- R04 — repaired: `README.md:3611` "the quotient by the characteristic-polynomial and ordered-product equations"; `3380` "### 6.28 Explicit rings `R^{expl,∇}` and the gauge-chart comparison diagram"; both anchors (3501, 3544) follow.
- R05 — repaired: `README.md:3886` "(Sources: [KW209], Theorem 3.1 and the paragraph after it, pp. 18–19.)"
- R06 — repaired: `README.md:69` contract bullet for `ReductiveGroupsPartII`, RG2.0.3 (*integral-points-compact-open*); `2130` "RG2.0.3 (compactness and openness of `GL_d(𝒪_K)` and `𝒪_D×`)".
- R07 — repaired: `README.md:1372` "`ε^{−(p−1)}` has filtration jump `p−1`", `1373` "For `p≥3`", `2929` "### 6.4 Discrete series deformations away from `p` (CHT §2.4.5)"; links at 3208 and 3321 follow.
- R08 — repaired: no code span holds an article; the nine items read "`ClassFieldTheory`, Layer 7 (the absolute local Artin map, its normalizations and conductors)".
- R09 — repaired: `Suggested.lean:50` Layers 1 and 8 (quadric), `:75` Layer 7, `:111` Layer 8 (node); statements unchanged.
- R10 — repaired: description "universal deformation pairs with extensionality and inclusion maps"; the on-main list has "ReductiveGroupsPartII RG2.0.3 … RepresentationTheory/ModularInduction Layer 0 and RepresentationTheory/CharacterTheory Layer 3".

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 2.19, list of four cases (`README.md:1985`) | `ρ̄` irreducible; split; nonsplit; `q≡±1`, `p≥3` | `H⁰(ad⁰ρ̄(1))≠0`: irreducible forces `ρ̄≅ρ̄⊗ε̄`, `ε̄²=1`, (ii); `χ̄⊕1` ramified forces `ε̄=1`, (i); nonsplit forces `χ∈{1,ε̄}`: (iii), or `ε̄²=1`, (iv). | Pass; the list is complete. |
| 2.19 case (iv) (`1990`) | `q≡−1`, inertia through `u=[[1,1],[0,1]]` | Centralizer of `u` in `𝔰𝔩₂` is `𝔫`, Frobenius acts by `ε̄=−1`: `h⁰=0`; on `𝔫(1)` by `ε̄²=1`: `h²=1`; `h¹=1`; `dim Z¹=1+3−0=4`; `dim R_v=4<5`, so `r≠0`. | Pass. |
| 2.19 case (iv), generic fibre | Steinberg twist; `N=0` lift | `𝔫(1)` has character `ε²≠1`. `N=0`: `ζ^{q+1}=1`, `ζ≠ζ⁻¹`, induced; `ad⁰(1)=ηε⊕Ind(θ/θ^σ)ε`, `ηε(Frob)=−q≠1`, `ζ⁴≠1`: no invariants. | Pass. |
| 2.19 case (iii) count | `q≡1`, extension of 1 by 1 | `h⁰=1` (`𝔫`), `h²=1`, `h¹=2`, `dim Z¹=2+3−1=4`; `p=3`, `q=7`: `(3+1)/2=2` components. | Pass. |
| 2.19 Check, discrete formal smoothness (`1996`) | `E=ℚ̄`, `E=ℚ_p` | Projective over the local domain `E[[X]]` means free; fibre rank `≤1` (spanned by `dX`), generic rank `dim Ω_{E((X))/E}=∞`. | Pass for every `E`. |
| 1.6 Checks after `l→p` (`1372–1373`) | `p=3` | Jump `p−1=2` lies outside `[0,p−2]=[0,1]`; `Fil^{p−1}M=0` excludes it. | Pass. |
| 6.3/6.4 Checks after `l→p` (`2922`, `2946`) | `ℚ_p`, `p>3`; `q≡1` | `H²(k(ω))=H⁰(k(ω⁻¹ω))^∨=k≠0`; `q≡1` gives `k(1)≅k`. | Pass. |
| 7.1 API and Checks after renaming (`3611–3622`) | `n=1`; `n=0` | `n=1`: `X−ρ=X−χ̃₁` and `ρ−χ̃₁=0` are the same relation; `n=0`: empty polynomial 1, zero ring of `0×0` matrices. | Pass. |
| 2.26.1 with RG2.0.3 (`69`, `2130`) | `GL_d` over `𝒪_K`; unit group of `𝒪_D` | Both affine of finite type over `𝒪_K` (`𝒪_K[x_ij,1/det]`, `𝒪_K[x_i,1/Nrd]`), generic fibres `GL_d`, `D×`; RG2.0.3 gives compact open subgroups. | Pass. |
| 8.18 locator (`3886`) | KW209 line 842–862 | Theorem opens p. 18, last bullet and the sentence on integral points p. 19. | Pass. |
| `oddRealRing_geometry`, `det_ordinary_iff_ordered_triangularization`, `completedNode_isDomain_flat` | reordered file | Three `sorry` warnings (lines 64, 103, 124), no other message; the moved block is byte-identical. | Pass. |

The rows for the untouched statements stand as in the previous review, of `e8e7f63`.

- Source locators checked against the text: 1 (KW209 line 842–862), correct.
- Cross-roadmap citations resolved: 10. On main: `ReductiveGroupsPartII/README.md:729–745` (RG2.0.3), `RepresentationTheory/ModularInduction/README.md:174` (Layer 0), `RepresentationTheory/CharacterTheory/README.md:397` (Layer 3; conventions line 125: algebraically closed, characteristic prime to `|G|`), `SmoothRepresentationsOfLocalGroups/README.md:1220` (SR.1.2). At open heads: PotentialAutomorphyInfrastructure lines 206, 216–218; PotentialModularityAndCompatibleSystems line 20; GL2ModularityLifting lines 160–164; GlobalGaloisDeformations Layers R04.6 and G7.
- The three resolver leads: `Reduction.finite_classes` is AdelicAlgebraicGroups AA.3.4's name (its README line 3168); `GaloisRep.carayol_conj_of_trace_eq` is ArithmeticGaloisRepresentations §5.10's (its `Suggested.lean:291`); `TauCeti.NumberTheory.LocalField.Tame.PadicCharacter` is a module at the pin.
- Gate at `e41a82c`: every counter zero, build passes. Dependency check: `depcheck: 245 roadmaps, 2244 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the folder.
- Pull request text: title equals the README heading; the summary block, the supplier paragraph (every on-main and open supplier with its sections, including SR.1.2, RG2.0.3, ModularInduction Layer 0, CharacterTheory Layer 3) and the nine-declaration sentence agree with the head.
- Headlines: the three stated; the module docstring names the others as not statable with their missing carriers. No declaration added, removed or restated, so the padding probe of `e8e7f63` stands.
- Remark (untouched text): `README.md:3289`, `3294` and `3523` name "Table 3" and "(3.14)" without `[LLHLM20]`; the Sources line at 3307 carries the locators.
- Overlap check: read PotentialAutomorphyInfrastructure, PotentialModularityAndCompatibleSystems, GL2ModularityLifting, GlobalGaloisDeformations, SmoothRepresentationsOfLocalGroups; all cite this roadmap as owner of the local rings; nothing shared. PotentialAutomorphyInfrastructurePartII was not reread.

Source independence: changed passages only; 1 passage compared with 1 source (8.18 against KW209 line 842–862), none shared; the new text of 2.19 case (iv) has no source passage; largest share Gee22, 34 of 389 locators, as at `e8e7f63`; no layer added, removed or reordered, so the contents were not compared again.

## Not verifiable

- CG18, published pp. 364–365: only arXiv v2 was read (in the previous round); whether the published proof of Lemma 4.11 lists case (iv) is not known. The README states that case with its own argument.
- KisinFlat, Kisin2adic, CT17 and the KisinPST author-DVI pages: as in the review of `e8e7f63`; no changed passage cites them.

## Source issues

- none

## For the human reviewers

- **Licence.** `README.md:690` says the representing-pair interface "follows the Imperial College London FLT project", a public Lean formalisation; no declaration of `Suggested.lean` carries its names. Its licence was not read.
- **Licence.** The [Geraghty] reference links a CiteSeerX copy of the 2010 preprint, a host the sources service places in no licence class; [KisinNotes] and [Conrad] are author manuscripts.
- **Not tested.** KisinFlat, Kisin2adic and CT17 (14, 10 and 3 locators) could not be read: wording and locators of the sections citing them were not compared with the texts.
