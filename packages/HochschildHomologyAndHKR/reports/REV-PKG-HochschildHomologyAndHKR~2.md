<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17976#issuecomment-6906585303 -->
Review (claude) of 8856b57

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) The Scope section does not say how §8.4's homology differs from the smooth HKR comparison left to KTheoryFiniteLocalFields §4.0

   **Location.** `packages/HochschildHomologyAndHKR/README.md`, Scope and ownership: line 58 ("the
   polynomial case through the Koszul bimodule resolution (Layer 8)"), lines 69–72 (left to
   KTheoryFiniteLocalFields §4.0: "the smooth HKR comparison `HH_n(A/k) ≅ Ω^n_{A/k}` in homology"),
   and the list "Variants kept here" (lines 147–203).

   **Claim.** Every kept variant says in the Scope section, in one clause, how it differs from the
   object another roadmap keeps. `Ω^n_{R/k} ≅ HH_n(R,R)` for a polynomial algebra, now the headline
   `homological_hkr_mvPolynomial`, is the polynomial case of a comparison the same section leaves to
   another roadmap, and the list has no entry for it (it has one for §3.4 against RefinedTraceMethods
   §1.9). The difference is stated only inside §8.4.

   **Witness.** KTheoryFiniteLocalFields `README.md` at its open head, §4.0 "Cyclic homology
   foundations", line 674 ("the HKR comparison HHₙ(A/k)≃Ωⁿ_(A/k) for smooth commutative k-algebras")
   and its Check, line 679 (`ℚ[t]` over `ℚ`: `HH₂` vanishes); README §8.4 Checks, `m = 1`, `n = 2`:
   the same value.

   **Repair.** Add to "Variants kept here" (after the entry for §3.4):

       - the homological computation of §8.4, `ε^cl_n : Ω^n_{R/k} ≅ HH_n(R,R)` for
         `R = MvPolynomial (Fin m) k`, is the polynomial case of the smooth HKR comparison of
         KTheoryFiniteLocalFields §4.0, which is stated on derived Hochschild chains for every smooth
         algebra without naming the map, and is kept there; §8.4 states it on the classical complex,
         with the antisymmetrisation as the map and the classes `ε^cl_n(dX_I)` as a basis, over every
         `k`, and proves it from the Koszul resolution with no smoothness input and without
         gap:smooth-hkr-antisymmetrisation.

   Tested on the witness: for `k = ℚ`, `m = 1`, `n = 2`, §4.0 gives `HH₂(ℚ[t]/ℚ) = 0`; §8.4 gives the
   same group and, in addition, the map: `ε^cl₂(dX ∧ dX²)` is the class of
   `1 ⊗ X ⊗ X² − 1 ⊗ X² ⊗ X = b(1 ⊗ X ⊗ X ⊗ X)`, which §4.0 does not state. The entry is true of both
   texts and names the one respect in which they differ. No other file changes; `Suggested.lean`,
   `sources.toml` and `design/plan.json` stay as they are.

One finding (R01, P3, no blocking finding). The round-1 finding is repaired, the elaboration passes
with `sorry` as the only warning, no theorem of `Suggested.lean` is padding, the dependency check
is clean, and the sampled locators support the statements. The one finding is a missing ownership
clause that the repair made visible: the homology half of §8.4 is now a Lean headline, and the
Scope section does not say how it differs from the smooth HKR comparison it leaves to
KTheoryFiniteLocalFields §4.0.

No maintainer notes were given for this roadmap.

## Previous finding, checked

**F01 (P2), two homology headlines statable on the pinned normalised chains — repaired.**

- `packages/HochschildHomologyAndHKR/Suggested.lean` lines 119–127 now state
  `homology_one_linearEquiv_kaehler`: "`∃ e : (… chainComplex k R).homology 1 ≃ₗ[k] Ω[R⁄k], ∀ r : Fin 2 → R, ∃ z …, e (… homologyπ 1 … z) = r 0 • KaehlerDifferential.D k R (r 1)`".
- Lines 256–273 state `homological_hkr_mvPolynomial`: an equivalence
  `⋀[R]^n Ω[R⁄k] ≃ₗ[k] H_n` for `R = MvPolynomial (Fin m) k` sending `r₀ • ιMulti (D ∘ r)` to the
  class of the cycle `Σ_σ sign σ • tensor (Fin.cons r₀ (r ∘ σ))`.
- The module docstring (lines 51–58) keeps only `HHₙ(A, M) ≅ Torₙ^{Aᵉ}(M, A)` as not statable, with
  the reason that applies to it (arbitrary `M`, no `Tor` over `Aᵉ`).
- README §3.4 (lines 1173–1178) and §8.4 (lines 2249–2255) name the two declarations, with
  *Needs*, Checks, Conventions and supplier-contract entries.

The repair states the maps with their values where round 1 suggested `Nonempty`; that is stronger,
matches README §§3.4 and 8.4, and I checked it as a new statement (table below). The repaired
pattern was looked for in the rest of the package: the other three "not statable" items lack the
carrier the docstring names (no unnormalised chain complex, no bar resolution and no
noncommutative square-zero extension at the Tau Ceti pin; searched by object); the pinned
`TauCeti.normalizedHochschildCochainComplexι` would only carry the dual-bimodule case of §2.2, a
weakened substitute, and is rightly not stated.

## Verified sound

**Elaboration and gates.** `lake env lean` on `packages/HochschildHomologyAndHKR/Suggested.lean`
from the content checkout: seven `declaration uses sorry` warnings (lines 119, 138, 168, 205, 219,
236, 256), nothing else. Imports: `import Mathlib` and the two `TauCeti` modules the file uses
(`TauCeti.RingTheory.HochschildCohomology.Coboundary`,
`TauCeti.RingTheory.CyclicCohomology.Normalized.Chains`), both present at the pin. No `set_option`,
no sorried data, no `lemma`, no `#eval`/`#print`/`#synth`. Dependency check output:

    depcheck: 242 roadmaps, 2265 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line.

**Signatures.** The 13 elaborated types of `scratch/signatures.md` were compared with the README
statements. The two new theorems carry all their binders (`k R` with `CommRing`, `Algebra`;
`k m n`); the file has no `variable` block. README generality equals the Lean generality: §3.4 and
§8.4 are `R`-linear on `C_•(R,R)` in the README and `k`-linear with determining values on the
pinned chains in the Lean, and both the Conventions bullet and the two sections say so. All 13 Lean
names occur backticked in the README, and the README attributes no other backticked name to this
roadmap.

**Padding probe (all 7 sorried theorems).** Each `sorry` replaced in scratch copies by `simp`,
`rfl`, `infer_instance`, `aesop` and the anonymous-constructor term `exact ⟨_, fun _ => ⟨_, rfl, rfl⟩⟩`:
35 attempts, all fail (unsolved goals or no progress). `scratch/library-matches.md` has no
same-statement hit; the Tau Ceti pin has no statement relating Hochschild chains to
`KaehlerDifferential` (searched in `RingTheory/CyclicCohomology` and
`RingTheory/HochschildCohomology`). The two proved `example`s test the argument order of
`cupProduct` and the row/column convention of `detCochain`, as in round 1.

**Headline theorems.** From the Summary: cohomological HKR in both forms (§7.6(1), (2); stated),
the `n!` class identity (§7.5; stated), the polynomial case in homology (§8.4; stated, new) and in
cohomology (§8.4; the instance `R = MvPolynomial (Fin m) k` of `cohomological_hkr`: I checked that
`Algebra.Smooth k (MvPolynomial (Fin m) k)` and `Module.Projective k (MvPolynomial (Fin m) k)` are
found by instance search at the pin), `HH₁(R,R) ≅ Ω¹` (§3.4; stated, new), `HHⁿ ≅ Extⁿ` (§4.4;
stated), graded commutativity (§6.2; stated). Named in the docstring as not statable, each with a
carrier that is absent at the pins: `HHₙ ≅ Torₙ`, the normalisation theorem with bimodule
coefficients, cup = Yoneda, the `HH²` classification.

**Adversarial table (repaired and added passages, sampled targets, headlines, the target R01 touches).**
Rows of round 1 that carry computed values and whose text is unchanged (§§1.2, 1.3, 2.2, 3.1, 3.3,
4.4, 6.2, 6.3, 7.3–7.6) were relied on; the rows below were computed this round.

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| `homology_one_linearEquiv_kaehler` | `R = k`; `k = 0`; `R = k[x]`; pinned `b` in degree 1 | `N₁ = (k ⊗ k)/(k ⊗ 1) = 0 = Ω¹`; all `0`; `b(1⊗x⊗x) = 2x⊗x − 1⊗x²`, so `[1⊗x²] = 2[x⊗x]` and `d(x²) = 2x dx`; `b(r₀⊗r₁) = r₀r₁ − r₁r₀ = 0` (last face `a₁a₀`, `hochschildFace_last`) | holds; the `∃ z` is satisfied by every tensor, so not vacuous |
| same, wrong slot | `[r₀⊗r₁] ↦ r₁ dr₀` on `k[x]` | `x ⊗ 1 = 0` in `N₁`, and `= b(x⊗1⊗1)` in `C₁`, but would go to `dx ≠ 0` | excluded by the stated value |
| same, well defined on `b(N₂)` | `a₀⊗a₁⊗a₂` | `a₀a₁ da₂ − a₀ d(a₁a₂) + a₂a₀ da₁ = 0` | holds |
| `homological_hkr_mvPolynomial` | `n = 0`; `m = 0`; `n > m`; `m = 1, n = 2` | `Perm (Fin 0) = {1}`, `e(r₀·1) = [r₀]`, `H₀ = R`; `N_n(k) = 0 = ⋀ⁿ 0` for `n ≥ 1`; both `0`; `b(1⊗X⊗X²) = b(1⊗X²⊗X) = X⊗X² − 1⊗X³ + X²⊗X`, difference `= b(1⊗X⊗X⊗X)`, class `0 = ε(dX ∧ dX²)` | holds |
| same, sign of `σ` | `m = n = 2`, unsigned chain | `b = 2(X₁⊗X₂ + X₂⊗X₁ − 1⊗X₁X₂)`, three basis vectors of `R ⊗ R̄` with coefficient `±2`: no cycle when `2 ≠ 0` | excluded by `sign σ` |
| same, determination | spanning | the `r₀ dr₁ ∧ ⋯ ∧ dr_n` span `⋀ⁿ_R Ω¹` over `ℤ`, so the values fix `e`; `r ∘ σ` puts `r(σ i)` in slot `i + 1` | determined; agrees with README §8.4 |
| same, `k = 𝔽₂`, `m = n = 2` | pairing with `∂₁ ∪ ∂₂` | `1 − 0 = 1`, so the class is nonzero while `π ε = 2 = 0` | holds; inverse is not `π/n!` |
| 1.5 `R`-structure | `k[x]`; `Mat₂(k)` | `b(1⊗x⊗1) = x⊗1`, action on first algebra factor gives `1⊗x`, and `x⊗1 ≠ 1⊗x`; `b(E₁₁E₁₂⊗E₂₁) = E₁₁ − E₂₂`, `E₁₁ b(E₁₂⊗E₂₁) = E₁₁` | holds; commutativity needed for the last face only |
| 3.5 `A ⊕_f M` | unit; `k[x]/(x²)`, `f(x,x) = 1`; `k[x]`, `f(x,x²) = 1`; `f = δg`, `g(1) = 1` | `δf(1,1,a) = f(1,a) − f(1,1)a`, `δf(a,1,1) = a f(1,1) − f(a,1)`, so `u = −f(1,1)` on both sides; four basis triples give `δf = 0`, `t² = (0,1)`, `t³ = 0`; `δf(x,x,x) = 1`, products `(x³,0)` and `(x³,1)`; `f(1,x) = x`, `(1,0)(x,0) = (x,x)` | holds |
| 3.5 change of cocycle | `(a,m) ↦ (a, m + g(a))` | target cocycle `f + g(aa′) − a g(a′) − g(a) a′ = f − δg` | holds |
| 4.1 `Aᵉ`-actions | `Mat₂(k)`; `m ⊗ a ↦ [ma]` | `E₁₂E₂₂E₂₁ = E₁₁`, reversed `E₂₁E₂₂E₁₂ = 0`; `b(max) − (max)b ∈ [A,M]`, so balanced | holds |
| 4.5 `M ⊗_{Aᵉ} B_n ≅ M ⊗ A^{⊗n}` | first and last term of `b′` | `m a₁ ⊗ a₂ ⋯` and `(−1)^n a_n m ⊗ a₁ ⋯`, the two outer terms of `b`; `E₂₁E₁₂ = E₂₂ ≠ E₁₁` for the left formula used on the right | holds |
| 5.1 order of factors | `Mat₂`, `x = E₁₁`, `g = id`, `(E₂₁, E₁₂)` | defect of the reversed product `E₁₁ − 0 + 0 − E₂₂` | holds |
| 5.3 Yoneda on resolutions | cocycle condition; `q = 0` | `d^P ≫ f̃_q ≫ g = f̃_{q+1} ≫ d^Q ≫ g = 0`; `f̃₀ ≫ g = f ≫ g′` with `g = ε_Q ≫ g′`, the form of `extMk_comp_mk₀` | consistent; `s(p,q)` for `q ≥ 1` not computed (below) |
| 5.4 lift on the bar resolution | `p = 1`, `i = 0`, unsigned | `f̃₀ b′ = a₀a₁f(a₂)⊗a₃ − a₀f(a₁a₂)⊗a₃ + a₀f(a₁)⊗a₂a₃ = −(a₀f(a₁)a₂⊗a₃ − a₀f(a₁)⊗a₂a₃) = −b′f̃₁`; with `(−1)^{pi}` it commutes; `f̃_q ≫ g = (−1)^{pq} f ∪ g` | holds |
| 6.1 dictionary | `n = 0, 1, 2`; `(p,q) = (1,0), (1,1)`; `f(a,b) = a∂b` on `ℤ[x]` | `[m,Θx](sa) = s(xa − ax) = −Θ(δx)`; `[m,Θf] = s(f(a)b + af(b) − f(ab)) = Θ(δf)`; `[m,Θf] = s(f(a,b)c − af(b,c) + f(ab,c) − f(a,bc)) = −Θ(δf)`; `m{Θf,Θy}(sa) = −s(f(a)y)`, sign `(−1)^{p(q−1)}`; `δf = ab∂c`, wrong model gives `2` at `(1,x,1)` | holds; degree count `−1 + ℓ = n − 1` gives arity `ℓ = n` |
| 6.4 `ε^cl`, `π^cl` | cyclic-shift cancellation; `k[x]/(x²)`; `ℤ → 𝔽_p` | `sgn σ′ = (−1)^{n−1} sgn σ`, total sign `−1`; `Ω² = 0`, `HH₂ = ker(2x) ≠ 0`; `b_n = 1` (even `n ≥ 2`), `0` (odd), so `HH_n = 0` for `n ≥ 1` | holds; (d) rests on the declared gap |
| 7.1 duality | non-symmetric bimodule on `k[x]` | `δm(x) = m ≠ 0` while every degree-one chain is a cycle | holds |
| 7.2 pairing | `ℚ[x]/(x²)`, `M = ℚ`; `ℤ → 𝔽_p` | `HH₁ = R/(2x)`, `HH₂ = xR`, `HH²(R,ℚ) = ℚ = Hom_R(xR,ℚ)`, `h₂ = 0`; `δ^i = 0` (even), `1` (odd), `HH^i = 0` for `i ≥ 1` | holds; `j < i ≤ n` gives the pinned hypothesis |
| 8.3 `ι` | `j = 1` | `b′(1⊗X_i⊗1) = X_i⊗1 − 1⊗X_i = t_i` | holds (`j = 2`, `m = 0` in round 1) |
| 8.5 Jacobian | `m = 2`, `(X₁², X₂)`; `m = 0`, `g = 2` | `det = 2X₁`, normalised value `gX₁`; cochain, class and `Φ⁰` all `2`, the first-column form would give `1` | holds |
| R01 | `k = ℚ`, `m = 1`, `n = 2` | KTheoryFiniteLocalFields §4.0: `HH₂(ℚ[t]) = 0`; §8.4: the same, with the map | shared object, difference not in Scope |

**Sources (the seeded sample).** Read at the cited lines, each supporting the statement at the
generality the README attributes to it: Ginz05 lines 751–752 and 934–947 (§4.1), 944–976 (§4.5),
984–988 (§4.4), 1033–1062 (§4.3), 1088–1111 (§3.5), 1335–1350 (§§5.1, 5.2, 5.4), 1351–1380 (§6.1),
1914–1926 (§3.4), 2142–2156 (§§6.4, 8.3, 8.5), 2161–2166 (§1.5); HKR62 lines 210 and 268–279
(§8.4), 284–298 and 352–364 (§7.1), 301–330 (§7.2: projectivity for `i < k`, conclusion for
`i ≤ k`, as restated), 337–351 (§4.4, degree one), 410–431 (§5.3), 444–466 (§§4.2, 8.3), 479–495
(§§5.1, 5.4, 8.5), 522–548 (§§7.6, 8.5); AV20 lines 237–243 (§6.4). The author flagged no locator as
unverified. `sources.toml` has one key for each of the nine cited works and its `cited_for` lists
cover the new citations of §§3.4 and 8.4; nothing was added.

**Library declarations opened at the pins.** Tau Ceti
`RingTheory/CyclicCohomology/Normalized/Chains.lean`: 53 (`degenerateHochschildChains`), 69, 75
(`tensor`), 242 (`b`), 250 (`b_tensor`), 361 (`chainComplex`), 369 (`chainComplexXIso`, `Iso.refl`);
`RingTheory/CyclicCohomology/Cochain.lean`: 215 (`hochschildFace`), 233 (`hochschildFace_last`:
`(aₙ₊₁a₀, a₁, …, aₙ)`). By `#check` in a scratch file: `HomologicalComplex.cycles`,
`HomologicalComplex.iCycles`, `HomologicalComplex.homologyπ`, `exteriorPower.ιMulti`,
`TauCeti.normalizedHochschildChains.tensor`, `TauCeti.normalizedHochschildChains.b_tensor`. The
other library names of the README are unchanged from round 1, which resolved them against both
pins.

**Cross-roadmap citations resolved (this round).** At open heads: RefinedTraceMethods §1.1 (target
"The cyclic enhancement of supplied derived Hochschild chains"), §1.9 (target "The antisymmetrisation
map and the HKR projection": `π_n ε_n = n!`, `ε₁` an isomorphism, `ε_n` only injective with a
retraction when `n!` is invertible), §1.10; KTheoryFiniteLocalFields §4.0 (target "Cyclic homology
foundations"); EulerSystemsAndKolyvaginSystems §6.1; LanglandsParameterStacks §1.17. On main:
DGAInfinity, DerivedModuleAlgebra, NoncommutativeGeometry, BanachAlgebras, ZigzagPreprojective,
IntegralIwasawaTheory, DerivedDeRhamCohomology (folders present; sections as in round 1).
`roadmaps resolve` on the README lists no citation and no Lean name found nowhere.

**Declared gap.** `gap:smooth-hkr-antisymmetrisation`: same slug in `design/plan.json` and under
the RefinedTraceMethods contract, supplier named, one precise sentence, and still not provided at
the supplier's head (§1.9 as read above). Not a finding.

**Duplication and ownership.** No roadmap on main or at an open head uses
`TauCeti.normalizedHochschildChains` or declares a name of this file in the same namespace
(AlgebraicTopology's `cupProduct` lives in its own namespace). `scratch/overlaps.md`: no dropped
id, no second copy, no other pull request changing this roadmap. The one shared object is R01.

Overlap check: read CyclicHomologyLieHomologyAndQuasiFreeAlgebras, RefinedTraceMethods, KTheoryFiniteLocalFields (this round) and DGAInfinity, NoncommutativeGeometry, DerivedModuleAlgebra, SpectralSequencesAndConvergencePartII, CohomologyOfGroups, RationalHomotopyModels (round 1; the third list is empty); shared objects: smooth HKR in homology — KTheoryFiniteLocalFields §4.0, with this roadmap's polynomial case a kept variant whose Scope clause is missing (R01); `ε_n`, `π_n` — RefinedTraceMethods §1.9; graded cochains, braces, bracket — DGAInfinity Layer 8; Koszul complex and commutative square-zero extensions — DerivedModuleAlgebra §0.K.1, §0.5; CyclicHomologyLieHomologyAndQuasiFreeAlgebras leaves `HH` and HKR to KTheoryFiniteLocalFields and shares nothing with this roadmap.

**Shape.** Unchanged from round 1 apart from the repair: eight layers with Examples and
Dependencies, every definition with at least three Checks; §8.4 gained a Checks list (four items)
and §3.4 a fifth Check. No LaTeX delimiters, pull-request numbers, machine paths or round labels in
the README or the Lean file. The layer order is forced by the *Needs* lines.

**Copyright.** Wording compared at the 17 locator passages above and in six further passages (the
Conventions bullet on the boundary against Ginz05 lines 973–976; §3.5's definition against lines
1095–1106; §6.4's cycle argument against lines 2147–2156; §7.2's route against HKR62 lines 311–330,
a different proof; the docstrings of `homology_one_linearEquiv_kaehler` against Ginz05 lines
1917–1926 and of `homological_hkr_mvPolynomial` against HKR62 lines 268–279): only formulas and
standard names are shared. Ginz05's contents (3 derivations, 4 bar complex, 5 Hochschild theory,
6 Gerstenhaber algebras, 8 Kähler differentials, 9 HKR) against the layers: Layer 1 ↔ §5 comes
before Layer 4 ↔ §§4–5, Layer 3 draws on §§3, 5 and 8, Layers 2 and 6 have no counterpart; no
one-to-one run.

Source independence: 23 passages compared with 3 sources (Ginz05, HKR62, AV20), none shared; largest share Ginz05, 45 of 117 locators; contents compared with Ginz05: independent. Loday98, Weibel94, CE56, Ger63 and Mat86 could not be read (uncertified); StacksSmooth was not re-read this round.

## Not verifiable

- Locators into Loday98, Weibel94, CE56, Ger63 and Mat86 (recorded `uncertified`): cited by section
  or theorem number only. The statements were checked by computation.
- The closed form of the sign `s(p,q)` of §5.3 for `q ≥ 1` and of the signs `ν_n` of §6.3 for
  `n ≥ 1`: the README makes their existence the target and fixes `s(p,0) = 1`, `ν₀ = 1`.
- The truth of `cohomological_hkr_hom_kaehler` and `cohomological_hkr` rests on the declared gap;
  the deduction from it was checked, the gap was not. `homological_hkr_mvPolynomial` does not use it.
- The probe did not include `exact?`.

## Source issues

- **Error** in Ginz05 at (6.6.3), printed page 29: the source says `f∪g − (−1)^{pq} g∪f` equals `d(f∘g) − df∘g − (−1)^p f∘dg`; it should be `dg∘f + (−1)^p (d(g∘f) − g∘df)` for the coboundary of its §5.2 (two derivations of `k[x]` give `2 = −2`); affects the proof.
- **Misprint** in Ginz05 at (6.6.2), printed page 29: the source says the inserted cochain takes the arguments `a_i` to `a_{i+q}`; it should be `a_i` to `a_{i+q−1}`; affects nothing.
- **Misprint** in Ginz05 at §5.2, the chain differential recalled on printed page 22: the source says the middle sum has no sign; it should carry `(−1)^j`, as in its §5.1; affects nothing.
- **Misprint** in Ginz05 at §5.2, printed page 22: the source says the two-fold tensor power is a free left module over the tensor product of `A` with the enveloping algebra; it should be over the enveloping algebra; affects nothing.

## For the human reviewers

- **Not tested.** Loday98, Weibel94, CE56, Ger63 and Mat86 are paywalled and recorded `uncertified` in `packages/HochschildHomologyAndHKR/sources.toml`; their 47 locators were not compared with the texts. The most-cited source, Ginz05, was read.
- **Licence.** Ginz05 is an arXiv preprint of lecture notes (arXiv:math/0506603v1), cited for 45 locators; it is not a refereed publication, and each main result also carries a refereed locator (HKR62, Loday98, Weibel94).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "8856b57a31f6c690d639300e55c8ae4d35437ff1", "job": "REV-PKG-HochschildHomologyAndHKR~2", "model": "fable", "worker": "chris-x55"} -->
