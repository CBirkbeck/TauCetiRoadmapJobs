# Review of BernoulliBoundsForClassGroupEigenspaces (pull request #2896 at e41e82f)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/BernoulliBoundsForClassGroupEigenspaces/`
**Verdict:** accepted

**Summary.** Accepted: this incremental re-review of the 41 lines changed since `5ac6d6d` found no statement false or unsupported. Five of the six earlier small corrections are repaired and the repairs are right: the Lean theorem is now the torsion bound for every number field, and the hypotheses `BOdd`, `LitCoh` and `ZetaUr` of the formal proof are named where its declarations are cited, each confirmed in its file. Two small corrections and one format note remain, none blocking: the list of hypotheses in 14.1 for the downstream instance is part of the formal proof's list, and the family index still describes this roadmap by Stickelberger annihilation. The human reviewers still decide the scope question and the licence of the formal proof's repository.

## C01 — The list of hypotheses in 14.1 under which the formal proof is said to prove the downstream instance is only part of that proof's list.

A reader of 14.1 (lines 692–700, repeated under Downstream consumers, line 734) takes "under these hypotheses" as the whole list and would look in the formal proof for a vanishing theorem that it does not state. The hypotheses the README lists are fields of the structure `UpperTheory.V.Z.Kato.Used` (`AV/ModularityArgument/KatoQuadraticCharacters/KatoTwoOfUseN.lean`), the hypothesis of `UpperTheory.V.Z.Kato.KatoTwo` in the same file: `gen`, `l_cop`, `N_even`, `cop`, `level`, `flag`, `irr`. The same structure has further fields that the README does not mention: `det` (the determinant is the quadratic character of `K`), `red` (the trace is congruent, modulo the maximal ideal, to that of the sum of two characters `θ·χ_ℓ^e ψ` and `(χ_ℓ^e ψ)⁻¹`, so the representation is residually reducible), `tr_ine`, `ord`, `even`, and the conditions on the auxiliary character `ψ`. The level clause the head adds is right: it is `Af.Level l (N·|d_K|) ![e, −e] W`, whose two halves `LevelAway` and `LevelAt` (`AV/AutomorphicForms/BlochKatoSelmerVanishes.lean`) say what the parenthesis says, and no field constrains the level of `f`.

The smallest change: name `Used` and `KatoTwo` with their file, and write "among them" before the list, or add the residual reducibility and the determinant. This also answers the first question of the previous report. The target 14.1 is unaffected.

## C02 — The family index describes this roadmap by content it does not have.

`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`, lines 113–115, still reads "bounds for eigenspaces of class groups and K-groups by Bernoulli numbers, Stickelberger-type annihilation, and the vanishing of Bloch–Kato groups". This roadmap leaves Stickelberger annihilation to EulerSystemsCyclotomicMainConjecture (Scope and ownership, line 742) and states nothing of that kind; its Layer 9 is not mentioned. A line that matches: "twisted Tate–Shafarevich groups and their bounds by Bernoulli numbers, explicit torsion bounds for the homology of `GL_N(𝒪_L)`, étale cohomology and K-groups, and the vanishing of Bloch–Kato groups".

## N01 — ArithmeticKTheoryPartII §8.3 is cited in 9.8 (a) (line 447) as a comparison but appears in neither the Layer 9 Dependencies nor the supplier contracts; a clause "(a comparison, not an input)" would tell a reader that nothing is consumed from it.

## Questions for the author

- Does Arlettaz's Theorem 1.5 give one exponent `R_m` for the map to `H_m(GL(R); ℤ)` for every ring, from `m = 1`? The two sources I could read cite it only for the primes that can divide the kernel (Soule1999 lines 347–348; BFEH2014 lines 145–146). The text is not available to me.

## Previous findings

The previous report had no finding; its small corrections and format note are accounted for here.

- C01 — repaired: the theorem reads `∀ (L : Type) [Field L] [NumberField L] (N m : ℕ), 1 ≤ N → …`; 9.4 (line 285) and the module docstring no longer restrict to totally complex `L`.
- C02 — repaired: 9.5 names `SChain` and `BOdd` with `sChain` and `bOdd`; 9.7 adds `BOdd` to the hypotheses of `lemmaK`; 14.1 says `LitCoh` and `ZetaUr` are "taken as hypotheses". All read in their files.
- C03 — repaired: line 200 reads "the saturation of `⟨Λ₀⟩` modulo the span of the subfamily embeds in it and maps onto the torsion".
- C04 — repaired: 11.1 adds "The route below does not use that `A` contains a cyclotomic `ℤ_p`-extension; that hypothesis is the setting in which [FormalProof] and UniformWildKernelBounds use the bound."
- C05 — repaired: the description lists twenty-one roadmaps on main and says the Lean theorem is "the torsion bound of 9.4 with all primes, for every number field".
- C06 — not repaired: the family index, lines 113–115, still has "Stickelberger-type annihilation"; written again as C02.
- N01 — not repaired: line 447 is unchanged; written again as N01.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 9.4 and the Lean theorem, every number field | `L = ℚ`, `N = 1`, `m` odd; `m = 0`; `L = ℚ`, `N = 2`, `m = 1` | `H_m(C₂; ℤ) = ℤ/2`: `log log 2 ≈ −0.37 ≤ c₂(m+1) log 2`; card 1: Lean `log 0 = 0`; `(ℤ/2)²`: `0.327 ≤ 44.4 c₂` | true for a suitable `c₂ ≥ 0`; right side positive since `2|d|nN ≥ 2` | none |
| Lean theorem, elaborated type | binders | `L`, `[Field L]`, `[NumberField L]`, `N`, `m`, `1 ≤ N`; no `IsTotallyComplex` | equals 9.4 as stated | none |
| Padding probe | by reading | the statement generalises the one probed at `5ac6d6d` (five one-tactic attempts failed); a tactic closing it would close that one | not padding | none |
| 9.1 route (parenthesis) | `ι = {1}`, `Λ₀ = {2, 3}`, subfamily `{2}`; general | saturation `ℤ`, span `2ℤ`, `M = 2ℤ`: `ℤ/2ℤ` embeds in `ℤ/M`, maps onto torsion `0`; saturation ∩ `M` = span by independence | holds; `2 ≤ b = 3` | none |
| 9.5 citation of `BOdd`, `SChain` | formal `BOdd`, `zSeq`, `SUpperOf` | `k` even, `k+1 < r₂`, `n ≥ 2(k+1)+4`: rank of span of `zSeq x k` ≤ `r₂`; `zSeq` applies `ψ^l − l^{t+2}` for `t < k = j−1`; `SUpperOf := SChain → BOdd → SUpper` | as recorded | none |
| 9.7 citation of `lemmaK` | formal signature | `lemmaK (hB : BOdd) (hP : PoitouTateDuality) (hF : LocalFinitenessK) (hT : LocalTateDualityK) : ∃ CK, LemmaK CK`; `bOdd : BOdd` | four hypotheses, as recorded | none |
| 11.1 added sentence | `A` a number field | route uses `(σ−1)^p = 0`, inflation–restriction for `G/H ≅ ℤ/p`, procyclic tame inertia; gives `rank_p Cl(A′) ≤ p(rank_p Cl(A) + #P)` | sentence true | none |
| 14.1 formal form | `vanishOrdL_of_zetaUr`, `VanishOrdL`, `LitCoh`, `ZetaUr` | type `LitCoh → ZetaUr → VanishOrdL`; `VanishOrdL`: `l ≠ 2`, `1 ≤ e`, `admitted`, `SrcL`; `LitCoh` a structure of twelve literature statements | as recorded | none |
| 14.1 downstream list | `Used`, `Level`, `LevelAway`, `LevelAt` | `¬ l−1 ∣ 2e`; `¬ l ∣ |d_K|·h_K`; `Even N`, coprime to `d_K`; level `N·|d_K|`, weights `(e, −e)`; also `det`, `red`, `ord`, `tr_ine`, `even` | listed fields right; list partial | C01 |

The rows of the previous review for the untouched statements stand as in that review, of `5ac6d6d`.

- Formal proof at commit `ab0b752`: 13 files read (`LemmaKOfSteps`, `SChain`, `BOdd`, `SUpperOf`, `LemmaKOfLitN`, `HasVal`, `Brauer`, `ZetaUr`, `VanishOrdL`, `VanishOrdLOfZetaUr`, `FinalTheorems`, `KatoTwoOfUseN`, `BlochKatoSelmerVanishes`); the 8 declarations the diff newly cites are each in the file named.
- Source locators in the changed passages: Soule1999 Lemma 1, p. 5 (9.1) and Theorem 1, p. 7 (9.4) stand as verified in the previous review; the diff changes no locator into a published text.
- Cross-roadmap citations in the changed passages: KatoEulerSystems §7.9 and UniformWildKernelBounds, unchanged and resolved in the previous review.
- Family index change: the added sentence on the repository's licence agrees with that repository's README (its section "License", lines 99–102 at the cited commit).
- Dependency check: `depcheck: 170 roadmaps, 1999 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed at this head.
- Elaboration: `lake env lean` on `Suggested.lean` gives `declaration uses 'sorry'` at line 78 as its only message; the elaborated type was compared with 9.4.
- Changes outside the folder: the family-index files only.

Overlap check: read UniformWildKernelBounds, HeckeIdealsAndTaylorWilesRelations and ArithmeticKTheoryPartII (open), ArithmeticKTheory, BorelRegulators and EulerSystemsCyclotomicMainConjecture (main), as in the previous review; the change adds no object and moves none. Sha kernels and their duality: HeckeIdealsAndTaylorWilesRelations §10.1, cited; `Sha²_{i,ℓ}` and the wild kernels: ArithmeticKTheory §6.9, cited; Stickelberger annihilation: EulerSystemsCyclotomicMainConjecture, not restated; `Ш¹(F, ℓ, e)`, the torsion bounds and the étale bound: this roadmap.

Source independence: changed passages only; 7 passages compared with 2 sources (the changed sentences of 9.1 and 9.4 and the Lean docstring against Soule1999; those of 9.5, 9.7, 11.1 and 14.1 against the formal proof's statements), none shared; largest share the formal proof, about 88 of 103 locators; the diff adds, removes and reorders no layer, so the arrangement stands as compared in the previous review: independent.

Research link: Layer 9 extends the torsion bounds of Soulé (1999, 2003) and Bayer-Fluckiger–Emery–Houriet (2014) to all primes; Layers 13–14 rest on Kato's finiteness theorem and the Ribet–Momose open image theorem; the roadmap supplies UniformWildKernelBounds in a family following Alpöge's formal proof (2026). Rests on the README, Soule1999, BFEH2014.

## Not verifiable

- Arlettaz 1991, Theorem 1.5 (9.8 (a)): recorded as uncertified; the text was not read.
- Soulé 2003: described in the README only through BFEH 2014; its own text was not read.
- The formal proof: statements were read, proofs were not checked or compiled. Whether `LitCoh` and `ZetaUr` are discharged elsewhere in it, and whether `KatoTwo` is proved without further hypotheses (the proof I read, `twoS`, has `SrcS` and a spherical condition as extra hypotheses), was not followed.
- The copy of this folder in the family-wide pull request: its head was not compared; the tools report no conflicting open pull request.

## Source issues

- none

## For the human reviewers

- Scope: Layers 6, 10 and 9.5–9.7 cite no refereed source; their only source is the formal Lean proof by L. Alpöge announced 2026-11-20 (README References, line 852; family index lines 10–15).
- Licence: the repository `leanprover-community/riemann-hypothesis` says in its README that the proof belongs to its author and was published without a licence; the family index now says so. The README cites file paths and declaration names and copies no code.
- Licence: `Suggested.lean` uses the same carrier expression as the formal proof's `UpperTheory.V.K.HGL` and `torsHGL` (`GeneratorCountTuples/TorsBoundPow.lean`); the theorem's name, quantifiers and bound differ from `TorsBound` there.
- Not tested: the wording comparison with the formal proof covered its Lean statements only; it has no prose to compare.
