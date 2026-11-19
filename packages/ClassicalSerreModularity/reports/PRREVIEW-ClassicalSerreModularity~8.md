# Review of ClassicalSerreModularity (pull request #1020 at 71ddfdb)

**Verdict:** accepted

**Summary.** Accepted: no finding remains. The three ownership findings of the previous review are repaired: the twist-two vanishing is now deduced from the rational vanishing on main by a correct three-step argument, the nearly ordinary Hecke algebra is stated as Skinner and Wiles define it with its dictionary to PadicFamilies, and the soluble-extension target is Clozel–Harris–Taylor's lemma for every number field, stated in Lean. There are one small correction and one format note, neither blocking; four points are left for the human reviewers.

## C01 — The README does not say that GL2ModularityLifting §1.7 is now this target

A reader of "Consumers and boundaries" (README line 698 onwards) learns that PadicFamilies §§5.1 and 5.3–5.9 are targets owned here, but not the same fact about the soluble extensions, although the situation is the same. At its open head, GL2ModularityLifting §1.7 (its README, lines 240–244) still states the general lemma, says that `I.0/soluble-totally-real-base-change` "states the totally real case of this lemma", and declares it in Lean as `cht_soluble_prescribed_completions`, with the same binders and conclusion as `soluble_prescribed_completions` here (its `Suggested.lean`, lines 89–102). This roadmap is the earlier of the two and lists the lemma under "Owned here" (line 668), so the owner is settled; the sentence that tells the later roadmap to cite is only in the pull request's description.

A line in "Consumers and boundaries" would do, on the model of the PadicFamilies one: GL2ModularityLifting §1.7 is `I.0/soluble-totally-real-base-change` in its general form, owned here; its §1.8 (the evenness, `p`-local and quadratic clauses) has no counterpart.

## N01 — The bound that fails stands before Lemma 2.2 of [SW01], not in its proof

Line 337 says "Lemma 2.2, whose printed proof bounds, through Waldschmidt's theorem, the `ℤ_p`-rank". The source states the bound `δ ≤ d/2` in the paragraph before the lemma and gives the lemma as its consequence (`sw01` lines 241–246). "which rests on the bound, stated just before it, …" would be exact.

## Previous findings

- R01 — repaired: "the rational vanishing `H²(G_{L,S}, ℚ_p(2)) = 0` is AnabelianGeometryAndNonabelianChabauty §7.0 … makes `H²(G_{L,S}, (E/𝒪)(2))` a quotient of `H²(G_{L,S}, E(2)) = 0`" (line 618); ownership sentence and supplier row replaced.
- R02 — repaired: "PadicFamilies §§5.1 and 5.3–5.9 … are `I.1/nearly-ordinary-hecke-algebras` and `I.1/ordinary-control-and-weight-change` under the dictionary `T_∞(U, 𝒪) = T^{n.o.}(U)`, `Λ′_𝒪 = Λ_𝒪`. These targets are owned here" (line 702).
- R03 — repaired: "Let `K` be a number field, `D/K` a finite Galois extension, `S` a finite set of places of `K`, finite or infinite" (line 268), with the totally real form derived and `soluble_prescribed_completions` in Lean; C01 is what remains.
- C01 to C05 of the previous review — repaired: the docstring names the two Skinner–Wiles theorems and what each lacks; "Owned here" says R27.1 collects Lemmas 6.1 and 6.2 from their owners; I.2 is named in the build guide and in R33.1's Dependencies; the description states the vanishing for restricted ramification and divisible coefficients; line 337 says which bound fails and why (N01 here is about where it stands).
- N01, N02 of the previous review — repaired: the four statements have their own Needs lines, each id of which resolves; "Input I.n" no longer occurs.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
| --- | --- | --- | --- |
| Soluble extensions with prescribed completions (I.0), README | `cht` lines 5723–5726 (p. 116), proof 5729–5748 (p. 117); `K = D = ℚ`, `S = {∞}`; `S = ∅` | source: any number field, any finite set of places; `E_∞ = ℂ`: `ℚ(i)`, `ℝ ⊗ ℚ(i) = ℂ`; `E_∞ = ℝ`: `ℝ ⊗ E = ℝ^{[E:ℚ]}`; `S = ∅`: `E = K` | agrees with source; Check true |
| Its totally real form | `S ∪ S′ ∪ {real places}`, `K_v` on `S′ ∖ S`, `ℝ` at real places | every real place gets `ℝ`, so `E` totally real; `E_w = K_v` on `S′`, so split; `S ∩ S′` consistent by `E_v = K_v` | follows |
| Its route | Frobenius generators of `Gal(D/K)`; Galois closure | split places force trivial Frobenius on `E ∩ D`, so `E ∩ D = K`; completion of a conjugate at `w` is that of the tower at `σ⁻¹w`, compositum of copies of Galois `E_v` is `E_v` | sound |
| `soluble_prescribed_completions` (Lean) | `S = ∅`; complex place; `L v = K_v`; six one-step proofs | `E = ⊥` satisfies all five clauses when `S = ∅`; at a complex place `L v` is one-dimensional, `n = [E:K]`; `K_v ⊗_K E = ∏_{w∣v} E_w`, all `E_w` isomorphic as `E/K` is Galois | equals README; not closed by `simp`, `rfl`, `infer_instance`, `trivial`, `aesop`, or `⊥` with `simp` |
| Nearly ordinary Hecke algebras (I.1) | `sw99` lines 958–960, 979–999 (pp. 32–33), 1022–1037, 1091–1117 | source: `T_∞ = lim T₂(U_a, 𝒪)`, weight two; `Λ′_𝒪 = 𝒪⟦X₁..X_δ, Y₁..Y_d⟧` on a maximal `ℤ_p`-free summand; Prop. 3.3 free over `Λ′`; Cor. 3.4 | agrees; PadicFamilies §§5.1, 5.3, 5.6–5.9 match the dictionary |
| Residually irreducible ordinary lifting (I.1), changed sentence and Check | `sw01` lines 233–246; `F = ℚ` | source bound `δ ≤ d/2`; imaginary quadratic: total rank 2, plus part 1, minus part `1 > 1/2`; real quadratic: total 1, minus part 0 | true; N01 |
| Twist-two vanishing (R33.1) | sequence `0 → 𝒪(2) → E(2) → (E/𝒪)(2) → 0`; `L = ℚ`, `p = 3`, `S = {3, 7, ∞}` | `H³(𝒪/πⁿ(2)) = 0` (`p` odd), `H²` finite, so `H³(𝒪(2)) = lim = 0`; `H²(E(2)) = H²(ℚ_p(2))^{[E:ℚ_p]} = 0`; residue term `ℤ₃/(7−1) = ℤ/3` | true; Check true |
| Needs lines of I.2 and I.3 (four prescribed lifts, families, residual links) | each cited id opened | `I.2/hilbert-fixed-determinant-comparison` at line 353; supplier sections found on main; Brauer's theorem at the pin | resolve |

The rows for the untouched statements stand as in the previous review, of `1123d34`.

- Source locators checked against the text: 6, in 3 sources (`cht` Lemma 4.1.2 and proof, pp. 116–117; `sw99` §3.2 p. 33, Proposition 3.3, Corollary 3.4; `sw01` Lemma 2.2 and the paragraph before it).
- Library declarations opened at the pin: `TauCeti.GlobalNumberFields.Place` (`TauCeti/NumberTheory/NumberField/Global/Places/Basic.lean` 82), `Place.Completion` with its `Field` and `Algebra K` instances (`…/Places/Completion.lean` 36–44: the adic completion at a finite place, Mathlib's archimedean completion at an infinite one), `IntermediateField.LinearDisjoint` (`Mathlib/FieldTheory/LinearDisjoint.lean` 158), `Group.IsSolvable` (`Mathlib/GroupTheory/Solvable.lean` 145), `TauCeti.ClassFunction.character_mem_indCharacterSpanInt_isElementary` (`TauCeti/RepresentationTheory/Induction/Brauer/Induction.lean` 127).
- Cross-roadmap citations resolved: AnabelianGeometryAndNonabelianChabauty §7.0 on main (its README lines 8441–8479: degree two vanishes rationally for `k ≥ 2`, and inflation to finite `T ⊇ T₀` is an isomorphism in degrees one and two); ArithmeticGaloisDuality §R02.1.2 (Tate's inverse-limit theorem, line 611; long exact sequences with a continuous section, line 677) and §R02.4.4 (finiteness and `cd_ℓ ≤ 2`, line 3520); PadicFamilies §§5.1, 5.3, 5.6–5.9 and GL2ModularityLifting §1.7 at their open heads; the ids of the four new Needs lines (SmallRamificationAndAbelianVarietyBaseCases §§5.0b, 5.0d, 5.1–5.4; GL2AutomorphicRepresentationsAndTransfer §§R17.6.17–R17.6.19; DeformationAndDerivedPatchingAlgebra §§3.4–3.5; LocalGaloisDeformationRings Layers 4–5, §§8.2–8.19; GlobalGaloisDeformations R04.3; ArithmeticGaloisRepresentations Layers 1–5).
- Dependency check: `depcheck: 200 roadmaps, 2208 edges, 0 problem(s)`; no UPWARD or CYCLE line. AnabelianGeometryAndNonabelianChabauty is on main and does not name this roadmap.
- Automatic checks: all passed at this head when run again. Nothing in the pull request lies outside the folder.
- Elaboration: `Suggested.lean` gives two `sorry` warnings (lines 81 and 120) and nothing else. The elaborated types of the nine declarations were compared with the README; none lost a binder, and the new theorem's type is the README statement of line 268.
- Pull-request text: the title and description agree with this head (a new roadmap; two theorems and seven definitions in Lean; the import of Tau Ceti's module of places and completions; the vanishing deduced from the roadmap on main; the two ownership statements).
- Headline theorems: the soluble-extension lemma and Lemma 8.2 are stated; the others are named in the module docstring with the carrier each lacks, now including the two Skinner–Wiles theorems.

Overlap check: read SerreModularityByCompatibleSystems, GL2ModularityLifting, PotentialModularityAndCompatibleSystems, OrdinaryAutomorphicFormsAndModularityLifting, ModularityAndLanglandsExtensionsPartII, AlgebraicModularFormsAndSerreWeights, SerreWeightAndLevelOptimisation, GlobalGaloisDeformations as in the previous review, and at this head PadicFamilies, GL2ModularityLifting and AnabelianGeometryAndNonabelianChabauty again. Shared objects: the rational twist-two vanishing (owner AnabelianGeometryAndNonabelianChabauty §7.0, cited here); the nearly ordinary Hecke algebra and its four theorems (owner this roadmap, stated at line 702; PadicFamilies §§5.1, 5.3–5.9 does not yet cite it); soluble extensions with prescribed completions (owner this roadmap, the earlier one; GL2ModularityLifting §1.7 still states and declares the lemma; C01); Khare–Wintenberger's Lemma 6.2(ii) (owner AlgebraicModularFormsAndSerreWeights §4.14, now said at line 670).

Source independence: changed passages only; 4 passages compared with 3 sources (`cht`, `sw99`, `sw01`), none shared (the statement of the lemma admits one wording, and the route here is not the source's); largest share `kw2`, 19 of about 110 citations, as in the previous review; no layer was added, removed or reordered, so the contents were not compared again; [Ki] could not be read.

Research link: Layer I holds the theorems of Moret-Bailly (1989), Skinner–Wiles (1999, 2001), Kisin (2009) and Khare–Wintenberger (2009) from which Khare–Wintenberger and Dieulefait–Pacetti (2022) prove Serre's conjecture; R33.1 serves Tung (2018, 2019) and Pan (2022). Rests on the README's summary and the sources read.

## Not verifiable

- [Ki], Proposition (3.13) and Theorem (3.14): the author's file is a DVI that could not be read; untouched by this change.
- [Ki2]: behind a paywall; cited by locator only, as the README says.
- Skinner's correction to [SW01] for the imaginary-quadratic dihedral case: unpublished, not in the References.
- Waldschmidt's theorem, which [SW01] cites for its bound: not opened; the failure of the bound over `ℚ` was computed directly.
- The description's sentence on which AI tools assisted.

Automatic checks set aside as false positives: none; every check passed. A resolver's two leads (AlgebraicModularFormsAndSerreWeights R15.3 and R15.4 "found nowhere") resolve through that roadmap's identifier sentence, as in the previous review.

## Source issues

- **Error** in sw01 at the paragraph before Lemma 2.2 and Lemma 2.2, printed p. 191: the source says the rank of the minus part of the Galois group of the maximal abelian pro-`p` extension of the quadratic field is at most half the degree; it should be restricted to quadratic fields that are not CM (over the rationals an imaginary quadratic field gives rank one); affects a stated result.

## For the human reviewers

- Scope: the imaginary-quadratic dihedral branch of `I.1/residually-irreducible-ordinary-lifting` (README lines 337 and 654) rests on Skinner's unpublished correction to [SW01]; the README makes the corrected argument a proof target with no reference.
- Licence: README lines 43 and 355 say the trace/determinant and classifying-map interfaces follow the Imperial College London FLT project; `Suggested.lean` was not compared with that repository.
- Licence: [KW-Ann] and [KiFF] were read from the Annals' own archive, [Ri] from the publisher's archive, [Bö] from a research group's site, [KW-I] and [KW-II] from an author's page; these hosts are in no configured licence class.
- Not tested: [Ki] (three citations, two targets) could not be read, so the hypotheses of `I.2/same-weight-crystalline-lifting` were not compared with it.
- Ownership: `soluble_prescribed_completions` here and `cht_soluble_prescribed_completions` in the open GL2ModularityLifting (its `Suggested.lean`, lines 89–102) state the same theorem; this roadmap merges first, and the later one has to cite it.
