<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/6082#issuecomment-6677965176 -->
Review (claude) of 2675540

Verdict: needs_changes

1. **F01** (P1) `U_exc ∈ V` contradicts the source; the bound 182 should be 183; an unsourced witness

   Location: `packages/LevelOneAutomorphicFormsForClassicalGroups/README.md` lines 1779–1780,
   1790 ("`U_exc ∈ V`: it has `I₂₃` twice, dimension `14` and the simple summand `I₁`"), 1797
   ("`(U_exc, δ = 1, m = 2)` at `ℓ = 31/4` with known classes `1, Δ₂₁, Sym²Δ₁₁, Δ₂₃,₇`"), 1832 ("there
   are at most 182 such classes"), 1840.

   Claim: §5.4 says the residual set `V` has 181 elements, of dimension between 10 and 38, and that
   `U_exc = I₁ + I₇ + I₁₃ + I₁₇ + I₂₁ + 2I₂₃` lies in `V`; §5.5 says the `δ = m = 1` exclusions do
   not remove `U_exc` and excludes two self-dual classes at `U_exc` by a triple at `ℓ = 31/4`; §5.7
   bounds the repeated-top classes by 182.

   Witness: CT20 line 1428–1431 (Proposition 4.1(2): the 181 elements all have `14 ≤ dim U ≤ 42`);
   CT20 line 1502–1504: assertion (1) is deduced from "the fact that `U_exc` is **not** in `V`",
   that is, the `δ = m = 1` exclusion at `U_exc` succeeded; CT20 line 257–264: 182 weights and 183
   putative representations. No `ℓ = 31/4` (nor 7.75) occurs anywhere in CT20. With `|V| = 181`
   and `U_exc ∉ V` the bound is `181 + 2 = 183`; the README's `V` (defined at line 1779 as the 187
   resistant parameters minus the six multiplicity-free ones, as CT20 line 1491–1496) cannot contain
   `U_exc`.

   Repair: in §5.4 replace "of dimension between 10 and 38" by "of dimension between 14 and 42"
   (CT20 line 1431) and the Check at line 1790 by "`U_exc ∉ V`: the `(δ, m) = (1, 1)` triple at
   `U_exc` excludes a self-dual class there, so a singleton fibre at `U_exc` is impossible; `U_exc`
   has dimension 14, the minimum of `V`". In §5.5 delete the `ℓ = 31/4` sentence and argue as CT20
   line 1472–1476 and 1502–1504: `J_{F_ℓ}(U_exc²) > A_{F_ℓ}/3` at `ℓ = 487/50` gives at most two
   classes; `U_exc ∉ V` rules out a self-dual singleton; a fibre of size two is a dual pair by §1.7;
   replace the Check "`U_exc` stays in `V`" by "`U_exc ∉ V`, and that is what excludes a singleton".
   In §5.7 change "at most 182 such classes" to "at most 183 such classes (one at each element of
   `V`, two at `U_exc`)" and the Check at line 1840 to "`|V| = 181` and `U_exc ∉ V`; 182 weights
   carry at most 183 classes". Tested on the instance: with `U_exc ∉ V`, the alternatives of §5.7
   give `181 + 2 = 183`, matching CT20 line 264.

2. **F02** (P2) §2.2 restates the Odlyzko kernel and test function of an earlier roadmap

   Location: README lines 615–640 (§2.2, "Let `u(x) = cos(πx)` … `g = 2(u ∗ u)` … `F_ℓ(x) =
   g(x/ℓ)/cosh(x/2)`", and the claim that `F_ℓ` satisfies (POS)).

   Claim: this roadmap defines `g`, `F_ℓ` and proves (POS) for `F_ℓ`.

   Witness: SmallRamificationAndAbelianVarietyBaseCases (earlier in the merge order) §1.5 defines
   `odlyzkoKernel` as the same `g` with the same convolution square `g = 2(h ∗ h)`, support,
   regularity, positive definiteness and half-line integral `4/π²`; §1.6 proves the strip
   positivity `Re Φ(s) ≥ 0` for `0 ≤ Re s ≤ 1` of `F(x) = f(x)/cosh(x/2)`, which is (POS) for
   `F_ℓ`; §1.7 defines `poitouTestFunction b x = g(x/b)/cosh(x/2)` with its evenness,
   normalization, support, nonnegativity and `C¹` regularity (its `Suggested.lean` lines 83–87).

   Repair: in §2.2 cite SmallRamificationAndAbelianVarietyBaseCases §§1.5–1.7 for `g`
   (`odlyzkoKernel`), `F_ℓ` (`poitouTestFunction` with `b = ℓ`) and (POS); keep here only what that
   roadmap does not state: `G_ℓ`, the `C²` regularity (`g″(±1) = 0`, needed for the admissible
   class of §2.1), the values `F̂_ℓ(i/(4π)) = 8ℓ/π²` (from the half-line integral `4/π²`),
   `Ĝ_ℓ(0) = 8ℓ/π²` and `Ĝ_ℓ(i/(4π))`. Add the supplier to the contracts and to Layer 2's
   Dependencies, and remove "the Odlyzko test functions" from the Scope paragraph (line 27–28).
   Checked on the instance: `∫_0^∞ g = 4/π²` gives `F̂_ℓ(i/(4π)) = ∫ g(x/ℓ) dx = 8ℓ/π²`, the value §2.2
   states (numerically 0.810569 at `ℓ = 1`).

3. **F03** (P2) §4.6 restates the Zassenhaus formula owned by SymplecticReidemeisterTorsionModSquares

   Location: README line 35 ("the Zassenhaus spinor-norm formula it rests on") and lines 1442–1456
   (§4.6, "Prove (CT20 Theorem 3.5 and Corollary 3.6) … the spinor norm of `γ` is the class of
   `disc(q|ker(γ + 1)^{2b}) · Q(−1)`").

   Claim: this roadmap owns and proves the Zassenhaus formula.

   Witness: SymplecticReidemeisterTorsionModSquares (earlier in the merge order) §4.1 states
   `zassenhaus_primary_formula` for every finite-dimensional nondegenerate quadratic space over a
   field with `2` invertible and every isometry `A`: `θ(A) = disc(V₋) · det((1 + A)/2 on U)` with
   `V₋ = ker(A + 1)^N`, `U = im(A + 1)^N`; its `Suggested.lean` lines 41–53 declare it with
   `[Field K] [Invertible (2 : K)]`, `Q.Nondegenerate`, `A : TauCeti.QuadraticMap.orthogonalGroup Q`.
   On `U = ker(γ − 1)^a ⊕ ker Q(γ)` one has `det((1 + γ)/2) = 2^{−deg Q} Q(−1) ≡ Q(−1)` modulo
   squares (`deg Q` even), so this is CT20 Theorem 3.5 in greater generality.

   Repair: in §4.6 import SymplecticReidemeisterTorsionModSquares §4.1 (`zassenhaus_primary_formula`)
   in the supplier contracts and the `*Needs:*` line, and keep as this roadmap's targets only the
   translation `det((1 + γ)/2 | U) ≡ Q(−1)` (with `U = ker(γ + 1)^{2b}`-complement) and Corollary 3.6
   (`disc(q) = Q(1)Q(−1)` when `a = b = 0`); delete the ownership claim at line 35. Tested on the
   instance of §4.6's third Check: `q = x² + y²`, rotation of order four, `V₋ = 0`,
   `det((1 + A)/2) = 1/2 ≡ 2 = Φ₄(−1) = Q(−1)`, the same square class.

4. **F04** (P2) §8.5's stated route uses an unowned input; its `*Needs:*` line omits the other route

   Location: README lines 2561–2566 (§8.5: "whose `O(Leech)`-invariance follows from the average
   `(1/|O(Leech)|) Σ det(t − γ) = t²⁴ + t¹⁶ + t¹² + t⁸ + 1` over Conway's group; another obtains the
   lower bound from §8.8") and the `*Needs:*` line of §8.5 (line 2583), which lists §§6.6–6.7, 8.4
   and the lattice suppliers only.

   Claim: `finrank_invariantAlternatingForms_of_rootless` is provable from the listed inputs.

   Witness: the average characteristic polynomial of `Co₀` is a character-table computation
   (CT19a line 23–26, "[Che], using the character χ₁₀₂ and the power maps of the ATLAS"; CT20
   line 2266–2268) that no layer, supplier section or pinned declaration provides. The only owned
   route is the second one: the upper bound from the `N`-invariants of §8.4 (CT19a line 285–299)
   and the lower bound from §8.8's first route (Böcherer's criterion, §§6.12, 8.7, 7.10), which
   proves `M_{H_{1,g,24}}(O₂₄) ≠ 0`; §8.6 cannot supply the lower bound because its value
   `±n_g e_g` already uses the `O(Leech)`-invariance of `ω_g` (CT19a line 555–560). The
   `*Needs:*` line names neither §8.8 nor an owner of the `Co₀` average.

   Repair: state the route of §8.5 as: upper bound `dim ≤ dim (⋀^g ℚ^Ω)^N ≤ 1` for
   `g ∈ {0, 8, 12, 16, 24}` and `0` otherwise (§8.4); lower bound from §8.8, first route; deduce
   that `ω_g` is `O(Leech)`-invariant and that every element of `O(Leech)` has determinant `1`.
   Demote the `Co₀` average to a remark that the dimensions agree with CT19a formula (1), with
   no proof obligation. Add "§8.8 (first route), hence §§6.12, 7.10, 8.7" to the `*Needs:*` line
   and record in Layer 8's introduction that the Leech statements of §§8.5–8.6 depend on Layer 7.
   Checked for circularity on the instance `g = 24`: §8.8 → §6.12, §8.7, §7.10 → Layers 3–7, none
   of which cites §8.5 or §8.6.

5. **F05** (P2) the gap `integral-spinor-norm-units` asks for the odd primes, which the supplier provides

   Location: README lines 293–296 ("What GeometryOfNumbersAndQuadraticArithmetic must provide
   (gap:integral-spinor-norm-units): for every prime `p`, `p = 2` included, and every regular
   quadratic form `q` on `ℤ_pⁿ` …") and `design/plan.json`, gap `integral-spinor-norm-units`.

   Claim: the whole statement is missing from the supplier.

   Witness: GeometryOfNumbersAndQuadraticArithmetic §2.4.2 (at its head) proves that for a
   nondyadic nonarchimedean local field and a nondegenerate unimodular lattice of rank at least
   two, the spinor-norm image of the proper stabilizer is `R^× K^{×2}`. For `p` odd a regular form
   over `ℤ_p` is unimodular for its polar form (`det(c + cᵀ) = ±1` or `±2`, both units), and in
   rank one `SO(q)` is trivial, so the odd-prime half of the gap is already supplied. Only the
   dyadic case is missing (its §2.4.5 and Check at line 619 of that README treat `ℚ₂` only through
   the spin image and a reflection).

   Repair: narrow the `needs` sentence, in `plan.json` and at README line 293, to "for `p = 2` and
   every regular quadratic form `q` on `ℤ₂ⁿ` (nondegenerate, or of odd rank with unit
   half-discriminant), the spinor norm of every element of `SO(q)(ℤ₂)` lies in the image of
   `ℤ₂^×` in `ℚ₂^×/ℚ₂^{×2}`, proved by lifting to `GSpin(q)(ℤ₂)`", and cite §2.4.2 for `p` odd in
   the `*Needs:*` line of §4.7. Tested on the instance of §4.7's third Check: `q = x₁x₂`,
   `γ = diag(t, t⁻¹)` with `t ∈ ℤ_p^×`, `p` odd: `Q(−1) = (1 + t)²/t` has even valuation, which is
   §2.4.2's unit-class statement.

6. **F06** (P3) a supplier clause that resolves to no section

   Location: README line 333 ("RootSystems: Weyl groups of types `B`, `C`, `D`.").

   Claim: RepresentationTheory/RootSystems supplies the Weyl groups of types `B`, `C`, `D`.

   Witness: RootSystems on main has only "3.2 Type A as a permutation group"; its open pull request
   (Layers 1–5) adds type `A` and `G₂`; no signed-permutation or type `B`/`C`/`D` Weyl group
   appears in either. The clause is used by no `*Needs:*` line. Mathlib at the pin has the Weyl
   group of a root pairing, `RootPairing.weylGroup`
   (`Mathlib/LinearAlgebra/RootSystem/WeylGroup.lean`, line 55).

   Repair: delete the clause, or replace it by "Mathlib `RootPairing.weylGroup`
   (`Mathlib/LinearAlgebra/RootSystem/WeylGroup.lean`) for the Weyl groups entering the character
   formulas of §4.10", which is what §4.10 needs through LieHighestWeight Layer 6.

7. **F07** (P3) the neighbour relation of §6.3 and the two roadmaps named IntegralLattices

   Location: README lines 1964–1968 (§6.3: "`T_p[L] = Σ [L′]` over the even unimodular `L′` with
   `L ∩ L′` of index `p` in both") and lines 319–321 (supplier contract "IntegralLattices Layer 1").

   Claim: the `p`-neighbour relation is defined here; "IntegralLattices" names one roadmap.

   Witness: TauCetiRoadmap/IntegralLattices on main, §4G "Kneser neighbors", defines `p`-neighbours
   by `[L : L ∩ M] = [M : L ∩ M] = p`, proves symmetry, equal determinants, equal genus for
   `p ∤ 2 det L` and the construction from an isotropic vector; the carrier is its Layer 0. The
   Completed roadmap of the same name has the carrier in its Layer 1. The README cites "Layer 1"
   without saying which.

   Repair: cite "IntegralLattices §4G" for the neighbour relation in §6.3's `*Needs:*` line, and
   write the supplier contract as "Completed/IntegralLattices Layer 1 (carrier, Gram matrices,
   isometries) and IntegralLattices §4G (`p`-neighbours)".

Seven findings: one P1 (a Layer 5 statement and three Checks that contradict the cited text),
four P2 (two restated supplier objects, one unowned route input, one non-minimal gap) and two P3
(an unresolvable supplier clause, an uncited neighbour relation). Nothing is false in the Lean
file; the elaboration, the one-tactic probe, the dependency check and the sampled locators pass.
The package is close: every repair below is local.

## Verified sound

**Principles.** No route-specific shortcut (the classifications are stated at the generality
of CT20, and §7.3 keeps "every `k₁`"); no re-planned roadmap (the Siegel operator and the
singular-range statements of §§6.1–6.2 are a move-down from SiegelModularForms, which is an
open draft that cites this roadmap as its supplier at its lines 127, 327, 1288, 1297, 1405 and
2377; the move is recorded here and SiegelModularForms §§2.6, 3.1–3.2 should import them when it
is reviewed); supply runs downward (`depcheck: 242 roadmaps, 2379 edges, 0 problem(s)`, no
UPWARD, CYCLE or `moved:` line); no copied passage; no algorithm (the certified searches are
restated as §§2.16, 5.1, 4.18); no sorry'd data and no `set_option`.

**Elaboration.** `lake env lean` on `Suggested.lean` from the content checkout at the pins:
exactly four `declaration uses 'sorry'` warnings (lines 80, 123, 136, 148), nothing else. The
file uses the `module` / `public import` header, as 26 of the 141 `Suggested.lean` files on
main do. `#check @name` for all eight declarations: every binder of each statement is in its own
signature; no section variable is used, so nothing can be dropped (the signatures agree with the
README statements of §§4.7, 8.5 and 8.6).

**One-tactic probe** (scratch copy, all four sorried theorems, each with `simp`, `rfl`,
`infer_instance`, `aesop`, `grind`, and `ext; simp` or `simp [thetaCoefficient]`): none closes;
`spinor_charpoly_obstruction` and the three Leech theorems are genuine. No declaration restates a
definition, mirrors a Check or computes a value. `invariantAlternatingForms_eq_bot_of_roots_span`
is a short argument but is CT19a Proposition 4.1 itself, the input that makes §8.10 an
isomorphism; it is kept. The three examples of `IsRegularIntegralForm` (hyperbolic plane
regular, `x₁² + x₂²` not, `x₁x₃ + x₂²` regular) close by `simp [Matrix.det_fin_two]`, which
confirms the definition's values.

**Headline theorems.** From the README summary: CT20 Theorems 1–7, Corollary 1, §§5.4–5.5, and
CT19a Theorems 1–2. Stated at the pins: the spinor obstruction (CT20 Proposition 3.7), the
Leech invariant-form dimensions (CT19a (1), Proposition 1.4), the rooted-lattice vanishing (CT19a
Proposition 4.1) and the nonvanishing of the harmonic Leech theta series (CT19a Theorem 2, in
the form "some coefficient is nonzero"). The module docstring names every other headline and
the missing carrier (Siegel modular forms of genus `g ≥ 2` and the Siegel operator; cuspidal
automorphic representations of `GL_m(𝔸)` and Rankin–Selberg `L`-functions; the elliptic part of
Arthur's `L²`-Lefschetz formula; the Leech lattice in Golay coordinates with `M₂₄` and the
sublattices `Q_g`). I confirmed at the pin that Mathlib and Tau Ceti have none of these carriers
(no Siegel modular form, no `GL_n` cuspidal spectrum, no orbital integrals). No statable headline
is absent and none is forced through a stand-in.

**Declarations at the pin** (all opened): `TauCeti.IntegralLattice`
(`LinearAlgebra/IntegralLattice/Basic.lean` line 63: `carrier`, `form`, `isLattice`, `isSymm`,
`le_dual`; no nondegeneracy, as the README says), `IsEven` (`Even.lean` 67), `IsUnimodular`
(`Unimodular.lean` 61), `IsPosDef` (`Signature.lean` 171, an `abbrev` for
`L.form.toQuadraticMap.PosDef`), `norm` (`Norm.lean` 78), `vectorsOfNorm` (`Norm.lean` 221),
`Isometry` (`Isometry/Basic.lean` 77) with `Group (Isometry L L)` (`Isometry/Group.lean` 102);
`TauCeti.BinaryGolay.code`, `finrank_code`, `isTypeII_code`, `weightEnumerator_code`,
`hammingMinDist_code` (`InformationTheory/Coding/Binary/Golay/Basic.lean` 66, 136, 563, 606,
662), `constructionALattice` (`LinearAlgebra/IntegralLattice/ConstructionA/Golay/Basic.lean`
33); `TauCeti.Symplectic.groupScheme` (`Algebra/AlgebraicGroup/Symplectic/Basic.lean` 120),
`pointsMulEquiv` (same file 213), `instSmoothCoordinateHopfAlgebra` (`Symplectic/Smooth.lean`
93); Mathlib `ModularForm.dimension_level_one`
(`NumberTheory/ModularForms/LevelOne/DimensionFormula.lean` 262, even `k`, value
`if k ≡ 2 [MOD 12] then k/12 else k/12 + 1`), `CuspForm.discriminantEquiv` (same file 65),
`IsSelfAdjoint.hasEigenvector_of_isLocalExtrOn` (`Analysis/InnerProductSpace/Rayleigh.lean`
266), `Matrix.toQuadraticForm'` (`LinearAlgebra/QuadraticForm/Basic.lean` 1154),
`PadicInt.Coe.ringHom` (`NumberTheory/Padics/PadicIntegers.lean` 145).

**Supplier citations resolved** (at the open heads or on main, every section opened): AutomorphicFormsOnReductiveGroups §§2.2, 2.4, 2.5 (`recGL`), 3.2, 3.4, 3.5, 4.2, 5.1
(`IsAlgebraicCT` at its line 747), 5.5, 6.7, 6.8, 7.2, 7.2a, 7.4, 7.5; AutomorphicLFunctionsAndLocalFactors Conventions (`Γ_ℂ(s) = 2(2π)^{−s}Γ(s)`), AL.1.4, AL.1.4.3 (`ε(1) = 1`,
`ε(sgn) = i`, `ε(I_w) = i^{w+1}`), AL.3.6.1–3, AL.3.7 (isobaric sums included), AL.3.9.2;
AnalyticNumberTheoryPartI §1.3 (`weil_test_function(c, F)` literally), §1.8;
AutomorphicSpectralTheory §§4.4, 4.5, 4.10, 6.9, 6.17, 6.19, 6.20; ModularityAndLanglandsExtensions
supplier premises (twisted weighted fundamental lemma, trace inputs), §§3.4, 3.8 (sign group
`∏ s_i^{m_ib_i} = 1`, trivial centre for `Sp_{2g}`, so `S_ψ = C_ψ` of §3.2), 3.15, 3.17, 3.20,
3.21, 3.22 (its third Check is the `g = 2` parameter with `π₂(1)`'s infinitesimal character, as
§3.8 says); AutomorphicBundles §§11.1, 11.2, 11.9, 11.16 (`S_a(ω) ⊗ det(ω)^{λ_g}`), 12.10, 12.11,
12.13, 12.15; MetaplecticAutomorphicForms §§0.15, 2.4c, 3.1, 3.4, 3.5, 3.7, 3.10, 3.21, 5.1, 5.6,
6.14; OrthogonalTamagawaAndLatticeMass §§3.1, 4.1, 4.2 (`|O(Leech)| = 8315553613086720000` at its
lines 542 and 549); ComputationalNumberTheory §§4.1–4.7, 4.14–4.17 (the eight scalars in the
README's order, `x_{i,r} = t_i/m_i` at §4.34, `β_ij = (A/m_i)δ_ij − K_ij`), 4.17a, 4.18, 4.26,
4.29–4.34, 5.1; Rank24LatticeConstructions Layer 6; ThetaSeries Layers 1, 5, 8 (Siegel theta
series listed as not owned there); AlgebraicCodingTheory Layer 5; SporadicOrders Layer 1
(`card_M24 = 244823040`); OrthogonalSpinGroups Layer 1 (spinor norm on `O(Q)` over a field);
LieHighestWeight Layer 6; ClassicalGroups Layers 3–5; ReductiveGroups Layer 9; ModularForms
Layers 3–4. The four gaps whose suppliers do not yet state the need (AFRG §§6.8, 7.2a; AST §6.17
has no Gross motive; MLE §3.4 has no `ε(1/2, π × π′) = 1`; MAF §6.14 has no Böcherer) are
declared with the same slugs in `plan.json` (seven gaps) and the README; each `needs` sentence
is single and precise except R05. No roadmap cites a later roadmap as a supplier; the only
citations of SiegelModularForms are under Downstream consumers.

**Ownership.** Searched by object on main and the open pull requests (helpers located, I
read): Stark–Odlyzko cone inequality, Miller's theorem, the masses of torsion classes, the spinor
obstruction, the Leech alternating forms, Böcherer's criterion (SiegelModularForms cites it and
does not use it), the Eichler basis theorem, the Rallis relation, Koike–Terada, level-one Arthur
parameters: owned nowhere else. The two objects that are owned elsewhere are R02 and R03. No
`Suggested.lean` on main or at an open head declares a name in
`TauCetiRoadmap.LevelOneAutomorphicFormsForClassicalGroups`. Ownership against the three board
packages (AnalyticNumberTheory, LawrenceVenkateshMethod, LogicAndDefinabilityInNumberTheory) was
checked by name and object: none overlaps.

**Sampled locators** (all read at the text): 1.2 and 1.4 (CT20 line 562–583: `K∞`, `K∞^{≤w}`,
`Γ(s, I_w) = 2(2π)^{−s−w/2}Γ(s + w/2)`, `ε(I_w) = i^{w+1}`; line 627–628: `I_w I_{w′} =
I_{|w+w′|} + I_{|w−w′|}`, `εI_w = I_w`); 1.7 (CT20 line 203–207, Problem 1 and regularity); 2.1
(CT20 line 636–641 and Definition 2.1 at line 674–675); 2.15 (CT20 Corollary 2.9 at line
845–847, Lemma 2.8 at 806–808, and the embedding at 839–843; see Source issues); 2.16 (CT20
§2.4.4 at line 898–932, Step 4); 3.3 (CT20 (5.1.4) at line 1687–1698 with the Whittaker datum of
Remark 5.1; Tai17 §4.1.2 at line 2397–2407); 3.14 (CT20 (1.4.1) at line 383–392, `A²` with
residual spectrum at line 2377–2383 of Tai17 Theorem 4.1.2); 4.8 (CT20 Definition 3.8 and
Corollary 3.9 at line 1270–1283); 4.15 (CT20 line 1352–1368: 1274 of `Λ_G(36)`, 1810 of
`Λ_G(28)`, 3477 of `Λ_G(63)`, 3461 at 61 insufficient, ranks 992 and 2948); 6.5 (CT20 line
2081–2090; CL14 V §1 at line 5226 defines the filtration `ker ϑ_g` and V §2 at line 5286 computes
it in rank 16); 7.2 (CT20 Key fact 1 at line 216–218 and (5.2.1) at line 1744–1759); 7.5 (CT20
line 1995–2016, with the Zharkovskaya footnote at 2048–2050); 8.1 (CT20 Corollary 5.10 at line
2216–2221); 8.3 (CT19a Fact 1.2 at line 246–248). The locators flagged as carried over from the
design (§7.4's 223/198/199 and 58/59; §5.9's 1260/1256) were re-derived (below) or read (CT20
line 1532–1539).

**Adversarial table** (values computed by me; the sampled targets, the headline theorems and
every target a finding touches).

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| `IsRegularIntegralForm` (§4.7) | `n = 0`; `!![0,1;0,0]`; `!![1,0;0,1]`; `x₁x₃ + x₂²` | `det` of the empty polar matrix `1`; `det(c+cᵀ) = −1, 4, −2` | regular, regular, not, regular; matches CT20 line 1170–1174 (perfect polar form, or odd rank with unit half-discriminant `det/2`); the three nonempty cases close in Lean | none |
| `specialOrthogonalPoints c ℤ_[p]` | `p = 2`, odd and even `n` | `ℤ₂` is a domain with `2 ≠ 0`: Dickson invariant `D` has `det = (−1)^D`, and for odd `n` `O = SO × μ₂` | equals `SO(q)(ℤ_p)` for every `p`, as CT20 Proposition 3.7 needs | none |
| `spinor_charpoly_obstruction` | hyperbolic plane, `γ = diag(t, t⁻¹)`; `SO₃` with `Φ₁Φ₆`, `Φ₁Φ₄`, `Φ₁Φ₃`; `Q` with rational coefficients | `Q(−1) = (1+t)²/t`, `Q(1) = −(1−t)²/t`; `Φ₆(−1) = 3`, `Φ₄(−1) = 2`, `Φ₃(−1) = 1`; the charpoly equation forces `Q` monic integral of degree `n − a − 2b` | true; the conclusion "square of an integer" is CT20 line 1248–1249 | none |
| Index sets `P(G)/∼`, `P₁(G)/∼` (§§4.4, 4.9) | full enumeration of cyclotomic exponent vectors for `Sp₂…Sp₁₆`, `SO₃…SO₁₇` | `Sp: 3, 12, 32, 92, 219, 530, 1158, 2521`; `SO P: 5, 12, 19, 59, 92, 165, 419, 530, 1001, 2257, 2521, 4877`; `P₁: 3, 6, 12, 34, 40, 99, 244, 211, 598, 1339, 992, 2948`; `P(SO₃) = {Φ₁³, Φ₁Φ₂², Φ₁Φ₃, Φ₁Φ₄, Φ₁Φ₆}`, `P(Sp₂)/∼` has 3 classes | all README values confirmed; `Sp₁₄` is 1158 (CT20 Table 2 and line 1349, 1358 print 1157) | none |
| Eigenparameters in weight `≤ 13`, `k_g > g` (§§7.4, 7.8, 7.9) | enumeration of all `ψ` with blocks in `L₂₄`, distinct weights `0, ±(k_i − i)`, `k₁ ≤ 13`, then (5.1.4) with (5.2.1) and `ε_ψ` from (5.1.2)–(5.1.3) | candidates: 224 with `Δ₂₃^a ≠ Δ₂₃^b` and genus 0 included (223 in positive genus), 199 shapes (198 in positive genus); passing: 59 (58 in positive genus), 29 scalar and 29 nonscalar; the 58 `(g, k, ψ)` coincide one by one with the 29 rows of §7.8 and the 29 regular rows of §7.9 | confirmed; CT20's "199 … 59" at line 1969–1971 includes genus zero although line 1962 says `1 ≤ g ≤ 12` | none |
| `ε_ψ`, pair root numbers (§§1.8, 3.2) | inside the enumeration: `ε(I_a I_b) = i^{a+b+1} i^{|a−b|+1}`, `I₀ = 1 + e`, `ε(e) = i`; `Δ₁₁ × Δ₁₅`, `Δ₁₇ × 1`, `Δ_w[2] ⊕ [1]` | `i²⁷·i⁵ = 1`; `i¹⁸ = −1`; Saito–Kurokawa passes exactly for even `k` (rows `(2,10)` and `(2,12)` pass, `k = 11` has no row) | consistent with §3.3's Check | none |
| SO₃ calibration (§4.12) | exact 5×5 system | matrix rows `(1,1,1,1,1), (3,−1,0,1,2), (5,1,−1,−1,1), (7,−1,1,−1,−1), (9,1,0,1,−2)`, `det = 288`, solution `(−1/12, 1/4, 1/3, 0, 0)`; `dim S₂…S₁₀ = 0`, `S₁₂ = 1`, `S₂₄ = 2` | consistent with Mathlib's formula | none |
| Odlyzko functions (§2.2) | `ℓ = 1, 5/2`, numerical quadrature | `F̂_ℓ(i/(4π)) = 0.810569 = 8ℓ/π²`; `Ĝ_ℓ(0) = 8ℓ/π²`; `Ĝ_ℓ(i/(4π)) = 0.820215 = 4π²ℓ(1+cosh(ℓ/2))/(ℓ²/4+π²)²`; `g(0) = 1`; `g″(1⁻) ≈ 0`; `Ĝ_1(ξ) ≥ 0` at `ξ = 0, 0.3, 0.7, 1.3` | as stated (CT20 Proposition 4.4 at line 1557–1562; CL14 Proposition 3.17 at line 11662–11672) | R02 (ownership only) |
| Compression (§2.15) | `A_F = 1`, kernel `1`, one block of size two | expanded `β = [[0,−1],[−1,0]]`, minimum `−1` on the unit cone; compressed `1/2 − 1 = −1/2`; with the lift `x = t/m`, `q_exp(x) = Σ t_l² A/m_l − Σ t_l t_k K_lk = q_comp(t)`; with `1/√m`, `q_exp = A − mK` | the README's "negativity agrees, minima differ" is right and CT20's "`μ_Q = μ_{Q′}`" is not (Source issues) | none |
| Explicit formula factor `1/2` (§2.6) | `π = π′ = 1` | `(2.3.5)` at CT20 line 667: `B_f + B∞ + ½Z = F̂(i/4π)δ` | as stated | none |
| (POS), cone inequality (§§2.1, 2.7) | zero `ρ`, `0 ≤ Re ρ ≤ 1` | `Im ξ = −(1 − 2Re ρ)/(4π) ∈ [−1/(4π), 1/(4π)]` | matches Definition 2.1 and the proof at CT20 line 684–695 | none |
| Lowest-weight existence (§3.4) | `g = 1, k = 0`; `(1,1)`; `(1,0,0)`; `(12)^{12}`; `(13)^{24}` | `0 ≥ 0`; `1 ≥ 0`; `0 ≥ 1/2` false; `12 ≥ 0`; `13 ≥ 0` | exists, exists, does not, exists, exists | none |
| Koike–Terada (§4.10) | `Sp₂, λ = (2)`; `SO₃, λ = (2)` | `e₁² − e₂ = x² + 1 + x⁻²`; `e₁² − e₂ − 1 = x² + x + 1 + x⁻¹ + x⁻²`, `5` at the identity | correct | none |
| Refined tables (§4.15) and coarse tables (§4.13) | CT20 Table 4 and line 1348–1365 | `SO₁₅: 1339 / 1924 at w = 35`; `Sp₁₄: 974 rows at w = 90`; refined `1274 (≤36), 1810 (≤28), 3477 (≤63)`, `3461` at `61` fails | as stated | none |
| Weight-23 residuals (§§5.4–5.7) | CT20 line 1424–1507 | `ℓ = 9.74 = 487/50`; 187 resistant, 6 multiplicity-free, `|V| = 181`; `U_exc ∉ V` (line 1503); dimensions `14 ≤ dim ≤ 42` (line 1431); bound `181 + 2 = 183` (line 264) | README says `U_exc ∈ V`, `10–38`, `182`, and cites an `ℓ = 31/4` witness absent from the text | R01 |
| Weight 24 (§§5.9–5.10) | CT20 line 1519–1547 | four survivors of ranks 13, 13, 16, 16; 1260 enumerated, 1256 excluded; 16 classes in 15 blocks | as stated | none |
| Case (I) and (H2) (§§7.5, 7.7) | `Δ₁₁[12] ⊕ [1]` at `g = k = 12`; `(16, 13)`; `(24, 13)`; rejected `Δ₂₁[4] ⊕ Δ₁₁[6] ⊕ [5] ⊕ [3] ⊕ [1]` | `χ(s) = (−1)^{24/4} = 1 = ε(Δ₁₁)`; weights `±12…±5, ±3, ±2, ±1, 0, 0` omit `±4 = ±(g − k + 1)`; at the `Δ₁₁[d]` generator `χ = (−1)^{d/2} = −1 ≠ 1` | matches CT20 line 2113–2206 | none |
| Böcherer orders (§8.7) | all five `(g, n, ν)` by hand: zeros of `ζ(n − 2i)`, poles of `Γ(k − (g+1)/2 − i/2)`, `Λ_A` and `Γ_A` from the parameters | `(0,0,0,−1,1)`, `(0,0,0,0,0)`, `(0,0,0,−1,1)`, `(0,−4,−4,−1,9)`, `(0,−12,−12,−1,25)`; `g = 24`: `Γ_A` has `13 + 12 = 25` poles at `s = −12` | matches BoechererNote line 94–118 and page 2 | none |
| Leech dimensions (§8.5, Lean) | `g = 0`; `g = 24`; `g = 25`; `g = 1` | constants, dimension 1; the determinant (needs `det = 1` on `O(Leech)`); `⋀^{25}` of a 24-space is `0`, `if` gives `0`; coefficient of `t²³` in `t²⁴ + t¹⁶ + t¹² + t⁸ + 1` is `0` | statement true for Leech, unique rootless class by OTLM §4.2; the route's inputs are the issue | R04 |
| `M₂₄` average (§8.4) | coefficient of `t^{24−g}` is `(−1)^g dim (⋀^g)^{M₂₄}` | `t¹⁶, t¹², t⁸ ↦ +2` (two orientable orbits of sizes 8, 12, 16); `t²³, t¹⁷, …, t ↦ −1`; `t²⁴, 1 ↦ +1` | matches Fact 1.1 (CT19a line 212–213) and Lemma 1.3's list | none |
| Rooted lattices (§8.5, Lean) | rank 0; `ℤx` with `x·x = 2`; reflection `s_x(y) = y − (x·y)x` | `span ∅ = ⊤` in rank 0 and every `g ≥ 1` form is `0`; `s_x ∈ O(L)` since `x·y ∈ ℤ`; `ω(s x₁, …) = −ω(x₁, …)` | true at the generality of CT19a Proposition 4.1 (line 1052–1058) | none |
| `thetaCoefficient` (§8.6, Lean) | `g = 24`, `T = Gram(u)` for a basis `u`; indefinite `L` | summation set `{γu : γ ∈ O(Leech)}`, value `±|O(Leech)|`; for indefinite `L` the support may be infinite and `finsum` is `0` (junk), excluded by `hpos` | consistent; `e₈ = e₁₆ = 5`, `e₁₂ = 18`, `e₂₄ = 1`, `κ₁₂ = 3`, `κ₁₆ = 10` as CT19a line 105–115 | none |
| Degree rule and distribution (§6.8) | CL14 Table V.1 (line 5371–5376) | degrees `0,1,2,3,4,4,5,5,6,6,6,7,8,7,8,7,8,8,9,9,10,10,11,12`, distribution `(1,1,1,1,2,2,3,3,4,2,2,1,1)`, cumulative `1,2,3,4,6,8,11,14,18,20,22,23,24` | as stated | none |
| Rallis relation (§6.9) | `n = 8`, `v = [E₈]`, `g = 8` | `[7] ⊕ [1] ⊕ [9]` has dimension `17 = 2g + 1`; with the degree `g₀ = 0` the block would have length `−9` | the README's "actual genus" is right; CT20 line 2090 prints `g₀` (Source issues) | none |
| Stable range (§§8.11–8.14) | `k = 2`; `k = 0`; `(5.5.1)` | `(−1)^{k/2} = −1 ≠ 1`; `d_i ≤ k < 2(g′ − k) + 1` for even `d_i` | matches CT20 line 2292–2330 | none |
| Miller (§2.19) | ranks | `2n + 2 ≤ 26`, `2n + 1 ≤ 25`; Mil02 Theorem 1.6 at line 137–139: `1 < n < 27` | consistent | none |
| `PGL₄` vanishing (§2.21) | `w = 23, 53` | `dim S₂₄ = 2`, `dim S₅₄ = dim M₄₂ = 4`; 27 odd `w ≤ 53`; CT20 line 1037–1043: `ℓ = 5`, `S′ = S` | as stated | none |
| Gap minimality (R05) | `p` odd, regular `q`, rank `≥ 2` | GeometryOfNumbers §2.4.2 gives image `R^×K^{×2}` | odd primes already supplied | R05 |

**Shape and style.** 110 subsections, each with a `*Needs:*` line and a `**Checks.**` block of at
least three bullets (minimum three, counted); eight layers each ending with `### Examples` and
`### Dependencies`; Summary, Scope and ownership, Conventions, Exact supplier contracts, How to
read the build, Downstream consumers, Worked examples, References present; no LaTeX delimiters,
no pull-request numbers, dates, paths or process words; no `lemma`, `set_option`, `#eval` in the
Lean file; every backticked name attributed to this roadmap (`IsRegularIntegralForm`,
`specialOrthogonalPoints`, `spinor_charpoly_obstruction`, `invariantAlternatingForms`,
`thetaCoefficient`, the three Leech theorems) is declared in `Suggested.lean`; every cited work is
in `sources.toml` with its locator.

## Not verifiable

- KT87 (Koike–Terada) is `uncertified` (paywalled); §4.10's determinantal formulas were checked
  only on the two small cases above.
- The contents of the authors' data archive [CT19b]: the 181 elements of `V`, the 12106 and 1256
  exclusion triples, the 1274/1810/3477 weight sets and the mass tables of §4.18 are cited
  through CT20's statements and cannot be re-derived from the texts; the counts of §7.4 were
  re-derived independently (above).
- Originals cited only through CT20 or CL14: Weissauer's Satz 3, Resnikoff, Freitag 1975/1977,
  Zharkovskaya, Rallis, Mœglin–Waldspurger, Mœglin–Renard, Gross's motive theorem, Böcherer 1989
  Theorem 5, Chenevier's `Co₀` computation [Che].
- The published (IHÉS) numbering of CT20 was not opened; the package cites the HAL version and
  says so.
- Ownership against open pull requests whose files the brief does not give was not checked
  beyond the `roadmaps grep` index.

## Source issues

- **Error** in CT20 at Corollary 2.9 and the embedding before it, printed pp. 20–21: the source says the compression `e_l ↦ (1/√m_l) Σ e_i` is an isometry for `β` and that the compressed and expanded minima coincide when negative; it should say only that negativity is preserved (the quadratic values agree under the lift `t_l/m_l`, not under `1/√m_l`; minima `−1` versus `−1/2` in the two-element example); affects a stated result (the equality `μ_Q = μ_{Q′}`), not the proofs that use it.
- **Misprint** in CT20 at §2.4.5, Output, printed p. 23: the source says the combination with coefficients `1/√m_j` satisfies `C^F(x,x) ≤ β_Q(t,t)`; it should use coefficients `1/m_j`, for which the two sides are equal; affects the proof (the conclusion survives with the corrected lift).
- **Misprint** in CT20 at §1.4 after (1.4.5), printed p. 11: the source says Siegel's rationality of Artin `L`-values at non-negative integers; it should say at non-positive integers (the values `ζ(−1)` and its Artin analogues enter the volumes); affects nothing.
- **Misprint** in CT20 at Table 2 and §3.3, printed pp. 28, 33: the source says `|P(Sp₁₄)/∼| = 1157`; it should be 1158 by enumeration of the exponent vectors of degree 14 modulo negation; affects nothing (the 1274 rows have rank 1158).
- **Misprint** in CT20 at §4.1, printed p. 36: the source says `U₁` consists of the `U` with `B∞(U,U) ≤ F̂_ℓ(i/π)` and has 12230 elements while 12293 − 187 triples are listed; it should say `F̂_ℓ(i/4π)` and one of the two cardinalities is wrong; affects nothing.
- **Misprint** in CT20 at §4.3, proof of Theorem 4, printed p. 38: the source says Algorithm 2.4.5 is applied with `δ = m = 2`; it should say `δ = 0`, `m = 2` (`δ` takes the values 0 and 1); affects nothing.
- **Misprint** in CT20 at §5.3.1, printed p. 48: the source says the 199 parameters and 59 eigenparameters are for `1 ≤ g ≤ 12`; the counts include the genus-zero parameter `[1]` (198 and 58 in positive genus); affects nothing.
- **Error** in CT20 at §5.3.2, the Rallis relation after (5.3.1), printed p. 51: the source says `ψ_G = ψ_F ⊕ [n − 2g₀ − 1]` for `n > 2g₀ + 1` and `ψ_F = ψ_G ⊕ [2g₀ + 1 − n]` otherwise, with `g₀` the degree; it should use the genus `g` of `F = ϑ_g(G)` (for `G = [E₈]`, `g₀ = 0`, `g = 8`, the parameter of `ϑ₈[E₈]` has dimension 17, not 1), as Lemma 5.7 does; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "267554043e8c1fd3d4b68638f68981850e2b2b8d", "job": "REV-PKG-LevelOneAutomorphicFormsForClassicalGroups", "model": "fable", "worker": "chris-x9"} -->
