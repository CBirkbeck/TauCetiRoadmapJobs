# GATE-PadicFamiliesPartII~2: answers to the review of `f252b89`

One review comment (CBirkbeck, 2026-11-15T14:18:28Z) with seventeen findings F01–F17. Findings with two parts whose verdicts differ are split, giving H01–H20; the F number is named in each section. The scratch copy of the comment ended inside F11; F11–F17 were read from the pull request itself (read-only). Line numbers below are those of `TauCetiRoadmap/PadicFamiliesPartII/README.md` at the repair commit `c64e8814`. Section numbers in the review are those of an older numbering of the board's copy; each point is mapped by content.

## H01 (CBirkbeck) — applied

F01. Layer 6 used the spherical `X_{G₁,1}^I` of §4.5 as the carrier of `U_Kli`, `U_Iw`, Z and `U_{w,2}`, whereas BCGP21 §5.2 (BCGP21 line 5800) works at level `K_p(I)` (Klingen on I, Iwahori on `Iᶜ`). §4.7 (line 718) now defines `X₁^I` as the mixed-level special fibre of §4.1 (the space `X_{G₁,1,mix}^I` of §5.2) with its w-ordinary open `X₁^{I,=w2}`, and §6.1a (line 1053), §6.2 (line 1069), §6.3 (line 1083) and §6.4 (line 1098) use `X₁^I` and `X₁^{I,=w2}` in place of `X_{G₁,1}^I` and the undefined `X^{I,=w2}_1`; a Check at line 1092 records the four lines `H_p ⊂ G[3]^m ≅ μ₃²` over an ordinary spherical point at `F = ℚ`, `p = 3`.

## H02 (CBirkbeck) — applied differently

F02. No roadmap on main or among the open pull requests constructs the flag-variety sheaves `D̃^la`, `C^la` (object search for `C^la`, `D̃^la`, twisted differential operators, LB-sheaves, the horizontal nilradical and analytic germs; the only `C^la` elsewhere is `C^la(G, K)` of LocallyAnalyticDistributionsPartII §§4.1–4.4, a different object), so the new target §7.1c (line 1194) constructs both, with the three actions, the (𝔤,G)-equivariant LB-sheaf structure killed by `𝔲⁰_P`, the commuting `∗₂`, the `D̃^la`-module structure, the fibre `O_{U_P\G,e}`, `∗₂(ιz) = Θ_hor(HC(z))` and `VB⁰(C^la) = O^la` (BCGP25 Definitions 3.2.38, 3.2.41, Lemma 3.2.43, Theorem 4.5.20(4)), with the three requested Checks (trivial G; `G = P = 𝔾_m`; the signs `−t`, `+t`, `−t`); §7.2 (line 1218), §7.4 (line 1267) and the Scope paragraph (line 13) now cite it. Differently from the suggestion: the target sits after §7.1b, not before §7.1, because it uses `𝒰(𝔤)` of §7.1 and only §7.2 onward consume it; and the contract gap:solid-vb-sen (line 235) no longer names `C^la` (an object only this later roadmap now constructs) but supplies `VB(O_{G,e} ⊗ O_FL) = O^{Rla}` (BCGP25 Remark 4.5.2 and the proof of Theorem 4.5.20(4)), from which §7.1c derives `VB⁰(C^la) = O^la`; HigherHidaAndColemanTheory §5.1 is not added, since it states no target and FL is fixed in Layer 7's standing hypotheses.

## H03 (CBirkbeck) — applied differently

F03. Line 940: "its finite nonzero slope blocks are perfect over A" → "compact on the complex of projective Banach `A[1/p]`-modules of §5.4, and its finite nonzero slope blocks, which exist locally on `Spa(A[1/p], A)`, are perfect over the affinoid algebras there … No integral lattice of a slope block over A is asserted", with the counterexample `ℂ_p[0]` over `A = O_{ℂ_p}` as a Check (line 949). Plain "perfect over `A[1/p]`" would overstate: slope decompositions exist only locally on the base (BCGP21 line 6727; HigherHidaAndColemanTheory §6.3).

## H04 (CBirkbeck) — applied

F04. The Layer 2 standing paragraph (line 374) defines J, the places with `a_i b_i > 0` in type A (all places in type C, where `a_i = dim_ℚ U_Q/(2n[F₀:ℚ])` is independent of i and positive, BPS line 210, so no rank-zero type C factor occurs), defines `c_i` only on J, explains that a definite place has `δ_i ≡ d_i a_i` and nothing to continue, and treats J empty (a finite Shimura variety); §2.1 (line 378) imposes the region on J only, §2.7 (line 471) iterates over J, §2.9 (line 496) lists the dimension-zero case, and the CM datum of signature `(0, 1)` is a Check (line 394).

## H05 (CBirkbeck) — applied differently

F05. Line 1501: "a perfect Λ-bilinear pairing `𝓜_w ⊗_Λ 𝓜_{w^*} → Λ` … with the torus action transposed" → a perfect pairing `𝓜_w ⊗_Λ τ^*𝓜_{w^*} → Λ` for the involution `τ([t]) = [w₀(t^{−1})]` (equivalently τ-semilinear in the second variable), with `t` adjoint to `w₀(t^{−1})`, as HigherHidaAndColemanTheory §4.8 transports the second action; the Check at line 1507 computes the obstruction for `z = 4·1` at `p = 3` (`[z] − [z^{−1}] = [z^{−1}]([16·1] − 1)` a non-zero-divisor). The statement now says that the fibre at χ pairs with the fibre at `χ ∘ τ`, whose central character is inverted; a central coordinate for `κ^∨` is not added to the last Check, because Layer 9's weights are the two-coordinate weights of the dictionary of HigherHidaAndColemanTheory §1.1 and carry no central coordinate.

## H06 (CBirkbeck) — disputed

F06, first location (the doubling proof route). At `f252b89` the route of §6.3 no longer contains the quoted clauses ("the kernel is a colimit of finite-dimensional spaces stable under the commuting operators; a nonzero simultaneous eigenvector (f, g) …"); it already reads as the suggested replacement (common eigenline of C and `U_{w,2}`, second coordinate `f = −ξg`, `U_Kli f = (ξ + u/ξ)f`, `Zf = ξf`, `(α, β) = (u/ξ, ξ)`), now line 1085. The only change made there is the citation of the commutations of §4.10 (H10).

## H07 (CBirkbeck) — applied

F06, second location (the two-refinement statement). §6.4 (line 1098) is restated from the roadmap's own §6.1 algebra instead of the order of BCGP21 Remark 5.8.7: (a) E local Artinian, the quadratic `X² − U_Kli X + U_{w,2}` split in `E[X]` by Hensel, `(C − α̃)(C − β̃) = 0` by §6.1; (b) the kernels of `C − ξ̃` are the graphs `{(f, −ξ̃^{−1}f)}` and `M ⊕ M` is their direct sum; (c) on the graph of ξ the doubling map is `f ↦ f − U_Iw^{−1}(ξ̃′f)`, injective by §6.3, image killed by `U_Iw − ξ̃`. The first and last Checks are reworded to the graphs (`T = 5`, `U = 6`: `2^{−1}Z = 3U_Iw^{−1}`).

## H08 (CBirkbeck) — applied

F07. Line 483: "the cusps lying in the multiplicative tube where the Tate curve describes the complements" → the continuation is carried out on both kinds of Tate chart, the cusp with selected subgroup `μ_p` having degree 1 and the one with selected subgroup generated by t in `Tate(t^p)` degree 0, with the estimates and gluing proved on both, BPS Remark 5.3.2 cited as the description of this boundary treatment that the target carries out. The `Γ₀(3)` Check (degrees 1 and 0, `dz/z` pulled back by 3 and by 1) is at line 491.

## H09 (CBirkbeck) — applied

F08. Line 1527 now defines `M^{|·|²}` as BCGP25 does (BCGP25 lines 7637–7649): the submodule on which `(z_ℓ)_ℓ` acts by `z_p^{−2}`, not the norm character; it is the `∏_{ℓ≠p} ℤ_ℓ^×`-invariants on `𝓜_{w,K^p} ⊗ Λ_{GSp₄,ℚ}`; and `ZK^p = ∏_{ℓ≠p} Z(ℤ_ℓ)K_ℓ`. The Check at line 1536 computes `4^{−2} = 1/16` at `p = 3`, `3^{−2} = 1/9` at `p = 2`, `(−1)^{−2} = 1`.

## H10 (CBirkbeck) — applied differently

F09. The commutations are now a statement of §4.10 (line 786), the section of the scalar-weight-two relations, rather than of §4.4: `U_Iw Z = Z U_Iw = U_{w,2}` on sections over `X₁^{I,=w2}`, hence `U_Iw`, Z, `U_{w,2}` commute pairwise, and `U_Kli` commutes with `U_{w,2}` on `H⁰(X₁^I, ω²(−D))` and on the ordinary open (BCGP21 Lemma 4.5.15, line 5081); a proof route (line 788) shows each `U_{w,2}`-kernel N has exactly one filtration of each shape (the sum of its multiplicative line and `pN`; the étale part of `N[p]`). The non-commuting witness is a Check (line 796); §6.3 (line 1085) and §6.4 cite §4.10 and list it under *Needs*. The "(§4.3)" and "and commutation" wordings quoted in the finding are not in this text.

## H11 (CBirkbeck) — applied differently

F10. §1.4's route (line 354) is rewritten in this roadmap's terms (no integral point in the closed band, a positive lower bound ε for the gain by the maximum modulus principle, and the iteration giving `N > (ν − η)/ε`), and §1.3's route (line 342) replaces "compare `deg H_i` with `f l − deg L`" by `deg H_i = d_i a_i − deg L` from additivity. Differently from the suggestion, the isomorphism `H_i × L → A[π_i]` is credited to HodgeTateAndCanonicalSubgroups §0.8 (a generic isomorphism between groups of equal degree is an isomorphism); additivity alone gives only the degree equality.

## H12 (CBirkbeck) — applied

F11. The §8.6 Check at line 1425 now uses `U(g) = [[1, log χ_cyc(g)], [0, 1]]` and the Borel-stable symplectic `U(−1) ⊕ U^∨(−2)` at `w = 0` (Sen values −1, −1, −2, −2 as in §7.8, nilpotent parts `[[0,1],[0,0]]` and `−[[0,0],[1,0]]`), labelled a local control, and states that an extension of two planes potentially unramified after the twists is de Rham with semisimple Sen operator (BCGP25 lines 5068–5079).

## H13 (CBirkbeck) — applied differently

F12. The first §4.7 Check already computes the polarization (factor p against `p³`, degrees `p⁴` and `p¹²`) and is kept. The other two (lines 734–735) are replaced: the degrees 27 and 9 of `F_w` at `F = ℚ`, `p = 3` (absolute Frobenius followed by the marking automorphism), tied to §4.9 by `deg F_w² = 81 = p⁴` against `27² = 729`; and the tame marking `2πη` against `πη` (`3^{−1} ≡ 2 mod 5`). "A map of degree 27 on the divisor fails" was not used as a Check because it names no computation that excludes it.

## H14 (CBirkbeck) — applied

F13. The two §2.3 Checks restating `V_k = {N ≥ k}` are replaced (lines 426–427) by the counts at `p = 3`: at a supersingular point `N = 3` at `β = 3/4` (4 if H were counted) and `N = 0` at `β = 1/2` (3 under the reversed inequality); at the split ordinary point with `H = ℤ/3`, `N = 1` at `β = 1/2`. Badness `deg L ≥ 1 − β` is BPS Remark 4.3.4 (BPS line 900).

## H15 (CBirkbeck) — applied

F14. `PELModuli §M0.21` is already in the contract at `f252b89` (line 130). Added the ShimuraCompactifications row §6.12 (the Tate curve, line 165). Of the fifteen rows no target cited, seven are now in the *Needs* of the target that uses them (PELModuli §M2.8, §M2.9 in §1.1; §M4.6 in §2.9; §M5.1 in §3.1; HodgeTateAndCanonicalSubgroups §0.15 in §3.3; PadicFamilies §2a.15, §2a.16 in §5.9, with the layer Dependencies) and eight are deleted (PELModuli §M0.27; AdicSpacesPartIII §R3.6, also from the Scope list, line 15; ShimuraCompactifications §7.26; AutomorphicBundles §3.3, §12.15; AutomorphicFormsOnReductiveGroups §6.4; HigherHidaAndColemanTheory §1.2; IntegralHeckeAndGaloisDeterminants §2.3). A mechanical comparison of contract rows with *Needs* and Dependencies lines now leaves only rows consumed through a named gap contract or the Conventions.

## H16 (CBirkbeck) — applied differently

F15. The LieHighestWeight subsection and its four citations are removed; `UniversalEnvelopingAlgebra` (Mathlib/Algebra/Lie/UniversalEnveloping.lean:65) is added to the Mathlib contract (line 104) and cited in §§7.1, 7.1a, 7.2 and the Layer 7 Dependencies, `TauCeti.VermaModule` staying where it was. `TauCeti.irreducibleQuotient` is not added: no target uses `L(λ)` of a semisimple algebra (the simple modules used are those of the reductive Levi algebras `𝔪_w`, from LocallyAnalyticRepresentationsOfLocalGroups §4.2), so it would be an unconsumed contract row of the kind H15 removes.

## H17 (CBirkbeck) — applied

F16, first symbol. The Igusa torus of §4.2 is renamed `𝒯_I = 𝒯_fin × 𝒯₀`, `Λ_I = ℤ_p[[𝒯₀]]` (line 636), and §5.4 reads `ℤ_p[[𝒯_I]]` (line 895); `T_I` now denotes only the Hecke operator of §4.5.

## H18 (CBirkbeck) — applied differently

F16, second symbol. At `f252b89` the contract of AlgebraicModularFormsAndSerreWeightsPartII §7.5 already writes the generic-fibre formula as `p^{3−r}(T_{p,1} + (1+p+p²+p³)T_{p,0})` and names `C_r`, so the quoted clash is gone. The remaining clash in Layer 3, `T₁`, `T₂` as the factors of §3.1 and as spin-polynomial variables in the §3.4 Check, is repaired: line 586 now reads `(q, T_{ℓ,0}, T_{ℓ,1}, T_{ℓ,2}) = (1, 1, 4, 4)`.

## H19 (CBirkbeck) — disputed

F17, first Check (wall crossings). The text at `f252b89` (line 479) no longer says "`max_i d_i a_i` wall crossings": it says the continuation at place i passes in one step from `]d_i a_i − 1, d_i a_i]` to `[0, d_i a_i]`, h steps in all. That is BPS §4.5 (BPS lines 1123–1131: the extension goes from `]d_i a_i − 1, d_i a_i]` to `[0, d_i a_i]` at once). The proposed "`d_i a_i` wall crossings at each place" would contradict it, so it was not applied.

## H20 (CBirkbeck) — applied

F17, second Check. Line 919: "`ℤ₃^× ∩ (1 + 3^{u_v}O_{ℂ_p}) = 1 + 9ℤ₃`" → "is contained in `1 + 9ℤ₃` (it is `1 + 27ℤ₃` at `u_v = 3`)"; the conclusion of the Check is unchanged.

## Build and gate

- `lake build TauCetiRoadmap.PadicFamiliesPartII.Suggested`: `Build completed successfully (18239 jobs).` `Suggested.lean` is unchanged; it declares nothing (its docstring explains why no headline is statable), so there was no declaration to `#check` and no elaborated signature to compare.
- Gate: `gate PadicFamiliesPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Dependency check (`--movable --pr 2280`): `depcheck: 244 roadmaps, 2232 edges, 0 problem(s)` — no UPWARD, CYCLE or moved line.
- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere.
- Commit: `c64e8814 PadicFamiliesPartII: review repairs (mixed-level doubling carrier, C^la sheaves, commutations, duality twist, definite PEL data)`. Not pushed.

## Ownership, sources, untrusted text

- §7.1c is owned here: the object search of H02 found no owner on main or in the 475 open pull requests indexed; no declaration was added to `Suggested.lean`. No supplier was added; LieHighestWeight is no longer cited. The contract gap:solid-vb-sen was narrowed so that it names only objects its supplier can state.
- All new locators are in BPS, BCGP21 and BCGP25, already in the cache; no text was missing and `needs-references.toml` was not written.
- The review contains no instruction to run commands, touch other files or use credentials.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §4.7 carrier note: fibre of `X₁^I → X_{G₁,1}^I` | `F = ℚ`, `p = 3`, ordinary point; p-rank-one point | lines in `μ₃²`: 4 = p + 1; in `G[3]^m` of order 3: 1 | holds | none |
| §4.10 `Z U_Iw = U_Iw Z = U_{w,2}` | split ordinary point, `N = μ_p·line × (ℤ/p ⊕ ℤ/p²)`; alternatives `N^m ≅ μ_{p²}`, `N^m = 0` | `|N| = p⁴`, `|N[p]| = p³`; filtration `N^m + pN` of order `p²`, quotient `(ℤ/p)²` étale; `N[p]^et` of order `p²`, quotient `μ_p × ℤ/p`; alternatives give `|N[p]| = p²` (excluded) | unique filtration of each shape | stated with route |
| §4.10 quadratics | `α = 2`, `β = 3`; non-commuting `diag(1,2)`, `[[1,1],[0,1]]` | `4 − 10 + 6 = 0`; `U_Iw^{−1}U` and `U U_Iw^{−1}` have (1,2) entries 1 and 1/2 | orders agree only with commutation | Check added; `α ≠ 0` added to the eigenvector Check |
| §6.4 (a)–(c) | `T = 5`, `U = 6`; `𝔽̄₃`, `α = 1`, `β = 2`, `C(x,y) = (2y, −x)` | `C(f, −f/2) = (2f, −f)`; `Δ = f − 3U_Iw^{−1}f`, `(U_Iw − 2)Δ = U_Iw f − U_Kli f + Zf = 0`; graphs `(f, −f)`, `(f, f)` are the 1- and 2-eigenlines mod 3 | holds; `M = 0` excluded (E not local) | restated |
| §5.6 slope blocks | `A = O_{ℂ_p}`, block `ℂ_p[0]`, `U = 1` | rank 1 over `ℂ_p`; `p^{−n}` unbounded over `O_{ℂ_p}` | old claim false, new holds | fixed, Check added |
| Layer 2 J convention | CM `(0,1)`; Siegel threefold `d = 1, a = 2`; unitary `(1,1)`; type A with `(1,1)` and `(2,0)` | `J = ∅`, `n = 0`, `δ ∈ [0,0]`; `J = {1}`, `n = 3`, `c = k₂`; `n = 1`; `J = {1}`, `δ₂ ≡ 2d₂`, dimension `d₁ > 0` | holds; old `c_i` undefined at definite places | fixed, Check added |
| §2.8 cusps | `Γ₀(3)` | degrees 1 and 0; `dz/z ↦ 3dz/z`, `dz/z` | old clause false | fixed, Check added |
| §9.5 τ-twist | `z = 4·1`, `p = 3`; `τ²` | `4 ≠ 1/4` (`16 ≠ 1`); `[16·1] − 1 ≠ 0` in the domain `O[[𝒯₀]]`; `w₀((w₀(t^{−1}))^{−1}) = t`; `P(tx, y) = [t]P = P(x, w₀(t^{−1})y)` | inherited bilinearity forces `P = 0`; twisted form consistent | fixed, Check added |
| §9.7 `M^{|·|²}` | `z₃ = 4` (`p = 3`), `z₂ = 3` (`p = 2`), `−1` | `1/16`, `1/9`, `1`; `1/16 − 1 = −15/16`, `v₃ = 1` | literal norm reading gives 0 on torsion-free M | fixed, Check added |
| §1.3 route | modular curve, `p = 3`, degree `1/4`; Siegel `A[p]` | equality needs `deg L = 3/4`, all L have `1/4`; `deg E[p] = 1`, `deg A[p] = 2` (dimensions) | holds | reworded |
| §1.4 route | `n = 0`, `ν = 1/2`, `η = 1/4`; `η = ν` | band `[1/2, 3/4]` has no integer; `η = ν` gives `N = 0` or any N | holds | reworded |
| §8.6 control | `w = 0`, `λ = (1,1;0)` | §7.8 values −1, −1, −2, −2; Sen blocks `−I + N`, `−2I − Nᵀ`, `N² = 0 ≠ N` | old example impossible, new one valid | fixed |
| §4.7 Checks | `F = ℚ`, `p = 3`; level 5 | degrees 27, 9; `81 = 3⁴` vs `729`; `3·2 ≡ 1 mod 5` | holds | replaced |
| §2.3 Checks | supersingular, ordinary split, `p = 3` | `N = 3, 0` at `β = 3/4, 1/2`; `N = 1` at `β = 1/2` | discriminate H-counting and inequality direction | replaced |
| §7.1c | G trivial; `G = P = 𝔾_m` | `C^la = E`; germs at 1 infinite-dimensional; `X∗₁t = −t`, `X∗₂t = t`, `∗₂(ιX)t = −t`, `Θ(X)t = 0 − t = −t`, `HC = id` | holds; ι dropped or `∗₁` for `∗₂` gives `+t` | new target |
| §5.4 Check | `u_v = 3/2`, `3` | `1 + 9ℤ₃`, `1 + 27ℤ₃ ⊂ 1 + 9ℤ₃`; χ of order 3 trivial on `1 + 9ℤ₃` (`(ℤ/9)^×` cyclic of order 6) | holds | fixed |
| §4.2 rename | `|I| = 1`, two places | rank of `𝒯₀` = `1 + 2 = 3`, as the §4.2 Check | holds | renamed |
| F14 additions | supplier headings | PELModuli M2.8 representability, M2.9 universal family, M4.6 normality of normalized models, M5.1 Siegel PEL data; HodgeTate §0.15 Ha invertible exactly on the ordinary locus; PadicFamilies 2a.15–2a.16 spectral hypersurface and variety | each used by the target it is added to | *Needs* added |
