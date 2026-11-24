# Review of HeckeIdealsAndTaylorWilesRelations (pull request #3027 at 374b9ce)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/HeckeIdealsAndTaylorWilesRelations/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 90 changed lines since `74a09b7`. I checked the new origin and method labels of 3.13a, 4.2a, 9.9 and 10.1, the convention paragraphs, 10.1's Corollary-of line against ArithmeticGaloisDuality §D7.6a, the rewritten contracts, and the new references against their texts; there is no finding and no stated result is affected. Accepted with four small corrections and one format note, none blocking; the weightiest correction is that 4.2a's origin label calls "particular to this proof" a construction that Thorne (2022) §§3 and 5 publishes. Left for the human reviewers: the formal proof, the README's main source, was not tested against three of the method labels, and C01 bears on how far the labels can be trusted.

## C01 — The origin label of 4.2a calls "particular to this proof" a construction that Thorne (2022) publishes, a paper the README already cites in 9.9

A reader who takes the label at its word credits the formal proof with ideas that are in a published paper, and sorting that out is exactly what these labels are for. The label at line 321 lists three features, and Thorne (2022) has all three:
- **Taylor–Wiles data.** A Taylor–Wiles datum is a factorisation of the characteristic polynomial of Frobenius into two coprime factors, with no condition on the residual eigenvalues (§5, p. 19; Tho22 lines 920–927).
- **Comparison maps.** There are two maps between the parahoric invariants and the spherical invariants tensored with the ring of the factorisation. One is the inclusion extended over that ring. The other is built from a pair of dual bases of that ring over the symmetric polynomials, followed by the trace. Both composites are multiplication by the resultant of the two factors (Lemma 3.7 and Proposition 3.8, pp. 12–13; lines 586–634). This is the mechanism that 4.2a's own method label describes at line 329.
- **Relations.** The relations are multiplied by a power of the resultant, with exponent `n!` independent of the level (relation (5.1), p. 19; line 945).

What 4.2a adds is the following: the full flag at Iwahori level instead of two blocks at parahoric level; the norm `Nw` kept in the factors, where Proposition 3.8 assumes `(q_v − 1)π = 0`; the product `f` over all ordered pairs; and a reducible residual determinant.

Line 321 would then read: "*Origin:* adapted from Thorne (2022), §3 (Lemma 3.7, Proposition 3.8) and §5 (its Taylor–Wiles data and relation (5.1)), where the characteristic polynomial of Frobenius is split into two coprime factors at parahoric level with no condition on the residual eigenvalues: here the full flag at Iwahori level, at a reducible residual determinant, with `f` the product over all ordered pairs."

## C02 — Wake and Wang-Erickson prove the equality that 3.13a's origin label attributes to them only when a class group vanishes

The label (line 63) and the [WWE17] entry (line 978) say that the paper has a ring of ordinary pseudorepresentations equal to the Eisenstein component of a Hida Hecke algebra. Read that way, the rank-two equality is unconditional. In fact Theorem 4.2.8 (p. 10 of arXiv v4; WWE17 line 509) assumes that the Iwasawa class group `X_θ` vanishes. It also relies on the standing hypotheses of §2.1: `p ≥ 5`, `p ∤ Nφ(N)`, and conditions (a)–(c) on `θ` (lines 86–98). The paper's abstract itself restricts the claim to "these cases". In both places, the passage would read: "… a ring of ordinary pseudorepresentations equal, when the Iwasawa class group `X_θ` vanishes, to the Eisenstein component of a Hida Hecke algebra in rank two (Theorem 4.2.8)".

## C03 — The description lists exceptions to its rule on general theorems, and 10.1 is missing from that list

The paragraph of part 2 says that such a section "now states the proof's form and the general roadmap the general theorem, except where …". 10.1 is such a section and does not follow the rule, because the formal proof has only one instance of it. It keeps its statement for every lattice and every `Σ ⊂ S`, and records that instance in a paragraph (`T = ℤ_p(e+1)`, vanishing imposed above `p`, lines 773–780). It also names ArithmeticGaloisDuality §D7.6a on a Corollary-of line. The list of exceptions would gain: "and in HeckeIdealsAndTaylorWilesRelations 10.1, which keeps its statement for every lattice, records the proof's instance in a paragraph, and is a corollary of ArithmeticGaloisDuality §D7.6a for `Σ = S`".

## C04 — Untouched text: 9.9 (a) is narrower than the theorem the change now cites for it, and no roadmap states that theorem

9.9 (a) (lines 523–528) requires `n ∈ {2, 3}` and irreducibility on every open subgroup of `G_F`. Thorne's Theorem A (Theorem 6.1, Tho22 lines 1169–1172) gives `H¹_f(F⁺, ad r) = 0` for every `n ≥ 2`, every `p` and every polarized `(π, χ)`, provided that `r|_{G_{F(ζ_{p^∞})}}` is irreducible. Irreducibility on every open subgroup implies that condition, as the route of (a) itself shows. The sentence the change adds at line 538, and the new origin label, say this much. Yet the general theorem is stated nowhere: no other README on `main` or at an open head cites arXiv 2207.04925, so the library would hold only the special cases. This is a remark for a separate pull request. That pull request would state Thorne's theorem, either as a clause of 9.9 or next to Newton–Thorne in ModularityAndLanglandsExtensions §4.1. Clauses (a)–(c) would then be read off from it, and (d) kept as the formal proof's form.

## N01 — The new origin lines cite sources by author and year, where the rest of the README uses its reference keys

Examples: "Geraghty (2019)", "Chenevier (2014)", "Wake and Wang-Erickson (2017)", "Thorne (2022)" and "Milne, *Arithmetic duality theorems*" (lines 62–63, 511, 717), instead of [Ger19], [Che14], [WWE17], [Tho22] and [Mil]. In addition, the Geraghty attribution carries no locator, and the [WWE17] entry gives no given names.

## Questions for the author

- Is the journal reference of [Tho22] (Pure and Applied Mathematics Quarterly 18 (2022), 2159–2202) correct, and does the published numbering agree with arXiv v1? I checked Theorem A = Theorem 6.1 against arXiv v1 only. arXiv records no journal reference, and a search did not confirm one.
- Which statement of Geraghty (2019) is 3.13a adapted from? The paper is paywalled and the label gives no locator.

## Verified sound

| Statement | Instances tried | This roadmap's side | Other side (source, supplier, library) | Result | Change |
|---|---|---|---|---|---|
| Headline 10.1 (b) = §D7.6a (b) (line 8) | `F = ℚ`, `p` odd, `S = {p, ∞}`, `T = ℤ_p(1)`; `p = 2`, `e` even | `Ш¹_S(ℚ, ℚ_p/ℤ_p) = 0`, so `Ш²_S(ℚ, ℤ_p(1)) = 0`; at `p = 2`, `H¹(ℝ, ℚ₂/ℤ₂(−e)) = ℤ/2` is counted | §D7.6a (b): the same pairing, with real places included; its Check gives 0 for `p = 3`, `S = {3, 61, ∞}` | agree | none |
| 10.1 Corollary-of line | clause by clause; `O`-lattice, `O/ϖ` | (a) at `Σ = S`, (b), (c); `ℤ_p`-length `f_O`, `O`-length/`e_O` = `1/e_O`, ratio `[E : ℚ_p]` | §D7.6a (a)–(c) the same; no length, no `Σ ≠ S` | covers exactly (b), (c), (a) at `Σ = S` | none |
| 10.1 method label | `T = ℤ_p(e+1)`; `p = 2` with a real place | `T^D = ℚ_p/ℤ_p(−e)`; `p^{ra}·|F| = p^{rb}·|G|` for all large `r` gives `a = b`, `|F| = |G|` | formal proof `PTShaAt`: `l ≠ 2` or no real place, so equal lengths, vanishing above `l` only | agree | none |
| 10.1 origin (Milne) | finite `M` of order a unit off `S` | Poitou–Tate for finite modules, ch. I §4 | Milne I.4.10 (a), pp. 56–57: nondegenerate `Ш¹_S(K, M) × Ш²_S(K, M^D) → ℚ/ℤ` | agree | none |
| 9.9 origin; lines 537–539 | (a) `n = 3`; `n = 4`; (b) with `F⁺ = ℚ`; (d) | Lie-irreducible: the derived group lies in the closure of `ρ(G_{F(ζ_{p^∞})})`, so `ρ` is irreducible on the tower | Tho22 Thm 6.1: `n ≥ 2`, polarized, irreducible on the tower, any `p`; with one real place the sign condition is automatic | (a)–(c) follow; (d) is a case | C04 |
| 3.13a origin (WWE17) | rank two over `ℚ`, `X_θ ≠ 0` | equality claimed with no hypothesis | Thm 4.2.8 needs `X_θ = 0`, `p ≥ 5`, `p ∤ Nφ(N)` | hypothesis dropped | C02 |
| 4.2a origin | `n = 2`, `n₁ = n₂ = 1` | composite `U₂ − Nw·U₁` divides `f = (U₁−U₂)(U₂−U₁)(U₁−Nw·U₂)(U₂−Nw·U₁)` | Tho22 Prop 3.8: `fg = gf = Res = x₁ − x₂` when `(q_v−1)π = 0`; exponent `n!` in (5.1) | adapted, not particular | C01 |
| 4.2a method: the composite divides `f` | `n = 3` | `∏_{i<i′}(U_{i′} − Nw·U_i)`: three factors, each one of the six `U_a − Nw·U_b`, `a ≠ b` | `f` contains all six | divides | none |
| 4.2a method: exponent `n!` | `Iw₁ ⊆ Iw′`, `V` irreducible | `dim V^{Iw′} ≤ dim (V_N)^{T(O)₁} ≤ n!`; a nilpotent operator on a `d`-dimensional space has `d`-th power zero | BZ77 2.12: the Jacquet module of `i_Bχ` has `n!` constituents | agree | none |
| BaseChange §16.1 contract | `L/L⁺` unramified at finite places; `n` even | the product formula at `−1` makes `[L⁺:ℚ]` even, so `≥ 2`; units are norms at inert `v`, so the standard form is quasi-split | §16.1 at the head: standard form, `[E⁺:ℚ] ≥ 2`; PAIP2 §3.1 is the same group | agree | none |
| Labels paragraph | the four sections | both labels in 3.13a, 4.2a, 9.9, 10.1 (8 of 8); three sections with parts outside the formal proof | body: 3.13a (f), 9.9 (a)–(c) and (d′), 10.1 beyond the instance | agree | none |
| 3.13a at `n = 1` against its method label | `n = 1` | `B` is the completed group ring of the ray class group, `𝕋 = B`, `J = 0` | method label: `M` free over `Λ`, points separate `𝕋` | consistent | none |
| Headlines in `Suggested.lean` | the file is unchanged | 0 declarations; the docstring names 3.13a, 4.2a, 9.9 and 10.1 (b) as not statable | `lake env lean`: no output | consistent | none |

- Source locators checked against the text: 11. These are Tho22 Theorem A/6.1, Lemma 3.7 with Proposition 3.8, and relation (5.1); WWE17 Theorem 4.2.8 and §2.1; Milne I.4.10; NT23 Theorem A, Example 2.29 and Theorem 5.2; Che14 Proposition 3.7 with Example 3.6; BZ77 2.12.
- Formal-proof files opened at the cited first commit: 2 (`Formalism/GaloisCohomology/Statement.lean` and the torsion-level counting file behind `ptShaAt`).
- Cross-roadmap ids resolved at the head: 19, all present. These are ArithmeticGaloisDuality §§R02.1.2, R02.4.2–R02.4.4, R02.5.1, D7.6 and D7.6a; BaseChange §16.1; PAIP2 §3.1; EndoscopicTransfer §§6.29, 10.18, 10.20, 10.30; SmoothRepresentations §§SR.2.2, SR.2.3, SR.3a.1; GlobalGaloisDeformations §8.5; AutomorphicLFunctions §AL.3.3.8.
- Record kept: no layer, item or heading is removed or renumbered. Four lines are rewritten, each kept and extended.
- Dependency check: `depcheck: 132 roadmaps, 1477 edges, 0 problem(s)`.
- Automatic checks: all passed; none set aside. No file changed outside the folders the pull request declares.
- Elaboration: `Suggested.lean` is unchanged and `lake env lean` gives no output. It declares nothing, so there was no `#check` comparison and no one-tactic probe to run.

Overlap check: read UniformWildKernelBounds, ModularityAndLanglandsExtensionsPartII, OrdinaryAutomorphicFormsAndModularityLiftingPartII, GSp4NonregularModularityLifting, AutomorphyLiftingBeyondTaylorWiles, PotentialAutomorphyInfrastructurePartII and BaseChangeAndGaloisRepresentationsForUnitaryGroups. Shared objects and their owners: the vanishing for enormous images, owned by ModularityAndLanglandsExtensions §4.1 (cited by this roadmap and by ModularityAndLanglandsExtensionsPartII); big ordinary Hecke algebras and Taylor–Wiles data, owned by PAIP2 Layers 3–4, with the reducible-determinant variants owned here; Galois representations of definite unitary groups, owned by BaseChange §16.1; `Ш` kernels of lattices at `Σ = S`, owned by ArithmeticGaloisDuality §D7.6a, with the extension owned by 10.1. UniformWildKernelBounds only consumes. Thorne's general theorem is owned by none of them (C04).

Source independence: 10 passages compared with 5 sources (Tho22, WWE17, Milne, Che14, and the formal proof's 10.1 files), changed passages only. The longest shared run is 6 words: a standard name, from the WWE17 abstract at lines 10–11. The largest share of locators belongs to [FormalProof], about 67 of 77, a Lean repository compared only through the two 10.1 files. Contents were not compared: no layer was added, removed or reordered.

Research link: 9.9 is a case of Thorne (2022) Theorem A and uses Newton–Thorne (2023) Theorem A. Layers 3–4 adapt Geraghty (2019), Wake–Wang-Erickson (2017) and Thorne (2022) §§3, 5 to a reducible residual determinant. 10.1 extends Poitou–Tate duality (Milne, ADT I.4.10). This rests on the README's sources and the texts I read.

## Not verifiable

- Geraghty (2019), Math. Ann.: paywalled; the sources service found no open copy, and the origin label of 3.13a gives no locator.
- The journal details of [Tho22]: arXiv v1 carries no journal reference, and a search did not confirm them.
- The method labels of 3.13a, 4.2a and 9.9 against [FormalProof]: not read. Only the two files behind 10.1 were opened.

## Source issues

- none

## For the human reviewers

- Decisions: neither concerns this folder, since nothing leaves it. 10.1 stays and cites ArithmeticGaloisDuality §D7.6a, which states 10.1 (a)–(c) for `Σ = S`, as its Corollary-of line says.
- Not tested: [FormalProof], a Lean repository, carries about 67 of the README's 77 locators. The method labels of 3.13a, 4.2a and 9.9 were not compared with it. The two files behind 10.1's label were compared, and they agree.
- Labels: of the four origin labels sampled, the one on 4.2a calls "particular to this proof" constructions that Thorne (2022) §§3, 5 publishes (C01). The description's count of 257 such labels was not otherwise sampled.
- 10.1 keeps, next to its Corollary-of line, a route for (a)–(c) that follows ArithmeticGaloisDuality §D7.6a's proof sketch almost step for step. The family's convention on second routes allows this.
