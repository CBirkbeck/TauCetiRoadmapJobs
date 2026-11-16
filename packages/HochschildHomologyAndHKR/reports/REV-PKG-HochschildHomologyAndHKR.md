<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17976#issuecomment-6906112355 -->
Review (claude) of e45a03c

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) Two homology headlines are statable on the pinned normalised chains but are declared not statable

   **Location.** `packages/HochschildHomologyAndHKR/Suggested.lean`, module docstring, lines 37–44:
   "`HHₙ(A, M) ≅ Torₙ^{Aᵉ}(M, A)` … the low-degree identification `HH₁(R, R) ≅ Ω¹_{R/k}` (§3.4) and
   the homology half of the polynomial computation (§8.4): the pins have no Hochschild chain complex
   with bimodule coefficients".

   **Claim.** The reason given covers `Tor` (arbitrary bimodule `M`, and no `Tor` over `Aᵉ`), but not
   the other two headlines: both have coefficients in `R` itself, and the pin has that complex.

   **Witness.** `TauCeti/RingTheory/CyclicCohomology/Normalized/Chains.lean:361`,
   `TauCeti.normalizedHochschildChains.chainComplex : ChainComplex (ModuleCat R) ℕ`. README §2.1
   (last API bullet) proves `N_•(A,A) ≅` this complex and `C_•(A,A) ≃ N_•(A,A)`, so its homology is
   `HH_n(R,R)` by this roadmap's own targets.

   **Repair (elaborated at the pins on a scratch copy; `sorry` the only warning).**

   1. In `Suggested.lean`, add the import `TauCeti.RingTheory.CyclicCohomology.Normalized.Chains` after
      the existing `TauCeti` import, and add, in README order (a `## Layer 3` section before Layer 4,
      and a `## Layer 8` section at the end), each with a docstring stating the mathematics:

      ```lean
      theorem nonempty_linearEquiv_homology_one_kaehler (k R : Type u) [CommRing k] [CommRing R]
          [Algebra k R] :
          Nonempty (((TauCeti.normalizedHochschildChains.chainComplex k R).homology 1) ≃ₗ[k]
            Ω[R⁄k]) := by
        sorry

      theorem nonempty_linearEquiv_homology_mvPolynomial (k : Type u) [CommRing k] (m n : ℕ) :
          Nonempty (((TauCeti.normalizedHochschildChains.chainComplex k
              (MvPolynomial (Fin m) k)).homology n) ≃ₗ[k]
            ⋀[MvPolynomial (Fin m) k]^n Ω[MvPolynomial (Fin m) k⁄k]) := by
        sorry
      ```

      Values checked on both: `k = 0` gives `0 ≅ 0`; `R = k` gives `N₁ = (k ⊗ k)/(k ⊗ 1) = 0 = Ω¹`;
      `m = 0`: `H₀ = k = ⋀⁰`, `H_n = 0 = ⋀ⁿ 0` for `n ≥ 1`; `m = 1`: `H₁ ≅ k[x] ≅ k[x] dx`, `H₂ = 0 = ⋀² `
      of a rank-one module. Neither closes with `simp`, `rfl` or `infer_instance`.
   2. In the module docstring, move these two items to "Stated here", saying they are stated on the
      pinned normalised chains with coefficients in `R`, which §2.1 identifies with `N_•(R,R)`; keep
      `HHₙ(A,M) ≅ Torₙ` under "not statable" with its present reason.
   3. In the README, name the two declarations where they are proved (§3.4 and §8.4, one clause each,
      as §4.4 does for `nonempty_linearEquiv_ext`), add §2.1 and
      `TauCeti.normalizedHochschildChains.chainComplex` to the route of the stated forms, and add the
      chains to the Conventions bullet on the carriers of `Suggested.lean`.

   If the author holds that a statement on the normalised model is not the headline, the alternative
   repair is to replace the reason in the docstring by the true one for these two items (the
   unnormalised `C_•(R,R)` is absent; the normalised one is present); the present sentence is not
   accurate for coefficients in `R` either way.

One finding (R01, P2). Everything else I checked held: the elaboration passes with `sorry` as the
only warning, the dependency check is clean, no theorem of `Suggested.lean` is padding, every cited
supplier section and library declaration I opened exists where it is cited, and the sampled
locators support the statements. No previous review of the package exists and no maintainer notes
were given.

## Verified sound

**Elaboration and gates.** `lake env lean` on `packages/HochschildHomologyAndHKR/Suggested.lean`:
five `declaration uses sorry` warnings (lines 106, 136, 173, 187, 204), nothing else. No
`set_option`, no sorried data, no `lemma`, `import Mathlib` plus one `TauCeti` module that the file
uses. Dependency check output: `depcheck: 241 roadmaps, 2256 edges, 0 problem(s)` (no UPWARD, CYCLE
or `moved:` line; the roadmap sits directly after RefinedTraceMethods in the merge order).

**Signatures.** The 11 elaborated types of `scratch/signatures.md` compared with the README
statements (§1.2, §4.4, §5.1, §6.2, §7.5, §7.6): every binder the statement needs is in the
declaration's own signature (`SMulCommClass A Aᵐᵒᵖ M` and `Module.Projective k A` on the `Ext`
theorem; `Algebra.Smooth k R`, `Module.Projective k R`, `IsCentralScalar R M` on the HKR
theorems); README generality equals the Lean generality in each. All 11 Lean names occur in the
README, and the README attributes no other backticked name to this roadmap.

**Padding probe (all 5 sorried theorems, not a sample).** Each tried with `simp`, `rfl` and
`infer_instance` on scratch copies: 15 of 15 attempts left the goal open. The two proved
`example`s test the argument order of `cupProduct` (built from `domCoprod` and `finSumFinEquiv`)
and the row/column convention of `detCochain`; I read them as the permitted handful of tests of a
kept definition, not as padding.

**Headline theorems.** Cohomological HKR (§7.6(1), (2)), the `n!` class identity (§7.5),
`HHⁿ ≅ Extⁿ` (§4.4) and graded commutativity (§6.2) are stated. `HHₙ ≅ Torₙ` (no `Tor` over a
noncommutative ring: Mathlib's is `Mathlib/CategoryTheory/Monoidal/Tor.lean:44`), the normalisation
theorem with bimodule coefficients, cup = Yoneda and the `HH²` classification are named in the
docstring with a carrier that is indeed absent at the pin. The two exceptions are R01.

**Adversarial table (sampled targets, headlines, the target R01 touches).**

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 1.2 coboundary, `Zⁿ`, `Bⁿ`, `HHⁿ` | `A = M = k`; `Mat₂(ℤ)`, `m = E₁₁`, `a = E₁₂`, `b = E₂₂` | `δ : Cⁿ → Cⁿ⁺¹` is `Σ_{i=0}^{n+1}(−1)^i` = 1 (n odd), 0 (n even), so `HH⁰ = k`, `HHⁿ = 0`; wrong last sign gives `δδm(a,b) = 2(mab − amb) = 2E₁₂` | holds |
| 1.3 functoriality | `φ = id`; composite `A → B → C` | chain map `n ⊗ a ↦ n ⊗ φ(a)` commutes with `d₀` and `d_n` because `φ*N` acts through `φ`; `id ↦ id` | holds |
| 2.2 normalised cochains | derivation `D`; `g(1) = 1`, `g(x^j) = 0` on `k[x]` | `D(1) = 2D(1) = 0`; `δg(1,1) = 1·g(1) − g(1) + g(1)·1 = 1`, not normalised, class 0 | holds |
| 3.1 `HH₀ = M/[A,M]` | `Mat₂(k)`; commutative `A`; `Mat₀` | `b(E₁₂ ⊗ E₂₁) = E₁₁ − E₂₂`, `E₁₂ = [E₁₂,E₂₂]`: commutators = trace 0, quotient `k`; `[A,M] = 0`; zero ring gives 0 | holds |
| 3.3 `HH¹ = Der/Inn` | `k[x]`; `Mat₂`, `δE₁₁(E₁₂)`; Ginzburg's `ad m` | `Inn = 0`, `Der ≅ k[x]`; `E₁₂E₁₁ − E₁₁E₁₂ = −E₁₂`; `ad m (a) = ma − am = −δm(a)` | holds |
| 3.4 `HH₁(R,R) ≅ Ω¹` | `k[x]/(x²)` over `𝔽₂`, `ℚ`; `ℤ → 𝔽_p`; `R = k` | `R dx/(2x dx)`: dim 2, dim 1; `b₂ = 1` onto `C₁ = 𝔽_p`, so 0 = `Ω¹`; 0 = 0 | holds |
| 3.5 unit of `A ⊕_f M` | cocycle identity at `(1,1,a)`, `(a,1,1)`; `f(x,x²) = 1` on `k[x]` | `f(1,a) = f(1,1)a`, so `(1,u)(a,m) = (a, m + ua + f(1,a))` needs `u = −f(1,1)`; `δf(x,x,x) = 1`, products `(x³,0) ≠ (x³,1)` | holds |
| 4.1 `Aᵉ`-module convention | `Mat₂(k)` | `(E₁₂ ⊗ op E₂₁)·E₂₂ = E₁₂E₂₂E₂₁ = E₁₁`; reversed order gives 0; right structure `b m a` agrees with Ginz05 line 966 | holds |
| 4.4 `nonempty_linearEquiv_ext` | `A = k = M`; `A = 0`; `k`-action | `HH⁰ = k`, `HHⁿ = 0` = `Extⁿ_k(k,k)`; all 0; `algebraMap k Aᵉ c` acts on `M` as `c •` by the scalar towers | holds |
| 4.5 flatness needed | `k = ℤ`, `A = ℤ[x]/(px)`, `M = 𝔽_p` | `Ā = x𝔽_p[x]`, `HH₂ = 0`; in `Aᵉ`: `ann(x−y) = pℤ`, `ann(p) = (x,y)`, all differentials 0 after `𝔽_p ⊗`, `Tor₂ = 𝔽_p` | holds |
| 5.1 `cupProduct` | `k[x,y]`; degree `(0,0)` | `(∂_x ∪ ∂_y)(x,y) = 1`, `(∂_y ∪ ∂_x)(x,y) = 0`; product of `A` | holds |
| 5.2 Leibniz | `f, g ∈ C¹`; `f = ∂`, `g = id` on `k[x]` | both sides `a f(b)g(c) − f(ab)g(c) + f(a)g(bc) − f(a)g(b)c`; `δ(∂ ∪ id)(a,b,c) = −∂a·bc = −(∂ ∪ δ id)`, sign `(−1)^p` confirmed | holds |
| 5.4 cup = Yoneda | lift `f̃_i`, `p = 1`; `q = 0` | `f̃_q ≫ g = (−1)^{pq} a₀ f(…) g(…) a_{p+q+1}`; `q = 0` is `extMk_comp_mk₀`, `s(p,0) = 1` | consistent; `s(p,q)` for `q ≥ 1` see Not verifiable |
| 6.2 homotopy formula, `cupProduct_graded_comm` | `(1,1)` general cochains; `(0,1)`; `(0,0)`, `(1,0)` cocycles; Gerstenhaber's Theorem 3 form | `δf∘g − δ(f∘g) + f∘δg = g∪f + f∪g` (all 12 terms expanded); `δx∘g = g(a)x − x g(a)`; `gf − fg = 0 ∈ B⁰`; `y f(a) − f(a) y = 0`; rewriting `f∘δg − δ(f∘g) + (−1)^{q−1}δf∘g = (−1)^{q−1}(g∪f − (−1)^{pq}f∪g)` gives the README's signs | holds |
| 6.3 chains of a flat algebra | `k = ℤ`, `A = 𝔽_p` | classical `HH₂ = 0` (complex `𝔽_p` with `b_n` = 1, 0 alternately); derived `HH₂ = 𝔽_p` in RefinedTraceMethods §1.10 | holds; `ν_n` see Not verifiable |
| 7.1 duality | symmetric `M`; non-symmetric bimodule on `k[x]` | `(f∘b)(r₀ ⊗ … ⊗ r_{n+1}) = r₀ δf(r₁,…,r_{n+1})` using `r_{n+1} r₀ f = r₀ f r_{n+1}`; `δm(x) = m ≠ 0` while `b₁ = 0` | holds |
| 7.2 (HKR62 Lemma 4.1) | `ℚ[x]/(x²)`, `M = ℚ` | `HH₁ = R/(x)`, `HH₂ = xR`, `HH²(R,ℚ) = ℚ = Hom_R(xR,ℚ)`, `h₂ = 0` | holds |
| 7.3 `pairingDual` bijective | `P = R²`; `P = 0`; pin | `(e₁* ∧ e₂*)(e₁ ∧ e₂) = 1`; pinned formula `det(of fun i j ↦ f j (v i))` | holds |
| 7.4 `τ_n` | `k[x,y]`; `𝔽₂(u)[a]/(a² − u)` | `τ₂(∂_x ∧ ∂_y)(dx ∧ dy) = 1`; `Der = R·∂`, `T² = 0` | holds |
| 7.5 `detCochain_sub_factorial_smul_cupDerivations_mem` | `n = 0, 1, 2`; `𝔽₂[x,y]` | `1 − 1 = 0 ∈ B⁰`; `D − D = 0`; `det − 2 D₁∪D₂ = −(D₁∪D₂ + D₂∪D₁) = δ(D₂∘D₁)`; pairing with `ε(dx∧dy)`: 2 and 1 | holds |
| 7.6 `cohomological_hkr_hom_kaehler` | `n = 0`; `n = 1`; `R = k`; `k = 0`; `ℤ → ℤ[1/2]` | `e(m)(1) = m`; `e[D](dr) = D r`; `HHⁿ(k,M) = 0 = Hom(⋀ⁿ 0, M)`; `0 ≅ 0`; excluded by `Module.Projective`, conclusion still holds there | holds (through the declared gap) |
| 7.6 `cohomological_hkr` | `n = 0`; `𝔽₂[x,y]`, `n = 2`; `k[x]`, `n = 2`; inseparable field | `r ↦ [r]` on `R = HH⁰`; `Ψ₂(∂_x∧∂_y)` pairs to 1, determinant class `2Ψ₂ = 0`; `[∂∪∂] = 0` since `∂∪∂ = −δ(∂^{[2]})`, value 1 at `(x,x)` on both sides; `T² = 0`, `HH² = R/(2a) = R ≠ 0` | holds |
| 8.3 `ι` (touches 8.4) | `j = 2` | `b′ι(e₁∧e₂) = X₁⊗X₂⊗1 + 1⊗X₁⊗X₂ − X₂⊗X₁⊗1 − 1⊗X₂⊗X₁ = t₁(1⊗X₂⊗1) − t₂(1⊗X₁⊗1)` | holds |
| R01 repair statements | `k = 0`; `R = k`; `m = 0, 1` | see R01 | hold |

**Sources (the seeded sample and every further locator I opened).** Read at the cited lines:
Ginz05 lines 96–97, 398–411, 747–782, 934–976, 984–988, 1001–1004, 1028–1030, 1033–1062, 1066–1069,
1075–1111, 1120–1128, 1130–1140, 1335–1380, 1914–1926, 2086, 2101–2166, 2187–2197; HKR62 lines 210,
268–279, 284–364, 410–431, 444–447, 479–495, 509–582; AV20 lines 70 and 237–243; StacksSmooth
Tags 00T2 and 00TN. Each supports the statement at the generality the README attributes to it; the
README marks where a source is narrower (Ginzburg's ground field, HKR62's perfect field and
`K`-projective hypothesis) and where it departs from a source (Ginz05 (6.6.3), confirmed below).
All nine cited works are in `sources.toml`, one key each; nothing was added.

**Library declarations opened at the pins.** Tau Ceti:
`RingTheory/HochschildCohomology/Coboundary.lean:226, 282, 303, 318, 345, 351, 359, 371, 382`;
`…/Complex.lean:79, 91, 137, 166, 190`; `…/Dual.lean:138`;
`RingTheory/CyclicCohomology/Normalized/Chains.lean:53, 69, 242, 250, 361`;
`LinearAlgebra/ExteriorPower/Basic.lean:145`; `Algebra/Homology/Ext/ProjectiveResolution.lean:107`;
`RingTheory/MvPolynomial/RegularSequence.lean:44`; `RingTheory/Derivation/Bimodule.lean:41`.
Mathlib: `RingTheory/Smooth/Basic.lean:71`; `Algebra/Module/Opposite.lean:32`;
`RingTheory/Flat/Basic.lean:121, 173, 182, 234`; `CategoryTheory/Abelian/Projective/Ext.lean:286`;
`RepresentationTheory/Homological/GroupHomology/Basic.lean:97`;
`…/GroupCohomology/Basic.lean:202`; and by `#check` in a scratch file: `Module.Flat.instTensorProduct`,
`exteriorPower.pairingDual_ιMulti_ιMulti`, `exteriorPower.bijective_pairingDual`,
`instModuleTensorProductMop`, `ModuleCat.Algebra.instLinear`, `Abelian.Ext.linearEquiv₀`,
`ProjectiveResolution.extLinearEquivCohomologyClass`,
`DoldKan.homotopyEquivNormalizedMooreComplexAlternatingFaceMapComplex`,
`KaehlerDifferential.mvPolynomialBasis`, `ComplexShape.embeddingDownNat`,
`ModuleCat.projective_of_categoryTheory_projective`, `Derivation.instModule`,
`Functor.leftDerivedZeroIsoSelf`, `MvPolynomial.span_X_image_eq_ker_aeval_ite_mem`,
`LinearEquiv.isWeaklyRegular_congr'`. A script resolved the other backticked library names of the
README (368 identifiers) against the declaration names of both pins; none was missing. The absence
claims hold: no Hochschild complex, Koszul complex or projectivity instance for exterior powers in
the pinned Mathlib; no cohomology or codegeneracies for the bimodule coboundary in Tau Ceti.

**Cross-roadmap citations resolved.** On main: DGAInfinity Layers 0, 1, 8; DerivedModuleAlgebra
§0.K.1 and §0.5; NoncommutativeGeometry N1 and N1.Cyclic; BanachAlgebras Layer 6;
ZigzagPreprojective Layer 7; IntegralIwasawaTheory §12.6; DerivedDeRhamCohomology Layer 2. At open
heads: RefinedTraceMethods §1.1 (the target on the cyclic enhancement), §1.9 (the target on the
antisymmetrisation map and the projection), §1.10; KTheoryFiniteLocalFields §4.0 (Cyclic homology
foundations, with the `HH₀` check and the smooth HKR comparison); EulerSystemsAndKolyvaginSystems
§6.1; LanglandsParameterStacks §1.17. Each exists and says what the README assumes of it. The lead
of `scratch/citations.md` (`TauCeti.StarkSystems.toExteriorBidual`) is IntegralIwasawaTheory §12.6's
name, cited as such: no defect.

**Declared gap.** `gap:smooth-hkr-antisymmetrisation`: same slug in `design/plan.json` and under
the RefinedTraceMethods contract; supplier named; one precise sentence. It is not already provided:
RefinedTraceMethods §1.9 at its head proves `π_n ε_n = n!`, the degree-one case and the
isomorphism only for `ℚ ⊆ k`, and KTheoryFiniteLocalFields §4.0 does not name the map.

**Duplication and ownership.** No other roadmap, on main or open, states polyvector fields, the
cohomological HKR theorem, the bar resolution over `Aᵉ` or the `HH²` classification for bimodules
(searched by object across all open heads and main). No `Suggested.lean` shares a fully qualified
name with this one. `scratch/overlaps.md` lists no dropped id, no second copy and no pull request
changing this roadmap.

Overlap check: read CyclicHomologyLieHomologyAndQuasiFreeAlgebras, SpectralSequencesAndConvergencePartII, RefinedTraceMethods, CohomologyOfGroups, RationalHomotopyModels, DGAInfinity, NoncommutativeGeometry, DerivedModuleAlgebra (the third list is empty); shared objects: graded Hochschild cochains, braces and bracket — DGAInfinity Layer 8; `ε_n`, `π_n`, derived `HH` — RefinedTraceMethods §1.9 and KTheoryFiniteLocalFields §4.0; commutative square-zero extensions and the Koszul complex — DerivedModuleAlgebra §0.5, §0.K.1; complex normalised forms — NoncommutativeGeometry N1.Cyclic; each is cited, none restated.

**Shape.** Summary, scope, conventions, supplier contracts, eight layers each ending with Examples
and Dependencies, consumers, worked examples, references. Every defined object (§§1.1, 1.2, 1.5,
2.1, 2.2, 3.3, 3.5, 3.6, 4.1, 4.2, 4.5, 5.1, 6.4, 7.1, 7.4, 7.5, 8.2, 8.3) has at least three
Checks; §§1.3, 1.4, 4.3, 4.4, 5.2, 5.3 are theorems about objects defined elsewhere and carry
witnesses in the text. No LaTeX delimiters, pull-request numbers, paths or round labels. The layer
order is forced by the *Needs* lines (complexes, then normalisation, low degrees, resolutions, cup
product, comparisons, HKR, polynomial case).

**Copyright.** Wording compared at every locator above and in six further passages (the
Conventions bullets on the boundary and coboundary, §3.6's definition, §4.2's homotopy, §7.2's
proof plan, the docstring of `cohomological_hkr`): only formulas and standard names are shared.
Ginz05's contents (§3 derivations, §4 bar complex, §5 Hochschild theory, §6 Gerstenhaber algebras,
§8 Kähler differentials, §9 HKR) do not map onto the layers in order: Layer 3 draws on §§3, 5 and
8, Layer 4 on §§4 and 5, and Layers 2 and 6 have no counterpart section.

Source independence: 27 passages compared with 4 sources (Ginz05, HKR62, AV20, StacksSmooth), none shared; largest share Ginz05, 46 of 126 locators; contents compared with Ginz05: independent. Loday98, Weibel94, CE56, Ger63 and Mat86 could not be read (uncertified).

## Not verifiable

- Locators into Loday98, Weibel94, CE56, Ger63 and Mat86 (all recorded `uncertified`): cited by
  section or theorem number only; of the sample, §1.3 rests on these alone. The statements
  themselves were checked by computation above.
- The closed form of the sign `s(p,q)` of §5.3 for `q ≥ 1` and of the signs `ν_n` of §6.3 for
  `n ≥ 1`: the README makes their existence the target and fixes `s(p,0) = 1`, `ν₀ = 1`; I did not
  compute them from Mathlib's shift conventions or from DGAInfinity Layer 8's chain differential.
- Truth of the two HKR theorems rests on the declared gap (the antisymmetrisation is an
  isomorphism for smooth algebras over every base); I checked the deduction from it, not the gap.
- The one-tactic probe did not include `exact?`; `scratch/library-matches.md` lists no same-name or
  same-statement hit for any of the 11 declarations.

## Source issues

- **Error** in Ginz05 at (6.6.3), printed page 29: the source says `f∪g − (−1)^{pq} g∪f` equals `d(f∘g) − df∘g − (−1)^p f∘dg`; it should be `dg∘f + (−1)^p (d(g∘f) − g∘df)` for the coboundary of its §5.2 (for two derivations of `k[x]` the printed form gives `2 = −2`); affects the proof.
- **Misprint** in Ginz05 at (6.6.2), printed page 29: the source says the inserted cochain takes the arguments `a_i` to `a_{i+q}`; it should be `a_i` to `a_{i+q−1}`; affects nothing.
- **Misprint** in Ginz05 at §5.2, the chain differential recalled on printed page 22: the source says the middle sum has no sign; it should carry `(−1)^j`, as in its §5.1; affects nothing.
- **Misprint** in Ginz05 at §3.1, printed page 9: the source says `ad m` is a map from `M` to `M` and a derivation of `M`; it should be the map `A → M`, `a ↦ ma − am`; affects nothing.

## For the human reviewers

- **Not tested.** Loday98, Weibel94, CE56, Ger63 and Mat86 are paywalled and recorded `uncertified` in `packages/HochschildHomologyAndHKR/sources.toml`; their 52 locators were not compared with the texts. The most-cited source, Ginz05, was read.
- **Licence.** Ginz05 is an arXiv preprint of lecture notes (arXiv:math/0506603v1), cited for 46 locators; it is not a refereed publication, and each main result also carries a refereed locator (HKR62, Loday98, Weibel94).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "e45a03cd1f2cf42d16cd6278e3745b56931d5603", "job": "REV-PKG-HochschildHomologyAndHKR", "model": "fable", "worker": "chris-x55"} -->
