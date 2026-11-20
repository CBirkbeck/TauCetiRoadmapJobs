# Review of ModularCurves (pull request #2627 at 271d965)

**Verdict:** accepted

**Summary.** Accepted: the whole README and `Suggested.lean` were read again at this head and no stated result, Check or example was found false, missing a hypothesis or unsupported; every Check with a number in it was recomputed. There are two small corrections (an ambiguous sentence in §0.9 about which map must be a henselisation, and a *Needs:* line in §2.2 that reads as if JacobianChallenge supplied the norm of invertible sheaves) and one format note, none blocking. The human reviewers have the same three points as before: Katz–Mazur cannot be read legally, the Provenance section names Apache-2.0 repositories, and the sources manifest omits most cited works.

## C01 — In §0.9 the prose statement of `IsHenselization.bijective_of_comp_eq` does not say that `ψ : A → L` is a henselisation, which the Lean statement assumes and the conclusion needs

A reader who takes the sentence with the hypotheses of the sentences before it (where `A` is only ind-étale and `ψ` arbitrary, "so the statement applies to the stages `A_i`") gets a false statement. The sentence is "if moreover `χ : B → L` is a henselisation at the same point, every such `f` is bijective" (README, line 1011). For `A = R` local and not henselian, `ψ` the residue map and `B = R^h`, the unique compatible map `R → R^h` is not surjective. The Lean declaration carries both `[IsHenselization ψ]` and `[IsHenselization χ]` (`Suggested.lean`, line 551), and its docstring says "If `ψ : A → L` and `χ : B → L` are henselizations of `R` at the same point".

The smallest change: "if `ψ : A → L` and `χ : B → L` are both henselisations at the same point, every such `f` is bijective".

## C02 — The *Needs:* line of §2.2 names JacobianChallenge Layer A "for the norm of invertible sheaves", and JacobianChallenge states no such norm

An implementer who follows the line looks for the norm functor in the supplier and finds nothing. The line (README, line 1552) reads "JacobianChallenge Layer A for the norm of invertible sheaves and §§C.1–C.2 for the fibrewise genus". JacobianChallenge's README on main contains no norm of invertible sheaves (Layer A, lines 366–492, is line bundles, divisors, the Picard group and degree; the word occurs only in a journal title, line 1494), and its open revision has none either. Item 1 of §2.2 already says "Construct the norm functor on invertible sheaves for finite locally free morphisms", and the supplier contract for Layer A lists only invertible sheaves, the divisor–line-bundle correspondence and base change for `𝒪(D)`, so the ownership is this roadmap's and only the *Needs:* wording is off.

The smallest change: "JacobianChallenge Layer A (invertible sheaves, on which the norm functor of item 1 is built)".

## N01 — Two internal pointers lag behind the section numbering

The Dependencies paragraph of Layer 8 (line 3930) lists "Layers 0, 3, 4, 6 and 7" and then cites §§2.1–2.2 and 2.4, while the layer table gives Layer 8 the layers 0, 2, 3, 4, 7 (and 6); add Layer 2 to the sentence. The Tau Ceti contract for `WeierstrassCurve.autGroup` (line 5336) says "Layer 10, item 3", which is now §10.3.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| §0.4 (sample): fibre count = rank; split étale-locally (Stacks 04HN; EGM (3.26)) | `ℤ[i]/ℤ`; 04HN line 925; EGM line 2205 | odd `p`: 2 geometric points = rank 2; `p = 2`: 1 point ≠ 2, not étale; 04HN and (3.26) state what is cited | true | none |
| §1.2 (sample): points dictionary, singular Check | `y² = x³` over `𝔽₅` | cubing bijective on `𝔽₅`: 5 affine + ∞ = 6 projective points; `toAffine.Point` = 4 nonsingular + 0 = 5 | true | none |
| §1.4 (sample): group law, step 6 Check; EGM (1.14), (1.15), Stacks 0BFD | `y² + y = x³ − x`, `(0,0) + (1,0)` | chord `y = 0` meets at `x = 0, 1, −1`; `−(−1,0) = (−1, −0 − 1) = (−1,−1)`; locators at EGM lines 720, 743, 0BFD line 817 | true | none |
| §2.1 (sample): `[N]` rank `N²`, étale locus; Stacks 0BFG, EGM (5.9), Česnavičius 2.2.9 | `y² + y = x³` over `𝔽₂`; pin `etale_torsion_hom_iff` | `∂/∂y = 1`: `E[2](𝔽̄₂) = 0`, rank 4; `(0,0)` flex, order 3; pin: étale iff `n ≠ 0` in every residue field | true | none |
| §2.2 (sample): quotient `E/C`; Česnavičius 2.2.4, 2.2.7; EGM (4.39) | `C = E[N]`, `C = 0`, `⟨(0,0)⟩` on `y² + y = x³` | `q = [N]`, kernel `E[N]`; `q = 1`; `Δ = −27`, elliptic for char `≠ 3`, degree `3 = rank C`; locators at Ces15 lines 430, 519 | true | C02 (wording of *Needs:*) |
| §2.3 (sample): factorisation dual; EGM (5.12) | `φ = [m]`; Frobenius | `[m]∘[m] = [m²]`, so `[m]^ = [m]`, degrees `m²·m² = deg[m²]`; `V∘F = [p]`; EGM line 3681 | true | none |
| §2.4 (sample): Poincaré normalisation, sign of `λ_E` | restriction along `i₁`; `t_{−P}` | `i₁^*L = i₁^*L₀ ⊗ (i₁^*L₀)⁻¹ ⊗ π^*(c^*L₀)⁻¹ ⊗ π^*(c^*L₀)`, trivial; `t_{−P}⁻¹(0) = P`, so `𝒪([P] − [0])` | true | none |
| §2.5 (sample): Weil pairing; Oda 1.1, 1.3; EGM (11.11)–(11.22) | `(ℤ/2)²`, `(−1)^{ac+bd}`; `e_{NM}` on `E[N]` | pairing skew-symmetric, value `−1` on `((1,0),(1,0))`; `e_{NM}(x,y) = e_N(Mx,y) = e_N(x,y)^M`; Oda lines 185, 269 | true | none |
| §4.4 (sample): ranks of `[Γ(N)]`, `[Γ₁(N)]`; Česnavičius 4.3.2, Conrad 3.2.2 | `N = 4`; `N = 1` | `|GL₂(ℤ/4)| = 96`; `16·3/4 = 12`; balanced `24`; `Γ₀`: `6`; Ces15 line 1661 gives degree `#GL₂(ℤ/n)` | true | none |
| §5.1 (sample): Tate normal form, `Y₁(4)`, `Y₁(5)`; Loeffler 3.8.2 | `Δ` from `b₂ = a²+4b, b₄ = ab, b₆ = b², b₈ = b³` | `Δ = b³(a³−a⁴−8a²b+36ab−27b−16b²)`; `a=b=1`: `−15`; `a=1`: `b⁴(1−16b)`; `b=a−1`: `(1−a)⁵(a²+9a−11)` | true | none |
| §6.4 (sample): kernel base change; coarse base change; Česnavičius 6.4, 6.6 | `×2 : ℤ → ℤ`, `R = 𝔽₂`; `t ↦ (1+ε)t` in char 2 | kernel `𝔽₂` vs image `0`, cokernel `ℤ/2`; invariants `k[ε][t²] ⊕ εt·k[t²]`, `ε·εt = 0`, not flat; Ces15 lines 2726–2770 | true | none |
| §7.1 (sample): PD-1 to PD-3; EGM (10.10)–(10.21), (5.18)–(5.19) | `y² + xy = x³ + 1/𝔽₂`; `y² + xy = x³ + t/𝔽₂(t)` | `(0,1)` of order 2, ordinary, `j = 1`; point `(0,√t)` inseparable, `E[2]` has 2 points | true | none |
| §8.5 (sample): KM 7.5.2 invariant lemma | `y ↦ −y`; `(x,y) ↦ (−x,−y)`; `y ↦ y+x` (char 2); `t ↦ t+y` over `𝔽_p(t)` | `k[[x,y²]]`, 2 generators; fibre `k[x,y]/(x²,xy,y²)` of length `3 > 2`; `N(y) = y²+xy`; `t^p − ty^{p−1}` invariant, `N(y) = y^p` not a parameter | true | none |
| §10.2 (sample): cusp ranks | `N = 5`, `H = 1` and `H = Δ` | `deg j = 24/2 = 12 = 2·1 + 2·5`, reduced rank 4; `X₀(5)`: `6 = 1 + 5`; general: `m_H(1+N) = (N²−1)/(2|H|)` | true | none |
| §10.4 (sample): Shimura covering; Mazur II Cor. 2.3; Stacks 00R4 | `N = 11, 13, 37`; Mazur line 1579; 00R4 line 14937 | `n = 5, 1, 3`; `|H| = 1, 6, 6`; `|H|·n = (N−1)/2`; Mazur: cyclic of order `n`, étale over `ℤ[1/N]` | true | none |
| Headline 1: `firstMainTheorem_gamma`, `firstMainTheorem_gammaOne`, `exists_relRepData_gammaZero` | `N = 1, 4, 6, p`; empty base | rank clause: `n = 1`; `2n = 12`; `6n = 72`; `pn = p(p+1)`; over `∅` the rank identity is vacuous | matches §§8.8, 9.4 | none |
| Headline 2: `exists_representableBy_of_isRigid`, `exists_representableBy_gammaNaive`, `smoothOfRelativeDimension_one_yOne_structureMap` | `[Γ(1)]`; `B = Spec 𝔽_p`, `p ∣ N`; `N = 3` | `[−1]` nontrivial, not rigid, not representable; both sides empty; `Spec ℤ[1/3,ζ₃][μ,1/(μ³−1)]`, `Δ = 27(μ³−1)³`, `c₄ = 9μ(μ³+8)` | true | none |
| Headline 3: `exists_coarseModuliData_gamma_one(_of_ring)` | `y² = x³+x`; `λ = −1`; `μ = 0`; `p = 2` fibre of level 3; `R = 0` | `j = (−48)³/(−64) = 1728`; `u = 27/4`, `2⁸u = 1728`; `j = 0`; `u(μ/(μ+1)) = u` since `μ³+(μ+1)³ = μ²+μ+1`; empty | true | none |
| Headline 4 (Layer 10): not statable | docstring; pin | docstring names the missing diamond action on `Y₁(N)`; the projective line is at the pin | consistent | none |
| `smoothOfRelativeDimension_one_of_isCategoricalQuotient` | `x ↦ −x` on `ℤ_(2)[x]`; `R[x,y]/(xy−π)`; `H = 1` | invariants `ℤ_(2)[x²]`, smooth; regular flat with singular fibre (not a counterexample: no group); `Q ≅ Y` | true | none |
| `axiomaticRegularity`, `RegularityAxioms` | `[Γ(1)]`; empty problem; `E[p](S)` | `W(k)[[T]]` regular of dimension 2, rank 1; fails Reg. 4A, rank 0; `[p](X) = X·g`, `g(0) = p`, in `𝔪²`, fails Reg. 4B | true | none |
| `regular_quotient_gamma_primePow` | `n = 0`; `p = 2, n = 1`; full semi-Borel | `GL₂(ℤ/1)` trivial, `H = 1`; semi-Borel of order 2, rank `6/2 = 3`; `|H| = pⁿφ(pⁿ)` = ratio of the two ranks | true | none |
| §0.9 `IsHenselization.existsUnique_comp_eq` and `bijective_of_comp_eq` | `A = R`; `B = ℤ_p`; `R^{sh} → Ω → Ω(x)` | étale `A`: maps to henselian `B` ↔ points of the closed fibre, unique; `R → R^h` not bijective for `A = R` | Lean true; prose ambiguous | C01 |
| §7.3 PD-6: Hasse polynomials | `p = 3, 5, 7`; `p = 2` | `1+t`; `t²−t+1` (roots in `𝔽₂₅`, `j = 0`); `(t+1)(t²+t+1)`, `j = 1728 = 6`; `H_p(1) = C(p−1,m) ≡ (−1)^m` | true | none |
| §0.7 Plücker Check | `((1,0,a,b),(0,1,c,d))` | minors `(1, c, d, −a, −b, ad−bc)`; relation `ad−bc+bc−ad = 0`; unsigned: `2(ad−bc)` | true | none |
| §3.5 Legendre Check and §6.5 item 3 | `y² = x(x−1)(x−2)`; `d = λ(λ−1)` | differences `±1, ±2, ±1`, two squares, 4 of 12 rational; `d(ud−d²−3d−3) = (d+1)³−d³−3d²−3d = 1` | true | none |
| §9.3 items 8–9 | `e_{φ(pⁿ)}` of the `[a](P)` | prime-to-`p` product is `unit·P^φ`; every other product has a factor in `𝔪`; sum `= unit·P^φ` | true | none |
| §10.3 ramification, Riemann–Hurwitz in `χ` form | `N = 7, 11, 13`; `A₄`, `S₃` | `7 ≡ 1 (3)` only; neither; both; `N = 11`: `deg 𝔡 = −2·0 + 10·0 = 0`; `N_{A₄}(C₃) = C₃`, `N_{A₄}(C₂) = V₄` | true | none |

- Source locators checked against the text: 68. Česnavičius (arXiv v2) 2.2.4, 2.2.7, 2.2.9, 3.3.2, 4.1.3, 4.2.3, 4.2.15(b), 4.3.2, 6.2, 6.3, 6.4(a)(b), 6.6, 6.7; Mazur II Cor. 2.3 (p. 67); Stacks 04HN, 0BFD, 0BFG, 00R4; Oda 1.1, 1.3; EGM, 37 paragraph numbers cited in §§0.2–0.4, 1.4, 2.1–2.6, 7.1 and 7.3; Conrad 2.2.5, 2.3.1, 3.1.2, 3.1.8, 3.2.2, 3.2.7, 4.2.1; Loeffler 3.3.2, 3.8.1–3.8.3.
- Library declarations opened at the pin (Tau Ceti): `LinearAlgebra/TensorProduct/Kernel.lean` 77; `RingTheory/FormalGroup/CharP.lean` 48; `FieldTheory/FunctionField/Different/Hurwitz.lean` 72; `EllipticCurve/TateCurve/Basic.lean` 232; `Geom/Torsion/Etale/Locus.lean` 123; `Geom/Frobenius.lean` 45; `EllipticCurve/Supersingular.lean` 200; `EllipticCurve/Legendre.lean` 497; `StrictHenselization/Etale.lean` 138; module docstrings of `Normalization/Finite.lean`, `Smooth/Irreducible.lean`, `Smooth/PureRelativeDimension.lean`, `EllipticCurve/Aut.lean`.
- Cross-roadmap citations resolved on main: JacobianChallenge Layer A, §B.4, §§C.1–C.2 (lines 366, 636, 677, 714); AlgebraicCurves §§7.1–7.4, 8.6–8.7, Layers 9 and 12; AlgebraicModuliForArithmeticGeometry §1.3; ModularCurvesPartII §§4.9, 6.4, 6.5; ComplexComparisonPartII C4.5; EtaleCohomologyFoundations §F.3a; LefschetzPencilsAndVanishingCycles LPV.0.
- Automatic checks: every check passed, none set aside. Dependency check output: `depcheck: 200 roadmaps, 2217 edges, 0 problem(s)`.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with 32 `declaration uses sorry` warnings and nothing else. Each elaborated signature was compared with its README statement; nothing lost a binder.
- One-tactic probe on a copy (`rfl`, `infer_instance`, `simp`, `decide`, `trivial` in place of each `sorry`): all 32 fail, so no declaration is padding by that test.
- Description against the head: 65 *Needs:* lines (63 at line start, 2 inline in §§7.1 and 7.3), 132 Check bullets in 48 lists, 62 numbered sections, one Lean declaration removed and the rank clause restated, as the description says. No change outside the folder.
- Previous review: it had no findings, corrections or notes, and the head is unchanged since.

Overlap check: read SchemeAndStackFoundations (main and its two open revisions), JacobianChallenge (main and open revision), GroupSchemesOverABase (main and open revision) and PurityForFlatCohomology (open). Shared objects and owners: finite locally free group schemes, Cartier duality, affine invariant quotients, descent, the subgroup Grassmannian and strict henselisation are ModularCurves' (each of the others cites Layers 0B–0G, 4D or 0.2, 0.5, 0.9 as owner); line bundles and curve cohomology are JacobianChallenge's; the coherent Grassmannian is AlgebraicModuliForArithmeticGeometry §1.3's. No object has two owners, no open pull request changes this roadmap or drops an id it cites.

Source independence: 14 passages compared with 7 sources (Česnavičius, Mazur, EGM, Conrad, Loeffler, Stacks, Oda), none shared beyond statements of a dozen words that the mathematics forces (longest shared run 4 words, Ces15 line 2777); largest share KM, about 190 of about 430 locators; contents compared with KM through the chapter numbers of the README's locators (KM's text could not be read): the layers draw on KM chapters in the order 1 | 2 | 2 | 4, 2 | 1, 3 | 2, 3, 4 | 7, 8 | 5 | 5, 6, 7 | 6, 7 | 8, 10, with Layers 5 and 7 having no KM chapter: independent.

Research link: Layers 3–9 are Katz–Mazur's (1985) First Main Theorem and regularity theorems, which Conrad (2007) and Česnavičius (arXiv 2015) extend to compactified stacks over `ℤ`; Layer 10 is the curve geometry of Mazur (1977), II §§1–2. Rests on the README and on Česnavičius, Conrad and Mazur as read.

## Not verifiable

- Katz–Mazur (1985): no legal copy. None of its locators was checked, including those of the sampled §§2.1, 2.4, 4.4, 6.4, 8.5 and 10.2, the hypotheses of the theorem on p. 508 used in §6.4, and the erratum the README records for KM 4.6.2 (the mathematics of that erratum was recomputed and holds for the definition the README gives).
- Deligne–Rapoport (sample 5.1: IV 3.4, IV 6.7; §6.4: VI 6.7): publisher copy only; Česnavičius cites VI 6.7 for the same statement (Ces15 line 2724).
- Katz, *Serre–Tate local moduli*, Theorem 1.2.1 (Layer 7): publisher copy only.
- Silverman (AEC), Igusa, Lazard, SGA 1 and SGA 3, Rydh, Scholze, Kottwitz–Wake: not opened this round.

## Source issues

- none

## For the human reviewers

- Not tested: KM, the source with the largest share of locators (about 190 of 430), has no legal copy; wording was not compared with its text, and arrangement was compared only through the chapter numbers of the locators.
- Licence: the Provenance section (`TauCetiRoadmap/ModularCurves/README.md`, lines 4674–4703) names the AINTLIB repository and two other Apache-2.0 Lean repositories as proof-architecture material; `Suggested.lean` was not compared with them.
- The package's sources manifest records 8 works; KM, Česnavičius, Deligne–Rapoport, Mazur, EGM, Katz, Oda and SGA 3 are cited throughout but not recorded. Česnavičius, Mazur, Oda and EGM were read from arXiv, Numdam and an author's page.
