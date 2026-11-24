# Review of MetaplecticAutomorphicForms (pull request #3027 at 0b5086d)

**Verdict:** needs changes

**Summary.** A review of the change against `main`: 254 changed lines since `aecb53a`. I read the ten added sections (1.5, 2.5a, 3.3d, 3.7a, 3.9a, 3.22a, 5.6a, 5.6b, 6.4a, 6.4b), the restated 6.13 and the changed dependency, scope and contract paragraphs, and recomputed their normalisations: the Fock model and the Bargmann kernel, the sign of the `K̃`-action, the complex structure of 3.7a, Liu's segment in 3.22a and the ranges of 6.4a. All of these agree with each other and with the sources I could read. Two findings need changes. A Check of 5.6b says the lift convention matters for orthogonal groups, which is false because every irreducible representation of `O(V_v)` is self-dual. And 5.6a's mixed model uses the orthogonal-sum compatibility of 3.3d (a) for an arbitrary acting space, while 3.3d states (a) only when that space is split. There are also five small corrections (one on the pull request's description), no format notes and nothing for a human to decide.

## R01 (P2) — A Check of 5.6b says the lift convention matters for orthogonal groups, but every irreducible representation of `O(V_v)` is self-dual

A reader would conclude that (i) and (ii) of 5.6b change when the conjugate-linear lift of 5.6 is swapped for the linear lift. They cannot. The second Check (line 1504) reads: "When `π_v≅π_v^∨` the statements for the two lifts agree; otherwise (i) distinguishes them, so the convention of 5.6 matters." For a quadratic space over a nonarchimedean field, every irreducible admissible representation of `O(V)` is isomorphic to its contragredient (Kudla96, IV, Theorem 1.6 (i), p. 63, line 2482, after Mœglin–Vignéras–Waldspurger). The same holds at the archimedean places, by the same character argument, because every element of an orthogonal group is conjugate to its inverse. So the "otherwise" case never occurs. Replacing `π_v` by `π_v^∨`, as the convention paragraph (line 1493) does, leaves (i) and (ii) unchanged.

A smaller fix is to replace the Check with one that is true and still tests the convention paragraph. For example: "For orthogonal groups `π_v ≅ π_v^∨` (Kudla96, IV, Theorem 1.6 (i)), so the linear and conjugate-linear lifts give the same statements (i) and (ii). For unitary pairs (6.13) the convention matters." The convention paragraph could also say in one clause that for `O(V)` the replacement changes nothing.

## R02 (P2) — 5.6a's mixed model needs 3.3d (a) for the acting group `U(W)` with `W` arbitrary, but 3.3d states (a) only when the acting group's space is split

As written, 5.6a's proof for non-split `W` stops at a step that no section of this roadmap supplies. The identity "constant term along `N_C` = lift of `f` to `U(V′)` for `φ(·,0)`" requires `U(W)` to act on `S((V′⊗W)⁺⊕(C^∨⊗W))` by the tensor product of its action for `(V′,W)` and the action `φ(y)↦φ(h⁻¹y)` for `(C⊕C^∨,W)`. That is the compatibility with an orthogonal sum `V = V′⊥(C⊕C^∨)` of the *other* member, which is 3.3d (a) with the roles exchanged. 3.3d (line 677) states (a) only under "Suppose that `V` is split", i.e. with the acting group's space split. In 5.6a the acting space `W` is arbitrary, and the paragraph of standing hypotheses (line 1475) and the *Needs* line (line 1479) cite only "3.3d (b)" and Wu13 §§2.3, 3.

Wu13 takes this step without proof: it says that "implicitly" the trivial character is used for the extra hyperbolic planes (arXiv text, §3, before Proposition 3.1). A later roadmap of this pull request, ThetaKernelsForUnitaryDualPairs, states in the *Origin* of its §3.3b that (a) for a non-split acting space is its own formulation. Its use of 5.6a then adds "the compatibility of the splittings of the two pairs (3.3b, orthogonal sums)" as a separate input.

The smallest repair is to state (a) of 3.3d for an arbitrary acting space, with a one-sentence route: embed `W` in the split `W⊕W⁻`, apply (a) there, and restrict to `U(W)×1` by (b). Then cite "3.3d (a), with the roles exchanged" in 5.6a's standing hypotheses and *Needs* line. Alternatively, 5.6a could state the compatibility as part of its own target.

## C01 — The second Check of 2.5a calls `±1` "the centre" of `Mp(W)`

At line 530, the Check is about the kernel `{±1}` of `Mp(W)→Sp(W)` (2.4b, `metaplecticCover_center`), and what it says about that kernel is right. But the centre of `Mp(W)` for `W≠0` is the whole preimage of `{±1_W}`, which has order 4. A central lift of `−1_W = exp(πJ)` acts on the degree-`ℓ` polynomials by `e^{−i(ℓ+N/2)π}`, which is not `±1` when `N` is odd. "The kernel `{±1}` of `Mp(W)→Sp(W)`" would be right.

## C02 — The hypothesis of 5.6b (ii) is 3.7, which this roadmap proves

(ii) (line 1491) assumes "local Howe duality, in the form of 3.7, … at every place `v`, the archimedean places included". 3.7 proves exactly this at every place of a number field: Gan–Takeda for the finite places, dyadic ones included, and Howe's theorem at the archimedean places. 3.7 is already on the *Needs* line. Rallis84a states the local duality as a hypothesis because it was then a conjecture (Theorem I.2.2, p. 355). Here (ii) could be stated unconditionally, citing 3.7, with Rallis's conditional form kept in the locator.

## C03 — Several of the new sections cite their main sources without a locator

The following have no theorem, section or page:

- 1.5: Bargmann61, Bargmann67, KV78, Howe89a.
- 2.5a: KV78, Howe89a, Bargmann61.
- 3.7a: KV78, Howe89a, Howe89b, Paul98.
- 3.9a: MVW87, Li89.
- 6.4a: Ichino07.
- 6.4b: Weil65 is cited only as "the mean-value form of Siegel's formula for the classical groups", although it is that section's main source.

A reader cannot check these statements against their sources. Give the theorem and section for each, as the other new sections do (Liu21, Wu13, Rallis84a, Kudla96).

## C04 — "Polynomials of degree ℓ" in 2.5a (i) should be "homogeneous polynomials of degree ℓ"

The text at line 518 says `exp(θJ)` acts on the polynomials of degree `ℓ` by `e^{−i(ℓ+N/2)θ}`, and identifies them with `det_J^{−1/2} ⊗ Sym^ℓ`. Both statements hold only for the homogeneous part: `1 + z` has degree 1 but is not an eigenvector. The same phrase appears in the second Check (line 530). 3.7a (iii) already says "part of degree `ℓ`".

## C05 — The description's account of this roadmap's change is incomplete

The description lists this folder among the largest additions as "MetaplecticAutomorphicForms (the Weil representation and theta correspondence for unitary dual pairs)". This leaves out:

- the real Fock model of any real symplectic space (1.5, 2.5a);
- Rallis's global Howe duality for orthogonal–symplectic pairs (5.6b);
- the restated lift convention of 6.13;
- the new supplier RepresentationTheory/SchurWeyl §8.4 (for 3.7a).

The description lists new supplier relations between general roadmaps, but not this one. A text that would be right: "MetaplecticAutomorphicForms (the Fock model of the real Heisenberg and Weil representations; the Weil representation and theta correspondence for unitary dual pairs; Rallis's global Howe duality for orthogonal–symplectic pairs; the lift convention of 6.13 made explicit; RepresentationTheory/SchurWeyl §8.4 a new supplier)".

## Questions for the author

- 6.4a restricts the range `n<m≤2n` to `F` totally real, `E` totally imaginary and polynomial Fock data at the archimedean places, calling this "the setting of Ichino07". Does Ichino07 assume this? GQT credits Ichino07 without such conditions: §7.1 (line 1629) for the anisotropic case `d(n)<m≤2d(n)` and the proof of Proposition 11.1 (ii) (line 2605) for the convergent case. If it does not, the statement is narrower than its source. I could not read Ichino07 (Math. Z., no open copy found).
- Does HKS96, Appendix, Corollary A.3 also state the orthogonal-sum compatibility of the other member, (a) of 3.3d, without a splitness hypothesis? If so, it would settle R02 by citation. I could not read HKS96 (see below).

## Verified sound

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| 1.5 Bargmann transform, Check 1 | `N=1`, `Je=f`, `X=ℝe` | `∫e^{−2πu²}du=2^{−1/2}`, so vacuum `2^{1/4}e^{−πu²}`; kernel sends it to `√2·e^{−πz²/2}·e^{πz²/2}/√2=1`; translation and modulation intertwine with `U_a`, `U_{ib}` | holds |
| 1.5 (i) Heisenberg law | `U_wU_{w′}` | exponent difference `−πi Im h(w,w′)=πiω(w,w′)`, i.e. `ψ_ℝ(½ω(w,w′))`, the law of 0.1 for `B=ω/2` | holds |
| 1.5 (ii), Check 2 | `N=1`, `z^k` | `‖z^k‖²=∫(s/π)^k e^{−s}ds=k!π^{−k}`; `‖z‖²=1/π`; `⟨F,z^κ⟩=κ!π^{−|κ|}conj(f_κ)` | holds |
| 1.5 (iv), Check 3 | `T=δ₀` | `ϑ=K(·,0)=2^{1/4}e^{−πz²/2}`; `|ϑ|²e^{−π|z|²}=√2e^{−2πx²}`, not integrable in `y`; growth `≤e^{π|z|²/2}` | holds |
| 2.5a (i), Check 1 | `dω(J)=−i(−D²/4π+πu²)` | `[dω(J),D]=2πiu=dρ(f)`; `[dω(J),2πiu]=−D=dρ(Jf)`; eigenvalue `−i/2` on Gaussian; `z^ℓ↦e^{−i(ℓ+½)θ}z^ℓ` | holds |
| 2.5a Check 2 (C01) | centre of `Mp(2,ℝ)` | preimage of `±1` has order 4; lift of `exp(πJ)` acts by `−i(−1)^ℓ` | label wrong |
| 3.3d (b) | Wu13 (2.8), arXiv text §2.2 | same `χ₁` on `G(X₁)×G(X₂)`, no splitness assumed; credited to HKS96 Cor. A.3 | matches |
| 3.3d (a), Checks | `W″=0`, `V` split | `χ_{W″}|F×=1`; line character `η̃∘det` equals the character change of 3.3 for `χ_{W′}↦χ_{W′}η` | holds |
| 3.7a (iii) `J` | `δ=−i/c`, `c>0` | `ω(x,ix)=2Re(iδ)h=−2Im(δ)h=(2/c)h`; `J=i` iff `sgn V·sgn W^♭=+1` iff `ε=−1` | holds |
| 3.7a Check 2 | `n=d=1`, `(t,s)` | `z^ℓ∘k⁻¹=(ts)^{−ℓ}z^ℓ`; `z̄^ℓ∘k⁻¹=(ts)^{ℓ}z̄^ℓ` | holds |
| 3.9a (ii) route | arbitrary admissible `π` | bump coefficient compactly supported for every `φ′`; `T(φ)=(∫Φ)ξ≠0` if `𝒰⊂Stab(ξ)` | holds |
| 3.9a Check 2 | `W₀` anisotropic, dim 2, `n=1` | `r=0`: no isotropic line; `r=1`: `W₁=W₀⊕H` has one | holds |
| 3.22a (iii) | Liu21 Def. 2.8, `ε=+`, `d=2r`, `n=2s` | `q_F^{±1},…,q_F^{±(2(r−s)−1)}=q_E^{±1/2},…,q_E^{±(d−n−1)/2}` | holds |
| 3.22a Checks | `n=0`; `d=n+t` | segment is the trivial rep's parameter; `(d−n−1)/2+(d−1)/2=(n+2t−2)/2` | holds |
| 5.6a | Wu13 Prop. 3.1; Rallis84a Thm I.1.1 p. 345 | `[θ_{X_a,Y}(g,φ,f)]_{Q_a}=θ_{X,Y}(g,φ(·,0),f)`; `U(W)` side needs 3.3d (a), non-split | R02 |
| 5.6b (i), (ii) | Rallis84a Thm I.2.2, Rem. I.2.3, p. 355 | `dim V` even (p. 344); local Hom from global form (pp. 355–356) | holds |
| 5.6b Check 2 (R01) | Kudla96 IV Thm 1.6 (i) | `τ≅τ^∨` for all `τ∈Irr(O(V))`, so "otherwise" never occurs | false |
| 5.6b (ii) (C02) | hypothesis vs 3.7 | 3.7 covers every place of a number field | redundant |
| 6.4a | `m=3,r=1,n=1`; `m=4,r=1,n=2`; `m=2,r=1,n=1` | `s₀=1>½`; `s₀=1=n/2` (continuation); `m−r=1=d(1)`, `1<2≤2` second term | holds |
| 6.4a constant | vs 6.4 | `τ(H)/[E:F]=2/2=1`, `c=1` as `s₀>0` | holds |
| 6.4b (a), (b) | `n=1,m=3` | `m−n≥n+1≥2`, `τ(U(k))=2`; density exponents `≥m−n+1≥3`; unfolding gives `vol[H^{x₀}]=vol[H]` | holds |
| 6.4b split place | `V_v=A⊕A^∨` | `(ℓ_i(a_j))` invertible; stabiliser `GL(⋂ker ℓ_i)` | holds |
| 6.13 | GQT §11.2 p. 52 | linear lift `∫θ(φ)(g,h)f(g)dg` equals `θ_φ(f̄)` of 5.6 | holds |

- Source locators checked against the text: 17. Liu21: Thm 1.1, Def. 2.8, Thm 6.2, Rem. 1.4 (1). Wu13: §2.2 (2.6)–(2.8), §2.3, Prop. 3.1. Rallis84a: Thm I.1.1, Thm I.2.2, Rem. I.2.3. Kudla96: III.4 Props 4.1, 4.3–4.5 and IV Thm 1.6. GQT: §7.1, Prop. 11.1, §11.2. Sample 1.1: Kudla96 Thm 1.1.
- Seeded sample: only 3.3d lies in the changed text, and its locators were checked through Wu13. The other sample targets are untouched and unaffected; 1.1 was spot-checked and holds.
- Library declarations opened at the pin: Mathlib `integral_gaussian` (Analysis/SpecialFunctions/Gaussian/GaussianIntegral.lean:210).
- Cross-roadmap citations resolved: 11. OrthogonalL2Bases Part D (main). RepresentationTheory/SchurWeyl §8.4 and CompactGroups Layers 4–5. AdelicAlgebraicGroups §2.6 *top-form-measure*. GeometryOfNumbersAndQuadraticArithmetic 2.7.6, 2.9.3a (b), 2a.4 (a). ArithmeticGaloisRepresentations §2.7 *Global inputs*. SmoothRepresentationsOfLocalGroups §§SR.4.3–SR.4.4.
- Record: the README at the merge base against the head. No layer or item removed or renumbered; the ten deleted lines are each replaced by a superset.
- Dependency check: `depcheck: 132 roadmaps, 1477 edges, 0 problem(s)`, so no upward supply and no cycle.
- Automatic checks: all pass. `Suggested.lean` is unchanged by the pull request and elaborates with four `sorry` warnings only. No file changed outside the folder.
- Overlap check: read ThetaKernelsForUnitaryDualPairs, ThetaLiftsForDefiniteUnitaryGroups, GrossZagierAndArithmeticHeights, ExceptionalThetaCorrespondencesForG2, AutomorphicLFunctionsAndLocalFactorsPartII and SpecialFunctionsAffineHeisenbergGroups. The Fock model (1.5, 2.5a) is restated in ThetaKernelsForUnitaryDualPairs §3.45 as a corollary of these sections, so this roadmap is the owner. SpecialFunctionsAffineHeisenbergGroups cites that §3.45, which remains. The non-split case of 3.3d (a) is stated only in ThetaKernelsForUnitaryDualPairs §3.3b (R02). Nothing else is shared.
- Source independence: 9 changed passages compared with 5 sources (Liu21, Wu13, Rallis84a, GQT, Kudla96), changed passages only, with no wording shared beyond forced formulae. The largest share of locators is BFH90, 96 of 413 citations. Contents were not compared, because no layer was added, removed or reordered.
- Research link: Layers 3–6 carry the local Howe duality of Gan–Takeda (2016) and the Siegel–Weil and Rallis inner product formulas of Gan–Qiu–Takeda (2014), consumed by GrossZagierAndArithmeticHeights and RankOneConverse. The added sections are the unitary inputs (Liu 2021, Wu 2013, Ichino 2007, Weil 1965) of arithmetic theta lifting. This rests on the README overview and GQT §§7, 11.

## Not verifiable

- HKS96 (3.3d (b)): the publisher's landing page is on a host the sources service does not class, and no other legal copy was found. The citation was checked through Wu13's quotation.
- Kudla94 (3.3d (a)): Israel J. Math., paywalled. Checked through Wu13's quotation, (2.6)–(2.7).
- Weil65 (6.4a, 6.4b): Acta Mathematica through a Springer DOI, which the service classes as paywalled.
- Ichino07 (6.4a): Math. Z., paywalled.
- Bargmann61, Bargmann67, KV78, Howe89a, Howe89b, Paul98, Li89, Li92, MVW87, Mínguez08, Liu11, Rallis82, Braun41: cited without locators (C03) or not fetched. Their statements were checked by computation, not against the sources.

## Source issues

- none

## For the human reviewers

- none
