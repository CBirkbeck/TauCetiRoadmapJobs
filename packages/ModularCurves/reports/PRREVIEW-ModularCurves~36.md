# Review of ModularCurves (pull request #2627 at 7ee0648)

**Verdict:** needs changes

**Summary.** One finding. The ownership sentence of §3.3 says that rigidity of the naive quotient problems `[Γ_H]` is deduced, through `IsRigid.of_hom`, from morphisms to the naive full-level problem. A quotient receives such a morphism; it does not map to the full-level problem. The claim is also false for most `H`: for `H = GL₂(ℤ/Nℤ)` the quotient is `[Γ(1)]`, which is not rigid. Everything else holds up: all four headline theorems, every Check I recomputed, all fifteen sampled sections against the readable sources, and the elaboration and one-tactic probe of `Suggested.lean`. There are three small corrections and one format note, none blocking. The human reviewers have three points to look at: KM, the main source, cannot be read legally; the Provenance section names Apache-2.0 repositories; and the sources manifest omits most of the cited works.

## R01 (P2) — §3.3 deduces the rigidity of the naive quotient problems `[Γ_H]` from morphisms to the full-level problem, but a quotient receives the morphism, and most quotients are not rigid

An implementer of §3.3 would set out to prove rigidity for `[Γ(N)]/H` by a deduction that cannot be made, and the sentence promises rigidity for problems that are not rigid. The ownership paragraph (README lines 1968–1973) reads: "for the naive `[Γ_H]` problems (Layers 6.1–6.2), deduced from these through the morphisms of moduli problems to the naive full-level problem (`IsRigid.of_hom`: a problem mapping to a rigid problem is rigid)". The pinned `ModuliProblem.IsRigid.of_hom` takes `φ : P ⟶ Q` and `Q.IsRigid` to `P.IsRigid`, so it needs a morphism out of the problem whose rigidity is wanted. The quotient data of §6.1 go the other way, `KatzMazurQuotientData.q : P ⟶ P'` from `[Γ(N)]` to `[Γ(N)]/H`. Two quotients show the claim fails. For `H = GL₂(ℤ/Nℤ)` the quotient is `[Γ(1)]` (§6.2, item 1 with `d = 1`), which the Check of §3.1 shows is not rigid. For the Borel it is the naive `[Γ₀(N)]`, and `[−1]` fixes every cyclic subgroup. §6.2 itself plans a different statement: "the naive quotient-rigidity criterion, and the semi-Borel rigid case for `N≥4` using KM 2.7.4".

The smallest change keeps the `IsRigid.of_hom` deduction for the fixed-pairing frames of `Y(ρ)` and replaces the quotient clause, for example: "Rigidity of a naive quotient `[Γ(N)]/H` is not deduced here: the quotient receives a morphism from `[Γ(N)]`, and it is rigid only for suitable `H` (for `H = GL₂(ℤ/Nℤ)` it is `[Γ(1)]`); the criterion is §6.2's."

## C01 — Sixteen layer and section openings now say that the text "follows" KM, Katz or Mazur, although the arrangement is the roadmap's own

This revision replaces main's "References: KM 1.1.1, 1.2.2, 1.2.3." by "This section follows KM 1.1.1, 1.2.2 and 1.2.3." (line 258). Fifteen similar sentences follow, at lines 351, 774, 1143, 1218, 1422, 1850, 2204, 2462, 2753, 3230, 3544, 3937, 4175, 4407 and 4476, and the Summary says "following Katz and Mazur" (line 4). A reader takes these sentences to mean that the plan reproduces KM's order, and it does not: Layer 3 (KM Ch. 4) comes before Layer 4 (KM Ch. 3), and KM Ch. 7 is spread over Layers 6, 8 and 9. The project's planning principles also ask that a roadmap not say it follows a source. Main's wording ("References: KM …", or "The results of this section are KM …") would fix this, together with "the moduli theory of Katz and Mazur" in the Summary.

## C02 — `exists_relRepData_gammaZero` states a constant positive rank but not the value `N ∏_{p ∣ N}(1 + 1/p)` that the Summary gives as part of the first headline

The Summary states the rank (README lines 19–20). `Suggested.lean` line 1139 asks only for `∃ n : ℕ, 0 < n ∧ …` and names the value in its docstring. The value can be stated at the pin, for example by adding the clause `n * ∏ p ∈ N.primeFactors, p = N * ∏ p ∈ N.primeFactors, (p + 1)`. The acceptance test would then check the formula (`6` at `N = 4`, `p + 1` at `N = p`). Alternatively, the docstring could say that the value is a README target only (§9.4, item 7).

## C03 — The description miscounts the *Needs:* lines

The description says that each section ends with a *Needs:* line, "(56 in all, replacing the old per-section and per-layer dependency paragraphs)". At this head every one of the 62 sections has one, and there are 65 in those sections (§§0.9, 7.1 and 7.3 have two each). The correct text would be "(65 in all, at least one in each of the 62 sections, …)".

## N01 — §2.4, item 2 (line 1629) cites "(Jacobian Challenge proper-flat cohomology contract)"; the section's *Needs:* line names it as JacobianChallenge §§C.1–C.2, which would be clearer here too.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| §0.5 descent (sample) | Stacks 0245, 0CCJ at their statements | 0245: fpqc covering, each `V_i → X_i` affine ⇒ effective = README's affine case; 0CCJ: finite locally free cover, ample sheaf ⇒ effective | true | none |
| §0.7 Grassmannian, Plücker (sample) | `E = 𝒪⁴`, `N = 2`, chart `((1,0,a,b),(0,1,c,d))`; `N > n`; Stacks 01W8 | minors `(1:c:d:−a:−b:ad−bc)`, Plücker relation `0`; unsigned minors give `2(ad−bc)`; `Grass_N = ∅`; 01W8 matches README's "projective" | true | none |
| §1.1 projective models (sample) | pinned signatures | `isIntegral_projModel` needs `[IsDomain R]` only; `smoothOfRelativeDimension_one_projModelOver` needs `[W.IsElliptic]`; `nonempty_pointedWeierstrassAtlas_iff` exists (`Geom/Basic.lean`) | as stated | none |
| §3.3 naive rigidity (sample) | `Γ(2)`; `Y²+Y=X³` with `(X,Y)↦(ζX,Y)`; pinned `eq_id_of_isPullback`; `H = GL₂`, Borel | `[−1]` fixes `Γ(2)`; `(0,0)` of order 3 fixed; pin needs `a²≠1, b≠1, b≠a^{±1}`; `[Γ(N)]/GL₂ = [Γ(1)]` not rigid | quotient clause false | R01 |
| §3.4 Weierstrass presentation (sample) | `y² = x³ + x` over `ℚ(i)`; `j ≠ 0, 1728`; Loeffler 3.3.2 | `y′² = x′³ + u⁻⁴x′` forces `u⁴ = 1`, order 4; `{±1}`; Loeffler: a local basis of `ω` determines the equation | true | none |
| §3.6 regularity (sample) | `[Γ(1)]` with level-3 and Legendre rigidifiers; empty rigidifier; pinned definition | both schemes open in `𝔸¹` over a Dedekind ring: regular, dim 2; empty excluded by `Surjective` (`Regular.lean` 118–121) | true | none |
| §5.1 Tate normal form (sample) | `a=b=1`; `a=1`; `b=a−1`, `a=2`; Loeffler Def. 3.3.3 | b-invariants give `Δ(1,1) = −15`, `Δ(2,1) = −11` = README formula; Loeffler's gives `+15`; `5P = 0` on `b = a−1` | true | none (source issue) |
| §5.3 `Y(ρ)` (sample) | `N=3`, `ρ = E₀[3]`; `Y_full(3)(ℚ)`; `N=2`; Conrad 4.2.1(1) | identity frame is rational; `Y_full(3)` needs `ζ₃ ∈ ℚ`, no point; `[−1]` trivial on `E[2]`; Conrad: connected fibres over `ℤ[ζ_N]` | true | none |
| §6.4 quotient smoothness (sample) | `ℤ_(2)[x]`, `x↦−x`; `k[ε][t]`, `t↦(1+ε)t`, char 2; `×2` on `ℤ`, `⊗𝔽₂`; Česnavičius 6.4, 6.6 | `ℤ_(2)[x²]` smooth; `εt ∈ ann(ε) ∖ εM`, not flat; kernel `𝔽₂` against image `0`; 6.4(b) over `ℤ[1/gcd(6,n)]` | true | none |
| §7.5 Serre–Tate (sample) | `R = k`; `R = k[ε]`, `E₀` supersingular | one object each side; tangent spaces both one-dimensional (`T↦cε`; height-2 one-dimensional formal group) | consistent | none |
| §8.1 axioms (sample) | `[Γ(1)]`; empty problem; `𝒫 = E[p]` | `W(k)[[T]]`, rank 1; 4A fails, rank 0; `[p](X) = X·g`, `g(0) = p`, in `𝔪²`: rank `p²`, not regular | true | none |
| §8.7 rigidity engine (sample) | `C(pⁿ, pⁿ⁻¹)`; `n = 0`; pinned `natCast_eq_zero_of_pow_mem_span` | `v_p = 1` (one carry); `n = 0` vacuous; pin: `p` prime, `n ≠ 0`, same ideal | true | none |
| §8.9 regular quotients (sample) | `p=2, n=1`; full semi-Borel; `y↦y+x`, char 2; `k = 𝔽_p(t)` | rank `6/2 = 3`; degree `pⁿφ(pⁿ)` = ratio of ranks; `N(y) = y²+xy`; residue field `𝔽_p(t^p)` | true | none |
| §9.2 cyclicity (sample) | `G = ℤ/p`; `G = E[2] ⊂ E[4]` over `ℤ[1/2]`; Conrad 2.3.7, Česnavičius 4.2.7 | `Gˣ` rank `p−1 = φ(p)`; `Gˣ = ∅`, `φ(4) = 2`, not cyclic; both: cyclic ⇔ `Gˣ` locally free of rank `φ(N)` | true | none |
| §9.5 identifications over `ℤ` (sample) | Česnavičius 6.3, 4.4.4(c), 5.13(a); Mathlib normalisation | stacks are normalisations of `X(1)` in `Y_H`; `[Γ(n)]/H = Y_H`; `normalizationDesc`, `normalization.hom_ext` at `Normalization.lean` 371, 435 | true | none |
| Headline 1, First Main Theorem | `N = 4`; `N = p`; `N = 6`; `N = 1`; supersingular, `p ∣ N` | ranks 96, 12, 24, 6; `[Γ₀]` `p+1`, 12; rank 1; exact-order scheme `k[X]/(X^{p²−1})`, étale clause vacuous | true | C02 |
| Headline 2, fine curves | `N = 3`; `B = 𝔽_p`, `p ∣ N`; `𝔸²_B`; `Y₁(4)` | `Spec ℤ[1/3,ζ₃][μ,1/(μ³−1)]`, rel. dim 1; both sides empty; smooth, not rel. dim 1; `Spec ℤ[1/2][b,1/b(1−16b)]` | true | none |
| Headline 3, coarse `j`-line | `y²=x³+x`; Legendre `λ=−1`; level-3 `μ=0`; char 2 | `j = (−48)³/(−64) = 1728`; `u = 27/4`, `j = 1728`; `j = 0`; `u(μ/(μ+1)) = u` | true | none |
| Headline 4, `X_H`, Shimura covering | `N = 5`; `N = 11, 13, 37`; inertia | `12 = 2·1 + 2·5`, `X₀(5)`: `6 = 1+5`; `n = 5, 1, 3`, `H` of order 1, 6, 6; order 2 in `H` iff `4 ∣ N−1` | true | none |
| `isGroupHom_of_mapsZero` (KM 2.5.1) | `S = ∅`; identity between two group laws | unique `F` trivially; `F = id` gives uniqueness of the group law | true | none |
| `exists_representableBy_of_isRigid` (KM 4.7.0) | empty problem; `[Γ(1)]` | represented over the empty base; `[Γ(1)]` affine, not rigid, excluded by `hP` | true | none |
| `smoothOfRelativeDimension_one_of_isCategoricalQuotient` | `H = 1`; `Y = ∅`; `ℤ_(2)[x]` | `Q ≅ Y`; `Q` initial, empty; `Q = Spec ℤ_(2)[x²]`, rel. dim 1 | true | none |
| §0.9 henselisation statements | `A = R^h`, `B = R^{sh}`; non-surjective `χ`; node `y² = x²(1+x)` | unique map `fromHenselization`; no map (`Ω` does not embed in `𝔽_p`); `(y−xs)(y+xs) = 0`, not a domain | true | none |

- Earlier findings: the previous review of this folder raised none, so nothing needed re-checking.
- Source locators checked against the text (about 40): Loeffler 3.3.2–3.3.6, 3.4.4, 3.7.4, 3.8.1–3.8.2; Conrad 2.3.7, 3.1.8, 3.2.7, 4.1.1, 4.2.1; Česnavičius 2.2.4–2.2.9, 3.3.2, §4.1.2, 4.1.3, 4.2.3, 4.2.7, 4.2.15, 4.4.4, 4.5.1, 5.13, 6.2–6.6; Conrad RGS 2.1.3; Stacks 0245, 0CCJ, 01W8, 0E62, 0D3D, 06LJ, 06DI, 0AP3.
- Library declarations opened at the pin: Tau Ceti `RingTheory/FormalGroup/CharP.lean` 44–52, `LinearAlgebra/TensorProduct/Kernel.lean` 20–40, `ModularCurve/Regular.lean` 116–141, `EllipticCurve/Scheme/Geom/Basic.lean` 20–32, `StrictHenselization/Etale.lean` 138, `Henselian.lean` 45, `Henselization/Noetherian.lean` 72–80, `Generator/Extension.lean` 26; Mathlib `AlgebraicGeometry/Normalization.lean` 371, 435, 576. The file's 219 `#check` lines all elaborate.
- Cross-roadmap citations resolved on main: JacobianChallenge Layer A, §B.4, §§C.1–C.2 (also at its open revision); AlgebraicCurves §§7.1–7.4, 8.6–8.7, Layers 9 and 12; ModularCurvesPartII §§4.9, 6.4, 6.5; ComplexComparisonPartII §C4.5 (`affineCurveConnectedness`); AlgebraicModuliForArithmeticGeometry §1.3; EtaleCohomologyFoundations §F.3a; LefschetzPencilsAndVanishingCycles Layer LPV.0. All present; the labels table is unchanged apart from the new Layer 10 row.
- Automatic checks: every check passed. Dependency check output: `depcheck: 200 roadmaps, 2217 edges, 0 problem(s)`.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0, with 32 `declaration uses sorry` warnings and nothing else. A `#check @name` file for all 53 declarations matches the README statements, and the section binders of the deformation and quotient blocks are present. A one-tactic probe (`rfl`, `simp`, `infer_instance`, `decide`, `exact?`) closes 0 of the 32 theorems.
- Changes: nothing outside the folder. The `Suggested.lean` diff removes one theorem, now at the pin as `FormalGroup.natCast_eq_zero_of_pow_mem_span` with the same hypotheses.
- Every one of the 132 Checks in 48 lists was recomputed or checked by hand; all are true.

Overlap check: read SchemeAndStackFoundations (main and its two open revisions), JacobianChallenge (main and open revision), PurityForFlatCohomology (open), NeronModelsAndSemistableAbelianVarieties (main) and GroupSchemesOverABase (main), and also AbelianSchemesAndArithmeticModuli and AlgebraicModuliForArithmeticGeometry. Shared objects and their owners:
- Finite locally free group schemes and Cartier duality over a base, the remaining descent forms, the finite locally free Grassmannian, and the further strict-henselisation statements: ModularCurves, and every neighbour cites it as owner.
- The henselisation of a pair and its recognition: SchemeAndStackFoundations §§0.12–0.14. ModularCurves §0.9's `IsHenselization` recognises henselisations at a field-valued point, and the two meet only for a local ring at its maximal ideal.
- Line bundles and curve cohomology: JacobianChallenge.
- The Plücker relations and the coherent Grassmannian: AlgebraicModuliForArithmeticGeometry §1.3.

Source independence: 24 passages compared with 5 sources (Loeffler, Conrad, Česnavičius, Conrad RGS, Stacks), plus a word-run scan of the whole README against 10 cached texts. No shared wording beyond bibliographic entries and forced phrases of at most 10 words. Largest share: KM, about 202 of about 400 locators. Contents compared with KM's chapter structure as the README's own locators show it: independent (Layers 3 and 4 reverse KM Ch. 3 and 4; KM Ch. 7 is split over Layers 6, 8 and 9; the order is the one the dependency table forces).

Research link: Layers 3–9 build Katz–Mazur's First Main Theorem and regularity theorems, which Conrad (2007) and Česnavičius (2017) extend to compactified moduli stacks over `ℤ`. Layer 10 is the curve geometry of Mazur's Eisenstein-ideal paper (1977, Ch. II §§1–2). This rests on the README (§8.8 further sources, Mazur interface) and on Conrad and Česnavičius as read.

## Not verifiable

- Katz–Mazur (1985): no legal copy. All of its roughly 200 locators are unchecked, including those of sampled §§1.1, 3.3–3.6, 5.1, 5.3, 8.1, 8.7, 8.9, 9.2 and 9.5. The p. 508 theorem of §6.4 is corroborated by Česnavičius's citation of it in his Proposition 6.4(a).
- Katz, *Serre–Tate local moduli* (LNM 868): publisher copy only; Theorem 1.2.1 of §7.5 not checked.
- Deligne–Rapoport (LNM 349): publisher copy only; II.1.1, IV 3.4, IV 6.7 and VI 6.7 not checked (Česnavičius cites IV.6.7 and VI.6.7 for the same facts).
- AEC: settled as uncertified; cited by locator only.
- Buzzard, *Formalizing Fermat*, Lecture 8 (§5.3): not located.
- Mazur (1977), EGM, SGA 1 and 3, Oda, Tate–Oort, Oort, Rydh, Kottwitz–Wake, Scholze, Igusa, Lazard: outside the sample, not opened.

## Source issues

- **Misprint** in Loeffler at Definition 3.3.3, p. 13 (Loeffler line 692): the source gives the discriminant of the Tate normal form with the opposite sign, and the note after Corollary 3.3.5 inherits it; it should be `β³(α³ − α⁴ − 8α²β + 36αβ − 27β − 16β²)`, which is `−15` at `α = β = 1`; affects nothing.
- **Gap** in Loeffler at Theorem 3.7.4, p. 18 (Loeffler line 997): the source says a relatively representable rigid problem is representable; it should also assume the problem affine over `Ell`, as KM 4.7.0 does and as the sketch's taking of invariants needs; affects nothing.
- **Error** in Loeffler at the proof of Theorem 3.7.4, p. 18 (Loeffler line 1010): the source says the Legendre problem carries a `GL₂(𝔽₂)×{±1}`-action; it should say that only the sign of the differential acts, since over `ℚ` the curve `y² = x(x−1)(x−2)` has 4 of 12 structures rational; affects the proof.

## For the human reviewers

- Not tested: KM, the source with the largest share of locators (about 202 of 400), has no legal copy. The wording and arrangement checks were made against its chapter structure as cited, not against its text.
- Licence: the Provenance section (README lines 4673–4702) names the author's AINTLIB repository and two other Apache-2.0 Lean repositories as proof-architecture material; `Suggested.lean` was not compared with them.
- The package's `sources.toml` records 8 works. KM, Česnavičius, Deligne–Rapoport, Mazur, EGM and Katz, which the README cites throughout, are not recorded, so their licence status is not on file.
