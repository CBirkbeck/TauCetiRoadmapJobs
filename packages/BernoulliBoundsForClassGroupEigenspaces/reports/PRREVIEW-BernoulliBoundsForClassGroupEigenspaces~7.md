# Review of BernoulliBoundsForClassGroupEigenspaces (pull request #2896 at 72a1913)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/BernoulliBoundsForClassGroupEigenspaces/`
**Verdict:** needs changes

**Summary.** Needs changes, for one sentence: in the statement of the formal proof's Euler system that this head adds to 14.1, the last hypothesis ("quotient character trivial on inertia at `p`") contradicts the hypotheses before it, so that no representation satisfies the statement as written; the formal proof's condition is that this character is `χ_p^{−2e}` on inertia. Everything else in the 40 changed lines agrees with the formal proof's declarations, and the earlier remark on the partial list of hypotheses is repaired. Two small corrections and two format notes do not block. The human reviewers still decide the scope and licence questions, and a new section of the family index is theirs to read.

## R01 (P2) — The Euler system of the formal proof is restated in 14.1 with a last hypothesis that the other hypotheses exclude.

In 14.1 (lines 709–716) the representation `W` is upper triangular on a decomposition group at `p`, its first diagonal character is `χ_p^e φ` on inertia with `φ` of finite order, and `(det W)² = 1`; the passage then asks that "the twist `W ⊗ χ_p^{−e}(det W)⁻¹χ` is attached to a newform of weight `2e + 1` […] and has quotient character trivial on inertia at `p`". On inertia the second diagonal character of `W` is `det W · χ_p^{−e} φ⁻¹`, so the quotient character of that twist is `χ_p^{−2e} φ⁻¹ χ`, which has infinite order on inertia for `e ≥ 1`. No `W` meets the hypotheses as written (already for `e = 1`: the twist has diagonal characters of finite order and `χ_p^{−2}` times finite order), so the sentence presents as a theorem of the formal proof a statement that is empty, and a reader who wants to use or reprove the Euler system has the wrong normalisation at `p`.

The formal condition is the last clause of `GlobalTheory.Ord2.SrcUr` (`Development/AbelianVarietyTheory/Statements/CuspidalUnitaryTwists/ZetaUr.lean`): on inertia, `W₁₁ · χ_p^{e} · (det W)⁻¹ · χ = 1`, with exponent `+e`, while the twist in the clause before it has exponent `−e`; the twist there is multiplication of `W` by the character (`UpperTheory.V.Af.tw`, `AV/AutomorphicForms/BlochKatoSelmerVanishes.lean`). So the quotient character of the twist is `χ_p^{−2e}` on inertia, the shape an ordinary form of weight `2e + 1` has in the convention of `Newform.Att` (inverse Frobenius has the Hecke polynomial). The smallest change: replace "and has quotient character trivial on inertia at `p`" by "and has quotient character equal to `χ_p^{−2e}` on inertia at `p`"; equivalently, "and the first diagonal character of `W` is `χ_p^{e}χ` on inertia at `p`". The target 14.1 itself is unaffected.

## C01 — 14.1 no longer says that the Galois-cohomological input of the formal deduction is assumed, not proved.

The earlier text said that `LitCoh` and `ZetaUr` were "taken as hypotheses". The head rightly says that `ZetaUr` is now a theorem (`UpperTheory.V.Z.Kato.Final.zetaUr : GlobalTheory.Ord2.ZetaUr`, with no hypothesis), but writes of the other input only "from its statements of Galois cohomology" (line 726). The deduction is still `vanishOrdL_of_zetaUr : LitCoh → ZetaUr → VanishOrdL`, and `LitCoh` is a structure of twelve statements of published theorems (Poitou–Tate duality, local finiteness and duality, the Euler characteristic formulas, the Greenberg–Wiles formula, the Bloch–Kato local conditions), which the proof obtains only from further bundles of such statements. A clause such as "statements of published theorems of Galois cohomology, which it takes as a hypothesis" keeps the reader from counting them as proved there.

## C02 — The family index describes this roadmap by content it does not have.

`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`, lines 149–151, still reads "bounds for eigenspaces of class groups and K-groups by Bernoulli numbers, Stickelberger-type annihilation, and the vanishing of Bloch–Kato groups". This roadmap leaves Stickelberger annihilation to EulerSystemsCyclotomicMainConjecture (Scope and ownership) and states nothing of that kind; its Layer 9 is not mentioned. A line that matches: "twisted Tate–Shafarevich groups and their bounds by Bernoulli numbers, explicit torsion bounds for the homology of `GL_N(𝒪_L)`, étale cohomology and K-groups, and the vanishing of Bloch–Kato groups".

## N01 — ArithmeticKTheoryPartII §8.3 is cited in 9.8 (a) (line 447) as a comparison but appears in neither the Layer 9 Dependencies nor the supplier contracts; a clause "(a comparison, not an input)" would tell a reader that nothing is consumed from it.

## N02 — The family index (lines 12–19) now says the files the family names "are to be looked up at that first commit" (`40e56bab`), while this README's References (line 874) say its paths "refer to" commit `ab0b7522`. A reader is given two commits for the same locators; name one, or say in the References that the cited files are the same at both.

## Previous findings

The previous report had no finding; its small corrections and format note are accounted for here.

- C01 — repaired: 14.1 reads "under hypotheses that include these" and "The full list is the structure `UpperTheory.V.Z.Kato.Used`, the hypothesis of the formal statement `UpperTheory.V.Z.Kato.KatoTwo`", with `K` imaginary quadratic, the determinant and residual reducibility; Downstream consumers likewise.
- C02 — not repaired: the family index, lines 149–151, still has "Stickelberger-type annihilation"; written again as C02.
- N01 — not repaired: line 447 is unchanged; written again as N01.

The repair of C01 was extended by a statement of the formal Euler system; R01 and C01 of this report concern that new text.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 14.1, Euler system, last hypothesis | `e = 1`; general `e ≥ 1` | README: quotient of twist trivial on inertia. Computed: `W₁₁χ_p^{−e}det⁻¹χ = χ_p^{−2e}φ⁻¹χ`, infinite order. Formal: `W₁₁χ_p^{e}det⁻¹χ = 1` | hypotheses contradictory as written | R01 |
| 14.1, Euler system, other hypotheses | fields of `Nf` | `l ≠ 2`, `1 ≤ e`, continuous, integral, unramified outside `S ∋ l`, `det² = 1`, `det(c) = −1`, irreducible on `ker χ_l ∩ ker det`, `W₁₀ = 0` on `Dec`, `W₀₀^m = χ^{em}` on inertia, `W₀₀ ≠ χ_l` | each as the README says | none |
| 14.1, Euler system, newform clause | `SrcUr` | `¬ l ∣ g.M`; `‖ι⁻¹ a_l‖ = 1`; `χ` trivial on `G_{ℚ(μ_l)}`; `g.Att` of `tw W (χ_l^{−e} det⁻¹ χ)`, weight `2e+1` | as the README says | none |
| 14.1, Euler system, conclusion | `ES`, `Tame`, `Unr`, `Gr` | `y ∈ Z1` (continuous), integral, `Unr`, `¬Gr`; `Y(st)(x) = Y(s)(x) + W(s)Y(t)(x − ψ(s))`; `∑ₓY = P·y + (Wb − b)`; `‖P − u·det(W(σ) − 1)‖ ≤ ‖lⁿ‖`, `‖u‖ = 1` | as the README says (cocycle over the field of `ψ` by Shapiro) | none |
| 14.1, provenance of the Euler system | `zetaUr`, `kato_eulerSystem_integrality`, `vanishOrdL_of_zetaUr` | `zetaUr : ZetaUr` with no hypothesis; deduction `LitCoh → ZetaUr → VanishOrdL`; `LitCoh` twelve fields, assumed | `ZetaUr` a theorem; `LitCoh` a hypothesis | C01 |
| 14.1 and Downstream, full list `Used` | fields `quad`, `imag`, `det`, `θ_ker`, `red` | `finrank ℚ K = 2`, totally complex; `det W = θ`, `ker θ = G_K`; `‖tr W − (θχ^eψ + (χ^eψ)⁻¹)‖ < 1` | imaginary quadratic, quadratic determinant, residually reducible: as stated | none |
| Lean theorem (cited by 9.4; untouched) | elaborated type | `L`, `[Field L]`, `[NumberField L]`, `N`, `m`, `1 ≤ N`; bound `c₂(m+1)(nN)³N·log(2|d|nN)` | equals 9.4; unchanged since `e41e82f` | none |

The rows of the previous reviews for the untouched statements stand as in the previous review, of `e41e82f`.

- Formal proof (local clone whose sources agree with commit `ab0b752`): 10 files read for the changed passage (`Statements/CuspidalUnitaryTwists/ZetaUr`, `Definitions/Foundations/FinalTheorems`, `Definitions/Foundations/VanishOrdL`, `Proofs/FoundationProofs/VanishOrdLOfZetaUr`, `Definitions/AutomorphicMembership/Brauer`, `UnramifiedZeta/ZetaUr`, `AdmissibleWeightedDataMonoCoef`, `KatoTwoOfUseN`, `AutomorphicForms/BlochKatoSelmerVanishes`, `AutomorphicForms/Newform`); the 12 declarations the diff names are each in the file named.
- Source locators into published texts: the diff changes none; the seeded sample falls in the changed passages only at 14.1, checked above.
- Cross-roadmap citations in the changed passages: KatoEulerSystems §7.9 (heading "Finiteness of Selmer groups over abelian fields" at its open head) and UniformWildKernelBounds, both resolved.
- Dependency check: `depcheck: 132 roadmaps, 1474 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed at this head.
- Elaboration: `lake env lean` on `Suggested.lean` gives `declaration uses 'sorry'` at line 78 as its only message; the file is unchanged since `e41e82f`.
- Changes outside the folder: the family index only (its README: a pointer to the first commit of the formal proof's repository and a new section, "When a roadmap is wrong").

Overlap check: read UniformWildKernelBounds, HeckeIdealsAndTaylorWilesRelations and ArithmeticKTheoryPartII (open), ArithmeticKTheory, BorelRegulators, KatoEulerSystems and EulerSystemsCyclotomicMainConjecture, as in the previous review; the change adds no object and moves none. Sha kernels and their duality: HeckeIdealsAndTaylorWilesRelations §10.1, cited; `Sha²_{i,ℓ}` and the wild kernels: ArithmeticKTheory §6.9, cited; Kato's finiteness theorem: KatoEulerSystems §7.9, cited; `Ш¹(F, ℓ, e)`, the torsion bounds and the étale bound: this roadmap. The Euler system the head describes is recorded as the formal proof's, not as a target.

Source independence: changed passages only; 3 passages compared with 1 source (the Euler-system paragraph, the list of `Used` and the Downstream sentence against the formal proof's Lean statements), no wording shared (the source has no prose there; the paragraph lists the hypotheses of two structures in the order the mathematics gives); largest share the formal proof, about 95 of 110 locators; the diff adds, removes and reorders no layer, so the arrangement stands as compared before: independent.

Research link: Layer 9 extends the torsion bounds of Soulé (1999, 2003) and Bayer-Fluckiger–Emery–Houriet (2014) to all primes; Layers 13–14 rest on Kato's finiteness theorem and the Ribet–Momose open image theorem; the roadmap supplies UniformWildKernelBounds in a family following Alpöge's formal proof (2026). Rests on the README, Soule1999, BFEH2014.

## Not verifiable

- Arlettaz 1991, Theorem 1.5 (9.8 (a)): recorded as uncertified; the text was not read.
- Soulé 2003: described in the README only through BFEH 2014; its own text was not read.
- The formal proof: statements were read, proofs were not checked or compiled; `KatoTwo` and the route from the zeta elements to `zetaUr` were not followed beyond the declarations named.
- Whether the files cited are identical at the first commit of the formal proof's repository and at `ab0b752` (N02): the first commit was not available to me.
- The copy of this folder in the family-wide pull request: its head was not compared; the tools report no conflicting open pull request.

## Source issues

- none

## For the human reviewers

- Scope: Layers 6, 10 and 9.5–9.7 cite no refereed source; their only source is the formal Lean proof by L. Alpöge announced 2026-11-20 (README References, line 874; family index lines 10–19).
- Licence: the repository `leanprover-community/riemann-hypothesis` says the proof belongs to its author and was published without a licence; the family index says so. The README cites file paths and declaration names and copies no code; 14.1 now paraphrases two of its structures in prose.
- Licence: `Suggested.lean` uses the same carrier expression as the formal proof's `UpperTheory.V.K.HGL` and `torsHGL` (`GeneratorCountTuples/TorsBoundPow.lean`); the theorem's name, quantifiers and bound differ from `TorsBound` there.
- Not tested: the wording comparison with the formal proof covered its Lean statements only; it has no prose to compare.
- Policy: the family index gains a section "When a roadmap is wrong" (lines 45–75), which tells reviewers of library contributions not to block one that departs from a roadmap where the formal proof shows the roadmap wrong; the pull request's description does not mention it.
