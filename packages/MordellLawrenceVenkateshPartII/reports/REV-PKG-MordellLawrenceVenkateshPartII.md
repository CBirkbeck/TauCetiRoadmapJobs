<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2301#issuecomment-6665188424 -->
Review (claude) of 586679c

Verdict: needs_changes

1. **F01** (P3) Six locator slips (pages and a footnote number)

   Location: `packages/MordellLawrenceVenkateshPartII/README.md` lines 417, 607, 1522, 1836, 1856, 1879, 1931.

   Claim: the cited statements are on the pages given.

   Witness (page markers of the cached texts; LV printed page = marker + 892):

   - §0.1 "Definition 5.2, pp. 40–42": LS line 1832 lies on preprint page 41 (marker at line 1798); the definition runs to p. 42.
   - §0.7 "Remark 5.7, p. 43": LS line 1926 lies on page 42 (page 43 begins at line 1940).
   - §5.2 "Lemma 8.2 and Definition 8.3, pp. 73–74": LS lines 3366 and 3379 both lie on page 74 (page 74 begins at line 3347).
   - §7.1 and §7.2 "footnote 10": the Wintenberger/Pink outline is footnote 11 (LV line 3196, marker 85, printed p. 977); footnote 10 is the degree convention of §10.2 (LV line 2936).
   - §7.3 "Lemma 10.4 and proof, printed pp. 976–978": the statement is at LV line 3113, marker 83, printed p. 975; the proof occupies pp. 976–978.
   - §7.5 "Lemma 10.5, printed pp. 979–981": the statement is at LV line 3123, printed p. 975; the proof occupies pp. 979–981.

   Repair: write "pp. 41–42", "p. 42", "p. 74", "footnote 11" (twice), "statement printed p. 975, proof pp. 976–978" and "statement printed p. 975, proof pp. 979–981" respectively.

2. **F02** (P3) SheafConvolutionOnAbelianVarieties §4.7 is cited for inversion symmetry; that is §4.8

   Location: README line 72 ("inversion symmetry and the classical form (§4.7)"), line 233 ("§4.7: inversion symmetry and the classical form on the twisted cohomology; consumed in §1.8"), line 858 (§1.8 *Needs:* "SheafConvolutionOnAbelianVarieties §4.7"), line 895 (Layer 1 Dependencies "§§0.2, 3.1, 4.7, 8.3").

   Claim: §4.7 of the supplier states inversion symmetry and the classical form.

   Witness: at the supplier's open head, §4.7 is "Minuscule representation alternatives" (the SL/Sp/SO-or-spin-or-exterior-power trichotomy) and §4.8 is "Inversion symmetry and the classical form" (alternating for even `n`, symmetric for odd `n`, LS Lemma 3.11). Supplier drift of one section number.

   Repair: replace §4.7 by §4.8 in the four places; keep everything else.

3. **F03** (P3) §2.3 states rational uniqueness of the semisimplification in a sentence that has no precise content

   Location: README lines 965–967: "unique up to rational conjugacy after the finite extensions stated in the source, depending continuously on a continuous representation".

   Claim: the sentence is a theorem statement with exact hypotheses.

   Witness: LS Lemma 5.37 (LS line 2574) gives uniqueness up to `G`-conjugacy only; LV §2.3 (LV lines 499–505) defines the semisimplification with `K`-parabolics and quotes Serre for independence up to `G`-conjugacy. Neither source names finite extensions, and "depending continuously" is not a statement. Downstream, §2.9 obtains rational classes from §2.11, not from this clause.

   Repair: replace the clause by "unique up to `G(k̄)`-conjugacy; over a field `k` of characteristic zero the construction with `k`-parabolics and `k`-Levis yields a `k`-rational subgroup, and the `G(k)`-conjugacy classes inside one geometric class are finitely many by §2.11", and add to the API bullet that the semisimplification of a continuous representation is continuous because `P → L` is a morphism of algebraic groups.

4. **F04** (P3) §2.4 drops "rigid abelian" from the ambient category

   Location: README line 995: "a `k`-linear tensor category `C` with fibre functor `ω`".

   Claim: the definition of a G-object makes sense for a tensor category with fibre functor.

   Witness: LS Definition 5.38 (LS line 2583) requires an `E`-linear rigid abelian tensor category with fibre functor; "exact faithful" has no meaning without abelianness. §0.3 supplies the rigid abelian structure, so nothing downstream breaks.

   Repair: write "a `k`-linear rigid abelian tensor category `C` with fibre functor `ω` (the category of §0.3 or a tensor subcategory of it)".

5. **F05** (P2) §9.2 uses Zariski density of an open subgroup of `SO(E)(ℚ_ℓ)` with no owner

   Location: README lines 2319–2323: "§5.10 there gives open or finite; … so the monodromy is open and its Zariski closure contains `SO(E)`"; the *Needs:* line cites DeligneWeightsAndPurity §2.2 for Zariski density.

   Claim: openness of the compact monodromy image in `O(E)(ℚ_ℓ)` gives a Zariski closure containing `SO(E)`, by the cited supplier.

   Witness: DeligneWeightsAndPurity §2.2 at its head is "Open subgroups of `Sp(V)(ℚ_ℓ)` are Zariski-dense" and says "Connectedness of `Sp` is essential; an open subgroup of a disconnected orthogonal group need not be Zariski-dense in every component". The orthogonal step of the route is therefore supplied by nothing the README names. The fact is true (an open subgroup of `SO(E)(ℚ_ℓ)` has full Lie algebra, so its Zariski closure has dimension `dim SO(E)` and contains the connected group `SO(E)`), and its analytic-chart input is ReductiveGroupsPartII §RG2.0.2 ("smooth-group-analytic-charts"), which is on main and earlier in the merge order; no roadmap I can read states the orthogonal case itself.

   Repair: add the sentence "An open subgroup of `SO(E)(ℚ_ℓ)` has Lie algebra `𝔰𝔬(E)` (ReductiveGroupsPartII §RG2.0.2, analytic charts), so its Zariski closure, a closed subgroup of dimension `dim SO(E)`, is `SO(E)`; the intersection of the open monodromy image with `SO(E)(ℚ_ℓ)` is such a subgroup" to the route of §9.2, and add ReductiveGroupsPartII §RG2.0.2 to the *Needs:* line, to the Layer 9 Dependencies, to the supplier contracts and to the scope list. Tested on `E` of dimension 2 split: `SO₂ = 𝔾_m`, an open subgroup of `ℚ_ℓ^×` is Zariski dense in `𝔾_m` (its closure contains infinitely many points of a one-dimensional irreducible group), while an open subgroup of `O₂(ℚ_ℓ)` contained in `SO₂` is not dense in `O₂`, which is exactly why the statement is made for `SO(E)`.

6. **F06** (P3) A Check of §2.10 miscounts the classes

   Location: README line 1166: "For `H = 1` and `G = GL₂` there are infinitely many Borels but one class of pairs up to `GL₂`."

   Claim: one `GL₂`-class of pairs `(P, M)` with `P` a Richardson parabolic, `M` a Levi.

   Witness: the trivial cocharacter gives `P_λ = G` with Levi `G` (LS Definition 5.34, LS line 2537), so `(GL₂, GL₂)` is a second class besides `(B, T)`; computed: two classes.

   Repair: "infinitely many Borels but two classes of pairs up to `GL₂`: the Borel pairs `(B, T)` and the trivial pair `(G, G)`".

7. **F07** (P3) The gap `relative-crystalline-comparison` asks for a de Rham half that PadicHodgeTheory §7.3 already provides

   Location: README line 312 (and `design/plan.json`, gap `relative-crystalline-comparison`): "the fibrewise crystalline comparisons of §8.1 at the points of a residue disk … are horizontal for the Gauss–Manin connection on `R^i f_* Ω^•` and compatible with the Frobenius of the convergent F-isocrystal".

   Claim: both halves are missing from the supplier.

   Witness: PadicHodgeTheory §7.3 ("Proper smooth pushforward and de Rham pairs", at its head, the paragraph beginning "When the relevant `Rⁱf_*L` are lisse") states that for proper smooth `f` the higher direct image of a de Rham local system is de Rham with associated `Rⁱf_dR,*E`, its Hodge graded pieces and its Gauss–Manin connection (Scholze, Theorem 8.8). On a residue disk this is the horizontality of the fibrewise de Rham comparisons. The Frobenius compatibility and the Faltings association are not there.

   Repair: in the gap sentence (README and plan.json, same slug) cite PadicHodgeTheory §7.3 for the Gauss–Manin horizontality of the fibrewise de Rham comparisons and ask only for the compatibility with the Frobenius of the convergent F-isocrystal of CrystallineCohomology §CR.7.3 and the resulting Faltings association; add §7.3 to the PadicHodgeTheory contract and to the *Needs:* lines of §§0.1, 0.5 and 0.7.

Seven findings, one of them P2 (an uncited input in the proof route of §9.2), six P3 (locator slips, one supplier section number that drifted, two imprecise statements, one wrong Check, one gap that can be narrowed). The elaboration passes with only the two `sorry` warnings, the dependency check reports no problem, the two stated headlines survive the one-tactic probe, and the sampled locators agree with the sources apart from the page slips listed in R01. Nothing in the package re-plans an existing roadmap, takes a route-specific shortcut, copies a passage, states an algorithm, or uses sorry'd data or `set_option`.

## Verified sound

**Principles.** The roadmap imports MordellLawrenceVenkatesh (§§0.3–0.4, 0.24, 1.2, 1.10, 1.12–1.13, 2.5–2.6, 2.8, 2.11, 3.8; all twelve headings exist at its open head and say what is attributed: §1.2 is Faltings's lemma with integral Frobenius polynomials, §2.11 the crystalline Frobenius with Gauss–Manin transport, §0.4 the semilinear centralizer bound) and extends it; it does not re-plan it. No "good primes only" shortcut: §6.1 and §7.6 are stated as in LS Theorem 8.17 and LV Theorem 10.1. No copied passage (the README paraphrases; the longest shared strings are formulas). No algorithm. `Suggested.lean`: single `import Mathlib`, no `set_option`, no `lemma`, no sorry'd data (the four definitions have real bodies), no `#eval`/`#print`. No process residue: grep for pull-request numbers, dates, hand-off words, LaTeX delimiters, "optional/deferred", machine paths found nothing.

**Elaboration.** `lake env lean` on `Suggested.lean` from the content checkout: exactly two warnings, `declaration uses 'sorry'` at lines 61 and 98, no error, 7 s. A scratch copy with `#check @` for `eulerian`, `HypersurfaceMonomial`, `IsSmoothHypersurface`, `HasGoodReductionOutside` printed the types of the worker's `signatures.md`; the file has no `variable` block, so no binder can be lost; each type agrees with README §§8.4, 9.1, 9.3.

**One-tactic probe** (scratch copy, elaborated once): `eulerian_central_mass_le_half` with `simp` ("made no progress") and `omega` (fails); `integralHypersurfaces_not_zariskiDense` with `simp` (unsolved) and `infer_instance` (not a class). Neither headline is padding. Small-value `decide` examples (`eulerian 3 1 = 4`, `eulerian 4 1 = 11`, `eulerian 0 0 = 1`) and the non-smoothness of the zero form over ℚ closed in the scratch file and are correctly absent from `Suggested.lean`.

**Headline theorems** (README summary): coefficient non-density (§6.1), higher-dimensional LV non-density with finiteness clause (§§7.6–7.7), projective non-density (§9.3), Shafarevich finiteness for ample hypersurfaces in abelian varieties (§§10.6, 10.9, 10.10), the corrected point-count bound (§7.8), the Eulerian central mass (§8.4). Stated: §9.3 as `integralHypersurfaces_not_zariskiDense`, §8.4 as `eulerian_central_mass_le_half`. The module docstring names §6.1, §§7.6–7.7, §§10.6–10.10 and §7.8 as not statable with the missing carrier for each; I checked at the pins that Tau Ceti has `TauCeti.AlgebraicGeometry.AbelianVariety` (`TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean` line 95, over a field, no ampleness) and that neither library has variations of Hodge structure, filtered F-isocrystals or primitive cohomology of a family, so the docstring is accurate. No statable headline is absent and none is forced through a stand-in. Why the Lean form of §9.3 is the README statement: an integer form with good reduction outside `S` (smooth reduction mod every `p ∉ S`) has `S`-unit content and smooth generic fibre (the singular locus of the model is closed and does not meet the fibres over `p ∉ S`), so these forms are exactly the representatives of `Y_(n,d)(ℤ[S⁻¹])`; a set of ℚ-points of the dense open `Y_(n,d),ℚ ⊂ ℙ^N` is non-dense iff it lies on a nonzero homogeneous `G` over ℚ (take a Galois norm of a `ℚ̄`-hypersurface).

**Adversarial table** (sampled targets, headlines, and the targets the findings touch).

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §0.6 `G_mon` | constant system; rank-two `SL₂`; finite monodromy `C₂` | Zariski closures: `1`, `SL₂` (not `GL₂`), `C₂` (whole finite group) | agrees with LS Def. 5.6 (LS line 1916–1925: Zariski closure of monodromy via Riemann–Hilbert) | none |
| §0.7 residue-disk `(V, φ)` | constant family `Y₀ × X`; Legendre family | period map constant; `(V, φ)` fixed on the disk, Hodge line varies | matches LS Remark 5.7 (LS lines 1926–1934: one `(V_x, φ_x)` per residue class, filtration per point) | R01 page slip |
| §1.1 H⁰-algebra | `ℚ × ℚ`; `ℚ[ε]/ε²`; quadratic permutation algebra | étale, non-étale, constant with swap | matches LS Def. 5.14/5.16 (LS lines 2054–2069) | none |
| §2.3 semisimplification | split extension of two characters of `GL₂`; `(GL₂)² ⋊ C₂` with `μ₁ = (t³, t²)`, `μ₂ = (t², t²)` | `P_{μ₁} = G⁰`, `P_{μ₂} = G` (LS Example 5.35, LS line 2550) | definitions match LS 5.34–5.37 and LV 2.4–2.5; uniqueness clause vague | R03 |
| §2.4 G-object | `G = GL₁`; functor sending unit to a 2-dim space | invertible object; not monoidal | matches LS Def. 5.38 except the ambient "rigid abelian" | R04 |
| §2.8 uniform filtrations | `E = E₀ × E₀`, two `SL₂` profiles; `E = E₀` | `h_Res = 2h_H`, `T_Res(2x) = 2T_H(x)`; factor 1 | matches LS Lemma 5.48 (LS line 2801: `h_{G⁰} = c h_H`, `T(cx) = cT_H(x)`) | none |
| §5.2 induced Levi filtration | `P = G`; `GL₂` line; `SL₂` diagonal `μ` on `ℙ¹` | `F_M = F`; two fixed points `0, ∞` in distinct `B`-orbits, not torus-conjugate | matches LS Lemma 8.2 (LS line 3366) and LV Lemma 11.1–11.2 (LV lines 3559–3619: fixed points of one `Q`-orbit are `N`-conjugate) | R01 page |
| §5.3 semibalance in `GL₆` | flag `2+2+2`, `dim F¹ = 3`, contributions `(a₀,a₁,a₂)` | `Σ_{block i<j}(w_i − w_j) = 4(a₂ − a₀)` for `det(Ad|Lie P)`; inverse gives `⟨γ_P, μ⟩ = 4(a₀ − a₂)`; `(1,1,1)`: 0; `(2,1,0)`: 8 > 0 | sign agrees with LS p. 75 (LS line 3395: modular character is the inverse determinant) | none |
| §5.7 φ-stable Levi | `diag(2,1)` on the upper root group of `GL₂` | conjugation multiplies by 2, infinite order; `u = (uφ)φ⁻¹` commutes with `φ^r` since `(uφ)^r = φ^r`, so `u ∈ Z_U(φ^r)` | LS proof (LS lines 3672–3684) applies Lemma 8.13 on all of `U`: gap; README's restriction repairs it | none |
| §5.8 finite local types | irreducible `ρ^ss`; one flag with infinitely many indexings | one type; one type | matches LS Lemma 8.10 (LS lines 3549–3561) | none |
| §5.10 fixed-graded bound | `H = GL₂`, weights `(1,0)`, `c = e = 1` | `h = (1,2,1)`, `t = 2`, `A = B = 1`; RHS `T(1) + T(0 + 1) = 2 > 1` | hypothesis fails on `ℙ¹` as it must; inequalities match LS Lemma 8.12 (LS lines 3614–3622) | none |
| §6.1 coefficient theorem | `d = 0`; `dim H` large | point is dense; first inequality fails | inequalities match LS Theorem 8.17 (LS lines 3826–3840) | none |
| §7.3 bounded prime | `r = 2` pairing; regular semisimple in `GSp_{2g}` | `λ ↔ ℓ²/λ`; centralizer dimension `g + 1` | bound `≤ dim Z(φ₀) = h⁰` matches LV (10.16) (LV line 3120); LV line 3240 says the form scales by `ℓ`: misprint | R01 page |
| §7.4 bad filtrations | `z + e > A`; graded object of average `≠ r/2` | hypothesis fails; excluded | matches LV Prop. 10.6 (10.23)–(10.24) (LV lines 3370–3377), published non-strict `≥` | none |
| §7.5 fibres nondense | irreducible `ρ^ss` | flag trivial, reduces to §4.4 | matches LV Lemma 10.5 (LV lines 3123–3128, proof 3255–3340) | R01 page |
| §7.6 / §7.7 LV theorem | elliptic family: `Sp₂ = SL₂` vs `GSp₂ = GL₂`; component `C` of the closure of rational points | hypothesis asks for `Aut°` only, as LV (10.1) does (LV line 2856: "containing the identity component"); `A + h⁰ ≥ 2h⁰ + d ≥ 3h⁰/2 + d`; a dense set of ℚ-points forces one geometric component (Galois conjugates meet in a proper closed set) | sound | none |
| §7.8 point-count bound | `M = 1` | kernel coefficients `1,2,3,2,1`, `‖g₁‖² = 19`, `9/19 ≤ 3/4`; general `(2M+1)²/‖g_M‖² = 3(2M+1)/(8M²+8M+3) ≤ 3/(4M)`; with cutoff `q^{(m/2+1)2M} < b/3` the factor `(1 + 3b⁻¹q^{…})² < 4` | LV proof sums `r` to `N` after expanding to `2N` (LV lines 3907–3918): the corrected cutoff is needed | none |
| §8.1 Eulerian profiles | `n = 2, d = 1`: `GL₂`, `GSp₂`, `GO₂`; `n = 3, d = 1`: `GO₆` | `2h⁰ = 4 < 6`, `4 < 6`, `4 < 4` fails; `h⁰ = (18−4)/2 + 1 = 8`, `16 < 20` | strictness needs the parity choice; LS Lemma A.1 as stated admits `GO₂` | none (source issue) |
| §8.2–8.3 difference law | `n = 2, 3, 4, 5` | `β₀ = 1/2, 1/2, 61/144, 571/1440`; `β_{±1}(3) = 2/9`, `β_{±2}(3) = 1/36`, sums 1; second moments `1/2, 2/3, 5/6, 1 = (n+1)/6` | all Checks true | none |
| §8.4 / `eulerian_central_mass_le_half` | `n = 1, …, 9` by enumeration of `Equiv.Perm (Fin n)` descents | `2ΣA²`: `2, 4, 36, 488, 11420, 377816, …`; `(n!)²`: `1, 4, 36, 576, 14400, 518400, …`; fails at `n = 1`, equality at `n = 2, 3` | true for `2 ≤ n ≤ 9`; the LS route (`(n+1)/6 ≥ 3/2` iff `n ≥ 8`, then A.3 + A.5) covers the rest | none |
| §8.5 large `c` | `GL₂` profile `(1,2,1)` | `(h⁰−2)/2 = 0`, `T(0) = 0 < 1`; need `c ≥ e + 4` and `2(e+4)/c < 1`, so `c ≥ 5(e+4)` works | true | none |
| §8.6–8.7 Hodge numbers | `(n,d) = (3,4), (4,5), (5,4), (2,3), (3,3), (4,2), (3,2)` | primitive `(1,19,1)`, `(1,101,101,1)`, `(0,21,141,21,0)`, `(1,1)`, `(0,6,0)`, `(0,0,0,0)`, `(0,1,0)`; `binom(6,4)−1 = 14`, `binom(6,3)−1 = 19`, cubics `9 = 9` | all Checks and worked examples true; LV p. 971 formula wrong | none |
| §9.1 universal family | zero form; `x₀^p + x₁^p + x₂^p` over `𝔽_p`; nonzero constant | not smooth; all partials zero so singular; a degree-0 form is vacuously "smooth" but is not a form of degree `d ≥ 1` | definitions determine the object | none |
| §9.2 monodromy | `n = 5, d = 4`; cubic surfaces; quadrics; `SO₂` | `h_prim = (0,21,141,21,0)` indefinite; `(0,6,0)` definite, `W(E₆)`; quadrics finite; open subgroup of `SO₂(ℚ_ℓ)` dense, of `O₂(ℚ_ℓ)` not in every component | orthogonal Zariski-density step uncited | R05 |
| §9.3 / `integralHypersurfaces_not_zariskiDense` | `S = ∅` (possibly no forms at all); `cF` for `c ∈ ℤ` | any nonzero `G` works when the set is empty, nonvacuous since `∀ S`; the form set is closed under `S`-unit scaling, consistent with homogeneity of `G` | Lean statement equals the README statement | none |
| §10.3 Weil restriction | `K = ℚ`; `K` quadratic; `K[ε]/ε²` | identity; `𝒫 × 𝒫^σ` with swap; not proper | matches LS proof of Thm 9.2 (LS lines 3903–3918) and AbelianSchemes §A6.32 (same `K[ε]` counterexample) | none |
| §10.7–10.9 degrees | `T = ker([2] × id)`; `d = 8855`, `2·8855` | `|T| = 4`, `d = 4d′`; `D₁ = binom(25,5)/6 = 8855` exactly; `2·8855` allowed in §10.6, excluded in §10.9 | matches LS Cor. 9.3 (LS lines 4014–4019: "not a multiple of") and Thm 9.5 (`φ³` not divisible by `d(i)`) | none |
| §10.10 surfaces | `q(mf)` for `f ∈ Hom(Jac C, A)` | `[m]_*` on `H₂(A)` is `m²`, so `q(mf) = m² q(f)` | matches LS Thm 9.6 (LS lines 4041–4057) | none |
| §2.10 Check | `H = 1`, `G = GL₂`; diagonal torus of `GL₃` | classes of pairs: `(B,T)` and `(G,G)`: two; ordered set partitions of 3 elements: 13 | first Check wrong | R06 |
| Conventions: modular character | upper Borel of `GL₂`, `μ = diag(t,1)` | `det(Ad|Lie B)(diag(a,b)) = a/b`, inverse `a⁻¹b`, `⟨γ_P, μ⟩ = −1` | matches §5.1 Check and LS line 3395 | none |
| §5.9 root pairing | `SL₂`, `w = s`; `w = 1` | `Σ∖Σ_B = {−α}`, `s(−α) = α > 0`, image `−s(−α) = −α`; empty sets, `ℓ(1) = 0` | LV Lemma 11.4 proof ends with "`w` and `w⁻¹`" (LV line 3795): misprint | none |

**Declared gaps.** All six have a named supplier earlier in the merge order, the same slug in `design/plan.json` and the README, and a one-sentence `needs`. Minimality checked at the suppliers' heads: ClassicalArithmeticCompletion §2.56 states unimodality only (no log-concavity, variance or central limit theorem: grep for those words finds nothing); ShimuraData §3.4 has no André normality; PadicHodgeTheory §4.4 has the Sen operator but no Hodge cocharacter in the Galois image; AbelianSchemesAndArithmeticModuliPartII Layer B3 has mixed Ax–Schanuel for Kuga varieties, not for pure variations. The relative crystalline gap is partly provided (R07).

**Supplier order.** Dependency check output:

```
depcheck: 225 roadmaps, 2227 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. `roadmaps resolve`: no cross-roadmap citation and no Lean name found nowhere. Every cited roadmap is on main (ClassicalArithmeticCompletion, ReductiveGroups, ReductiveGroupsPartII, RestrictedPowerSeries, ComplexKahlerGeometry, SchemeAndStackFoundations; Chebotarev under `Completed/`) or earlier in the merge order; every cited section heading exists at the current head (checked all 107 citations by heading: MordellLawrenceVenkatesh 12, SheafConvolutionOnAbelianVarieties 10, ComplexComparisonPartII 4, ShimuraData 8, AbelianSchemesAndArithmeticModuliPartII 2, MotivesAndAlgebraicCycles 4, PadicHodgeTheory 9, CrystallineCohomology 1, DeligneWeightsAndPurity 10, WeilConjectures 2, PadicDifferentialEquationsAndRigidCohomology 1, InverseGaloisAndArithmeticFundamentalGroups 1, EtaleDualityAndPerverseSheaves 1, LefschetzPencilsAndVanishingCycles 6, AlgebraicModuliForArithmeticGeometry 2, AbelianSchemesAndArithmeticModuli 13, Chebotarev 1, ArithmeticGaloisDuality 1, HeightsRationalPointsAndObstructions 2, FaltingsFinitenessAndIsogenyTheorems 2, ReductiveGroups 6, RestrictedPowerSeries 2, ComplexKahlerGeometry 1, SchemeAndStackFoundations 3, ClassicalArithmeticCompletion 3). Contents read and found to say what is attributed for the load-bearing ones: SheafConvolution §3.1 (`χ(H, Ω^q) = (−1)^{n−1−q} d A(n,q)`), §3.3 (weight `−q` with multiplicity `d A(n,q)`), §5.2 (pairs `(1,5), (5,20), (20,76)`), §5.3 (`D_j = binom(a+b,a)/6`, `j ≥ 1`), §6.7, §8.3, §2.4, §0.2; Faltings §R28.5.15 `finite_curves_goodReduction`; Heights §1.6 `finite_quotient_nsmul`, §1.7; AbelianSchemes §§A1.2, A1.8, A3.2, A3.6, A6.14, A6.30–A6.32; Motives §6.8 (affine faithfully flat torsor, finitely presented for finite type); PadicHodgeTheory §5.5, §6.1, §8.1; LPV §§4.4, 5.8, 5.10; DWP §§0.16, 2.2, 4.4, 9.12; WeilConjectures §5.21 in Layer WC.5; PadicDE §RD.7.7; IG.0.T4; EtaleDuality §4.3; Chebotarev Layer 10; ArithmeticGaloisDuality §R02.3.1 (Hermite); AlgebraicModuli §§2.1, 9.4; CrystallineCohomology §CR.7.3. One drifted number (R02).

**Library declarations at the pins** (opened): `TauCeti.Cocharacter.parabolic` (`TauCeti/Algebra/AlgebraicGroup/Dynamic/Parabolic.lean` line 293, namespace `TauCeti.Cocharacter`), `TauCeti.Tannaka.fgPointTensorIsoEquiv` (`.../Representation/Tannaka/Equivalence.lean` line 188), `TauCeti.AlgebraicGeometry.AbelianVariety` (`TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean` line 95), `Ideal.iInf_pow_eq_bot_of_isLocalRing` (`Mathlib/RingTheory/Filtration.lean` line 431), `Finsupp.degree` (`Mathlib/Data/Finsupp/Weight.lean` line 216), `RingTheory.Sequence.IsRegular` (`Mathlib/RingTheory/Regular/RegularSequence.lean` line 146), `MvPolynomial.IsHomogeneous` (`Mathlib/RingTheory/MvPolynomial/Homogeneous.lean` line 46), `MvPolynomial.pderiv` (`Mathlib/Algebra/MvPolynomial/PDeriv.lean` line 61).

**Ownership and duplication.** `eulerian` restates ClassicalArithmeticCompletion §2.18 with the same convention (descents at positions `i` with `i + 1 < n`, `A(0,0) = 1`); that roadmap's `Suggested.lean` declares no Eulerian name, so no fully qualified name is shared, and the restatement is the minimal definition the Layer 8 headline needs. The hypersurface definitions are specialisations of Mathlib carriers. Searching the open heads for a hypersurface parameter space, a Hodge–Deligne system or the Eulerian central mass found no other owner. Ownership against open pull requests whose files the brief does not give was not checked beyond `roadmaps grep`.

**README shape.** Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, Layers 0–10 each ending with Examples and Dependencies, Downstream consumers, Worked examples, Source corrections, References. Every definition (31 counted) has an API list and at least three Checks; every theorem has hypotheses in the sentence and a locator; every target has a `*Needs:*` line. Every backticked own name (`eulerian`, `eulerian_central_mass_le_half`, `HypersurfaceMonomial n d`, `IsSmoothHypersurface`, `HasGoodReductionOutside S F`, `integralHypersurfaces_not_zariskiDense`) is declared in `Suggested.lean`, and every Lean name appears in the README.

**Source manifest.** Five entries, each with the recorded fields; LS, LV, Beauville and BC certified, Serre uncertified by locator (settled). No entry was added or changed.

## Not verifiable

- Serre, *Galois cohomology*, III §4.3 Theorem 4 and I §5.4 Corollary 1 to Proposition 36 (§2.11): uncertified, cited by locator; the finiteness of `H¹(F, H)` for a linear algebraic group over a `p`-adic field is the standard Borel–Serre theorem, consistent with the cited chapter.
- Beauville's Théorèmes 2 and 4 and Batyrev–Cox Theorems 10.6, 10.13 (§§8.6, 9.2) were not in the sample and were not re-read; the Hodge-number formula of §8.6 was checked numerically instead (table).
- The licence class "institutional" of the publisher-formatted LV copy at its recorded host was accepted as the author recorded it; I could not confirm independently that the host is an institutional repository of an author.

## Source issues

- **Error** in LV at §10.2, printed p. 971: the source says the parameter space of degree-`d` hypersurfaces in `ℙⁿ` has dimension `binom(n+d, d−1) − 1`, of order `d^(n+1)`; it should be `binom(n+d, d) − 1`, of order `d^n` (plane quartics: 14, not 19); affects nothing (the limit (10.8) survives).
- **Gap** in LV at Lemma 12.1 and proof, printed pp. 995–996: the source expands the kernel to frequencies `|r| ≤ 2N` and then bounds a sum over `|r| ≤ N` using the point-count estimate only up to `j = N`; it should use the estimate through `j = 2N`, with cutoff `q^{(n/2+1)·2N} < b/3`; affects a stated result (the cutoff in the statement; the conclusion `3b²/N` is unchanged).
- **Misprint** in LV at proof of Lemma 10.4, printed p. 978: the source says Frobenius scales the bilinear form on primitive degree-`d` cohomology by `ℓ`; it should be `ℓ^d`, with eigenvalues paired as `λ ↔ ℓ^d/λ`; affects nothing.
- **Misprint** in LV at Example 4 after Lemma 11.2, printed p. 988: the source says the induced filtration on `f_k/f_{k−1}` is the image of `F^j ∩ f_k` in `f_k/f_{k+1}`; it should be `f_k/f_{k−1}`; affects nothing.
- **Misprint** in LV at proof of Lemma 11.4, printed p. 993: the source says `w` and `w⁻¹` give inverse bijections of the two root sets; it should be `−w` and `−w⁻¹`, as in the statement (iii); affects nothing.
- **Misprint** in LS at proof of Lemma A.4, preprint p. 91: the source propagates the bound as `a_i < 1/(2·3^j)` for all `i > j`; it should be `a_i < 1/(2·3^i)` with `j` the first index below the reference sequence; affects the proof (the displayed tail bound does not follow from the printed inequality).
- **Misprint** in LS at proof of Lemma A.5, preprint p. 91: the source writes the tail comparison with `>` and concludes `Σ k² a_k < 3/2`; it should be `<` (Lemma A.4 bounds the tails above); affects nothing.
- **Gap** in LS at proof of Lemma 8.14, preprint p. 80: the source applies Lemma 8.13 to conjugation by `φ` on the unipotent radical, which need not have finite order there; it should restrict to `Z_U(φ^r)`, which contains `u` because `(uφ)^r = φ^r`; affects the proof.
- **Gap** in LS at proof of Lemma 5.49, preprint pp. 61–62: the source applies LV Lemma 2.3 under the hypothesis that Frobenius eigenvalues are algebraic integers; LV Lemma 2.3 (c) needs integer characteristic polynomials; it should add rationality of the Frobenius polynomials (supplied here by §1.9 for the orbit systems); affects the proof.
- **Error** in LS at Lemma A.1, preprint pp. 89–90: the source asserts `(h⁰ − t)/2 < Σ_{k>0} h^k` for `H` any of `GL`, `GSp`, `GO` and `n ≥ 2`; for `n = 2`, `d = 1` and `H = GO₂` both sides are 0; it should restrict `GSp` to even `n` and `GO` to odd `n` (the geometric cases); affects a stated result.
- **Misprint** in LS at Definition 9.1, preprint p. 85: the source says a hypersurface is primitive if invariant under translation by no `x ∈ A(ℚ̄)`; it should say no nonzero `x`; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "586679c33165c1681ce4f8b675bce3a9c9e89d65", "job": "REV-PKG-MordellLawrenceVenkateshPartII", "model": "fable", "worker": "chris-x19"} -->
