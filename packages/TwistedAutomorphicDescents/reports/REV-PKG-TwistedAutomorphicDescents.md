<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1535#issuecomment-6396268951 -->
Review (claude) of 00c9576

Verdict: needs changes

1. **F01** (P1) The README misreports the published numerator of (4.47) and invents a second "printed candidate"

   **Location.** `packages/TwistedAutomorphicDescents/README.md:519` (§3.3): "The published numerator uses the complex conjugate of the unitary representation π, whose parameter is φ_π∨. Also record the distinct (5.13) candidate `Lcal_v^(13)`, with φ_π in place of φ_π∨." Repeated at lines 542, 557, 596, 598, 610, 681, 687 and in `design/plan.json` (gap `unitary-pairing-and-normalizer-dictionary`, source issue E4).

   **Claim.** JZ2020 prints two different numerators: (4.47) p.780 with conjugated π, (5.13) p.787 without.

   **Witness.** Both displays print the same numerator `L(s+1/2, τ×π)` with no conjugation (JZ2020 line 1826 and line 2130; the cached publisher PDF rendered at 900 dpi shows no overline on π in either display). Conjugation bars do appear elsewhere, e.g. in (5.6) p.785 and Theorem 5.3 p.786.

   **Repair.** In §3.3 state that (4.47) and (5.13) print the same numerator `L(s+1/2, τ×π)`. Keep the README's own normalization `ℒ_v = L_v(s+1/2, τ×φ_π∨)/(L_v(s+1,τ×φ_σ) L_v(2s+1,τ,ρ))` only as this roadmap's convention, justified in §4.1 by the pole claim of JZ2020 line 2150 (`L(s+1/2,τ×π)` has a pole of order r when φ_π=φ_τ). That claim holds for conjugate-self-dual BC(π) only if the second factor is BC(π)∨. Delete `Lcal_v^(13)` and every "(5.13) candidate" passage (§§3.3, 3.4, 3.5, 4.1, 4.5, 4.6 and the Checks at lines 538, 610, 681). Rewrite the gap text and source issue E4 so they describe this notational gap (see Source issues), not a printed discrepancy. Tested on the refuting instance: after the repair, no README sentence attributes a conjugate to the rendered p.780.

2. **F02** (P1) Eleven declared gaps have supplier `none`

   **Location.** `design/plan.json` `gaps`: `unitary-pairing-and-normalizer-dictionary`, `inner-form-tower-cuspidality-proof`, `full-relative-bruhat-and-open-cell-comparison`, `unpublished-local-continuation-and-spherical-calculation`, `appendix-a-coordinate-and-archimedean-verification`, `acyclic-all-place-normalized-intertwiner-import`, `nongeneric-residual-packet-and-all-member-support`, `complete-critical-jacquet-calculations`, `original-fourier-support-and-regular-descent-witnesses`, `subregular-orbit-raising-and-unitary-collapse`, `central-character-and-discrete-fourier-image`.

   **Claim.** These are supplier contracts.

   **Witness.** Each has `supplier: none`. None appears under `## Exact supplier contracts` (zero README occurrences of any of the eleven slugs). Their needs text is research or process notes ("The cited book is not cleared and has not been read", "No complete replacement proof was established in this review"). G6 and G7 restate the declared gaps `all-place-intertwiner-comparison` and `nongeneric-residual-packets`.

   **Repair.** No gap may stay with supplier `none`. G6 and G7 merge into the two declared gaps they duplicate. G1–G5 and G8–G11 are this roadmap's own targets, and the README already states them (§§1.1, 1.3, 2.3–2.6, 3.1, 3.4, 3.6, 4.1, 5.4, 5.7, 6.3, 7.3, 7.4). Remove the nine supplier-none records and keep the README targets with their locators. Removing records from `plan.json` goes beyond the package-stage allowance (which only permits adding gaps), so the intake must authorize the change.

3. **F03** (P2) §2.5 gives the transformation character of `J_s` inverted

   **Location.** `README.md:435` (§2.5): "the resulting function transforms under `R_(beta-1)` by `psi_(beta-1,y_(-kappa))^(-1)` and that representation"; API bullet line 439 ("with the specified inverse character").

   **Claim.** `J_s(f)(n h) = ψ_{β−1,y−κ}(n)^{−1} J_s(f)(h)`.

   **Witness.** JZ2020 Proposition 4.2 (line 1566) gives the target `Ind(ψ_{β−1,y−κ} ⊗ σ^{w_q^ℓ})`, without the inverse. Substituting z→zz′ in (4.31) gives `J(z′h)=ψ(z′)J(h)`. §2.6 (line 457) gives the inner datum the inverse character. With ψ⁻¹ on both sides the §3.1 integrand picks up ψ(n)⁻², so it does not descend.

   **Repair.** Read "transforms under `R_(β−1)` by `ψ_(β−1,y_(−κ))`" (Prop. 4.2), so that pairing with an inner functional in `Hom_R(π⊗σ^t, ψ^{−1}_{β−1,y_{−κ}})` (JZ2020 line 3281, (A.2)) cancels as §3.1 says. Add a Check: ψ(n)·ψ(n)⁻¹=1, whereas inverse characters on both sides give ψ(n)⁻²≠1 for ψ(n)=i.

4. **F04** (P2) §§6.3/6.5 rely on an unsourced isobaric extension, routed through a gap that does not request it

   **Location.** `README.md:940` (§6.3 Needs): "gap:nongeneric-residual-packets (distinct-isobaric support extension)"; line 965 (§6.5): "The weak-support hypothesis is discharged by the anisotropic SO₂ case".

   **Claim.** The SO₂ Fourier-support witness holds for isobaric τ, so §6.5 holds for every generic φ.

   **Witness.** JLXXZ2016 Theorem 1.2 assumes an irreducible unitary cuspidal τ on GL_2n (JLXXZ2016 line 189–191). The needs sentence of `gap:nongeneric-residual-packets` (README line 121) asks only for packet membership, support and irreducibility, never for a Fourier-support witness.

   **Repair.** Restrict the anisotropic-SO₂ case of §6.3, and §6.5, to simple φ (τ cuspidal), as JLXXZ2016 proves. State the distinct-isobaric extension as a separately named proposition used as a hypothesis (as §6.2 does for weak support), or declare a precise new gap with an owner. Tested: for τ=τ₁⊞τ₂ (the §6.3 Check at line 947), the restricted §6.5 no longer asserts anything.

5. **F05** (P2) Three declared gaps request what suppliers already state

   **Location.** `README.md:103` (`gap:type-poles-and-cross-factor`), line 111 (`gap:all-place-intertwiner-comparison`), line 109 (`gap:isobaric-eisenstein-continuation`).

   **Claim.** These are missing supplier work.

   **Witness.**
   - `TauCetiRoadmap/ModularityAndLanglandsExtensions/README.md` §3.4 (`selfDual_type_dichotomy`) states the self-dual type dichotomy. AL.3 `rs-boundary-nonvanishing` makes `L(1,τ_i×τ_j^ι)` regular and nonzero for distinct blocks.
   - AutomorphicSpectralTheory §2.13 states holomorphic, nonzero `N(w₀,τ⊗σ,s)` on Re s≥1/2 for every characteristic-zero local field, including nongeneric members of pure inner forms.
   - AutomorphicSpectralTheory §§2.4, 2.4a and 2.14 continue isobaric GL inducing data with smooth sections.

   **Repair.** Narrow each needs sentence to its remainder:
   - the conjugate-self-dual (Asai) dichotomy and the completed normalizer-factor identity;
   - split-place (GL) components only, if AST §2.13's hypotheses exclude them;
   - the non-cuspidal smaller datum σ only.

   Cite the supplied statements by section and anchor in the Needs lines of §§4.2–4.3 and 2.1.

6. **F06** (P2) The two ModularityAndLanglandsExtensions gaps are compound and request inner-form classification that the literature only outlines

   **Location.** `README.md:121` (`gap:nongeneric-residual-packets`), line 123 (`gap:coherent-classical-parameters`). Plan section for the former: "3.8, 3.12, 3.15–3.18, 3.22–3.25".

   **Claim.** One request each supplies membership, support and irreducibility (residue and all members), and coherent packets, member cuspidality, base change and uniqueness, for all orthogonal and unitary inner forms.

   **Witness.** The source itself describes the general orthogonal case only as an outline in Arthur's book and the unitary inner-form case as progress (JZ2020 line 81–83, line 87–89). MLE §3.22 concerns Sp_2g(ℝ) holomorphic packets, which are unrelated here. README §5.2 cites "§§3.23–3.25", the plan "3.22–3.25".

   **Repair.** Split each into single-statement gaps: quasi-split residual-packet membership, residual irreducibility, all-member support, coherent-packet comparison, base change with a.e. uniqueness. Carry the non-quasi-split classification inputs as an explicit named hypothesis of §§5.2, 5.5, 5.8, 6.4 and 7.2, as the README does for local GGP. Drop §3.22 and make the section ranges agree.

7. **F07** (P2) A roadmap that exists nowhere is cited

   **Location.** `README.md:11`: "The broader orthogonal GGP endpoints assigned to GanGrossPrasadUnitaryGroups, Part II supply no input to this roadmap."

   **Claim.** That Part II exists and owns the orthogonal GGP endpoints.

   **Witness.** No such roadmap is on main, among the 355 open roadmap heads, in the board packages or in `ORDER.txt`. GanGrossPrasadUnitaryGroups (open head) only reserves orthogonal pairs for a future Part II. The board's GanGrossPrasadConjecturesForClassicalGroups has a target brief only, with no design.

   **Repair.** Delete the sentence. State in Scope that the orthogonal relevant pairs, Bessel data and the SO local Bessel-uniqueness input (§§0.1–0.3, 1.4) are owned here because no earlier owner exists.

8. **F08** (P3) RG2.4 is cited for content it does not hold

   **Location.** `README.md:17` ("Generic Hermitian complement and Witt geometry belongs to ReductiveGroupsPartII RG2.4"); line 60 ("Consume RG2.4, parabolics and Levi decompositions").

   **Witness.** At its head, ReductiveGroupsPartII Layer RG2.4 is "decompositions and double cosets": Iwahori–Weyl, Iwahori–Bruhat, Cartan and Iwasawa over local fields, plus the local adjoint-modulus formula. Parabolics and Levi intersections are ReductiveGroups (main) Layer 7b.

   **Repair.**
   - Line 17: say that the Hermitian Witt geometry is requested of ReductiveGroupsPartII (`gap:hermitian-witt-complements`).
   - Line 60: consume RG2.4 only for the local adjoint-modulus formula.
   - Cite ReductiveGroups Layer 7b for parabolics and Levi factors in §0.1 and its Needs line.

9. **F09** (P3) Suggested.lean docstring: wrong reasons, and non-headlines listed as headlines

   **Location.** `packages/TwistedAutomorphicDescents/Suggested.lean:14`: "Section 2.3, Relative Bruhat cells: lacks rational classical Bessel data, normalized induced automorphic representations and Eisenstein families"; line 22 (4.7 "lacks ... continuous Eisenstein Laurent operators").

   **Witness.** §2.3 involves only F-points of classical groups and isotropic flags. Its coarse layer, orbits of pairs of totally isotropic subspaces with invariants (dim U∩U′, dim U∩U′^⊥) = (α,β), elaborates at the pins with only `sorry`. The statement below was elaborated in a scratch copy; its invariants reproduce the §2.3 Checks (0,1), (0,0), (1,1). §4.7's statement contains no Eisenstein operator.

   ```lean
   theorem coarse_isotropic_pair_orbit {F X : Type*} [Field F] [Invertible (2 : F)]
       [AddCommGroup X] [Module F X] [FiniteDimensional F X]
       (Q : QuadraticForm F X) (hQ : Q.Nondegenerate) (U₁ U₁' U₂ U₂' : Submodule F X)
       (h₁ : ∀ x ∈ U₁, Q x = 0) (h₁' : ∀ x ∈ U₁', Q x = 0)
       (h₂ : ∀ x ∈ U₂, Q x = 0) (h₂' : ∀ x ∈ U₂', Q x = 0)
       (hdim : Module.finrank F U₁ = Module.finrank F U₂)
       (hdim' : Module.finrank F U₁' = Module.finrank F U₂')
       (hα : Module.finrank F ↥(U₁ ⊓ U₁') = Module.finrank F ↥(U₂ ⊓ U₂'))
       (hβ : Module.finrank F ↥(U₁ ⊓ LinearMap.BilinForm.orthogonal Q.polarBilin U₁') =
         Module.finrank F ↥(U₂ ⊓ LinearMap.BilinForm.orthogonal Q.polarBilin U₂')) :
       ∃ e : Q.IsometryEquiv Q, U₁.map (e.toLinearEquiv : X →ₗ[F] X) = U₂ ∧
         U₁'.map (e.toLinearEquiv : X →ₗ[F] X) = U₂' := by
     sorry
   ```

   **Repair.**
   - Remove the intermediate unfolding steps (§§2.2–2.4, 3.2) from the headline list. They are README targets, not deep endpoints, so the empty file stays correct.
   - Give each remaining headline its actual missing carrier: automorphic forms and the cuspidal spectrum of SO(V) or U(V) over a number field, Bessel periods, smooth and Casselman–Wallach local categories, Arthur parameters, and GL L-functions.
   - If §2.3 is kept as a headline, state the coarse theorem above instead.

10. **F10** (P3) The §2.3 Needs line cites a local p-adic supplier for a rational double-coset statement and omits the main owner

   **Location.** `README.md:411`: "*Needs:* §0.1; §0.3; SmoothRepresentationsOfLocalGroups SR.2.1–SR.2.3 (gap:twisted-jacquet-filtration)."

   **Witness.** That gap concerns twisted Jacquet quotients over finite extensions of ℚ_p (line 84). The F-rational parabolic double cosets `W_P\W/W_Q` for split groups are ReductiveGroups (main) Layer 7 (`TauCetiRoadmap/ReductiveGroups/README.md:688`).

   **Repair.** Cite ReductiveGroups Layer 7 for the split parabolic double cosets. State the relative (non-split, isotropic-flag) classification as this target's own content, and drop the SR/twisted-Jacquet citation from §2.3.

11. **F11** (P3) §1.4 bundles the orthogonal local uniqueness theorem without its own target and locator

   **Location.** `README.md:325`: "At finite places use AGRS2010, Theorem 1′, with the higher-codimension induction reduction".

   **Witness.** AGRS2010 Theorem 1′ is the codimension-one case, U a line (AGRS2010 line 50–65). No locator is given for the reduction to codimension one, and the global §1.4 and the local theorem share one Needs line.

   **Repair.** Split it out as its own target, "Orthogonal local Bessel uniqueness". It needs hypotheses, the AGRS2010 Theorem 1′ locator, the published Gan–Gross–Prasad reduction to codimension one (§15, added to `sources.toml`), the JSZ2010 Theorem A range (p≥r, q≥r+1, O groups; JSZ2010 line 12–26) with the O-to-SO step, its own Needs line and three Checks.

12. **F12** (P3) Garbled sentences, leaked node slugs, notation slips

   **Location and witness.**
   - Self-referential or garbled replacements: lines 259 ("the image/carrier comparison in §1.1" inside §1.1), 307, 323 ("In addition, For a split SO₂ stabilizer, prove … comparison the image/carrier comparison in §1.1"), 409, 423, 491, 701 ("exact target with required convention proof the dictionary in §4.1"), 914.
   - Lowercase sentence starts: lines 519, 898, 914.
   - Leading space at line 1019.
   - Node slugs used as vocabulary: line 435 "relative-bruhat", line 459 "prescribed-ambient-datum", line 687 "normalized-holomorphy".
   - Line 697 evaluates "Z_S*(0)" for a function of s, where the centre is s=1/2.

   **Repair.** Rewrite each sentence with the section reference as its object, replace each slug by the section title (§2.3, §0.6, §4.5), and write `Z_S*(1/2)=3`.

13. **F13** (P3) §4.3 assumes facts that its suppliers prove

   **Location.** `README.md:637`: "suppose … the cross factors for distinct blocks are regular and nonzero there, and the completed normalizing denominator is regular and nonzero at s=1/2".

   **Witness.** JZ2020 proves both inside Proposition 5.2 and Proposition 5.4 (line 1986–1987, line 2159–2166). AL.3 `rs-boundary-nonvanishing` and §3.5 supply them, so the theorem is narrower than its source.

   **Repair.** Delete the two hypotheses and derive them in the proof route from AL.3 `rs-boundary-nonvanishing` and §3.5. Keep the type-pole condition, which is part of the "iff" in Proposition 5.2.

Scope of this review: `packages/TwistedAutomorphicDescents/README.md` (1098 lines, 8 layers, 49 target sections), `Suggested.lean` (docstring only, no declarations), `metadata.toml`, `sources.toml`, with `design/plan.json` read for the declared gaps and source issues. The package owns real content (every target has a statement, a locator, a `*Needs:*` line and Checks); it is not an index or alias of another roadmap. Thirteen findings: 2 P1, 5 P2, 6 P3.

## Verified sound

**Principles.**
- No route-specific shortcut, no upward or cyclic supply, no copied passage, no computational algorithm.
- `Suggested.lean` has no sorry'd data, no `set_option`, a single `import Mathlib`, a correct docstring form and namespace `TauCetiRoadmap.TwistedAutomorphicDescents`.
- No process words or pull-request numbers in the README. The only process text is in the plan gap records (R02).

**Dependency check.**

```
depcheck: 50 roadmaps, 585 edges, 0 problem(s)
```

TwistedAutomorphicDescents is the last line of `ORDER.txt` (line 315), after every supplier. Suppliers and their order lines: ReductiveGroupsPartII 24, SmoothRepresentationsOfLocalGroups 26, AutomorphicFormsOnReductiveGroups 76, GeometryOfNumbersAndQuadraticArithmetic 78, AutomorphicLFunctionsAndLocalFactors 93, AutomorphicSpectralTheory 95, EndoscopicTransferAndUnitaryTraceComparison 162, ModularityAndLanglandsExtensions 255, GanGrossPrasadUnitaryGroups 262, LieHighestWeightPartII 293.

**Lean.**
- `lake env lean` on `Suggested.lean` exits with no output (no declarations, so no sorry warnings).
- A scratch file with `#check @` for all eight cited library names elaborated, and their binders match the supplier contract text:
  - `TauCeti.RegularFormClass.wittDecomposition` (`TauCeti/LinearAlgebra/QuadraticForm/Witt/Decomposition.lean:262`): field, `Invertible 2`.
  - `TauCeti.QuadraticMap.specialOrthogonalGroup` (`TauCeti/LinearAlgebra/QuadraticForm/OrthogonalGroup/Basic.lean:373`): a subgroup of `M ≃ₗ[R] M`.
  - `TauCeti.QuadraticMap.det_reflection` (same file, line 887): `Invertible (Q v)`, free and finite.
  - `QuadraticMap.IsometryEquiv.exists_extension` (`TauCeti/LinearAlgebra/QuadraticForm/Witt/Extension.lean:50`): restricted form nondegenerate; no ambient regularity.
  - `TauCeti.equivalent_of_equivalent_prod` (`TauCeti/LinearAlgebra/QuadraticForm/Witt/Cancellation.lean`): finite-dimensional nondegenerate cancelled summand.
  - `Nat.Partition` (`Mathlib/Combinatorics/Enumerative/Partition/Basic.lean:52`), `Representation.IntertwiningMap` (`Mathlib/RepresentationTheory/Intertwining.lean:36`), `MeromorphicOn` (`Mathlib/Analysis/Meromorphic/Basic.lean:494`).
- The pins are Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf`.

**Headline theorems and statability.** For every automorphic headline the docstring's "not statable" verdict is correct. At the pins there is no automorphic form or cuspidal spectrum on a reductive group over a number field ("AutomorphicForm": 0 files in either library). There is no smooth or admissible local category or Jacquet functor (0), no Arthur parameter (0 in Tau Ceti), and Eisenstein series exist only for SL₂/GL₂ modular forms.

| Headline (README §) | Carrier it needs | At the pins |
| --- | --- | --- |
| 1.3, 1.4 (global part) | cuspidal realizations on SO(V)(𝔸), U(V)(𝔸); Bessel coefficient maps | absent |
| 3.4, 3.6, 3.5 | local smooth/Casselman–Wallach categories, local zeta integrals, local L-factors of parameters | absent |
| 4.3, 4.5, 4.6 | Eisenstein series on classical groups, Laurent coefficients, completed tensor L-functions | absent |
| 4.7, 6.4, 6.5 | cuspidal representations with generic parameters, Bessel periods, GL Rankin–Selberg values | absent |
| 5.2, 5.4–5.8 | residual spectrum, Arthur packets, twisted Jacquet modules | absent |
| 6.3, 7.2–7.5 | Fourier-support sets, descent modules, enhanced local packets | absent |
| 2.2, 2.4, 3.2 | intermediate unfolding steps (not headlines; R09) | — |
| 2.3 | F-points of classical groups only; coarse layer statable (R09) | present |

No statable headline is missing. There is nothing to probe for padding.

**Source sample, all read at the locators.**

| Target | Verdict |
| --- | --- |
| 0.1 | JZ2020 line 404–458 and 494–496: groups, polar decomposition and Levi factors match, N=n∨. Witt-index misprint (Source issues). |
| 1.2 and 1.3 | Proposition 2.2, line 715–725 (p.756), matches. Valid range needs 2ℓ+1≤d as well as ℓ≤r (Source issues). |
| 1.4 | (2.10) line 737 and the multiplicity-free deduction, line 740–742, match. AGRS2010 line 59 and JSZ2010 line 24 also checked (R11). |
| 2.1 | §4.1 (4.1)–(4.10), line 1067–1164: τ isobaric, σ need not be cuspidal. (4.9), as recalled in (5.12) on the rendered p.787, is bilinear (bar on the coefficient). |
| 2.2 | (4.11)–(4.13), line 1165–1178, p.767: matches, including the irreducibility proviso. |
| 2.5 | (4.29)–(4.33) and Proposition 4.2, line 1511–1583: integral and domain match; character inverted (R03). |
| 2.6 | Proposition 4.3, line 1601–1618; (4.42)–(4.46), line 1728–1796: inner pairs (π,σ′) and (σ,π) match. |
| 3.5 | Proposition 5.6 proof, line 2245–2250; (B.5)–(B.6), line 3686–3695, p.819: exponents strictly below 1/2 match. |
| 4.3 | Proposition 5.2, line 1998–2006: matches up to R13. |
| 4.4 | (4.49), line 1886; (5.10)–(5.11) rendered p.786–787: quotient Z/ℒ matches. |
| 4.7 | Theorem 5.7 and §5.5, line 2284–2304, rendered p.791: matches; unitary step is a source gap. |
| 6.1 | Partitions, line 2960–2975: all three branches and p¹ match. |
| 7.3 | §7.2 and Corollary 7.2, line 3189–3216: matches; the README's U₁ correction is right. |
| 7.4 | Proposition 7.3 and case list, line 3217–3244; JLS2016 Theorem 11.2, line 855 (PDF p.22, O/Sp/Mp scope): match. |
| Further | JLXXZ2016 Theorem 1.2 (line 189–209) and Zhang2022 Theorem 1.1 (line 87–106, including the split GL case) checked. |

**Supplier citations resolved at the open heads.** Every cited section exists:
- GanGrossPrasadUnitaryGroups §§1.1–1.3, 2.1–2.6, 3.9 (export interface "across all nonsplit … places"), 3.10, 3.11, 4.1–4.4, 7.1.
- AutomorphicFormsOnReductiveGroups §§2.3, 2.6 (`genericUnitaryClassification`), 2.7, 3.4, 3.5, 4.1–4.3.
- SmoothRepresentationsOfLocalGroups SR.0.1–SR.0.4, SR.2.1–SR.2.3, SR.3.1–SR.3.3, SR.4.1–SR.4.4.
- AutomorphicLFunctionsAndLocalFactors anchors `whittaker-model`, `rs-global-poles`, `rs-global-functional-equation`, `rs-boundary-nonvanishing`, `isobaric-strong-multiplicity-one`, `l-group-local-factor`, `local-parameter-comparison`, `satake-factor-operations`, and the subsection "Poles, functional equations and the closed boundary".
- AutomorphicSpectralTheory §§0.15, 1.1–1.5, 2.4–2.14, 4.1–4.4.
- EndoscopicTransferAndUnitaryTraceComparison §§11.2–11.4.
- ModularityAndLanglandsExtensions §§3.3, 3.4, 3.8, 3.12, 3.15–3.18, 3.23–3.25, 5.4.
- GeometryOfNumbersAndQuadraticArithmetic §2.9.
- LieHighestWeightPartII N0/nilpotent-orbit and N2/classical-partitions (board design).
- ReductiveGroupsPartII RG2.4 (content: R08).
- ClassicalGroupsPartII CG.0–CG.3.
- Main: ReductiveGroups, OrthogonalSpinGroups, RepresentationTheory/ClassicalGroups Layer 6, Completed RestrictedProducts.

**Duplication and ownership.**
- Sweep: `roadmaps grep` over main and 355 open heads, plus the board packages, for twisted or automorphic descent, Bessel periods and modules, first occurrence, Generic Summand, Fourier support, reciprocal nonvanishing, Ginzburg–Rallis–Soudry and Jiang–Zhang.
- Matches that are cited, not restated: MLE §5.4 (GRS descent); AST §§2.8–2.13 and MLE §3.25 (JZ2020 Appendix B); GGPU (unitary Bessel data and periods).
- Matches that are different objects: MetaplecticAutomorphicForms §3.10 (theta first occurrence); GL2AutomorphicRepresentationsAndTransfer R17.6.18 (Galois-twisted descent); AST §2.22 (SL₂ Bessel–Kloosterman).
- No other roadmap owns the twisted descent, the residue-to-period comparison or the orthogonal Bessel-uniqueness input. This roadmap is their owner (R07, R11).

**Declared gaps.**
- `hermitian-witt-complements`, `rational-nilpotent-orbits`, `classical-dominance`, `rational-fourier-support`, `bessel-restriction-growth`, `twisted-jacquet-filtration`, `spherical-whittaker-normalization` (SR has no spherical Whittaker formula) and `all-place-signed-factors` are precise, minimal and stated with matching slugs.
- The others are R02, R05 and R06.

**Adversarial table.**

| Statement | Instances | Computed values | Result |
| --- | --- | --- | --- |
| Hermitian slot convention | line, h(1,1)=1; hyperbolic e,f | h(i,1)=i, h(1,i)=−i; conj-first reuse −i; h(e±f,e±f)=±2 | holds |
| U₁ periods | volume-one U₁, χ²≠1 | Q(χ,χ)=1, P(χ,χ)=0, P(χ,χ∨)=1; P(f,ig)=iP, Q(f,ig)=−iQ | holds |
| inverse-character coefficient | two-term sum, ψ(1)=ζ, f=(1,i) | 1+iζ⁻¹ ↦ 1−iζ = B_{ψ⁻¹}(conj f) | holds |
| modulus, L-value | B⊂GL₂, a=4; q=2, s=1, ±1 | δ^{1/2}=2; 1−T²=3/4, L=4/3 | holds |
| critical arithmetic | d=5,m=2,j=1,a=4; a=1,j=2 | d=5, k₀=2, 2a+m−2k₀−1=5; m+1≠m+5 | holds |
| SO₁ boundary | N=0 | a=N>j≥0 impossible | holds |
| §0.1 Witt index, transfer | quasi-split nonsplit SO₄; SO₅, U₅ | r=1; N=4, N=5 | holds |
| §0.2 p_ℓ(d) | (5,1), (3,0), (4,2) | [3,1,1] sum 5 len 3; [1³], dim 2, dim SO₂=1, dim U₂=4; 5>4 | holds |
| §0.3 twisted trace | x=δ, x=1 | Tr(1)/2=1; Tr(1/δ)/2=0 | holds |
| §0.3 signatures | q=2xy, (1,±1/2) | values ±1; perpendiculars swap signs | holds |
| §0.4 normal form | κ=2 | q(e+f)=2, q(e−f)=−2, pairing −κ/2+κ/2=0 | holds |
| §0.5 Witt index | ℝ: H⊥⟨1⟩, κ=±1 | κ=1: ⟨−1,1⟩ index 1=r−ℓ; κ=−1: ⟨1,1⟩ index 0 | README right, source wrong |
| §0.5 unitary centre | −1∈Z(U(V)) | fixes ψ, e↦−e | holds |
| §0.6 dimensions | d=5,…,a=4; a=j+1 | 10, k=2, 10−4−1=5; k=0, d+1 | holds |
| §1.2 ℓ₀ | {0,2}; r=0; split dim 4, ℓ=2 | 2; 0; 5>4 | holds |
| §1.3 torus | split SO₂ | no proper parabolic; ∫₁^∞ dt/t=∞ | holds |
| §1.4 σ⊕σ | two projections | Hom ≥2 vs ≤1 | holds |
| §2.3 cells | a=1,ℓ=0; a=1,ℓ=1; r_W=0 | {(0,1)}; {(0,0),(1,1)}; equal to (dim U∩U′, dim U∩U′^⊥) | holds |
| §2.4 C₂ quotient | nontrivial character | (1−1)/2=0 | holds |
| §2.5 J_s law | (4.31) substitution | J(z′h)=ψ(z′)J(h); README ψ⁻¹ gives ψ(n)⁻² | fails (R03) |
| §2.6 indices | (3,2), (2,2) | β−1=0, ℓ−a=0 | holds |
| §3.3 ρ and signs | (x,y); m=1,2 | ∧²: xy; Sym²: x²,xy,y²; As⁻, As⁺ (Zhang2022 line 93–98) | holds |
| §3.3 printed numerator | rendered pp.780, 787 | both τ×π, no bar | fails (R01) |
| §3.4 | x=1, y=−1, T=1/2 | 3/4, 4/3 | holds |
| §3.5 exponents | α=1/3, β=1/4; 1/2 | 5/12, 11/12, 4/3; boundary 0 | holds |
| §3.6 control | given p, u | det 1, pᵀJp=J, uᵀJu=J, pu·w=w, q(w)=2; −1/2=1/2−1 | matrices hold; block reading not checked |
| §4.1 split U₃ | (2,5,1/3) | χ₁μ⁻¹=2/5, μχ₂=15, χ₁χ₂=6 | holds |
| §4.2 Laurent | A/t²+B/t+C | coefficient A; order 1 gives 0 | holds |
| §4.3 | 3t⁻²; t·t⁻² | order 2, lead 3; order 1 | holds |
| §4.4 | Z=1/t, ℒ=2/t | 1/2 | holds |
| §4.5 | (6t⁻²+3t⁻¹)/(2t⁻²) | 3+(3/2)t, value 3 | holds |
| §4.6 | c=2, 3, 5 | 30 | holds (R12 notation) |
| §5.1 | a=6, SO₃ | form 15, std 14=12+2 | holds |
| §5.2 | λ=−1/2, 0 | ∫₁^∞ t^{2λ}dt/t=1; diverges | holds |
| §5.3 | d=6,m=1,j=2,a=6 | k₀=3, [7,1⁶], 13; 2k₀+1=a+m−1 or a+m | holds |
| §5.7 | d=a=6, W split dim 1 | j=2, k₀=3=a/2+r_W, 6 (k₀=2 gives 8) | holds |
| §5.7 | μ=(2,3) | 1−5T+6T² | holds |
| §6.1 | (4,2), (6,1) | [5,5], [5,1⁵]; [7,5,1], [7,1⁶] | holds (source line 2964–2975) |
| §6.3 | n=1, anisotropic SO₂ | (4,2), a=2, j=0, k₀=1, [3,1³] | holds |
| §6.5 scope | JLXXZ2016 line 189 | τ cuspidal only | fails for isobaric τ (R04) |
| §7.3 | U₄, SO₄, U₃, SO₅ | 9, SO₁, m=0, N=4 | holds |
| §7.4 | SO₆, SO₃, U₅ | [3,3]→[3,1³], m=3; [1³], m=2; [4,1] vs [3,1,1] | holds |
| §7.5 dominance | SO₈, U₅ | (5,8)≥(4,8); (4,5)≥(3,5) | holds |

## Not verifiable

- **GRS2011** (Theorems 5.1, 5.4, 5.6, 7.3): settled as uncertified; the text was not read. §§1.3, 5.4 and 5.7 cite it only through JZ2020.
- **JZ2020 reference [43]** (Jiang–Soudry–Zhang, local zeta-integral theory): the source says this work will appear (JZ2020 line 1865–1866), and no copy is available.
- **Mœglin's irreducibility theorem** (JZ2020 line 2949, [62, Th. B]): not in the manifest; not read.
- **Appendix A (A.12)–(A.14)** block notation (§3.6): only the matrices of the README Check were verified; the block correspondence was not checked against the rendered pp.813–814.
- **Plan source issues E6–E8** (Lemma 6.5 index and unitary rank; Proposition 6.4 normalizer sign): not re-derived. E1–E3 and E12 are confirmed below; E4 is wrong (R01).
- **Ownership against unindexed open work**: open pull requests outside the 355-head index were not checked.

## Source issues

- **Misprint** in JZ2020 at §2.3, p.754 (line 640): the quasi-split group is said to have Witt index equal to half the dimension. It should say that a quasi-split nonsplit even orthogonal group has Witt index one less. Affects nothing.
- **Misprint** in JZ2020 at §2.3, p.755 (line 695–696) and Proposition 2.2, p.756: Bessel partitions are called relevant for every index up to the rank. They also need 2ℓ+1 ≤ dimension, which fails at ℓ = r in split even dimension. Affects nothing.
- **Error** in JZ2020 at Proposition 2.5, p.759: the anisotropic-kernel criterion uses representation of y_{−κ}. It should test whether the kernel represents the value of y_κ (real example ⟨1⟩, κ=1). Affects a stated result.
- **Error** in JZ2020 at (2.13), p.758: for unitary groups the displayed pointwise flag stabilizer is called the identity component of the character stabilizer. That component also contains the central norm-one torus. Affects nothing.
- **Gap** in JZ2020 at (4.47) p.780, (5.13) p.787 and Proposition 5.4 proof p.788 (line 2150): `L(s+1/2,τ×π)` is said to have an r-fold pole when π has parameter τ. For unitary groups this needs the dual of BC(π), which the notation leaves unspecified. Affects the proof.
- **Gap** in JZ2020 at §5.5, p.791 (line 2292–2293): from L(1/2,τ×σ∨)≠0 it passes directly to L(1/2,τ×σ)≠0. For conjugate-self-dual unitary data these differ and need an argument. Affects a stated result (Theorem 5.7, unitary).
- **Gap** in JZ2020 at Proposition 6.9, p.805: the SO₂ case cites a theorem that assumes τ cuspidal, yet is applied to isobaric τ. It should be restricted to cuspidal τ or proved for isobaric τ. Affects a stated result (Corollary 6.11).
- **Gap** in JZ2020 at Theorem 4.8, pp.780–781 (line 1865–1866): the unramified computation in the stated generality is deferred to joint work described as forthcoming. It needs a published proof for all cases. Affects a stated result.
- **Gap** in JZ2020 at Appendix B, proof of Theorem B.2, pp.819–820: nonvanishing of the normalized operator is inferred from nonvanishing of each rank-one factor. A composition of nonzero operators can vanish, so a separate argument is needed. Affects the proof.
- **Misprint** in JZ2020 at §7.2, p.809: the regular case is treated with no smaller group for every type. For quasi-split U_{2n} the largest Bessel partition [2n−1,1] has stabilizer U₁. Affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "00c9576", "job": "REV-PKG-TwistedAutomorphicDescents", "model": "opus", "worker": "fable-rev106"} -->
