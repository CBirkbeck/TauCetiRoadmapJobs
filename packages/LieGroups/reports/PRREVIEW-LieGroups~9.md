# Review of LieGroups (pull request #2642 at 618e56b)
Folder: `TauCetiRoadmap/RepresentationTheory/LieGroups/`
**Verdict:** accepted

**Summary.** Accepted, with no findings: the 121 changed lines repair all seven small corrections of the previous review, the repairs introduce no new problem, the file elaborates with `sorry` as its only warning, and the dependency check reports no upward or cyclic edge. The description agrees with this head except for one sentence about a module name. There are two small corrections and one format note, none blocking; one of the corrections concerns a supplier section that another open pull request renumbers. The human reviewers are left the uncertified Bump, Bröcker–tom Dieck and Hall locators, as before.

## C01 — The citations of CotangentLagrangian C2.0 and C2.1 will not resolve once the open revision of that roadmap merges

A reader who follows "CotangentLagrangian C2.0" from the Needs lines of §7.5 and §9.2 (lines 1363 and 1875), from the Layer 7 and Layer 9 dependencies (lines 1592–1593, 2019), from the Scope (line 2131) or from the supplier contract (lines 2384–2386) finds the section on main (`TauCetiRoadmap/SymplecticGeometry/CotangentLagrangian/README.md`, headings at lines 190 and 222), so the citation is correct today. Pull request #2687, a revision of CotangentLagrangian, renames these headings "2.0 Elementary matrix polar package" and "2.1" (line 240 of its README at its head), and its text contains neither "C2.0" nor "C2.1" nor a sentence mapping the old numbers to the new ones. The content is unchanged and its statement of what LieGroups Layers 7 and 9 consume (its lines 279–280) agrees with this roadmap.

The smallest repair is one sentence in that revision ("C2.0 and C2.1 are now §2.0 and §2.1"), after which nothing changes here. Otherwise this text would cite both numberings, and the description would name that revision.

## C02 — The description says the BCH module is cited as `.BCH.Basic`, and the README cites the directory

The description's sentence "The module `TauCeti.Geometry.Lie.Exponential.BCH` is now `.BCH.Basic`" does not describe the head: the string `BCH.Basic` occurs nowhere in the README or the Lean file, and the Tau Ceti contract names the directory `Exponential/BCH/` (line 2237), which at the pin holds `Basic.lean` and `Bracket.lean`. Would read: "The module `TauCeti.Geometry.Lie.Exponential.BCH` no longer exists; the contract names the directory `Exponential/BCH/`."

## N01 — Varadarajan and Serre are listed under References and cited nowhere

Neither name occurs before the reference list (lines 2426–2429). Would cite them where they are used, or drop the two entries.

## Questions for the author

- §§8.4, 8.6 and 8.7 give "Bump, Parts I–III" for the equivariant GAGA comparison, the rank-one reflection shift and the Borel–Weil–Bott deduction. Does Bump's text contain these, or only Borel–Weil in degree zero? The book is recorded as uncertified, so this could not be checked.
- §7.9 and §7.2 give "Knapp, Chs. I, IV–VII" for the complex points of an algebraic group and for realification. Knapp's Ch. VII, §§1–2 support §7.10; no passage for the dictionary of §7.9 was found there. Which section is meant?

## Previous findings

The previous review (of `244e782`) had no findings; its small corrections and format note are accounted for here.

- C01 — repaired: `exists_holomorphic_extension` is gone from `Suggested.lean`; §7.11 (lines 1517–1519) and the module docstring say the extension is the universal property of `exists_complexification` applied to `GL(V)`.
- C02 — repaired: the module docstring now lists the compact real form and the `KAK` uniqueness modulo `N_K(𝔞)/Z_K(𝔞)` as "README targets that are not headline theorems", not as not statable.
- C03 — repaired: the field `chamber_normalizer_cover` is removed; `chamber_root_inequalities` with `chamber_subset` still determines the chamber, and `kakDecomposition` now tests the covering step.
- C04 — repaired: §0.3 cites Prop. 3.1 "for smooth homomorphisms", §1.2 Lemma 3.14(1), and Thm. 2.8 stands at the first sentence of §2.2; all three read in kirillov2008.
- C05 — repaired: §9.4, the Layer 9 examples, the Scope and the Tau Ceti contract name the five matrix theorems and the restricted Weyl group, each opened at the pin with the stated hypotheses.
- C06 — repaired: the downstream sentence reads "Layer 7's complexification and compact real forms, in its §4.3".
- C07 — repaired: §6.3 ends "(Bröcker–tom Dieck, Ch. IV, §1.)"; the book is uncertified, so the locator was not read.
- N01 — not repaired: Varadarajan and Serre are still cited nowhere before the reference list; carried as N01.

## Verified sound

| Statement | Instances tried | Values on each side | Result |
| --- | --- | --- | --- |
| §0.3 one-parameter subgroups (locator changed) | `G = ℝ`, `Circle`; kirillov2008 Prop. 3.1 | `φ(t) = tX`, unique `X = φ'(0)`; `t ↦ e^{itX}`; source states smooth morphisms, README says so | sound |
| §1.2 `d(Ad)_1 = ad` (locator changed) | `GL_n`: `d/ds exp(sX) Y exp(−sX)` at 0 | `XY − YX`; kirillov2008 Lemma 3.14(1) line 828 states `ad x.y = [x, y]` | sound |
| §2.2 closed-subgroup theorem (locator moved) | kirillov2008 Thm. 2.8(2), line 236; `ℚ ⊂ ℝ` | closed ⇒ Lie subgroup; `ℚ` not closed, `𝔨 = 0`, no embedded structure of dimension 1 | sound |
| §6.3 conjugacy and exhaustion (sample; locator added) | `SU(2)`, `t = diag(λ, λ⁻¹)`; `O(2)` | local degree `|λ⁻² − 1|² > 0`; reflections lie in no torus, connectedness needed | sound; source uncertified |
| §7.11 extension half (statement removed from Lean) | `G = U(1)`, `ρ(z) = z^k` | `ρ_ℂ(w) = w^k`; `w ↦ w̄^{−k}` also restricts to `z^k` but is antiholomorphic, so uniqueness holds | sound |
| §9.4 `IwasawaData` without the covering field | `SL₂(ℝ)`; `ℝ ⋊ {±1}`; compact `G` | chamber forced `{t·diag(1,−1), t ≥ 0}`; no roots, chamber `= 𝔞`; `𝔞 = 0`, chamber `{0}` | sound |
| §9.5 `kakDecomposition` (sample; datum changed) | `[[1,1],[0,1]] ∈ SL₂(ℝ)`; `ℝ ⋊ {±1}` | `gᵀg` eigenvalues `(3 ± √5)/2`, `a = exp(t·diag(1,−1))`, `t = log((1+√5)/2) ≈ 0.481 ≥ 0`; `g = k·exp X` | sound |
| §9.4 matrix Iwasawa citation | `[[1,1],[0,1]]`; `[[0,−1],[1,0]]` | `k = a = 1`, `u = g`; `a = u = 1`; pin: `O(n) × A × N ≃ₜ GL_n(ℝ)` | sound |
| Layer 9 examples: matrix `KAK` and `S_n` | `diag(1,2)`; `n = 2` | `d = (2,1)`, `U = V =` swap; `|N_K(A)| = 8`, `|Z_K(A)| = 4`, quotient `S₂` | sound |

The rows for untouched statements stand as in the previous review, of `244e782`.

- **Source locators** read against the text (4): kirillov2008 Prop. 3.1 (line 663), Thm. 3.7 (line 704), Lemma 3.14 (line 826), Thm. 2.8 (line 234).
- **Library declarations opened at the pin** (8): `Matrix.GeneralLinearGroup.existsUnique_iwasawa` and `TauCeti.iwasawaHomeomorph` (`LinearAlgebra/Matrix/GeneralLinearGroup/Iwasawa.lean` 280, 224), `Matrix.SpecialLinearGroup.existsUnique_iwasawa` (`SpecialLinearGroup/Iwasawa.lean` 213), the two `KAK` theorems (`GeneralLinearGroup/Cartan.lean` 65, `SpecialLinearGroup/Cartan.lean` 49, both `[RCLike 𝕜]`), `TauCeti.unitaryNormalizerPosDiagonalQuotientMulEquivPerm` (`GeneralLinearGroup/RestrictedWeylGroup.lean` 230; `Field`, `LinearOrder`, `IsStrictOrderedRing`, `StarRing`), `TauCeti.Lie.isEmbeddedLieSubgroup_of_isClosed` (`Geometry/Lie/Subgroup/Embedded.lean` 157), `TauCeti.Lie.mem_lieSubalgebraOfSubgroup_iff_exists_seq` (`Subgroup/LimitCriterion.lean` 105).
- **Cross-roadmap citations resolved** (2): CotangentLagrangian C2.0 and C2.1 on main and at the head of #2687 (C01); FormalConnectionsOpers §4.3 as in the previous review. No other roadmap, on main or at an open head, cites `exists_holomorphic_extension` or `chamber_normalizer_cover`.
- **Dependency check:** `depcheck: 196 roadmaps, 2168 edges, 0 problem(s)`; no UPWARD or CYCLE line. The pull request changes only the two files of the folder.
- **Elaboration:** `lake env lean` on `Suggested.lean` gives 21 `sorry` warnings and nothing else (22 before; one theorem removed). No statement was added or restated, so the one-tactic probe of the previous review stands. The automatic checks all passed on this head.
- **Headlines:** unchanged, except that the holomorphic extension is now named in the docstring as the universal property of `exists_complexification`, which is stated.
- **Description:** 116 Checks counted; the ten removed declarations are all named; the fourteen suppliers listed are the fourteen of the contracts, all on main; the Kirillov, FormalConnectionsOpers, `IwasawaData` and matrix-decomposition sentences agree with the head; one sentence does not (C02).

Overlap check: read CotangentLagrangian on main and at the head of #2687; LieGroupsPartII and RealSemisimpleLieGroups on main for their Layer 9 citations; ReductiveGroups as in the previous review. Shared objects and owners: the matrix polar package is CotangentLagrangian's (C2.0, §2.0 in its revision), cited here; `CartanInvolution`, `IwasawaData`, the restricted Weyl group and the decompositions of Layer 9 are this roadmap's, cited by LieGroupsPartII and RealSemisimpleLieGroups, neither of which uses the removed field; `G(ℂ)` is ReductiveGroups §3A.5e's, cited here. Nothing else is shared.

Source independence: changed passages only; 4 passages compared with 1 source (kirillov2008), none shared; largest share kirillov2008, 14 of about 59 locators; no layer was added, removed or reordered, so the contents comparison of the previous review stands (independent). Bump, Bröcker–tom Dieck and Hall could not be read.

Research link: §7.3's period-quotient complexification is the realization Heins (2025, Prop. 2.1) uses for entire functions on Lie groups; §2.1 is the finite-dimensional case of Neeb's Problem IV.1 (2006); Layer 9 is Knapp's (2002) Cartan, Iwasawa and `KAK` theory, consumed by RealSemisimpleLieGroups and LieGroupsPartII. Rests on the README, heins2025, neeb2015, knapp2002.

## Not verifiable

- §6.3's new locator, Bröcker–tom Dieck, Ch. IV, §1: the book is settled as uncertified, so it was not read; the mathematics of the section was recomputed.
- Sampled targets outside the changed passages (0.2, 2.3, 2.4, 4.2, 4.3, 5.3, 5.4, 6.5, 6.7, 7.3, 7.7, 7.9, 7.10) were not read again; they stand as in the previous review.
- The open heads of LieGroupsPartII and RealSemisimpleLieGroups were not read, only their text on main.

## Source issues

- **Misprint** in neeb2015 at Remark II.6.5(b), p. 39 (line 1925): the source says Yamabe's theorem describes the arc-component of the ambient group `G`; it should be the arc-component of the subgroup `H`, as Problem IV.1 uses it; affects nothing.
- **Misprint** in kirillov2008 at Theorem 3.32, proof, p. 29 (lines 1032–1033): the source says `g` commutes with the one-parameter subgroup of `x` iff `Ad g.x = 0`; it should be `Ad g.x = x`; affects nothing.

## For the human reviewers

- Not tested: wording and arrangement were not compared with Bump (12 of about 59 locators), Bröcker–tom Dieck (10) or Hall (6), all recorded as uncertified; kirillov2008 (largest share) and knapp2002 were read.
- Scope: Layers 6–8 cite Bump and Bröcker–tom Dieck only at the level of parts and chapters (for example README lines 993, 1361, 1716); whether part-level locators suffice for uncertified books is yours to decide.
