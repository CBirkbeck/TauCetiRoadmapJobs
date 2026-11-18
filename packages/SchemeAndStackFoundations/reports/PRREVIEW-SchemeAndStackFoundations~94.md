# Review of SchemeAndStackFoundations (pull request #2489 at e101833)

**Verdict:** needs changes

**Summary.** The new §1.22a is sound in its definitions, its Checks and almost all of its locators. One finding remains: Serre's criterion for cohomologically affine morphisms and base change along an arbitrary morphism of base schemes are stated without the quasi-separatedness that Alper, Rydh and the Stacks Project all assume, and the README's own proof routes use that hypothesis. There are four small corrections (a torsor Isom called a scheme, a forward *Needs:* reference to §1.23, the placement of the quasi-separatedness definition that StackPointsAndResidualGerbes asks of §1.20, and a citation in §0.9 that covers only a special case) and one format note. Nothing is left for a human to decide.

## R01 (P2) — Serre's criterion and base change along `S′ → S` are stated without the quasi-separatedness that every cited source assumes and that the proof routes use

As written, an implementer must prove *IsCohomologicallyAffine.iff_isAffine* for a morphism of algebraic spaces whose target is not quasi-separated, and *.baseChange_scheme* (with *Groups.IsLinearlyReductive.baseChange*) over a base scheme that is not quasi-separated. Neither the sources nor the routes given cover these cases.

- **The sources assume it.** Alper's standing convention (alper-2013 line 198, §2, p. 2353) is that all schemes are quasi-separated, and his algebraic spaces have quasi-compact diagonal (line 201). His proof of Proposition 3.10(iv) (lines 451–455, p. 2360) applies (vi) to the inclusions of affine opens `S_i → S`. Those inclusions are quasi-compact, hence quasi-affine, only when `S` is quasi-separated. Rydh 2015, Theorem (8.7) (rydh-2015 line 1317, p. 29), assumes a quasi-compact base with quasi-finite separated diagonal, and the strengthening after it (line 1334) assumes quasi-affine diagonal. Stacks, Lemma 30.3.4 (0F83), cited for the scheme case, assumes `X` and `Y` quasi-separated, and its proof uses that `V → Y` is quasi-compact.
- **The routes assume it.** The route for *iff_isAffine* (lines 3887–3888) says that "both properties are local on the target for étale coverings (*.descend*…)". But *.descend* only passes cohomological affineness from a cover down to the base. The step needed here goes the other way: restricting to an affine étale chart `V → Y`. That step is *.baseChange_quasiAffine*, and `V → Y` is quasi-compact only when `Y` is quasi-separated. The restriction cannot be skipped: by Alper's Remark 3.11, and by this section's own second Check, cohomological affineness does not survive arbitrary flat base change. The route for *.baseChange_scheme* (lines 3881–3882) has the same gap: "`S′ → S` is affine Zariski-locally on `S` and `S′`" first restricts to `Y ×_S S_i`, which is a base change along a quasi-compact open immersion only when `S` is quasi-separated.

**Repair.** Add "with `Y` quasi-separated" to *iff_isAffine* (for an algebraic space this is the quasi-affine diagonal of Rydh's strengthened form) and "with `S` quasi-separated" to *.baseChange_scheme* and *Groups.IsLinearlyReductive.baseChange*. The converse in the fifth Check (lines 3960–3961) then needs `S` quasi-separated too. Alternatively, state Alper's convention once at the head of §1.22a, citing Alper 2013, §2, p. 2353, or supply an argument for the general case. Nothing else in the section changes: *.baseChange_of_quasiAffineDiagonal* already implies a quasi-compact diagonal, and the first Check's target `𝔸²_k` is affine.

## C01 — The diagonal of `BG → S` is an algebraic space of isomorphisms, not in general a scheme

Line 3899 says that, after base change to a scheme, the diagonal of `BG → S` is "the scheme of isomorphisms between two `G`-torsors". Here `G` is only flat and of finite presentation, not affine. For an abelian scheme, which Alper (Example 12.4(3), p. 2393) lists among linearly reductive groups, torsors and their Isom sheaves need not be schemes. The conclusion drawn (the diagonal is quasi-compact and quasi-separated) needs only an algebraic space, so "the algebraic space of isomorphisms" would make the sentence true.

## C02 — §1.22a's *Needs:* line cites §1.23, which comes after it

The *Needs:* line (line 3926) lists "§1.18–§1.23". The only use of §1.23 is *IsTame.iff_isCohomologicallyAffine* (line 3892), which needs §1.23's `IsTame`. §1.23 does not need §1.22a, so there is no cycle, but the section is built before a section it uses. Either move that bullet into §1.23, adding §1.22a to §1.23's *Needs:*, or end the range at §1.22.

## C03 — StackPointsAndResidualGerbes asks §1.20 for the definition that §1.22a now gives

StackPointsAndResidualGerbes, on main, declares gap:stack-separation-axioms (its README, lines 389–395). That gap asks SchemeAndStackFoundations §1.20 to define quasi-separated (and DM, quasi-DM) morphisms of algebraic stacks by the diagonal (Stacks 101.4.1). §1.22a (lines 3833–3836) now defines "quasi-separated" for morphisms of stacks, and §1.20 still does not. A reader who follows that contract to §1.20 finds nothing. One fix is to state the definition in §1.20, next to `IsSeparatedStack`, and refer to it from §1.22a. Another is to say in §1.22a that this is the definition the gap asks for.

## C04 — The source cited for `integral_point_descent` (§0.9) proves only a Dedekind, Galois special case

Line 1285 states `integral_point_descent` for any Noetherian normal integral `S` and any finite extension of its function field. It cites Klevdal–Patrikis 2024, Lemma 3.9 and footnote 8, p. 21. That footnote (klevdal-patrikis-2024 lines 895–898) treats only `O_E[1/N]` with a Galois extension `L/E`, through the categorical quotient by `Gal(L/E)`. The statement is true as written: the closure of the generic point in `X` receives `S′` surjectively, so it is proper and quasi-finite, hence finite and birational over the normal `S`, hence equal to `S`. A one-sentence argument, or a citation scoped to the special case, would make the locator support the statement.

## N01 — The supplier contracts do not list §1.22a's new inputs

`TauCeti.Coalgebra.isLinearlyReductive_iff_forall_fixedMap_surjective_of_surjective`, `TauCeti.Comodule.Hom.fixedMap_surjective_of_isLinearlyReductive` and Mathlib's `AlgebraicGeometry.Scheme.IsQuasiAffine` appear in §1.22a's *Needs:* (lines 3926–3929) but not under "From Tau Ceti" and "From Mathlib". The Tau Ceti lemmas named in the Checks are also missing there.

## Verified sound

| Statement | Instances tried | Values on each side | Result; change |
|---|---|---|---|
| §1.22a quasi-separated morphism of stacks (04YW) | `id_X`; `BG → S`, `G` flat fp; `𝔸¹/ℤ`, char 0 | `Δ` an isomorphism; base change `Isom(P,Q)`, qcqs over `T`; diagonal not quasi-compact (§1.9 Check) | Pass |
| *IsCohomologicallyAffine* (definition) | `id`; `Spec B → Spec A`; `j : 𝔸²∖0 → 𝔸²` | exact; restriction of scalars, exact; `O² →(x,y) O` onto on `U`, `Γ` image `(x,y) ≠ k[x,y]`, so not exact | Pass |
| *iff_globalSections* | `Spec A`; `ℙ¹_k` | `Γ = id`, exact; `0→O(−2)→O(−1)²→O→0` gives `0 → 0 → k`, not onto | Pass |
| *QCoh.flatBaseChange* | `p : Spec k → BE` along `p` | `p^*p_*V ≅ Γ(E,O_E) ⊗ V = V` both sides | Pass |
| *.of_affine*, *.comp* | `Spec k[t]/(t²) → 𝔸¹ → Spec k`; `[X/G] → BG → S` | composites of exact pushforwards are exact; `[X/G] → BG` has base change `X → S`, affine | Pass |
| *.descend* (Alper 3.10(v)) | `f = p : Spec k → BE`, `g = p` | `f′ = E → Spec k` not cohomologically affine, so the hypothesis fails; no conflict with `p` being cohomologically affine | Pass |
| *.baseChange_quasiAffine* (3.10(vi)) | `g` a qc open immersion; `g = p : Spec k → BE` | counit `g^*g_* = id` (Alper lines 437–442); `p` has proper fibres, not quasi-affine, so Remark 3.11 is excluded | Pass |
| *.baseChange_scheme* (3.10(iv)) | `ℤ → 𝔽_p` for `B𝔾_m`; `S` = `𝔸^∞` with doubled origin | stays cohomologically affine; affine chart `S_i → S` not quasi-compact, so (vi) does not apply | R01 |
| *iff_isAffine* | `𝔸²∖0 → 𝔸²`; `Spec k → BE`; `Y` non-quasi-separated | `H¹ ≠ 0`, both sides false; representable and cohomologically affine but not a space; affine étale chart not qc | Pass on the first two; R01 |
| *IsTame.iff_isCohomologicallyAffine* | `B(ℤ/p)`, `Bμ_p` over `𝔽_p` | invariants of `𝔽_p[ℤ/p] → 𝔽_p` map `N ↦ p = 0`, both false; `ℤ/p`-graded degree zero, both true | Pass; C02 (placement) |
| `BG → S` quasi-compact and quasi-separated | `G = 𝔾_m`; `G = E` abelian | `Isom` a `𝔾_m`-torsor, an affine scheme; `Isom` an `E`-torsor, an algebraic space, possibly not a scheme | Pass; C01 |
| *Groups.IsLinearlyReductive* | `𝔾_m`, `μ_p`; `𝔾_a`; `ℤ/p` over `𝔽_p`; `GL_2` | true (graded); `V = k²` invariants `ke₁ ↦ 0` in `V/ke₁`; `N ↦ 0`; `|GL_2(𝔽_p)| = (p²−1)(p²−p) ≡ 0`, true over `ℚ` | Pass |
| *Groups.isLinearlyReductive_iff* | `ℤ/2` over `𝔽_3`; `𝔾_a` | `2` invertible, both true; Tau Ceti `not_isLinearlyReductive`, and the invariants test fails, both false | Pass |
| *Groups…baseChange*, *.descend* (12.8) | `GL_n`, `ℤ → ℚ` | false over `ℤ`, true over `ℚ`; `ℤ → ℚ` not surjective, so descent does not apply | Pass; R01 for non-quasi-separated `S` |
| Check 5, `[𝔸^n/𝔾_m]` | `n = 1, 2` | `[𝔾_m/𝔾_m] = Spec k` excluded by `n ≥ 2`; `ℙ¹` proper of dimension 1, not affine | Pass |
| §0.8 `flat_over_dedekind`, fibre loci | `S ⊔ 𝔸¹_S → S`; EGA IV₃ 12.2.4 | flat, no single `d`; (v) geometrically reduced, (viii) geometrically integral, p. 183 | Pass |
| §0.9 `integral_point_descent` | `O_E[1/N]`, Galois `L`; inseparable `L` | source: `S(O_L)^Gal = S(O_E)`; closure finite birational over normal `S` | Pass; C04 |
| §0.12 henselization | `(ℤ[i,1/2], (2+i))`; `ℤ[√2,1/2]` | `ℤ[i]/(2+i) = 𝔽_5`; `2` a non-square mod 5, residue `𝔽_25` | Pass |
| §0.17 depth, CM, Serre | `k[x,y]_(x,y)`, `p = (x)`; `k[[x,y,z]]/(xz,yz)`; `𝔪 ⊂ k[x,y]` | `1+1 = 2`; depth 1 < dim 2; `depth 𝔪_𝔪 = 1`, not onto | Pass |
| §0.20 Japanese, Nagata | `k[t_i², t_i³]`, `i ∈ ℕ`; `R_1` | normalisation `T` not finite (`t_j ∉ k[t_j², t_j³]`); generated by `{1, t_1}` | Pass |
| §0.27 annihilators | `ℤ → ℤ[1/2]`; `k[x,y] → k[x]` | `(12)·ℤ[1/2] = (3) = (1)∩(3)`; `(x²) ≠ (x)` | Pass |
| §0.30 ramification | `x ↦ x²` at `0`, `1` | `e = 2`; `u−1 = (t−1)(t+1)`, `e = 1` when `2` is invertible | Pass |
| §1.16 twisting | `Spec L ×^{ℤ/2} Spec L` | `L⊗L = L×L`, diagonal `σ` per factor, quotient `Spec K ⊔ Spec K` | Pass |
| §1.18 stackification | trivial `ℤ/2`-torsors over `ℝ` | stackifies to `B(ℤ/2)`, 2 classes vs 1 | Pass |
| §1.23 Keel–Mori, tame | Rydh (6.12) p. 28; AOV Def. 3.1 p. 18; `B(ℤ/p)` | hypotheses as stated; `H¹(ℤ/p, 𝔽_p) = 𝔽_p ≠ 0` | Pass |
| §2.7 local cohomology | `𝔸¹`, `Z = {0}`; `k[x_j]/(x_j^{j+2})` | `H¹_Z = k[t^{±1}]/k[t]`; fresh `x_j^n f ≠ 0`, native `H⁰ = 0` vs `A` | Pass |
| §2.16 Tsen, `𝔾_m` on curves | `ℙ¹`, `𝔸¹`; nodal cubic | `H¹ = ℤ`, `0`; `H¹(C, ℤ/n) = ℤ/n` | Pass |
| §2.22 Azumaya, Brauer | Lipschitz order; `ℝ ⊔ ℚ_p` with `ℍ`, inv `1/3` | fibre at 2 commutative; order `lcm(2,3) = 6` | Pass |
| §3.8 differentials | `𝔾_m`; `E`; Milne III 2.1–2.2 | `dt/t`; `dx/(2y+a₁x+a₃)`; pp. 91–92 | Pass (source gap noted) |
| §4.12 flattening, Chow | `Bl₀𝔸² → 𝔸²`; 052A | flat off `0`, strict transform `≅ S′`; `S` integral, `f` finite type | Pass |
| `exists_linear_normalization` | `k[x,y]/(xy)`, `t = x+y` | `x² − tx = −xy = 0`, finite, `d = 1` | Pass |
| `Ring.IsNagata.of_complete_local`, `IsQuasiExcellentRing.isNagata` | `ℤ_p`; `k[[x,y]]`; `ℤ` | complete, so Nagata; excellent | Pass |
| `artinBootstrap` | `a = 𝟙_U` | `F = U` | Pass |
| `grothendieck_existence`, `algebraize_hom` | `ℤ_p`, `ℙ¹`, `O(n)^` | algebraises to `O(n)` | Pass |
| `alteration_theorem`, `semistable_alteration_theorem` | `𝔸¹`, `Z = {0}`; `ℤ_p[x,y]/(xy−p²)` | `ℙ¹`, `B = {0,∞}`; `uv = √p` after base change | Pass |
| `hodge_index` | `ℙ¹×ℙ¹`, `H = (1,1)`, `D = (1,−1)` | `D·H = 0`, `D² = −2 < 0` | Pass |
| `weil_bound` | `ℙ¹/𝔽_q`; `y²+y = x³` over `𝔽₂` | `|q+1−q−1| = 0`; `N = 3`, `|3−3| = 0 ≤ 2√2` | Pass |
| Not statable: §1.22a, Keel–Mori, duality, Brauer class, `Pic^d`, Schlessinger, GRR, `K_0 → G_0` | pins, searched by object | no algebraic stack, cohomologically affine morphism or quasi-affine morphism class at either pin | Pass |

- Previous review: the report at 7fb5df9 (another pull request on this roadmap) had no open finding, so there was nothing to re-check. Only `README.md` (155 insertions, 3 deletions) and the `Suggested.lean` docstring changed, and no file outside the folder changed.
- Automatic checks: the gate rerun reports every counter zero (OK). The dependency check reports `depcheck: 218 roadmaps, 2431 edges, 0 problem(s)`. `lake env lean Suggested.lean`: exit 0 in 70 s, with 48 warnings, all `sorry`.
- One-tactic probe (`first | rfl | infer_instance | simp` in place of each `sorry`, on a copy of the file): all 48 theorems fail. Declarations and pins are unchanged since the previous main revision. The elaborated signatures of all 102 declarations show no dropped binder, and `flat_over_dedekind` and `generic_flatness` were spot-checked against the README.
- §1.22a sources: 16 Alper 2013 locators (pp. 2353–2395), AHR §1.5 p. 5, Rydh 2015 (8.7) p. 29, and 12 Stacks tags (04YW, 06WV, 0GQQ, 077A, 076X, 0F83, 07V6, 041Z, 03WF, 03WL, 01SK, 0CHQ). All match, apart from the hypothesis issue of R01.
- Sample: 170 Stacks tag–number pairs were resolved mechanically against the cached chapters, with 0 mismatches (five cite a section tag after a range of results). There were 9 Stacks book page numbers, and 4 EGA IV₃ locators with pages. Also checked: Poonen 2017 (6 locators), Brauer I (4), Brauer II (6, pp. 291–296), Milne AV (2), Klevdal–Patrikis (1), Harari (1), AOV (2), Rydh 2013 (4) and Conrad 2005 (1).
- Library: 7 Tau Ceti declarations cited in §1.22a were opened (`AffineGroupScheme/LinearlyReductive.lean:60`, `Comodule/LinearlyReductive/Exact.lean:54`, `Fixed.lean:184`, `DiagonalizableGroup/Scheme/LinearlyReductive.lean:43`, `AdditiveGroup/LinearlyReductive.lean:51`, `LinearlyReductive/FiniteSubgroup.lean:81`, `GeneralLinear/LinearlyReductive/Basic.lean:232`), as were Mathlib's `IsAffineHom` (`Morphisms/Affine.lean:48`) and `Scheme.IsQuasiAffine` (`QuasiAffine.lean:34`). Of 141 Tau Ceti file:line references in the sampled sections, 113 matched automatically, and 12 of the 28 matched by list order were checked by hand.
- Cross-roadmap: ReductiveGroups Layer 6 (main) owns the classification over a field. StackPointsAndResidualGerbes gap:stack-separation-axioms (main, lines 389–395) is the subject of C03. AlgebraicModuliForArithmeticGeometry (main, line 8670) consumes §§1.22–1.23. No roadmap on main or open states cohomologically affine morphisms.
- The texts read for this round are on open hosts (numdam, arXiv, author pages): Alper 2013, AHR 2020, Rydh 2015, Klevdal–Patrikis 2024, Brauer II, Harari and Conrad 2005. The package manifest does not record them.

Overlap check: read QuasicoherentSheavesOnPrestacks, FunctorOfPoints, PurityForFlatCohomology, VirtualFundamentalClassPartII and LocalPurity (open), and StackPointsAndResidualGerbes, AlgebraicModuliForArithmeticGeometry and JacobianChallenge (main); the results-and-headings list is empty. Shared: quasi-separated morphisms of algebraic stacks, owned by SchemeAndStackFoundations, which StackPointsAndResidualGerbes asks for in §1.20 (C03). Nothing else is shared; the classification of linearly reductive groups is ReductiveGroups', and it is cited.

Source independence: 24 passages compared with 13 sources, none shared beyond forced formulas and one-line statements. The largest share is the Stacks Project, about 850 of about 1050 locators. Contents compared with the Stacks Project's parts: independent (stacks come before cohomology here, and intersection theory comes last).

Research link: §1.22a is the notion underlying Alper's good moduli spaces (Alper 2013) and the Luna étale slice theorem (Alper–Hall–Rydh 2020). §1.23's tame stacks (Abramovich–Olsson–Vistoli 2008) and Keel–Mori (Rydh 2013) are its finite case. This rests on the README's sources and on alper-2013 §§3, 12.

## Not verifiable

- `de-jong-1996`, `hartshorne-1977`, `kempf-1978`: settled as uncertified. None is cited in a changed passage or in the sampled targets' statements checked here.
- The page of Stacks, Theorem 16.13.1 (07QY), p. 1626 (§0.12) was not confirmed; its number was confirmed. Harpaz–Wittenberg 2023 (§2.22, a specialisation remark) was not opened.

## Source issues

- **Gap** in milne-av at Part III, Proposition 2.2, p. 92: the source leaves as an exercise the commutativity of the square relating pullback of differentials, the tangent-space isomorphism and Serre duality; it should give the argument or a reference; affects the proof.

## For the human reviewers

- none
